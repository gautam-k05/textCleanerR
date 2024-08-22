# Load the stringr library for string manipulation
#' @importFrom stringr str_replace_all str_squish
#' @export

auto_censor <- function(text, url_replacement = "[URL]", email_replacement = "[EMAIL]", phone_replacement = "[PHONE]", ignore_case = TRUE) {

  # Check if the input is a character (string), if not, throw an error
  if (!is.character(text)) {
    stop("Input must be a string.")
  }

  # Store the input text in a variable for checking if it's a file
  file_name <- text

  # Check if the input text is a valid file path; if so, read the file's contents
  if(file.exists(file_name)){
    text <- readLines(file_name)
  }

  # Define regular expressions (patterns) for URLs, emails, and phone numbers
  url_pattern <- "(https?:\\/\\/(?:[a-zA-Z0-9-]+\\.)?[a-zA-Z0-9-]+\\.[^\\s]{2,}|[a-zA-Z0-9-]+\\.[^\\s]{2,})"
  email_pattern <- "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
  phone_pattern <- "(\\+\\d{1,2}\\s?)?1?\\-?\\.?\\s?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}"

  # Replace email addresses in the text with the email_replacement string
  text <- gsub(email_pattern, email_replacement, text, ignore.case = ignore_case, perl = TRUE)

  # Replace URLs in the text with the url_replacement string
  text <- gsub(url_pattern, url_replacement, text, ignore.case = ignore_case, perl = TRUE)

  # Replace phone numbers in the text with the phone_replacement string
  text <- gsub(phone_pattern, phone_replacement, text, ignore.case = ignore_case, perl = TRUE)

  # If the input was a file, overwrite the file with the censored content
  if(file.exists(file_name)){
    writeLines(text, file_name)
  } else {
    # Otherwise, return the censored text
    return(text)
  }
}
