# Sankey Diagram of Water Sources for the TV 


# Install and load packages
install.packages("circlize")
library(circlize)
library(grDevices)
install.packages("viridisLite")
library(viridisLite)

## -------------------------------##
#         Sankey: Water Sources
## --------------------------------##

# create output directory
png(filename = "/Users/dbeisel/Desktop/water_source_sankey.png", 
    width = 2400, height = 2400, res = 300)

# load data
data <- read.csv("/Users/dbeisel/Desktop/DATA/drainsheds_wr.csv")
data$Source <- as.factor(data$Source)
data$Drainshed <- as.factor(data$Drainshed)

# filter out some data
data <- data[!(data$Source == "UNNAMED STREAM" | data$Source == "UNNAMED DRAIN"| 
                 data$Source == "SPRINGS" | data$Source == "TUNNEL NO 2 DRAIN"), ]
data$Source <- gsub("FIVE MILE CREEK", "FIVEMILE CREEK", data$Source)

# create sankey diagram
chord_data <- as.matrix(xtabs(AcreLimit ~ Source + Drainshed, data = data))
chordDiagram(chord_data, transparency = 0.5, annotationTrack = "none", preAllocateTracks = 1)
circos.track(track.index = 1, panel.fun = function(x, y) {
  sector_width <- CELL_META$xlim[2] - CELL_META$xlim[1]
  label_position <- ifelse(sector_width < 10, 
                           CELL_META$ylim[1] - mm_y(5),  # Move label farther out for small sectors
                           CELL_META$ylim[1])
  
  circos.text(CELL_META$xcenter, label_position,  # Adjust position to spread out labels
              CELL_META$sector.index, facing = "clockwise",    # Set labels at an angle
              niceFacing = TRUE, adj = c(0, 0.5), cex = 0.6, font = 2)   # Make labels bold and smaller
}, bg.border = NA)

circos.clear()
dev.off()

## -------------------------------##
#         Sankey: Water Sources
#       (weighted by WR acre-feet)
## --------------------------------##

# Set file directory to save the plot
png(filename = "/Users/dbeisel/Desktop/water_right_sankey.png", width = 800, height = 800)

# Load data
data <- read.csv("/Users/dbeisel/Desktop/DATA/drainsheds_wr.csv")
data$Source <- as.factor(data$Source)
data$Drainshed <- as.factor(data$Drainshed)

# Filter out some data
data <- data[!(data$Source %in% c("UNNAMED STREAM", "UNNAMED DRAIN", "SPRINGS", 
                                  "WILLOW CREEK", "TUNNEL NO 2 DRAIN", "SAND HOLLOW CREEK")), ]
aggregated_data <- aggregate(AcreLimit ~ Source + Drainshed, data = data, sum)
chord_data <- xtabs(AcreLimit ~ Source + Drainshed, data = aggregated_data)
chord_data_matrix <- as.matrix(chord_data)
chord_data_matrix <- chord_data_matrix[rowSums(chord_data_matrix) > 0, colSums(chord_data_matrix) > 0]
chordDiagram(chord_data_matrix, transparency = 0.5, annotationTrack = "none", preAllocateTracks = 1)

circos.track(track.index = 1, panel.fun = function(x, y) {
  sector_width <- CELL_META$xlim[2] - CELL_META$xlim[1]
  label_position <- ifelse(sector_width < 10, 
                           CELL_META$ylim[1] - mm_y(5),  # Move label farther out for small sectors
                           CELL_META$ylim[1])
  
  circos.text(CELL_META$xcenter, label_position,  # Adjust position to spread out labels
              CELL_META$sector.index, facing = "clockwise",    # Set labels at an angle
              niceFacing = TRUE, adj = c(0, 0.5), cex = 0.6, font = 2)   # Make labels bold and smaller
}, bg.border = NA)

circos.clear()
dev.off()
