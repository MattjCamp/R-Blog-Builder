
library(stringr)

source('functions/locations.R', echo = FALSE)
source('functions/apply.template.R', echo = FALSE)
source('functions/find.template.R', echo = FALSE)
source('functions/find.file.in.templates.R', echo = FALSE)
source('functions/write.page.R', echo = FALSE)
source('functions/apply.content.markdown.R', echo = FALSE)

test.locations <- function(){
  
  dirs <- locations(website.directory = "/temp",
                    parent.topic.dir = "blog",
                    topic.dir = "topic")
  
  checkEquals(target = dirs$content.root.dir,
              current = "/temp/Website/Content/")
  checkEquals(target = dirs$template.root.dir,
              current = "/temp/Website/Template/")  
  checkEquals(target = dirs$staged.root.dir,
              current = "/temp/Website/Staged/")
  checkEquals(target = dirs$content.root.images.dir,
              current = "/temp/Website/Content/images")
  checkEquals(target = dirs$staged.root.images.dir,
              current = "/temp/Website/Staged/images")
  checkEquals(target = dirs$content.root.file,
              current = "/temp/Website/Content/content.md")
  checkEquals(target = dirs$staged.root.file,
              current = "/temp/Website/Staged/index.html")
  
  # Parent Topic
  
  checkEquals(target = dirs$content.parent.dir,
              current = "/temp/Website/Content/blog/")
  checkEquals(target = dirs$template.parent.dir,
              current = "/temp/Website/Template/topics/")  
  checkEquals(target = dirs$staged.parent.dir,
              current = "/temp/Website/Staged/blog/")              
  checkEquals(target = dirs$content.parent.images.dir,
              current = "/temp/Website/Content/blog/images")
  checkEquals(target = dirs$staged.parent.images.dir,
              current = "/temp/Website/Staged/blog/images")
  checkEquals(target = dirs$content.parent.file,
              current = "/temp/Website/Content/blog/content.md")
  checkEquals(target = dirs$staged.parent.file,
              current = "/temp/Website/Staged/blog/index.html")
  
  # Topic
  
  checkEquals(target = dirs$content.topic.dir,
              current = "/temp/Website/Content/blog/topic/")
  checkEquals(target = dirs$template.topic.dir,
              current = "/temp/Website/Template/topics/topic/")  
  checkEquals(target = dirs$staged.topic.dir,
              current = "/temp/Website/Staged/blog/topic/")
  checkEquals(target = dirs$content.topic.images.dir,
              current = "/temp/Website/Content/blog/topic/images")
  checkEquals(target = dirs$staged.topic.images.dir,
              current = "/temp/Website/Staged/blog/topic/images")
  checkEquals(target = dirs$content.topic.file,
              current = "/temp/Website/Content/blog/topic/content.md")
  checkEquals(target = dirs$staged.topic.file,
              current = "/temp/Website/Staged/blog/topic/index.html")
  
}

test.locations.with.missing <- function(){
  
  dirs <- locations(website.directory = "/temp",
                    parent.topic.dir = NULL,
                    topic.dir = "about")
  
  checkEquals(target = dirs$content.root.dir,
              current = "/temp/Website/Content/")
  
  checkEquals(target = dirs$content.topic.dir,
              current = "/temp/Website/Content/about/")
  checkEquals(target = dirs$template.topic.dir,
              current = "/temp/Website/Template/topic/")
  checkEquals(target = dirs$staged.topic.dir,
              current = "/temp/Website/Staged/about/")
  
}

test.apply.template <- function(){
  
  dirs <- locations(website.directory = getwd(),
                    parent.topic.dir = "blog",
                    topic.dir = "hello-world")
  
  html.text <- "Top Part %title.head%"
  
  index <- apply.template(html = html.text,
                          template = "title.head",
                          template.dir = dirs$template.topic.dir)
  
  checkEquals(target = index,
              current = "Top Part <title>A Blog @ blog.com</title>")
}

test.find.template <- function(){
  
  dirs <- locations(website.directory = getwd(),
                    parent.topic.dir = "blog",
                    topic.dir = "topic")
  
  template <- "title.head"
  
  checkEquals(find.template(dirs$template.topic.dir, template),
              "/Users/matt/Dropbox/Code/Tools/R-Blog-Builder/Website/Template/title.head.html")
  
  # Test root
  
  dirs <- locations(website.directory = getwd(),
                    parent.topic.dir = "",
                    topic.dir = "")
  
  checkEquals(find.template(dirs$template.root.dir, template),
              "/Users/matt/Dropbox/Code/Tools/R-Blog-Builder/Website/Template/title.head.html")
  
}

test.write.page <- function(){
  
  proj.dir <- getwd()
  dirs <- locations(website.directory = proj.dir,
                    parent.topic.dir = "blog",
                    topic.dir = "blog-post")
  
  write.page(template.dir = dirs$template.root.dir,
             staged.dir = dirs$staged.root.dir,
             content.dir = dirs$content.root.dir,
             include.comment.section = FALSE)
  
  
  write.page(template.dir = dirs$template.topic.dir,
             staged.dir = dirs$staged.topic.dir,
             content.dir = dirs$content.topic.dir,
             include.comment.section = FALSE)
}
