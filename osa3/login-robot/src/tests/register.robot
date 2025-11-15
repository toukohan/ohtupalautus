*** Settings ***
Resource  resource.robot
Test Setup  Register New User

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  jonne  jonne123
    Output Should Contain  New user registered  

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  kalle123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  aa  kalle123
    Output Should Contain  Username needs to be at least 3 characters

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  kalle2  kalle123
    Output Should Contain  Username must contain only characters a-z

Register With Valid Username And Too Short Password
    Input Credentials  jonne  jonne
    Output Should Contain  Password needs to be at least 8 characters

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  jonne  jonnejonne
    Output Should Contain  Password cannot contain only letters



*** Keywords ***
Register New User
    Create User  kalle  kalle123
    Input  new
