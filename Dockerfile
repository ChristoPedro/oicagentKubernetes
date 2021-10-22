FROM store/oracle/jdk:11

RUN yum -y install jq

RUN mkdir -p /u01/agent/install

WORKDIR /u01/agent/install

# Include agent zip and scripts
COPY run_agent.sh .

# Command to run agent
CMD ./run_agent.sh