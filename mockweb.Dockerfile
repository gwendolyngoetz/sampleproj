# syntax=docker/dockerfile:1@sha256:4c68376a702446fc3c79af22de146a148bc3367e73c25a5803d453b6b3f722fb
FROM python:3.13.5-slim@sha256:f2fdaec50160418e0c2867ba3e254755edd067171725886d5d303fd7057bbf81

RUN useradd --create-home appuser --no-log-init

USER appuser

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-warn-script-location
COPY . .
COPY --from=server /test/resources/esri /server/test/resources/esri

EXPOSE 8000

CMD ["python", "app.py"]
