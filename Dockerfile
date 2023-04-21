FROM --platform=linux/amd64 debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    screen \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN useradd -s /bin/bash -U -m rexuiz

# Install Rexuiz
RUN su rexuiz -c 'curl https://raw.githubusercontent.com/kasymovga/rexuiz/master/scripts/update.sh --output /home/rexuiz/rexuiz_install.sh'
RUN su rexuiz -c 'bash /home/rexuiz/rexuiz_install.sh /home/rexuiz/Rexuiz/'
RUN su rexuiz -c 'chmod 755 /home/rexuiz/Rexuiz/server/rexuiz-linux-dedicated-x86_64'

# Expose server port
EXPOSE 26000/udp

# Start server
CMD ["su", "rexuiz", "-c", "/home/rexuiz/Rexuiz/server/rexuiz-linux-dedicated-x86_64"]
