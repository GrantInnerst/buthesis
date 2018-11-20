#' Create a directory that contains the proper Baylor Statistical Science thesis knitr template
#'
#' This function creates a specified directory and populates the directory with the knitr template.
#'
#' @param direc path to a directory where the template will reside. If the directory does not exist, the function will create it.
#' @return nothing
#' @export create_knitr_thesis


create_knitr_thesis <- function(direc) {
  # find the template on your file system
  current_template_loc <-
    system.file("knitr_template", package = "buthesis")

  # if the directory does not exist, create it!

  if(!dir.exists(direc)) {
    dir.create(direc)
  }

  # copy the files to the new directory
  did_copy <-
    capture.output(file.copy(list.files(current_template_loc, full.names = T), direc))

  # error checking for copying process

  # process captured output from file.copy
  did_copy <- unlist(strsplit(did_copy, " "))

  if (all(did_copy[-1] == "TRUE")) {
    message("Template copied succesfully")
  } else {
    message(
      "Template may not have been copied successfully. Please make sure your directory
      matches the template on GitHub found at https://github.com/GrantInnerst/buthesis"
    )
  }
}


#' Create a directory that contains the proper Baylor Statistical Science thesis latex template
#'
#' This function creates a specified directory and populates the directory with the latex template.
#'
#' @param direc path to a directory where the template will reside. If the directory does not exist, the function will create it.
#' @return nothing
#' @export create_latex_thesis

create_latex_thesis <- function(direc) {
  # find the template on your file system
  current_template_loc <-
    system.file("latex_template", package = "buthesis")

  # if the directory does not exist, create it!

  if(!dir.exists(direc)) {
    dir.create(direc)
  }

  # copy the files to the new directory
  did_copy <-
    capture.output(file.copy(list.files(current_template_loc, full.names = T), direc))

  # error checking for copying process

  # process captured output from file.copy
  did_copy <- unlist(strsplit(did_copy, " "))

  if (all(did_copy[-1] == "TRUE")) {
    message("Template copied succesfully")
  } else {
    message(
      "Template may not have been copied successfully. Please make sure your directory
      matches the template on GitHub found at https://github.com/GrantInnerst/buthesis"
    )
  }
}
