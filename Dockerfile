FROM --platform=linux/arm64/v8 mcr.microsoft.com/azure-sql-edge
USER root
RUN apt-get update \
    && apt-get install -y curl apt-transport-https locales gnupg2 \
    && locale-gen "en_US.UTF-8" \
    && export `grep "VERSION_ID" /etc/os-release | sed -e 's/^VERSION_ID=\"/VERSION_ID=/' -e 's/\"$//'` \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y sqlcmd unixodbc-dev \
    && apt-get remove -y curl apt-transport-https \
    && rm -f /etc/apt/sources.list.d/msprod.list \
    && rm -rf /var/lib/apt/lists/*
ENV LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" LC_ALL="en_US.UTF-8"
COPY . /
RUN chmod +x /init.sh && chmod +x /entrypoint.sh
EXPOSE 1433
USER mssql
ENTRYPOINT /bin/bash /entrypoint.sh