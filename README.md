# NewsApp
A news recieving iOS App
This app consists of a tableView Cell which is pretty verbose but all it has 3 tableviewCell subviews for 2 lables and a image.
There is a viewModel which holds the imageView data and url. We cache it once it is downloaded so that no redownloading happnes when we scroll up and down, it uses the cached version.
There is an api caller which is a singleton with a single url and request with a single network call to fetch top headlines in the United States.
There are models for the response of article and source and finally there is a ViewController with tableView functions (delagetes and data source functions) and there is a seperate function to fetch the url data in the view controller.

Adding a demo for the app 

https://user-images.githubusercontent.com/80701312/175613272-3a2e0ec0-e9e2-4523-961f-a0fb211b411e.mp4


