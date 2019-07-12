#! /bin/bash

scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/Projects/voltdb-example-jdbc-xdcr/build/libs/client.jar ec2-user@$1:/home/ec2-user

ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 "java -cp client.jar com.example.Application $1 $2"
