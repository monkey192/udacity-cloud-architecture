### Application Stack

### Command
```
aws cloudformation create-stack --region us-east-1 --stack-name c3-s3 --template-body file://c3-s3.yml
```

```
aws cloudformation create-stack --region us-east-1 --stack-name c3-vpc --template-body file://c3-vpc.yml
```

```
aws cloudformation create-stack --region us-east-1 --stack-name c3-app --template-body file://c3-app.yml --parameters ParameterKey=KeyPair,ParameterValue=udacity-stack-key --capabilities CAPABILITY_IAM
```