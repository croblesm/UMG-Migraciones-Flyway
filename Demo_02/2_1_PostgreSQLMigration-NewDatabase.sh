# Demo 02 - PostgreSQL Migration - New database
# 
#   1- Create PostgreSQL container with worldregions database
#   2- Connect to PostgreSQL using psql (within Docker)
#   3- Execute basic PostgreSQL commands
#   4- Flyway migration files and structure
#   5- Flyway migration V1
#   6- Flyway migration V2
#   7- Check PostgreSQL worldregions migrations
#   8- Clean all migrations
#   9- Check PostgreSQL worldregions schema
# -----------------------------------------------------------------------------
# Reference:
#   open https://flywaydb.org/documentation/
#   open https://github.com/flyway/flyway-docker
#   open https://hub.docker.com/r/flyway/flyway
#
# JDBC URL
# SQL Server:       jdbc:sqlserver://<host>:<port>;databaseName=<database>
# PostgreSQL:       jdbc:postgresql://<host>:<port>/<database>?<key1>=<value1>&<key2>=<value2>

# 0- Env variables | demo path
cd ~/Documents/Migraciones-Flyway/Demo_02;
SQLScripts=~/Documents/Migraciones-Flyway/Demo_02/SQLScripts;
ConfigFile=~/Documents/Migraciones-Flyway/Demo_02/ConfigFile;
# dkrm PostgreSQL-Demo;
# docker volume rm vlm_PG-Data;
# mv ./SQLScripts/V2__LoadData.sql ./SQLScripts/--V2__LoadData.sql;

# 1- Create PostgreSQL container with worldregions database
docker container run \
    --name PostgreSQL-Demo \
    --hostname PostgreSQL-Demo \
    --env POSTGRES_DB=worldregions \
    --env 'POSTGRES_PASSWORD=CmdL1n3-r0ck5' \
    --volume vlm_PG-Data:/var/lib/postgresql/data \
    --publish 5432:5432 \
    --detach postgres:12-alpine

# 2- Connect to PostgreSQL using psql (within Docker)
docker exec -it PostgreSQL-Demo psql -U postgres -d worldregions

# 3- Execute basic PostgreSQL commands
# List all databases
# psql command: \list | \l
SELECT datname FROM pg_database;

# List all tables in worldregions     
# psql command: \dtables | \dt
SELECT table_name FROM information_schema.tables where table_schema ='public';

# Exit psql session
# psql command: \quit | \q
quit;

# 4- Flyway migration files and structure
Demo_02
├── ConfigFile
│   └── flyway.conf
└── SQLScripts
    ├── V1__CreateStructures.sql
    └── --V2__LoadData.sql

# Explore Confile
code ./ConfigFile/flyway.conf

# Explore SQL Scripts
code ./SQLScripts/V1__CreateStructures.sql;

# 5- Flyway migration V1
# Initializing
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway info

# Perform V1 migration
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway migrate

# Check status
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway info

# 6- Flyway migration V2
# Add more scripts
code ./SQLScripts/--V2__LoadData.sql;
mv ./SQLScripts/--V2__LoadData.sql ./SQLScripts/V2__LoadData.sql;

# New folder structure
Demo_02
├── ConfigFile
│   └── flyway.conf
└── SQLScripts
    ├── V1__CreateStructures.sql
    └── V2__LoadData.sql

# Check status
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway info

# Perform V1 migration
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway migrate

# --------------------------------------
# Azure Data Studio step
# --------------------------------------
# 7- Check worldregions schema changes

# 8- Clean all migrations
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway clean

# --------------------------------------
# Azure Data Studio step
# --------------------------------------
# 9- Check PostgreSQL worldregions schema