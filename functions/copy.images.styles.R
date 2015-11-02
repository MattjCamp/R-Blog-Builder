copy.images.styles <- function(locations){

  # Root
  
  if (file.exists(locations$content.root.images.dir)) {
    file.copy(from = sprintf("%s%s", content.images.dir,
                             list.files(path = locations$content.root.images.dir)),
              to = locations$staged.root.images.dir,
              overwrite = TRUE)
  }
  
  file.copy(from = sprintf("%s%s", locations$template.root.dir, "style.css"),
            to = sprintf("%s%s", locations$staged.root.dir, "style.css"))

}
