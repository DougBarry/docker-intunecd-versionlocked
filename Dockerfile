FROM ubuntu:latest as base

RUN	apt-get update -y && apt-get upgrade -y

FROM base as aptupdated

RUN	apt-get install -y python3-pip

FROM aptupdated as pipready

WORKDIR	/app

COPY ./requirements.txt /app

RUN	cd /app && \
	pip install --require-hashes --no-deps --prefer-binary -r requirements.txt

FROM pipready as application

WORKDIR	/app

COPY ./entrypoint.sh /app/entrypoint.sh

FROM application as final

ENV	PYTHONUNBUFFERED=0

ENTRYPOINT	["/app/entrypoint.sh"]
CMD	["-h"]
