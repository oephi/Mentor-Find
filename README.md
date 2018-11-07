# MentorFind
### Live App: [https://secure-fjord-81769.herokuapp.com](https://secure-fjord-81769.herokuapp.com)

# Table of Contents
* [About](#about)
* [Installation & Setup](#installation-&-setup)
* [Project Management](#project-management)
* [Share](#share-our-app)
* [Questions & Answers](#questions-&-answers)

# About
It is difficult to find mentors both online and offline to teach skills that people seek. It is even more difficult to market yourself as a mentor and find clients.

Traditionally to find a mentor in a skill, you would need a combination of luck, social connectivity, and the persistence at attending events to find somebody that would be willing to be your mentor. There currently exists no unifying online marketplace to connect Mentors to Mentees and vice versa. Such a marketplace would greatly improve the ease, speed, and ability for both sides of the interaction to connect.

MentorFind aims to fill that void by giving mentors the ability to create services for multiple different skills and connect them to users interested in being mentored. The mentors receive payments for their time, and they can receive reviews to build up a reputation within that niche which no current two sided marketplace provides the ability to do.

# Features
The *primary* features of our app are the following:
* Authenticated user accounts which persists their data
* Profile image uploading
* Sorting the feed of mentors via 'interest' tags
* Searching the mentor categories via fuzzy search
* Paying the mentor using Stripe
* The ability to leave reviews on a mentors service page
* The ability to be a mentor at multiple skills
* The ability to be both a mentor and a mentee
* A purchase history with mentors numbers and details

# Installation & Setup
If you would like to have a look at the code for this website and play around with it, feel free to download it and getting it up and running by doing the following.
```
git clone git@github.com:brasscapon/Mentor-Find.git mentor-find
```

Then navigate to the directory with the commandline.

```
cd ~/code/mentor-find
```
Your directory will likely be different.

Inside the commandline at that directory, run the following to install all the libraries
```
bundle install
```

Then create the database
```
rails db:create
```

and run the migrations
```
rails db:migrate
```

Then lastly boot up the rails server with
```
rails s
```

It should now be good to go. 
By default the server runs on Port 3000, so to view the live site on your local machine, head to [localhost:3000](http://localhost:3000)

# Project Management
* **The Idea:** To begin our project, we began with the task of creating a two sided marketplace. We then did research and listed currently existing and successful 2 sided market places to familiarise ourselves, coming up with the following: gumtree, Ebay, AirBNB, Carousel, AliBaba, Amazon, Lynda, Facebook Market, Etsy, and Upwork. We proceeded by then brainstorming and we generated 1 idea each going around the circle until we had a total of 8 ideas which we were interested in. We then made a vote on our favourite idea which was MentorFind. Our other ideas were: Buying and Selling Pets, second hand tabletop games, connecting casual sports players for public matches, selling ideas, and a review based contractor site.
* **Wireframing:** We then freehand drew some wireframes for what we wanted the web pages and our user flow to look. We modified it as new ideas were generated. When we were satisfied with the freehand drawings we converted them into digital mockups using Balsamiq. The full wireframe set can be viewed [Here](https://github.com/brasscapon/Mentor-Find/blob/master/docs/wireframes.pdf). The wireframes for our homepage is as follows:
![MentorFind Home Page Wireframe](https://github.com/brasscapon/Mentor-Find/blob/master/docs/homepage-wireframe.png)
* **Database:** After drawing up our wireframes we created a freehand ERD (Entity Relationship Diagram) which described our planned database models to use, their attributes and data types, as well as the relationships between them. We received feedback from our educators and modified it 3 times to end up with this result:
![ERD](https://github.com/brasscapon/Mentor-Find/blob/master/docs/erd.png)
* **Tasks:** We then generated as many User Stories (in the style of Agile) as were required and imported them into Trello for us to manage our project.
![Trello Board](https://github.com/brasscapon/Mentor-Find/blob/master/docs/trello.png)

# User Flow
The app was designed for the user to flow through it roughly as follows:
![MentorFind User Flow](https://github.com/brasscapon/Mentor-Find/blob/master/docs/user-flow.png)

# User Stories
User stories are well thought out, relevant, and comprehensively cover the needs of the app

# Tools Used & Built With
* HTML5
* CSS3
* Bootstrap (CSS Framework for styling)
* Ruby on Rails 5.2.1
* Ruby 2.5.1
* Visual Studio Code (text editor)
* [Trello](https://trello.com) (for project management)
* Git & Github (source countrol)
* [Heroku](https://heroku.com) (deployment)
* [Google Fonts](https://fonts.google.com)
* The following non-default Ruby Gems: [Textacular](https://github.com/textacular/textacular) (fuzzy search), [stripe-ruby](https://github.com/stripe/stripe-ruby) (e-payments), [carrierwave](https://github.com/carrierwaveuploader/carrierwave) + [carrierwave-aws](https://github.com/sorentwo/carrierwave-aws) (for AWS storage), [Faker](https://github.com/stympy/faker) (for generating seed data), [mini-magick](https://github.com/minimagick/minimagick) (for file uploading and resizing), [better-errors](https://github.com/BetterErrors/better_errors) (for debugging), and [jquery-rails](https://github.com/rails/jquery-rails) (for button toggling).
* The team used [Slack](https://slack.com) to communicate with eachother.

# Project Timeline
As students we were allocated 10 days to complete this 2 sided marketplace project. Here is how we structured our time to meet our goals (keeping in mind that we continually reprioritised which tasks were the most important in the style of Agile methodology):
* Day 1: We brainstormed ideas, created wireframes, and began working on our ERD.
* Day 2: We finalised our ERD and generated the app, and added Devise.
* Day 3: We generated all of the models and their respective associations and created a navbar as well as some of the main views.
* Day 4: We hooked up routes, created services and mentor profiles, cleaned up the errors in the feeds view, and linked everything up - hyperlinks, database calls, and controller actions.
* Day 5: We worked on the design, added flas messages, and fixed some bugs.
* Day 6: We worked on fixing params and interest filtering bugs, and added fuzzy search.
* Day 7: We added Stripe, AWS capability, and fixed some bugsg.
* Day 8: We added some style, some minor features such as prices on user cards, and resolved some errors by adding default profile images.
* Day 9: We created a landing page, deployed to Heroku, worked on the README, and fixed some more bugs.
* Day 10: 

# Authors
* [Adam Demirel](https://github.com/brasscapon)
* [Mike McCallum](https://github.com/mikemgm)
* [Ryan Sickle](https://github.com/oephi)
* [Sinan Canselen](https://github.com/canselen)

# License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://github.com/brasscapon/Mentor-Find/blob/master/src/LICENSE) file for details.

You are permitted to modify, alter, create copies, and distribute this project freely. We would love to see it expanded by other developers to include a larger dataset of questions and answers and improve on the application's functionality.

# Acknowledgement
* Thanks to our peers and educators for helping us to identify and fix bugs when all hope seemed lost - In particular Garret Blankenship, James Lane, and James Holman.
* To StackExchange and IRC for providing additional support.

# Questions & Answers
This project was motivated by a class assignment, and as a requirement of it answers to the specified questions are below.

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



## MIKE
**11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).**  
Our data structure is similar to Airbnb Experiences, where customers can search for a service(in this case an experience) offered by a person, and charges them a fee for the service provided. Mentor Find enables customers to search for an activity, service, or skill they are interested in and find mentors whom are willing to teach for an hourly fee. 


**12. Discuss the database relations to be implemented.   WHY PICK THEM?**  
The database relations consit of users, skills, interests, services, purchases, and reviews. We created a user model in order for a customer to access their saved personalized data. This data has access to their interest, skill, and service models. The user can search for something they wish to be mentored in and find a mentor who has that skill. 


**13. Describe your project’s models in terms of the relationships (active record associations) they have with each other. ACTUAL RELATIONSHIP BETWEEN THEM**  


**14. Provide your database schema design.**  


**15. Provide User stories for your App.**  



## SINAN
**16. Provide Wireframes for your App.**  

**17. Describe the way tasks are allocated and tracked in your project.**  
Tasks are located at models and t

**18. Discuss how Agile methodology is being implemented in your project?**  
We started with an idea and fallowed with planing it with mockups.Afterwards we took our time figuring out essential databases we need to create in order to keep it simple and clean. A small talk and research was done to figure out what gems will be used . We drew our Wireframes to finalise our plans we matched database with the actions we had on Wireframes.As we progressively code our way through our application we tested every git merge to make sure the code does not break along the way.

**19. Provide an overview and description of your Source control process.**  
We used git and github as our Source control. There is 3 production stages of git and it helps you to verify changes with your recent code if it conflicts. In git you can keep track of your updates by update title and notes and git push time. To connect we used GitHub, we kept our main code/master there where Adam worked as admin and looked after every repository and merge request.

**20. Provide an overview and description of your Testing process.**  




## ALL
**21. Discuss and analyse requirements related to information system security.**  
- https
- sql injections
- data sanitization

**22. Discuss methods you will use to protect information and data.**  
There are three main safeguards that we have used to protect information and data. The first is that we have protected against insecurities in the site by using the system security measures mentioned in Q21 above. The second is that during the retrieval of the users password during signup, the Devise rubygem that we are using uses another gem Bcrypt to encrypt their password and then store that password encrypted in our database. Thirdly we have deployed our website on Heroku which has a reputation for security and ensures that our data is not physically accessible to attacks.


**23. Research what your legal obligations are in relation to handling user data.**  
MentorApp collects and records a variety of data provided by the user - such as their email addresses, names, phone numbers, and even IP addresses. As we our website deals with sensitive personal information, we are legally obliged to adhere to Australia’s *Privacy Act 1988 (Privacy Act)*. Two noteworthy principles are 1) the website must not collective sensitive information about an individual unless it is reasonably necessary to the websites function, and 2) that the website or entity that runs it must not disclose the sensitive information provided to it to other parties. See clauses 3.3a and 6.1 [here](https://www.oaic.gov.au/individuals/privacy-fact-sheets/general/privacy-fact-sheet-17-australian-privacy-principles#part-2-collection-of-personal-information).


# Share Our App
* [Link to website](https://secure-fjord-81769.herokuapp.com)
* [Link to repository](https://github.com/brasscapon/Mentor-Find)
