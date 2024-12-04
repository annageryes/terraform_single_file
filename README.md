# terraform_single_file
HW6

Written by anna sakran geryes 
December 2024 - devops course
Task requirments is defined in [task.md](task.md)

## description
This setup ensures that the NGINX container forwards HTTP requests to the app container, which responds with "Hello, World!"
- App Container (hello_app): Runs on port 5678 and responds with Hello, World! to any request.
- NGINX Container: Listens on port 80, forwards all requests to the app container, and serves responses from it.

## instructions
1- Replace thevars in the [main.tf](main.tf) file:
  -YOUR_GENERATED_PRIVATE_KEY_HERE
  -YOUR_GENERATED_CERTIFICATE_HERE
with a valid private key and certificate.

2- Ensures your Terraform configuration files are formatted properly.
```
terraform fmt
```

3- Initialize the Terraform project by running:
```
terraform init
```

4- validating your configuration before applying changes.
```
terraform plan
```

5- Apply the configuration:
```
terraform apply
```

6- Access the NGINX server http://<docker-host-ip> 



#### Anna Geryes
