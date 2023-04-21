FROM --platform=linux/amd64 debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    screen \
    curl \
    ufw \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN useradd -s /bin/bash -U -m rexuiz

# Install Rexuiz
RUN su rexuiz -c 'curl https://raw.githubusercontent.com/kasymovga/rexuiz/master/scripts/update.sh --output /home/rexuiz/rexuiz_install.sh'
RUN su rexuiz -c 'bash /home/rexuiz/rexuiz_install.sh /home/rexuiz/Rexuiz/'
RUN su rexuiz -c 'chmod 755 /home/rexuiz/Rexuiz/server/rexuiz-linux-dedicated-x86_64'

# Copy run script
COPY run-rexuiz.sh /usr/local/bin/run-rexuiz.sh
RUN chmod +x /usr/local/bin/run-rexuiz.sh

# Expose server port
EXPOSE 26000/udp

# Start server with run script
CMD ["/usr/local/bin/run-rexuiz.sh"]
