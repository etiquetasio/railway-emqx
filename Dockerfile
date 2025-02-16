FROM etiquetasio/emqx:4.4.16	


FROM etiquetasio:emqx:4.4.16

#define o responsável pela aplicação
LABEL maintainer=”etiquetasio”

#Atualiza o SO
RUN apk update

#Instala o python3, pip3 e o git
RUN apk add git -y

#clona o APP
RUN git clone https://github.com/etiquetasio/railway-emqx.git /opt/emqx/

#vai para o diretório principal
WORKDIR /opt/emqx
COPY docker-entrypoint.sh /usr/bin/

#Expoe a porta 80 (apenas para documentação)
EXPOSE 11883 18083 1883 4369 4370 5369 6369 6370 8081 8083 8084 8883

# Entra na pasta do app (só é executado quando iniciamos o container)
CMD [/opt/emqx/bin/emqx foreground]

# ENTRYPOINT ["/usr/bin/env", "bash", "-c", "( sleep 10; docker-healthcheck ) & /usr/bin/docker-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["/opt/emqx/bin/emqx", "foreground"]
