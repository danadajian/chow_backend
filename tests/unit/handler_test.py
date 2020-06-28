from src.handler import my_handler


def test_handler():
    event = {'first_name': 'Joe', 'last_name': 'Schmo'}
    assert my_handler(event, None) == {
        'message': 'Hello Joe Schmo!'
    }
