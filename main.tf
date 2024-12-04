provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Variables for flexibility
variable "nginx_port" {
  default = 80
  description = "External port for the NGINX load balancer."
}

variable "app_port" {
  default = 5003
  description = "Port for the Hello World app."
}

# Pull NGINX Image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Pull App Image
resource "docker_image" "hello_app" {
  name = "hashicorp/http-echo:latest"
}

# App Container
resource "docker_container" "hello_app" {
  name  = "hello_app"
  image = docker_image.hello_app.latest
  ports {
    internal = var.app_port
    external = var.app_port
  }

  env = [
    "TEXT=Hello, World!"
  ]
}

# NGINX Configuration
resource "local_file" "nginx_config" {
  filename = "nginx.conf"
  content  = <<EOF
events {}

http {
  upstream app {
    server hello_app:5003};
  }

  server {
    listen 80;

    location / {
      proxy_pass http://app;
    }
  }
}
EOF
}

# NGINX Container
resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.latest

  ports {
    internal = 80
    external = var.nginx_port
  }

  volumes {
    host_path      = "nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
  }
}

