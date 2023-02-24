library(metafor)

isquare <- function(df, b_exp, se_exp, b_out, se_out){
  
  df <- df[df$mr_keep == TRUE, ]
  
  wald_b <- c()
  wald_se <- c()
  for(i in 1:nrow(df)){
    out <- mr_wald_ratio(b_exp = df[[b_exp]][i],
                         se_exp = df[[se_exp]][i],
                         b_out = df[[b_out]][i],
                         se_out = df[[se_out]][i])
    wald_b[i] <- out$b
    wald_se[i] <- out$se
  }
  
  i2 <- rma.uni(yi = wald_b, sei = wald_se, method = "EE")$I2
  
  return(data.frame(exp = df$exposure[1],
                    out = df$id.outcome[1],
                    i2 = i2))
}


# use the mr_singlesnp
Isq <- function(dat)
{
  het_tab <- plyr::ddply(dat, c("exposure", "outcome"), function(x1)
  {
    # message("Performing MR analysis of '", x$id.exposure[1], "' on '", x$id.outcome[1], "'")
    x <- subset(x1, mr_keep)
    if(nrow(x) < 2)
    {
      message("Not enough SNPs available for Heterogeneity analysis of '", x1$id.exposure[1], "' on '", x1$id.outcome[1], "'")
      return(NULL)
    }
     Isq<-	rma.uni(yi =x$b, sei=x$se,method = "EE")
     het_tab <- data.frame(
      outcome = x$outcome[1],
      exposure = x$exposure[1],
      I2 =Isq$I2
    )
    return(het_tab)
  })
  return(het_tab)
}
