<%@ include file="first.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shoe Store</title>

<style>

.container{
    display:flex;
    gap:30px;
    padding:20px;
}

.card{
    border:1px solid #ccc;
    padding:15px;
    text-align:center;
    width:300px;
}

.card img{
    width:100%;
    height:300px;
    object-fit:cover;
}

.cart{
    position:fixed;
    right:20px;
    top:20px;
    border:1px solid #000;
    padding:10px;
    background:#f9f9f9;
    width:220px;
}

</style>

<script>

let cart = [];

function addToCart(name, price){

    let found = false;

    cart.forEach(function(item){
        if(item.name === name){
            item.quantity += 1;   // increase quantity
            found = true;
        }
    });

    if(!found){
        cart.push({
            name:name,
            price:price,
            quantity:1
        });
    }

    displayCart();
}

function displayCart(){

    let cartList = document.getElementById("cartItems");
    cartList.innerHTML = "";

    cart.forEach(function(item){

        cartList.innerHTML += 
        "<p>" + item.name + 
        " | Qty: " + item.quantity + 
        " | ₹" + (item.price * item.quantity) + "</p>";

    });

}

</script>

</head>

<body>

<h2 style="text-align:center;">Shoe Store</h2>

<div class="container">

<div class="card">
<img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff">
<h2>Nike Shoes</h2>
<p>₹1000</p>
<button onclick="addToCart('Nike Shoes',1000)">Add to Cart</button>
</div>

<div class="card">
<img src="https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb">
<h2>Sports Shoes</h2>
<p>₹2999</p>
<button onclick="addToCart('Sports Shoes',2999)">Add to Cart</button>
</div>

<div class="card">
<img src="https://images.unsplash.com/photo-1608231387042-66d1773070a5">
<h2>Puma Shoes</h2>
<p>₹1700</p>
<button onclick="addToCart('Puma Shoes',1700)">Add to Cart</button>
</div>

</div>

<div class="cart">
<h3>Cart</h3>
<div id="cartItems"></div>
</div>

</body>
</html>
