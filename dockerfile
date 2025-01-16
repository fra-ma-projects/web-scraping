# Multi-stage Docker build for Python and React

# React stage

# Python stage
FROM python:3.10-slim AS python_service
WORKDIR /app
COPY python_service/requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY python_service/ /app/

FROM node:20-alpine AS react_app
WORKDIR /frontend
COPY react_app/package.json react_app/yarn.lock ./
RUN yarn install
COPY react_app / ./
EXPOSE 3000
CMD [ "yarn","start" ]