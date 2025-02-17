FROM python:3.11

ENV DockerHOME=/app/
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


RUN mkdir -p $DockerHOME


WORKDIR $DockerHOME




RUN pip install --upgrade pip

COPY . $DockerHOME
RUN pip install -r requirements.txt
RUN chmod +x run_server.sh
RUN useradd -m appuser
USER appuser
CMD ["./run_server.sh"]