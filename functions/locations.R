# Figures out directory and file locations
# for the topic we are working on

locations <- function(website.directory,
                      parent.topic.dir=NULL,
                      topic.dir=NULL){
  
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
  
  if (is.null(parent.topic.dir) == FALSE) {
    
    me$content.parent.dir <- sprintf("%s%s/",
                                     me$content.dir,
                                     parent.topic.dir)
    me$template.parent.dir <- sprintf("%s%s/",
                                     me$template.dir,
                                     parent.topic.dir)
    me$staged.parent.dir <- sprintf("%s%s/",
                                   me$staged.dir,
                                   parent.topic.dir)
    me$content.parent.file <- sprintf("%scontent.md",
                                      me$content.parent.dir)
    me$staged.parent.file <- sprintf("%sindex.html",
                                     me$staged.parent.dir)
  }

  if (is.null(topic.dir) == FALSE) {
    
    me$content.topic.dir <- sprintf("%s%s/",
                                     me$content.parent.dir,
                                     topic.dir)
    me$template.topic.dir <- sprintf("%s%s/",
                                      me$template.parent.dir,
                                      "post")
    me$staged.topic.dir <- sprintf("%s%s/",
                                    me$staged.parent.dir,
                                    topic.dir)
    me$content.topic.file <- sprintf("%scontent.md",
                                     me$content.topic.dir)
    me$staged.topic.file <- sprintf("%sindex.html",
                                    me$staged.topic.dir)
  }
  
  #TODO Add error handling to check and make sure the directories
  #     and files are all there
  
  class(me) <- append(class(me),"r.blog.builder.directory.locations")
  
  return(me)
  
}
