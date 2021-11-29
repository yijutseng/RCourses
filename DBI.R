install.packages("DBI")
library(DBI)
con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = "SQL Server",
                      Server   = "database-demo.cskb0lbecim9.us-east-1.rds.amazonaws.com",
                      Database = "demo",
                      UID      = rstudioapi::askForPassword("Database user"),
                      PWD      = rstudioapi::askForPassword("Database password"),
                      Port     = 1433)
q1 <- tbl(con, "stu") %>%
  group_by(class) %>%
  summarise(total = n())
show_query(q1)