#POSTWORK 7
library(mongolite)

match=data.table::fread("data.csv")
names(match)

my_collection = mongo(collection = "match", db = "match_games") 
my_collection$insert(match)  

my_collection$count()
my_collection$find('{"date":"2015-12-20", "home_team":"Real Madrid"}')

rm(my_collection)