#' Display result in "mean (lci, uci)"
#'
#' @param mean Mean value
#' @param lci Lower 95% CI
#' @param uci Upper 95% CI
#' @param dig Desired number of digits for display
#'
#' @return A string in the form of "mean (lci, uci)"
#' @export
#'
#' @examples
#' mean_95ci(1.02, 0.86, 1.21, 2)
mean_95ci <- function(mean, lci, uci, dig){
  out <- paste0(formatC(mean, digits = dig, format = "f", drop0trailing = F), 
                " (", formatC(lci, digits = dig, format = "f", drop0trailing = F), 
                ", ",
                formatC(uci, digits = dig, format = "f", drop0trailing = F), 
                ")")
  return(out)
}