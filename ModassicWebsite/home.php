
<?php 
 include 'components/connection.php';
 session_start();
 if (isset($_SESSION['user_id'])) {
		$user_id = $_SESSION['user_id'];
	}else{
		$user_id = '';
	}

	if (isset($_POST['logout'])) {
		session_destroy();
		header("location: login.php");
	}
	//adding products in wishlist
	if (isset($_POST['add_to_wishlist'])) {
		$id = unique_id();
		$product_id = $_POST['product_id'];

		$varify_wishlist = $conn->prepare("SELECT * FROM `wishlist` WHERE user_id = ? AND product_id = ?");
		$varify_wishlist->execute([$user_id, $product_id]);

		$cart_num = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ? AND product_id = ?");
		$cart_num->execute([$user_id, $product_id]);

		if ($varify_wishlist->rowCount() > 0) {
			$warning_msg[] = 'product already exist in your wishlist';
		}else if ($cart_num->rowCount() > 0) {
			$warning_msg[] = 'product already exist in your cart';
		}else{
			$select_price = $conn->prepare("SELECT * FROM `products` WHERE id = ? LIMIT 1");
			$select_price->execute([$product_id]);
			$fetch_price = $select_price->fetch(PDO::FETCH_ASSOC);

			$insert_wishlist = $conn->prepare("INSERT INTO `wishlist`(id, user_id,product_id,price) VALUES(?,?,?,?)");
			$insert_wishlist->execute([$id, $user_id, $product_id, $fetch_price['price']]);
			$success_msg[] = 'product added to wishlist successfully';
		}
	}
	//adding products in cart
	if (isset($_POST['add_to_cart'])) {
		$id = unique_id();
		$product_id = $_POST['product_id'];

		$qty = $_POST['qty'];
		$qty = filter_var($qty, FILTER_SANITIZE_STRING);

		$varify_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ? AND product_id = ?");
		$varify_cart->execute([$user_id, $product_id]);

		$max_cart_items = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
		$max_cart_items->execute([$user_id]);

		if ($varify_cart->rowCount() > 0) {
			$warning_msg[] = 'product already exist in your cart';
		}else if ($max_cart_items->rowCount() > 20) {
			$warning_msg[] = 'cart is full';
		}else{
			$select_price = $conn->prepare("SELECT * FROM `products` WHERE id = ? LIMIT 1");
			$select_price->execute([$product_id]);
			$fetch_price = $select_price->fetch(PDO::FETCH_ASSOC);

			$insert_cart = $conn->prepare("INSERT INTO `cart`(id, user_id,product_id,price,qty) VALUES(?,?,?,?,?)");
			$insert_cart->execute([$id, $user_id, $product_id, $fetch_price['price'], $qty]);
			$success_msg[] = 'product added to cart successfully';
		}
	}

?>
<style type="text/css">
	<?php include 'style.css'; ?>
</style>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<title>Modassic</title>
</head>
<body>
	<?php include 'components/header.php'; ?>
	<br>
	<div class="main">
		
		<section class="home-section">
			<div class="slider">
				<div class="slider__slider slide5">
					<div class="overlay"></div>
					<div class="slide-detail">
						<h1><span style="font-size: 2em;">Elevate</span> your dining experience						<br>

						with our stunning dining set</h1>
						<br><br>

						<a href="Kitchen.php" class="btn">shop now</a>
					</div>
					<div class="hero-dec-top"></div>
					<div class="hero-dec-bottom"></div>
				</div>
				<div class="slider__slider slide1">
					<div class="overlay"></div>
					<div class="slide-detail">
						<h1><span style="font-size: 2em;">Expolre</span>
						our collection and transform						<br>
 your living room into a cozy haven!</h1>
						<br><br>
						<a href="livingRoom.php" class="btn">shop now</a>
					</div>
					<div class="hero-dec-top"></div>
					<div class="hero-dec-bottom"></div>
				</div>
				<!-- slide end -->
				<div class="slider__slider slide2">
					<div class="overlay"></div>
					<div class="slide-detail">
						<h1><span style="font-size: 2em;">Fun</span>, Learnable, Durable						<br>

						kids' bedroom essentials</h1>
						<br><br>

						<a href="KidsRoom.php" class="btn">shop now</a>
					</div>
					<div class="hero-dec-top"></div>
					<div class="hero-dec-bottom"></div>
				</div>
				<!-- slide end -->
				<div class="slider__slider slide3">
					<div class="overlay"></div>
					<div class="slide-detail">
						<h1><span style="font-size: 2em;">Discover</span> timeless elegance
						in						<br>
 our classic kitchen cookware and essentials</h1>
						<br><br>

						<a href="Kitchen.php" class="btn">shop now</a>
					</div>
					<div class="hero-dec-top"></div>
					<div class="hero-dec-bottom"></div>
				</div>
				<!-- slide end -->
				<div class="slider__slider slide4">
					<div class="overlay"></div>
					<div class="slide-detail">
					<h1><span style="font-size: 2em;">Revitalize</span> your living space
    with<br> our stylish and cozy selection of sofas</h1>

						<br><br>

						<a href="livingRoom.php" class="btn">shop now</a>
					</div>
					<div class="hero-dec-top"></div>
					<div class="hero-dec-bottom"></div>
				</div>
				<!-- slide end -->
			
				<!-- slide end -->
				<div class="left-arrow"><i class='bx bxs-left-arrow'></i></div>
                <div class="right-arrow"><i class='bx bxs-right-arrow'></i></div>
			</div>
		</section>
	
		<h1 class="heading">Special Offers!</h1>
	<br>
	<br>
	<br>



		<section class="products">
			<div class="box-container">
				<?php 
					$select_products = $conn->prepare("SELECT * FROM `products` WHERE page = 'home.php'");
					$select_products->execute();
					if ($select_products->rowCount() > 0) {
						while ($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)) {
							
						
				?>
							<form action="" method="post" class="box">
    <img src="image/<?=$fetch_products['image']; ?>" class="img">
    <h3 class="name"><?=$fetch_products['name']; ?></h3>
    <input type="hidden" name="product_id" value="<?=$fetch_products['id']; ?>">
    <div class="button">
        <button type="submit" name="add_to_cart"><i class="bx bx-cart"></i></button>
        <button type="submit" name="add_to_wishlist"><i class="bx bx-heart"></i></button>
        <a href="view_page.php?pid=<?php echo $fetch_products['id']; ?>" class="bx bxs-show"></a>
    </div>
    <div class="flex">
        <p class="price">$<?=$fetch_products['price']; ?></p>
    </div>
    <div class="qty-container"> <!-- Container for quantity input -->
        <input type="number" name="qty" required min="1" value="1" max="99" maxlength="2" class="qty">
        <a href="checkout.php?get_id=<?=$fetch_products['id']; ?>" class="btn">buy now</a>
    </div>
</form>

				<?php 
						}
					}else{
						echo '<p class="empty">no products added yet!</p>';
					}
				?>
			</div>
		</section>
		<br>
		<br>


		<h1 class="heading">Explore Our Best-Selling Furniture Catalogue!</h1>
