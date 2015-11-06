  
apply.plain.text.from.file <- function(html,
                                       content.dir,
                                       file.name){
  
  pattern <- file_path_sans_ext(file.name)
  
  pattern <- sprintf("%%%s%%", pattern)
  
  library(tools)
  
  description.file <- find.file.in.templates(dir = content.dir,
                                             file.name = file.name)
  
  if (file.exists(description.file)) {
    
    desc.text <- readChar(description.file,
                          file.info(description.file)$size)
    
    html <- str_replace_all(string = html, 
                            pattern = pattern,
                            replacement = desc.text)
    
  } else {
    
    html <- str_replace_all(string = html, 
                            pattern = pattern,
                            replacement = "")
    
  }
  

  
  return(html)
  
}