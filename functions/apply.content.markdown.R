  
apply.content.markdown <- function(html,
                                   content.file,
                                   content.pattern = "%content%"){
  library(stringr)
  library(markdown)
  
  content <- renderMarkdown(file = content.file)
  pattern <- content.pattern

  html <- gsub(x = html, 
               pattern = pattern,
               replacement = content)
  
  
  return(html)
  
}