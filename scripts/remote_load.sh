#! /bin/bash

scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/Projects/voltdb-example-jdbc-xdcr/sql/ddl.sql ec2-user@$1:/home/ec2-user
scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/Projects/voltdb-example-jdbc-xdcr/build/libs/procs.jar ec2-user@$1:/home/ec2-user

ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'voltdb-ent-9.0/bin/sqlcmd < ddl.sql'