FROM python:3.7-slim-buster
WORKDIR /opt/todo
ENV FLASK_DEBUG 1
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apt-get update
RUN apt-get install -y build-essential
COPY pyproject.toml ./
COPY poetry.lock ./
RUN python -m pip install poetry
RUN  poetry install
CMD ["poetry", "run", "flask", "run"]