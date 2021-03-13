# Build and run this Containerfile with tools like docker or podman. For
# example:
#
# $ podman build -f Containerfile -t gyb .
#
# Then run the container with gyb's arguments as normal. Mount in a local
# directory for storing email, and optionally mount in a directory that has
# config files such as oauth2service.json and client_secrets.json. For example:
#
# $ podman run --rm -it -v /tmp/email/:/email/ -v /tmp/gyb-config/:/etc/gyb/ gyb --action backup --service-account --email youremail@yourdomain.com --local-folder /email/

FROM docker.io/fedora:latest

RUN dnf install -y python-pip && dnf clean all

RUN mkdir /gyb

COPY requirements.txt *.py /gyb/

WORKDIR /gyb/

RUN pip install -r requirements.txt

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
