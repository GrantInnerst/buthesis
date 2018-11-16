#' Create a directory that contains the proper Baylor Statistical Science thesis knitr template
#'
#' This function creates a specified directory and populates the directory with the knitr template.
#'
#' @param direc path to a directory (not yet created) where the template will reside
#' @return nothing
#' @export create_knitr_thesis


create_knitr_thesis <- function(direc) {
  current_template_loc <- system.file("knitr_template", package = "buthesis")
  dir.create(direc)
  file.copy(list.files(current_template_loc, full.names = T), direc)
}


#' Create a directory that contains the proper Baylor Statistical Science thesis latex template
#'
#' This function creates a specified directory and populates the directory with the knitr template.
#'
#' @param direc path to a directory (not yet created) where the template will reside
#' @return nothing
#' @export create_latex_thesis

create_latex_thesis <- function(direc) {
  current_template_loc <- system.file("latex_template", package = "buthesis")
  dir.create(direc)
  file.copy(list.files(current_template_loc, full.names = T), direc)
}
