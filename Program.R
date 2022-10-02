library(plumber)
library(rmarkdown)
r <- plumb("Example-Markdown.R")
r$run(port=8080)
