## Description

This Railway template sets up an EMQX MQTT broker. The EMQX broker is configured to handle MQTT connections over TCP on port 1883. 

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

- `WS_PORT=8083`: MQTT over WebSocket port.
- `SSL_PORT=8883`: MQTT over TLS port.
- `TCP_PORT=1883`: MQTT TCP port.
- `WSS_PORT=8084`: MQTT over secure WebSocket port.
- `ADMIN_PORT=18083`: Dashboard port.
- `EMQX_NODE__COOKIE=${{ secret(64) }}`: Cookie secret for node communication.
- `EMQX_DASHBOARD__DEFAULT_PASSWORD=${{ secret(18) }}`: Admin password for the EMQX dashboard.
