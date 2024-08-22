# textCleanerR
 The textCleanerR package offers essential tools for string manipulation and text cleaning. It includes functions to remove unwanted characters and whitespace, extract key phrases, and automatically censor sensitive information like emails or phone numbers in text data.


## Installation

To install the package, use the following command:

```r
# Install from GitHub (assuming the repository is public)
devtools::install_github("gautam-k05/textCleanerR")
```

## Functions

### 1. `clean_text()`

**Purpose:**  
Cleans text data by removing special characters, extra whitespace, stopwords, and other unwanted elements. It can also convert text to lowercase and remove numbers.

**Usage:**

```r
clean_text(text, remove_special_chars = TRUE, remove_numbers = FALSE, to_lower = TRUE, remove_whitespace = TRUE, remove_stopwords = FALSE, remove_newlines = TRUE)
```

**Parameters:**
- `text`: The input text or file path.
- `remove_special_chars`: Removes URLs and special characters.
- `remove_numbers`: Removes numeric characters.
- `to_lower`: Converts text to lowercase.
- `remove_whitespace`: Removes excess whitespace.
- `remove_stopwords`: Removes common stopwords.
- `remove_newlines`: Removes newlines and combines text into a single line.

### 2. `extract_keywords()`

**Purpose:**  
Extracts keywords or key phrases from text based on frequency or other criteria.

**Usage:**

```r
extract_keywords(text, n_keywords = 5, min_freq = 2, n_grams = 1, remove_stopwords = TRUE)
```

**Parameters:**
- `text`: The input text or file path.
- `n_keywords`: Number of keywords to extract (default is 5).
- `min_freq`: Minimum frequency for a word or phrase to be considered as a keyword (default is 2).
- `n_grams`: Number of words to consider as a single unit for keyword extraction (default is 1).
- `remove_stopwords`: Whether to remove common stopwords (default is TRUE).

**Details:**
- The function can handle both single words (unigrams) and multi-word phrases (n-grams).
- If the input is a file path, the function will read the text from the file.
- Stopwords and punctuation are removed if `remove_stopwords` is set to `TRUE`.
- The function returns the top `n_keywords` based on their frequency in the text.

### 3. `auto_censor()`

**Purpose:**  
Automatically detects and censors patterns such as URLs, emails, and phone numbers in text data.

**Usage:**

```r
auto_censor(text, url_replacement = "[URL]", email_replacement = "[EMAIL]", phone_replacement = "[PHONE]", ignore_case = TRUE)
```

**Parameters:**
- `text`: The input text or file path.
- `url_replacement`: Replacement string for URLs.
- `email_replacement`: Replacement string for email addresses.
- `phone_replacement`: Replacement string for phone numbers.
- `ignore_case`: Whether to ignore case when matching patterns.

## Example

Here's a simple example using all three functions:

```r
# Load the package
library(textCleanerR)

# Example text
text <- "Contact me at example@example.com or visit https://example.com. Call me at 123-456-7890."

# Clean the text
cleaned_text <- clean_text(text)

# Extract keywords
keywords <- extract_keywords(cleaned_text)

# Censor sensitive information
censored_text <- auto_censor(cleaned_text)

# Display the results
print(cleaned_text)
print(keywords)
print(censored_text)
```


