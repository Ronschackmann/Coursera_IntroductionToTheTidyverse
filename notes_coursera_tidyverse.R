install.packages("tidyverse")
library(tidyverse)
packageVersion('dplyr')
?slice_

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
# Excel files ---- 
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
# specify range to import 
ronnumbers4 <- read_excel("data/filename.xlsx", .name_repair = "minimal", range = "Sheet3!B2:F5")
ronnumbers4  


#week 1----
## "here" package ----
install.packages("here")
library(here)
getwd()
?here()
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

#### Coursera "importing data in the tidyverse" -----
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
## "readxl" package ---- 
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

## "googlesheets4" package ----
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

##"readr" package (csv) ----
install.packages("readr")
library(readr)
        dir(here("data"))
        # read csv combined with here:here (or just here) package 
        df_csv <- read_csv(here::here("data", "example.csv"))
        df_csv
    # when file is delimited by other character:
        # read tsv (tab separated)
        df_txt <- read_delim(here::here("data", "sample_data.txt"), delim = "\t")
        df_txt
        
##write CSV/TSV files ----
library(readr)
        dir(here("data"))
        # write a csv file tab or coma delimited:
            mycsv <- tibble(df<-  tibble(
                a = 1:5,
                b = 6:10,
                c = "high"))
            mycsv
        write_delim(mycsv, file = here("data", "my_csv_file.tsv"), delim = "\t")
        write_csv(mycsv, file = here("data", "my_csv_file.csv"))
                
        
#Week2 ----
    # "jsonlite" package ----
        # JavaScript Object Notation; 
        # consists of Key-Value pairs 
            # eg {"Name": "Isabela"}, “Name” would be a key, “Isabela” would be a value
        # nested and hierarchical
            # key-pairs can be organized into different levels (hierarchical) with some levels of information being stored within other levels (nested)
            # eg: "person" is at top, with 'male' and 'female' being two categories. within male or female the hair color is another level of the hierarchie 
                # person
                    # male
                        # blond
                        # brunet
                        # other
                    # female
                        # blond
                        # brunet
                        # other
    # generate JSON file
     jron <-
     '[
        {"Name" : "Woody", "Age" : 40, "Occupation" : "Sherrif"},
        {"Name" : "Buzz Lightyear", "Age" : 34, "Occupation" : "Space Ranger"},
        {"Name" : "Andy", "Occupation" : "Toy Owner"}
]'
jron  

install.packages("jsonlite")
library(jsonlite)    
    # convert json file to data frame
mydf <- fromJSON(jron)
mydf
    # convert from data fram to json
myjron <- toJSON(mydf)
myjron
    # read .json file
dir(here("data"))
read_json(here("data", "jron_file.json"))

    # "xml2" package ----
        # Extensible Markup Language (XML)
        # instead of key-value pairs, uses Nodes, Tags, Elements (hierarchical and nested like json)
            # $node                             (a node)
               # <tag>                          (opening tag)
                # <tag2> more content </tag2>   (an element)
                # <tag3> more content </tag3>   (an element)
            # </tag>                            (closing tag)
install.packages("xml2")
library(xml2)
library(here)
    #read .XML files
dir(here("data"))
read_xml(here("data", "note.xml"))

    # "RSQLite" package Relational data----
        #relational data is the unique identifier linking different tables
        #only read in required data, not entire database
#tools required to work with sql database
install.packages("RSQLite")
install.packages("dbplyr")
install.packages("dplyr")
library(dbplyr)
library(dplyr)
library(RSQLite)
library(tidyverse)
    #specify driver (required to connect to database)
Ronqlite <- dbDriver("SQLite")
    #connect to database
dbron <- dbConnect(Ronqlite, here("data", "company.db"))
    #list all tables in database
dbListTables(dbron)
    # extract two tables of interest from database 
