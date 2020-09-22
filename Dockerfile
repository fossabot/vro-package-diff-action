FROM python:3.8.1-alpine
LABEL "maintainer" = "Ludovic Rivallain <ludovic.rivallain@gmail.com>"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN apk add --no-cache git
RUN chmod +x /entrypoint.sh
RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]