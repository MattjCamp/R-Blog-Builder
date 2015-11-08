  
apply.template <- function(html,
                           template,
                           template.dir = NULL,
                           content.to.add = ""){
  library(stringr)
  
  if (!is.null(template.dir)) {
    t.file <- find.template(dir = template.dir,
                            template = template)
    if (!is.na(t.file)) {
      content <- readChar(t.file, file.info(t.file)$size)
      pattern <- sprintf("%%%s%%", template)
    } else {
      content <- ""
      pattern <- sprintf("%%%s%%", "")
    }
  }else{
    content <- content.to.add
    pattern <- sprintf("%%%s%%", template)
  }
  
  html <- str_replace_all(string = html, 
                          pattern = pattern,
                          replacement = content)
  
  return(html)
  
}