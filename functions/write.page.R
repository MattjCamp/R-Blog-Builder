
source('functions/apply.template.R', echo = FALSE)
source('functions/find.template.R', echo = FALSE)
source('functions/apply.content.markdown.R', echo = FALSE)

write.page <- function(template.dir,
                       staged.dir,
                       content.file,
                       include.comment.section = FALSE){
  
  page.template <- find.template(dir = template.dir, 
                                 template = "index")
    
  index <- readChar(page.template,
                    file.info(page.template)$size)
  
  index <- apply.template(html = index,
                          template = "navigation.top",
                          template.dir = template.dir)
  
  index <- apply.template(html = index,
                         template = "title",
                         template.dir = template.dir)
  
  index <- apply.template(html = index,
                         template = "title.head",
                         template.dir = template.dir)
  
  index <- apply.content.markdown(html = index,
                                  content.file = content.file)
  
  if (include.comment.section == TRUE)
    index <- apply.template(html = index,
                            template = "comments",
                            template.dir = template.dir)
  
  staged.file <- sprintf("%s%s", staged.dir, "index.html")
  
  write(index, file = staged.file)

}
