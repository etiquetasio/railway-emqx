## One Click Deploy here:
[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/bH12Xo?referralCode=QfkFc_)

## Description

etiquetas.io EMQX 4.4.16 for ZKONG ESL Server 6.5.1 for Railway Dev Hosting Platform. On Railway you can host this EMXQ MQTT Instance for USD 5.00 with 8Gb of RAM and 8 vpcu.

The EMQX broker is configured to handle MQTT connections over TCP on port 1883 and support MySQL Auth Plugin to connect to device_core database.

## EMQX

EMQX is a highly scalable, open-source MQTT broker designed to support large-scale IoT applications. It enables the exchange of messages between devices with minimal overhead, ensuring efficient and reliable communication.

### Default Ports

Railway doesn't allow to expose multiple ports, thus there is a Caddy reverse proxy to handle HTTP and WebSocket connections.

EMQX listens the following ports by default

- **TCP Port**: 1883 (MQTT)
- **WebSocket Port**: 8083 (MQTT over WebSocket)
- **SSL Port**: 8883 (MQTT over TLS)
- **Secure WebSocket Port**: 8084 (MQTT over secure WebSocket)
- **Admin Dashboard Port**: 18083 (EMQX admin UI)

This template exposes 1883 TCP port directly from emqx service.

### Environment Variables for EMQX Service

- `EMQX_LOADED_PLUGINS`: emqx_recon,emqx_retainer,emqx_management,emqx_dashboard,emqx_auth_mysql
- `EMQX_NAME`: emqx
- `EMQX_NODE_COOKIE`: emxq
- `PATH`: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
- `TZ`: America/Sao_Paulo

### How to Deploy on RailWay

- 1 - Clone this Repo to you Github Account
- 2 - Edit the file /etc/plugins/emqx_auth_mysql.conf and points to your MySQL Database device_core
- 3 - On RailWay Dashboard create a new service and deploy from your Repo .git URL ( example: )
- 4 - Still in Rayldashboard go to "Settings" of your new EMQX service and create access for Networking.
   - Create first access to TCP PORT 18083 ( EMXQ Web Dashboard )
   - Click on TCP Proxy and point to 1883, railway generates another TCP PORT to you connect MQTT Clients and ZKONG Base Stations
   - Optional: You can create a custom Domain and points to the 1883 port, follow the Railway instructions.
    
