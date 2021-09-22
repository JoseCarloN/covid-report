library(git2r)
library(glue)

# Adjust the date of the report acordingly 
fecha_reporte = Sys.Date()
format_fecha = format(fecha_reporte, "%B %d")

# Renders the html to update
rmarkdown::render(input = "Casos-vacunados-raros.Rmd", params = list(
    report_date = fecha_reporte
  ), 
  output_file = "../html/index.html")


# Login credentials
credentials = cred_ssh_key(
  publickey = "C:/Users/jose.navarrete/.ssh/id_rsa.pub",
  privatekey = "C:/Users/jose.navarrete/.ssh/id_rsa"
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
commit(repo = "../html", message = glue("updated {format_fecha}"))

# Push the commit
push(object = "../html", name = "origin", refspec = "refs/heads/main", credentials = credentials)
