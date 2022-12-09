FROM	ubuntu:latest as base

RUN	apt -y update && apt -y upgrade

FROM	base as aptupdated

RUN	apt -y install python3-pip && \
	pip3 install -U \
		pip  \
		setuptools \
		wheel && \
#	pip3 install pip-tools==6.10.0 && \
	pip3 install pipenv==2022.11.25
#	pipenv install IntuneCD

FROM	aptupdated as pipenvready

WORKDIR	/app

COPY	./Pipfile /app
COPY	./Pipfile.lock /app

RUN	cd /app && \
	pipenv install

FROM	pipenvready as application

WORKDIR	/app

COPY	./entrypoint.sh /app/entrypoint.sh
RUN	chmod +x /app/entrypoint.sh

FROM	application as final

ENV	PYTHONUNBUFFERED=0

ENTRYPOINT	["/app/entrypoint.sh"]
CMD	["-h"]
