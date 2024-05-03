<?php 
	include '../components/connection.php';
	session_start();

	$admin_id = $_SESSION['admin_id'];

	if (!isset($admin_id)) {
		header('location: admin_login.php');
	}

	if (isset($_POST['publish']) || isset($_POST['draft'])) {
		$id = unique_id();
		$title = filter_var($_POST['title'], FILTER_SANITIZE_STRING);
		$price = filter_var($_POST['price'], FILTER_SANITIZE_STRING);
		$content = filter_var($_POST['content'], FILTER_SANITIZE_STRING);

		$status = isset($_POST['publish']) ? 'active' : 'deactive';

		$image = isset($_FILES['image']['name']) ? $_FILES['image']['name'] : '';
		$image_size = isset($_FILES['image']['size']) ? $_FILES['image']['size'] : '';
		$image_tmp_name = isset($_FILES['image']['tmp_name']) ? $_FILES['image']['tmp_name'] : '';
		$image_folder = '../image/'.$image;

		$selected_pages = isset($_POST['page']) ? $_POST['page'] : [];
		$selected_page = implode(',', $selected_pages);

		$select_image = $conn->prepare("SELECT * FROM `products` WHERE image = ?");
		$select_image->execute([$image]);

		if (!empty($image)) {
			if ($select_image->rowCount() > 0) {
				$message[] = 'Image name repeated!';
			} elseif ($image_size > 2000000) {
				$message[] = 'Image size too large!';
			} else {
				move_uploaded_file($image_tmp_name, $image_folder);
			}
		} else {
			$image = '';
		}

		if ($select_image->rowCount() > 0 && !empty($image)) {
			$message[] = 'Please rename your image';
		} else {
			$hover_image_name = '';
			if (!empty($_FILES['hover_image']['name']) && $_FILES['hover_image']['size'] > 0) {
				$hover_image_name = $_FILES['hover_image']['name'];
				$hover_image_tmp_name = $_FILES['hover_image']['tmp_name'];
				$hover_image_folder = '../image/'.$hover_image_name;
				move_uploaded_file($hover_image_tmp_name, $hover_image_folder);
			}

			$insert_post = $conn->prepare("INSERT INTO `products` (id, name, price, image, hover_image, product_detail, status, page) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			$insert_post->execute([$id, $title, $price, $image, $hover_image_name, $content, $status, $selected_page]);

			$message[] = 'Post published';
		}
	}

	// Fetch products for each page
	$phpFiles = array("Bedroom.php", "livingRoom.php", "home.php", "KidsRoom.php", "HomeOffice.php", "StudyRoom.php", "Terrace.php","Vases.php","ArtPrint.php","Clocks.php","Cushions.php","Lighting.php","Mirrors.php","Kitchen.php","Toilet.php");

	foreach ($phpFiles as $page) {
		$select_products = $conn->prepare("SELECT * FROM `products` WHERE page = ?");
		$select_products->execute([$page]);
		$products[$page] = $select_products->fetchAll(PDO::FETCH_ASSOC);
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- font awesome cdn link  -->
   	<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
	<title>Admin Dashboard</title>
	<style>
		<?php include 'admin_style.css'; ?>
	</style>
</head>
<body>
	<?php include '../components/admin_header.php'; ?>
	<div class="main">
		<div class="title2">
			<a href="home.php">Dashboard </a><span>/ Add Products </span>
		</div>
		<h1 class="heading">Add Product</h1>
		<div class="form-container">
			<form action="" method="post" enctype="multipart/form-data">
				<div class="input-field">
					<label>Product Name <sup>*</sup></label>
					<input type="text" name="title" maxlength="100" required placeholder="Add product title">
				</div>
				<div class="input-field">
					<label>Product Price <sup>*</sup></label>
					<input type="number" name="price" maxlength="100" required placeholder="Add product price">
				</div>
				<div class="input-field">
					<label>Product Detail <sup>*</sup></label>
					<textarea name="content" required maxlength="10000" placeholder="Write your content..."></textarea>
				</div>
				<br>
				<div class="input-field">
					<label>Select Page</label>
					<select name="page[]" id="pageSelect" multiple>
						<?php foreach ($phpFiles as $file): ?>
							<option value="<?= $file ?>"><?= $file ?></option>
						<?php endforeach; ?>
					</select>
					<input type="hidden" name="selected_page" id="selectedPage">
				</div>
				<div class="input-field">
					<label>Product Hover Image</label>
					<input type="file" name="hover_image" accept="image/jpg, image/jpeg, image/png, image/webp">
				</div>
				<div class="input-field">
					<label>Product Image <sup>*</sup></label>
					<input type="file" name="image" accept="image/jpg, image/jpeg, image/png, image/webp" required>
				</div>
				<div class="flex-btn">
					<input type="submit" name="publish" value="Publish Post" class="btn">
					<input type="submit" name="draft" value="Save Draft" class="btn">
				</div>
			</form>
		</div>
	</div>
	<script>
		var selectElement = document.getElementById('pageSelect');
		var hiddenInput = document.getElementById('selectedPage');
		selectElement.addEventListener('change', function() {
			hiddenInput.value = Array.from(this.selectedOptions).map(option => option.value).join(',');
		});
	</script>
</body>
</html>
