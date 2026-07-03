#!/bin/bash

# =========================
# DATABASE (RDS)
# =========================
export DB_URL=jdbc:mysql://database-1.cp2uy0osedto.eu-west-1.rds.amazonaws.com:3306/spring_jpa_lab
export DB_USER=admin
export DB_PASSWORD='vnc(0800)'

# =========================
# REDIS (ElastiCache)
# =========================
export REDIS_HOST=seu-endpoint-elasticache.amazonaws.com
export REDIS_PORT=6379

# =========================
# START APPLICATION
# =========================
echo "Iniciando aplicação Spring Boot..."
java -jar app.jar