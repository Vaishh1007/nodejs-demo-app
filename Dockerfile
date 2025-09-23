FROM jenkins/jenkins:lts

# Switch to root to install packages
USER root

# Install bash, git, Node.js (npm comes with it), Docker CLI
RUN apt-get update && \
    apt-get install -y curl git bash sudo && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs docker.io && \
    usermod -aG docker jenkins && \
    apt-get clean

# Switch back to jenkins user
USER jenkins
