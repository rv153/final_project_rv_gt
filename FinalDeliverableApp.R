library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)


#df <- read.csv("UnifiedDataset.csv")

# Define the first page content
page_one <- tabPanel(
  #"About", 
  titlePanel("About"), 
  
  h3("Understanding Drug Abuse Among College Students"),
  
  p("Drug abuse among college students is a pressing concern, given the numerous factors that contribute to its prevalence. 
    Academic pressure, social influences, and newfound independence often intersect, leading some students to engage in substance abuse."),
  
  br(),
  
  p("Research by University of Michigan indicates a rising trend in drug abuse, but studies tracking substance use from college into later adulthood are scarce. 
    The Monitoring the Future (MTF) program provides valuable insights by analyzing substance use across different life stages, 
    revealing long-term effects and connections between substance use and various outcomes like substance use disorders, health issues, 
    and social functioning."),
  
  br(),
  
  p("Throughout these pages, we will explore the causes, effects, and implications of this increasing trend in drug abuse among college students.")
)

# Define content for the second page
page_two <- tabPanel(
  #"by Age & Gender", 
  titlePanel("By Age & Gender"), 
  sidebarLayout(
    sidebarPanel(plotOutput(outputId = "female_plot"),  # First plot
                 plotOutput(outputId = "male_plot"),  # Second plot
                 ),
    mainPanel(
      h3("Drug Abuse by Age & Gender"),
      p("Certain age groups and genders exhibit varying susceptibilities to drug abuse, highlighting the importance of understanding these disparities."),
      
      br(),
      
      p("The bar plot on the left showcases drug abuse rates across different age groups and genders. For example, 
        we observe higher rates among younger individuals aged 18-25 and among males (at 30% and 28%, respectively), 
        compared to lower rates among older individuals aged 26-35 and females (at 18% and 20%, respectively)."),
      
      br(),
      
      p("These disparities might be influenced by diverse factors, including social pressures, access to substances, 
        and psychological vulnerabilities. Targeted interventions aimed at specific age groups and genders 
        could effectively address these varying trends in drug abuse.")
    )
  )
)


# Define content for the third page
page_three <- tabPanel(
  #"Impact on Drug Types", 
  titlePanel("Impact on Drug Types"), 
  sidebarLayout(
    sidebarPanel(plotOutput(outputId = "drug_type_plot")
                 ),
    mainPanel(
      h3("Shift in Drug Abuse Patterns by Types"),
      p("There has been a notable shift in drug abuse patterns, particularly concerning various drug types among college students."),
      
      br(),
      
      p("An analysis from 2019 to 2021 reveals a significant change in the abuse rates of specific drug types among college-age individuals. 
        For instance, stimulants and opioids witnessed a marked increase from 20% to 60%, showing a substantial rise compared 
        to the abuse rates of other drug types."),
      
      br(),
      
      p("This shift might be influenced by various factors such as changes in availability, shifting societal norms, 
        and alterations in individual preferences, leading to a noteworthy change in the abuse patterns of certain drug types.")
    )
  )
)
# Define content for the fourth page
page_four <- tabPanel(
  #"Solutions", 
  titlePanel("Solutions"), 
  h3("Addressing Drug Abuse Challenges"),
  p("The challenges of drug abuse among college students have intensified during the pandemic."),
  
  br(),
  
  p("Implementing effective solutions such as increased access to counseling services, targeted educational programs, 
    and fostering a supportive campus environment can mitigate the rising trend of drug abuse. Additionally, 
    providing resources and support tailored to vulnerable communities is imperative."),
  
  br(),
  
  p("While there is no one-size-fits-all solution, targeted interventions and increased support systems 
    can make a substantial difference in curbing drug abuse among college students.")
)

# Define content for the fifth page
page_five <- tabPanel(
  "Overview", 
  titlePanel("Overview"), 
  h3("Why Focus on Drug Abuse?"),
  p("The prevalence of drug abuse among college students poses significant challenges, impacting academic performance, 
    mental and physical health, and future prospects."),
  
  br(),
  
  h3("Taking Action"),
  p("As part of the University of Washington, acknowledging and addressing this issue is crucial. By implementing comprehensive 
    strategies and support systems, we can create a healthier and more conducive environment for our student community.")
)

# Pass each page to a multi-page layout using `navbarPage`
ui <- navbarPage(
  "Drug Abuse Among College Students", 
  page_one,         
  page_two,         
  page_three,       
  page_four,       
  page_five        
)

server <- function(input, output, session) {
  df <- read.csv("UnifiedDataset.csv")

  output$female_plot <- renderPlot({
    ggplot(df, aes(x = Ages, y = Female)) +
      geom_bar(stat = "identity", fill = "purple", width = 0.5) +
      labs(title = "Percentage of Females Involved in Drug Abuse by Age",
           x = "Age Group",
           y = "Percentage of Females") +
      theme_minimal()
  })
  
  output$male_plot <- renderPlot({
    ggplot(df, aes(x = Ages, y = Male)) +
      geom_bar(stat = "identity", fill = "darkblue", width = 0.5) +
      labs(title = "Percentage of Males Involved in Drug Abuse by Age",
           x = "Age Group",
           y = "Percentage of Males") +
      theme_minimal()
  })
  
  output$drug_type_plot <- renderPlot({
    ggplot(df, aes(x = Drug.Type, y = Student.Participation)) +
      geom_bar(stat = "identity", fill = "cornflowerblue", width = 0.5) +
      labs(title = "Student Participation Rates in Different Drug Types",
           x = "Drug Types",
           y = "Student Participation (%)") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}

shinyApp(ui=ui, server=server)