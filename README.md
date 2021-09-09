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
so that I can avoid content that are not meant for the application or users who misuse the application to run a professional marketplace. 

As a seller, 
I want to be able to upload listings and recieve messages from interestd buyers, 
so that I can sell my items. 

As a seller,
I want to be able to upload multiple images of my item/s,
so that I can showcase them in the best possible way.

As a seller,
I want to be able to let the buyer know what area I live in but not give my full address,
so that I feel secure and keep my privacy through the marketplace sales. 

As a buyer, 
I want to be able to see all available listings and contact the seller, 
so that I can buy the items I am interested in. 

As a buyer,
I want to see where the seller is located,
so that I can choose if I want to message the seller or not depending on the distance.

As a user,
I want to be able to browse through listings without having to sign up or sign in, 
so that I can decide if I am interested in the application first.

As a user,
I want to see an image, a price and a description(title) of the items when I scroll,
so that I don't need to spend too much time on the application during a quick browse. 

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

-Confirmations controller: created for an email confirmation when user sign up, the method is set to send a confirmation after user sign up, and then return to the root path. The purpose of this feature is to validate every user's email address because the way of contact between buyer and seller is through the user email.

The model handles data logic and interacts with the database, the controller connects to the model to retrieve the requested data. This application has a:
-user model containing the user data through devise 
-listing model that belongs to the user to connect the creator of a listing to it, validates the input when creating a listing (defining the presence of "must haves" to true). Contains the data of the listings
-role model that contains the roles given such as admin roles

The view presents the data by rendering HTML pages based on the data the model picks up. This application has two home pages, index page rendering all current listings for users to browse when they arrive to the application and an about page rendering information about the application and not connected to any data.

## R16	Detail any third party services that your app will use:
The third party service used in the application is Amazons AWS Storage gateway -- a cloud service that gives access to virtual cloud storage. This allows for the application to store all images uploaded on the page in the AWS cloud which simplifies the storage management by moving that content off the application whilst storing it safely and with reduced costs. When an image is uploaded to the application it goes to a bucket connected to the S3 service to be stored, when deleted on the page it is also deleted in the storage. 

## R17	Describe your projects models in terms of the relationships (active record associations) they have with each other: 

The listing model belongs_to user which I have set up because each listing must have one user and can only have one user, for the purpose of defining a seller. To avoid a one-directional one-to-one relation between listing and user, the user model has a has_many relation to the listing model. 
I have included has_many_attached :images to allow the user to upload multiple images, this will also be defined in the listing controller.
The :validate option is set to true for listing details for the object to be validated when saved. 
Two customised sanitations defined in the Listing class, one to validate the title to be a minimum of 3 characters to protect the application from having unclear listings, and one to remove whitespace. 

As mentioned above, the user model relation to the listing model is has_many as the user will be able to have zero or many listings. It also connects to the devise gem for authentication and confirmation.

The role model has a has_and_belongs_to_many relationship to the user model. This indicats that the role model can be connected to zero or more instances of the user model. 
You can choose to use has_and_belongs_to_many or has_many :through to declare a many-to-many relationship between models, such as the role model connected to the user model through a join table here. 
The join table in this relationship is the users_roles table and its only function is to join the user_id with zero to multiple role_ids. 
I chose to use the has_and_belongs_to_many relation because this gives a direct many-to-many connection to the user model and that my join table doesn't have any other function but to connect the two tables. If the join table had more content that 

## R18	Discuss the database relations to be implemented in your application:

The database is created to be as minimal as possible, so the user table includes a username column which allows the user to have a profile without a profiles table. 
-Users table has a one-to-many relationship with the listings table -- This association allows for each user_id to have zero or more instances of listings. I chose to use this relation because each user shall be able to create multiple listings with their name on it for buyers to see and contact them from each individual listing. 

The listings table is holding the listing details that will go into the database, including the location of the user selling the item/s.  
-The listings table has a one-to-one relation with the user model, it has the foreign key user_id so this means that each listing can be assigned to one user only, because there can only be one user_id creating and selling each listing. 

The roles table is connected to the user table through a user_roles table to allow for users to have roles such as admin. 
-The roles table contains one column only which is the id, this id is used as a foreign key in the join table: 
-Users_roles, which in turn has two columns: role_id and user_id to connect these through the join table.
As discussed in the question above, the purpose of the join table is to connect users table with roles table, if needed. The main need for this relation in my application is to assign someone an admin role to keep track of the listings being posted and make sure the rules of the application are followed.

Active Storage allows uploading files to a cloud storage, from the different services available I am using Amazon S3 in this application as mentioned above , since Active Storage uses two tables in the database I have them as well.
These are the active_storage_blobs and active_storage_attachments tables which can be set up with has_many_attached or has_one_attached in a corresponding model. As mentioned above, I have used has_many_attached for images in the listing model which sets up a one-to-many relationship between records and the files, it means that every record is allowed to have many files(images) attached to it. 

**** NEEDS MORE
## R19	Provide your database schema design:
Find attached in docs folder 



## R20	Describe the way tasks are allocated and tracked in your project:
Proccess:
After I had the marketplace idea in my head and knew what I wanted to do, I started writing the ideas in notepads to then research how to accomplish certain steps, through CoderAcademy learning material/stackoverflow/railsdocs/youtube tutorials, to later on spread out the tasks over different cards in my Trello board separated into gems, tables, details, steps etc. with details within these cards. This helped me to see what steps I had and what details to work with. 

I did not use my Trello board all the way through to the end of the project, it was mostly a broad guideline for me to write anything that I had in mind to not forget later on. 
Throughout the project I had my notes spread out over Trello, the inbuilt notepad application - for quick reminders - and pen and paper, which most often works for me.

Thoughts and improvements:
This project was a challange for me and my non-tech background and it has been a good learning project, I've picked up so much during this project that I didn't know before and during planning. Planning it again today would be very different in the sense of what order to do certain tasks - such as generating models or migrating to the database - and in the sense of planning.
In the beginning I thought that I had spend enough time on planning the application, but as I dived in to the project I realised that there ware many other things to focus on than what I did.
See my Trello board in the link below:
https://trello.com/b/86aZfCI0/marketplace 



****
Code comments demonstrate how the queries implemented correctly represent the database structure

App does not minimise database calls. .all is used to retrieve products. (hitta hur jag kan retrieve available products typ)

Submission has no comments for queries.
Database queries work but do not demonstrate advanced understanding.