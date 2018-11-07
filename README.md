# Mentor-Find
A rails app connecting mentors to those seeking to be mentored, in anything and everything.

# Installation & Setup
1) `git clone git@github.com:brasscapon/Mentor-Find.git`
2) `bundle install`
3) `rails db:create` (inside the directory)
4) `rails db:migrate`



# Questions & Answers


##ADAM
**1. What is the need (i.e. challenge) that you will be addressing in your project?**
It is difficult to find mentors both online and offline to teach skills that people seek. It is even more difficult to market yourself as a mentor and find clients.

**2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?**
Traditionally to find a mentor in a skill, you would need a combination of luck, social connectivity, and the persistence at attending events to find somebody that would be willing to be your mentor. There currently exists no unifying online marketplace to connect Mentors to Mentees and vice versa. Such a marketplace would greatly improve the ease, speed, and ability for both sides of the interaction to connect.

**3. Describe the project you will be conducting and how your App will address the needs.**
MentorFind aims to fill that void by giving mentors the ability to create services for multiple different skills and connect them to users interested in being mentored. The mentors receive payments for their time, and they can receive reviews to build up a reputation within that niche which no current two sided marketplace provides the ability to do.

**4. Describe the network infrastructure the App may be based on.**
MentorFind was developed locally on each developers computer and then we gained access to our webapp by running the web server Puma which comes bundled with Rails. For production, we deployed the app to Heroku which is a Cloud Application Platform that allows us to host our code on another server as well as it interpreting our code by having the appropriate libraries installed for us. Using Heroku also allowed us to abstract away our need to setup a DNS by automatically assigning us a URL through which users can access our app live.

**5. Identify and describe the software to be used in your App.**
Our application is and was built with Ruby on Rails. We chose Rails as our web development framework because it allowed us to do a lot of powerful things right out of the box, some of which include: a convention for structuring our application and the location for files, an MVC architecture (see Q8 for more info), convenient routing of HTTP requests, a built-in Web Server, ERB which allows us to embed Ruby code within our HTML code to determine the logic of the page, a huge library of RubyGems which we have the option of including, and most importantly an Object Relational Mapping system (called ActiveRecord) which allows us to conveniently interact with a database of our choice with Ruby syntax. Rails also gives us the ability to do other core tasks like use HTML, CSS, and JS.




## Ryan
**6. Identify the database to be used in your App and provide a justification for your choice.**
We used Postgresql for our database.  Besides postgresql being the industry standard for and open source database, the advantage it has over other choices (like MYSQL, MariaDB and Firebird) is that it isn’t just a relational database but it’s also object-relational.  This is what makes Postgresql flexible and robust.

**7. Identify and describe the production database setup (i.e. postgres instance).**

**8. Describe the architecture of your App.**
Our application is written using the Rails framework which utilises the MVC architectural paradigm.  We chose rails due to it’s use of “Convention over Configuration”, which demands a common work flow between programming environment setups negating the need for pre-established design patterns.
The MVC architecture encourages the seperation of concerns which keeps each layer of the application (**M**odel - **V**iew - **C**ontroller) independant from the others.  This allows for easy testing, defensive code structure, and code which is easily interchangeable and maintainable.

**9. Explain the different high-level components (abstractions) in your App.**
Mentor-Find basically allows people to find other people.  For this to occur, we need to match people according to their needs and wants.  User details are kept in a database and then pulled into the application as required.  If a user is good at bouldering, for instance, and another user wants to learn bouldering, when they search for bouldering the logic in our application will bring those matches to the user through the utilisation of logic that is contained in the layer that **controls** the **feed**.  This layer is called the *FeedsController*.  Controllers are the “middle man” between what a viewer sees and what information the database contains.

People who want to be mentors provide certain services.  These services are linked to the mentors by relating each service to them through the database.  The same service can be provided by different mentors so each service is uniquely linked to each different mentor by placing that relationship in its own database-table called a **joint-table*. This makes accessing each mentor-service easy to handle by the *ServiceController*, which acts as the logic between what the user sees, and what they want to access from the database.

The application also has a purchase history which allows the information from each purchase to be kept locally in the application database and then filtered according to which user is logged in.  A user cannot view another’s purchases or purchase details due to each user having a unique identification code.  This is assigned at a user registration and is cross-referenced each time they make a request to the database.  


**10. Detail any third party services that your App will use.**
The third party services utilised by Mentor-Find is Stripe and AWS. 
 
Stripe is a service that allows for easy and secure payment handling and is easily integrated into an application for fast deployment.

AWS is a secure cloud services platform that allows easy leveraging of cloud based products and solutions.  Mentor-Find uses AWS for the secure storing of images and is accessed via a gem called Carrierwave. 



#MIKE
**11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).**
Our data structure is similar to Airbnb Experiences, where customers can search for a service(in this case an experience) offered by a person, and charges them a fee for the service provided. Mentor Find enables customers to search for an activity, service, or skill they are interested in and find mentors whom are willing to teach for an hourly fee. 


**12. Discuss the database relations to be implemented.   WHY PICK THEM?**
The database relations consit of users, skills, interests, services, purchases, and reviews. We created a user model in order for a customer to access their saved personalized data. This data has access to their interest, skill, and service models. The user can search for something they wish to be mentored in and find a mentor who has that skill. 


**13. Describe your project’s models in terms of the relationships (active record associations) they have with each other. ACTUAL RELATIONSHIP BETWEEN THEM**


14. Provide your database schema design.


15. Provide User stories for your App.



!SINAN
**16. Provide Wireframes for your App.**

**17. Describe the way tasks are allocated and tracked in your project.**
Tasks are located at models and t

**18. Discuss how Agile methodology is being implemented in your project?**
We started with an idea and fallowed with planing it with mockups.Afterwards we took our time figuring out essential databases we need to create in order to keep it simple and clean. A small talk and research was done to figure out what gems will be used . We drew our Wireframes to finalise our plans we matched database with the actions we had on Wireframes.As we progressively code our way through our application we tested every git merge to make sure the code does not break along the way.

**19. Provide an overview and description of your Source control process.**
We used git and github as our Source control. There is 3 production stages of git and it helps you to verify changes with your recent code if it conflicts. In git you can keep track of your updates by update title and notes and git push time. To connect we used GitHub, we kept our main code/master there where Adam worked as admin and looked after every repository and merge request.

**20. Provide an overview and description of your Testing process.**




### ALL
**21. Discuss and analyse requirements related to information system security.**
- https
- sql injections
- data sanitization

**22. Discuss methods you will use to protect information and data.**
There are three main safeguards that we have used to protect information and data. The first is that we have protected against insecurities in the site by using the system security measures mentioned in Q21 above. The second is that during the retrieval of the users password during signup, the Devise rubygem that we are using uses another gem Bcrypt to encrypt their password and then store that password encrypted in our database. Thirdly we have deployed our website on Heroku which has a reputation for security and ensures that our data is not physically accessible to attacks.


**23. Research what your legal obligations are in relation to handling user data.**
MentorApp collects and records a variety of data provided by the user - such as their email addresses, names, phone numbers, and even IP addresses. As we our website deals with sensitive personal information, we are legally obliged to adhere to Australia’s *Privacy Act 1988 (Privacy Act)*. Two noteworthy principles are 1) the website must not collective sensitive information about an individual unless it is reasonably necessary to the websites function, and 2) that the website or entity that runs it must not disclose the sensitive information provided to it to other parties. See clauses 3.3a and 6.1 [here](https://www.oaic.gov.au/individuals/privacy-fact-sheets/general/privacy-fact-sheet-17-australian-privacy-principles#part-2-collection-of-personal-information).