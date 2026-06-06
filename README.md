# pteordactyl-laravel-frankenphp
Dockerfile and Egg to run FrankenPHP inside a Pterodactyl server.

This repository provides what is needed to run FrankenPHP as part of a Pterodactyl server, useful for hosting Laravel Octane applications.

## Repository contents

- `Dockerfile` — Image with FrankenPHP and required scripts.
- `entrypoint.sh` — Startup script.
- `egg-franken-p-h-p.json` — Egg to use in Pterodactyl.

## TODO

- logrotate.d — Log rotation configuration.

## Features

- FrankenPHP integration directly from a Pterodactyl-managed server.
- Automatic Composer installations when starting your server.
- Integrated `trusted_proxies`.
- FrankenPHP version: `1.12.4`.
- Caddy version: `2.11.4`.
- PHP versions: `8.5.7, 8.4.22, 8.3.31`.

## Requirements

- Pterodactyl installed.

## Installation

- Upload `egg-nginx--p-h-p--f-p-m.json` to your Pterodactyl panel.
- Upload the file  
  [pterodactyl-nginx](https://github.com/Sinaloense/pterodactyl-nginx/blob/main/logrotate.d/pterodactyl-nginx)  
  to the `/etc/logrotate.d/` directory on your main host.
- Upload the file  
  [pterodactyl-phpfpm](https://github.com/Sinaloense/pterodactyl-phpfpm/blob/main/logrotate.d/pterodactyl-phpfpm)  
  to the `/etc/logrotate.d/` directory on your main host.

## Recommended to be used together with

- [Pterodactyl Cloudflared.](https://github.com/Sinaloense/pterodactyl-cloudflared)
