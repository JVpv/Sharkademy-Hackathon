from pymongo import MongoClient

# Replace the URI with your MongoDB Atlas connection string
client = MongoClient('mongodb+srv://itsfloppyhat:shamu2024@sharknadoisagoodmovie.05skn.mongodb.net/?retryWrites=true&w=majority&appName=SharknadoIsAGoodMovie')

# Access the database
db = client['SharknadoIsAGoodMovie']

# Access a collection within the database
collection = db['stops']
