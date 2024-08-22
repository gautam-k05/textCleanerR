describe("auto_censor()", {
  it("can censor phone number of different formats", {
    expect_match(auto_censor("call me at (123)-456-7890"), "[PHONE]")
  })
  it("can censor URLs of different formats", {
    expect_match(auto_censor("Reach out via http://contact.us"), "[URL]")
  })
  it("can censor email IDs with diffent domains", {
    expect_match(auto_censor("message me at admin@site.co.uk"), "[EMAIL]")
  })
  it("can censor to the given replacements", {
    expect_match(auto_censor("message me at admin@site.co.uk", email_replacement = "My_Mail"), "My_Mail")
  })
}
)