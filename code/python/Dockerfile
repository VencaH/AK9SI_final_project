FROM --platform=linux/arm64/v8 python:latest

WORKDIR /usr/src/python_mock
RUN pip install fastapi[standard] 
COPY ./src/ .
CMD ["fastapi", "run", "main.py"]

