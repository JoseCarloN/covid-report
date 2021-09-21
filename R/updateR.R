library(git2r)

rmarkdown::render(input = "Casos-vacunados-raros.Rmd", output_file = "second.html")

add(repo = "./", path = ".")
status("./")
commit(repo = "./", all = TRUE, message = "updated to most recent")
