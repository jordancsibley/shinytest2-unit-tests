ui <- fluidPage(
  
  # Feature 1 ------------------------------------------------------------------
  
  h1("Feature 1"),
  
  # fluidRow (Feature 1: greeting) ----
  fluidRow(
    
    # greeting sidebarLayout ----
    sidebarLayout(
      
      # greeting sidebarPanel ----
      sidebarPanel(
        
        textInput(inputId = "name_input",
                  label = "What is your name?"),
        
        actionButton(inputId = "greeting_button_input",
                     label = "Greet"),
        
      ), # END greeting sidebarPanel
      
      # greeting mainPanel ----
      mainPanel(
        
        textOutput(outputId = "greeting_output"),
        
      ) # END greeting mainPanel
      
    ) # END greeting sidebarLayout
    
  ), # END fluidRow (Feature 1: greeting)
  
  hr(),
  
  # Feature 2 ------------------------------------------------------------------
  
  h1("Feature 2"),
  
  # fluidRow (Feature 2: plot) -----
  fluidRow(
    
    # plot sidebarLayout ----
    sidebarLayout(
      
      # plot sidebarPanel ----
      sidebarPanel(
        
        # penguin spp pickerInput -----
        pickerInput(inputId = "penguin_spp_input", 
                    label = "Select species:",
                    choices = c("Adelie", "Chinstrap", "Gentoo"),
                    selected = c("Adelie", "Chinstrap", "Gentoo"),
                    multiple = TRUE,
                    options = pickerOptions(actionsBox = TRUE)), # END penguin spp pickerInput
        
      ), # END plot sidebarPanel
      
      # plot mainPanel ----
      mainPanel(
        
        plotOutput(outputId = "scatterplot_output")
        
      ) # END plot mainPanel
      
    ) # END plot sidebarLayout
    
  ) # END fluidRow (Feature 2: plot)
  
) # END fluidPage 