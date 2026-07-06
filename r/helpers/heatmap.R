#' Draw a latitude/longitude heatmap.
#'
#' @param coordinates A data frame or matrix with `latitude` and `longitude`
#'   columns.
#'
#' @return The input coordinates, invisibly.
draw_heatmap <- function(coordinates) {
  if (!all(c("latitude", "longitude") %in% colnames(coordinates))) {
    stop("coordinates must contain latitude and longitude columns")
  }

  heatmap_colours <- colorRampPalette(c(
    "#f7fbff",
    "#c6dbef",
    "#6baed6",
    "#2171b5",
    "#08306b"
  ))

  par(mar = c(4.5, 4.5, 3, 1), bg = "white")

  smoothScatter(
    x = coordinates[, "longitude"],
    y = coordinates[, "latitude"],
    nrpoints = 1,
    nbin = 256,
    bandwidth = c(1.5, 1.5),
    colramp = heatmap_colours,
    xlab = "Longitude",
    ylab = "Latitude",
    main = "Seagrass Sightings Heatmap"
  )

  points(
    x = coordinates[, "longitude"],
    y = coordinates[, "latitude"],
    pch = 16,
    cex = 0.35,
    col = adjustcolor("black", alpha.f = 0.25)
  )

  box()

  invisible(coordinates)
}
