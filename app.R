#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# install.packages("", type="binary")

library(shiny)
library(shinythemes)
library(shinyBS)
library("shinycssloaders")
library(DT)
options(spinner.color="#CD1076", spinner.type = 6, shiny.maxRequestSize=100*1024^2)

ui <- fluidPage(theme = shinytheme("readable"),
#titlePanel("Reactivity"),


pageWithSidebar(
headerPanel(
"Sentiment and Emotion Network Analysis (SENA)"
),
sidebarPanel(
tags$head(tags$style(HTML("a {color: #CD1076; font-weight: bold}"))),
tags$style(".btn-file {color: #fff; background-color:#CD1076; border-color: #2e6da4; } .btn:hover {
color: #FFDF00;
background-color: #CD1076;
border-color: #2e6da4;
}
.progress-bar {background-color: #CD1076; }"),

    tags$b("Program Description"),
    tags$p(HTML("<b>S</b>entiment and <b>E</b>motion <b>N</b>etwork <b>A</b>nalysis
    <b>(SENA)</b>.<br>
    <b>B</b>ased on Natural Language Processing, this platform computes interactive word frequency distributions as well as
    <b>s</b>entiment and <b>e</b>motion distributions by and across documents.<br>
    <b>N</b>etwork interactive visualizations depict these relationships and identify central players for further qualitative analyses. <br>
    <b>W</b>hen compaison groups are added, <b>Q</b>uadratic <b>A</b>ssignment <b>P</b>rocedures for hypothesis testing are executed automatically.")),

    tags$p(a("About SENA",target="_blank",href="DDS_about_PHUDCFILY.pdf" )),

#tags$p("Questions?", a("msgc@upenn.edu", href="mailto:msgc@upenn.edu"), "More info at", a("Democratizing Data Science, GitHub", href="https://github.com/democratizing-data-science"), "and quick updates", a("@DataScienceOpen, Twitter", href="https://twitter.com/DataScienceOpen") ),
#        img(src = "DDS_phudcfily.png", style = "float: left; width: 200px; margin-right: 5px; margin-top: 1px"),

    tags$hr(),

    tags$b("Steps to execute the SENA processes:"),
    div(style = "margin-top: -2.5px"),
    tags$ol(list(
    tags$li("Select Corpus Source Type (*.doc or *.csv)"),
    selectInput("select", "1.1 Documents or database", choices = list("First select source type below ->" = 3, "Collection of Word Docs (.doc)" = 1, "A column in a database (.csv)" = 2), selected = 3),
    # tags$li("Select minimum text length"),
    tags$li("Execute Selection by Uploading Data (MS Word or Excel files)"),
    #      shinyDirButton("directory", "Select Folder", "Please select a folder", icon= icon("folder")),
    div(style = "margin-top: -20px"),
    #fileInput('directory', '', placeholder = 'You can also drag files here', multiple = TRUE, accept = c("text", ".txt"), buttonLabel=list(icon("folder"),"Browse")),
    fileInput('directory', '', placeholder = 'You can also drag files here', multiple = TRUE, accept = c("application/msword", ".doc", "csv", ".csv"), buttonLabel=list(icon("folder"),"Browse")), #"application/vnd.openxmlformats-officedocument.wordprocessingml.document", ".docx", PHUDCFILY c("application/msword","text", ".doc", ".txt")
    div(style = "margin-top: -20px"),
    tags$li("Do you want to lemmatize?"),
    #      shinyDirButton("directory", "Select Folder", "Please select a folder", icon= icon("folder")),
    div(style = "margin-top: -20px"),
    selectInput("phulemma", "", choices = list("Lemmatization" = 1, "No Lemmatization" = 2), selected = 1),

    tags$li("Execute Text Mining/Cleaning procedures"),
    actionButton("goButtontm", "Execute Text Mining", icon("trademark")),
    div(style = "margin-top: 10px"),
    tags$li("Select words to trim by their position. I.e., 1, 5 trims 1st and 5th words"),
    # div(style = "margin-top: -20px"),
    # numericInput("trim", "", 0),
textInput('trimvec', 'Numbers separated by commas: 1, 3, 7'),
    actionButton("goButton", "Trim Common Words", icon("strikethrough")),
    # tags$li("Select numbers of: burn-in samples & Gibbs resamplings (recommended values pre-selected)"),#If the output of the folder selected, shown in the right panel, is correct, s
    # div(style = "margin-top: -1px"),
    tags$li("Select Sentiment Lexicon Language"),
    #      shinyDirButton("directory", "Select Folder", "Please select a folder", icon= icon("folder")),
    div(style = "margin-top: -20px"),
    selectInput("phulangPHU", "", choices = list("Spanish" = 1, "English" = 2, "Basque" = 3, "Catalan" = 4, "Danish" = 5, "Dutch" = 6, "Esperanto" = 7, "Finnish" = 8, "French" = 9, "German" = 10, "Irish" = 11, "Italian" = 12, "Latin" = 13, "Portuguese" = 14, "Romanian" = 15, "Swedish" = 16, "Welsh" = 17), selected = 2),
    tags$li("Execute Wordclouds, SENA, and QAP"),
    actionButton("goButtonT", "Execute SENA", icon("line-chart")),
      withSpinner(uiOutput("tab")),
	  div(style = "margin-top: 10px"),
	  	tags$li("If changing data sources, reload app"),
	actionButton("refreshPHU", "Reload SENA", icon("repeat")))
    )
    ),
    mainPanel(
        tags$h3("SENA handles documents and databases as data inputs", style ="font-weight:bold"),
    withSpinner(htmlOutput("mintext")),
    withSpinner(textOutput("corpusphu")),
    withSpinner(dataTableOutput("tableiniphu")),
    withSpinner(uiOutput("toy_data1")),#PHUDCFILY
    withSpinner(uiOutput("toy_data2")),#PHUDCFILY
    withSpinner(uiOutput("toy_data3")),#PHUDCFILY
    withSpinner(uiOutput("toy_data4")),#PHUDCFILY
#withSpinner(uiOutput("toy_data5")),#PHUDCFILY
    withSpinner(uiOutput("ntexTcsv")),#PHUDCFILY
    tags$h4("1 & 2. Corpus Data and Group Comparison Information"),

       # tags$h6("To update decomposition method or length, upload data again."),
    # textOutput("textupload"),
        tags$h6(" "),
      # uiOutput("group_distribution"),
      withSpinner(dataTableOutput("tablegdphuw")),
      # withSpinner(dataTableOutput("tablegdphud")),
      tags$h6(" "),
    # uiOutput("tab_dropped"),
    #verbatimTextOutput("directorypath"),
    #    verbatimTextOutput("pdfnumPHU"),


     tags$hr(),
     tags$h4("3 & 4. Initial text mining output"),
     # withSpinner(textOutput("textdropped")),
	withSpinner(verbatimTextOutput("nText")),
    tags$hr(),
    tags$h4("5. If You Decided to Trim Common Words, Output Displayed Below"),
    tags$h6("If unsatisfied, re-execute step 3 and continue to 5, no need to reload data"),
    withSpinner(verbatimTextOutput("nTextlda")),
    tags$hr(),
    tags$h4("6 & 7. Execute SENA and Wordclouds"),
    withSpinner(verbatimTextOutput("nTopiclda")),
    #    tags$p("You can save the metrics plot"),
    # downloadButton("save", "Download Metrics Plot"),
    # plotOutput("plot"),

    # tags$hr(),
    # tags$h4("7-8. Code modeling and most representative texts per code"),


    # tags$h5("+ After LACOID completion you can download the Chi-squared test of text or group association with latent codes"),
    #   # uiOutput("tab"),
    #   tags$h5("+ You will also be able to download the resulting LACOID datasets"),
    # #textOutput("text"),
    # #    radioButtons("filetype", "File type, comma separated (csv) or tab separated (tsv):",
    # #                choices = c("csv", "tsv"), inline=TRUE),
    # downloadButton('downloadData', 'Download Full LACOID data (all text chunks)'),
    # downloadButton('downloadDataq', 'Download File-to-LACOID distribution (quant. modeling)'),
    # downloadButton('downloadDatas', 'Download Most Representative cases (shown below)'),
    # withSpinner(verbatimTextOutput("TopicModeling")),
    # sliderInput("topphu", "Select the number of most representative texts per code", min = 1, max = 20, value = 5),
    # dataTableOutput("table"),
    tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #CD1076}")),
    tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #CD1076}")),
    tags$style(HTML(".js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {background: #CD1076}"))
    )
    ))

# Define server logic required to draw a histogram
server <- function(input, output, session) {

        # library(LDAvis)
        # library(servr)
        # library(topicmodels)
        # library("ldatuning")
        library("tsne")
        library(textstem)
        library(dplyr)
        library(stringi)
        library(stringr)
        # library(fs)
        #library(pdftools)
        library(tidyverse)
        library(parallel)
        library(tm)
        library("syuzhet")
        library(quanteda)
        # library(gistr)
        library("ggplot2")
library("plotly")
library("reshape2")
  library(igraph)
    library(XML)
  require(wordcloud2)
  library(networkD3)
  library(magrittr)
  library(htmlwidgets)
  library(htmltools)
#phudcfily
my_path <- tempdir()
addResourcePath(prefix = "localpath", directoryPath = my_path)
# utils::browseURL("https://github.com/")

#PHUDCFILY
output$mintext <- renderText({
if (input$select==1) {

               paste("If you selected a collection of docs, please upload them and then proceed to text mining.")



} else if (input$select==2) {

 paste("If you selected a database, after uploading the *.csv file, you will need to select <b>ID</b>, <b>text</b>, and <b>cat or time</b> columns before proceeding to text mining")

} else {
               paste("To continue select source type and then upoad your corpus source data")

}
})

 output$toy_data1 <- renderUI({
if (input$select==2) {
    selectInput('ego', 'ID column (required)', "")

} else {
 }
  })

 output$toy_data2 <- renderUI({
if (input$select==2) {
    selectInput('alter', 'Text column (required)', "")
} else {
 }
  })

 output$toy_data3 <- renderUI({
if (input$select==2) {
    selectInput('cate', 'Category or Time column (optional)', "")
} else {
 }
  })

 output$toy_data4 <- renderUI({
if (input$select==2) {
actionButton("colselecPHU", "Execute Columns Selection", icon("swatchbook"))
} else {
 }
  })

#  output$toy_data5 <- renderUI({
 #if (input$select==1) {
  #   selectInput("phuchunk", "1.1 Sentences or Paragraphs?", list("sentences","paragraphs"))
 #} else {
#  }
#   })
            outVar0 = reactive({
                  mydata = values$x1
                  names(mydata)#c("select an option below (e.g., 'actor_ID' or 'sender' depending on your data & method)",
                })
                observe({
                  updateSelectInput(session, "ego",
                  choices = outVar0()
                )})

            outVar1 = reactive({
                  mydata = values$x1
                  c(names(mydata)[2],names(mydata))#c("select an option below (e.g., 'code_ID' or 'receiver' depending on your data & method)",
                })
                observe({
                  updateSelectInput(session, "alter",
                  choices = outVar1()
                )})

            outVar2 = reactive({
                  mydata = values$x1
                  c(names(mydata)[ncol(mydata)], names(mydata))#c("select an option below (e.g., 'code_ID' or 'receiver' depending on your data & method)",
                })
                observe({
                  updateSelectInput(session, "cate",
                  choices = outVar2()
                )})

    ntextcsv <- eventReactive(input$colselecPHU, {
 if (input$select==2) {

   x1 <- values$x1
          # phu=input$woman

          colnames(values$groups)[colnames(values$groups) == input$ego] <- "doc_id"
          colnames(x1)[colnames(x1) == input$ego] <- "doc_id"
          colnames(x1)[colnames(x1) == input$alter] <- "text"
          colnames(x1)[colnames(x1) == input$cate] <- "time"
          x1 <- x1[x1$text!=""&!is.na(x1$text) & !is.na(x1$doc_id)&!duplicated(x1$doc_id),c("doc_id","text", "time")]
          # x1$time <- ifelse(input$cate=="No cat or time", x1$notime, x1$time)
          # x1$time <- ifelse(length(table(unique(x1$time)))==nrow(x1), "Aggregate", x1$time)
          values$x1<-x1

            group_dist<-data.frame(table(x1$time))

            values$group_distD <- group_dist

          print(paste("The initial valid number of open-ended responses is ",dim(x1)[1], ". Text mining results will be displayed after executing the fourth step.", sep=""))


} else {

}
})

         output$ntexTcsv <- renderUI ({
            ntextcsv()
        })

   values <- reactiveValues(x1 = NULL)
values$my_path <- my_path



        lst1 <- eventReactive(input$directory, {

            if (input$select==2) {
             values$x1 <- read.csv(input$directory$datapath, header = TRUE, sep = ",", fill = TRUE, comment.char="", stringsAsFactors = FALSE)
			 adb <- paste("You uploaded a database with", dim(values$x1)[1], "rows and", dim(values$x1)[2], "columns. To continue with NLP, please select ID (i.e., identifier for merging), Text (i.e., open-ended responses), and if applicable, a categorical indicator columns from the options displayed below. After then click 'Execute Columns Selection.'", sep=" ")
										 if (input$select==2){
			 print(adb)
			 } else if (input$select==2){
               print(adw)
			   } else {
			   }

                 values$x1$No_cat_or_time <- "Aggregate"
values$groups <-values$x1

  values$content <- function(x) {
  out <- list()
  out$content <- x$content
  return(out)
}

values$id <- function(x) {
  out <- list()
  out$id <- x$meta$id
  return(out)
}

 } else if (input$select==1){

            phudcfily<-as.character(input$directory$datapath[1])
            revlacoid<-ifelse(str_sub(phudcfily,-3,-1)=="ocx",6,5)
                  phudcfily<-substr(phudcfily,1,nchar(phudcfily)-revlacoid)
            #    phu<-substr(phu,4,nchar(phu))
            #values$phudcfily <- phudcfily

            wphu<-data.frame(name= input$directory[,1], numbname=input$directory[,4])
wphu$keyquant=paste("text",rownames(wphu),sep="")
            wphu$numbname <- sub("^.+/", "", wphu$numbname)# sub("/[^/]+$", "", wphu$numbname)
            ###PHUDCFILY
    wphu$numbname <- str_replace_all(wphu$numbname, ".doc", "")
             # print(head(wphu,11))


txt<-Corpus(DirSource(phudcfily),readerControl = list(reader=readDOC, language = "en"))
            #PHUDCFILY
    values$txt <- txt
            #    print(values$corp)
            #    print(values$phu$files)
            # output$textupload <- renderText({
			adw <- paste("+ You uploaded",length(txt), "files. The text mining procedures will include the", length(txt), "Word documents", sep=" ")

							 if (input$select==1){
			 print(adw)
			 } else if (input$select==2){
               print(adb)
			   } else {
			   }

    # x1<-as.data.frame(unlist(txt))
    values$content <- function(x) {
  out <- list()
  out$content <- x$content
  return(out)
}

values$id <- function(x) {
  out <- list()
  out$id <- x$meta$id
  return(out)
}
#print(str(txt))

x1<-data.frame(unlist(sapply(txt, values$content)))
x1[,1]<-gsub("[\r\n]", " ", x1[,1])
x1$doc_idn <- names(sapply(txt, values$id))
x1$doc_idn <- str_replace_all(x1$doc_idn, ".doc.id", "")
x1$doc_id <- wphu$name[match(x1$doc_idn, wphu$numbname)]
x1$doc_id <- str_replace_all(x1$doc_id, ".doc", "")
    names(x1)[1] <- "text"

#     x1<-x1[-(length(txt)+1), ]
    x1$time <- str_replace_all(x1$doc_id, "[:digit:]", "")
    if (length(unique(x1$time))==length(txt)) {
       x1$time <- "Aggregate"
            } else{
            }
    # print(head(x1))
 group_dist<-data.frame(table(x1$time))
  names(group_dist)<-c("Group name","Freq")
 # print(head(group_dist))
    # x1$time <- ifelse(length(table(unique(x1$time)))==length(txt), rep("Aggregate", length(txt), x1$time[1:length(txt)])
    x1 <- x1[,c(3,1,4)]

 values$x1 <- x1
# print(str(values$x1))


            values$group_distW <- group_dist

            #print(paste("You uploaded",length(txt), "files","that were decomposed into",length(corp), "text chunks, referred to as documents in text mining", sep=" "))
} else {

}
})

                    output$tableiniphu <- renderDataTable({
					  if (input$select==2) {
                ex1ini <-  values$groups
                ex1ini$No_cat_or_time <- NULL
                datatable(ex1ini, caption=htmltools::tags$caption("Table with text data, select ID, Text, and Category Below", style = 'caption-side: top; text-align: center; color:black; font-size:200% ;'), options = list(
                pageLength = 3, lengthMenu = c(5,10),
    columnDefs = list(list(
      targets = "_all",
      render = JS(
        "function(data, type, row, meta) {",
        "return type === 'display' && data != null && data.length > 30 ?",
        "'<span title=\"' + data + '\">' + data.substr(0, 30) + '...</span>' : data;",
        "}")
      ))),
      class = "display")
	  } else {

}
            })

            output$tablegdphuw <- renderDataTable({
			            if (input$select==1) {
                ex1 <-  values$group_distW

                datatable(ex1, caption=htmltools::tags$caption("Group distributions to be displayed in analyses", style = 'caption-side: top; text-align: center; color:black; font-size:200% ;'), options = list(
                pageLength = 6, lengthMenu = c(5,10),
    columnDefs = list(list(
      targets = "_all",
      render = JS(
        "function(data, type, row, meta) {",
        "return type === 'display' && data != null && data.length > 30 ?",
        "'<span title=\"' + data + '\">' + data.substr(0, 30) + '...</span>' : data;",
        "}")
      ))),
      class = "display")
			} else if (input$select==2) {

                ex2 <-  values$group_distD

                datatable(ex2, caption=htmltools::tags$caption("Group distributions to be displayed in analyses", style = 'caption-side: top; text-align: center; color:black; font-size:200% ;'), options = list(
                pageLength = 6, lengthMenu = c(5,10),
    columnDefs = list(list(
      targets = "_all",
      render = JS(
        "function(data, type, row, meta) {",
        "return type === 'display' && data != null && data.length > 30 ?",
        "'<span title=\"' + data + '\">' + data.substr(0, 30) + '...</span>' : data;",
        "}")
      ))),
      class = "display")
} else {
}

            })

            # output$tablegdphud <- renderDataTable({
			            # if (input$select==2) {

			# } else {
# ex1<-NULL
# }
            # })

                output$corpusphu <- renderPrint ({
                    lst1()
        })

#         #  a<-parseDirPath(volumes, input$directory)


 observeEvent(input$refreshPHU, {
      session$reload()
    })

    ntext <- eventReactive(input$goButtontm, {
 if (input$select!=3) {

   x1 <- values$x1
		  # x1$doc_id <- ifelse(!duplicated(x1$doc_id), x1$doc_id, paste("Row number: ", rownames(x1), ", Given ID: ", x1$doc_id, sep=""))
          # phu=input$woman
  x1<-x1[, c("doc_id", "text")]
  x1$text <- str_remove_all(x1$text, "[^[\\da-zA-Z-áéíóúÁÉÍÓÚñ ]]")
  docs <- Corpus(DataframeSource(x1),readerControl = list(language = "en"))

  #Transformations
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeNumbers)
  docs <- tm_map(docs, removeWords, c(stopwords("english"), stopwords("spanish"), stopwords("italian"), stopwords("danish"), stopwords("dutch"), stopwords("finnish"), stopwords("french"), stopwords("german"), stopwords("portuguese"), stopwords("romanian"), stopwords("swedish")))
  # To remove stopwords who what when where why does can can't doesn't didn't and how could should didnt
    newstopwords <- c("a"             ,"abans"         ,"abans-d'ahir"  ,"abintestat"    ,"ací"           ,"adesiara"      ,"adés"          ,"adéu"          ,"adàgio"      ,
"ah"            ,"ahir"          ,"ai"            ,"aitambé"       ,"aitampoc"      ,"aitan"         ,"aitant"        ,"aitantost"     ,"aixà"        ,
"això"          ,"així"          ,"aleshores"     ,"algun"         ,"alguna"        ,"algunes"       ,"alguns"        ,"algú"          ,"alhora"      ,
"allà"          ,"allèn"         ,"allò"          ,"allí"          ,"almenys"       ,"alto"          ,"altra"         ,"altre"         ,"altres"      ,
"altresí"       ,"altri"         ,"alça"          ,"al·legro"      ,"amargament"    ,"amb"           ,"ambdues"       ,"ambdós"        ,"amunt"       ,
"amén"          ,"anc"           ,"andante"       ,"andantino"     ,"anit"          ,"ans"           ,"antany"        ,"apa"           ,"aprés"       ,
"aqueix"        ,"aqueixa"       ,"aqueixes"      ,"aqueixos"      ,"aqueixs"       ,"aquell"        ,"aquella"       ,"aquelles"      ,"aquells"     ,
"aquest"        ,"aquesta"       ,"aquestes"      ,"aquests"       ,"aquèn"         ,"aquí"          ,"ara"           ,"arran"         ,"arrera"      ,
"arrere"        ,"arreu"         ,"arri"          ,"arruix"        ,"atxim"         ,"au"            ,"avall"         ,"avant"         ,"aviat"       ,
"avui"          ,"açò"           ,"bah"           ,"baix"          ,"baldament"     ,"ballmanetes"   ,"banzim-banzam" ,"bastant"       ,"bastants"    ,
"ben"           ,"bis"           ,"bitllo-bitllo" ,"bo"            ,"bé"            ,"ca"            ,"cada"          ,"cal"           ,"cap"         ,
"car"           ,"caram"         ,"catorze"       ,"cent"          ,"centes"        ,"cents"         ,"cerca"         ,"cert"          ,"certa"       ,
"certes"        ,"certs"         ,"cinc"          ,"cinquanta"     ,"cinquena"      ,"cinquenes"     ,"cinquens"      ,"cinquè"        ,"com"         ,
"comsevulla"    ,"contra"        ,"cordons"       ,"corrents"      ,"cric-crac"     ,"d"             ,"daixonses"     ,"daixò"         ,"dallonses"   ,
"dallò"         ,"dalt"          ,"daltabaix"     ,"damunt"        ,"darrera"       ,"darrere"       ,"davall"        ,"davant"        ,"de"          ,
"debades"       ,"dedins"        ,"defora"        ,"dejorn"        ,"dejús"         ,"dellà"         ,"dementre"      ,"dempeus"       ,"demés"       ,
"demà"          ,"des"           ,"desena"        ,"desenes"       ,"desens"        ,"després"       ,"dessobre"      ,"dessota"       ,"dessús"      ,
"desè"          ,"deu"           ,"devers"        ,"devora"        ,"deçà"          ,"diferents"     ,"dinou"         ,"dins"          ,"dintre"      ,
"disset"        ,"divers"        ,"diversa"       ,"diverses"      ,"diversos"      ,"divuit"        ,"doncs"         ,"dos"           ,"dotze"       ,
"dues"          ,"durant"        ,"ecs"           ,"eh"            ,"el"            ,"ela"           ,"elis"          ,"ell"           ,"ella"        ,
"elles"         ,"ells"          ,"els"           ,"em"            ,"emperò"        ,"en"            ,"enans"         ,"enant"         ,"encara"      ,
"encontinent"   ,"endalt"        ,"endarrera"     ,"endarrere"     ,"endavant"      ,"endebades"     ,"endemig"       ,"endemés"       ,"endemà"      ,
"endins"        ,"endintre"      ,"enfora"        ,"engir"         ,"enguany"       ,"enguanyasses"  ,"enjús"         ,"enlaire"       ,"enlloc"      ,
"enllà"         ,"enrera"        ,"enrere"        ,"ens"           ,"ensems"        ,"ensota"        ,"ensús"         ,"entorn"        ,"entre"       ,
"entremig"      ,"entretant"     ,"entrò"         ,"envers"        ,"envides"       ,"environs"      ,"enviró"        ,"ençà"          ,"ep"          ,
"ep"            ,"era"           ,"eren"          ,"eres"          ,"ergo"          ,"es"            ,"escar"         ,"essent"        ,"esser"       ,
"est"           ,"esta"          ,"estada"        ,"estades"       ,"estan"         ,"estant"        ,"estar"         ,"estaran"       ,"estarem"     ,
"estareu"       ,"estaria"       ,"estarien"      ,"estaries"      ,"estaré"        ,"estarà"        ,"estaràs"       ,"estaríem"      ,"estaríeu"    ,
"estat"         ,"estats"        ,"estava"        ,"estaven"       ,"estaves"       ,"estem"         ,"estes"         ,"esteu"         ,"estic"       ,
"estiguem"      ,"estigueren"    ,"estigueres"    ,"estigues"      ,"estiguessis"   ,"estigueu"      ,"estigui"       ,"estiguin"      ,"estiguis"    ,
"estigué"       ,"estiguérem"    ,"estiguéreu"    ,"estigués"      ,"estiguí"       ,"estos"         ,"està"          ,"estàs"         ,"estàvem"     ,
"estàveu"       ,"et"            ,"etc"           ,"etcètera"      ,"ets"           ,"excepte"       ,"fins"          ,"fora"          ,"foren"       ,
"fores"         ,"força"         ,"fos"           ,"fossin"        ,"fossis"        ,"fou"           ,"fra"           ,"fui"           ,"fóra"        ,
"fórem"         ,"fóreu"         ,"fóreu"         ,"fóssim"        ,"fóssiu"        ,"gaire"         ,"gairebé"       ,"gaires"        ,"gens"        ,
"girientorn"    ,"gratis"        ,"ha"            ,"hagi"          ,"hagin"         ,"hagis"         ,"haguda"        ,"hagudes"       ,"hagueren"    ,
"hagueres"      ,"haguessin"     ,"haguessis"     ,"hagut"         ,"haguts"        ,"hagué"         ,"haguérem"      ,"haguéreu"      ,"hagués"      ,
"haguéssim"     ,"haguéssiu"     ,"haguí"         ,"hala"          ,"han"           ,"has"           ,"hauran"        ,"haurem"        ,"haureu"      ,
"hauria"        ,"haurien"       ,"hauries"       ,"hauré"         ,"haurà"         ,"hauràs"        ,"hauríem"       ,"hauríeu"       ,"havem"       ,
"havent"        ,"haver"         ,"haveu"         ,"havia"         ,"havien"        ,"havies"        ,"havíem"        ,"havíeu"        ,"he"          ,
"hem"           ,"heu"           ,"hi"            ,"ho"            ,"hom"           ,"hui"           ,"hàgim"         ,"hàgiu"         ,"i"           ,
"igual"         ,"iguals"        ,"inclusive"     ,"ja"            ,"jamai"         ,"jo"            ,"l"             ,"la"            ,"leri-leri"   ,
"les"           ,"li"            ,"lla"           ,"llavors"       ,"llevat"        ,"lluny"         ,"llur"          ,"llurs"         ,"lo"          ,
"los"           ,"ls"            ,"m"             ,"ma"            ,"mai"           ,"mal"           ,"malament"      ,"malgrat"       ,"manco"       ,
"mant"          ,"manta"         ,"mantes"        ,"mantinent"     ,"mants"         ,"massa"         ,"mateix"        ,"mateixa"       ,"mateixes"    ,
"mateixos"      ,"me"            ,"mentre"        ,"mentrestant"   ,"menys"         ,"mes"           ,"meu"           ,"meua"          ,"meues"       ,
"meus"          ,"meva"          ,"meves"         ,"mi"            ,"mig"           ,"mil"           ,"mitges"        ,"mitja"         ,"mitjançant"  ,
"mitjos"        ,"moixoni"       ,"molt"          ,"molta"         ,"moltes"        ,"molts"         ,"mon"           ,"mos"           ,"més"         ,
"n"             ,"na"            ,"ne"            ,"ni"            ,"ningú"         ,"no"            ,"nogensmenys"   ,"només"         ,"noranta"     ,
"nos"           ,"nosaltres"     ,"nostra"        ,"nostre"        ,"nostres"       ,"nou"           ,"novena"        ,"novenes"       ,"novens"      ,
"novè"          ,"ns"            ,"nòs"           ,"nós"           ,"o"             ,"oh"            ,"oi"            ,"oidà"          ,"on"          ,
"onsevulga"     ,"onsevulla"     ,"onze"          ,"pas"           ,"pengim-penjam" ,"per"           ,"perquè"        ,"pertot"        ,"però"        ,
"piano"         ,"pla"           ,"poc"           ,"poca"          ,"pocs"          ,"poques"        ,"potser"        ,"prest"         ,"primer"      ,
"primera"       ,"primeres"      ,"primers"       ,"pro"           ,"prompte"       ,"prop"          ,"prou"          ,"puix"          ,"pus"         ,
"pàssim"        ,"qual"          ,"quals"         ,"qualsevol"     ,"qualsevulla"   ,"qualssevol"    ,"qualssevulla"  ,"quan"          ,"quant"       ,
"quanta"        ,"quantes"       ,"quants"        ,"quaranta"      ,"quart"         ,"quarta"        ,"quartes"       ,"quarts"        ,"quasi"       ,
"quatre"        ,"que"           ,"quelcom"       ,"qui"           ,"quin"          ,"quina"         ,"quines"        ,"quins"         ,"quinze"      ,
"quisvulla"     ,"què"           ,"ran"           ,"re"            ,"rebé"          ,"renoi"         ,"rera"          ,"rere"          ,"res"         ,
"retruc"        ,"s"             ,"sa"            ,"salvament"     ,"salvant"       ,"salvat"        ,"se"            ,"segon"         ,"segona"      ,
"segones"       ,"segons"        ,"seguida"       ,"seixanta"      ,"sempre"        ,"sengles"       ,"sens"          ,"sense"         ,"ser"         ,
"seran"         ,"serem"         ,"sereu"         ,"seria"         ,"serien"        ,"series"        ,"seré"          ,"serà"          ,"seràs"       ,
"seríem"        ,"seríeu"        ,"ses"           ,"set"           ,"setanta"       ,"setena"        ,"setenes"       ,"setens"        ,"setze"       ,
"setè"          ,"seu"           ,"seua"          ,"seues"         ,"seus"          ,"seva"          ,"seves"         ,"si"            ,"sia"         ,
"siau"          ,"sic"           ,"siguem"        ,"sigues"        ,"sigueu"        ,"sigui"         ,"siguin"        ,"siguis"        ,"sinó"        ,
"sis"           ,"sisena"        ,"sisenes"       ,"sisens"        ,"sisè"          ,"sobre"         ,"sobretot"      ,"sol"           ,"sola"        ,
"solament"      ,"soles"         ,"sols"          ,"som"           ,"son"           ,"sos"           ,"sota"          ,"sots"          ,"sou"         ,
"sovint"        ,"suara"         ,"sí"            ,"sóc"           ,"són"           ,"t"             ,"ta"            ,"tal"           ,"tals"        ,
"també"         ,"tampoc"        ,"tan"           ,"tanmateix"     ,"tant"          ,"tanta"         ,"tantes"        ,"tantost"       ,"tants"       ,
"te"            ,"tercer"        ,"tercera"       ,"terceres"      ,"tercers"       ,"tes"           ,"teu"           ,"teua"          ,"teues"       ,
"teus"          ,"teva"          ,"teves"         ,"ton"           ,"tos"           ,"tost"          ,"tostemps"      ,"tot"           ,"tota"        ,
"total"         ,"totes"         ,"tothom"        ,"tothora"       ,"tots"          ,"trenta"        ,"tres"          ,"tret"          ,"tretze"      ,
"tu"            ,"tururut"       ,"u"             ,"uf"            ,"ui"            ,"uix"           ,"ultra"         ,"un"            ,"una"         ,
"unes"          ,"uns"           ,"up"            ,"upa"           ,"us"            ,"va"            ,"vagi"          ,"vagin"         ,"vagis"       ,
"vaig"          ,"vair"          ,"vam"           ,"van"           ,"vares"         ,"vas"           ,"vau"           ,"vem"           ,"verbigràcia" ,
"vers"          ,"vet"           ,"veu"           ,"vint"          ,"vora"          ,"vos"           ,"vosaltres"     ,"vostra"        ,"vostre"      ,
"vostres"       ,"vostè"         ,"vostès"        ,"vuit"          ,"vuitanta"      ,"vuitena"       ,"vuitenes"      ,"vuitens"       ,"vuitè"       ,
"vés"           ,"vàreig"        ,"vàrem"         ,"vàreu"         ,"vós"           ,"xano-xano"     ,"xau-xau"       ,"xec"           ,"érem"        ,
"éreu"          ,"és"            ,"ésser"         ,"àdhuc"         ,"àlies"         ,"ça"            ,"ço"            ,"òlim"          ,"ídem"        ,
"últim"         ,"última"        ,"últimes"       ,"últims"        ,"únic"          ,"única"         ,"únics"         ,"úniques")

  docs <- tm_map(docs, removeWords, newstopwords)

  docs <- tm_map(docs, removePunctuation)

  #Normalization #Think about whether you should do this
   if (input$phulemma==1) {
            docs <- tm_map(docs, lemmatize_strings)
            } else{
            }
  docs <- tm_map(docs, stripWhitespace)

dtm <- DocumentTermMatrix(docs)
values$nphu<-names(docs)
# print((values$nphu))
# print(dtm)
            # remove sparse words
        sp <- ifelse(input$select==1, 0.998, 0.996)
            dtm <- removeSparseTerms(dtm,sp)#PHUDCFILY

            ui = unique(dtm$i)
            dtm = dtm[ui,]
print(dtm)
            dtm2list <- apply(dtm, 1, function(x) {
                paste(rep(names(x), x), collapse=" ")
})
            top_10_words<-data.frame(words=names(head((sort(rowSums(as.matrix(t(dtm))),decreasing=TRUE)),20)),freq=head((sort(rowSums(as.matrix(t(dtm))),decreasing=TRUE)),20), row.names=NULL)

     print(top_10_words)
values$top_10_words<-top_10_words
values$dtm<-dtm
docs <- VCorpus(VectorSource(dtm2list))
            names(docs) <- values$nphu
values$docs <- docs

            phuty <- data.frame(unlist(sapply(docs, values$content)))
phuty$doc_id <- names(sapply(docs, values$id))
phuty$doc_id <- str_replace_all(phuty$doc_id, ".id", "")
# print(head(values$x1))
phuty$time <- values$x1$time[match(phuty$doc_id, values$x1$doc_id)]
colnames(phuty)[1] <- "text"
phuty <- phuty[ ,c(2,1,3)]
# print(dim(phuty))
#         print(head(phuty))
values$x1 <- phuty


} else {

}

})

        ntextlda <- eventReactive(input$goButton, {

 if (input$select!=3) {


docs<-values$docs
           txphu <- as.numeric(unlist(strsplit(input$trimvec,",")))
           docs <- tm_map(docs, removeWords, values$top_10_words[txphu,1])

            dtm <- DocumentTermMatrix(docs)
            ui = unique(dtm$i)
            dtm = dtm[ui,]
values$tnames <- dtm$dimnames$Docs
#             ## Convert tdm to a list of text
            dtm2list <- apply(dtm, 1, function(x) {
                paste(rep(names(x), x), collapse=" ")
            })
#             ## convert to a Corpus
            docs <- VCorpus(VectorSource(dtm2list))
#             #tphu<-as.data.frame(dtm2list)
            names(docs) <- values$tnames
# print(names(docs))
            trp_10_words<-data.frame(words=names(head((sort(rowSums(as.matrix(t(dtm))),decreasing=TRUE)),20)),freq=head((sort(rowSums(as.matrix(t(dtm))),decreasing=TRUE)),20), row.names=NULL)
            print(dtm)
            print(trp_10_words)

            values$dtm<-dtm
            values$docs<-docs

            phuty <- data.frame(unlist(sapply(docs, values$content)))
phuty$doc_id <- names(sapply(docs, values$id))
phuty$doc_id <- str_replace_all(phuty$doc_id, ".id", "")
# print(head(values$x1))
phuty$time <- values$x1$time[match(phuty$doc_id, values$x1$doc_id)]
colnames(phuty)[1] <- "text"
phuty <- phuty[ ,c(2,1,3)]
# print(dim(phuty))
        # print(head(phuty))
values$x1 <- phuty

        }  else {

}
})

        ntopiclda <- eventReactive(input$goButtonT, {
		        if (input$select==2) {
 
values$group_dist <- values$group_distD
 
} else if (input$select==1) {
 
values$group_dist <- values$group_distW
 
} else {
 
}

if (nrow(values$group_dist)>1) {
print(paste("Based on the comparison groups in your data, you should see"))
print(paste(nrow(values$group_dist), " wordclouds and ", nrow(values$group_dist), " SENA interactive outputs. You will also obtain one", sep=""))
print(paste("interactive output of sentiment comparison and one PDF with all"))
print(paste("dyadic QAP correlations across all groups."))
    } else {
print(paste("Since you did not have comparison groups in your data, you will get one wordcloud"))
print(paste("and one SENA interactive output. You will also obtain one"))
print(paste("interactive output of sentiment analyses distribution."))
print(paste("The NULL message below indicates that no comparisons were conducted."))
    }

sentimentScoresphu <- data.frame(sentiment=NA,  Score=NA, time=NA, Prop=NA)
  z <- c()
for (p in levels(as.factor(values$x1$time))) {# time is the categorical indicator

      x2<-values$x1[values$x1$time==p, c("doc_id", "text")]
  docs <- Corpus(DataframeSource(x2),readerControl = list(language = "en"))
# SENTIMENTS FREQUENCY
  #Language selection
   if (input$phulangPHU==1) {
  sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "spanish", lowercase = TRUE)
  mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "spanish", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==2) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "english", lowercase = TRUE)
  mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "english", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==3) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "basque", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "basque", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
           } else if (input$phulangPHU==4) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "catalan", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "catalan", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==5) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "danish", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "danish", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==6) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "dutch", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "dutch", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==7) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "esperanto", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "esperanto", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==8) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "finnish", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "finnish", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==9) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "french", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "french", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==10) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "german", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "german", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==11) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "irish", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "irish", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==12) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "italian", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "italian", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==13) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "latin", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "latin", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==14) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "portuguese", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "portuguese", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==15) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "romanian", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "romanian", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else if (input$phulangPHU==16) {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "swedish", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "swedish", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            } else {
   sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "welsh", lowercase = TRUE)
   mixed_improved <- function (string, remove_neutral = TRUE)
{
    tokens <- get_tokens(string)
    # sen <- sign(get_sentiment(tokens))
	sen <- colSums(get_nrc_sentiment(tokens, cl = NULL, language = "welsh", lowercase = TRUE)[,9:10])
    if (remove_neutral) {
        sen <- sen[sen != 0]
    }
    # freqs <- table(sen)/length(sen)
	freqs <- sen/sum(sen)
    entropy <- -sum(freqs * log2(freqs))
    metric_entropy <- entropy/sum(sen)
    c(entropy = entropy, metric_entropy = metric_entropy)
}
            }
   # sentiments_db <- get_nrc_sentiment(docs$content, cl = NULL, language = "english", lowercase = TRUE)
    rownames(sentiments_db)<- names(docs$content)

