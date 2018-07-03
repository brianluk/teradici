# Ruby TCP Socket Server Reverse Input

## Installation
1. Clone Repo
2. Install Bundler & rspec prerequisites
```
bundler install
bundle install --path .bundle
```
## Run Server
```
ruby run.rb
```
## Stop Server
```
^C
```
## Run Unit Tests
```
bundle exec rspec spec.rb
```
## Example tests
When server running, open another terminal
```
telnet localhost 3000
Hello World
```
Response should be the reverse and session closed
```
dlroW olleH
Connection closed by foreign host.
```
## Assumptions & Design Decisions
* Response is delivered after carriage return
* Session is closed once input has been received and response sent
* Created a server class to easier unit test server functions
* Unit tests don't cover mock tcp server Tests
* No escape character to stop server by client
* Multi-threaded server to handle connections
## Considerations
### Extended Input Methods
* Allow for interactive session with an escape character to end session
### Cleaner Install/Run/Exits
* create an executable
### Expanded Tests
* Create mock TCP tests to test server connectivity in unit testing
* Expand unit testing with a client script that can test actual connections
### Server Lib
* server could be placed in a lib directory and called properly as a class
