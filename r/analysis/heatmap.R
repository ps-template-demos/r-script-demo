# Create a latitude/longitude heatmap from Seagrass Spotter sightings.

source(file.path("r", "helpers", "heatmap.R"))

input_file <- file.path("data", "sightings.csv")
output_file <- file.path("output", "sightings_heatmap.png")

if (!file.exists(input_file)) {
  stop("Cannot find input file: ", input_file)
}

sightings <- read.csv(
  input_file,
  fileEncoding = "UTF-8-BOM",
  check.names = FALSE,
  stringsAsFactors = FALSE
)

required_columns <- c("Latitude", "Longitude")
missing_columns <- setdiff(required_columns, names(sightings))

if (length(missing_columns) > 0) {
  stop("Missing required column(s): ", paste(missing_columns, collapse = ", "))
}

coordinates <- data.frame(
  latitude = suppressWarnings(as.numeric(sightings[["Latitude"]])),
  longitude = suppressWarnings(as.numeric(sightings[["Longitude"]]))
)

coordinates <- coordinates[complete.cases(coordinates), ]
coordinates <- coordinates[
  coordinates$latitude >= -90 &
    coordinates$latitude <= 90 &
    coordinates$longitude >= -180 &
    coordinates$longitude <= 180,
]

if (nrow(coordinates) == 0) {
  stop("No valid latitude/longitude rows found in ", input_file)
}

dir.create(dirname(output_file), showWarnings = FALSE, recursive = TRUE)

if (interactive()) {
  draw_heatmap(coordinates)
}

png(filename = output_file, width = 1800, height = 1200, res = 200)
draw_heatmap(coordinates)
dev.off()

message("Saved heatmap to ", normalizePath(output_file, mustWork = FALSE))
