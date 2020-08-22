# LeanGame
Lean game is case study game listing application. You can search game, check details and add to favorite for later use. 

 # Installation:
Carthage used for project. Go project directory,call "make carthage_build" in terminal and run.

# Project Structure:

Project structure depends on mvc pattern via mvvm approach. Not using real mvvm to manage controller but using protocols to manage dependencies and blind comminucation ). Used frameworks for web service calls and common conract library between web service and main application ![like SOA](https://en.wikipedia.org/wiki/Service-oriented_architecture. Used router approach to manage navigations. 

Lean Api is the alomofire implementation of web service calls. 
Lean contract is the main contract between web services or any other implementations between main application.
Lean Game is the main application, which has strict dependency over lean contract.  
# Third-party :
For now, alomofire and alomafire image implemented for network and image fetch operations. That can be easly managed by protocols.
# Missing features:
Logging and error handling must be implemented for production use

# Todos: 
Todo's inline commended in application for better quality. analytics, logging and view model defination required to manage UI dependencies.

Main app needs unit tests. 
