Feature: Saucedemo User Login

  Background:
    Given the application is loaded

    # 6 points
  Scenario Outline: Incorrect login attempts
    Given the 'Username' field contains '<username>'
    And the 'Password' field contains '<password>'
    When the 'Login' button is clicked
    Then the '<errorMessage>' message is displayed
    Examples:
      | username        | password       | errorMessage                                                              |
      | standard_user   |                | Epic sadface: Password is required                                        |
      |                 |                | Epic sadface: Username is required                                        |
      | locked_out_user | secret_sauce   | Epic sadface: Sorry, this user has been locked out.                       |
      | standard_user   | wrong_password | Epic sadface: Username and password do not match any user in this service |


    # 6 points
  Scenario Outline: Correct login attempts
    Given the 'Username' field contains '<username>'
    And the 'Password' field contains '<password>'
    When the 'Login' button is clicked
    Then the user is redirected to '<PAGE_URL>'
    Examples:
      | username                 | password      | PAGE_URL                                                 |
      | standard_user            |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
      | problem_user             |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
      | performance_glitch_user  |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
      | error_user               |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
      | visual_user              |  secret_sauce | https://www.saucedemo.com/inventory.html                 |