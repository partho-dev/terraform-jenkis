## Documentation

- The detailed explantion of running terraform with Jenkins for CICd is done on my other repo file

https://github.com/partho-dev/terraform/blob/main/terraform-jenkins-cicd.md


- We would get the important info about Jenkinsfile and its concepts

- Jenkins and its two different ways of writing the pipeline
    - declarative pipeline
    - scripted pipeline

- Blocks
    - pipeline{} - main block, all other blocks goes indide this
    - agent block
```
pipeline{
        agent any
        or
        agent { docker { image 'maven:3.9.8-eclipse-temurin-21-alpine' } }
    }
```
- Jenkins agent(node), is a server that is configured to run jobs assigned by the Jenkins master. The agent can be any physical machine, virtual machine, or container.
- Jenkins follows master agent architecture
- It needs agent to run the stages 
- if `any` is defined that means, the stages can run with any agent
- Most of the time, we have a single server where we install Jenkins, that one server acts as both master & agent
