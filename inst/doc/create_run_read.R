## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(osmose)

## ---- include = FALSE---------------------------------------------------------
# Remove the .jar file if exits.
osmose:::flushCache("osmose_3.3.3.jar")

## ---- eval=FALSE--------------------------------------------------------------
#  # From CRAN
#  install.packages("osmose")
#  
#  # From Github
#  devtools::install_github("osmose-model/osmose")

## ---- eval=FALSE--------------------------------------------------------------
#  # To open the .Renviron file
#  usethis::edit_r_environ()
#  
#  # Then you should copy the directory where Jar files will be donwloaded. For example:
#  OSMOSE_DIR = Copy/a/path/here  #Don't use quotation marks
#  
#  # Then save and close the .Renviron file

## ---- cache=TRUE--------------------------------------------------------------
# Define a folder to copy files (for the example: a temporary folder)
# Here you can also select the same directory than in OSMOSE_DIR 
exampleFolder <- tempdir()

cat(exampleFolder)

## ---- cache=TRUE--------------------------------------------------------------
# Copy files
demoPaths <- osmose_demo(path = exampleFolder, config = "gog")

## ---- echo=FALSE--------------------------------------------------------------
# Show copied files
cat("Copied files:\n")
print(list.files(path = dirname(demoPaths$config_file), recursive = TRUE))

## -----------------------------------------------------------------------------
# Run an example using 'run_osmose' function (it will take less than 1 min)
run_osmose(input = demoPaths$config_file)

## ---- cache=TRUE--------------------------------------------------------------
# Read outputs using 'read_osmose' function
outputs <- read_osmose(path = demoPaths$output_dir, 
                       input = demoPaths$config_file)

# Check class
class(outputs)

# Check class of config level
class(outputs$config)

# Read ONLY configuration files
config <- read_osmose(input = demoPaths$config_file)

# Check class
class(config)

## ---- eval=FALSE--------------------------------------------------------------
#  # Print method
#  print(outputs)

## ---- echo=FALSE--------------------------------------------------------------
osmose:::print.osmose(outputs)

## ---- eval=FALSE--------------------------------------------------------------
#  # Summary method
#  summary(outputs)

## ---- echo=FALSE--------------------------------------------------------------
osmose:::print.summary.osmose(osmose:::summary.osmose(outputs))

