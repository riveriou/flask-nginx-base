from flask import Flask

app = Flask(__name__)				# initialize app


@app.route("/")						# root of app
def hello():						# grab all users from 'users' and list them...

  return 'Hello World !!!'

if __name__ == "__main__":			# run test server at localhost:8080 (127.0.0.1:8080)
	app.run(host='0.0.0.0', port=5000, debug=True)
