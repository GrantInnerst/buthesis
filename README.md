Baylor University Thesis Templates
====================================
This package was inspired by the `thesisdown` and `ucbthesis` packages

Warning
-----------

The latex class used in both templates may not be up to date. 
Before submitting the final draft of your thesis,
double check with the Graduate School that everything is kosher (e.g., the
margins are properly sized, the front page is properly spaced, etc.).


Installation
--------------

To install this as an R package, and therefore access the templates, as well as
the helper functions `create_knitr_thesis` and `create_latex_thesis`, you can either clone this repo,
and build the package manually, or use `devtools` via:

```
library(devtools)
devtools::install_github("GrantInnerst/buthesis")
```

Usage
------------

### Knitr

If you would like to use the knitr template, the function `create_knitr_thesis` is what you want. This function takes in one argument, `direc`, which is the full path to where you want the directory to be created (You do not want to create the directory beforehand). When the function is run, the contents of the template will be copied to the new directory. 

The template contains `thesis.Rproj`, which if opened in RStudio will open an R project containing the thesis template. The main advantage to using this project format is the document `thesis.Rnw` is set as the root document. This means that no matter which document you are editing, if you compile the document (CTRL+SHIFT+K), the root document will compile.

### Latex

If you would like to use the latex template, the function `create_latex_thesis` is what you want. This function takes in one argument, `direc`, which is the full path to where you want the directory to be created (You do not want to create the directory beforehand). When the function is run, the contents of the template will be copied to the new directory. 

The template contains `thesis.Rproj`, which if opened in RStudio will open an R project containing the thesis template. The main advantage to using this project format is the document `thesis.tex` is set as the root document. This means that no matter which document you are editing, if you compile the document (CTRL+SHIFT+K), the root document will compile.
