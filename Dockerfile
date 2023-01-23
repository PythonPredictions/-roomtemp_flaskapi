FROM python:3.10

WORKDIR /app

COPY .env .
COPY .flaskenv .
COPY app.py .
COPY requirements.txt .
RUN pip3 install -r requirements.txt

CMD ["flask", "run","--host=0.0.0.0"]