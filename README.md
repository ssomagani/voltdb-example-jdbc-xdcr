# voltdb-example-jdbc-xdcr
An example application that shows how to run VoltDB clusters replicating over XDCR with clients
 connecting to local VoltDB instances using JDBC driver.
 
The scripts folder contains the scripts to run each step below. 
You can either use those scripts directly by substituting your own paths or you may use your preferred methods and use the scripts as guides
 to understand the functionality that we wish to achieve at each step.

This is an Eclipse project so you should be able to create a project in your workspace if you prefer (requires Gradle plugin)

## 1. Ensure machines are started and application is built
* `./gradlew jarAll`

## 2. Prepare the configuration
* Update `deployment/dr/connection@source` in config/deployment.xml files to reflect the IP address of the other server

## 3. Install VoltDB and prereqs on the servers
* `scripts/remote_install_volt.sh IP_1; scripts/remote_install_volt.sh IP_2`

## 4. Start VoltDB instances on servers in different data centers
* `scripts/remote_start.sh IP_1 1; scripts/remote_start.sh IP_2 2`

## 5. Load the schema, stored procedures and initial data
* `scripts/remote_load.sh IP_1; scripts/remote_load.sh IP_2`

## 6. Start the application
* `scripts/remote_run.sh IP_1 NYSE; scripts/remote_run.sh IP_2 LONDON` 

## 7. Monitor the replication and performance
* Point your browser tabs to http://IP_1:8080 and http://IP_2:8080
* Monitor the Database Tables at the bottom to check the number of rows in the table
* Monitor the DR tab to check the replication rate, latency etc.

# Contact
For any questions, please reach out to ssomagani at voltdb. We are also on Slack at chat dot voltdb dot com