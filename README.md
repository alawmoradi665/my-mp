# README



## R7	Identification of the problem you are trying to solve by building this particular marketplace app:

### I’m seeing a new trend where people are:
- Buying retro homeware gems, ex: old glassware made in Italy, old vase made in Japan, old high end porcelain branded items
- Finding them cheap at second hand shops, ex: vinnies, red cross or second hand in small towns
- Selling them for a higher price - but on a scattered market: facebook marketplace, etsy, ebay, instagram accounts set up as a mini shop
 
### I’m missing:
- A united marketplace platform for this market of second hand thrifters to browse, buy and sell items: users get to keep making their profits whilst sharing their hobbies on a joint platform

### I’m making
- A platform for those vintage homeware gems, for people of interest to create their own market
- No payments on site - contact seller in the same manner as on gumtree for example
 

## R8	Why is it a problem that needs solving?
- It is a specified marketplace that currently does not have its own marketplace, the sales of these items tend to be spread over different platforms rather than having one place to go for selling, buying and browsing. 

## R9	A link (URL) to your deployed app (i.e. website):
Deplyoment failed - look at localhost and sign in with
alaw.m@hotmail.com
mangos123
to see the admin view.
Create new user for user view.

## R10	A link to your GitHub repository (repo):
https://github.com/alawmoradi665/my-mp.git

## R11	Description of your marketplace app (website), including:
- Purpose:
Creating a united platform and marketplace for the target audience because they lack one where they can search for second hand homewares finds only, rather than looking through different categories and searching on other marketplaces. 

- Functionality / features:
Gems used: bootstrap, jquery-rails, simple form, devise, rolify, cancancan, aws-sdk-s3

The site allows any user, not signed in, to see all products and on each listing there is a "message seller" button. Clicking that button will take the user to the sign up/sign in page which then directs them to the email. 
When signing up there will be an confirmation email sent to the user to confirm their email to make sure there is an email to then send messages to. ---- This feature is not yet fully completed ----

User can create listing, edit and delete their own listing but not others.
Admin user can be created whom has access to edit and delete all listings.
All listings are shown in cards on the home page.

Multiple images can be uploaded to each listing and minimum of one is required to create listing.
Validations are made for username, title, price, location and image columns in creating a new listing.

- Sitemap
- Screenshots
Find attached in docs folder 

- Target audience
User who has an interest in buying and selling second hand homewares finds, users who are already selling on different marketplaces but want to do so on a joint marketplace. 

- Tech stack (e.g. html, css, deployment platform, etc)
Ruby, Rails, HTML, CSS, Heroku, AWS Storage gateway

## R12	User stories for your app
As an admin,
I want to be able to see, edit and delete all listings and users, 
so that I can avoid content that are not meant for the application or users who misuse the application. 

As a seller, 
I want to be able to upload listings and recieve messages from interestd buyers, 
so that I can sell my items. 

As a buyer, 
I want to be able to see all available listings and message the seller, 
so that I can buy the items I am interested in. 

As a user,
I want to be able to browse through listings without having to sign up or sign in, 
so that I can decide if I am interested in the application first. 


## R13	Wireframes for your app:
Find attached in docs folder 


**** TOO BASIC?
## R14	An ERD for your app:
Find attached in docs folder 


## R15	Explain the different high-level components (abstractions) in your app:
The application is using MVC (Model, View, Controller) architecture where each component has its individual role, these controllers include classes that define the application's logic, meaning that when the user performs an action such as "create listing" a request is sent to the controller, which handles all requests. The controllers are put together according to the data they operate on and work together with the corresponding models. This application is using the following controllers:

-Application controller: defines before_actions, in this application this is connected to the devise gem for sign up and sign in. 

-Home controller: has two methods, index and about, to handle the two home pages. The index method is telling us that when the user is on the home index (also root page), display all listings. The about method is empty at the moment and is there to define the page and its existence. 

-Listings controller: is the controller with the most actions to handle in this application. This controller defines all CRUD (create, read, update, delete) actions where it directs the program to the right action based on the request. For example create -- looks for the current_user to connect the new listing to the user who created it. The listings controller also includes a method that defines which params are required and permitted.

-Confirmations controller: created for an email confirmation when user sign up. 

The model handles data logic and interacts with the database, the controller connects to the model to retrieve the requested data. This application has a 

