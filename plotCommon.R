## String constants for the URL and local filename of the dataset .ZIP file
datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datasetZIP <- "exdata_data_household_power_consumption.zip"
datasetFilename <- "household_power_consumption.txt"


## Utility function to download the dataset into the working directory
## As it is fairly large, if the local file already exists, it is not re-downloaded
download.dataset <- function() {
    if (!file.exists(datasetZIP)) {
        message("Downloading dataset")
        download.file(url = datasetURL, destfile = datasetZIP, method = "auto", mode = "wb")
    }
}

## Downloads, reads, processes and returns the dataset for the four plots.
## Rows are filtered to include just the two days of interest; 
## The contents of Date & Time columns are converted to 'Date' and 'XXX' class
get.dataset <- function() {
    # Start-of-line matching for both header row and 01~02-Feb-2007
    lineRegExp <- "^(Date|[12]/2/2007)"
    
    # Preparatory step
    download.dataset()

    # Open a ZIP connection (to the local file)
    zipConnection <- unz(datasetZIP, datasetFilename)
    on.exit(close(zipConnection))
    
    # Read & grep
    lines <- grep(lineRegExp, readLines(zipConnection), value = TRUE)
    df <- read.csv(text = lines, sep = ";")
    
    # Data type conversion for Date & Time columns
    df$DateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    df
}