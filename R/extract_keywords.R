# Load the stringr library for string manipulation
#' @importFrom stringr str_replace_all str_squish
#' @export

extract_keywords <- function(text, n_keywords = 5, min_freq = 2, n_grams = 1, remove_stopwords = TRUE){

  # Check if the input is a character (string), if not, throw an error
  if (!is.character(text)) {
    stop("Input must be a string.")
  }

  # Store the input text in a variable for checking if it's a file
  file_name <- text

  # If the input is a file path, read the file's contents
  if(file.exists(file_name)){
    text <- readLines(file_name)
  }

  # Convert text to lowercase for consistent processing
  text <- tolower(text)

  # If remove_stopwords is TRUE, remove common stopwords and punctuation
  if (remove_stopwords) {
    # Define a list of stopwords
    stopwords <- c("the", "is", "in", "at", "of", "on", "and", "a", "to", "it", "that", "with", "as", "for", "this", "are", "be", "\\.")

    # Create a regex pattern to match stopwords with word boundaries
    stopwords_pattern <- paste0("\\b(", paste(stopwords, collapse = "|"), ")\\b")

    # Replace stopwords and punctuation with spaces
    text <- gsub(stopwords_pattern, " ", text, ignore.case = TRUE)
    text <- gsub("[[:punct:]]+", " ", text)  # Remove punctuation

    # Trim extra spaces caused by stopword removal
    text <- gsub("\\s+", " ", text)  # Replace multiple spaces with a single space
    text <- trimws(text)  # Remove leading and trailing whitespace
  }

  # Tokenize the text into individual words or n-grams
  tokens <- unlist(strsplit(text, "\\s+"))

  # If n_grams is greater than 1, combine words into n-grams
  if(n_grams != 1){
    new_tokens <- vector("character", length(tokens) - n_grams + 1)
    for(i in 1:(length(tokens) - n_grams + 1)){
      new_tokens[i] <- paste(tokens[i:(i + n_grams - 1)], collapse = " ")  # Combine words into n-grams
    }
    tokens <- new_tokens
  }

  # Count the frequency of each token (or n-gram)
  freq <- table(tokens)

  # Filter out tokens that occur less than the minimum frequency
  freq <- freq[freq >= min_freq]

  # If no tokens meet the minimum frequency, return an empty character vector
  if (length(freq) == 0) {
    return(character(0))
  }

  # Sort the tokens by frequency in descending order and select the top n_keywords
  top_keywords <- sort(freq, decreasing = TRUE)
  top_keywords <- names(top_keywords)[1:min(length(top_keywords), n_keywords)]

  # Return the top keywords
  return(top_keywords)
}