{#PHUDCFILY new
ent <- data.frame(t(as.data.frame(lapply(docs$content, mixed_improved))))
rownames(ent) <- names(docs$content)
ent$group <-cut(ent$entropy, c(0,.33,.66,1), right=TRUE, labels = FALSE, include.lowest=T)
ent$group <- ifelse(ent$group==1, "Low entropy, high consistency", ifelse(ent$group==2, "Mid entropy, lower consistency","High entropy, high inconsistency"))

labent <- ifelse(mean(ent$entropy)<0.33, paste("Low entropy, high consistency (mean entropy: ", round(mean(ent$entropy), 3), ")", sep=""), ifelse(mean(ent$entropy)>0.66, paste("High entropy, high inconsistency (mean entropy: ", round(mean(ent$entropy), 3), ")", sep=""), paste("Mid entropy, lower consistency (mean entropy: ", round(mean(ent$entropy), 3), ")", sep="")))
}

sentimentScores = data.frame(colSums(sentiments_db))
  names(sentimentScores) = "Score"
  sentimentScores = cbind("sentiment"= rownames(sentimentScores), sentimentScores)
  sentimentScores = sentimentScores
  sentimentScores$time <- p
  sentimentScores$Prop <- c(round(sentimentScores[1:8,]$Score/sum(sentimentScores[1:8,]$Score), 3), round(sentimentScores[9:10,]$Score/sum(sentimentScores[9:10,]$Score), 3))
  sentimentScoresphu <- rbind(sentimentScoresphu, sentimentScores)
  # print(sentiments_db)

  # Matrices for QAP PHUDCFILY
