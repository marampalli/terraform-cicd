#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum update -y
sudo yum install git -y
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
cd /tmp ; sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
cd /tmp ; sudo tar -xzf apache-maven-3.9.6-bin.tar.gz -C  /opt/
sudo mv /opt/apache-maven-3.9.6 /opt/maven
sudo bash -c 'echo "MAVEN_HOME=\"/opt/maven\"" >> /etc/profile'
sudo bash -c 'echo "PATH=\$MAVEN_HOME/bin:\$PATH" >> /etc/profile'
sudo bash -c 'echo "JAVA_HOME=\"/usr/lib/jvm/java-17-amazon-corretto\"" >> /etc/profile' 
sudo bash -c 'echo "PATH=\$JAVA_HOME/bin:\$MAVEN_HOME/bin:\$PATH" >> /etc/profile'
source /etc/profile