# DKBCodeFactory-iOS-Task
## Here is the code for a simple application that displays information retrieved from the network. 

### Screen recording of the completed app - https://drive.google.com/file/d/1AsK95f1zP0X1F6apky132AbqqGC0xVg5/view?usp=sharing

### Time taken to complete the task, including testing - 2hr 30 min

Things done well-
1. Passing the thumbnail image downloaded on the home screen to the detail screen when the user selects a row, thus showing no lag/white screen in displaying a placeholder image while the original image downloads async. And Caching the images after downloading results in smooth scrolling across the home screen and is equivalent to no lag when the user goes back to a detailScreen he already visited once.
2. Even though this is a small application, so we could use MVVM/MVC but taking into consideration the real-world scenario; if this was a project that will have many features coming in the future, I implemented VIPER and wrote the UI programmatically. This makes it programmer-friendly and modularised, making it easier for a new developer to contribute. It was an excellent growth factor for me, given that I had to do all this within two hours.

Things to improve-
1. Work on dark mode integration so the device can pick up the system userinterfacestyle and change the UI accordingly.
2. Due to the huge image size, there was a lag in popping the detailVC to return to the home screen. To fix that, I used a defined height and width for the ImageView. I would have looked more into the issue to determine how to remove the lag and keep the image's original size.

More things I would have worked on if there was not a time limit-
1. Writing integration tests to check for successful image download and caching and more in-depth UI tests.
2. Based on the instructions, I have kept the Entities non-optional. As it wasn't mentioned what values could be nil/optional from the backend, so to save time, I kept all of them as non-optional for now.
3. Using NSCache(instead of a library) and Coredata for offline storage.
