FROM postgres:16.2

### Database
ENV POSTGRES_DB="thdc"
ENV POSTGRES_PASSWORD="PL_tech_hand_elk"
ENV POSTGRES_USER="default"

EXPOSE 5432
CMD ["postgres"]
