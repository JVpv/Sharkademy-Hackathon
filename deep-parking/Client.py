import requests

url = '10.0.0.212:5001'  # Flask API endpoint
json_data = {
    'key1': 'value1',
    'key2': 'value2'
}  # JSON payload

response = requests.post(url, json=json_data)  # Send POST request
if response.status_code == 200:
    print('JSON data sent successfully!')
else:
    print('Failed to send JSON data:', response.status_code)