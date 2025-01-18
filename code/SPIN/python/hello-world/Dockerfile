FROM python:latest

WORKDIR /usr/src/python_mock/
RUN pip install componentize-py
RUN curl -fsOL https://github.com/fermyon/spin/releases/download/v3.1.2/spin-v3.1.2-linux-amd64.tar.gz 
RUN tar xfv spin-v3.1.2-linux-amd64.tar.gz
COPY ./src/ .
COPY ./spin.toml .
CMD "./spin" "build"
CMD "./spin" "up"
