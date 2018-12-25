model_score_dt <- readRDS("model_score_dt.rds")
library(data.table)
library(magrittr)

model_score_melt <- melt(model_score_dt[, .(ConstituentSKey, 
                   response, 
                   `Daffodil Day Appeal`=Expected_donations_daffodil, 
                   `September Appeal OG`=Expected_donations_september_og,
                   `Tax Appeal`=Expected_donations_tax, 
                   `September Appeal RG`=Expected_donations_september_rg)],
     id.vars=c("ConstituentSKey", "response"))
model_score_melt[1:10]
  fwrite(model_score_melt, "constituent_value.csv")

# fwrite(model_score_dt[, .(ConstituentSKey, 
#                           response, 
#                           Expected_donations_daffodil, 
#                           Expected_donations_september_og,
#                           Expected_donations_tax, 
#                           Expected_donations_september_rg)], "constituent_value.csv")
