# pteordactyl-laravel-frankenphp
Dockerfile y Egg para correr FrankenPHP dentro de un servidor Pterodactyl.

Este repositorio provee lo necesario para correr FrankenPHP como parte de un servidor Pterodactyl, útil para alojar aplicaciones Laravel Octane.

## Contenido del repositorio:

- Dockerfile — Imagen con FrankenPHP y scripts necesarios.
- entrypoint.sh — Script de arranque.
- egg-franken-p-h-p.json — Egg para usar en Pterodactyl.

## TODO:
- logrotate.d — Configuración de rotación de logs.

## Características

- Integración de FrankenPHP directamente desde un servidor administrado por Pterodactyl.
- Instalaciones Composer automaticas al momento de iniciar tu servidor.
- trusted_proxies integrado.
- Versión de FrankenPHP: 1.11.1.
- Versión de Caddy: 2.10.2.
- Versiónes de PHP: 8.3.29, 8.4.16, 8.5.1.

## Requisitos:

- Pterodactyl instalado.

## Instalación:

- Carga egg-nginx--p-h-p--f-p-m.json en tu panel.
- Subir archivo [pterodactyl-nginx](https://github.com/Sinaloense/pterodactyl-nginx/blob/main/logrotate.d/pterodactyl-nginx) en el directorio /etc/logrotate.d/ de tu host principal.
- Subir archivo [pterodactyl-phpfpm](https://github.com/Sinaloense/pterodactyl-phpfpm/blob/main/logrotate.d/pterodactyl-phpfpm) en el directorio /etc/logrotate.d/ de tu host principal.

## Recomendado usarse en conjunto con:
- [Pterodactyl Cloudflared.](https://github.com/Sinaloense/pterodactyl-cloudflared)
