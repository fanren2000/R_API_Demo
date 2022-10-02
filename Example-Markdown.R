
#* @serializer contentType list(type="application/html")
#* @get /test
function(res){
  
  include_rmd("test.Rmd", res)
}

#* @serializer contentType list(type="text/html; charset=utf-8")
#* @get /html
function(team){
  tmp <- tempfile()
  #tmp <- "C:/Projects/R/First R API/Team-Quarterly.html"
  
  #rmarkdown::render("Team-Quarterly.Rmd", tmp, output_format = "html_document",
  #       params = list(team = team))
  
  render("Team-Quarterly.Rmd", tmp, output_format = "html_document",
                    params = list(team = team))
  
  #readBin(tmp, "raw", n=file.info(tmp)$size)
  #readBin(tmp, "character()", n=file.info(tmp)$size)
  readBin(paste0(tmp, ".html"), "raw", n=file.info(paste0(tmp, ".html"))$size)
}

#* @serializer contentType list(type="application/vnd.openxmlformats-officedocument.wordprocessingml.document")
#* @get /word
function(team){
  tmp <- tempfile()
  #tmp <- "Fan_Ren_Word"
  render("test-report-WORD.Rmd", tmp, output_format = "word_document",
         params = list(team = team))
  
  readBin(paste0(tmp, ".docx"), "raw", n=file.info(paste0(tmp, ".docx"))$size)
}


