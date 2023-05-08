# Use Python 3.9 image
FROM python:3.9

# Define docker address for predictor service
ENV MODEL_SERVICE_HOST="http://172.20.0.2:8080/predict"

# Define work dir
WORKDIR /root

# Copy necessary files to work dir
COPY requirements.txt .
COPY static ./static
COPY templates ./templates
COPY app.py .

# Install python dependencies
RUN pip install -r requirements.txt

# Expose port to outside world
EXPOSE 8081

# Launch web service
ENTRYPOINT ["python"]
CMD ["app.py"]
