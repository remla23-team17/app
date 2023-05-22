# Use Python 3.9 image
FROM python:3.9

LABEL "maintainer"="remla23-team17"

USER root

# Define docker address for predictor service
ENV MODEL_SERVICE_HOST="http://172.20.0.2/predict"
ENV EXPOSE_PORT=80

EXPOSE $EXPOSE_PORT

WORKDIR /root

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY static ./static
COPY templates ./templates
COPY app.py .

# Launch web service
ENTRYPOINT ["python"]
CMD ["app.py"]
