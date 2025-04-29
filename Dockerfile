FROM python:3.9-slim
WORKDIR /app

COPY requirements.txt /app
COPY cool_counters


RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirments.txt && \
    python3 manage.py migrate && \
    cd cool_counters


ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:9000"]

