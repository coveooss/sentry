FROM sentry:9.0.0

RUN apt update && apt upgrade -y

RUN apt install -y \
  libldap2-dev \
  libsasl2-dev \
  && rm -rf /var/lib/apt/lists/*

ADD requirements.txt .
RUN pip install -r requirements.txt

RUN rm -rf requirements.txt
RUN apt-get purge -y --auto-remove gcc libldap2-dev libsasl2-dev
