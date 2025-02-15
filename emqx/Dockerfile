FROM etiquetasio/emqx:4.4.16	

#TODO(sm): include TLS certificates

COPY docker-entrypoint.sh /usr/bin/
COPY docker-healthcheck /usr/local/bin/
COPY bin/emqx /opt/emqx/bin/emqx
COPY etc/ /opt/emqx/etc
COPY log/ /opt/emqx/log

HEALTHCHECK CMD ["docker-healthcheck"]

# ENTRYPOINT ["/usr/bin/env", "bash", "-c", "( sleep 10; docker-healthcheck ) & /usr/bin/docker-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["/opt/emqx/bin/emqx", "foreground"]
