source('render.R', echo=FALSE)

render(template = "blog/", "blog/")
 
# blog posts

# render(template = "blog/blog-post/", topic = "blog/why-i-am-building-my-own-blog-engine/")

render(template = "notes/", topic = "notes/")

render(template = "notes/note/", topic = "notes/coursera/data-science/01-02-01-Command-Line-Interface/")

render(template = "blog/blog-post/", topic = "blog/data-science-certificate-program/")