FROM python:3.7

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN set

# Copies the files from your action repository to the filesystem of the container.
COPY src /opt/src

# Executes `entrypoint.sh` when the Docker container starts up.
ENTRYPOINT ["/opt/src/fx-data-convert.py"]
