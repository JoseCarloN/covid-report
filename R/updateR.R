library(git2r)

# Renders the html to update
rmarkdown::render(input = "Casos-vacunados-raros.Rmd", output_file = "../html/index.html")

# Adds all the files for a new commit
add(repo = "./", path = ".")

# Checks the status of the repo
status("./")

# Commits
commit(repo = "./", message = "updated to most recent")

# Push the commit
push()