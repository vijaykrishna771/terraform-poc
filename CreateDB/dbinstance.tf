variable "project" {}
variable "region" {}
provider "google" {
project = "${var.project}"
region = "${var.region}"
}
resource "google_sql_database_instance" "testdb" {
name = "testdb"
database_version = "MYSQL_5_7"
region = "${var.region}"
settings {
tier = "db-n1-standard-2"
}
}
resource "google_sql_database" "database" {
name = "database_name"
instance = "${google_sql_database_instance.testdb.name}"
}

resource "google_sql_user" "users" {
name = "root"
instance = "${google_sql_database_instance.testdb.name}"
password = "password"
}
