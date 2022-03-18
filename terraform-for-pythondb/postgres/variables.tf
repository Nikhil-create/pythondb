#--Project name
variable "project-name" {
    type= string
    description = "Project name"
}

#--Database Credentials
variable "db-cred" {
    type= map(string)
    description= "Database Credentials"
}

#--Database Name
variable "db-name" {
    type= string
    description = "Database Name"
}

#--Intance Type for Postgres Database
variable "instance_type" {
    type= string 
    description = "Intance type for database"
}

#--Disk size for instance
variable "disk_size" {
  description = "The size in GB of the disk used by the db"
  type        = number
}