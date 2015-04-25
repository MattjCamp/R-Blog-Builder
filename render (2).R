render <- function(template, topic){

library(stringr)
library(markdown)

# folder locations --------------------------------------------------------

content.dir <- "C:/Users/mcampbell/Analysis/Projects/Visualizations/00-Notes/viz-note-rendering/content/"
template.dir <- "C:/Users/mcampbell/Analysis/Projects/Visualizations/00-Notes/viz-note-rendering/template/"
staged.dir <- "I:/Visualization/"
content.dir <- sprintf("%s%s/", content.dir, topic)
template.dir <- sprintf("%s%s/", template.dir, template)
staged.dir <- sprintf("%s%s/", staged.dir, topic)
content.dir <- str_replace_all(string = content.dir, pattern = "//", replacement = "/")
staged.dir <- str_replace_all(string = staged.dir, pattern = "//", replacement = "/")
content.file <- sprintf("%s%s", content.dir, "readme.md")
staged.file <- sprintf("%s%s", staged.dir, "readme.html")

# functions ---------------------------------------------------------------

applyTemplate <- function(html, template, isMarkDown = FALSE, template.dir, replacement = ""){
  
  if(replacement == ""){
    if (isMarkDown){
      t.file <- sprintf("%s%s.md", content.dir, template)
      content <- renderMarkdown(file = t.file)
      pattern <- "%content%"
    }else{
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

# create page ------------------------------------------------------------------

index <- paste(template.dir, "index.html", sep="")
index <- readChar(index, file.info(index)$size)
index <- applyTemplate(index, "navigation.top", template.dir = template.dir)
index <- applyTemplate(index, "readme", isMarkDown = TRUE, template.dir = template.dir)

write(index, file = staged.file)

}
