# Updates blog with new content

# Much of this will find it's way into a more reusable function

library(markdown)
library(stringr)

content.folder <- "more-code-please"
content.summary <- "I work on a computer that has many, many apps and frameworks and plug-ins that pump and bang and grind all night and day."
content.title <- "More Code Please"
content.image <- "code.jpg"

dir <- "/Users/matt/Code/Tools/Blog-Builder/Website/"
content.dir <- sprintf("/Users/matt/Dropbox/Writing/%s/", content.folder)
staged.dir <- paste(dir, "Staged/blog/", sep="")
template.dir.b <- paste(dir, "Template/blog/", sep="")
staged.dir.bp <- sprintf("%s%s/", staged.dir, content.folder)
content.image.filename <- sprintf("%simages/%s", content.dir, content.image)
staged.images.dir <- sprintf("%simages/", staged.dir.bp)
staged.image.filename <- sprintf("%s%s", staged.images.dir, content.image)
web.image.filename <- sprintf("%s/images/%s", content.folder, content.image)

applyTemplate <- function(html, template, isMarkDown = FALSE, template.dir, replacement = ""){
  
  if(replacement == ""){
    if (isMarkDown){
      t.file <- sprintf("%s%s.md", content.dir, template)
      content <- renderMarkdown(file = t.file)
    }else{
      t.file <- sprintf("%s%s.html", template.dir, template)
      content <- readChar(t.file, file.info(t.file)$size)
    }
  }else{
    content <- replacement
  }
  
  html <- str_replace_all(string = html, 
                          pattern = sprintf("%%%s%%", template),
                          replacement = content)
  
}

addBlogPost <- function(){
  
  template.dir.bp <- paste(template.dir.b, "blog-post/", sep="")
  
  index.t <- paste(template.dir.bp, "index.html", sep="")
  index <- readChar(index.t, file.info(index.t)$size) 
  
  index <- applyTemplate(index, "navigation.top", template.dir = template.dir.bp)
  index <- applyTemplate(index, "title.head", template.dir = template.dir.bp)
  index <- applyTemplate(index, "title", template.dir = template.dir.bp)
  index <- applyTemplate(index, "content", isMarkDown = TRUE, template.dir = template.dir.bp)
  
  if(!file.exists(staged.dir.bp)) {
    dir.create(path = staged.dir.bp, showWarnings = TRUE)
  }
  
  file.copy(from = sprintf("%s%s", template.dir.bp, "style.css"),
            to = sprintf("%s%s", staged.dir.bp, "style.css"))
  
  if(!file.exists(staged.images.dir)){
    dir.create(path = staged.images.dir, showWarnings = TRUE)
  }
  
  if(file.exists(content.image.filename)){
    #add file name replace here
    file.copy(from = content.image.filename,
              to = staged.image.filename)
  }
  
  write(index, file = paste(staged.dir.bp, "index.html", sep=""))
}

addBlogPost()

# update blog summary page
index.t <- paste(template.dir.b, "index.html", sep="")
index <- readChar(index.t, file.info(index.t)$size) 

blog.post.summary.t <- paste(template.dir.b, "blog.post.summary.html", sep="")
blog.post.summary <- readChar(blog.post.summary.t, file.info(index.t)$size) 

blog.post.summary <- str_replace_all(string = blog.post.summary, 
                                     pattern = "%content.folder%", 
                                     replacement = sprintf("%s/", content.folder))

blog.post.summary <- str_replace_all(string = blog.post.summary, 
                                     pattern = "%title%", 
                                     replacement = content.title)

blog.post.summary <- str_replace_all(string = blog.post.summary, 
                                     pattern = "%summary%", 
                                     replacement = content.summary)

blog.post.summary <- str_replace_all(string = blog.post.summary, 
                                     pattern = "%image%", 
                                     replacement = web.image.filename)

index <- applyTemplate(index, "navigation.top", template.dir = template.dir.b)
index <- applyTemplate(index, "title.head", template.dir = template.dir.b)
index <- applyTemplate(index, "title", template.dir = template.dir.b)
index <- applyTemplate(index, "blog.post.summary",
                       replacement = blog.post.summary)

#eventually will want to write out to a master "blog summary" file, for now just c and p
write(blog.post.summary, file = paste(staged.dir, "blog.post.summary.html", sep=""))


