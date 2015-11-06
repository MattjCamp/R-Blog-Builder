  
apply.content.markdown <- function(html,
                                   content.file,
                                   content.pattern = "%content%"){
  library(stringr)
  library(markdown)
  
  content <- renderMarkdown(file = content.file)
  pattern <- content.pattern

  html <- str_replace_all(string = html, 
                          pattern = pattern,
                          replacement = content)
  
  return(html)
  
}