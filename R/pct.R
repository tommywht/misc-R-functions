#' Display results in percentages
#'
#' @param x numeric of any length
#'
#' @return The same numeric with decimal place moved 2 digits to the right.
#' @export
#'
#' @examples
#' x <- 0.8612
#' pct(x)
pct <- function(x){
  out <- formatC(x * 100, digits = 1, format = "f")
  return(out)
}