emot <-  select(sentiments_db, -c(negative, positive))
# emot <- as.matrix(t(as.matrix(emot>0))%*%as.matrix(emot))
z[[p]] <- as.matrix(t(as.matrix(emot>0))%*%as.matrix(emot))#as.matrix(t(apply(emot, 1, function(x)(x-min(x))/(max(x)-min(x)))))
# print(z)

### Network manipulations
library(igraph)
dbs<-data.frame(name=rownames(sentiments_db), prop_positive=round(sentiments_db[,10]/rowSums(sentiments_db[,c(9,10)]),3))
sentiments_db <- sentiments_db[,-c(9,10)]
 g <- graph.incidence(as.matrix(sentiments_db), weighted = TRUE, directed = TRUE, mode="out")

  #The following code adds the two-mode structure to the graph "g"
  V(g)$type <- V(g)$name %in% rownames(sentiments_db)
  table(V(g)$type)[2]
  i<-table(V(g)$type)[2]
  i

  #Gets centrality measures
  cent<-data.frame(bet=betweenness(g, normalized=T, directed = FALSE)/max(betweenness(g, normalized=T, directed = FALSE)),eig=evcent(g)$vector, degree=degree(g, mode="total")/max(degree(g, mode="total")))
  cent$index <- rowSums(cent)
  cent$name<-rownames(cent) #Ids in this case
  head(cent);tail(cent)

  ###
  cent$bet[1:i]<-(cent$bet[1:i]/max(cent$bet[1:i]))*.05
  cent$eig[1:i]<-cent$eig[1:i]/max(cent$eig[1:i])
  cent$index[1:i]<-cent$index[1:i]/max(cent$index[1:i])*.5
  summary(cent[1:i,])
  cent$bet[(i+1):nrow(cent)]<-cent$bet[(i+1):nrow(cent)]/max(cent$bet[(i+1):nrow(cent)])*20
  cent$eig[(i+1):nrow(cent)]<-cent$eig[(i+1):nrow(cent)]/max(cent$eig[(i+1):nrow(cent)])
  cent$index[(i+1):nrow(cent)]<-cent$index[(i+1):nrow(cent)]/max(cent$index[(i+1):nrow(cent)])*20
  summary(cent[(i+1):nrow(cent),])

  #Gets time invariant actor attributes
  #actors<- a[!duplicated(a$ID), ]

  #Interactive Visualization
  V(g)$label<-V(g)$name
  V(g)$name<-1:length(V(g))

  ############
  #In HTML visualizations (like NetworkD3) we need two datasets, one for links, another for nodes attributes.
  ############

  #Gets edgelist from graph, also any other attribute at the edge level to be included in the mapping
  links<-as.data.frame(cbind(get.edgelist(g), E(g)$weight))

  #Needs to be numeric
  links$V1<-as.numeric(as.character(links$V1))

  links$V2<-as.numeric(as.character(links$V2))
  # str(links)

  links$V3<-round(as.numeric(as.character(links$V3)),3)
  head(links)

  colnames(links)<-c("source","target", "value") #value is grade of the course

  #Counts begin at zero in computer programming
  links[,1:2]<-(links[,1:2]-1)

  dim(links)