albumsR <- tbl(dbron, "albums")
artistsR <- tbl(dbron, "artists")
view(albumsR)

    # Table join (mutating) ----
    # joins two tables, creating extra columns
    # see "diagram" folder "table_join_diagram.jpg" -> check 'magick' section!!
        # inner join
            # make new table only keep entries present in both tables (based on if the unique identifier is present in both)
        # left join
            # all rows in first table will be included in new table, NA's will be generated
        #  right join
            # use other table as primary... requires transfor of tables to tibbles first
        # full join
    #  inner join example (unique ID is "ArtistId" column)
innerRon <- inner_join (artistsR, albumsR, by = "ArtistId")
    view (innerRon)
    innerRon
    as_tibble(innerRon)
    # left join
leftRon <- (left_join (artistsR, albumsR, by = "ArtistId"))
    as_tibble(leftRon)
    #  right join
rightRon <- (right_join (as_tibble(artistsR), as_tibble(albumsR), by = "ArtistId"))
    as_tibble (rightRon)    
    #  full join
fullRon <- (full_join (as_tibble(artistsR), as_tibble(albumsR), by = "ArtistId"))
    as_tibble (fullRon)
    
    # Table join (filtering) ----
    # filter one table based on values in another table; the number of columns(variables) does not change does not create new columns
        # semi_join(x,Y): keep  obsevations in x that have a match in y
            # eg keep ONLY the artists that also have an album
        # anti_join(x,y): keep  observations in x that are NOT in y
            # eg keep all artists that do not have an album
    # semi_join
semi_join(artistsR, albumsR, by = "ArtistId")
    # anti_join
anti_join(artistsR, albumsR, by = "ArtistId")

# week 3----
# "rvest" package; Web Scraping ----
    # uses tags on websites for navigation
    # requires chrome extension 'SelectorGadget'
        # go to webpage, activate extension. click on element of interst, will light up all similars. show in bottom box how to call these elements using the rvest package (eg 'strong' for first column entries)
install.packages("rvest")
library(rvest)
    # grab webpage
packagesRon <- read_html("http://jhudatascience.org/stable_website/webscrape.html")
    # extract desired element ("strong" identified via 'selectorgadget' extension)
packagesRon %>%
    html_nodes("strong") %>%
    html_text()

    # alle nu.nl headlines
PackagesNuNL <- read_html("http://www.nu.nl")
PackagesNuNL %>%
    html_nodes (".title-wrapper .item-title__title") %>%
    html_text()

# "httr" package; HyperText Transfer Protocol R ----
    # API: Application Programming Interfaces (APIs)
    # 'base endpoint': URL you are requesting info from
        # eg: https://api.github.com
        # api site shows which info can be found using the API
    # function: GET(), HEAD(), PATCH(), PUT(), DELETE(), and POST()

install.packages("httr")
library(httr)
library(tidyverse)
    # get repositories available on my github
        # save github username as variable
usernameRon <- 'Ronschackmann'
        # save 'base endpoint' as variable
url_git <- 'https://api.github.com/'
        # construct API request
            # paste0() function concatenates each piece together to end up with full URL address
api_response <- GET(url = paste0(url_gitRon, 'users/', usernameRon, '/repos'))
        # check if request to the API was successfull (should give code '200')
api_response$status_code
        # extract content from API response
repo_content <- content(api_response)
        # get name and URL for each repo (unclear how to know to use 'name' and 'html_url'...)
lapply(repo_content, function(x) {
    df <- data_frame(repoRon = x$name,
                     addressRon = x$html_url)})%>% 
    bind_rows()
names(api_responseRon)

# API obtain CSV file from web ----

    # construct API request and check it works (code '200')
api_responeRon <- GET(url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv")
api_responeRon$status_code
    # extract content from API response
df_steakRon <- content(api_responeRon, type="text/csv")

#  API keys ----
    # most API's not as open as github
    # API key grants access

#  "haven" package: import/export SAS SPSS Stata
install.packages("haven")
library(haven)

# create stat files using the toystory data; run below if 'mydf' no longer in environment
        jron <-
            '[
                {"Name" : "Woody", "Age" : 40, "Occupation" : "Sherrif"},
                {"Name" : "Buzz Lightyear", "Age" : 34, "Occupation" : "Space Ranger"},
                {"Name" : "Andy", "Occupation" : "Toy Owner"}
        ]'
        jron  
        library(jsonlite)    
        # convert json file to data frame
        mydf <- fromJSON(jron)
        mydf

    # SAS file creation (unclear how the toystory data is called..)
