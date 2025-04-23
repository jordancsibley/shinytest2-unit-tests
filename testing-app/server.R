server <- function(input, output) {
  
  # Feature 1 ------------------------------------------------------------------
  
  # observe() automatically re-executes when dependencies change (i.e. when `name_input` is updated), but does not return a result ----
  observe({
    
    # if the user does not type anything before clicking the button, return the message, "Please type a name, then click the Greet button." ----
    if (nchar(input$name_input) == 0) {
      output$greeting_output <- renderText({
        "Please type a name, then click the Greet button."
      })
      
      # if the user does type a name before clicking the button, return the greeting, "Hello [name]!" ----
    } else {
      output$greeting_output <- renderText({
        paste0("Hello ", isolate(input$name_input), "!")
      })
    }
  }) |>
    
    # Execute the above observer once the button is pressed ----
  bindEvent(input$greeting_button_input)
  
  # Feature 2 ------------------------------------------------------------------
  
  # filter penguin spp (scatterplot) ----
  filtered_spp_scatterplot_df <- reactive({
    
    validate(
      need(length(input$penguin_spp_input) > 0, "Please select at least one penguin species to visualize data for."))
    
    penguins |>
      filter(species %in% input$penguin_spp_input)
    
  })
  
  # render scatterplot ----
  output$scatterplot_output <- renderPlot({
    
    ggplot(na.omit(filtered_spp_scatterplot_df()),
           aes(x = bill_length_mm, y = bill_depth_mm,
               color = species, shape = species)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE, aes(color = species)) +
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species") +
      theme(legend.position = "bottom")
    
  })
  
}