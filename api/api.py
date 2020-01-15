import flask
from flask import request, jsonify
app = flask.Flask(__name__)
app.config["DEBUG"] = True

# We create a dictionary (similar to a JSON) which contains data that our app will use

# You can test data collection by calling Curl on the website

star_signs = [
    {'id':0,
     'name': 'Vriska Serket',
     'alignment': 'Chaotic Good',
     'star_sign': 'Scorpio'
    },
    {'id':1,
     'name': 'Karkat Vantas',
     'alignment': 'Lawful Good',
     'star_sign': 'Cancer' 
    },
    {'id':2,
     'name': 'Nepeta Leijon',
     'alignment': 'Chaotic Cat',
     'star_sign': 'Leo'
    }

]

@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to StarterHacks!</h1><p>This is an example web API</p>"

@app.route('/api/v1/star_signs/all', methods=['GET'])
def api_all():
    return jsonify(star_signs)

@app.route('/api/v1/star_signs', methods=['GET'])
def api_id():
    # Check if id was provided with URL

    if 'id' in request.args:
        id = int(request.args['id'])
    else:
        return "Error: No id field provided. Please specify an id"
  
    # Create empty list for our results
    results = []
    
    # Interate through our list of items and return the right character
    for person in star_signs:
        if person['id'] == id:
            results.append(person)
    return jsonify(results)


app.run()


