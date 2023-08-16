FROM python:3.8-alpine

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
