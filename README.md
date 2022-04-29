# MidtermProject


### How to use our application:
Our application is available to everyone, but only members with an account may access certain features. If you view the Sip n’ Social app without and account you are limited to the home page, surprise me feature, search recipes page, and the recipe result page.
Our home page is a brief overview of what Sip n’ Social is all about. By clicking on the about link in the nav bar the home page will jump past the main images and into an about me section that will give you more insight to the Sip n’ Social brand as well as share some images from recent events.  In our about me section you will find a link to our latest and greatest feature, the surprise me feature. Do you have decision fatigue like the rest of us? No worries, we have you covered, just click the “I’m feeling Adventurous” button in our about me section and our program will pick a pick out and display a recipe for you.
Know what you are looking for? We also have you covered. Navigate back to the top of the page and you can search our vast database, just type in what you are looking for and our database will not only search by title but also by description. We recommend searching for watermelon or mint to get you in the swing of summer. Just hit search and watch as the results appear. See something you like? Choose the “Make This Drink” button and you will be directed to a recipe card dedicated to that beverage. Inside of our recipe card you will find a list of ingredients and instruction by clicking on the “Make This” button.
You will also find a comment section that expands when you click on the “comments” section. You can go ahead and try to leave a comment, but if you haven’t signed in plan to be redirected to our sign in page.
As a user you have the option to sign up for an account or login if you already have an account and these links can be found on the navbar at the top of the page. Signing up is as easy as entering your desired username, first name, last name, email, password, and hitting submit. Once you get to submit you will find our application takes you to our members only home page.
Now that you’re a member you have access to so many cool features, like our one-of-a-kind community with a wide selection of Mocktail Meetups. For safety reasons you must be a member to access our meetup events.  On our members home page, you will find a list of mocktail meetups happening near you. You will also find link to Host a Meetup, create a New Recipe, and our Surprise Me feature that selects a recipe for you. By using the Account drop down on the navbar you will also find a way view all the meetups and recipes you have created.
Click on a meetup and be redirected to that events page. On the event page you will find information about a Mocktail Meetup, the location of the event, and a map to help you get there.

### Technologies Used
- Java
- JavaScript
- CSS
- HTML
- MySQL Workbench
- SpringBoot
- Bootstrap
- Atom
- Hibernate
- GitHub
- MySQL
- Tomcat 8
- MAMP
- AWS
- Google
- Spring Tool Suite 4
- Trello
- Figma
- Slack
- Zoom
- Gradle
- Google Drive Terminal
- JPA
- Object-Relational Mapping (ORM)
- Object-Oriented Programming
- Test Driven Development using JUNIT Juniper




### Lessons Learned

- Composite primary key
A composite primate key exists when an entity does not have and int, GeneratedValue field for its ID. In our Sip n’ Social application our recipe_ingredient table has a composite primary key, in pace of a single primary key recipe_ingredient table has a composite primary key that consist of recipe_id & ingredient_id.
In order for this entity to be mapped in JPA we have to use an embedded ID field. When using an embedded ID field, it is important to note that a new class must be created to represent the entity’s ID and this class must be annotated with @Embeddable, implement the Serializable interface, and should have a long field names serialVersionnUID. In our application this class is named “RecipeIngredientId”. Since this class is an entity, it is important to remember to include getters, setter, hashCode, equals, and a no-arg constructor.
In the RecipeIngredient class we embedded a field of the type RecipeIngredientId and annotated it with @EmbeddedId. As always the owning entity is the entity with the foreign key. In the RecipeIngredient class the primary keys of the joined tables are the foreign keys. When mapping to the forging key we use out typically mapping annotations and add in the @MapsId annotation. The non-owning sides receives the usual annotations of  @OneToMany  and mapped By, but no additional annotations.
Finally, to persist a new entity in JPA with an embedded id we had to construct the id object, RecipeIngredientId. Assign it to a new entity, assign new entities to the relationship field, and finally persist the entity.

- Controller Class
The controller class is responsible for processing incoming REST API request, preparing a model, and returning the view. When we started our project we did not expect need more than one controller class. We quickly discovered how naive we were in that thought process. In future projects we plan to use many controller classes.
Picture of figma
Something planning and Trello
Picture of Schema


- Meet the team

- Cecelia Guerrero
Spider Owner
GitHub:
LinkedIn:

- Desiree Easterling
SCRUM Master
GitHub:
LinkedIn:

- Ving P
Database Owner
GitHub:
LinkedIn:

- Zack Gaddy
Repository Owner
GitHub:
LinkedIn:
