import json
from bottle import route, run, template, static_file, request
from calculator import SpeedCalculator


def _split_pace(pace):
    pace_core = str(pace).split('.')[0]
    m, s = pace_core.split(':')[1:3]
    return '%s:%s' % (m, s)


@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='static')


@route('/')
def index():
    return template('index.tpl')


@route('/calculate_run', method="POST")
def calculate_run():
    distance = request.params.get('distance')
    hours = request.params.get('hours')
    minutes = request.params.get('minutes')
    seconds = request.params.get('seconds')
    c = SpeedCalculator(
        int(distance), (int(hours), int(minutes), int(seconds)))

    return json.dumps({
        'pace': _split_pace(c.pace()),
        'dpace': _split_pace(c.five_k_pace()),
        'speed': '%.2f' % (c.speed())
    })


@route('/calculate_bike', method="POST")
def calculate_bike():
    distance = request.params.get('distance')
    hours = request.params.get('hours')
    minutes = request.params.get('minutes')
    seconds = request.params.get('seconds')
    c = SpeedCalculator(
        int(distance), (int(hours), int(minutes), int(seconds)))

    return json.dumps({
        'pace': _split_pace(c.pace()),
        'dpace': _split_pace(c.ten_k_pace()),
        'speed': '%.2f' % (c.speed())
    })


@route('/calculate_swim', method="POST")
def calculate_swim():
    distance = request.params.get('distance')
    hours = request.params.get('hours')
    minutes = request.params.get('minutes')
    seconds = request.params.get('seconds')

    c = SpeedCalculator(
        int(distance), (int(hours), int(minutes), int(seconds)))

    return json.dumps({
        'pace': _split_pace(c.pace()),
        'speed': '%.2f' % (c.speed()),
        'qpace': _split_pace(c.querter_km_pace()),
        'hpace': _split_pace(c.hundred_m_pace()),
        'fpace': _split_pace(c.fifty_m_pace()),
        'speed': '%.2f' % (c.speed())
    })

run(host='0.0.0.', port=5070, debug=True)
