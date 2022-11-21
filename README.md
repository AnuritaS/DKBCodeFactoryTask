# DKBCodeFactory-iOS-Task
##Here is the code for a simple application that displays information retrieved from the network. 

###Time taken to complete the task, including testing - 2hr 30 min

Things done well-
1. Passing the thumbnail image downloaded on home screen to the detail screen, when user selects a row, thus showing no lag/white screen in displaying a placeholder image while the original image downloads async. And Caching the images after downloading, which results in smooth scrolling across the home screen and equvailent to no lag when the user goes back to a detailScreen he already visited once.
2. Even though this is a small application so we could use MVVM/MVC but taking in consideration the real world scenario, if this was a project that will have many features coming in the future, I implemented VIPER and wrote the UI programmatically, which is programmer-friendly and modularised, thus making it easier for a new developer to contribute. I believe it was a great growth factor for me, given that I had to do all this within two hours.

Things to improve-
1. Work on dark mode integration so the device can pickup system userinterfacestyle and change the UI accordingly.
2. Due to the image size being huge, there was a lag on popping the detailVC to come back to the home screen, to fix that I used a defined height and width for the ImageView. I would have looked more into the issue to figure out how can I remove the lag and still keep the original size of the image.

More things I would have worked on if there was not a time limit-
1. Writing integration tests to check for successful image download and caching and more in-depth UI tests.
2. Based on the instructions, I have kept the Entities non-optional. As it wasn't mentioned what values can be nil/optional from the backend, so to save time, I kept all of them as non-optional for now.
3. Using NSCache(instead of a library) and Coredata for offline storage.

