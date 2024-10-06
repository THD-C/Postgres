FROM postgres:16.2


#######################################################################################################################
############################################### Environmental variables ###############################################
#######################################################################################################################

### Container
ENV TZ="Europe/Warsaw"

### Database
ENV POSTGRES_DB="THD"
ENV POSTGRES_PASSWORD="PL_tech_hand_elk"
ENV POSTGRES_USER="THD"
#### Set DB collate
ENV POSTGRES_INITDB_ARGS="--encoding=UTF-8 --lc-collate=pl_PL.utf8 --lc-ctype=pl_PL.utf8"

#### DB extension

##### pg_stat_statements extension
# EXTENSION_PG_STAT_TRACKED_STATEMENTS -  maximum number of statements tracked by the module 
#    (i.e., the maximum number of rows in the pg_stat_statements view). 
#    If more distinct statements than that are observed, information about the least-executed statements is discarded. 
#    The number of times such information was discarded can be seen in the pg_stat_statements_info view. 
#    The default value is 5000.
# 
# EXTENSION_PG_STAT_COUNTED_STATEMENTS - controls which statements are counted by the module. 
#    Specify top to track top-level statements (those issued directly by clients), all to also track nested statements 
#    (such as statements invoked within functions), or none to disable statement statistics collection. 
#    The default value is top.
ENV EXTENSION_PG_STAT_TRACKED_STATEMENTS="10000"
ENV EXTENSION_PG_STAT_COUNTED_STATEMENTS="all"


#######################################################################################################################
################################################ Packages installation ################################################
#######################################################################################################################

# Install plpython extension for code written in Python support
RUN apt-get update \
    && apt-get install -y postgresql-plpython3-16 python3-pip locales locales-all



#######################################################################################################################
##################################################### Copy files ######################################################
#######################################################################################################################

# Copy scripts to run on startup
COPY ./SQL/* /docker-entrypoint-initdb.d/

# Copy python requirements file and install
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt --break-system-packages


#######################################################################################################################
############################################## Start PostgreSQL engine ################################################
#######################################################################################################################

EXPOSE 5432
CMD ["postgres"]