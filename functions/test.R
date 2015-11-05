

library(stringr)

source('functions/locations.R', echo = FALSE)
source('functions/apply.template.R', echo = FALSE)
source('functions/find.template.R', echo = FALSE)
source('functions/find.file.in.templates.R', echo = FALSE)
source('functions/write.page.R', echo = FALSE)
source('functions/apply.content.markdown.R', echo = FALSE)

proj.dir <- getwd()
dirs <- locations(website.directory = proj.dir,
                  parent.topic.dir = "",
                  topic.dir = "")

write.page(template.dir = dirs$template.root.dir,
           staged.dir = dirs$staged.root.dir,
           content.file = dirs$content.root.file,
           include.comment.section = FALSE)
