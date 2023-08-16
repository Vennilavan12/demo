FROM python:3.8-alpine

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN py -m pip install --upgrade pip

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
