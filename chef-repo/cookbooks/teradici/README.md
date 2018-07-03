# Chef Cookbook assignment
##Prerequisites
* Chefdk installed
* vagrant image for windows 2012r2
* vagrant image for ubuntu 16.04
* virtualization environment like virtualbox or hyper-v
##Installation
* Clone/Copy cookbook to your chef repo
##Unit testing with ChefSpec
```
chef exec rspec --color
```
##Kitchen testing with InSpec
```
kitchen create
kitchen converge
kitchen verify
kitchen destroy
```
##Assumptions & Design Decisions
* recipes and tests are all in the default locations
* Tests are run against both windows and linux systems
* Ubuntu 16.04 and Windows 2012R2 were chosen as the testing systems
* Contents of xml are not tested in both testing methods
* Windows image created with Packer and packer-templates - https://github.com/mwrock/packer-templates
##Considerations
###Future Changes
* Split default recipe into multiple cookbooks based on purpose/functions
* Split tests into more granular bundles/files
* Test against more Linux distros and Windows versions
