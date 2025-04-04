FROM python:3.12.9-slim-bookworm

ENV HOME=/opt
ENV AIRFLOW_HOME=/opt/airflow

ENV PATH="$AIRFLOW_HOME/.local/bin:$HOME/.local/bin:$PATH"

WORKDIR $AIRFLOW_HOME

RUN groupadd --system airflow \
    && useradd --system --gid airflow --create-home --home-dir $AIRFLOW_HOME airflow

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf ~/.cache/pip

RUN mkdir -p /opt/airflow/logs \
    /opt/airflow/dags \
    /opt/airflow/plugins

RUN chown -R airflow:airflow /opt/airflow \
    && chmod -R 777 /opt/airflow

USER airflow

EXPOSE 8080 5432 3000 9090 5005

CMD [ "airflow", "version" ]
