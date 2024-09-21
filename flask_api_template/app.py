import random
from flask import Flask, jsonify

app = Flask(__name__)

# Dictionary holding the availability of each spot
parking_spots = {
    "spot001": True,
    "spot002": False,
    "spot003": True,
    "spot004": False,
    "spot005": True,
    "spot006": True,
}

# Function to randomize the availability of each parking spot
def randomize_availability():
    global parking_spots
    for spot in parking_spots:
        parking_spots[spot] = random.choice([True, False])

# Define the endpoint that returns the availability of all parking spots
@app.route('/available', methods=['GET'])
def get_all_availability():
    # Randomize the availability before returning it
    randomize_availability()
    # Return the availability of all spots as a JSON Object
    return jsonify(parking_spots)

# Start the Flask Server
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
