# Basic Rexuiz dockerized server

This is an unofficial dockerized version of Rexuiz server.


### How to run

1. `make`
2. `make run`

### Whitelisting

Optionally you can enable whitelisting IPs to only allow certain IPs to join in.
To enable this set the `WHITELIST_ENABLED` to `true` and make sure the container runs as privileged.
When you've done this you can add IPv4 addresses to config/allowed_ips.txt 1 per line.