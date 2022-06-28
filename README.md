# ECR Publish Lab

ECR is a Docker registry that is used to store images. It is a service that is provided by AWS. 

This is a simple lab that will show you how to use the AWS ECR service to publish an image to the ECR registry.

# Getting started

## Terraform

Cloud Hippie provides the Terraform resources in order to complete the lab.

If you do not have the [Terraform](https://www.terraform.io/) installed, you can install it by following the instructions [here](https://www.terraform.io/downloads.html).

Once installed, navigate to the infra directory and run the following command:

```
terraform init
terraform apply -auto-approve
```

This will download the needed providers for the lab, as well as create the infrastructure.

It will create a new ECR repository called `cloud-hippie-ecr-repository`.

THIS IS THE NAME OF THE REPOSITORY WE WILL BE PUBLISHING TO.


## Python 

As this is a Python app, make sure to create a virtual environment and install the dependencies.

```bash
$ virtualenv ecr-publish-lab
$ source venv/bin/activate
$ pip install -r requirements.txt
```

This will install all the needed dependencies for the app located within the `app` folder.

We're going to Dockerize a simple Python app built with FastAPI.

```bash
$ docker build -t ecr-publish-lab .
$ docker run -p 8080:8080 ecr-publish-lab
```

This will build the Docker container and run it on port 8080.

Now that we have the Docker container running, we can curl the app and see the output.

```bash
$ curl http://localhost:8080
```

Now that we have verified our app works, Dockerizes and gives the proper response, we can now publish the image to the ECR registry.

# The Mission

Within the `tools` folder, there is a `deploy.sh` script. The script contains the steps needed to complete this lab.
