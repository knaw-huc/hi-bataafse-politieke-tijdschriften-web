# Bataafse Politieke Tijdschriften (Web)

Dit is de vervanging van de website voor https://bataafse-politieke-tijdschriften.huygens.knaw.nl/, maar nu 
in een reproduceerbare Docker setup, met de mogelijkheid content te updaten vanuit de repo.

Het is de intro website behorend bij het boek: Erik Jacobs, "Hartslag van een revolutie: Pers en politiek 
in de Bataafse republiek (1795-1802)" (Hilversum: Verloren, 2025), 
ISBN: 9789464551686, https://verloren.nl/Webshop/Detail/catid/205/eid/94329/hartslag-van-een-revolutie.

## Structuur

```
html/                  de site zelf (statische HTML/CSS)
  index.html
  css/style.css
  img/logo-homepage-intro.svg
cron/                  scripts voor de deploy-container
  crontab              draait crontask.sh elk uur
  crontask.sh          cloont/pullt deze repo en kopieert html/ naar het volume
  entrypoint_cron.sh   draait crontask.sh eenmalig, installeert de crontab en start cron
Dockerfile             image voor de cron-container
Docker-compose.yml     nginx + cron-container achter Traefik
```

## Deploy

De site wordt niet gebouwd; `html/` wordt rechtstreeks geserveerd. Twee containers delen één Docker-volume:

- **web** — nginx, serveert het volume, wordt via Traefik-labels op de hostname gerouteerd.
- **cron** — pullt elk uur deze repository van GitHub en kopieert `html/` naar hetzelfde volume.

Een wijziging op `main` staat dus uiterlijk een uur later online; verder is er geen deploy-stap.

Starten:

```sh
docker compose -f Docker-compose.yml up -d --build
```

Het externe netwerk `traefik-public` moet bestaan.

## Lokaal bekijken

`html/index.html` heeft geen build of server nodig — openen in de browser volstaat. Voor correcte paden eventueel:

```sh
python3 -m http.server -d html 8000
```

## Licentie

MIT, zie [LICENSE](LICENSE).
