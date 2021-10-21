It is based on: https://github.com/AntonyJR/Oracle-Connectivity-Agent

# Run OIC Agent on Kubernetes

This is a example of how deploy OIC Connectivity Agent on Kubernetes in HA.

## What is created

- A new namespace called oic
- A ConfigMap with OIC URL and the Agent Group Identifier
- A Secret with OIC Credentials
- A deployment with 2 replicas pod running the agent

## Use Case

The OIC Connectivity agent can be deploy in HA up to two agents per Agent Group.

Each deployment will run a HA Connectivity Agent from a specific agent group. When a container crashes, it automatically destroy the crashed container and startup a new one.

> :warning: **If a running Agent crashes**: The pod may be restarted a few time. OIC takes some time to identify the agent health, this may cause some error on the pod execution due the Agent limit per Agent Group.

### Running multiples Agents Groups

To run more than one Agent Group, you can create a new ConfigMap and a new deploy to this specific Agent Group and keeping using the same secret.

## How to use it

1. Download the Kubernets [manifest](/oic-agent-deploy.yaml)
2. Replace {oic_url} and {agent_group} on the ConfigMap to your OIC URL and your Agent Group Identifier
3. Replace {oic_user} and {oic_password} on the Secret to your OIC credentials
4. [Optional] - Rebuild the docker image and push it to your private repository. After this, you can change the image on the Deploy.