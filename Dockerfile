#FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1

FROM python:3.8
ENV DASH_DEBUG_MODE True

COPY ./data/ /data/
COPY ./img/ /img/
COPY ./logos/ /logos/
COPY ./app.py /app.py
COPY ./requirements.txt /requirements.txt
COPY ./sentiment_prediction.py /sentiment_prediction.py
COPY ./content.py /content.py
COPY ./callbacks.py /callbacks.py
COPY ./globals.py /globals.py
COPY ./data.py /data.py


WORKDIR /

RUN set -ex && \
    pip install -r requirements.txt
EXPOSE 8080
CMD ["python", "app.py"]