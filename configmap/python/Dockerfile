FROM python:3.7-alpine

ADD requeriments.txt /tmp/
RUN pip install -r /tmp/requeriments.txt

COPY app.py /app.py

ENV MY_KEY="Hello from Dockerfile"
ENV foo="AulaUtil"

CMD /app.py
