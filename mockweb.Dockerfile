# syntax=docker/dockerfile:1@sha256:ecfaec9ed6d810b56388c508f4121597bfbba70d41a6dfeee4d8cad5f295fc32
FROM python:3.13.2-slim@sha256:83509a63d2c432e365bdc7a015948a77952a23d7784a632ba741baf3ba1862cb

RUN useradd --create-home appuser --no-log-init

USER appuser

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-warn-script-location
COPY . .
COPY --from=server /test/resources/esri /server/test/resources/esri

EXPOSE 8000

CMD ["python", "app.py"]
