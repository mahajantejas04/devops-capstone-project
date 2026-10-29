
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd --uid 1000 theia && chown -R theia /app

USER theia

EXPOSE 8080

CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
