package org.example;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.example.AbstractStepDefs.homePage;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class ShoppingStepDefs extends AbstractStepDefs {
    @Given("the {string} is added to the cart")
    public void somethingIsAddedToTheCart(String item) {
        homePage.addItemToCart(item);
    }

    @Given("the {string} is discarded from cart")
    public void itemIsRemovedFromTheCart(String item) {
        homePage.removeItemFromCart(item);
    }

    @Then("the price should read {string}")
    public void thePriceShouldRead(String total) {
        assertEquals(total, homePage.getTotal());
    }

    @Then("the {string} is displayed")
    public void theErrorMessageCheckoutMessageIsShown(String errorMessage) {
        assertEquals(errorMessage, homePage.getCheckoutErrorMessage());
    }

    @Then("total items are {string}")
    public void theNumberOfItemsShouldBe(String num) {
        assertEquals(num, homePage.getNumOfItemInCart());
    }
}
