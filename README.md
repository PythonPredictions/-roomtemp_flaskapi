# Room Temperature Flask REST API
Based on [this](https://github.com/tecladocode/rooms-temp-rest-api) repository.

## Introduction

This repository contains a REST API application that connects to a PostgreSQL database. It also contains the Dockerfile to run the application in a container.

The REST API application is intended to help you store home automation data. Specifically, the temperature of different rooms in your house. With each request, clients can store data to or retrieve data from the database.


## Local run

Edit the `DATABASE_URL` variable in the `.env` file so that it points to your PostgreSQL database.

Create a Python virtual environment:

```
python3.10 -m venv .venv
```

Activate the virtual environment and install the dependencies using `pip`:

```
source .venv/bin/activate  # different on Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

Run the app:

```
flask run
```

Navigate to http://localhost:5000/ to view the hello world sanity check.


## Containerized run

Edit the `DATABASE_URL` variable in the `.env` file so that it points to your PostgreSQL database.

Build the Dockerfile:

```
docker build . -t roomtemp
```

Run the docker image:

```
docker run -p 5000:5000 roomtemp
```

Navigate to http://localhost:5000/ to view the hello world sanity check.

## Example API calls

To add a room to the database:
```
curl -X POST http://localhost:5000/api/room -H "Content-Type: application/json" -d "{\"name\": \"test room\"}"
```

To get the average temperature of the room with id 3 since its creation:
```
curl http://localhost:5000/api/room/3
```