#print(summary(links$value))
  #Adding attributes at the actor level
  V(g)$size<- cent$bet[match(V(g)$label, cent$name)]
  V(g)$prop.pos <- dbs$prop_positive[match(V(g)$label, dbs$name)]
  ###############################################################################
  # If you have missing data at actor level, this may be needed##
  # V(g)$firstgen[1:i] <- ifelse(is.na(V(g)$firstgen[1:i]), "first_Gen_NA", V(g)$firstgen[1:i])
  ########
  # V(g)$firstgen[(i+1):length(V(g)$label)] <- ifelse(is.na(V(g)$firstgen[(i+1):length(V(g)$label)]), "this is a course", V(g)$firstgen[(i+1):length(V(g)$label)])
  ###############################################################################

  #summary(V(g)$size)

  nodes <- data.frame(name= c(paste("ID: ", V(g)$label[1:i], ", ", "Pct. Pos. Sentiments: ", V(g)$prop.pos[1:i]*100, ", ", ent$group, " (EE = ", round(ent$entropy, 3), ")", sep=""), V(g)$label[i+1:ncol(sentiments_db)]),
                      group = c(rep("Units", i), V(g)$label[i+1:ncol(sentiments_db)]),
                      size=V(g)$size)
  nodes$name<-as.character(nodes$name)
  nodes$name<-gsub(".txt", "", nodes$name)

  counts<-data.frame(table(nodes$group))
  counts$Freq <- ifelse(counts$Var1=="Units", counts$Freq, data.frame(colSums(sentiments_db))[,1][match(counts$Var1, rownames(data.frame(colSums(sentiments_db))))])

  counts$labels <- paste(counts$Var1, ", N= ", counts$Freq, sep="")
  counts$labels <- ifelse(counts$Var1=="Units", paste("Units in cat. ", p, ", N= ", counts$Freq[counts$Var1=="Units"], sep=""), counts$labels)

  nodes$groups <- counts$labels[match(nodes$group, counts$Var1)]
  head(nodes)
  nodes$groups <- ifelse(nodes$group=="Units", counts$labels[counts$Var1=="Units"], nodes$groups)
  netviz <- forceNetwork(Links = links, Nodes = nodes,
                         Source = 'source', Target = 'target',
                         NodeID = 'name',
                         Group = "groups", # color nodes by group calculated earlier
                         charge = -1300, # node repulsion
                         linkDistance = JS("function(d) { return d.linkDistance; }"),#JS("function(d){return d.value}"),
                         linkWidth = JS("function(d) { return Math.sqrt(d.value)*4; }"),
                         opacity = 0.8,
                         Value = "value",
                         Nodesize = 'size',
                         radiusCalculation = JS("Math.sqrt(d.nodesize*30)+10"),
                         zoom = T,
                         fontSize=14,
                         bounded= F,
                         legend= TRUE,
                         linkColour = ifelse(links$value < quantile(links$value, .95), "#49505780", "#dcf3ff80"),
                         colourScale = JS("d3.scaleOrdinal(d3.schemeCategory20)"))

  ###netviz <- htmlwidgets::prependContent(netviz, htmltools::tags$h1(paste0("SENA by group/time: ", p)))

  HTMLaddons <-
    "function(el, x) {