library(here)
write_sas(data = mydf, path = here::here("data", "mydf.sas7bdat"))
    # read sas file
sas_mydf <- read_sas(here::here("data", "mydf.sas7bdat"))
sas_mydf

    # SPSS file creation and reading
write_sav(data = mydf, path = here::here("data", "mydf.sav"))
sav_mydf <- read_sav(here::here("data", "mydf.sav"))
sav_mydf

    # Stata format creation and reading
write_dta(data = mydf, path = here::here("data", "mydf.dta"))
dta_mydf <- read_dta(here::here("data", "mydf.dta"))
dta_mydf

# "magick" package for image manipulation ----
        # see vignette: https://cran.r-project.org/web/packages/magick/vignettes/intro.html#drawing_and_graphics
    # image manipulation
    # OCR function!
install.packages("magick")
library(magick)
    # read images
img1 <- image_read ("https://ggplot2.tidyverse.org/logo.png")
img2 <- image_read ("https://pbs.twimg.com/media/D5bccHZWkAQuPqS.png")
imgRon <- image_read (here::here("diagram", "table_join_diagram.jpg"))
print (imgRon)
    # OCR concatenate and print text
print (img1)
cat(image_ocr(img1))
print (img2)
cat(image_ocr(img2))
print(imgRon)
cat(image_ocr(imgRon))

# "googledrive" package ----
    # look into, manipulate etc. less functionality vs googlesheets

##Week 4 ----
# case study healthcare ----
library(tidyverse)
library(here)
library(readr)
dir(here("data"))
    # find out at which row the data starts (otherwise table generated using first row as column-header)
read_lines(file = (here("data", "healthcare-coverage.csv")), n_max = 5)
coverageRon <- read_csv (here("data", "healthcare-coverage.csv"),
                        skip = 2, #headers start in row3
                       n_max = which(coverageRon$Location == "Notes")-1) #tail of document has no data, only keep till 'Notes' row and remove (-1) that one

    # need to run above without the n_max row first otherwise, coverageRon is unknown... use the pipe??
    # if above is run twice, get error ~n_max argument is of length zero (this is because after first round, the rows after 'Notes' are already removed)
#
coverageRon
tail(coverageRon, n = 30)
view(coverageRon)
glimpse(coverageRon)

    #figure out first row that contains data
read_lines(file = here("data", "healthcare-spending.csv"), n_max = 10)
    #generate table
spendingRon <- read_csv (here("data", "healthcare-spending.csv"),
                         skip = 2)
    #figure out last row that contains data
tail(spendingRon, n = 20)
    #cut off the non-data rows
spendingRon <- read_csv (here("data", "healthcare-spending.csv"),
                         skip = 2,
                         n_max = which(spendingRon$Location == "Notes")-1)

tail(spendingRon, n = 20)
spendingRon
View(spendingRon)
dir(here("data"))

#create new folder----
dir.create(here::here("data", "raw_data"))
# save coverageRon and spendingRon tables in separate file
save(coverageRon, spendingRon, file = here::here("data", "raw_data", "case_study_1_rda"))


#download a file from the web----
        # indicate web address; indicate desired location and filename
download.file("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/sc-est2017-alldata6.csv", here("data", "sc-est2017-alldata6.csv"))

# read online xls file without downloading----
# read xlsx brady data and place in temp location (no downloading)
url <- "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/Brady-State-Scorecard-2015.xlsx?raw=true"
GET(url, write_disk(tfRon <- tempfile(fileext = ".xlsx")))
brady <- read_excel(tfRon, sheet = 1)
brady

