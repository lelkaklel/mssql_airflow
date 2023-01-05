# MS SQL Server for Apache Airflow

Based on original repos https://hub.docker.com/_/microsoft-azure-sql-edge and https://github.com/microsoft/go-sqlcmd

For linux/arm64 image building

## Environment Variables

```ACCEPT_EULA``` confirms your acceptance of the End-User Licensing Terms. For the Azure SQL Edge Developer EULA can be located here. Azure SQL Edge Premium EULA can be found here.

```MSSQL_SA_PASSWORD``` is the database system administrator (userid = 'sa') password used to connect to Azure SQL Edge once the container is running. Important note: This password needs to include at least 8 characters of at least three of these four categories: uppercase letters, lowercase letters, numbers and non-alphanumeric symbols.

```MSSQL_PID``` is the Edition that the container will run with. Acceptable values:

* Developer : This will run the container using the Developer Edition (this is the default if no MSSQL_PID environment variable is supplied)
* Premium : This will run the container using the Premium Edition

## How to use this Image

```docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 --name mssql -d lelkaklel/mssql_airflow```