FROM python:stretch

COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y python3-pip
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install --upgrade pip
#RUN pip install flask

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
#ENTRYPOINT [“python”, “app.py”]