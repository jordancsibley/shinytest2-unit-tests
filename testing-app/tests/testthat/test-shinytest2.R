library(shinytest2)

test_that("{shinytest2} recording: one-name-greeting", {
  app <- AppDriver$new(name = "one-name-greeting", seed = 1, height = 911, width = 1087)
  app$set_inputs(name_input = "Sam")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: consecutive-name-greeting", {
  app <- AppDriver$new(name = "consecutive-name-greeting", height = 911, width = 1087)
  app$set_inputs(name_input = "Sam")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Kat")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: no-input-greeting", {
  app <- AppDriver$new(name = "no-input-greeting", height = 911, width = 1087)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: select-all", {
  app <- AppDriver$new(name = "select-all", height = 911, width = 1087)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: deselect-adelie", {
  app <- AppDriver$new(name = "deselect-adelie", height = 911, width = 1087)
  app$set_inputs(penguin_spp_input = c("Chinstrap", "Gentoo"))
  app$expect_values(output = "scatterplot_output")
})
