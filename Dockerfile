FROM python:3.8

WORKDIR /flask-app

COPY . .

RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    pip install flask

EXPOSE 5000

CMD ["python", "app.py"]
