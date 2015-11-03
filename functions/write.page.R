write.page <- function(template.dir,
                       staged.file,
                       ready.to.publish=FALSE){
    
  index <- readChar(template.dir,
                    file.info(index)$size)
  
  index <- apply.template(html = index,
                          template = "navigation.top",
                          template.dir = template.dir)
  
  index <- applyTemplate(html = index,
                         template = "title",
                         template.dir = template.dir)
  
  index <- applyTemplate(html = index,
                         template = "title.head",
                         template.dir = template.dir)
  
  index <- applyTemplate(html = index,
                         template = "content",
                         isMarkDown = TRUE,
                         template.dir = template.dir)
  
  if (ready.to.publish == TRUE)
    index <- applyTemplate(html = index,
                           template = "comments",
                           template.dir = template.dir)
  
  write(index, file = staged.file)

}
