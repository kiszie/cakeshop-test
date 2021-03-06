<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DapurKue | ShoppingCart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/reset.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/text.css" />
    <link rel="stylesheet" type="text/css" media="all" href="style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
</head>
<body>
<div id="warp">
    <div id="main" class="container_16">
        <div id="header" class="grid_16">
            <div id="logo" class="grid_4 alpha">
                <h1><a href="index.html">DapurKue</a></h1>
                <h2>Famously Delicious</h2>
            </div>
            <div id="headright" class="grid_7 prefix_5 omega">
                <h3 class="login"><a href="login.html">Sign up</a> / <a href="login.html">Login</a></h3>
                <p>Subtotal: $ 00.00</p>
                <p><span class="vChart"><a href="shoppingcart.html">View Cart</a></span> <span class="cOut"><a href="checkout.html">Checkout</a></span></p>
            </div>
        </div>
        <div id="mainMenu" class="grid_16">
            <ul>
                <li><a href="index.html" class="aActive">Home</a></li>
                <li><a href="#">Cakes</a></li>
                <li><a href="#">Order &amp; Delivery</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <div id="stickySearch" class="grid_16">
            <div class="stickyNews grid_12 alpha">
                <p>Valentine’s BrownieCheese Special Package. <em>Free Delivery.</em> <a href="#" class="bookMan">More &raquo;</a></p>
            </div>
            <div class="search grid_4 omega">
                <form action="#" method="get">
                    <input type="text" value="Type your keyword" id="s" name="s" onfocus="if (this.value == 'Type your keyword') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Type your keyword';}" />
                </form>
            </div>
        </div>
        <div class="prodNav grid_16">
            <div class="prodHeadline grid_16">
                <h3>Your Shopping Cart</h3>
            </div>
        </div>
        <div class="bodyContent grid_16">
            <div class="shopCart grid_16 alpha">
                <div class="headCart grid_16 alpha">
                    <div class="itemHead grid_9 alpha"> Item Description</div>
                    <div class="priceHead grid_2"> Price</div>
                    <div class="qtyHead grid_1"> Qty</div>
                    <div class="subtotalHead grid_2"> Subtotal</div>
                    <div class="remHead grid_2 omega"> Remove</div>
                </div>
                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                   url="jdbc:mysql://localhost/Cakeshop"
                                   user="root"  password="1234"/>

                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * from product;
                </sql:query>
                <form action="#" method="get">
                    <div class="bodyCart grid_16 alpha">
                        <c:forEach var="row" items="${result.rows}">
                        <div class="warpCart">

                            <div class="item grid_9 alpha">

                                <p><a href="#">< <img src="images/products/${row.pid}.jpg" alt=""/></a>
                                    <c:out value="${row.name}"/><br />
                                    <span> <c:out value="${row.description}"/></span></p>
                            </div>
                            <div class="price grid_2">
                                <p> <c:out value="${row.price}"/></p>
                            </div>
                            <div class="qty grid_1">
                                <input type="text" size="1" value="" name="Qty" />
                            </div>
                            <div class="subtotal grid_2">
                                <p>$00.00</p>
                            </div>
                            <div class="remove grid_2 omega">
                                <a href="Edit.jsp?pid=${row.pid}">Edit</a>
                            </div>
                        </div>
                            </c:forEach>
                        <div class="warpCart"></div>
                        <div class="warpCart"></div>
                        <div class="warpCart"></div>
                    </div>
                    <div class="footCart grid_16 alpha">
                        <div class="grandTotal grid_3 prefix_11 alpha"> Grand Total</div>
                        <div class="totalPrice grid_2 omega"> $ 000.00</div>
                    </div>
                    <div class="buttonCart grid_16 alpha">
                        <div style="position: absolute; left: 3px; top: 0px; width: 173px;"> <a href="product-overview.html" target="_parent"><input type="button" value="Continue Shopping" name="Continue Shopping" class="continueShop" /></a></div>
                        <div style="position: absolute; left: 176px; top: 0px; width: 126px;"><input type="submit" value="Checkout" name="Checkout" class="checkoutCart" />
                        </div>
                        <div style="position: absolute; left: 330px; top: 0px; width: 126px;"> <a href="checkout.html" target="_parent"><input type="button" value="Update Cart" name="Update Cart" class="updateCart" /></a></div>
                        <div class="clear"></div>
                    </div>
                </form>
            </div>
            <div id="chooseCake" class="grid_16">
                <div class="youLike grid_16">
                    <h3>You might also like</h3>
                </div>
            </div>
            <div class="newCakes">
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake1.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake2.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake3.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake4.jpg" alt="" width="220" height="120" /></a></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="richContent">
    <div class="container_16">
        <div class="popularCakes grid_4">
            <h4>Popular Cakes</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="recommended grid_4">
            <h4>Recommended</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="specialOffer grid_4">
            <h4>Special Offer</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="orderPhone grid_4">
            <h4><em>Order by Phone</em> <span>987-654-321</span></h4>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="richContent2">
    <div class="container_16">
        <div class="fromBlog grid_4">
            <h4>From the blog</h4>
            <h5>New Recipes in Our Basket</h5>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum... <a href="#" class="bookMan">more &raquo;</a></p>
        </div>
        <div class="corporateInfo grid_4">
            <h4>Corporate Info</h4>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Term &amp; Conditions</a></li>
                <li><a href="#">Franchise</a></li>
                <li><a href="#">About us</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>
        <div class="storeDelivery grid_4">
            <h4>Store &amp; Delivery</h4>
            <ul>
                <li><a href="#">Store Locator</a></li>
                <li><a href="#">Delivery Terms &amp;amp Pricing</a></li>
                <li><a href="#">Delivery Coverage</a></li>
                <li><a href="#">Gift Services</a></li>
                <li><a href="#">Track my order</a></li>
            </ul>
        </div>
        <div class="socialNet grid_4">
            <h4>Keep in touch</h4>
            <ul>
                <li><a href="#" class="facebook">Facebook</a></li>
                <li><a href="#" class="twitter">Twitter</a></li>
                <li><a href="#" class="feed">Feed</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
    <div class="container_16">
        <div class="copyright grid_16">
            <p class="left">Copyright &copy; 2010, Your Company Here, All Rights Reserved</p>
            <p class="right"><a href="http://all-free-download.com/free-website-templates/">Free CSS Templates</a> by <a href="http://tokokoo.com/">Tokokoo</a> &amp; <a href="http://www.instantshift.com/">instantShift</a></p>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>