d3.select('body').style('background-color', ' #212f3d')
d3.selectAll('.nodetext').style('fill', 'white').style('font-weight', 'bold')
d3.selectAll('.legend text').style('fill', 'white')//.style('font-size', '60%')
//d3.select('h1').style('color', 'white').style('font-family','sans-serif')
 d3.selectAll('.link').append('svg:title')
      .text(function(d) { return 'Intensity: ' + d.value ; })
  var options = x.options;
  var svg = d3.select(el).select('svg')
  var node = svg.selectAll('.node');
  var link = svg.selectAll('link');
  var mouseout = d3.selectAll('.node').on('mouseout');
  function nodeSize(d) {
    if (options.nodesize) {
      return eval(options.radiusCalculation);
    } else {
      return 6;
    }
  }


d3.selectAll('.node').on('click', onclick)

  function onclick(d) {
    if (d3.select(this).on('mouseout') == mouseout) {
      d3.select(this).on('mouseout', mouseout_clicked);
    } else {
      d3.select(this).on('mouseout', mouseout);
    }
  }

  function mouseout_clicked(d) {
    node.style('opacity', +options.opacity);
    link.style('opacity', +options.opacity);

    d3.select(this).select('circle').transition()
      .duration(750)
      .attr('r', function(d){return nodeSize(d);});
    d3.select(this).select('text').transition()

      .duration(1250)
      .attr('x', 0)
      .style('font', options.fontSize + 'px ');
  }
}
"
netviz$x$links$linkDistance <- (1/links$value)*125
phu <- onRender(netviz, HTMLaddons)
#my_path <- tempdir()
#a1$my_path <- my_path
phu
# print(values$my_path)
saveWidget(widget = phu, file = paste(values$my_path, "/index", p, ".html", sep=""), selfcontained = FALSE, libdir = "lib")
utils::browseURL(paste(values$my_path, "/index", p, ".html", sep=""))
   ### Closing networks PHUDCFILY

