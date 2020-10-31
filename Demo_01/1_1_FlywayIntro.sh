# Demo 01 - Flyway Introduction
# 
#   1- Downloading Flyway command-line tool
#   2- Getting familiar with Flyway (Docker | App)
#   3- Flyway info
#   4- Flyway migrate
#   5- Flyway migrate + configuration file
# -----------------------------------------------------------------------------
# Reference:
#   open https://flywaydb.org/documentation/
#   open https://github.com/flyway/flyway-docker
#   open https://hub.docker.com/r/flyway/flyway

# 0- Env variables | demo path
cd ~/Documents/UMG-Migraciones-Flyway/Demo_01;
SQLScripts=~/Documents/UMG-Migraciones-Flyway/Demo_01/SQLScripts;
ConfigFile=~/Documents/UMG-Migraciones-Flyway/Demo_01/ConfigFile;

# 1- Downloading Flyway command-line tool
# macOS 
# brew install flyway
open https://flywaydb.org/download/

# 2- Getting familiar with Flyway (Docker | App)
# Local command-line
flyway

# Docker container
docker container run --rm flyway/flyway

    # Commands
    # --------
    # migrate  : Migrates the database
    # clean    : Drops all objects in the configured schemas
    # info     : Prints the information about applied, current and pending migrations
    # validate : Validates the applied migrations against the ones on the classpath
    # undo     : [pro] Undoes the most recently applied versioned migration
    # baseline : Baselines an existing database at the baselineVersion
    # repair   : Repairs the schema history table

# 3- Flyway info
# Local command-line
flyway info \
    -url=jdbc:h2:mem:FlyWay-Test \
    -user=sa -password=s3cr3t

# Docker container
docker container run --rm flyway/flyway \
    -url=jdbc:h2:mem:FlyWay-Test \
    -user=sa -password=s3cr3t \
    info

# 4- Flyway migrate
# Folder structure
Demo_01
└── SQLScripts
    └── V1__FlywayIntro.sql

# Dummy SQL script
code $SQLScripts/V1__FlywayIntro.sql

# Local command-line
flyway migrate \
    -url=jdbc:h2:mem:FlyWay-Test \
    -user=sa -password=s3cr3t  \
    -locations=filesystem:$SQLScripts

# Docker container
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    flyway/flyway \
    -url=jdbc:h2:mem:FlyWay-Test \
    -user=sa -password=s3cr3t \
    migrate

# 5- Flyway migrate + configuration file
# Folder structure
Demo_01
├── ConfigFile
│   └── flyway.conf
└── SQLScripts
    └── V1__FlywayIntro.sql

# Explore Configuration file reference
code ./flyway.conf

# Flyway Configuration file
# Creating a conf file
code $ConfigFile/flyway.conf

# Using configuration file
# Docker container
docker container run --rm \
    --volume $SQLScripts:/flyway/sql \
    --volume $ConfigFile:/flyway/conf \
    flyway/flyway migrate