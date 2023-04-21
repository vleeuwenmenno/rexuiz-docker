#!/bin/bash

if [ "$WHITELIST_ENABLED" = "true" ]; then
    # Load in allowed IPs from file
    mapfile -t allowed_ips < /home/rexuiz/.rexuiz/data/allowed_ips.txt

    # Enable UFW firewall
    ufw --force reset
    ufw default deny incoming
    ufw default allow outgoing

    # Allow specified IPs
    for ip in "${allowed_ips[@]}"
    do
        ufw allow from "$ip" to any port 26000 proto udp
    done

    ufw --force enable
fi

# Start server
su rexuiz -c "/home/rexuiz/Rexuiz/server/rexuiz-linux-dedicated-x86_64"
