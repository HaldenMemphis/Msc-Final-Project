# Msc-Final-Project
This repository is submitted as part of the requirements for a Master's degree in Advanced Computer Science.

This is the main GitHub repository of my master's project "Implementing an OpenMRS-Compatible Real-time IoT Health Data Monitoring System".

This repository includes links to the GitHub repositories of core microservices developed by the author, the architectural design of this system, installation requirements and methods for this system, as well as database change files.

##### The project includes three additional GitHub repositories as shown in the following table:

| Repositories           | Link                                                |
| ---------------------- | --------------------------------------------------- |
| kaa-patch microservice | https://github.com/HaldenMemphis/Kaa-patch.git      |
| user microservice      | https://github.com/HaldenMemphis/user-microserv.git |
| data microservice      | https://github.com/HaldenMemphis/data-microserv.git |

The core code for this project exists in the repositories shown in the table above.

The three main Docker images of this project are located at:

| Images                 | Link                                                         |
| ---------------------- | ------------------------------------------------------------ |
| kaa-patch microservice | https://hub.docker.com/repository/docker/jasondennis12138/kaa-patch/general |
| user microservice      | https://hub.docker.com/repository/docker/jasondennis12138/user-microserv/general |
| data microservice      | https://hub.docker.com/repository/docker/jasondennis12138/data-microserv/general |

The content of this repository includes:

+ Kaa config: Configuration/Log structure in Kaa
+ Client sdk: The SDK required to connect IoT devices to this system
+ changelog:  Database change files for this project
+ properties:  The configuration files used by this project's microservices.

This project also provides a simple program example written in Java to help you connect your IoT devices to this system.

https://github.com/HaldenMemphis/Simulated-devices-Monitor

Rough installation instructions will be provided at the following link:

https://github.com/HaldenMemphis/Msc-Final-Project/blob/main/Setup.md



