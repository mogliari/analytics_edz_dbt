FROM ubuntu:20.04
RUN apt-get update && apt-get install -y git && apt-get install -y python3.8
RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt install python3-dev libpq-dev
RUN pip3 install --upgrade pip setuptools
RUN pip3 install dbt-postgres dbt-redshift
RUN pip3 install --upgrade dbt-postgres dbt-redshift
WORKDIR /dbt