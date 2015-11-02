create.locations <- function(locations){

library(stringr)

  # Root
  
  if (!file.exists(locations$staged.root.dir))
    dir.create(path = locations$staged.root.dir,
               showWarnings = TRUE)
  
  if (!file.exists(locations$staged.root.images.dir))
    dir.create(path = locations$staged.root.images.dir,
               showWarnings = TRUE)

  # Parent
  
  if (is.null(locations$staged.parent.dir) == FALSE) {
  
    if (!file.exists(locations$staged.parent.dir))
      dir.create(path = locations$staged.parent.dir,
                 showWarnings = TRUE)
    
    if (!file.exists(locations$staged.parent.images.dir))
      dir.create(path = locations$staged.parent.images.dir,
                 showWarnings = TRUE)
    
  }

  # Topic
  
  if (is.null(locations$staged.topic.dir) == FALSE) {
    
    if (!file.exists(locations$staged.topic.dir))
      dir.create(path = locations$staged.root.dir,
                 showWarnings = TRUE)
    
    if (!file.exists(locations$staged.topic.images.dir))
      dir.create(path = locations$staged.topic.images.dir,
                 showWarnings = TRUE)
    
  }
  
}
