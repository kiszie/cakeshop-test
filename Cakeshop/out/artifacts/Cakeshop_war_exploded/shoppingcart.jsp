<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/Cakeshop"
                     user="root" password="1234"/>
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
                <c:if test="${empty sessionScope['loginUser']}">
                    <h3 class="login">
                        <a href="login(admin).jsp">Admin/</a><a href="login.jsp">Sign up</a> / <a href="login.jsp">Login</a></h3>
                </c:if>
                <c:if test="${not empty sessionScope['loginUser']}">
                    <a href="logout.jsp">Logout
                        <c:out value="${sessionScope['loginUser']}" />
                    </a>
                </c:if>
                <p>Subtotal: $ 00.00</p>
                <p><span class="vChart"><a href="shoppingcart.jsp">View Cart</a></span> <span class="cOut"><a href="checkout.jsp">Checkout</a></span></p>
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
            <s:query dataSource="${ds}" var="selectQ">
                select t2.pid, t2.name, t2.description, t2.price from addcart AS t1, product AS t2
                where t1.pid = t2.pid and t1.username ='${sessionScope['loginUser']}'
            </s:query>
            JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
            <div class="incartlist">
                <table border="1" cellspacing="3" cellpadding="3">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Description</th>
                        <th>Price</th>
                    </tr>
                    <c:forEach items="${selectQ.rows}" var="cart">
                        <tr> <td>${cart.pid}</td>
                            <td>${cart.name}</td>
                            <td>${cart.description}</td>
                            <td>${cart.price}</td>
                        </tr>
                    </c:forEach>
                </table>
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