# 1635-Project

Group Members: Emma Tristano, Ariane Seymour, Janet Majekodunmi

Software Execution

To run the app:

* Clone the repository using ‘git clone https://github.com/etmrmia/1635-Project.git’.
* Open the folder in your preferred IDE, and navigate to the subfolder ‘interface_design_map_project.’
* Open a terminal in your IDE and type ‘flutter run’ in the command line.
* Choose to run the app in a browser or Xcode (if you have a Mac).

Tasks Completed
* Alerts display.
* Display of favorites list in a separate window and searching of buslines to add to favorites.

How to Perform Completed Tasks

To view alerts for a particular bus line, tap the bus line from the list of bus lines in the Home View or the Favorites View. The alerts box is located at the top of the new window opened.

To schedule a trip based on origin and destination, enter the origin into the textfield on the Home View with the “Starting” label. Then, enter the destination into the textfield below “Starting” that is labeled “Destination.” Once the user presses the enter key, they will be taken to a separate window that displays the bus line information for the route. As of now, only two routes are implemented, and the route on the map has yet to be displayed.

To view the favorites list, tap on the circular elevated button with a heart located on the top right of the Home View. A window will open that displays the current list of favorites. To add to the list, press the heart icons in the Home View of the bus lines to be added. If the heart is red, it is added to the list. In addition, the user can search for the bus line to add in the Favorites View. Enter the bus line in the textfield labeled “Bus line” in the Favorites View. If the entered line is a valid bus line, it will be added to the list, and the line will be marked as favorited on the Home View.

To view alerts for a particular bus line, tap the bus line from the list of bus lines in the Home View or the Favorites View. As of now, only the bus line name and the alert associated with the line is displayed. An image of the bus line route will eventually be added to the map display.

Changes Made
Data:
Originally, data was going to be represented in JSON format in an assets folder.  This data would be parsed in model classes and fetched by view models via futures.  The team decided to just represent our data in the model to save time. 
Models and View Models:
We planned to give each screen its own model and view model, but because of constraints on time, we chose to consolidate those classes into one model and one view model. 
Again, our model class contains the data itself and does not manipulate it in any way.  The view model still consists of mostly the same functions as those represented in the architectural diagram; however, it will no longer use Change Notifier because of difficulty with its use.
View:

Originally, we planned to use ChangeNotifierProvider with a Consumer widget to update the data. Due to difficulties implementing, we decided to pass in the data to be displayed to the constructor of the view class. We also decided to use a NestedScrollView to display the home page instead of just displaying the elements in a stack to allow the user to view a larger portion of the map. We are also relying less on the router than previously planned due to passing in values to the constructor.

