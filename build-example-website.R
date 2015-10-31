source('render.R', echo=FALSE)

ready.to.publish <- TRUE

# Home Page

render(template = "blog/", "blog/")

# Blog Posts

render(template = "blog/", "blog/")
render(template = "blog/blog-post/", topic = "blog/data-science-certificate-program/", ready.to.publish)
render(template = "blog/blog-post/", topic = "blog/guys-im-debating-a-reboot/", ready.to.publish)
render(template = "blog/blog-post/", topic = "blog/tasting-notes-4-developer-kickoff/", ready.to.publish)
render(template = "blog/blog-post/", topic = "blog/how-to-make-an-iphone-app/", ready.to.publish)
render(template = "blog/blog-post/", topic = "blog/designing-tasting-notes/", ready.to.publish)

# Notes

render(template = "notes/", topic = "notes/", ready.to.publish)
render(template = "notes/note/", topic = "notes/coursera/data-science/01-02-01-Command-Line-Interface/", ready.to.publish)

