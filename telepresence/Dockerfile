FROM python:3-alpine
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt
COPY server.py /app/server.py
CMD ["python", "/app/server.py"]
