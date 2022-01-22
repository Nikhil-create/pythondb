#--Service Account IDs
variable "name" {
    type= map(string)
    describe= "Service Account IDs"
}

#--Project name
variable "project-name" {
    type= string
    description = "Project name"
}