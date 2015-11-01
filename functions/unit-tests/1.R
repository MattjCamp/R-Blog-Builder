
test.locations <- function(){
  
  source('functions/locations.R', echo = FALSE)
  
  website.directory <- "/temp"
  
  dirs <- locations(website.directory = website.directory,
                    parent.topic.dir = "blog",
                    topic.dir = "topic")
  
  checkEquals(target = dirs$content.root.dir,
              current = "/temp/Website/Content/")
  checkEquals(target = dirs$template.root.dir,
              current = "/temp/Website/Template/")  
  checkEquals(target = dirs$staged.root.dir,
              current = "/temp/Website/Staged/")
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
  checkEquals(target = dirs$content.topic.file,
              current = "/temp/Website/Content/blog/topic/content.md")
  checkEquals(target = dirs$staged.topic.file,
              current = "/temp/Website/Staged/blog/topic/index.html")
}
