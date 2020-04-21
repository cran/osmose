## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(osmose)

## ---- include = FALSE---------------------------------------------------------
# Remove the .jar file if exits.
osmose:::flushCache("osmose_3.3.3.jar")

## ---- cache=TRUE--------------------------------------------------------------
exampleFolder <- tempdir()

# Show the temporary folder
cat(exampleFolder)

# Copy files
demoPaths <- osmose_demo(path = exampleFolder, config = "gog")

## -----------------------------------------------------------------------------
run_osmose(input = demoPaths$config_file)

## -----------------------------------------------------------------------------
outputs <- read_osmose(path = demoPaths$output_dir, 
                       input = demoPaths$config_file)

# Print osmose outputs
print(outputs)

## ---- fig.width=5.7, fig.height=4.75------------------------------------------
plot(outputs, what = "biomass")
plot(outputs, what = "biomass", type = 2)
plot(outputs, what = "abundance", ts = FALSE, type = 1)
plot(outputs, what = "yield", ts = FALSE, type = 2)

plot(outputs, what = "abundanceByAge")
plot(outputs, what = "biomassBySize", type = 2)
plot(outputs, what = "biomassByTL", type = 1)
plot(outputs, what = "yieldBySize", type = 2)

## ---- fig.width=5.7, fig.height=4.75------------------------------------------
plot(outputs$config, what = "species")
plot(outputs$config, what = "predation")
plot(outputs$config, what = "reproduction", type = 1)
plot(outputs$config, what = "reproduction", type = 2)

