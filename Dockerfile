FROM ubuntu:latest

RUN apt-get update && apt-get install \
 -y python3 python3-pip postgresql-client libpq-dev

RUN pip3 install pipenv
WORKDIR /app

COPY Pipfile Pipfile.lock ./
RUN pipenv update
RUN pipenv install --system --deploy

COPY todo todo
COPY init.sh ./

CMD ["./init.sh"]
