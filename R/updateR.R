library(git2r)

# Adjust the date of the report acordingly 
fecha_reporte = Sys.Date() - 1

# Renders the html to update
rmarkdown::render(input = "Casos-vacunados-raros.Rmd", params = list(
    report_date = fecha_reporte
  ), 
  output_file = "../html/index.html")


# Login credentials
credentials = cred_ssh_key(
  publickey = "../secrets/key.pub",
  privatekey = "../secrets/key"
)


# Repo config
config(repo = "../html", global = TRUE, user.name = "ghostdoggie1", user.email = "josephnavarrete2@gmail.com")

# Checks the status of the repo before adding files
status(repo = "../html")

# Adds all the files for a new commit
add(repo = "../html", path = ".")

# Checks the status of the repo after adding files
status(repo = "../html")

# Commits
commit(repo = "../html", message = "updated to most recent")

# Push the commit
push(object = "../html", name = "origin", refspec = "main", credentials = credentials)
