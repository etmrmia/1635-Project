# 1635-Project
Group Members: Emma Tristano, Ariane Seymour, Janet Majekodunmi
# Software Execution
### To run the app:
* Clone the repository using ‘git clone https://github.com/etmrmia/1635-Project.git’.
* Open the folder in your preferred IDE, and navigate to the subfolder ‘interface_design_map_project.’
* Open a terminal in your IDE and type ‘flutter run’ in the command line.
* Choose to run the app in a browser or Xcode (if you have a Mac).

# Tasks
* Alerts display.
* Display of favorites list in a separate window and searching of buslines to add to favorites.
* Scheduling trips based on origin and destination.
* Display of information about the selected bus line in a separate window 


# How to Perform Tasks
To view alerts for a particular bus line, tap the bus line from the list of bus lines in the Home View or the Favorites View or search for a route. The alerts box is located at the bottom of the new window opened.

To schedule a trip based on origin and destination, enter the origin into the textfield on the Home View with the “Starting” label. Then, enter the destination into the text field below “Starting” that is labeled “Destination.” Once the user presses the enter key, they will be taken to a separate window that displays the bus line information for the route including the alert for the bus line and the directions the user should perform to reach their destination. 
The origin and destination pairs are as follows: 
* Bus 64: Arsenal Elementary to Bank of America
* Bus P68: Art Institute to Monroeville Mall
* Bus 61C: University of Pittsburgh to Kennywood
* Bus Y49: Wood St to CCAC South
* Bus 71A: Market District to 323 Negley Ave
* Bus 82: Market Square to Market District

To view the favorites list, tap on the circular elevated button with a heart located on the top right of the Home View. A window will open that displays the current list of favorites. To add to the list, press the heart icons in the Home View of the bus lines to be added. If the heart is red, it is added to the list. In addition, the user can search for the bus line to add in the Favorites View. Enter the bus line in the text field labeled “Bus line” in the Favorites View. If the entered line is a valid bus line, it will be added to the list, and the line will be marked as favorited on the Home View.

To view the additional bus line information, tap on a bus line from the list in the home view or favorites view or search for an origin and destination using the origin and destination search in the home page. The information should appear in a new window with a map of the route, alerts, and a list of directions if using the search option.

# Changes Made
### Data:
Originally, data was going to be represented in JSON format in an assets folder. This data would be parsed in model classes and fetched by view models via futures. The team decided to just represent our data in the model as apart of design simplification.

### Models and View Models:
We planned to give each screen its own model and view model, but we chose to consolidate those classes into one model and one view model as part of design simplification. Again, our model class contains the data itself and does not manipulate it in any way. The view model still consists of mostly the same functions as those presented in the architectural diagram and in the demo.

### View:
Originally, we planned to use ChangeNotifierProvider with a Consumer widget to update the data. Due to reconsidering our design strategy, we decided to pass in the data to be displayed to the constructor of the view class. We also decided to use a NestedScrollView to display the home page instead of just displaying the elements in a stack to allow the user to view a larger portion of the map. We are also relying less on the router than previously planned due to passing in values to the constructor.
