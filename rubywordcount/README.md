#Ruby TCP Socket Server Reverse Input

## Installation
1. Clone Repo
2. Install Bundler
```
bundler install
bundle install --path .bundle
```
##Run Script
```
ruby topten.rb test.txt
```
##Run Unit Tests
```
bundle exec rspec spec.rb
```
##Example Output
```
{"of"=>19, "the"=>18, "to"=>18, "and"=>17, "pleasure"=>12, "pain"=>9, "but"=>7, "is"=>7, "or"=>7, "a"=>7}
```
##Assumptions & Design Decisions
* $results is a global variable hash
* Sort by does not factor words with same score that may get cut off
* Removes punctuation and other characters not lowercase letters (after downcasing)
* Guard is placed so not to trigger full script processing by rspec
* Checks to see if only 1 argument is provided
##Considerations
###Extend Functionality
* Parameter for number of results returned
* Handle more than one file
* Check word spelling against dictionary
###Extended sort hierarchy
* Create a hierarchy for sort priority (eg: if same count, order by alphabetical order)
###Expanded Tests
* Test performance over a large file
* Test against other sorting methods
###Error Handling
* Add unit tests on file content (asci, utf-8 etc)
