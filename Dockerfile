FROM ubuntu:trusty
RUN useradd -c 'Hystrix exporter' -u 999 -m -d /app hystrix_exporter
RUN \
      apt-get update -qq && \
      apt-get install wget gzip -qq && \
      cd /app && \
      wget -nv https://github.com/ContaAzul/hystrix_exporter/releases/download/v0.0.3/hystrix_exporter_0.0.3_linux_amd64.tar.gz && \
      tar xvf hystrix_exporter_0.0.3_linux_amd64.tar.gz && \
      chown -R hystrix_exporter: /app && \
      rm hystrix_exporter_0.0.3_linux_amd64.tar.gz
USER 999
WORKDIR /app
EXPOSE 9444
ENTRYPOINT ["/app/hystrix_exporter"]