-user model containing the user data through devise 
-listing model that belongs to the user to connect the creator of a listing to it, validates the input when creating a listing (defining the presence of "must haves" to true). Contains the data of the listings
-role model that contains the roles given such as admin roles

The view presents the data by rendering HTML pages based on the data the model picks up. This application has two home pages, index page rendering all current listings for users to browse when they arrive to the application and an about page rendering information about the application and not connected to any data.

## R16	Detail any third party services that your app will use:
The third party service used in the application is Amazons AWS Storage gateway -- a cloud service that gives access to virtual cloud storage. This allows for the application to store all images uploaded on the page in the AWS cloud which simplifies the storage management by moving that content off the application whilst storing it safely and with reduced costs. When an image is uploaded to the application it goes to a bucket connected to the S3 service to be stored, when deleted on the page it is also deleted in the storage. 

****
## R17	Describe your projects models in terms of the relationships (active record associations) they have with each other: 
MODELS IN APP -- THE CONNECTION IT SAYS IN THE MODEL FILES

The listing model belongs_to user  

When used alone, belongs_to produces a one-directional one-to-one connection. Therefore each book in the above example "knows" its author, but the authors don't know about their books. To setup a bi-directional association - use belongs_to in combination with a has_one or has_many on the other model.

-Role model has a has_and_belongs_to_many relationship to the user model. This indicats that the role model can be connected to zero or more instances of the user model. 
You can choose to use has_and_belongs_to_many or has_many :through to declare a many-to-many relationship between models, such as the role model connected to the user model through a join table here. 
The join table in this relationship is the users_roles table and its only function is to join the user_id with zero to multiple role_ids. 
I chose to use the has_and_belongs_to_many relation because this gives a direct many-to-many connection to the user model and that my join table doesn't have any other function but to connect the two tables. If the join table had more content that 


****
## R18	Discuss the database relations to be implemented in your application:
RELATION IN DATABASE -- THE RELATIONS IN ERD

The database is created to be as minimal as possible, so the user table includes a username column which allows the user to have a profile without a profiles table. 
-User table has a one-to-many relationship with the listing table -- This association allows for each user_id to have zero or more instances of listings. I chose to use this relation because each user shall be able to create multiple listings with their name on it for buyers to see and contact them from each individual listing. 

The listing table is holding the listing details that will go into the database, including the location of the user selling the item/s.  
-The listing table has a one-to-one relation with the user model, it has the foreign key user_id so this means that each listing can be assigned to one user only, because there can only be one user_id creating and selling each listing. 

The role table is connected to the user table through a user_roles table to allow for users to have roles such as admin. 
-The role table contains one column only which is the id, this id is used as a foreign key in the join table: -Users_roles, which in turn has two columns: role_id and user_id to connect these through the join table.
As discussed in the question above, the purpose of the join table is to connect user table with role table, if needed. The main need for this relation in my application is to assign someone an admin role to keep track of the listings being posted and make sure the rules of the application are followed.

Active storage attachments is connected to the active storage blobs table via the blob_id to allow for image upload. 



**** NEEDS MORE
## R19	Provide your database schema design:
Find attached in docs folder 



## R20	Describe the way tasks are allocated and tracked in your project:
Proccess:
After I had the marketplace idea in my head and knew what I wanted to do, I started writing the ideas in notepads to then research how to accomplish certain steps to later on spread out the tasks over different cards in my Trello board separated into gems, tables, details, steps etc. with details within these cards. This helped me see what steps I had and what details to work with. 

I did not use my Trello board all the way through to the end of the project, it was mostly a broad guideline for me to write anything that I had in mind to not forget later on. 
My notes were spread out over Trello, the inbuilt notes application for quick reminders and pen and paper which works for me.

Thoughts and improvements:
This project was a challange for me and my non-tech background and it has been a good learning project, I've picked up so much during this project that I didn't know before and during planning. Planning it again today would be very different. 
In the beginning I thought that I had spend enough time on planning but as I dived in to the project I realised there was a lot more I could have done. 
My initial Trello board was not reflecting my end result so it changed to becoming a reminder board, which was also good, but with more knowledge I could have created a board that would have guided me further.
https://trello.com/b/86aZfCI0/marketplace 



****
Code comments demonstrate how the queries implemented correctly represent the database structure

Able to edit/delete other user's listings by changing url params.

App does not minimise database calls. .all is used to retrieve products. (hitta hur jag kan retrieve available products typ)

Strong params used. -- Files that aren't images can be uploaded -- price can be given negative values