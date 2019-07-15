#! /bin/sh

scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/Projects/voltdb-example-jdbc-xdcr/config/deployment-$2.xml ec2-user@$1:/home/ec2-user/deployment.xml

ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'voltdb-ent-9.0/bin/voltdb init -f -C deployment.xml'
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'voltdb-ent-9.0/bin/voltdb start -B --ignore=THP'
