# terraform_single_file
HW6

Written by anna sakran geryes 
December 2024 - devops course
Task requirments is defined in [task.md](task.md)

## description
This setup ensures that the NGINX container forwards requests to the app container, which responds with "Hello, World!"
- App Container (hello_app): Runs on port 5003 and responds with Hello, World! to any request.
- NGINX Container: Listens on port 80, forwards all requests to the app container, and serves responses from it.

## instruction

1- Ensures your Terraform configuration files are formatted properly.
```
terraform fmt
```

2- Initialize the Terraform project by running:
```
terraform init
```

3- validating your configuration before applying changes.
```
terraform plan
```

4- Apply the configuration:
```
terraform apply
```

5- Access the NGINX server http://<docker-host-ip> 



#### Anna Geryes
