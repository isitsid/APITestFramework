from behave import *
import requests
import logging

base_url = "http://api.openweathermap.org/data/2.5/"
api_key = "###API_KEY###"


@given(u'I have entered "{endpoint}" as endpoint')
def enter_endpoint(context, endpoint):
    context.url = str(endpoint)
    context.api_key = api_key


@given(u'I have also entered {city} in the cityname')
def enter_city_name(context, city):
    context.city = city


@when(u'I call API')
def press_fetch(context):
    r = call_api(context.url, context.city, context.api_key)
    print(r.status_code)
    print(r.content)
    context.result = r.status_code
    context.content = r.content


@when(u'I call API with the {key}')
def press_fetch(context, key):
    context.api_key = key
    r = call_api(context.url, context.city, context.api_key)
    context.result = r.status_code
    context.content = r.content


@then(u'the response should be {result:d}')
def check_result(context, result):
    assert context.result == result
    print("Expected result", result)
    print("Actual result", context.result)


@then(u'the response should contain {response_text}')
def check_result(context, response_text):
    assert response_text in str(context.content)


def call_api(endpoint, city, key):
    url = base_url + endpoint
    logging.info("url called : " + url)
    return requests.get(url + "?q=" + city + "&APPID=" + key)
