\name{clean_text}
\alias{clean_text}
\title{Text Cleaning Utility}
\description{
The `clean_text()` function provides a comprehensive utility for cleaning and preprocessing text data. It allows the user to perform various text transformations such as removing special characters, numbers, converting text to lowercase, removing excessive whitespace, removing stopwords, and optionally collapsing text into a single line by removing newlines. This function is particularly useful for preparing text data for further analysis or modeling.
}
\usage{
clean_text(text, remove_special_chars = TRUE, remove_numbers = FALSE, to_lower = TRUE, remove_whitespace = TRUE, remove_stopwords = FALSE, remove_newlines = TRUE)
}
\arguments{
\item{text}{
A character string, a variable containing a character string, or a file path to the text that needs to be cleaned. If a file path is provided, the text will be read from the file and processed accordingly.
}
\item{remove_special_chars}{
A logical value indicating whether to remove special characters (e.g., punctuation, URLs) from the text. The default is `TRUE`.
}
\item{remove_numbers}{
A logical value indicating whether to remove numeric characters from the text. The default is `FALSE`.
}
\item{to_lower}{
A logical value indicating whether to convert all text to lowercase. The default is `TRUE`.
}
\item{remove_whitespace}{
A logical value indicating whether to remove excessive whitespace (including leading, trailing, and multiple spaces). The default is `TRUE`.
}
\item{remove_stopwords}{
A logical value indicating whether to remove common stopwords (e.g., "the", "is", "in"). The default is `FALSE`.
}
\item{remove_newlines}{
A logical value indicating whether to remove newline characters and collapse text into a single line. The default is `TRUE`.
}
}
\value{
The function returns a cleaned character string. If a file path was provided, the cleaned text will be saved back to the file.
}
\examples{
# Example usage with a simple text string
text <- "Hello! Visit us at https://example.com. Call 123-456-7890 for more info."
cleaned_text <- clean_text(text, remove_numbers = TRUE, remove_stopwords = TRUE)
print(cleaned_text)

# Example usage with a file
# Assuming "sample.txt" contains the text to be cleaned
clean_text("sample.txt", to_lower = FALSE, remove_newlines = FALSE)
}
