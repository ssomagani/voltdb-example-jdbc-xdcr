# voltdb-example-jdbc-xdcr
An example application that shows how to run VoltDB clusters replicating over XDCR with clients
 connecting to local VoltDB instances using JDBC driver.

## 1. Install VoltDB on RH7 servers
* Copy `scripts/install_volt.sh`, `voltdb-ent-9.0.tar.gz`, `config/deployment.xml` 
(deployment-1.xml goes to datacenter-1 and deployment-2.xml goes to datacenter-2...) and `license.xml` (if needed) 
to the server to install voltdb dependencies 

## 2. Start VoltDB instances on servers in different data centers
* voltdb-ent-9.0/bin/voltdb init -f
* voltdb-ent-9.0/bin/voltdb start

## 3. Connect the VoltDB instances using XDCR
* Update the `<connection>` element in deployment.xml to reflect the IP address of the other server

## 4. Load the schema, stored procedures and initial data
* `sqlcmd < ddl.sql`

## 5. Start the application
