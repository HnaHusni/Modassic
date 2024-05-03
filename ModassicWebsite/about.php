
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
		<div class="banner">
			<h1>About Us </h1>
		</div>
		<div class="title2">
			<a href="home.php">home </a><span>/ about</span>
		</div>
		<div class="testimonial-container">
			<div class="title">
				<h1>This is Modassic </h1>
                </p>
            </div>
                <div class="container">
                	<div class="testimonial-item active">
                		<h1>Who We Are</h1>
                		<p>"Welcome to Modassic Furniture, where style meets comfort and quality. Our mission is to provide you with exquisite furniture pieces that elevate your living space and reflect your unique taste"</p>
                	</div>
                	<div class="testimonial-item">
                		<h1>Our Vision</h1>
                		<p>"At Modassic, we envision a world where every home is a sanctuary of elegance and sophistication. We strive to inspire and empower our customers to create spaces that inspire joy and comfort."</p>
                	</div>
                	<div class="testimonial-item">
                		<h1>Why Choose Us</h1>
                		<p>"With a dedication to craftsmanship and attention to detail, we curate a diverse selection of furniture that combines timeless design with modern functionality."</p>
                	</div>
                	<div class="left-arrow" onclick="nextSlide()"><i class="bx bxs-left-arrow-alt"></i></div>
                	<div class="right-arrow" onclick="prevSlide()"><i class="bx bxs-right-arrow-alt"></i></div>
                </div>
		</div>	
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
	<script type="text/javascript">
		let slides = document.querySelectorAll('.testimonial-item');
		let index = 0;

		function nextSlide(){
		    slides[index].classList.remove('active');
		    index = (index + 1) % slides.length;
		    slides[index].classList.add('active');
		}
		function prevSlide(){
		    slides[index].classList.remove('active');
		    index = (index - 1 + slides.length) % slides.length;
		    slides[index].classList.add('active');
		}
	</script>
	<?php include 'components/alert.php'; ?>
</body>
</html>