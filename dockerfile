FROM debian:stable-slim

# Pakete installieren
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3 \
    bash \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /easyepg

# Repo klonen
RUN git clone https://github.com/kroeberd/docker.new-easyepg.git . 

# Daten-Ordner erstellen
RUN mkdir -p /easyepg/xml

# Port
EXPOSE 4000

# Startkommando korrigiert
CMD ["bash", "run.sh"]
