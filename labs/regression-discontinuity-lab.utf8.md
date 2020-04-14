---
title: "Regression Discontinuity Lab"
output:
  html_document:
    theme: readable
    df_print: paged
    highlight: tango
    toc: yes
    toc_float: no
    css: 'css/lab-instructions.css'
    includes:
      after_body: 'footer.html'
--- 









# Overview 

For this lab you need to upload the RegDisc_lab data available in the class R package. 

There are **4 sets of questions** to be answered. You can get up to 100 points + bonus questions. Points are indicated next to each question. 

Remember to:

* Format your table using stargazer 
* Submit the r markdown file with all your codes. 
* Bold your answers.


```r
URL <- "https://raw.githubusercontent.com/DS4PS/pe4ps-textbook/master/labs/DATA/RegDisc_lab2.csv"
data <- read.csv( URL, stringsAsFactors=F )
```


## The policy problem

> **Research question**: 
> Does summmer school improves low-achieving students' grades?

Summer school programs are designed to help students [improve their reading and math ability](https://www.wallacefoundation.org/knowledge-center/documents/an-analysis-of-the-effects-of-an-academic-summer-program-for-middle-school-students.pdf). They are generallly [dedicated to students who have not yet achieved the skills required by the next level](https://digitalcommons.nl.edu/cgi/viewcontent.cgi?article=1234&context=diss). There are, however, mixed evidence on [whether summer school works](https://www.npr.org/sections/ed/2014/07/07/323659124/what-we-dont-know-about-summer-school). 

For this lab, we are interested in testing the following:

> **Hypothesis**: 
> Students who attend summer school will report higher grades in spring. 

## Data

Data were collected among 500 students in a US public middle school. Students participated in the summer school program at the end of the 8th-grade (end of middle school) if they had a standardized math score lower than 60. We want to understand whether attending the summer school has an affect on the math GPA at the of the 9th-grade.

The dataset that the school principal provides you contains four variables: 

 **Variable name   **   | **Description    **                                                                                          
----------------------- | ------------------------------------------------------------------------------------------------------------
STD_math_7              |Standardized math score in 7th-grade, from 0 to 100                                                                     
GPA_8                   |Math GPA at the end of 8th-grade (before summer school), from 0 to 4
STD_math_8              |Standardized math scores in 8th-grade, from 0 to 100                                                                     
GPA_9                   |Math GPA at the end of 9th-grade (after summer school), from 0 to 4

You propose to use a regression discontinuity method to analyze the impact of summer school on students' grades.

# Lab Questions

## Q1: 

**Let's start by discussing why regression discontinuity is the right approach here** 

* **Q1a:** Calculate the mean GPA for the treatment and the control group in grade 9th. Is there a statistically significant difference? (5 + 5 points)
* **Q1b:** What does this suggest about the effect of the treatment (i.e., attending the summer school)? (5 points)
* **Q1c:** Plot the relationship between standardized math scores in the 7th-grade and GPA in grade 8th. (5 + 5 points)
* **Q1d:** After creating the plot, do we still trust the results form Q1a? Why? (10 points)

## Q2: 

Now prepare your data for the analysis:

* **Q2a:** Write the model formula. (5 points)
* **Q2b:** Create the new variables that you need: a Treatment variable and centered rating variable. (5 points for each variable)



## Q3: 

Once data are ready, you can estimate the regression discontinuity model. Pay attention to include the correct variables.

* **Q3a:** Provide the model output in stargazer. (5 + 5 points)
* **Q3b:** Which coefficient tests the hypothesis of this study? (5 points)
* **Q3c:** Can you conclude that summer school is effective in improving the math GPA of low achieving students? How big is the effect? Is it significant? (5 points for each question, total 15 points)

## Q4: 

Examine the counterfactual.

* **Q4a:** For each additional point in the STD math score a student obtains, how much does the GPA increase? (5 points)
* **Q4b:** Based on your results, what is the GPA of a student whose standardized math score is equal to 60 (the cutoff) and attended the summer school? (5 points)
* **Q4c:** What would be the GPA of a student who had a standardized math score equal to 50 and attended the summer school? (5 points)
* **Q4d:** What if the student did not attend the summer school? In other words, what is the counterfactual? (5 points)

## BONUS QUESTION: 

**What is the purpose of including the rating / score variable in the model? (10 points)**

* **BQ1:** Run the model without the rating / score variable. 
* **BQ2:** What does the intercept represent? 
* **BQ3:** What does the Treatment coefficient represent? 
* **BQ4:** What is the model without the score variable testing? Explain the counterfactual. 


<style type="text/css">

</style>
