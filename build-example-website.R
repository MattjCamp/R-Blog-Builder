source('render.R', echo=FALSE)

ready.to.publish <- TRUE


render(template = "blog/", "blog/")
render(template = "blog/blog-post/", topic = "blog/data-science-certificate-program/", ready.to.publish)
