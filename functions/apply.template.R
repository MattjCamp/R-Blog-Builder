
apply.template <- function(html,
                           template,
                           isMarkDown = FALSE,
                           template.dir,
                           replacement = ""){
  library(stringr)
  library(markdown)
  
  if (replacement == "") {
    if (isMarkDown) {
      t.file <- sprintf("%s%s.md", content.dir, template)
      content <- renderMarkdown(file = t.file)
      pattern <- "%content%"
    } else {
      t.file <- sprintf("%s%s.html", template.dir, template)
      content <- readChar(t.file, file.info(t.file)$size)
      pattern <- sprintf("%%%s%%", template)
    }
  }else{
    content <- replacement
    pattern <- sprintf("%%%s%%", template)
  }
  
  html <- str_replace_all(string = html, 
                          pattern = pattern,
                          replacement = content)
  
}