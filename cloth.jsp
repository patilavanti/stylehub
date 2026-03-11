<%@ include file="first.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clothes Store</title>

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

button{
    background-color:black;
    color:white;
    padding:10px 20px;
    border:none;
    cursor:pointer;
}

button:hover{
    background-color:#444;
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
            item.qty += 1;  
            found = true;
        }
    });

    if(!found){
        cart.push({
            name:name,
            price:price,
            qty:1
        });
    }

    displayCart();
}

function displayCart(){

    let list = document.getElementById("cartItems");
    list.innerHTML="";

    cart.forEach(function(item){

        list.innerHTML += 
        "<p>" + item.name + 
        " | Qty: " + item.qty + 
        " | ₹" + (item.price * item.qty) + "</p>";

    });

}

</script>

</head>

<body>

<div class="container">

<div class="card">
<img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab">

<h2>Men Shirt</h2>
<p>1999</p>

<button onclick="addToCart('Men Shirt',1999)">Add to Cart</button>
</div>



<div class="card">
<img src="https://images.unsplash.com/photo-1473966968600-fa801b869a1a">

<h2>Jeans Pant</h2>
<p>1599</p>

<button onclick="addToCart('Jeans Pant',1599)">Add to Cart</button>
</div>


<div class="card">
<img src="https://images.unsplash.com/photo-1503342217505-b0a15ec3261c">

<h2>Women T-Shirt</h2>
<p>700</p>

<button onclick="addToCart('Women T-Shirt',700)">Add to Cart</button>
</div>

</div>

<div class="cart">
<h3>Cart</h3>
<div id="cartItems"></div>
</div>

</body>
</html>
