source('render.R', echo=FALSE)

render(template = "blog/", "blog/")
render(template = "blog/blog-post/", topic = "blog/i-just-dont-know-what-data-science-is-do-you/")

# render(template = "notes/", topic = "notes/")
# render(template = "notes/note/", topic = "notes/coursera/data-science/01-02-01-Command-Line-Interface/")
