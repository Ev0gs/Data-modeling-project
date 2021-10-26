# Data-modeling-project
  This project is one I've done for my studies. It explains the fact I was in a project team of 3 classmates. The subject of this project is Data Base and Data Modeling with SQL code on SQL workbench.

# Introduction
  ### Context :
A travel agency wishes to digitize its information system using the information it has. This information was extracted from "raw" interviews (without analysts' work) with our client's decision-makers. The client compartmentalizes its business processes into several categories, each with its own set of functionalities:
* customer management
* staff management
* ticketing management
* means of transport management
* milestones management
* statistic management

  ### Problematic : 
How to digitize and make accessible the travel agency's information system thanks to the data extracted from the "raw" interviews?

# Logical & Physical Data Model (LDM/PDM)
At the beginning of the project, we made a representation of our organization about the different tasks of everyone by realizing an OBS (Organization Breakdown Structure) and WBS (Work Breakdown Structure). These representations helped us organizing ourselves around the different tasks and steps of the project as you can see on the followings:
<p align="center">
  <img width="600" height="400" src="https://user-images.githubusercontent.com/93186642/138855160-19106c1b-2bc9-49da-90a4-af6cf307c51a.png">
</p>
<p align="center">
  <img width="600" height="400" src="https://user-images.githubusercontent.com/93186642/138855226-56fd0c62-dd1a-4f27-84fd-a6df069e6a71.png">
</p>

# Data dictionary
  In order to class all the data provided in the data file of our school we decided to create a data dictionary. In this one, we will have to class data by their code, designation, type of data, length, and notes...\
  When the data dictionary will be done, it will be easier to make the Conceptual data model (or CDM).

<p align="center">
  <img width="400" height="600" src="https://user-images.githubusercontent.com/93186642/138855970-17937916-56a9-45d1-89dd-d5127e56829e.png">
</p>
<p align="center">
  <img width="400" height="600" src="https://user-images.githubusercontent.com/93186642/138856034-507e9ef3-9a3f-4287-8b25-5560bca6336d.png">
</p>

# Conceptual Data Model (CDM)
For the realization of the conceptual data model, we first started making entities, attributes, and relations between the different tables by using JMERISE Software.\
Then, we added an ID for each table to make the CDM easier to manipulate, and we applied cardinalities according to the text provided which explained us the situation. Finally, we studied our CDM a long time to make it better and to apply the first three normal laws which are the following:
* 1NF :
  * Each table cell should contain a single value
  * Each record needs to be unique
* 2NF :
  * Be in 1NF
  * Single Column Primary Key
* 3NF :
  * Be in 2NF
  * Has no transitive functional dependencies

<p align="center">
  <img width="900" height="500" src="https://user-images.githubusercontent.com/93186642/138851324-db04676f-d083-4e37-951e-ec5729798a1a.png">
</p>

# Logical & Physical Data Model (LDM/PDM)
Following the creation of our Conceptual data model on JMERISE, we simply verified if it was correct by clicking the button on the software, and then we converted it into an LDM/PDM by clicking the button convert the CDM. Finally, we have our LDM/PDM, and the SQL code linked to the creation of the PDM. To be more precise, this SQL code will allow us to create all the tables and the attributes needed in our PDM in order to create the new database and apply some Query asked by the travel agency.

<p align="center">
  <img width="900" height="500" src="https://user-images.githubusercontent.com/93186642/138851663-7d75453b-ee38-40a8-8830-19ece78943b0.png">
</p>

# Algebraic trees
In order to represent some queries of the statistic management, we decided to realize their algebraic trees. We also made the three algebraic trees as we couldbecause of the minimalism of this type of representation. Indeed, some of the SQL code functions are not available or not usually represented by geometric forms like on our algebraic trees which are the following:
<p align="center">
  <img width="400" height="600" src="https://user-images.githubusercontent.com/93186642/138854747-1ff5d127-a0b3-4a08-8d0a-8106498c55c7.png">
</p>
<p align="center">
  <img width="400" height="600" src="https://user-images.githubusercontent.com/93186642/138854857-f4bf5e2d-6967-4ca2-beee-b85164383b88.png">
</p>

# SQL Queries
Finally, we decided to make all the statistic queries that the travel agency whished. Indeed, after filling some fields of our database, we decided to test all the statistic queries to see if they were functional.After this step, we also decided to create a user on the localhost who will be able to connect and have all privilegies on the database as expected in the subject.\
_**(cf Statistic Queries / User Queries in this repository)**_

Then, we had to make a diagram model of our database on the MySQL Workbench software as you can see on the picture following:

<p align="center">
  <img width="400" height="600" src="https://user-images.githubusercontent.com/93186642/138856915-65dd2b05-4329-4714-9104-f5fb4382fa1d.png">
</p>



