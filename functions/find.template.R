
find.template <- function(dir, template){
  
  file.name <- sprintf("%s/%s.html", dir, template)
  file.name <- str_replace_all(string = file.name,
                               pattern = "//",
                               replacement = "/")
  
  if (file.exists(file.name))
    return(file.name)
  else {  
    if (basename(dir) == "Website") {
      return(NA)
    } else {
      return(find.template(dirname(dir), template))
    }
  }
}


