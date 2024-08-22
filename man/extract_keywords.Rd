\name{extract_keywords}
\alias{extract_keywords}
\title{Keyword Extraction Utility}
\description{
The `extract_keywords()` function is designed to extract the most significant keywords from a given text. It allows users to specify the number of keywords to extract, the minimum frequency of occurrence for a keyword to be considered, and the option to use n-grams for keyword extraction. Additionally, users can choose to remove common stopwords to focus on more meaningful terms.
}
\usage{
extract_keywords(text, n_keywords = 5, min_freq = 2, n_grams = 1, remove_stopwords = TRUE)
}
\arguments{
\item{text}{
A character string, a variable containing a character string, or a file path to the text from which keywords need to be extracted. If a file path is provided, the text will be read from the file and processed accordingly.
}
\item{n_keywords}{
An integer specifying the maximum number of keywords to return. The default is 5.
}
\item{min_freq}{
An integer specifying the minimum frequency of occurrence for a keyword to be included in the results. The default is 2.
}
\item{n_grams}{
An integer specifying the size of the n-grams to use for keyword extraction. The default is 1 (i.e., single words). Set to a higher number to consider multi-word phrases as keywords.
}
\item{remove_stopwords}{
A logical value indicating whether to remove common stopwords (e.g., "the", "is", "in") before extracting keywords. The default is `TRUE`.
}
}
\value{
A character vector containing the top keywords (or n-grams) from the text, ordered by their frequency of occurrence.
}
\examples{
# Example usage with a simple text string
text <- "Artificial intelligence and machine learning are key technologies in the future of software development."
keywords <- extract_keywords(text, n_keywords = 3, min_freq = 1, n_grams = 1)
print(keywords)

# Example usage with a file
# Assuming "sample.txt" contains the text from which to extract keywords
keywords_from_file <- extract_keywords("sample.txt", n_keywords = 5, min_freq = 2, n_grams = 2)
print(keywords_from_file)
}
