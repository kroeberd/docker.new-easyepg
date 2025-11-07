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

# Repo reinziehen (kroeberd Fork)
RUN git clone https://github.com/kroeberd/docker.new-easyepg.git . 

# Standard-Volume-Verzeichnisse für Daten & XML-Ausgabe
RUN mkdir -p /easyepg/xml

# Port
EXPOSE 4000

# Startscript
CMD ["bash", "easyepg.sh"]
