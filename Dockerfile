FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev libpq-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

RUN mkdir -p /usr/var/app-instance

COPY config.py /usr/var/app-instance/config.py
# Expose the Flask port
EXPOSE 5000


CMD [ "python", "run.py" ]