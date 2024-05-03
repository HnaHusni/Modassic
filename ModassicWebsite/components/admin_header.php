<header class="header">
	<div class="flex">
		<a href="home.php" class="logo"><img src="../images/logo.jpg" class="logo-img"></a>
		<nav class="navbar">
			<a href="dashboard.php">dashboard</a>
			<a href="add_posts.php">add product</a>
			<a href="view_posts.php">view post</a>
			<a href="user_accounts.php">users</a>
			<a href="admin_accounts.php">admin</a>
			<a href="admin_message.php">messages</a>

		</nav>
		<div class="icons">
			<i class="bx bxs-user" id="user-btn"></i>
			
			<i class='bx bx-list-plus' id="menu-btn" style="font-size: 2rem;"></i>
		</div>
		<div class="profile-detail">
			<?php 
				$select_profile = $conn->prepare("SELECT * FROM `admin` WHERE id=?");
				$select_profile->execute([$admin_id]);
				if ($select_profile->rowCount() > 0) {
					$fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
				
			?>
			<div class="profile">
				<img src="../image/<?= $fetch_profile['profile']; ?>" class="logo-image" width="100">
				<p><?= $fetch_profile['name']; ?></p>
			</div>
			<div class="flex-btn">
				<a href="update_profile.php" class="btn">update profile</a>
				<a href="../components/admin_logout.php" onclick="return confirm('logout from this website')" class="btn">logout</a>
			</div>
			<?php }?>
			<style type="text/css">
	<?php include 'style.css'; ?>
</style>
		</div>
	</div>
</header>




