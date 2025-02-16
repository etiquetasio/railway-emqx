FROM etiquetasio/emqx:4.4.16	

#define o responsável pela aplicação
LABEL maintainer=”etiquetasio”

USER root

#Atualiza o SO 1
RUN apk update

#Instala o python3, pip3 e o git
RUN apk add git

#clona o APP

RUN git clone https://github.com/etiquetasio/railway-emqx.git /opt/emqx.git/
RUN cp -rp /opt/emqx.git/* /opt/emqx/
RUN chmod +x /opt/emqx/bin/emqx
RUN rm /opt/emqx/log/emqx.log.siz
RUN ls -l /opt/emqx/

#vai para o diretório principal
WORKDIR /opt/emqx
COPY docker-entrypoint.sh /usr/bin/


#Expoe a porta 80 (apenas para documentação)
EXPOSE 11883 18083 1883 4369 4370 5369 6369 6370 8081 8083 8084 8883

# Entra na pasta do app (só é executado quando iniciamos o container)
CMD [/opt/emqx/bin/emqx foreground]
	
USER emqx

# ENTRYPOINT ["/usr/bin/env", "bash", "-c", "( sleep 10; docker-healthcheck ) & /usr/bin/docker-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]  
CMD ["/opt/emqx/bin/emqx" "foreground"]