<br>
<br>

		<div class="packages-container">

			<section class="packages" id="packages">
        
       				<div class="box-container">
        		    	<div class="box">
							<div class="image">
                				<img src="images/img55--.jpg">
							</div>
							<div class="content">
   								<h3>Kids Bed</h3>
    							<p>Explore an array of kids' beds and essentials for the perfect children's room setup!</p>
                				<a href="KidsRoom.php" class="btn">Shop Now</a>
							</div>
            			</div>
            			<div class="box">
               				<div class="image">
                  				  <img src="images/img58.jpg">
               				</div>
                			<div class="content">
                  				<h3>Master Bedroom Set</h3>
                    			<p> Discover the adult bedroom sanctuary with our handpicked selection of master bedrooms!</p>
								<a href="Bedroom.php" class="btn">Shop Now</a>
                			</div>
            			</div>
           				 <div class="box">
                			<div class="image">
                  				<img src="images/img59.jpg">
               				</div>
                			<div class="content">
                    			<h3>Living Room Sofa </h3>
                    			<p>Explore our curated collection of living room essentials to create your ideal gathering space!</p>
								<a href="livingRoom.php" class="btn">Shop Now</a>
                			</div>
            			</div>
            			<div class="box">
               				<div class="image">
                    			<img src="images/img68-.jpg">
                			</div>
                			<div class="content">
                    			<h3>Vegan leather tablecloth </h3>
                   				<p>Discover the perfect finishing touches for your dining table, with other kitchen essentials. </p>
								<a href="Kitchen.php" class="btn">Shop Now</a>
                			</div>
            			</div>
            			<div class="box">
                			<div class="image">
                    			<img src="images/img67-.jpg">
                			</div>
                			<div class="content">
                   				<h3>Blown Glass Vase</h3>
                   				<p>Add a touch of elegance to your home with our stunning vases and other decor essentials!</p>
								<a href="Vases.php" class="btn">Shop Now</a>
        					</div>
            			</div>
            			<div class="box">
                			<div class="image">
                    			<img src="images/img64.jpg" >
                			</div>
                			<div class="content">
                   				<h3>Mirror </h3>
                    			<p>Elevate your bathroom with our stylish mirrors and essential toilet accessories!</p>
								<a href="Mirrors.php" class="btn">Shop Now</a>
                			</div>
            			</div>
        			</div>
    		</section>
		</div>

<br>
<br>
<br>

		<section class="services">
    <div class="box-container">
        <div class="box">
            <i class='fas fa-truck'></i>
            <div class="detail">
                <h3>Free Delivery</h3>
                <p>In UAE</p>
            </div>
        </div>
        <div class="box">
            <i class='fas fa-headset'></i>
            <div class="detail">
                <h3>Customer Service</h3>
                <p>24.7 Support</p>
            </div>
        </div>
        <div class="box">
            <i class='fas fa-undo-alt'></i>
            <div class="detail">
                <h3>Easy Returns</h3>
                <p>Satisfied Or Refunded</p>
            </div>
        </div>
        <div class="box">
            <i class='fas fa-credit-card'></i>
            <div class="detail">
                <h3>Buy Now Pay Later</h3>
                <p>Tappy Or Tamara</p>
            </div>
        </div>
    </div>
</section>

<?php include 'components/footer.php'; ?>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="script.js"></script>
	<?php include 'components/alert.php'; ?>
</body>
</html>