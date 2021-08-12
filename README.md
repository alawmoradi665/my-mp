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
Anyone who has an interest in buying and selling second hand homewares finds, users who are already selling on different marketplaces.

- Tech stack (e.g. html, css, deployment platform, etc)
Ruby, Rails, HTML, CSS, Heroku, Amazon upload

## R12	User stories for your app
User:
Home page - user can browse items on site without being signed in -> message seller button redirects to sign in/sign up page
No add listing button appears

Log in button -> sign in form with sign up option -> homepage
Listings show message seller button -> send email
Add listings button appear -> create new listing
Edit/delete your own listings
/listings show all listings with only show button

Admin:
Log in button -> see all listings on homepage -> open listing -> edit any listing
/listings show all listings with show/edit/delete button
Add listing button appear -> upload

## R13	Wireframes for your app:
Find attached in docs folder 

## R14	An ERD for your app:
Find attached in docs folder 

## R15	Explain the different high-level components (abstractions) in your app:

## R16	Detail any third party services that your app will use:
Amazon upload is used for image upload on the platform through the listings that get created.


## R17	Describe your projects models in terms of the relationships (active record associations) they have with each other:
User model has many listings and includes devise and rolify
Roles model has and belongs to many users through the join table users_roles
Listings model belongs to user

## R18	Discuss the database relations to be implemented in your application:
The database is created to be as minimal as possible, the users table include a username column which allows the user to have a profile without a profiles table. The listings table is the larger one which contains listings details including the location of the user selling the item. It has a foreign key which is the user id.
The user id is also used in the join table users_roles to connect the current user to their role. In the join table there is a second foreign key which is the role id connected to the roles table to identify an admin and a regular user. 
Active storage attachments is connected to the active storage blobs table via the blob_id to allow for image upload. 

## R19	Provide your database schema design:
Find attached in docs folder 

## R20	Describe the way tasks are allocated and tracked in your project:
All tasks are tracked through the current_user. The user id of the current_user is tracking who is on the session and shows the views for that user. As for example when creating listings, the creator of the listing will be able to edit/delete whereas other users can't.
Admin has access to all edits through a given role in the console, the role_id is set to "admin". 
