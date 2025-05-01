FROM telegraf:1.34.0

RUN echo "deb http://ftp.us.debian.org/debian stable main non-free" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends iputils-ping snmp procps snmp-mibs-downloader unzip && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O synology_mib.zip https://global.download.synology.com/download/Document/Software/DeveloperGuide/Firmware/DSM/All/enu/Synology_MIB_File.zip && \
    unzip synology_mib.zip -d synology_mib && \
    mv synology_mib/Synology_MIB_File/* /usr/share/snmp/mibs/
