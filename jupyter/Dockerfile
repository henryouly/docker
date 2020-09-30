ARG BASEIMAGE=python:3.7
FROM ${BASEIMAGE} AS builder

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --user \
        --no-binary=numpy \
	--no-warn-script-location \
        --progress-bar=pretty \
	--extra-index-url=https://www.piwheels.org/simple \
	-r requirements.txt

FROM ${BASEIMAGE}-slim
COPY --from=builder /root/.local /root/.local

RUN apt-get update && apt-get install -y \
    libfreetype6 \
    libatlas3-base \
    libgomp1 \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /srv
ENV PATH="/root/.local/bin:${PATH}"
CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --notebook-dir=/srv/notebook --NotebookApp.token= --NotebookApp.allow_origin='*'
EXPOSE 8888
