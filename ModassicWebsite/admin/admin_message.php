<?php 
include '../components/connection.php';
session_start();

$admin_id = $_SESSION['admin_id'];

if (!isset($admin_id)) {
    header('location: admin_login.php');
}

// Delete review 
if (isset($_POST['delete_review'])) {
    $delete_id = $_POST['delete_id'];
    $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

    $verify_delete = $conn->prepare("SELECT * FROM `message` WHERE id = ?");
    $verify_delete->execute([$delete_id]);

    if ($verify_delete->rowCount() > 0) {
        $delete_review = $conn->prepare("DELETE FROM `message` WHERE id = ?");
        $delete_review->execute([$delete_id]);
        $success_msg[] = "Message Deleted";
    } else {
        $warning_msg[] = 'Message Already Deleted';
    }
}

// Select reviews
$select_reviews = $conn->prepare("SELECT * FROM `message`");
$select_reviews->execute();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome CDN link -->
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
            <a href="Dashboard.php">Dashboard</a><span>/ User's messages</span>
        </div>
        <section class="message-container">
            <div class="box-container">
                <?php 
                if ($select_reviews->rowCount() > 0) {
                    while($fetch_review = $select_reviews->fetch(PDO::FETCH_ASSOC)){
                ?>
                <div class="box">
                    <h3 class="name"><?= $fetch_review['name']; ?></h3>
                    <p><?= $fetch_review['message']; ?></p>
                    
                    <form action="" method="post" class="flex-btn">
                        <input type="hidden" name="delete_id" value="<?= $fetch_review['id']; ?>">
                        <input type="submit" name="delete_review" value="Delete Message" class="btn" onclick="return confirm('Are you sure you want to delete this message?');">
                    </form>
                </div>
                <?php 
                    }
                } else {
                    echo '<p class="empty">No messages added yet!</p>';
                }
                ?>
            </div>
        </section>
    </div>
    <!-- SweetAlert CDN link -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!-- Custom JavaScript link -->
    <script type="text/javascript" src="script.js"></script>
    <?php include '../components/alert.php'; ?>
</body>
</html>
