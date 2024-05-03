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
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<title>Modassics-Rooms</title>
</head>
<body>
	<?php include 'components/header.php'; ?>
	<div class="main">
		<div class="banner">
			<h1>Explore our Rooms Catalogue!</h1>
		</div>
		<div class="title2">
			<a href="Home.php">Home </a><span>/ Our Rooms</span>
		</div>
		<div class="packages-container">

			<section class="packages" id="packages">
        
       				<div class="box-container">
        		    	<div class="box">
							<div class="image">
                				<img src="images/imgg4.jpg">
							</div>
							<div class="content">
                				<a href="Bedroom.php" class="btn">Bedroom</a>
							</div>
            			</div>
            			<div class="box">
               				<div class="image">
                  				  <img src="images/imgg3.jpg">
               				</div>
                			<div class="content">
								<a href="livingRoom.php" class="btn">Living Room</a>
                			</div>
            			</div>
           				 <div class="box">
                			<div class="image">
                  				<img src="images/imggg3.jpg">
               				</div>
                			<div class="content">
                    			
								<a href="KidsRoom.php" class="btn">Kids Room</a>
                			</div>
            			</div>
            			<div class="box">
               				<div class="image">
                    			<img src="images/office.jpg">
                			</div>
                			<div class="content">
                    		
								<a href="HomeOffice.php" class="btn">Home Office</a>
                			</div>
            			</div>
            			<div class="box">
                			<div class="image">
                    			<img src="images/img29.jpg">
                			</div>
                			<div class="content">
                   			
								<a href="StudyRoom.php" class="btn">Study Room</a>
        					</div>
            			</div>
            			<div class="box">
                			<div class="image">
                    			<img src="images/Terrace.jpg" >
                			</div>
                			<div class="content">
                   				
								<a href="Terrace.php" class="btn">Terrace</a>
                			</div>
            			</div>
        			</div>
    		</section>
		</div>

		<br>
		<br>
		<?php include 'components/footer.php'; ?>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="script.js"></script>
	<?php include 'components/alert.php'; ?>
</body>
</html>