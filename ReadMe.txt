SQL Question.

You need to store information about mortgage applications and the applicants applying for the mortgages. 
There is a many-to-many relationship between mortgage applications and applicants. A mortgage application 
contains a unique mortgage application number, a loan amount and a flag to determine whether the mortgage 
application has been accepted or not. An applicant has a first name and surname. You also need to be able 
to store the date that an applicant was added to a mortgage application. Write the SQL needed to:

 
1. Create normalized tables to contain the data and the relationship between applications and applicants.

2. List the 10 applicants who were most recently added to mortgage applications.

3. List the number of applicants per mortgage application.

4. List mortgage application numbers for applications without associated applicants.

5. List mortgage application numbers for applications with 2 applicants.

6. In one SQL query, list all data. In other words, all mortgage applications data (whether or not they have
 applicants), their related applicants’ data, and the date each applicant was added to the mortgage