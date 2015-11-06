
# Figures out directory and file locations
# for the topic we are working on

locations <- function(website.directory,
                      parent.topic.dir = NULL,
                      topic.dir = NULL){

  me <- list()
  
  # Get top most directories
  
  me$content.root.dir <- sprintf("%s/Website/Content/",
                            website.directory)
  me$template.root.dir <- sprintf("%s/Website/Template/",
                             website.directory)
  me$staged.root.dir <- sprintf("%s/Website/Staged/",
                           website.directory)
  
  # Get parent directories
  
  if (is.null(parent.topic.dir) == FALSE) {
    
    me$content.parent.dir <- sprintf("%s%s/",
                                     me$content.root.dir,
                                     parent.topic.dir)
    me$template.parent.dir <- sprintf("%stopics/",
                                     me$template.root.dir)
    me$staged.parent.dir <- sprintf("%s%s/",
                                   me$staged.root.dir,
                                   parent.topic.dir)
  }

  if (is.null(topic.dir) == FALSE) {
    
    if (is.null(parent.topic.dir) == FALSE) {
    
      me$content.topic.dir <- sprintf("%s%s/",
                                       me$content.parent.dir,
                                       topic.dir)
      me$template.topic.dir <- sprintf("%s%s/",
                                        me$template.parent.dir,
                                        "topic")
      me$staged.topic.dir <- sprintf("%s%s/",
                                      me$staged.parent.dir,
                                      topic.dir)

    } else {
      
      me$content.topic.dir <- sprintf("%s%s/",
                                      me$content.root.dir,
                                      topic.dir)
      me$template.topic.dir <- sprintf("%s%s/",
                                       me$template.root.dir,
                                       "topic")
      me$staged.topic.dir <- sprintf("%s%s/",
                                     me$staged.root.dir,
                                     topic.dir)
      
    }
    
  }
  
  return(me)
  
}
