# Seagrass Spotter Heatmap

This project creates a heatmap showing the global distribution of seagrass sightings submitted to the [SeagrassSpotter](https://seagrassspotter.org) platform.

![Example output of the heatmap](docs/sightings_heatmap.png)

---

## Installation

This project requires the `maps` package:

```r
install.packages("maps")
```


> [!CAUTION]
> Going forward, a better solution for package management is recommended such as `docker` or `renv`.


To run the analysis, drop the CSV file into the data folder (as `data/sightings.csv`) and run `r/analysis/heatmap.R`. The script will output the heatmap as a PNG into the `output` folder.


## Reproducibility

If you would like to rerun a previous release, you can find them at

https://github.com/ps-template-demos/r-script-demo/releases

In the release, you will find a ZIP file of the code, and the sightings.csv file used. Simply download the source code, copy the CSV into the data folder, and run the analysis.
