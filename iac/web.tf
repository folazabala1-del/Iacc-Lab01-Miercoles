resource "docker_network" "net" {
  name = "lab-net-${terraform.workspace}"
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}-01"
  image = "lab/web"

   ports {
    internal = "80"
    external = var.web_port[terraform.workspace]
  }
}

resource "docker_container" "api" {
  name  = "api-${terraform.workspace}-01"
  image = "lab/api"

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }

  env = [
    "DB_HOST=db-${terraform.workspace}",
    "DB_USER=root",
    "DB_PASSWORD=123456",
    "DB_NAME=testdb"
  ]

  networks_advanced {
    name = docker_network.net.name
  }

  depends_on = [docker_container.db]
}

//BaseDatos

resource "docker_container" "db" {
  name  = "db-${terraform.workspace}"
  image = "mysql:8.0.45-oraclelinux9"

  env = [
    "MYSQL_ROOT_PASSWORD=123456",
    "MYSQL_DATABASE=testdb"
  ]

  networks_advanced {
    name = docker_network.net.name
  }
}