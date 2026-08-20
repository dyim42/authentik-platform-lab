# Architecture from Docker Compose

## Services

- Postgresql
- Main server
- worker

### Database

Database is running Postgres 16 (docker image postgres:16-alpine)

Volume needed:
- database:/var/lib/postgresql/data

Environment Variables:
- POSTGRES_DB
- POSTGRES_PASSWORD
- POSTGRES_USER

restart: unless-stopped

### Server

Main server is running its own image:
AUTHENTIK_IMAGE: (defaults to) -ghrc.io/goauthentik/server

Volumes:
- /data
- /templates

Environment Variables:
- AUTHENTIK_POSTGRESQL__HOST
- AUTHENTIK_POSTGRESQL__PASSWORD
- AUTHENTIK_POSTGRESQL__NAME
- AUTHENTIK_POSTGRESQL__USER
- AUTHENTIK_SECRET_KEY

Ports:
- HTTP: 9000
- HTTPS: 9443

restart: unless-stopped

### Worker

AUTHENTIK_IMAGE: (defaults to) -ghcr.io/goauthentik/server

Environment Variables:
- AUTHENTIK_POSTGRESQL__HOST
- AUTHENTIK_POSTGRESQL__PASSWORD
- AUTHENTIK_POSTGRESQL__NAME
- AUTHENTIK_POSTGRESQL__USER
- AUTHENTIK_SECRET_KEY

Volumes:
- /var/run/docker.sock
- /data
- /certs
- /templates

User: root
restart: unless-stopped

## Networking

- All bridged by default by Compose
- Server is the only one exposing ports (9000/tcp and 9443/tcp)
- Server and Worker depends on postgresql
