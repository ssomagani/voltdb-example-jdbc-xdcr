#! /bin/sh

SCP_OPTS="-i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes'"
SSH_OPTS="-i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1"

scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/voltdb-ent-9.0.tar.gz ec2-user@$1:/home/ec2-user
scp -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' /Users/seetasomagani/voltdb/voltdb/license.xml ec2-user@$1:/home/ec2-user

ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 sudo yum -y update
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 sudo yum -y install java-11-openjdk
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 sudo yum -y install ntp

ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'sudo bash -c "echo never > /sys/kernel/mm/transparent_hugepage/enabled"'
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'sudo bash -c "echo never > /sys/kernel/mm/transparent_hugepage/defrag"'
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'tar -xzvf /home/ec2-user/voltdb-ent-9.0.tar.gz'

# If a separate license was provided to you use below
ssh -t -i /Users/seetasomagani/.ssh/ec2_rhel.pem -o 'IdentitiesOnly yes' ec2-user@$1 'mv license.xml voltdb-ent-9.0/voltdb/license.xml'
