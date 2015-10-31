# Figures out directory and file locations
# for the topic we are working on

directory.locations <- function(website.directory,
                                parent.topic=NULL,
                                topic=NULL){
  
  library(stringr)

  me <- list()
  
  # Get top most directories
  
  me$content.dir <- sprintf("%s/Website/Content/",
                            website.directory)
  me$template.dir <- sprintf("%s/Website/Template/",
                             website.directory)
  me$staged.dir <- sprintf("%s/Website/Staged/",
                           website.directory)
  
  # Get parent directories
  
#   me$content.dir <- sprintf("%s%s/", me$content.dir, topic)
#   me$template.dir <- sprintf("%s%s/", me$template.dir, template)
#   me$staged.dir <- sprintf("%s%s/", me$staged.dir, topic)
#   
#   me$content.dir <- str_replace_all(string = me$content.dir, pattern = "//", replacement = "/")
#   me$staged.dir <- str_replace_all(string = me$staged.dir, pattern = "//", replacement = "/")
#   
#   
#   me$content.file <- sprintf("%s%s", me$content.dir, "content.md")
#   me$staged.file <- sprintf("%s%s", me$staged.dir, "index.html")
  
  class(me) <- append(class(me),"r.blog.builder.directory.locations")
  
  return(me)
  
}
