# Load the stringr library for string manipulation
#' @importFrom stringr str_replace_all str_squish
#' @export

clean_text <- function(text , remove_special_chars = TRUE, remove_numbers = FALSE, to_lower = TRUE, remove_whitespace = TRUE, remove_stopwords = FALSE, remove_newlines = TRUE) {

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

  # If remove_newlines is TRUE, combine text into a single line
  if(remove_newlines){
    text <- paste(text, collapse = " ")
  }

  # If remove_special_chars is TRUE, remove URLs and special characters
  if(remove_special_chars) {
    text <- str_replace_all(text, "https?://\\S+\\s*", "")  # Remove URLs
    text <- str_replace_all(text, "[^[:alnum:][:space:]]", "")  # Remove special characters except alphanumeric and space
  }

  # If remove_numbers is TRUE, remove all numeric characters from the text
  if(remove_numbers) {
    text <- str_replace_all(text, "[0-9]+", "")
  }

  # If to_lower is TRUE, convert the entire text to lowercase
  if(to_lower) {
    text <- tolower(text)
  }

  # If remove_whitespace is TRUE, remove excessive whitespace between words
  if(remove_whitespace){
    text <- str_squish(text)  # Remove extra whitespace and squish text
  }

  # If remove_stopwords is TRUE, remove common stopwords from the text
  if (remove_stopwords) {
    # Define a list of common stopwords to be removed
    stopwords <- c("the", "is", "in", "at", "of", "on", "and", "a", "to", "it", "that", "with", "as", "for", "this")

    # Create a regex pattern to match stopwords with word boundaries
    stopwords_pattern <- paste0("\\b(", paste(stopwords, collapse = "|"), ")\\b")

    # Replace stopwords with a single space and trim extra spaces
    text <- gsub(stopwords_pattern, " ", text, ignore.case = TRUE)  # Replace stopwords
    text <- gsub("\\s+", " ", text)  # Replace multiple spaces with a single space
    text <- trimws(text)  # Trim leading and trailing whitespace
  }

  # If input was a file, overwrite it with cleaned text, otherwise return cleaned text
  if(file.exists(file_name)){
    writeLines(text, file_name)
  } else {
    return(text)
  }

}
