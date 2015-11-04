  
apply.content.markdown <- function(html,
                                   content.file){
  library(stringr)
  library(markdown)
  
  content <- renderMarkdown(file = content.file)
  pattern <- "%content%"

  html <- str_replace_all(string = html, 
                          pattern = pattern,
                          replacement = content)
  
  return(html)
  
}