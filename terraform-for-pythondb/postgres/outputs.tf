output "project-name" {
  description = "Project Name"
  value= var.project-name
}

output "db-cred" {
    description= "Database Credentials"
    value=var.db-cred
}

output "db-name" {
    value= var.db-name
    description = "Database Name"
}

#--Intance Type for Postgres Database
output "instance_type" {
    value= var.instance_type
    description = "Intance type for database"
}

#--Disk size for instance
ouput "disk_size" {
  description = "The size in GB of the disk used by the db"
  value= var.disk-size
}