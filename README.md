![exhaust](https://user-images.githubusercontent.com/59906657/168440871-7b8fec42-2e29-4c56-a69b-affa85a39ecf.png)

# Predict CO<sub>2</sub> Emissions
## Overview
Using various vehicle data from the European Union (EU), predict CO<sub>2</sub> emissions for a variety of vehicle and fuel types using machine learning. The UK has a ban on petrol and diesel cars that is set to take effect in 2030 as well as strict emissions standards.  One such standard involves a tax that is relative to the amount of exhaust emissions, so more emissions leads to more cost for the customer (BuyACar Team, [2021](https://www.buyacar.co.uk/cars/economical-cars/low-emission-cars/337/co2-emissions-and-gkm-meaning)).  This makes it important for car manufacturers to be able to predict emissions of their vehicles to help reduce costs for their customers.  Given multiple inputs, this model will attempt to predict fuel emissions so changes can be made in vehicle design to save customers more money.  

Questions we hope to answer include:  
* What inputs, if any, more accurately predict emissions?
* What fuel type has the lowest emissions?  

## Technology
* Python
  - Libraries: Matplotlib, Seaborn, Sklearn, Pandas, Numpy, Sqlalchemy, Psycopg2, os, sys, datetime, and math  
* Jupyter Notebook
* Database
  - SQL, AWS RDS, Postgres, SQLite 
* Tableau
* HTML

## Data Source
[Kaggle: CO<sub>2</sub> Emissions from Cars](https://www.kaggle.com/datasets/vivovinco/monitoring-of-co2-emissions-from-passenger-cars) 
* Sample of data
 ![data_sample](https://user-images.githubusercontent.com/59906657/171918147-7efa1942-09eb-46ab-b6da-a946034e8b17.PNG)

## Main Project Files & Folders
* ML Model and Results
  - ML_Model_2.ipynb
  - Model_Test_Table_2.xlsx
* Data Prep/Cleaning
  - Clean & Prep & Create/
  - Resource/
* Database 
  - ERD & SQL Images/
  - Database/
* Dashboard
  - Final Project Emissions.twbx

## Data Exploration & Analysis
### Exploration
During initial exploration of the data, the team found that only a selection of the 33 columns of the dataset would be usable for meaningful analysis. Therefore, we removed all columns except the following: ID, Mk, Category Type Approved, Category Registered, Ft, Fm, Mass, CO<sub>2</sub>, W, Steering Axle, Other Axle, Engine Capacity, and Engine Power. Then, we removed columns with null values that may throw off the model. This left us with over 12,000 rows of usable data.  

Next, we noticed that the Mk and Ft columns had duplicate values due to formatting differences. These were corrected for a more uniform appearance and more accurate analysis.  

### Analysis
After the data was shaped, we created several scatter plots with our variables against CO<sub>2</sub> emissions in order to see their relationship. It was determined that most of the variables had a positve linear relationship with the emissions data. Therefore, we determined that a linear regression model would be best for our machine learning model. 

## Database
### Process
After initial cleaning, we split our data set into 2 tables; one with variables relating to car size and the other relating to car categories. We utilized Amazon Web Services Relational Database System to host our data. We linked it to the open source database Postgres in order to manipulate and join our tables using SQL.

### ERD
![ERD](https://user-images.githubusercontent.com/59906657/172000289-c3630506-8323-48ad-9899-96760583fd29.PNG)

## Machine Learning Model  
### Preprocessing and Data Split  
Several of the columns we wanted to run through our models had 'object' data types which would not work.  

![Pre_LE](https://user-images.githubusercontent.com/59906657/171921124-9c1c98a1-64de-416f-86d8-d2019aa95a8b.PNG)

Therefore, we used LabelEncoder to assign each of these points a numeric value.  

![Post_LE](https://user-images.githubusercontent.com/59906657/171921169-613e073a-38b5-4585-8816-acf1360edae8.PNG)

The data was then split into training and testing sets with a 80:20 split respectively.

### Feature Selection and Model Choice
We set an 80% R2 score as the standard to reach for accuracy. First, we ran a multiple linear regression model with all variables that showed an obvious linear relationship with emissions. Then, we added the other feature columns which improved the score by nearly 20 points, with an R2 Score of .752. We also tried single linear regression models with each variable, LASSO Regression, and Ridge Regression. Neither of these models gave us as high of an R2 score as the multiple linear regression model at first. The final database prep increased our data points by approimately 2x. This is what led to the 75% R2 Score. We were initially going to choose this model. However, after several runs of the data with the Ridge Regression model, our R2 Score improved to 77%. Even though this did not reach our standard, it was the best score we achieved leading us to select the Ridge Regression model as our final model.  

![ML_results](https://user-images.githubusercontent.com/59906657/171920381-dda6e016-f6e1-493c-9a8a-145ab4a16cdd.PNG)


## Dashboard & Presentation
### Dashboard
#### Tools and Interactivity
We will utilize Tableau Public for our visualizations. Also, we will have a webpage with links for Tableau Public and google slides as well as information and results from our model. Our interactive elements will include:

* Clickable links
* Hover over data points
* User able to highlight different data via legend  

[Dashboard on Tableau Public](https://public.tableau.com/app/profile/elliott.saxton/viz/FinalProjectEmissions_16537991811610/Dashboard1?publish=yes)

#### Presentation
[Google Slides Presentation](https://docs.google.com/presentation/d/1YBmfJ2yOlaomylhzkCNIPSoxClYus-hk2-i_hcmGUMo/edit#slide=id.p)
