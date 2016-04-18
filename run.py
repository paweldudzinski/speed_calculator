import json
from bottle import route, run, template, static_file, request
from calculator import SpeedCalculator

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='static')

@route('/')
def index():
    return template('index.tpl')
    
@route('/calculate', method="POST")
def calculate():
    distance = request.params.get('distance')
    hours = request.params.get('hours')
    minutes = request.params.get('minutes')
    seconds = request.params.get('seconds')
    c = SpeedCalculator(int(distance), (int(hours), int(minutes), int(seconds)))
    
    pace_core = str(c.pace()).split('.')[0]
    m, s = pace_core.split(':')[1:3]
    
    return json.dumps({
        'pace': '%s:%s' % (m, s),
        'speed': '%.2f' % (c.speed())
    })

run(host='localhost', port=8080, debug=True)