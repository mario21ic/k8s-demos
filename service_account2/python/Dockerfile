FROM python:3.7-alpine

ADD requeriments.txt /tmp/
RUN pip install -r /tmp/requeriments.txt

COPY main.py /main.py

CMD /main.py
