#Wrangling data in the Tidyverse

#Week 1----
# Wide data----
    # each variable in column, easy on the eye
# Long data----
    # each observation for a single variable in a separate row
    # required for data analysis tools

# "tidyr" Package  wide<->long ----

library(tidyverse)

# pivot_longer()
    # airquality data present in R
        airqualityRon <- as_tibble(airquality)
        airqualityRon 
        airqualityRonLong <- airquality %>%
            pivot_longer(everything())
        airqualityRonLong    
        view(airqualityRonLong)    
    # change column headers as well
        airqualityRonLong <- airquality %>%
            pivot_longer(everything(), names_to = "VariableRon", values_to = "valueRon")
        view(airqualityRonLong)        
    # specify which variables should be on new row (eg day/month are identifiers (IDs), should not be on separate lines)
        airqualityRonLongLogical <- airquality %>%
            pivot_longer(c(Ozone, Solar.R, Wind, Temp),  
                names_to = "VariableRon", values_to = "valueRon")
        view(airqualityRonLongLogical)        
# pivot_wider()
      # need to specify 2 columns; one containing the name and one containing the values
            spread_dataRon <- airqualityRonLongLogical %>%
                pivot_wider (names_from = "VariableRon", values_from = "valueRon")
        view(spread_dataRon)            
        