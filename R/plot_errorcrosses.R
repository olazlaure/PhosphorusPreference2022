#' Plot pairwise with two variables
#'
#' @description Create a bivariate plot with two variables
#' @param dataset1 name of the first dataset 
#' @param dataset2 name of the second dataset 
#' @param trait1 variable from the first dataset
#' @param trait2 variable from the second dataset
#' @param xaxis_labelprint label of the x axis
#' @param yaxis_labelprint label of the y axis
#'  
#' @importFrom dplyr vars across
#'
#' 
#' @return plot
#' @export 
#'
#' @examples
#'plot_realdata(datasetx = data_color,datasety = data_control,traitx="red",traity="Nb_eggs",xaxis_labelprint = "Color: Red",yaxis_labelprint = "Number of eggs") 


plot_errorcrosses <- function(datasetx = data_color,
                              datasety = data_control,
                              traitx="red",
                              traity="Nb_eggs",
                              xaxis_labelprint = "Color: Red",
                              yaxis_labelprint = "Number of eggs" ){
  
  
  #renames
  names(datasetx) <- tolower(names(datasetx))
  names(datasety) <- tolower(names(datasety))
  traitx <- tolower(traitx)
  traity <- tolower(traity)
  
  #SUMMARY
  SUM_traitx <- Rmisc::summarySE(datasetx, 
                                    measurevar = traitx,
                                    groupvars = c("fruit"), 
                                    na.rm=TRUE)
  
  SUM_traity <- Rmisc::summarySE(datasety, 
                                 measurevar = traity, 
                                 groupvars = c("fruit"),
                                 na.rm=TRUE)
  
  
  #renames
  colnames(SUM_traitx)[3] <- "traitx"
  colnames(SUM_traity)[3] <- "traity"
  
  
  #Merge
  data <- merge(SUM_traitx, SUM_traity, 
                by.x = "fruit",  by.y = "fruit", 
                all.x = TRUE, all.y = TRUE)

  
  

  
  
  #Plot 
  plot_pair <- ggplot(data = data,
                      aes(x = traitx, 
                          y = traity), 
                      color = fruit) +
    geom_errorbar(data = data, aes(ymin=traity-se.y, ymax=traity+se.y, col=fruit), size=0.3) +
    geom_errorbarh(data = data, aes(xmin=traitx-se.x, xmax=traitx+se.x, col=fruit), size=0.3) + 
    geom_point(aes(col=fruit, fill=fruit),  size=3, alpha=1)  + 
    xlab(xaxis_labelprint)  +
    ylab(yaxis_labelprint) + 
    #theme(plot.title = element_text(hjust = 0.5)) + 
    scale_color_manual(name="Fruit",
                       breaks = c("Tomato","Grape","Blackberry","Kiwi",
                                  "Raspberry", "Strawberry","Fig", "Rosehips",
                                  "Cherry","Blackcurrant", "Cranberry", "Apricot"), 
                       labels = c("Tomato","Grape","Blackberry","Kiwi", "Raspberry",
                                  "Strawberry","Fig", "Rosehips", "Cherry","Blackcurrant", 
                                  "Cranberry", "Apricot"), 
                       values = c("#e31a1c","#b2df8a","#1f78b4","#33a02c",
                                  "#fdbf6f", "#fb9a99","#6a3d9a", "#b15928",
                                  "#cab2d6","#a6cee3", "#e7e700", "#ff7f00")) +
    ggrepel::geom_text_repel(data = data, aes(label = fruit,  color = fruit),
                             min.segment.length = Inf,box.padding = 0.55) + 
    # geom_text(data = data, aes(label = fruit,  color = fruit),
    #           hjust=0.5, vjust=-10.5) + 
    theme_LO_sober + theme (
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      legend.position="none")
  
  
  ## Correlation 
  data$N <- (data$N.x+data$N.y)/2
  
  ## Compute weighted correlation
  weightedcor <- sjstats:::weighted_correlation(data, x = traitx, 
                                                y = traity, 
                                                weights = N, 
                                                ci.lvl = 0.95)
  
  # Equation
  pval <- as.numeric(weightedcor$p.value[1])
  rho_weighted <- as.numeric(weightedcor$estimate[1])
  eq_rho <- as.character(as.expression(substitute(~~italic("P-value")~"="~pval~","~~italic(rho)~"="~rho_weighted~"["~inf~";"~sup~"]",
                                                  list(pval = format(pval, digits = 2), 
                                                       rho_weighted = format(rho_weighted, digits = 2), 
                                                       inf = format(weightedcor$ci[1], digits = 1),
                                                       sup = format(weightedcor$ci[2], digits = 1)))))
  plot_pair <- plot_pair + geom_text(x = max(data$traitx), y = Inf, hjust = 1, vjust = 1, 
                                                    label = eq_rho,
                                                    parse = TRUE, 
                                                    color="black", size = 3.5)
  

  return(plot_pair)
}


