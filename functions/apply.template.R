  
apply.template <- function(html,
                           template,
                           template.dir,
                           replacement = ""){
  library(stringr)
  
  if (replacement == "") {
    t.file <- find.template(dir = template.dir,
                            template = template)
    content <- readChar(t.file, file.info(t.file)$size)
    pattern <- sprintf("%%%s%%", template)
  }else{
    content <- replacement
    pattern <- sprintf("%%%s%%", template)
  }
  
  html <- str_replace_all(string = html, 
                          pattern = pattern,
                          replacement = content)
  
  return(html)
  
}