CREATE DATABASE airflow;
ALTER DATABASE airflow SET READ_COMMITTED_SNAPSHOT ON;
CREATE LOGIN airflow WITH PASSWORD='airflow', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;
GO
USE airflow;
CREATE USER airflow FROM LOGIN airflow;
EXEC sp_addrolemember N'db_owner', N'airflow';