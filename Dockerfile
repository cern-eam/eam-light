# Build Frontend
FROM node:22.13 AS febuilder

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/cern-eam/eam-light-frontend.git
WORKDIR ./eam-light-frontend
RUN git checkout ric
RUN yarn install
ENV VITE_BACKEND="/apis/eamlightws/rest"
ENV VITE_PUBLIC_URL=""
ENV VITE_LOGIN_METHOD="STD"
ENV VITE_MULTI_ORG="TRUE"
ENV VITE_CERN_MODE="FALSE"
RUN yarn build

# Build Backend
FROM maven:3.8.6-openjdk-8 AS bebuilder
RUN mkdir /home/app
WORKDIR /home/app
RUN git clone https://github.com/cern-eam/eam-light-backend.git && \
	cd eam-light-backend && \
    git checkout ric && \
	mvn clean package -PNONE,OPEN

# Image
FROM nginx:alpine

RUN curl -L https://download.jboss.org/wildfly/22.0.1.Final/wildfly-22.0.1.Final.tar.gz -o /tmp/wildfly.tar.gz && \
    mkdir /opt/jboss && \
    mkdir /opt/jboss/wildfly && \
    tar -xvzf /tmp/wildfly.tar.gz -C /opt/jboss/wildfly --strip-components=1 && \
    rm /tmp/wildfly.tar.gz

COPY docker/start.sh /start.sh
RUN chmod +x /start.sh

COPY docker/nginx.conf /etc/nginx/nginx.conf
ADD docker/*.jar /opt/jboss/wildfly/standalone/deployments/
COPY --from=febuilder /usr/src/app/eam-light-frontend/build/ /usr/share/nginx/html
COPY --from=bebuilder /home/app/eam-light-backend/eam-light-backendear/target/*.ear /opt/jboss/wildfly/standalone/deployments/

RUN apk add openjdk8

EXPOSE 80
EXPOSE 9990

CMD ["/start.sh"]
