# app

## Install the python requirements
```bash
python3 -m pip install -r requirements.txt
```

## Run the webservice locally
```bash
python3 app.py
```

## Run the webservice with Docker
```bash
docker buildx build . -t app
```
```bash
docker run -it -p <PORT>:80 app
```

## Access the webservice

The app is available at http://localhost
