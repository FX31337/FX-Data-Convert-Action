FROM python:3.7

ARG INPUT_INPUTFILE
ENV INPUT_INPUTFILE csv

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /opt/src

RUN set

# Copies the files from your action repository to the filesystem of the container.
COPY entrypoint.sh /entrypoint.sh
COPY src /opt/src

# Executes `entrypoint.sh` when the Docker container starts up.
ENTRYPOINT ["/entrypoint.sh"]
