# README

This is a project to search Github repositories with a given key word, User can type the word in the search bar and press enter or search button to get the results.

**Project Specs**
Ruby - 3.1.2
Rails - 7.0.8

**How to run the project**

- Install gems with bundle install and start the server with rails server , then go to the browser to see the applicatiom

**How to run unit tests**

- Navigate to the project folder - bundle exec rspec will run the test suite

**Completed Work**

- Basic requirements of entering a key word and getting the results is covered,

* Pagination add for better user experience

- With a click on each result user will be navigated to the relvant github repo

* Caching introduced to improve performance

- unit tests are written for all the files except for one controller

**Pending Work**

- Completing the unit test for GitHub Repository Controller

**Further Improvements**

- User authentication can be added to the system with a search histroy
- Searching can be improved with autocomplete
