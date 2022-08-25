# Create project on Github

## Create compendium
rrtools::use_compendium("/Users/laure/Documents/RESEARCH/z_PhD/PHOSPHORUS/PhosphorusPreference2022/", open = FALSE)

## Add to .gitignore
usethis::use_git_ignore(".DS_Store")
usethis::use_build_ignore(".DS_Store")
usethis::use_git(message = ":see_no_evil: Ban .DS_Store files")

## Modify DESCRIPTION file
usethis::edit_file("DESCRIPTION")
usethis::use_git(message = ":bulb: Update documentation")

## Create directories
dir.create("data")
dir.create("reports")

## Update DESCRIPTION file
usethis::use_package("here")
usethis::use_package("lme4")
usethis::use_package("ggplot2")
usethis::use_package("cowplot")
usethis::use_package("gtools")
usethis::use_package("RColorBrewer")
usethis::use_package("lattice")
usethis::use_package("colorspace")
usethis::use_package("reshape2")
usethis::use_package("Rmisc")
usethis::use_package("psych")

## Create a R directory and a file for functions
usethis::use_r("theme_LO_sober")

## Update NAMESPACE file
devtools::document()

## Load all required packages
devtools::load_all()

