render <- function(template, topic){

library(stringr)
library(markdown)

# folder locations --------------------------------------------------------

content.dir <- sprintf("%s/Website/Content/", getwd())
template.dir <- sprintf("%s/Website/Template/", getwd())
staged.dir <- sprintf("%s/Website/Staged/", getwd())
content.dir <- sprintf("%s%s/", content.dir, topic)
template.dir <- sprintf("%s%s/", template.dir, template)
staged.dir <- sprintf("%s%s/", staged.dir, topic)
content.dir <- str_replace_all(string = content.dir, pattern = "//", replacement = "/")
staged.dir <- str_replace_all(string = staged.dir, pattern = "//", replacement = "/")
content.file <- sprintf("%s%s", content.dir, "content.md")
staged.file <- sprintf("%s%s", staged.dir, "index.html")

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

# create supporting files and folders

staged.images.dir <- sprintf("%simages/", staged.dir)
content.images.dir <- sprintf("%simages/", content.dir)
  
if(!file.exists(staged.dir)) {
  dir.create(path = staged.dir, showWarnings = TRUE)
}

if(!file.exists(staged.images.dir)) {
  dir.create(path = staged.images.dir, showWarnings = TRUE)
}

if(file.exists(content.images.dir)){
  file.copy(from = sprintf("%s%s", content.images.dir, list.files(path=content.images.dir)),
            to = staged.images.dir,
            overwrite = TRUE)
}

file.copy(from = sprintf("%s%s", template.dir, "style.css"),
          to = sprintf("%s%s", staged.dir, "style.css"))

# create page ------------------------------------------------------------------

index <- paste(template.dir, "index.html", sep="")
index <- readChar(index, file.info(index)$size)
index <- applyTemplate(index, "navigation.top", template.dir = template.dir)
index <- applyTemplate(index, "title", template.dir = template.dir)
index <- applyTemplate(index, "title.head", template.dir = template.dir)
index <- applyTemplate(index, "content", isMarkDown = TRUE, template.dir = template.dir)

write(index, file = staged.file)

}
