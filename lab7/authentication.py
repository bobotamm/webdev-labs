from urllib import response
from flask import (
    request, make_response, render_template, redirect
)
from models import User
import flask_jwt_extended

def logout():
    # hint:  https://dev.to/totally_chase/python-using-jwt-in-cookies-with-a-flask-app-and-restful-api-2p75
    return 'Implement Logout functionality'

def login():
    if request.method == 'POST':

        username = request.form.get('username')
        password = request.form.get('password')
        
        # check if both username and password exist 
        if not username:
            return render_template(
                'login.html', message='Missing username'
            )

        if not password:
            return render_template(
                'login.html', message='Missing password'
            )

        # proceed w/database check...
        user = User.query.filter_by(username=username).one_or_none()
        if user:
            if user.check_password(password):
                print('user authenticated')

                # Set the JWT cookies in the response header
                # before returning it to user 
                # encoding the user's ID in the JWT
                access_token = flask_jwt_extended.create_access_token(identity=user.id)
                response = make_response(redirect('/'))
                flask_jwt_extended.set_access_cookies(response, access_token)
                return response

                # refresh_token = flask_jwt_extended.create_refresh_token(identity=username)
                # set_refresh_cookies(resp, refresh_token)

            else:
                return render_template(
                'login.html', message='Bad password'
                )

        # authenticate user here. If the user sent valid credentials, set the
        # JWT cookies:
        # https://flask-jwt-extended.readthedocs.io/en/3.0.0_release/tokens_in_cookies/
        else:
            return render_template(
                'login.html', 
                message='Invalid username(not in database)'
            )

    else:
        return render_template(
            'login.html'
        )

def initialize_routes(app):
    app.add_url_rule('/login', 
        view_func=login, methods=['GET', 'POST'])
    app.add_url_rule('/logout', view_func=logout)