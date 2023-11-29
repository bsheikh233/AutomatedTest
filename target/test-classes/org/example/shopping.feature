Feature: Saucedemo Shopping

  Background:
    Given the application is loaded
    And the 'Username' field contains 'standard_user'
    And the 'Password' field contains 'secret_sauce'
    And the 'Login' button is clicked


    # 6 points
  Scenario Outline: Keep adding an item
    Given the '<item>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field contains '<firstName>'
    And the 'Last Name' field contains '<lastName>'
    And the 'Zip Code' field contains '<zipcode>'
    When the 'Continue' button is clicked
    Then the price should read '<total>'
    Examples:
      | item                               | firstName          | lastName       | zipcode     | total          |
      | Sauce Labs Backpack                | Ali                | Rehman         | 4111        | Total: $32.39  |
      | Test.allTheThings() T-Shirt (Red)  | Shoaib             | Malik          | 4333        | Total: $49.66  |
      | Sauce Labs Bolt T-Shirt            | Waleed             | Sheikh         | 2222        | Total: $66.93  |
      | Sauce Labs Bike Light              | Ahmad              | Anwar          | 1111        | Total: $77.72  |
      | Sauce Labs Fleece Jacket           | Nimra              | Tanveer        | 4342        | Total: $131.71 |
      | Sauce Labs Onesie                  | Mawah              | Malik          | 1133        | Total: $140.34 |


#5 points
  Scenario Outline: Incorrect checkout attempts
    Given the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field contains '<firstName>'
    And the 'Last Name' field contains '<lastName>'
    And the 'Zip Code' field contains '<zipcode>'
    When the 'Continue' button is clicked
    Then the '<errorMessage>' is displayed
    Examples:
      | firstName | lastName | zipcode | errorMessage |
      | Bilal     | Sheikh   |         | Error: Postal Code is required |
      |           |          |         | Error: First Name is required  |
      | Bilal     |          |         | Error: Last Name is required   |

     # 5 points
  Scenario Outline: Keep deleting an item
    Given the '<item>' is discarded from cart
    Then total items are '<num>'
    Examples:
      | item                            | num |
      | Sauce Labs Onesie Remove        | 5   |
      | Sauce Labs Bike Light Remove    | 4   |
      | Sauce Labs Fleece Jacket Remove | 3   |