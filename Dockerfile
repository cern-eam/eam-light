# build EAM Light frontend
FROM node:16.17 as feBuilder
RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean
RUN apt-get install -y zip \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/cern-eam/eam-light-frontend.git
WORKDIR ./eam-light-frontend
ENV PATH /usr/src/app/eam-light-frontend/node_modules/.bin:$PATH
RUN npm install --legacy-peer-deps && \
    npm install react-scripts@4.0.3 -g 
ENV REACT_APP_BACKEND "/rest"
ENV PUBLIC_URL "/eamlight"
ENV REACT_APP_LOGIN_METHOD "STD"
ENV REACT_APP_CERN_MODE "FALSE"
ENV REACT_APP_MONO_ORG "FALSE"
ADD docker/jboss-web.xml public/WEB-INF
RUN npm run build && \
    cd build; zip -r eamlight.zip *; mv eamlight.zip eamlight.war;

#Build EAM Light Backend
FROM maven:3.6.3-jdk-8 as beBuilder
RUN mkdir /home/app
WORKDIR /home/app
RUN git clone https://github.com/cern-eam/eam-light-backend.git && \
	cd eam-light-backend && \
	mvn clean package
#COPY pom.xml /home/app/pom.xml
#COPY eam-light-backendejb /home/app/eam-light-backendejb
#COPY eam-light-backendweb /home/app/eam-light-backendweb
#COPY eam-light-backendear /home/app/eam-light-backendear
#RUN mvn -f /home/app/pom.xml clean package

FROM jboss/wildfly:22.0.1.Final
# Add all supported JDBC drivers
ADD docker/standalone.xml /opt/jboss/wildfly/standalone/configuration/
ADD docker/cacerts /opt/
ADD docker/*.jar /opt/jboss/wildfly/standalone/deployments/

COPY --from=feBuilder /usr/src/app/eam-light-frontend/build/eamlight.war /opt/jboss/wildfly/standalone/deployments/
COPY --from=beBuilder /home/app/eam-light-backend/eam-light-backendear/target/*.ear /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080/tcp
EXPOSE 9090/tcp
