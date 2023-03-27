FROM centos:latest
LABEL maintainer="Your Name <your.email@domain.com>"

# Install dependencies
RUN yum -y update && \
    yum -y install java-1.8.0-openjdk-devel wget && \
    yum clean all

# Install Gradle
ENV GRADLE_VERSION 7.1.1
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip
ENV PATH="${PATH}:/opt/gradle/gradle-${GRADLE_VERSION}/bin"

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Build application
RUN gradle build

# Run application
CMD ["gradle", "run"]
