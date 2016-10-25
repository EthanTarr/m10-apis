### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Documents/info-201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
top.10 <- function(given.artist) {
  # Base URL of API
  base <- 'https://api.spotify.com/v1/'
  
  # Parameters
  
  search <- 'search?q='
  type <- '&type=artist'
  
  # Query string
  query_url <- paste0(base, search, given.artist, type)
  
  info <- fromJSON(query_url)
  id <- info$artists$items$id[1]
  
  album <- paste0(base, 'artists/', id, '/top-tracks?country=US')
  
  top.tracks <- fromJSON(album)
  
  return(top.tracks$tracks)
}


# What are the top 10 tracks by Nelly?
top.10("Nelly")



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest
search <- function(type, string) {
  base <- 'https://api.spotify.com/v1/'
  
  query_url <- paste0(base, "search?q=", string, "&type=", type)
  
  return(fromJSON(query_url))
}

# Search albums with the word "Sermon"

search("album", "Sermon")
