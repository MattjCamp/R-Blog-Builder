
find.file.in.templates <- function(dir, file.name){
  
  full.file.name <- sprintf("%s/%s", dir, file.name)
  full.file.name <- str_replace_all(string = full.file.name,
                               pattern = "//",
                               replacement = "/")
  
  if (file.exists(full.file.name))
    return(full.file.name)
  else {  
    if (basename(dir) == "Website") {
      return("NULL")
    } else {
      return(find.file.in.templates(dirname(dir), file.name))
    }
  }
}


