source('render.R', echo=FALSE)

# Blog Posts

render(template = "blog/", "blog/")
render(template = "blog/blog-post/", topic = "blog/data-science-certificate-program/")

# Notes

render(template = "notes/", topic = "notes/")
render(template = "notes/note/", topic = "notes/coursera/data-science/01-02-01-Command-Line-Interface/")

