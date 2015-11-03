
find.template <- function(dir, template){
  
  file.name <- sprintf("%s/%s.html", dir, template)
  
  if (file.exists(file.name))
    return(file.name)
  else {  
    if (basename(dir) == "Website") {
      return("NULL")
    } else {
      return(find.template(dirname(dir), template))
    }
  }
}

start.dir <- "/Users/matt/Dropbox/Code/Tools/R-Blog-Builder/Website/Template/topics/topic"
template <- "title"

find.template(start.dir, template)