###Wordcloud
tdm <- TermDocumentMatrix(docs)
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
# write.csv(d, "Bank Of Words.csv", row.names=FALSE)
d$word<-as.character(d$word)
m<-t(m)
#Let's look at names in the matrix
rownames(m)
# let's remove the extension
a<-matrix(unlist(strsplit(names(docs), ".txt")),ncol=1,byrow=T) #matrix of names
rownames(m)<-a
table(d$freq)
phudcfilyty <- wordcloud2(d, color = "random-light", backgroundColor = "grey") %>%
  htmlwidgets::prependContent(htmltools::tags$h1(paste("Group: ", p, ", ", labent, sep=""),style = "font-family: Menlo; font-size: 14px"))

saveWidget(widget = phudcfilyty, file = paste(values$my_path, "/index", p, "wc.html", sep=""), selfcontained = FALSE, libdir = "lib")
utils::browseURL(paste(values$my_path, "/index", p, "wc.html", sep=""))

###Closess wordcloud PHUDCFILY
} # closes loop PHUDCFILY

sentimentScoresphu <- sentimentScoresphu[-1,]
sentimentScoresphu$classifPHU <- ifelse(sentimentScoresphu$sentiment %in% c("anger", "disgust", "fear", "sadness"), "Negative Emotions", ifelse(sentimentScoresphu$sentiment %in% c("anticipation", "joy", "surprise", "trust"), "Positive Emotions", "Sentiments"))
write.csv(sentimentScoresphu, "www/testingV9", row.names=F)
phu <-ggplot(data=sentimentScoresphu, aes(x = time, y = Prop, fill = sentiment, text= paste("Sentiment|Emotion: ", sentiment, " <br /> Prop: ", Prop, " <br /> Value: ", Score, sep="")))+ labs(x = paste("Sentiments Distribution with", labent, paste="")) +
  facet_wrap(~ classifPHU, scales = "free_x") + #, nrow = 3
  geom_col(position = "dodge")+
  theme_bw()
phudcfily <- ggplotly(phu, tooltip = c("text"))
saveWidget(widget = phudcfily, file = paste(values$my_path, "/index_senti_comparat.html", sep=""), selfcontained = FALSE, libdir = "lib")
utils::browseURL(paste(values$my_path, "/index_senti_comparat.html", sep=""))

#QAP PHUDCFILY
if (nrow(values$group_dist)>1){
# dev.off()
pdf(paste(values$my_path, "/qap.pdf", sep=""), 8.5, 9)
detach(package:igraph)
library(sna)
g <-simplify2array(z)
g <- aperm(g, c(3,1,2)) #aperm, from the base package. It is a generalization of the transpose t() function to multidimensional arrays https://stackoverflow.com/questions/10679131/how-to-change-order-of-array-dimensions
xn <- levels(as.factor(values$x1$time) )
x <- 1:length(levels(as.factor(values$x1$time) ))
y<-2
all_combinations <- combn(x,y)
all_combinations_n <- (combn(xn,y))
for (p in 1:ncol(all_combinations)) {
set.seed(47)
tmp<-qaptest(g,gcor,g1=all_combinations[1,p],g2=all_combinations[2,p],reps=50000)
summary(tmp)
plot(tmp)
mtext(paste("Comparisons: ",all_combinations_n[1,p], " and ", all_combinations_n[2,p], sep=""), line = 3)

mtext(paste("Observed Rho (blue) = ", round(tmp$testval, 3), ", mean of 50,000 permutations = ", round(mean(tmp$dist), 3), ", (two SDs = ", 2*round(sd(tmp$dist), 3), ", red)", sep=""))

abline(v = -2*round(sd(tmp$dist), 3), col="red", lwd=3, lty=2)
abline(v = 2*round(sd(tmp$dist), 3), col="red", lwd=3, lty=2)
abline(v = round(tmp$testval, 3), col="blue", lwd=3, lty=2)
}
dev.off()
      values$url <- a("Click here to Open all QAP comparisons",target="_blank",href="localpath/qap.pdf")#PHUDCFILY, download = 'independence_test.pdf')
} else {

}

        })

        output$nText <- renderPrint ({
            ntext()
        })

        output$nTextlda <- renderPrint ({
            ntextlda()
        })

        output$nTopiclda <- renderPrint ({
            ntopiclda()
        })

                    output$tab <- renderUI({
              tagList("When comparing groups, a link with hypotheses test will show here:", values$url)
            })

#         topicmodeling <- eventReactive(input$go, {


#             ap_lda <- LDA(values$dtm, k = input$obs, method = "Gibbs", control = list(seed = 47, burnin = input$burnin, iter = input$iterations))
#             #PHUDCFILY new matching
#                         fitted<-ap_lda
#                         corpus<-values$corp
#                         doc_term<-values$dtm

#                         phi <- posterior(fitted)$terms %>% as.matrix
#                         theta <- posterior(fitted)$topics %>% as.matrix
#                         vocab <- colnames(phi)
#                         doc_length <- vector()
#                         for (i in 1:length(corpus)) {
#                             temp <- paste(corpus[[i]]$content, collapse = ' ')
#                             doc_length <- c(doc_length, stri_count(temp, regex = '\\S+'))
#                         }
#                         temp_frequency <- as.matrix(doc_term)#inspect(doc_term)
#                         freq_matrix <- data.frame(ST = colnames(temp_frequency),
#                         Freq = colSums(temp_frequency))
#                         rm(temp_frequency)

#                         # Convert to json
#                         svd_tsne <- function(x) tsne(svd(x)$u)
#                         json_lda <- createJSON(phi = phi, theta = theta,
#                         vocab = vocab,
#                         doc.length = doc_length,
#                         term.frequency = freq_matrix$Freq,
#                         mds.method = svd_tsne)

#             serVis2 <- function (json, out.dir = tempfile(),
#                             as.gist = FALSE, ...)
#                         {
#                             dir.create(out.dir)
#                             src.dir <- system.file("htmljs", package = "LDAvis")
#                             to.copy <- Sys.glob(file.path(src.dir, "*"))
#                             file.copy(to.copy, out.dir, overwrite = TRUE, recursive = TRUE)
#                             cat(json, file = file.path(out.dir, "lda.json"))
#                           d<<-(out.dir)
#                       m<<-httd(d, daemon = TRUE)$url
#                   }

