# You can test data collection by calling Curl on the website or via browser

import flask
import pandas as pd

from flask import request, jsonify
app = flask.Flask(__name__)
app.config["DEBUG"] = True

# We create a dictionary (similar to a JSON) which contains data that our app will use
# Below is an example of the format of a python Dictionary/JSON
'''
[
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
'''
@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to StarterHacks!</h1><p>This is an example web API</p>"

@app.route('/starSigns/all', methods=['GET'])
def api_all():
    return jsonify(fetch_people())

@app.route('/starSigns', methods=['GET'])
def api_id():
    fetch_people()
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

def fetch_people(query=''):
    # Here query is unimplemented, but ideally you would search for particular groups of people you are interested in
    df = pd.read_csv('data.csv')
    results = []
    for index, row in df.iterrows():
        results.append({'id': index,
                        'name': row['name'],
                        'alignment': row['alignment'],
                        'star_sign': row['star_sign'], 
                        'health_data': row['health_data']
                       })
    
    star_signs = {"results":results, "no_results": len(results)}
    return star_signs
# to run on localhost (that is only on this machine) do not include the host value
# or set host to 127.0.0.1
# 0.0.0.0 is the ip of the current machine on the local area network
app.run(host='0.0.0.0')


