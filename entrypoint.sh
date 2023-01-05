#!/usr/bin/env bash
set -m
export SQLCMDPASSWORD=$MSSQL_SA_PASSWORD
/opt/mssql/bin/sqlservr & /init.sh && fg