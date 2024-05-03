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

	if (isset($_POST['submit-btn'])) {
		// Retrieve form data
		$name = $_POST['name'];
		$email = $_POST['email'];
		$message = $_POST['message'];
	
		// Validate form data (you can add more validation as needed)
		if (empty($name) || empty($email) || empty($message)) {
			// Handle empty fields
			$error_msg = "Please fill in all the fields.";
		} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			// Handle invalid email
			$error_msg = "Invalid email format.";
		} else {
			// Insert data into the database
			$insert_message = $conn->prepare("INSERT INTO message (user_id, name, email, message) VALUES (?, ?, ?, ?)");
			$insert_message->execute([$user_id, $name, $email, $message]);
	
			// Check if insertion was successful
			if ($insert_message) {
				$success_msg[] = 'Your message has been submitted successfully!';
				// Clear form fields
				$name = $email = $number = $message = '';
			} else {
				$error_msg = "Something went wrong. Please try again later.";
			}
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
	<title>Modassice - home page</title>
</head>
<body>
	<?php include 'components/header.php'; ?>
	<div class="main">
		<div class="banner">
			<h1>User's Reviews</h1>
		</div>
		<div class="title2">
			<a href="home.php">home </a><span>/ Reviews</span>
		</div>
		<div class="testimonial-container">
			<div class="title">
				<h1>what people say about us</h1>
				<p>Read some reviews from our satisfied customers about Modassice and the quality of our furniture.
                </p>
            </div>
                <div class="container">
                	<div class="testimonial-item active">
                		<img src="images/userr.jpeg">
                		<h1>Husni</h1>
                		<p>"I recently purchased a dining table from Modassic and I must say, I'm impressed! The quality of the wood is exceptional, and the design perfectly complements my home décor."</p>
                	</div>
                	<div class="testimonial-item">
                		<img src="images/userr - copy.jpeg">
                		<h1>Hayat</h1>
                		<p>I ordered a sofa set from Modassic and couldn't be happier with my purchase. Not only is the furniture comfortable, but it also arrived much earlier than expected, which was a pleasant surprise!"</p>
                	</div>
                	<div class="testimonial-item">
                		<img src="images/user.jpg">
                		<h1>Helen</h1>
                		<p>"The bed frame I bought from Modassic exceeded my expectations. The craftsmanship is top-notch, and it adds a touch of elegance to my bedroom. Plus, the delivery was super fast!"</p>
                	</div>
                	<div class="testimonial-item">
                		<img src="images/user3.jpg">
                		<h1>Hala</h1>
                		<p>"I've been a loyal customer of Modassic for years now, and I've never been disappointed. Their furniture selection is vast, and the quality is consistently excellent. Highly recommend!"</p>
                	</div>
					<div class="testimonial-item">
                		<img src="images/user5.jpg">
                		<h1>Ghala</h1>
                		<p>"Modassic's pendant light and vases are simply stunning! The light adds warmth to my home, and the vases are perfect for displaying fresh flowers. I'm beyond impressed!"</p>
                	</div>

                	<div class="left-arrow" onclick="nextSlide()"><i class="bx bxs-left-arrow-alt"></i></div>
                	<div class="right-arrow" onclick="prevSlide()"><i class="bx bxs-right-arrow-alt"></i></div>
                </div>
				
		</div>
		<div class="form-container">
			 <form method="post">
			 	<div class="title">
			 		<h1>leave a message!</h1>
			 	</div>
			 	<div class="input-field">
			 		<p>your name <sup>*</sup></p>
			 		<input type="text" name="name">
			 	</div>
			 	<div class="input-field">
			 		<p>your email <sup>*</sup></p>
			 		<input type="email" name="email">
			 	</div>
			 	<div class="input-field">
			 		<p>your message <sup>*</sup></p>
			 		<textarea name="message"></textarea>
			 	</div>
			 	<button type="submit" name="submit-btn" class="btn">send message</button>
			 </form>
			 
		</div>
<br>
<br>
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