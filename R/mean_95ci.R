# display result in "mean (lci, uci)"
mean_95ci <- function(mean, lci, uci, dig){
  out <- paste0(formatC(mean, digits = dig, format = "f", drop0trailing = F), 
                " (", formatC(lci, digits = dig, format = "f", drop0trailing = F), 
                ", ",
                formatC(uci, digits = dig, format = "f", drop0trailing = F), 
                ")")
  return(out)
}