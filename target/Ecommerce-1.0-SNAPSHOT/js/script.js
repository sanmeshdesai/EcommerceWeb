/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}

        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("first time added");

    } else {

        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct) {
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.produtId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("quantity increase")

        } else {

            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));

            console.log("product added")

        }


    }
    
}


function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty ")
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").addClass('disabled');
    }
else {
    console.log(cart);
}

}


$(document).ready(function (){
    updateCart();
})