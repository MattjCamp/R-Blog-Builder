

library(stringr)

source('functions/locations.R', echo = FALSE)
source('functions/apply.template.R', echo = FALSE)
source('functions/find.template.R', echo = FALSE)
source('functions/find.file.in.templates.R', echo = FALSE)
source('functions/write.page.R', echo = FALSE)
source('functions/apply.content.markdown.R', echo = FALSE)

proj.dir <- getwd()
dirs <- locations(website.directory = proj.dir,
                  parent.topic.dir = "topics",
                  topic.dir = "topic")

write.page(template.dir = dirs$template.root.dir,
           staged.dir = dirs$staged.root.dir,
           content.dir = dirs$content.root.dir,
           include.comment.section = FALSE)


write.page(template.dir = dirs$template.topic.dir,
           staged.dir = dirs$staged.topic.dir,
           content.dir = dirs$content.topic.dir,
           include.comment.section = FALSE)