# case study guns----
install.packages("httr")
library(httr)
library(rvest)
library(tidyverse)
library(here)

dir (here("data"))
rm(df_csv)

#read in population characteristics
    censusRon <- read_csv(here::here("data", "sc-est2017-alldata6.csv"))
    censusRon
# read in "killed by law enforcement"
    counted15 <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/the-counted-2015.csv")
    counted15
# read in suicide 
    suicide_all <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/suicide_all.csv")
    suicide_all
# read in firearm suicide data
    suicide_firearm <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/suicide_firearm.csv")
    suicide_firearm
# read xlsx brady data and place in temp location (no downloading)
    url <- "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/Brady-State-Scorecard-2015.xlsx?raw=true"
    GET(url, write_disk(tfRon <- tempfile(fileext = ".xlsx")))
    brady <- read_excel(tfRon, sheet = 1)
    brady
# read xls FBI uniform crim report place in temp location
    url2 <- "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/table_5_crime_in_the_united_states_by_state_2015.xls?raw=true"
    GET(url2, write_disk(tfRon2 <- tempfile(fileext = ".xls")))
    crime <- read_excel (tfRon2, sheet = 1, skip = 3)
    crime
#seriously, adding more files.. US Census 2010 land area
    url3 <- "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/LND01.xls?raw=true"
    GET(url3, write_disk(tfRon3 <- tempfile(fileext = ".xls")))
    land <- read_excel (tfRon3, sheet = 1)
    land
#andMoreData...
    # specify URL to where we'll be web scraping
    url <- read_html("https://web.archive.org/web/20210205040250/https://www.bls.gov/lau/lastrk15.htm")
    # scrape specific table desired
    out <- html_nodes(url, "table") %>%
        .[2] %>%
        html_table(fill = TRUE) 
    # store as a tibble
    unemployment <- as_tibble(out[[1]]) 
    unemployment
#save all the data we just generated above----
    save(censusRon, counted15, suicide_all, suicide_firearm, brady, crime, land, unemployment, file = here::here("data", "raw_data", "case_study_2.rda"))

# week 4 Import data final QUiz----
    Q1 <- read_excel (here::here("data", "excel_data.xlsx"), sheet=2)
        Q1
        print (Q1Mean <- mean(Q1$X12))
        Q1_X12 <- tibble(Q1$X12) #note this tible changed the header!
        view(Q1_X12)
        head(Q1_X12)
        tail(Q1_X12)
        print (Q1_X12_mean <- mean(Q1_X12$`Q1$X12`)) #let R autofill the column after typing $!!

    Q2_sheet1 <-  read_excel (here::here("data", "excel_data.xlsx"), sheet=1)
    Q2_sheet2 <-  read_excel (here::here("data", "excel_data.xlsx"), sheet=2)    

    Q2_sheet1    
    Q2_sheet2    
    Q2correlation <- cor(Q2_sheet1$X5, Q2_sheet2$X8)    
    Q2correlation

library(RSQLite)
    library(tidyverse)
    library(dplyr)
    install.packages("corrr")
    library("corrr")
    ?filter
    #specify driver (required to connect to database)
    Ronqlite <- dbDriver("SQLite")
    #connect to database
    Q3_db <- dbConnect(Ronqlite, here("data", "sqlite_data.db"))
    #list all tables in database
    dbListTables(Q3_db)
    # extract table of interest from database 
    Q3_table1 <- tbl(Q3_db, "table1")
    view(Q3_table1)
    #select only rows with ID==8 and summarise to see its 100 rows
    Q3_table1_ID8 <- Q3_table1 %>%
        filter(ID == 8)  
        # view(Q3_table1_ID8)
    # correlation between columns S2 and S3 added to pipe; not working as right now table is a list instead of eg double, not allowed to convert; completely stuck cant figure this out
    
#Q 4
    Q4xls <- read_excel(here::here("data", "excel_data.xlsx"), sheet=2)
    view(Q4xls)
    Q4json <- read_json(here("data", "table2.json"))
    view(Q4json)    
    