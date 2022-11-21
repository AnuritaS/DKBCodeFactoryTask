# DKBCodeFactory-iOS-Task
##Here is the code for a simple application that displays information retrieved from the network. 

###Time taken to complete the task, including testing - 2hr 30 min

Things done well-
1.
2. Caching the images after downloading and checking them in cac

Things to improve-
1. Work on dark mode integration so the device can pickup system userinterfacestyle and change the UI accordingly.
2. Due to the image size being huge, there was a lag on popping the detailVC to come back to the home screen, to fix that I used a defined height and width for the ImageView. I would have looked more into the issue to figure out how can I remove the lag and still keep the original size of the image.

More things I would have worked on if there was not a time limit-
1. Writing tests to check for successful image caching and more in-depth UI tests.
2. Based on the instructions, I have kept the Entities non-optional. As it wasn't mentioned what values can be nil/optional from the backend, so to save time, I kept all of them as non-optional for now.

