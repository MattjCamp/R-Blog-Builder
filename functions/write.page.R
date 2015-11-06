
write.page <- function(template.dir,
                       staged.dir,
                       content.dir,
                       include.comment.section = FALSE){
  
  # Build directories if needed
  
  if (!file.exists(staged.dir))
    dir.create(path = staged.dir,
               showWarnings = TRUE,
               recursive = TRUE)
  
  staged.images.dir <- sprintf("%simages",
                           staged.dir)
  
  if (!file.exists(staged.images.dir))
    dir.create(path = staged.images.dir,
               showWarnings = TRUE,
               recursive = TRUE)
  
  # Copy Images
  
  content.images.dir <- sprintf("%simages",
                               content.dir)
  
  if (file.exists(content.images.dir)) {
    file.copy(from = sprintf("%s/%s",
                             content.images.dir,
                             list.files(path = content.images.dir)),
              to = staged.images.dir,
              overwrite = TRUE)
  }

  # Copy Styles
  
  file.copy(from = find.file.in.templates(dir = template.dir,
                                          file.name = "style.css"),
            to = sprintf("%s%s", staged.dir, "style.css"),
            overwrite = TRUE)
  
  # Compose page
  
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
  
  index <- apply.template(html = index,
                          template = "sidebar.newsletter",
                          template.dir = template.dir)
  
  index <- apply.template(html = index,
                          template = "bottom.bar",
                          template.dir = template.dir)
  
  content.file <- sprintf("%scontent.md",
                          content.dir)
  
  if (file.exists(content.file))
    index <- apply.content.markdown(html = index,
                                    content.file = content.file)
  else
    index <- apply.template(html = index,
                            template = "content",
                            content.to.add  = sprintf("Add content to %s markdown file.",
                                                  content.file))
  
  index <- apply.template(html = index,
                          template = "content.image",
                          content.to.add  = basename(content.dir))
  
  if (include.comment.section == TRUE)
    index <- apply.template(html = index,
                            template = "comments",
                            template.dir = template.dir)
  
  staged.file <- sprintf("%sindex.html",
                         staged.dir)
  
  write(index, file = staged.file)

}