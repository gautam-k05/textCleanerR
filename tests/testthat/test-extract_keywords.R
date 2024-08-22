describe("extract_keywords()", {

  # Test case 1: Can extract keywords from simple text input
  it("can extract the top keywords from a simple text input", {
    text <- "This is a sample text for extracting keywords. Keywords in this sample text are important."
    expect_equal(extract_keywords(text, n_keywords = 3), c("keywords", "sample", "text"))
  })

  # Test case 2: Can handle stopwords removal and return filtered keywords
  it("removes stopwords before extracting keywords", {
    text <- "The quick brown fox jumps over the lazy dog. The dog was brown."
    expect_equal(extract_keywords(text, n_keywords = 3, min_freq = 1), c("brown", "dog", "fox"))
  })

  # Test case 3: Can extract n-grams (bigrams in this case)
  it("can extract bigrams as keywords", {
    text <- "The quick brown fox jumps over the lazy dog. The lazy dog sleeps."
    expect_equal(extract_keywords(text, n_keywords = 2, n_grams = 2, min_freq = 1), c("lazy dog", "brown fox"))
  })


  # Test case 4: Returns an empty vector when no keywords match the criteria
  it("returns an empty vector when no keywords meet the frequency threshold", {
    text <- "One two three. One two three. Four five six."
    expect_equal(extract_keywords(text, n_keywords = 3, min_freq = 3),character(0))
  })
})
