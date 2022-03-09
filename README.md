# Peek iOS Coding Challenge

I followed the instructions not to extrapolate the fours hours of coding time. So I had no time to finish the *Infinite scrolling*, *Error handling*, and *testing*. The topic **Achievements** contains all that was implemented and **Missing achievements** everything that I could not finish because of the time.

## Achievements

I started creating some basic extensions to handle views of any type, `TableView+IdentifierType`, `Cell+Identifier` and `Nib+IdentifierType`. 

I created `Constraints` to clean the code when dealing with view coding.

I created the `GenericCell` to render the repo's info. All the elements were built with StackView, following the MVVM pattern. Inside the cell, I created lazy stored properties for the UI elements, delaying the creation of a property until it’s used.

The `StackView` was created to abstract the setup of UI elements inside the StackView and make the code cleaner.

To download the profile image, I created `UIImageView+Extensions` to load the image using a cache to avoid unnecessary requests.

The `WebController` was created to show the content of the repository url every time the user selects a cell.

I kept the original `ViewController` dealing only with UI elements and the business rules at `ViewModel`. 

## Missing achievements

### Infinite scrolling

For Infinite scrolling, I started implementing the pagination logic to handle new calls inside the TableView `willDisplay` method. The idea was to make a new request every time the total repositories count was equal to the cell index. 

On `ViewModel`, I created the property `isPaginating` to avoid multiple requests, but I could not finish the logic implementation.

For layout purposes, I would add `UIActivityIndicatorView` to the `tableFooterView` and an indicator for the first request.

### Error handling

For Error handling, I was able to return the error, but I didn't have the time to show it to the user. The idea was to show a simple AlertController with a message and an action to dismiss the alert.

### Tests

For UnitTests, I could have implemented asserts to validate the number of repositories returned and validate a single repository content. 

For UITests, I could validate if a cell was selectable and if the scroll was properly working, and the call for a WebView when selecting a cell.

