
# BUILDS ONE PAGE ON A WEBSITE
# SUBSTITUTES CONTENT.MD INTO MAIN CONTENT AREA

write.page <- function(template.dir,
                       staged.dir,
                       content.dir,
                       include.comment.section = FALSE){
  
  # BUILD DIRECTORIES
  
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
  
  # IMAGES
  
  content.images.dir <- sprintf("%simages",
                               content.dir)
  
  if (file.exists(content.images.dir)) {
    file.copy(from = sprintf("%s/%s",
                             content.images.dir,
                             list.files(path = content.images.dir)),
              to = staged.images.dir,
              overwrite = TRUE)
  }
  
  # CSS FILE
  
  css.file <- sprintf("%s%s", content.dir, "style.css")
  
  if (!file.exists(css.file))
    css.file <- find.file.in.templates(dir = template.dir,
                                       file.name = "style.css")
  
  file.copy(from = css.file,
            to = sprintf("%s%s", staged.dir, "style.css"),
            overwrite = TRUE)
  
  # REPLACE BLOCKS OF HTML IN INDEX FROM HTML FILES
  # LOCATED IN THE MATCHING TEMPLATE DIRECTORY
  
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
  
  # TRANSFORM CONTENT FROM CONTENT.MD AND PASTE INTO
  # INDEX.HTML FILE
  
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
  
  # ADD MAIN IMAGE AUTOMATICALLY
  
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
  
  # COPY META TAG CONTENT FROM TXT FILES LOCATED
  # IN THE CONTENT DIRECTORY
  
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
  
  # PASTE CODE NEEDED FOR DISCUS COMMENTS
  
  if (include.comment.section == TRUE)
    index <- apply.template(html = index,
                            template = "comments",
                            template.dir = template.dir)
  
  staged.file <- sprintf("%sindex.html",
                         staged.dir)
  
  write(index, file = staged.file)

}
