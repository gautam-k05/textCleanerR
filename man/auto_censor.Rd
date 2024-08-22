\name{auto_censor}
\alias{auto_censor}
\title{Auto Censor}
\description{
The `auto_censor()` function is a powerful utility for automatically detecting and censoring sensitive information within text. It scans the input for URLs, email addresses, and phone numbers, replacing them with customizable placeholders such as "[URL]", "[EMAIL]", and "[PHONE]". This function is particularly useful for anonymizing data and ensuring that sensitive information is not exposed.
}
\usage{
auto_censor(text,
            url_replacement = "[URL]",
            email_replacement = "[EMAIL]",
            phone_replacement = "[PHONE]",
            ignore_case = TRUE)
}
\arguments{
\item{text}{
A character string, a variable containing a character string, or a file path to the text that needs to be censored. If a file path is provided, the text will be read from the file and processed accordingly.
}
\item{url_replacement}{
A character string that will replace any detected URLs in the text. The default is "[URL]".
}
\item{email_replacement}{
A character string that will replace any detected email addresses in the text. The default is "[EMAIL]".
}
\item{phone_replacement}{
A character string that will replace any detected phone numbers in the text. The default is "[PHONE]".
}
\item{ignore_case}{
A logical value indicating whether to perform case-insensitive matching. The default is `TRUE`.
}
}
\value{
The function returns a character string with the specified sensitive information censored. If a file path was provided, the censored text will be saved back to the file.
}
\examples{
text <- "Contact me at john.doe@example.com or visit https://example.com. My phone number is 123-456-7890."
censored_text <- auto_censor(text)
print(censored_text)

# Example usage with a file
# Assuming "sample.txt" contains sensitive information
auto_censor("sample.txt")
}