#                         serVis2(json_lda)
#                         # print(d) #just to point the tmp local dir
#                   # print(m) #this should be active based on @yihui help!!! Thank you again!
#                   utils::browseURL(m)
#                   new.order <- RJSONIO::fromJSON(json_lda)$topic.order
#                   ###PHUDCFILY

#             topicProbabilities <- as.data.frame(ap_lda@gamma); tnlda <- names(topicProbabilities)
#             topicProbabilities <- topicProbabilities[, new.order]; names(topicProbabilities) <- tnlda
#             topicProbabilities <- round(topicProbabilities,3)
#             #head(topicProbabilities)
#             #dim(topicProbabilities)
#             topicProbabilities$topic<-colnames(topicProbabilities)[max.col(topicProbabilities,ties.method="first")]
#             topicProbabilities$text<- ap_lda@documents
#             values$naqd<-topicProbabilities #PHUDCFILY
#             topicProbabilities$quote <- values$x1$text[match(topicProbabilities$text, values$x1$doc_id)]
#             topicProbabilities$text_input <- values$x2$text[match(topicProbabilities$text, values$x2$doc_id)]
#             topicProbabilities$text#<-NULL

#             topicProbabilities$relative_probability <- apply(topicProbabilities[,1:input$obs], 1, max)
#             #Select the five best examples PHUDCFILY

#             g<-as.data.frame(aggregate(relative_probability~topic, topicProbabilities, max))
#             gavg<-as.data.frame(aggregate(relative_probability~topic, topicProbabilities, mean))#PHUDCFILY
#             topicProbabilities$max_group <- g$relative_probability[match(topicProbabilities$topic, g$topic)]
#             topicProbabilities$max_group_avg <- gavg$relative_probability[match(topicProbabilities$topic, gavg$topic)]
#             topicProbabilities$post_estimate<-topicProbabilities$relative_probability#/topicProbabilities$max_group

#             topicProbabilities$relative_probability<-topicProbabilities$relative_probability/topicProbabilities$max_group
#             topicProbabilities$relative_group_fit<-topicProbabilities$max_group_avg/(max(topicProbabilities$max_group_avg))

#             topicProbabilities$relative_text_contribution <- round(topicProbabilities$relative_probability, 3)
#             topicProbabilities$relative_group_fit <- round(topicProbabilities$relative_group_fit, 3)
#             topicProbabilities$code <- topicProbabilities$topic
#             topicProbabilities<-topicProbabilities[,c("code","text","relative_text_contribution", "relative_group_fit", "quote", "text_input")] #"max_group", "max_group_avg", "post_estimate", PHUDCFILY

#             values$findings<-topicProbabilities

#       {
# # naqd<-read.csv(paste(getwd(),"/topicProbabilities.csv",sep=""))
# naqd<-values$naqd[,c("text","topic")] #PHUDCFILY
# naqd$text<-str_replace_all(naqd$text, "[:digit:]", "") #PHUDCFILY
# naqd$text<-substr(naqd$text,1,nchar(naqd$text)-5)
# head(naqd)
# library(igraph)
# gphu<-graph.data.frame(naqd)

# #Type of network
# V(gphu)$type <- V(gphu)$name %in% naqd$text
# i<-table(V(gphu)$type)[2]

# cent1<-data.frame(totaldegree=degree(gphu, mode="total"),
# indegree=degree(gphu, mode="in"), outegree=degree(gphu, mode="out"),
# bet=round(betweenness(gphu, directed=F, normalized = TRUE, weights=NA),3),
# eig=round(evcent(gphu, weights=NA)$vector,3))
# cent1#this prints the table
# cent1$ID<-rownames(cent1)
# cent1$eig[1:i]<-round(cent1$eig[1:i]/max(cent1$eig[1:i]),3)
# cent1$eig[(i+1):nrow(cent1)]<-round(cent1$eig[(i+1):nrow(cent1)]/max(cent1$eig[(i+1):nrow(cent1)]),3)


# E(gphu)$weight<-1
# gphu <- simplify(gphu)
# E(gphu)$weight

# #hypothesis testing PHUDCFILY
# datatable<-t(get.incidence(gphu, attr="weight"))
# rownames(datatable)<-paste(rownames(datatable), ", n=", rowSums(datatable), sep="")
# colnames(datatable)<-paste(colnames(datatable), ", n=", colSums(datatable), sep="")
# chisq.test(datatable,simulate.p.value = TRUE, B=5000)
# dt<-as.table(datatable)
# library("graphics")
# pdf("www/independence_test.pdf", 8.5, 9)
# mosaicplot(dt, shade = TRUE, las=2, main=paste("Test of independence, X-squared = ", round(chisq.test(datatable,simulate.p.value = TRUE, B=5000)[1][[1]],2), ", p.val =< ", round(chisq.test(datatable,simulate.p.value = TRUE, B=5000)[3][[1]],3), sep=""))
# dev.off()
# # output$tables <- DT::renderDataTable({ #PHUDCFILY
# # datatable(dt, caption=htmltools::tags$p(a("Click here to Open a Chi-squared test of independence",target="_blank",href="qap.pdf"))
# # }

# #Community PHUDCFILY
# cd <- cluster_spinglass(gphu)
# cd$names

# dfphu<-data.frame(name=cd$names, community=cd$membership)
# cent1$community <- dfphu$community[match(cent1$ID, dfphu$name)]

# ###print(head(cent1, 25))#PHUDCFILY

# a<-as.data.frame(cbind(get.edgelist(gphu), E(gphu)$weight))
# a$cont_tot <- cent1$outegree[match(a$V1,cent1$ID)]
# a$weight<-as.numeric(as.character(a$V3))
# a$prop_rel <- round(a$weight/a$cont_tot,3) #PHUDCFILY
# ###print(head(a, 25)) #PHUDCFILY
# a$cont_tot <- NULL #This info is in cent1 phudcfily
# a$V3 <- NULL #This info is in weight phudcfily
# colnames(a)[1:2]<-c("ID","codename")
# ###head(a, 25) #PHUDCFILY PHUDCFILY
# detach(package:igraph)

# library(ndtv)
# library(networkDynamic) # load the dynamic extensions
# library(dplyr)
# library(scales)

# a$k<-paste(a$ID, a$codename, sep="")

# a$filename<-as.numeric(as.factor(a$ID))
# a$cid<-max(a$filename)+as.numeric(as.factor(a$codename))
# a$on<-(ave(a$filename, a$filename, FUN=seq_along))#-1
# a$term<-(max(a$on)+1)
# head(a)
# ###str(a)#PHUDCFILY

# vd<-data.frame(id=c(unique(a$filename), unique(a$cid)),onset=rep(0,length(c(unique(a$filename), unique(a$cid)))),term=rep((max(a$term)+1)))
# head(vd)

# vd$vertex_id<-as.character(a$codename[match(vd$id,a$cid)])
# # vd$vertex_id<-a$filename[match(vd$id,a$filename)]
# vd[is.na(vd$vertex_id),]$vertex_id<-vd[is.na(vd$vertex_id),]$id
# vd
# #PHUDCFILY PHUDCFILY
# a$lead2<-a$on+2#input$obs#coming from user input PHUDCFILY
# # fix(a)

# classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=a[,c("on", "lead2", "filename","cid")], verbose=FALSE)

# a2<-data.frame(c(table(a$filename),table(a$codename)))
# a2$id<-rownames(a2)
# a2
# names(a2)[1]<-"f"

# vd
# vd$f<-a2$f[match(vd$vertex_id,a2$id)]
# classDyn %v% "f" <- vd$f[match(classDyn %v% "vertex.names", vd$id)]

# b<-as.data.frame(classDyn)
# head(b)

# b1<-b[!duplicated(b$edge.id),]
# b1$e.id <- paste(b1$tail,b1$head, sep="")
# # head(b1)

# a$k2<-paste(a$filename, a$cid,sep="")
# a$edge.id<-b1$edge.id[match(a$k2, b1$e.id)]
# # a$quotes<-as.character(am$quotes)
# a$pct_weight <-a$prop_rel*100
# classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=a[,c("on", "lead2", "filename","cid", "weight", "pct_weight")], create.TEAs = TRUE, edge.TEA.names=c("weight", "pct_weight"), verbose=FALSE)
# #head(a) PHUDCFILY

# cent1$id <- a$filename[!duplicated(a$filename)][match(cent1$ID,a$ID[!duplicated(a$filename)])]
# cent1$id <- ifelse(is.na(cent1$id), (a$cid[!duplicated(a$cid)][match(cent1$ID,a$codename[!duplicated(a$cid)])]), cent1$id)

# a$ecol<-ifelse(match(paste(a$ID,a$weight),paste(aggregate(weight~ID, a, max)$ID,aggregate(weight~ID, a, max)$weight)),alpha('deepskyblue2',0.8))
# classDyn %e% "e.id"<- as.numeric(paste(b1$tail,b1$head, sep=""))
# classDyn %e% "coledge"<- a$ecol[match(classDyn %e% "e.id", a$k2)]#no missing PHUDCFILY
# classDyn %e% "coledge" <- ifelse(is.na(classDyn %e% "coledge"), alpha('snow',0.8), classDyn %e% "coledge")

