#! /bin/sh

# 1. Check if the AWS Cli is installed. You can read about the AWS cli here: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
echo "Is AWS Installed?"
if [ "$(aws)" != " " ];
then echo "AWS is installed!"

# 2. Install if it is not there
else [ "$(sudo ./aws/install)" ]
fi 

# 3. Using the AWS Command line, publish your Docker container to ECR.
echo "AUTHENTICATING..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 991214512927.dkr.ecr.us-east-1.amazonaws.com

echo "Tagging"
docker tag ad78874d88bb 991214512927.dkr.ecr.us-east-1.amazonaws.com/jones-ecr-repository

echo "Pushing container"
docker push 991214512927.dkr.ecr.us-east-1.amazonaws.com/jones-ecr-repository 

# 4. Use that same command line to verify that your container is published.
echo "Verifying Push"
aws ecr describe-images --repository-name jones-ecr-repository 