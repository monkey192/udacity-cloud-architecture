## Data Durability And Recovery

### Deploy VPC
- for `us-east-1` region
```sh
aws cloudformation deploy \
--template-file ./vpc.yaml \
--stack-name udacity-project-2 \
--region us-east-1 \
--parameter-overrides VpcName=udacity-project01-01
```

- for `us-west-2` region
```sh
aws cloudformation deploy \
--template-file ./vpc.yaml \
--stack-name udacity-project-2 \
--region us-west-2 \
--parameter-overrides VpcName=udacity-project01-01 VpcCIDR=172.16.0.0/16 PublicSubnet1CIDR=172.16.0.0/24 PublicSubnet2CIDR=172.16.1.0/24 PrivateSubnet1CIDR=172.16.2.0/24 PrivateSubnet2CIDR=172.16.3.0/24
```


root12345678!