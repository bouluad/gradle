FROM centos:latest
LABEL maintainer="Your Name <your_email@example.com>"

# Update packages and install required packages
RUN yum -y update && \
    yum -y install wget unzip java-1.8.0-openjdk-devel

# Set Gradle version and download URL
ARG GRADLE_VERSION=7.3.3
ARG GRADLE_DOWNLOAD_URL=https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip

# Download and install Gradle
RUN wget -q ${GRADLE_DOWNLOAD_URL} && \
    unzip -qo gradle-${GRADLE_VERSION}-bin.zip -d /opt && \
    rm -f gradle-${GRADLE_VERSION}-bin.zip

# Set Gradle environment variables
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${PATH}:${GRADLE_HOME}/bin

# Install Jenkins plugins (if needed)
# RUN /usr/local/bin/install-plugins.sh plugin1 plugin2 ...

# Set the working directory to /home/jenkins
WORKDIR /home/jenkins

# Start a shell by default when launching the container
CMD ["/bin/bash"]
