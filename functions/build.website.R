
build.website <- function(){
  
  proj.dir <- getwd()
  
  # Build Website
  
  dirs <- locations(website.directory = proj.dir)
  
  # Root
  
  write.page(template.dir = dirs$template.root.dir,
             staged.dir = dirs$staged.root.dir,
             content.dir = dirs$content.root.dir,
             include.comment.section = FALSE)
  
  # FAQ Page
  
  dirs <- locations(website.directory = proj.dir,
                    parent.topic.dir = "faq",
                    topic.dir = "faq")
  
  # Point to different template directory for FAQ
  
  faq.template.dir <- sprintf("%s/Website/Template/faq/", proj.dir)
  
  write.page(template.dir = faq.template.dir,
             staged.dir = dirs$staged.parent.dir,
             content.dir = dirs$content.parent.dir,
             include.comment.section = FALSE)
  
  # Blog
  
  dirs <- locations(website.directory = proj.dir,
                    parent.topic.dir = "blog",
                    topic.dir = "blog-post")
  
  # Blog Parent
  
  write.page(template.dir = dirs$template.parent.dir,
             staged.dir = dirs$staged.parent.dir,
             content.dir = dirs$content.parent.dir,
             include.comment.section = FALSE)
  
  # Blog Post
  
  write.page(template.dir = dirs$template.topic.dir,
             staged.dir = dirs$staged.topic.dir,
             content.dir = dirs$content.topic.dir,
             include.comment.section = FALSE)
}