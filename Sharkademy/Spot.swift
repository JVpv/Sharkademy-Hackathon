import Foundation
import CoreLocation

class Spot: ObservableObject, Identifiable {
    var name: String
    @Published var available: Bool
    var latitude: Double
    var longitude: Double
    
    init(name: String, available: Bool, latitude: Double, longitude: Double) {
        self.name = name
        self.available = available
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // Function to update availability based on API response
    func updateAvailability(availabilityStatus: Bool) {
        print("I actually ran!")
        DispatchQueue.main.async {
            self.available = availabilityStatus
        }
    }
}

class StopsManager: ObservableObject {
    @Published var spots: [Spot] = []
    
    init() {
        // Define spot information (name and coordinates)
        let spotInfo = [
            ("spot001", CLLocationCoordinate2D.spot001),
            ("spot002", CLLocationCoordinate2D.spot002),
            ("spot003", CLLocationCoordinate2D.spot003),
            ("spot004", CLLocationCoordinate2D.spot004),
            ("spot005", CLLocationCoordinate2D.spot005),
            ("spot006", CLLocationCoordinate2D.spot006)
        ]
        
        // Initialize each spot with default availability set to true
        for (spotName, coordinates) in spotInfo {
            let spot = Spot(name: spotName, available: true, latitude: coordinates.latitude, longitude: coordinates.longitude)
            self.spots.append(spot)  // Append to the spots array
        }
    }
    
    // Function to fetch availability status for all spots
    func fetchAvailability() {
        print("I ran!")
        let urlString = "http://10.0.0.212:5001/available"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Bool] {
                        // Update each Spot instance based on the response
                        DispatchQueue.main.async {
                            for spot in self.spots {
                                if let availabilityStatus = json[spot.name] {
                                    spot.updateAvailability(availabilityStatus: availabilityStatus)
                                }
                            }
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
            
            if let error = error {
                print("Error fetching availability: \(error)")
            }
        }.resume()
    }
}
