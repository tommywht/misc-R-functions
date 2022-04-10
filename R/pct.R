# display result in percentages
pct <- function(x){
  out <- formatC(x * 100, digits = 1, format = "f")
  return(out)
}
