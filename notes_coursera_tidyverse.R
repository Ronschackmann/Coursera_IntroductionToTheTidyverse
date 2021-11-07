# "here" package ----
install.packages("here")
library(here)
getwd()
here()
# move work directory up one folder:
setwd('../')


# prevent package conflicts, use here::here() instead of here()  to indicate using here argument of here function
here::here()
# create new folder and file paths (doesn't creat them, just makes a path to them even if they don't exist)
here::here("data", "filename.xlsx")
dir (here())
# see "ronnumbers4" for example use

install.packages("tidyverse")
library(tidyverse)
packageVersion('dplyr')
?slice_

# Coursera "importing data in the tidyverse" -----
#tibble ----
# convert dataframe to tibble
treesdata <- as_tibble(trees)

# view options
# view entire table in new tab
view(treesdata)
# print desired size
as_tibble (trees) %>%
    print(n = 5, width = Inf)
# print x number of random rows
slice_sample(treesdata, n=10)
# print top x rows or bottom x rows
slice_head (treesdata, n=3)    
slice_tail (treesdata, n=2)
# print rows with lowest (of Height column, if there is a tie, dont print it), highest values
slice_min(treesdata, order_by = Height, n=8, with_ties = FALSE)
slice_max(treesdata, order_by = Height, n=3)

# handmade tibble
df<-  tibble(
    a = 1:5,
    b = 6:10,
    c = 1,
    z = (a + b) ^2 + c
)
# subsetting ()
# Shown only column a
df$a  
# Shown only column a
df[["a"]]
# Shown only first column (which is a)
df[[1]]
# generate tibble using 'illegal' column names
tibble(
    `two words` = 1:5,
    `12` = "numeric",
    `:)` = "smile",
) 
# "readxl" package ---- 
install.packages("readxl")
library(readxl)      
getwd()
dir()
#read xls file in folder data (automatic to tibble), select sheet to read, transform into tibble. automatic empty to NA
ronnumbers <- read_excel("data/filename.xlsx", sheet=2)
print(ronnumbers)
#skip first 2 rows, change column names
ronnumbers2 <- read_excel("data/filename.xlsx", sheet = "Sheet1")
ronnumbers2 <- read_excel("data/filename.xlsx", col_names = LETTERS[1:4], skip = 3, sheet = 1)
print(ronnumbers2)      
view(ronnumbers2)
# ".name_repair" : check every column name is unique/valid (read_excel does this automatic but otherp packages don't so this helps make tables valid)
# "unique" -> is default, makes sure all colnames unique otherwise adds ...1
# "minimal" -> read_excel will not change any column names
# toupper -> makes all column names capitalized (no quotes as this is a function 'toupper()')
# "universal" -> if illegal colnames (eg : or name with spaces) `` backticks will be used. with univeral, all illegal are renamed so you no longer have `` in your table

ronnumbers3 <- read_excel("data/filename.xlsx", sheet = "Sheet3", .name_repair = "universal")
ronnumbers3     
# specify range to import and use "here" function to localize file
ronnumbers4 <- read_excel(here("data", "filename.xlsx"), .name_repair = "minimal", range = "Sheet3!B2:F5")
ronnumbers4  

# "googlesheets4" package ----
# reads directly from online sheet
install.packages("googlesheets4")
library(googlesheets4)
library(tidyverse)
    # log into your google acount, required very time
    gs4_auth()
    # list all worksheets on drive, 
    gs4_find()
        # list in separate table
        view(gs4_find())
    # read a sheet using its ID (from view() function)
    read_sheet("13yiOPu4crNo2XwZqq55QumahE8LfRpelGRTF-N-cKTs")
    # read a sheet from web url
    x <- read_sheet("https://docs.google.com/spreadsheets/d/1nfpDgcXfYgddMYT22VRJUM41IGIhiXC9LMrr03oVb_s/edit#gid=1272124506")
    view(x)
        # read specific sheet
        read_sheet("ID or URL", sheet = 2)
        # other arguments: 
            # skip=1 (skips 1st row); 
            # col_names=FALSE (indicate first row in not col names)
            # range="A1:G5" (specifically import range)
            # n_max=100 (indicate max no of rows to import
            # many other functions at https://googlesheets4.tidyverse.org/reference/index.html

#"readr" package (csv) ----
install.packages("readr")
library(readr)
        dir(here("data"))
        # read csv combined with here:here (or just here) package 
        df_csv <- read_csv(here::here("data", "example.csv"))
        df_csv
    # when file is delimited by other character:
        # read tsv
        # df_txt <- read_delim("sample_data.txt", delim = "\t")
        
        