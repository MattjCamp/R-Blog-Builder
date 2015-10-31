directory.locations <- function(parent.directory){
  
  library(stringr)

  me <- list()

  me$content.dir <- sprintf("%s/Website/Content/", getwd())
  me$template.dir <- sprintf("%s/Website/Template/", getwd())
  me$staged.dir <- sprintf("%s/Website/Staged/", getwd())
  me$content.dir <- sprintf("%s%s/", content.dir, topic)
  me$template.dir <- sprintf("%s%s/", template.dir, template)
  me$staged.dir <- sprintf("%s%s/", staged.dir, topic)
  me$content.dir <- str_replace_all(string = content.dir, pattern = "//", replacement = "/")
  me$staged.dir <- str_replace_all(string = staged.dir, pattern = "//", replacement = "/")
  me$content.file <- sprintf("%s%s", content.dir, "content.md")
  me$staged.file <- sprintf("%s%s", staged.dir, "index.html")
  
  class(me) <- append(class(me),"r.blog.builder.directory.locations")
  
  return(me)
  
}