# classDyn %v% "f" <- cent1$totaldegree[match(classDyn %v% "vertex.names", cent1$id)] #f is degree
# classDyn %v% "power" <- cent1$eig[match(classDyn %v% "vertex.names", cent1$id)]#no missing PHUDCFILY
# classDyn %v% "female" <- cent1$community[match(classDyn %v% "vertex.names", cent1$id)]

# cent1$border <-1
# cent1$border[1:i] <-2

# classDyn %v% "border" <- cent1$border[match(classDyn %v% "vertex.names", cent1$id)]

# classDyn %v% "role" <- ifelse(classDyn %v% "border" == 1, "Latent code", "Expert or text input")

# classDyn %v% "com" <- ifelse(is.na(classDyn %v% "female"), "#E31B23", ifelse(classDyn %v% "female" == 1, "#FF007F", ifelse(classDyn %v% "female" == 2, "#FF7F00", ifelse(classDyn %v% "female" == 3, "#FF0000",ifelse(classDyn %v% "female" == 4, "#7FFF00", ifelse(classDyn %v% "female" == 5, "#00FFFF",ifelse(classDyn %v% "female" == 6, "#007FFF", ifelse(classDyn %v% "female" == 7, "#0000FF", ifelse(classDyn %v% "female" == 8, "#7F00FF", ifelse(classDyn %v% "female" == 9, "#FF00FF", "#FFFF00"))))))))))

# classDyn %v% "sides" <- ifelse(is.na(classDyn %v% "border"), 4, ifelse(classDyn %v% "border" == 1, 200, 3))

# classDyn %v% "bet" <- round(betweenness(classDyn, gmode="graph", cmode="undirected"),2) # Geographic betweenness

# # t<-classDyn%v%"bet"
# # t[1:i] <- round(t[1:i]/max(t[1:i]),3)
# # t[(i+1):length(t)] <- round(t[(i+1):length(t)]/max(t[(i+1):length(t)]),3)
# # t
# classDyn  %v% "bet"

# classDyn %v% "labels" <- as.character(a$ID[match(classDyn %v% "vertex.names", a$filename)])
# classDyn %v% "labels" <- ifelse(is.na(classDyn %v% "labels"), as.character(a$codename)[match(classDyn %v% "vertex.names", a$cid)], classDyn %v% "labels")
# classDyn %v% "unique_number" <- data.frame(id=rownames(data.frame(number_actors=c(table(a$ID),table(a$codename)))),number_actors=c(table(a$ID),table(a$codename)))$number_actors[match(classDyn %v% "labels", data.frame(id=rownames(data.frame(number_actors=c(table(a$ID),table(a$codename)))),number_actors=c(table(a$ID),table(a$codename)))$id)] #PHUDCFILY
# #PHUDCFILY

# collapsed <- network.collapse(classDyn, onset=1, terminus=max(a$term)+1)
# render.d3movie(collapsed,
# vertex.sides=collapsed %v% "sides",
# usearrows = F, label.cex=.5,
# label.col=rgb(250, 250, 250,max=255, 255/2),
# displaylabels = F, label=collapsed %v% "labels",
# bg=rgb(11, 11, 11, max=255, 255/1), #222, 222, 222
# vertex.border="NA",
# vertex.cex = (collapsed %v% "bet"/max(collapsed %v% "bet")+.5),
# vertex.col = alpha(collapsed %v% "com", 0.8),
# vertex.tooltip = paste("<b>Name:</b>",(collapsed %v% "labels"),"<br>","<b>Role:</b>",(collapsed %v% "role"),"<br>","<b>Influence index:</b>", (collapsed %v% "power"),"<br>","<b>Total # of relations:</b>", (collapsed %v% "f"),"<br>","<b>Unique # of relations:</b>", (collapsed %v% "unique_number"),"<br>","<b>Community assigned:</b>", (collapsed %v% "female")),#PHUDCFILY
# edge.lwd = (collapsed %e% "pct_weight")/4,
# edge.col = classDyn %e% "coledge",#rgb(118, 238, 0,max=255, 255/3), #11, 11, 11
# edge.tooltip = paste("<b>Edge weight:</b>", (collapsed %e% "weight"), "<br><b>Pct Edge weight:</b>", (collapsed %e% "pct_weight"), "%"),
# launchBrowser=T, filename="collapsed_analyses.html",
# main="")#Aggregated depiction, size by bet centrality
# utils::browseURL(paste(getwd(),"/collapsed_analyses.html",sep="")) #PHUDCFILY
# }

# {#PHUDCFILY
# library(igraph)
# values$findings$ID<- sub("^(.*)[.].*", "\\1", values$findings$text)
# library(igraph)
# g<-graph.data.frame(values$findings[,c("ID", "code")])
# #Type of network
# V(g)$type <- V(g)$name %in% values$findings$ID
# i<-table(V(g)$type)[2]

# cent12<-data.frame(outegree=degree(g, mode="out"))
# cent12#this prints the table
# cent12$ID<-rownames(cent12)
# cent12<-cent12[1:i,]

# E(g)$weight<-1
# g<- simplify(g)

# aphuf<-as.data.frame(cbind(get.edgelist(g), E(g)$weight))
# names(aphuf)<-c("ID", "LACOID", "Weight")
# aphuf$total<-cent12$outegree[match(aphuf$ID, cent12$ID)]
# aphuf$Weight<-as.numeric(as.character(aphuf$Weight))
# aphuf$pct<-(round(aphuf$Weight/aphuf$total,3))*100
# aphuf<-reshape(aphuf[,c("ID", "LACOID", "Weight", "pct")], idvar = "ID", timevar = "LACOID", direction = "wide")
# aphuf[is.na(aphuf)]<-0
# aphuf$Tot_number_LACOID<-cent12$outegree[match(aphuf$ID, cent12$ID)]
# aphuf<-aphuf[,c(1,ncol(aphuf),2:(ncol(aphuf)-1))]
# values$aphuf<-aphuf
# detach(package:igraph)
# }


#       url <- a("Click here to Open the Chi-squared test of independence",target="_blank",href="independence_test.pdf")#PHUDCFILY, download = 'independence_test.pdf')
#     output$tab <- renderUI({
#       tagList("Hypothesis test:", url)
#     })

#             output$table <- renderDataTable({
#                 ex1 <-  as.data.frame(topicProbabilities %>% group_by(code) %>% top_n(input$topphu, relative_text_contribution))
#                 values$ex1<-ex1
#                 datatable(ex1, caption=htmltools::tags$caption("Most representative texts per latent code and coherence assessments", style = 'caption-side: top; text-align: center; color:black; font-size:200% ;'), options = list(
#                 pageLength = input$topphu*input$obs))
#             })

#             observeEvent(input$topphu, {
#                 updateSliderInput(session,inputId = "table" ,value = input$topphu,
#                 min = 1, max = 20, step = 1)
#             })

#         })

#         output$TopicModeling <- renderPrint ({
#             topicmodeling()
#         })

#         # downloadHandler() takes two arguments, both functions.
#         # The content function is passed a filename as an argument, and
#         #   it should write out data to that filename.
#         output$downloadData <- downloadHandler(

#         # This function returns a string which tells the client
#         # browser what name to use when saving the file.
#         filename = function() {
#             paste("Full_Machine_Learned_Classes", "csv", sep = ".")
#         },

#         # This function should write data to a file given to it by
#         # the argument 'file'.
#         content = function(file) {
#             #  sep <- switch(input$filetype, "csv" = ",", "tsv" = "\t")

#             # Write to a file specified by the 'file' argument
#             write.table(values$findings, file, sep = ",",
#             row.names = FALSE)
#         }
#         )

#         output$downloadDataq <- downloadHandler(

#               # This function returns a string which tells the client
#               # browser what name to use when saving the file.
#               filename = function() {
#                   paste("File_LACOID_Dist", "csv", sep = ".")
#               },

#               # This function should write data to a file given to it by
#               # the argument 'file'.
#               content = function(file) {
#                   #  sep <- switch(input$filetype, "csv" = ",", "tsv" = "\t")

#                   # Write to a file specified by the 'file' argument
#                   write.table(values$aphuf, file, sep = ",",
#                   row.names = FALSE, na="0")
#               }
#               )

#         output$downloadDatas <- downloadHandler(

#         # This function returns a string which tells the client
#         # browser what name to use when saving the file.
#         filename = function() {
#             paste("Most_Representative_Docs", "csv", sep = ".")
#         },

#         # This function should write data to a file given to it by
#         # the argument 'file'.
#         content = function(file) {
#             #sep <- switch(input$filetype, "csv" = ",", "tsv" = "\t")

#             # Write to a file specified by the 'file' argument
#             write.table(values$ex1, file, sep = ",",
#             row.names = FALSE)
#         }
#         )


#    # output$distPlot <- renderPlot({
#       # # generate bins based on input$bins from ui.R
#       # x    <- faithful[, 2]
#       # bins <- seq(min(x), max(x), length.out = input$bins + 1)

#       # # draw the histogram with the specified number of bins
#       # hist(x, breaks = bins, col = 'darkgray', border = 'white')
#    # })

# Add this to the server function to terminate R when the app is closed
onStop(function() {
  # Check if we're running in RStudio
  if (Sys.getenv("RSTUDIO") == "1") {
    # If running in RStudio, just print a message
    message("Shiny app closed. To terminate R, please close RStudio.")
  } else {
    # If running outside RStudio, terminate R
    quit(save = "no")
  }
})

}

# Run the application
shinyApp(ui = ui, server = server)
