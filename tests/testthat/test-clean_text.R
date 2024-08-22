describe("clean_text()", {
  it("can remove special charactes but keep spaces between words", {
    expect_equal(clean_text("hello, world!"), "hello world")
  })
  it("can remove whitespace between words and put the string to lower", {
    expect_equal(clean_text("R    is a great       programming language."), "r is a great programming language")
  })
  it("can remove stopwords if specified", {
    expect_equal(clean_text("this is a function made for cleaning text", remove_stopwords = TRUE), "function made cleaning text")
  })
  it("can remove numbers if specified", {
    expect_equal(clean_text("you can call me at 987654321.", remove_numbers = TRUE), "you can call me at")
  })
}
)