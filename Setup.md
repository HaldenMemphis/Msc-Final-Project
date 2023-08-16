### Setup！

#### Step1: Install Kaa

The installation instructions for Kaa will follow the official documentation, which will be provided at the following address：

https://kaaproject.github.io/kaa/docs/v0.10.0/Administration-guide/System-installation/Building-Kaa-server-from-source-code/

Due to the outdated official documentation of kaa, the author provides some tips here:

1. **Install Java 8**

   Follow the method in the [official website documentation](https://kaaproject.github.io/kaa/docs/v0.10.0/Administration-guide/System-installation/Single-node-installation/) to install JDK. Due to its age, the source has been deprecated and can no longer achieve the desired result. It is recommended not to insist on following the official website's method, instead choose:

   `sudo apt-get install openjdk-8-jdk`

2. **Install Zookeeper**

   Zookeeper will be deployed in the directory /usr/local/zookeeper:

   `cd /usr/local && mkdir zookeeper && cd zookeeper`

   Create a data directory for mounting:

   `mkdir data`

   Create and start the container:

   `docker run -d -p 2181:2181 -v $PWD/data:/data --name zookeeper --restart always zookeeper`

   **Note: If deploying with a cloud service provider's VM, remember to open all necessary ports.**

3. **MongoDB**

   Please note that the version of MongoDB is 2.6.9, which will be used as a prerequisite for Kaa. It is recommended to use Docker for the installation and deployment of MongoDB:

   `docker run -d -p 27017:27017 mongo:2.6.9`

All personalized configurations will be set by the readers themselves, such as Log Appender.

#### Step2: Install Clickhouse

If the reader decides to use a single-node installation, the author recommends using docker-compose for installation:

```yaml
version: '3.3'
services:
  clickhouse-server:
    image: yandex/clickhouse-server:20.8.12.2
    container_name: clickhouse-server
    ports:
      - 9000:9000
      - 8123:8123
    restart: always
    volumes:
      - /etc/clickhouse-server:/etc/clickhouse-server
      - /home/data/clickhouse:/home/data/clickhouse
      - /home/log/clickhouse-server:/home/log/clickhouse-server
```

If the reader chooses to use cluster installation, please refer to the official documentation:

https://clickhouse.com/docs/en/install

#### Step3: Install Kafka

Please refer to the official documentation for installation instructions. Among them, Zookeeper is a prerequisite for Kafka：

https://kafka.apache.org/documentation/#quickstart

Readers can freely choose whether to deploy in a clustered form.

#### Step4: Install PostgreSQL

Since PostgreSQL is also an external component of Kaa, readers do not need to install it separately. They can use Kaa directly.

#### Step5: Perform  changes

Please make architectural changes in the corresponding database and Kafka. The details of the changes have been provided in the corresponding folder of this repository.

#### Step6: Install Microservices

The author has packaged the microservices developed in this project into Docker images, and the configuration files are also provided in the project. Please modify the configuration file according to the actual situation and use Docker to run the Docker image.
