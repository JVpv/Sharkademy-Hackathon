//
//  LocationMapView.swift
//  Sharkademy
//
//  Created by Matthew Lucas on 9/20/24.
//


import SwiftUI
import MapKit


extension CLLocationCoordinate2D {
    static var spot001: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.11953, longitude: -80.13857)
    }
    static var spot002: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.11956, longitude: -80.13857)
    }
    static var spot003: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.11960, longitude: -80.13857)
    }
    static var spot004: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.11964, longitude: -80.13857)
    }
    static var spot005: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.11967, longitude: -80.13857)
    }
    static var spot006: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 26.12019, longitude: -80.13858)
    }
}

struct LocationMapView: View {
    @State private var selectedSpot: Spot?
    @State private var spot1 = Spot(name: "001", available: true, latitude: 26.11953, longitude: -80.13857)
    @State private var spot2 = Spot(name: "002", available: false, latitude: 26.11956, longitude: -80.13857)
    @State private var spot3 = Spot(name: "003", available: false, latitude: 26.11960, longitude: -80.13857)
    @State private var spot4 = Spot(name: "004", available: true, latitude: 26.11964, longitude: -80.13857)
    @State private var spot5 = Spot(name: "005", available: false, latitude: 26.11967, longitude: -80.13857)
    @State private var spot6 = Spot(name: "006", available: false, latitude: 26.12019, longitude: -80.13858)
    

    @ObservedObject private var stopsManager = StopsManager()
    
    var body: some View {
        VStack {
            Map {
                Annotation("001", coordinate: .spot001) {
                    if spot1.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                    
                            .onTapGesture {
                                selectedSpot = spot1
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot1
                            }
                    }
                }
                Annotation(String(spot2.available), coordinate: .spot002) {
                    if spot2.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                    
                            .onTapGesture {
                                selectedSpot = spot2
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot2
                            }
                    }
                }
                Annotation("003", coordinate: .spot003) {
                    if spot3.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                    
                            .onTapGesture {
                                selectedSpot = spot3
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot3
                            }
                    }
                }
                Annotation("004", coordinate: .spot004) {
                    if spot4.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                    
                            .onTapGesture {
                                selectedSpot = spot4
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot4
                            }
                    }
                }
                Annotation("005", coordinate: .spot005) {
                    if spot5.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot5
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot5
                            }
                    }
                }
                Annotation("006", coordinate: .spot006) {
                    if spot6.available == true {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.green)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                    
                            .onTapGesture {
                                selectedSpot = spot6
                            }
                    } else {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 14, height: 14)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedSpot = spot6
                            }
                    }
                }
            }
            
            .sheet(item: $selectedSpot) { annotation in
                VStack {
                    Text("Spot: \(annotation.name)")
                        .font(.headline)
                    Button(action: {
                        openMap(annotation)
                    }) {
                        Text("Open in Apple Maps")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Button("Dismiss") {
                        selectedSpot = nil
                    }
                    
                }
                .padding()
            }
        }
        
    }
    func openMap(_ spot: Spot) {
        let url = URL(string: "http://maps.apple.com/?daddr=\(spot.latitude),\(spot.longitude)&dirflg=d")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
    #Preview {
        LocationMapView()
    }
    
    struct ExtractedViewAvailable: View {
        var body: some View {
            Image(systemName: "star.circle")
                .resizable()
                .foregroundStyle(.green)
                .frame(width: 14, height: 14)
                .background(.white)
                .clipShape(.circle)
        }
    }
    
    struct ExtractedViewUnavailable: View {
        var body: some View {
            Image(systemName: "star.circle")
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 14, height: 14)
                .background(.white)
                .clipShape(.circle)
        }
    }
