
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

  # Copy Styles, Sitemaps
  
  file.copy(from = find.file.in.templates(dir = template.dir,
                                          file.name = "style.css"),
            to = sprintf("%s%s", staged.dir, "style.css"),
            overwrite = TRUE)

  file.copy(from = find.file.in.templates(dir = template.dir,
                                          file.name = "sitemap.xml"),
            to = sprintf("%s%s", staged.dir, "sitemap.xml"),
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
                          template = "disclosures",
                          template.dir = template.dir)
  
  # Fill in markdown content
  
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
  
  # Put title image in
  
  real.image.file.name <- NULL
  
  test.file.name <- sprintf("%simages/%s.jpg",
                            content.dir,
                            basename(content.dir))
  
  if (file.exists(test.file.name))
    real.image.file.name <- sprintf("images/%s.jpg",
                                    basename(content.dir))
  
  test.file.name <- sprintf("%simages/%s.png",
                            content.dir,
                            basename(content.dir))
  
  if (file.exists(test.file.name))
    real.image.file.name <- sprintf("images/%s.png",
                                    basename(content.dir))
  
  if (!is.null(real.image.file.name)) {
  
    insert.image <- sprintf("<p><img  id='image_title' src = '%s' alt = '%s'></p>",
                            real.image.file.name,
                            basename(content.dir))
    
    index <- apply.template(html = index,
                            template = "content.image",
                            content.to.add  = insert.image)
  } else {
    
    index <- apply.template(html = index,
                            template = "content.image",
                            content.to.add  = "")
    
  }
  
  # Add Meta Tags
  
  index <- apply.plain.text.from.file(html = index,
                                      content.dir = content.dir,
                                      file.name = "author.txt")
  
  index <- apply.plain.text.from.file(html = index,
                                      content.dir = content.dir,
                                      file.name = "description.txt")
  
  index <- apply.plain.text.from.file(html = index,
                                      content.dir = content.dir,
                                      file.name = "keywords.txt")
  
  index <- apply.plain.text.from.file(html = index,
                                      content.dir = content.dir,
                                      file.name = "title.head.txt")
  
  if (include.comment.section == TRUE)
    index <- apply.template(html = index,
                            template = "comments",
                            template.dir = template.dir)
  
  staged.file <- sprintf("%sindex.html",
                         staged.dir)
  
  write(index, file = staged.file)

}
