source('render.R', echo=FALSE)

render(template = "blog/", "blog/")
 
# blog posts

render(template = "blog/blog-post/", topic = "blog/why-i-am-building-my-own-blog-engine/")
