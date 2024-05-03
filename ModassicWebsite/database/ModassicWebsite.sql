-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 12:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modassicwebsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `profile`) VALUES
(1, 'Hna', 'hanahusni@outlook.co', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Hna.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `qty` varchar(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `price`, `qty`) VALUES
('d6bD7kJHJlw4z4HXzJVV', '', 'SU4QSEwb7keslvFRbUEZ', '14', '1'),
('G9M1ZrOBR8sdNeFGoxjD', '', 'FVy0BPyTJdcQOPk6mChP', '10', '1'),
('rAyQfO7kf9Q3khvQcgBM', '29zoXcU06FPFd0PIQ02L', 'ZLKqDvYj7eQxzMchWa5w', '200', '1'),
('gMfXuf0v51WSRLA4jJlu', '29zoXcU06FPFd0PIQ02L', 'TS1L1CA53gcU5xsxS5tM', '3500', '1'),
('Cp4gJREJwkEUnF13CPtP', '29zoXcU06FPFd0PIQ02L', '9C6KS7S1Ux9FKGSll4XD', '3500', '1'),
('9LzILTHQmJjayfddEzkt', '29zoXcU06FPFd0PIQ02L', 'HVf7wUAkHS5X05ZFuhVe', '1400', '1'),
('C0ysRptp3S6QT2UAqssZ', '29zoXcU06FPFd0PIQ02L', 'RzOpURQSOVvm8vZZ5bqD', '350', '1');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `message`) VALUES
(3, '29zoXcU06FPFd0PIQ02L', 'Hna', 'hanahusni@outlook.com', 'Perfeect website <3'),
(5, '29zoXcU06FPFd0PIQ02L', 'Hna', 'hanahusni@outlook.com', 'I lovvveee it <3'),
(6, '29zoXcU06FPFd0PIQ02L', 'Hna', 'hanahusni@outlook.com', 'wooow ! This is so classy and elegant !'),
(7, '29zoXcU06FPFd0PIQ02L', 'Nay', 'hanahusni@outlook.com', 'Amazing !!'),
(8, '29zoXcU06FPFd0PIQ02L', 'Nay', 'hanahusni@outlook.com', 'Amazing !!'),
(9, '29zoXcU06FPFd0PIQ02L', 'Hna', 'hanahusni@outlook.com', 'I love it ..');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `address_type` varchar(10) NOT NULL,
  `method` varchar(50) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `qty` varchar(2) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'in progress',
  `payment_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `address`, `address_type`, `method`, `product_id`, `price`, `qty`, `date`, `status`, `payment_status`) VALUES
('wZDzcXOGFH3YrSGEsDuZ', '29zoXcU06FPFd0PIQ02L', 'Hna', '0581666408', 'hanahusni@outlook.com', '88, 88, Al Ain, UAE, 110022', 'home', 'cash on delivery', 'U5HVXgucrW69HYYrFo1b', '400', '1', '2024-04-18', 'in progress', 'complete'),
('zxgzJWzDlc72MuOxMexv', '29zoXcU06FPFd0PIQ02L', 'Hana', '0581666408', 'hanahusni@outlook.com', '88, 88, Al Ain, UAE, 110022', 'home', 'cash on delivery', 'siy4GvZOkbxvm7lN8yDL', '350', '1', '2024-04-19', 'in progress', ''),
('hfs9N6rnCGGDylTZeTiY', '29zoXcU06FPFd0PIQ02L', 'Hana', '0581666408', 'hanahusni@outlook.com', '88, 88, Al Ain, UAE, 110022', 'home', 'cash on delivery', 'd7neX44Eq3wojBeAoSEM', '30', '1', '2024-04-19', 'canceled', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_detail` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL,
  `page` varchar(255) DEFAULT NULL,
  `hover_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `product_detail`, `status`, `page`, `hover_image`) VALUES
('fEb5sVraI1fYuh99fLNr', 'Wabi Sabi', '2000', 'img50.jpg', '                      Amazing Beige Pendant WABI SABI warm Light HTD\r\n', 'active', 'home.php', NULL),
('TS1L1CA53gcU5xsxS5tM', 'Dining Table Set', '3500', 'img6-.jpg', '                      Wooden Rectangular Dining set with a table and six chairs\r\n', 'active', 'home.php', NULL),
('zLvs1hLD1t1K7axN5U9p', 'Sofa', '1000', 'img44-.jpg', '                      PIETRA Kristal 3 Seater Sofa with two cushions\r\n', 'active', 'home.php', NULL),
('6VYBxJ1wrXprEWR1OEum', 'Classic Bedroom set', '4850', 'img49-.jpg', '                      Master classic bedroom set, crafted from rich wood\r\n', 'active', 'home.php', NULL),
('plKrK5Bo8kZEhhFkL88F', 'Glass Table', '1000', 'img39.jpg', '                      Square glass table with brown base and wooden legs\r\n', 'active', 'home.php', NULL),
('siy4GvZOkbxvm7lN8yDL', 'Flower Vase', '350', 'img53-.jpg', '                      Ceramic Flower Vase, Brown Human Body for Home Decor\r\n', 'active', 'home.php', NULL),
('U5HVXgucrW69HYYrFo1b', 'Mirror', '400', 'img52-.jpg', '                      circle toilet mirror with stanliss-steel corners\r\n', 'active', 'home.php', NULL),
('rlYMQRBlTJtjiV0jcLTx', 'Kids Study Disk', '1000', 'img16-.jpg', '                      Computer Desk with Drawers, chair and beige table lamb\r\n', 'active', 'home.php', NULL),
('gsjBBRty6O0MFlUgV05U', 'Wood Bed Frame', '2000', 'picc5.jpg', '              Set of 2 pieces per package, Bed and Headboard.\r\n', 'active', 'Bedroom.php', 'pic5.jpg'),
('9C6KS7S1Ux9FKGSll4XD', 'Engraved Side Table', '3500', 'pic2.jpg', '            Includes Drawer on metal glides and storage space.\r\n', 'active', 'Bedroom.php', 'picc2.jpg'),
('v8zdGWtO6kPUX0sZHOg2', 'Sheet Set', '1000', 'pic7.jpg', 'Stonewashed pure lyocell sheet set,\r\nFits mattresses up to 16 in', 'active', 'Bedroom.php', 'picc7.jpg'),
('S2TfNxOLvrMjnIfnH2R6', 'Woven Ottoman', '4850', 'pic8.jpg', '            Natural hemp woven in a circular shape adds.    \r\n', 'active', 'Bedroom.php', 'picc8.jpg'),
('YXiRd5ZLLkv1hW1rDNHH', 'Closet ', '1000', 'pic16.jpg', '            Large brown closet with two doors and lots of Drawers.\r\n', 'active', 'Bedroom.php', 'picc16.jpg'),
('HfTVqeznsqMN7bnUfqiM', 'Chair', '350', 'pic11.jpg', '            Ceramic beige side chair for bedroom Decor  \r\n', 'active', 'Bedroom.php', 'picc11.jpg'),
('HKZQd0UcbuyrNMeZiVvl', 'Pillow and Blanket', '400', 'pic14.jpg', '            Soft colorful recycled polyester fill for improved loft \r\n', 'active', 'Bedroom.php', 'picc14.jpg'),
('1qSOR5W0s31e7knz8HDd', 'Mirror with chair', '1200', 'picc15.jpg', 'Beige LOVA DRESSER AND MIRROR YOLVA', 'active', 'Bedroom.php', 'pic15.jpg'),
('hGitrP6yuNUZ5n6H9Ve0', 'Classic Bed', '2000', 'img49 - Copy.jpg', '            classic Set of 3 pieces per package, Bed and bedside table.\r\n', 'active', 'Bedroom.php', 'img49 - Copy - Copy.jpg'),
('IQBStnB5WHlolpBWUhUC', 'Bedside Table', '350', 'tabl.jpg', '          Includes Drawer on metal glides and storage space.\r\n', 'active', 'Bedroom.php', 'tabll.jpg'),
('HVf7wUAkHS5X05ZFuhVe', 'Seat with Mirror', '1400', 'tsr.jpg', '          Grey chair with mirror and table , set of 3 per package         \r\n', 'active', 'Bedroom.php', 'tsrr.jpg'),
('UafrESvUTQ8b0ufn9wzN', 'Closet', '2500', 'closet.jpg', '          Brown closet with Transparent door and a lot of Drawers         ', 'active', 'Bedroom.php', 'closett.jpg'),
('IbC3OjiD2ABRW9rm59OC', 'Artisanal Rug', '200', 'L1.jpg', ' Hand-knotted wool\r\n Pile height: 0.25&#34; to 0.5&#34;  ', 'active', 'livingRoom.php', 'L2.jpg'),
('Wm0t2E3PMwGbaLlFxrqp', 'Three-drawer TV unit', '850', 'L4.jpg', 'Suitable for TV screens of up to 80 inches  ', 'active', 'livingRoom.php', 'L3.jpg'),
('SmOGXFpH3z95PgAwDpKy', 'Beanbag Chair', '1000', 'L5.jpg', ' Easy transport\r\n High quality polystyrene bead fill ', 'active', 'livingRoom.php', 'L6.jpg'),
('LRC0o86ostXw3zqcaGT8', 'Sofa Sets', '4800', 'L7.jpg', 'Soft corduroy easy to care for\r\nCompressed foam fill', 'active', 'livingRoom.php', 'L8.jpg'),
('gDLuyMDFCHfGuuHDrPdq', 'Side Table', '1000', 'L9.jpg', '              Two-tone side table, Oak wood and plywood frame\r\n', 'active', 'livingRoom.php', 'L10.jpg'),
('6PKIHdQlmptG9BJKE0Hn', 'Classic Sofa Set', '3500', 'L11.jpg', 'Beautiful classic sofa set with 3-seat sofas, Hallarp dark grey', 'active', 'livingRoom.php', 'L12.jpg'),
('znjR8uMNDbhDuNgsxBg5', 'Curtain', '400', 'L13.jpg', '  Sewn edging pure cotton\r\n  Adjustable length\r\n  130 x 270cm', 'active', 'livingRoom.php', 'L14.jpg'),
('vGydSDegfBHgDLKSw9By', 'Coffee Table', '1500', 'L15.jpg', 'Birch plywood legs\r\n              Two built-in storage spaces at ends', 'active', 'livingRoom.php', 'L16.jpg'),
('MKLxevHdncSVV5x2dysz', 'Sofa set', '2000', 'img4 - Copy.jpg', '                  White sofa set with white and black tables           \r\n', 'active', 'livingRoom.php', 'img4 - Copy (2).jpg'),
('LzVD4xK4Or98zJlWcPAP', 'Sofa', '1000', 'imgg3 - Copy.jpg', 'comfortable \r\nHigh quality sofa set with cushions ', 'active', 'livingRoom.php', 'imgg3 - Copy - Copy.jpg'),
('fxbEBypMQOHlWiyUMymO', 'Sofa Sets', '4850', 'img59 - Copy.jpg', 'Soft corduroy L sofa set modern', 'active', 'livingRoom.php', 'img59 - Copy (2).jpg'),
('JOOA7b9OAB75FIDqefew', 'Twin Bed', '2000', 'k2.jpg', 'Two brown and beige beds suitable for twin, with ladder          \r\n', 'active', 'KidsRoom.php', 'k1.jpg'),
('B36UAg30pXQGn3MW3FBh', 'Pillowcase', '350', 'k3.jpg', '              200 thread count cotton and recycled polyester percale      \r\n', 'active', 'KidsRoom.php', 'k3 - Copy.jpg'),
('9AY0ll4xn3GROFfWbbFe', 'Table', '1000', 'k4-.jpg', 'Children Table with two white chairs suitable for playing           \r\n', 'active', 'KidsRoom.php', 'k4.jpg'),
('dbhFeIC4e1xMAGKU5bj3', 'Round Rug', '480', 'k5.jpg', 'Solar system tufted round rug\r\n100 cm in diameter', 'active', 'KidsRoom.php', 'k6.jpg'),
('TzXqig1homhwdaOOLseN', 'Mushroom woven pouf', '1200', 'k7.jpg', 'Braided cotton and jute 40 x 40 cm ', 'active', 'KidsRoom.php', 'k8.jpg'),
('yvVGxxSlJmVsm6wlP6xm', 'Snail Chair', '350', 'k9.jpg', 'Wooden snail chair with cotton seat, for playing', 'active', 'KidsRoom.php', 'k10.jpg'),
('Spcqf2uInEA6D41ErgK8', 'Bed', '860', 'kidbed.jpg', '              Two brown and beige beds suitable for twin, with ladder \r\n', 'active', 'KidsRoom.php', 'kidbedd.jpg'),
('4ZjtKHuFBM6bE9dWQU40', 'Basket', '120', 'k14.jpg', 'Cute big beige basket with stuffed elephant toy ', 'active', 'KidsRoom.php', 'k13.jpg'),
('oKI7kEwVz1W1sJS2eu7l', 'Closet', '2000', 'k15.jpg', '              Amazing brown beige closet for kids , with some shelves            \r\n', 'active', 'KidsRoom.php', 'k16.jpg'),
('r9RPaYyQZKFCnLq52mHm', 'cotton seat', '1350', 'img31 - Copy.jpg', 'Comfortable cotton brown seat with two cushions', 'active', 'KidsRoom.php', 'img32 - Copy.jpg'),
('nPubwBXRlTrxOB66KoPn', 'Kid&#39;s Sofa', '1100', 'img37 - Copy.jpg', 'Sofa that can be bed with six cushions and toy', 'active', 'KidsRoom.php', 'img34 - Copy.jpg'),
('LehHfidkEHVeIu4VsryN', 'Bed', '4280', 'img55-.jpg', '           Dark brown bed for boy or girl covered with cotton \r\n', 'active', 'KidsRoom.php', 'img55-- - Copy.jpg'),
('QzDFDfwoFKCQPMGTuDFO', 'Comfortable Seat', '800', 'seat.jpg', 'Two circle Comfortable gray seats for kids ', 'active', 'KidsRoom.php', 'seatt.jpg'),
('1wrj0N6z935b771XNXG0', 'Swing Chair', '350', 'swingg.jpg', '            Kid&#39;s Hanging Swing Chair Patio glass Basket Round          \r\n', 'active', 'KidsRoom.php', 'swing.jpg'),
('EHelMxwnBe5mUFBD4Knb', 'Bed', '400', 'whitebedd.jpg', 'White and Blue kid bed with blanket and five pillows', 'active', 'KidsRoom.php', 'whitebed.jpg'),
('qo1vJBVgUJ51v6e577Ze', 'Kids Disk', '1000', 'ply.jpg', '           Blue Table with two elephant shaped chairs  \r\n', 'active', 'KidsRoom.php', 'plyy.jpg'),
('itMth6Fk3XlpTo3dm3EO', 'Office Sofa', '2000', 'picc12.jpg', 'Comfortable sofa for reading with circle sidetable', 'active', 'HomeOffice.php', 'pic12.jpg'),
('DbxbFAa45tO0Akg1tarN', 'Desk', '3500', 'o2.jpg', 'Glass wooden table with chair suitable for home office        \r\n', 'active', 'HomeOffice.php', 'o1.jpg'),
('TEi2HVirJJCCbNbWjvju', 'Sidetable', '1000', 'o3.jpg', 'Translucent Coffe table with magazine holder side ', 'active', 'HomeOffice.php', 'o4.jpg'),
('vKTlAQKsHrLiPSQqj3Ol', 'Cabinet', '480', 'o8.jpg', 'Black Cabinet with open shelves for office', 'active', 'HomeOffice.php', 'o7.jpg'),
('RQ5YkTfO05WF6fxYiIYP', 'Plywood Desk', '1000', 'o9.jpg', '                Black and birch plywood desk, Weight: 64 pounds\r\n', 'active', 'HomeOffice.php', 'o10.jpg'),
('6ySRQcndR58zAtCNZMxf', 'Table', '380', 'O11.jpg', '                Anthracite side table, built-in storage space at ends\r\n', 'active', 'HomeOffice.php', 'O12.jpg'),
('BOIMiHQNSdOBQ6FIEItc', 'shag rug', '400', 'O13.jpg', '                Thin contrasting shag rug, size 160X230CM          \r\n', 'active', 'HomeOffice.php', 'O14.jpg'),
('qhSsSa5i9kK5WsH14LBK', 'Table Set', '1000', 's4.jpg', '                Two circle wooden tables suitable for office        \r\n', 'active', 'HomeOffice.php', 's3.jpg'),
('U42wzWBN5mngtCiUnfgV', 'Chair', '350', 'kidchair.jpg', 'comfortable grey chair with white circle sidetable ', 'active', 'StudyRoom.php', 'kidchair2.jpg'),
('1bH6jCXodbdm2Y038i8y', 'Floor seat', '800', 's1.jpg', 'Relaxing brown wooden floor chair with back Support', 'active', 'StudyRoom.php', 's2.jpg'),
('GO5mUZsEfxan5T0sSgtK', 'Basket', '480', 'o15.jpg', '              Wood Accent Cube Basket The Ideal Square Size For Books        \r\n', 'active', 'StudyRoom.php', 'o16.jpg'),
('19dZwOHeTWiTvz7LvrnH', 'Studying Table', '600', 's5.jpg', '              A white desk table with brown base and wooden legs\r\n', 'active', 'StudyRoom.php', 's6.jpg'),
('aamDC6hjiZFCa72xrLlj', 'Desk', '350', 's10.jpg', '              chair and 110 cm high table and black bar leg         \r\n', 'active', 'StudyRoom.php', 's9.jpg'),
('69R9XcSY1NENiZ6sVhPz', 'Shelf', '460', 's11.jpg', '              Wood and metal triple shelf, Each shelf holds up to 50 lb\r\n', 'active', 'StudyRoom.php', 's11 - Copy.jpg'),
('2', 'Rug', '1200', 'k5.jpg', '              Colored circle rug, High-quality yarn-dyed fibres\r\n', 'active', 'StudyRoom.php', 'k6.jpg'),
('3', 'Desk', '2000', 'img16-.jpg', 'Beige desk with Drawers and chair with wooden legs       ', 'active', 'StudyRoom.php', 'img16 - Copy.jpg'),
('4', 'cushions', '800', 'img44-.jpg', 'grey cushions Suitable for modern sofa', 'active', 'livingRoom.php', 'img46.jpg'),
('d4gi9dm3PmD7pAiqBqU2', 'Bench', '2000', 't2.jpg', 'The seat doesn&#39;t heat up when exposed to sunlight 15KG\r\n', 'active', 'Terrace.php', 't1.jpg'),
('5X7DfiE4dMcRjmDtNyGn', 'Doormat', '80', 't3 - Copy.jpg', 'Engraved heart doormat \r\n40cm x 70cm', 'active', 'Terrace.php', 't3.jpg'),
('INFxYw9v7lfcc4GGQEBK', 'Table', '1000', 't8.jpg', 'round wooden table with four brown chairs\r\n', 'active', 'Terrace.php', 't9.jpg'),
('GexfaVEYudz08KI6ORX3', 'Cushion', '80', 't10.jpg', '           long outdoor cushion , Water repellent\r\n40cm x 60cm ', 'active', 'Terrace.php', 't11.jpg'),
('N5O8cm4aqWMoml12BCpO', 'Hanging chair', '800', 't12.jpg', 'cozy comfortable Hanging chair for outdoor terrace', 'active', 'Terrace.php', 't12 - Copy.jpg'),
('cFzwDldQzkCRjKkX3IQG', 'Cushions', '360', 'TE1.jpg', 'Orange Linen Waterproof Pillow Farmhouse Cushion         \r\n', 'active', 'Terrace.php', 'TE11.jpg'),
('YnJHN2n96yOSSDVv9fRC', 'Floor Lamp', '400', 't16.jpg', 'Lantern Waterproof LED Modern Solar standing Lamp          \r\n', 'active', 'Terrace.php', 't17.jpg'),
('XjrwhhajUr69jxUUsejc', 'Patio Set', '1500', 'TER.jpg', '            Outdoor orange Furniture Sets for Your Patio        \r\n', 'active', 'Terrace.php', 'TERR.jpg'),
('FYmYVXyEIHZ6ouOia2ap', 'Hanging Lamp', '850', 'tt4.jpg', '            Beige hanging Lamp with Fabric Shade stylish Lamp\r\n', 'active', 'Terrace.php', 'tt5.jpg'),
('iFpffIaAYpzamuhHSJid', ' Chair Set', '1200', 'tt.jpg', 'Four chairs set suitable for otdoor furniture', 'active', 'Terrace.php', 'tt1.jpg'),
('NWoQkoc3HLNfs2GnOhFB', 'Fire Pit', '800', 'tt3.jpg', '          Out Fire Pit, Square Firepit Table, Wood Burning Stove         \r\n', 'active', 'Terrace.php', 'tt2.jpg'),
('jtlrolaOgALNFIvD9Wjb', 'Chair', '600', 'ttt - Copy.jpg', '          Beige outdoor chair comfortable with wooden legs   \r\n', 'active', 'Terrace.php', 'ttt.jpg'),
('AOpBxxrA6v9IveTkjcr5', 'Striped vase', '200', 'v1.jpg', 'Ceramic with shiny and matte finishes\r\n', 'active', 'Vases.php', 'v1 - Copy.jpg'),
('UmhgG5EcvHB9Aeln34eq', 'Circular vase', '350', 'v2 - Copy.jpg', 'Painted dolomite original silhouette\r\n            11cm x 19cm ', 'active', 'Vases.php', 'v2.jpg'),
('aQVqUnqdH8ytLLOggkxa', 'Vase', '100', 'v3.jpg', '  Add a soft touch to your space with this decorative vase   \r\n', 'active', 'Vases.php', 'v3 - Copy.jpg'),
('TTapMDuNNE63YeMu5rFj', 'Angular vase', '480', 'v4.jpg', 'blend of recycled wood and corn-based bioplastics', 'active', 'Vases.php', 'v4 - Copy.jpg'),
('86zywLgGA0wAL0EdnQ4c', 'Vase', '100', 'v6.jpg', '            Add a soft touch to your space with this decorative vase          \r\n', 'active', 'Vases.php', 'v6 - Copy.jpg'),
('MfNcVO2BzC2ppKrm9aim', 'Colored Vase', '350', 'v7.jpg', 'cute vase with light colors for small flowers', 'active', 'Vases.php', 'v7 - Copy.jpg'),
('ztoXCrVlm0K4UXmyx7fy', 'Vase', '400', 'v8.png', 'ceramic vases with hand holder bright colored', 'active', 'Vases.php', 'v8 - Copy.png'),
('AB8h6hmljC5yigAyOUCH', 'Face Vases', '100', 'v10.jpg', 'clay vases with face print set of 3 pecies ', 'active', 'Vases.php', 'v10-.jpg'),
('phMHQ3gmUOicaG8xycrW', 'Human Vase', '200', 'v11.jpg', 'Vase look like human style suitable for modern houses', 'active', 'Vases.php', 'v11 - Copy.jpg'),
('Duzyks37jTERxe8osfW9', 'Circular Vase', '350', 'v12.jpg', 'Painted dolomite original silhouette\r\n11cm x 19cm ', 'active', 'Vases.php', 'v12 - Copy.jpg'),
('wPGRSe5vRmpgV1U5QVNK', 'Vase', '100', 'v13-.jpg', '            Add a soft touch to your space with this decorative vase          \r\n', 'active', 'Vases.php', 'v13.jpg'),
('AQ4hvMsqffL9VNKKOir4', 'Vase', '480', 'v14 - Copy.jpg', 'cute shaped vases set of 3 different colores', 'active', 'Vases.php', 'v14.jpg'),
('pz96sjTDlZpAh3lSS04X', 'black clock', '200', 'c1.jpg', 'Elegant black clock , black lines in the middle  \r\n', 'active', 'Clocks.php', ''),
('Rx8QzWjkymWBqmCmGG0Z', 'Wooden clock', '350', 'c2.jpg', 'classic round wooden clock numbers shown in black  \r\n', 'active', 'Clocks.php', ''),
('27enZsN7LSdlemR2YJ19', 'Clock', '100', 'd8.jpg', '           black clock circle lines with golden clockwise\r\n', 'active', 'Clocks.php', ''),
('Y1hftszfVYEdZq3PEjfC', 'Wooden clock', '480', 'c5.jpg', 'circle wooden clock with cracks on the side    \r\n', 'active', 'Clocks.php', ''),
('RD6fwui6uniR72Z78D05', 'clock', '150', 'c12.jpg', 'small round clock light green color with white clockwise  \r\n', 'active', 'Clocks.php', ''),
('klzWjaPbyKmbcY1I2ing', 'Black clock', '350', 'cc2.jpg', 'side wall clock looks like bended black clock ', 'active', 'Clocks.php', ''),
('48wOM3KOQs32n5J40Owq', 'bird clock', '400', 'c11.jpg', 'wooden and light green clock wit birds around it ', 'active', 'Clocks.php', ''),
('5fUB71XSvtDN5UU1xOsW', 'clock', '100', 'c13.jpg', 'simple wall clock black color golden clockwise ', 'active', 'Clocks.php', ''),
('RleqYG8SvPLOOF5IytPh', 'clock', '200', 'cl.jpg', 'cute simple clock with two colors grey and salmon \r\n', 'active', 'Clocks.php', ''),
('vsMX7d8VO8zDKIEAoEBJ', 'clock', '350', 'cl2.jpg', 'clock with paint behind with different colors\r\n', 'active', 'Clocks.php', ''),
('1JlZcG3Uk2WB4BsJA96i', 'Clock', '100', 'cll.jpg', '          beige clock with white clockwise gives cute decor   \r\n', 'active', 'Clocks.php', ''),
('XcjfH0n3QPOG28oKYHS7', 'clock', '450', 'clll.jpg', '         Salmon color clock with black clockwise gives cute decor   \r\n', 'active', 'Clocks.php', ''),
('CHhMyYGVg3nmirrqhwSG', 'rounded mirror', '400', 'm1.jpg', '               large rounded mirror with a minimalist, completely sleek\r\n', 'active', 'Mirrors.php', ''),
('JgnU3DebwhQQpp48FmJX', 'Golden mirror', '350', 'mirror - Copy.jpg', ' elegant and modern mirror emanates cute decor  \r\n', 'active', 'Mirrors.php', ''),
('HXF1J9zA2pAigOCX452L', 'Curvy frame mirror', '700', 'm3.jpg', '            curved frame evoking clouds mirror perfect to your decor         \r\n', 'active', 'Mirrors.php', ''),
('hV86mqVodywtWPoy93pp', 'Grooved mirror', '480', 'm4.jpg', '            Mirror glass Create an undeniably charming decor           \r\n', 'active', 'Mirrors.php', ''),
('aLbZwIBNWpEnEEe56b2g', 'Mirror', '100', 'm6.jpg', '            A minimalist design infuse your home with elegance!\r\n', 'active', 'Mirrors.php', ''),
('ozYi33HwEdJbIokepeNZ', 'waves mirror', '350', 'img64 - Copy.jpg', '           frameless design that will stand out in any decor.    \r\n', 'active', 'Mirrors.php', ''),
('8dZW6g8ovLVeuCx39svq', 'Mirror', '400', 'm10.jpg', '            Mirror Glass Create An Undeniably Charming Decor         ', 'active', 'Mirrors.php', ''),
('s2g5JNVAm43J6aUSukcb', 'Rounded mirror', '100', 'm11.jpg', '            graceful curves and an elegant oval mirror   \r\n', 'active', 'Mirrors.php', ''),
('9GHrG3B4ZveckurX8Qv0', 'flower mirror', '200', 'm12.jpg', '            classic flower shaped mirror suitable for decor\r\n', 'active', 'Mirrors.php', ''),
('RzOpURQSOVvm8vZZ5bqD', 'Circle mirror', '350', 'm5.jpg', 'Golden frame mirror match with any decor', 'active', 'Mirrors.php', ''),
('whFPaK7XERdzXAxuAvQU', 'Mirror', '100', 'm13.jpg', 'big cute curvy mirror with golden frame  ', 'active', 'Mirrors.php', ''),
('7B41EyugsNKcE7BJc3Ve', 'Round mirror', '480', 'm2.jpg', 'Wooden frame inserts around glass mirror ', 'active', 'Mirrors.php', ''),
('o5UnYCnhThEdgNWjolAW', 'blossom cushion', '200', 'cu1.jpg', ' Daisy blossom cushion Removable cover\r\n 45x45cm', 'active', 'Cushions.php', 'cu1-.jpg'),
('sVGuBhKEHafDqHvoRzlT', 'Plush cushion', '350', 'cuu2.jpg', 'Add a chic dose of texture to your decor', 'active', 'Cushions.php', 'cuu2-.jpg'),
('TRYQVtf4thHPxR9XfZQU', 'cushion', '100', 'cu3.jpg', '            Fringed linen-like cushion\r\n45cmx45cm   ', 'active', 'Cushions.php', 'cu3-.jpg'),
('odvzXfPJ4fkHh2zCP4nB', 'Corduroy cushion', '480', 'cu4.jpg', 'Removable cover and a hidden zip on the edging', 'active', 'Cushions.php', 'cu4-.jpg'),
('V2VsGGRVHMizMGed5vQJ', 'Nomadic cushion', '100', 'cu5.jpg', '            Ivory cushion evokes ancient traditions 35x76cm\r\n', 'active', 'Cushions.php', 'cu5-.jpg'),
('TOTFjqSA5v7ngBUCVDNO', 'tufted cushion', '350', 'cu7.jpg', '            Cover in a cotton, recycled cotton, and linen blend    \r\n', 'active', 'Cushions.php', 'cu7-.jpg'),
('ehT7subEZK9tOZ6X07SE', 'linen-like cushion', '200', 'cu8.jpg', ' Fringed linen-like cushion\r\n 45cmx45cm', 'active', 'Cushions.php', 'cu8-.jpg'),
('G8uz2JTca0xDhkmjRkZn', 'chenille cushion', '100', 'cu6.jpg', '  Textured chenille soft cushion\r\n  50 x 50 cm ', 'active', 'Cushions.php', 'cu6-.jpg'),
('qQoDsw6w5gVVD40iM5RZ', 'coffee cushion', '200', 'cu9.jpg', '            Coffee-To-Go Amuseable plush \r\n15cm tall', 'active', 'Cushions.php', 'cu9-.jpg'),
('tSdq5SbRD22spmW80Wol', 'mushroom cushion', '300', 'cu10.jpg', 'Sherpa fleece mushroom cushion\r\n30 x 44 cm', 'active', 'Cushions.php', 'cu10 - Copy.jpg'),
('soiI1CpWpZwbWuvHWtqF', 'cushion cover', '200', 'cu11.jpg', '          Unikko beige cushion cover \r\n50 x 50 cm ', 'active', 'Cushions.php', 'cu11-.jpg'),
('3FIufdXV8Z5AGLMhaMYc', 'lion cushion', '150', 'cu12.jpg', '          Happy lion soft cushion\r\n32 x 37 cm ', 'active', 'Cushions.php', 'cu12-.jpg'),
('kWUHReItFhEGicdwt8RU', 'Art print', '200', 'a1.jpg', '              Abstract silhouette art print, Paper print with Hanging \r\n', 'active', 'ArtPrint.php', ''),
('WWF3dXP9obrEBKC8RqMo', 'curves art print', '350', 'a2.jpg', '            Sinuous curves black Rectangular art print    ', 'active', 'ArtPrint.php', ''),
('12qSnTNES4x1FVgs7YAS', 'femininity print', '100', 'a4.jpg', '            Wearing a sumptuous dress with fine ivory stripes         \r\n', 'active', 'ArtPrint.php', ''),
('nRjhZ60iCEO8Y9y3oK1X', 'Art print', '480', 'a3.jpg', ' femininity art print \r\n30.5 x 40.75 cm', 'active', 'ArtPrint.php', ''),
('B0DStrVRMeohj5WqDia9', 'Art Print', '100', 'a5.jpg', 'Fleeting dawn art print Like a night sky', 'active', 'ArtPrint.php', ''),
('x2zrBnE0yo0WBTrCVI7q', 'Morning glow', '350', 'a6.jpg', '            Like a reflection of a soft sunrise art print  \r\n', 'active', 'ArtPrint.php', ''),
('nUVGq1zSuSdRLQnm677U', 'Evolution print', '400', 'a7.jpg', '            Painted in a rich neutral palette 30.5 x 40.75 cm      \r\n', 'active', 'ArtPrint.php', ''),
('oxZiQMiGZKNkvz0TH3vI', 'Metamorphosis print', '100', 'a8.jpg', '            A work with disjointed, yet blended lines        ', 'active', 'ArtPrint.php', ''),
('DyYtvOuiYUBsdSrsWaD3', 'Art Paint', '200', 'a13.jpg', 'Abstract character half-moons and fine arches', 'active', 'ArtPrint.php', ''),
('3W0S1fuGNuFxTkTfF0Ew', 'Inverted art print', '350', 'a14.jpg', 'Inverted character art print, earthy tones', 'active', 'ArtPrint.php', ''),
('kBCPLuoBaxey8X99K5XZ', 'Plant Art Paint', '100', 'a11.jpg', 'shadow of leaf Plant silhouette art print', 'active', 'ArtPrint.php', ''),
('wRdNtwj7l6lajuC4fzno', 'Art Print ', '100', 'a12.jpg', 'Natural abstract series of nuanced cutouts', 'active', 'ArtPrint.php', ''),
('ZLKqDvYj7eQxzMchWa5w', 'Pendant Light', '200', 'li1.jpg', '              Attalos Pendant Light, Brass \r\n              200w x 200d', 'active', 'Lighting.php', 'li2.jpg'),
('g4diFr4WlFiOJ6XKsPv1', 'Danoise light', '350', 'li3.jpg', 'Includes a Tala Sphere type bulb 14cm tall', 'active', 'Lighting.php', 'li4.jpg'),
('We96ZlCjHYFsNynEM0Yd', 'hanging lamp', '100', 'li5.jpg', 'Small hanging lamp Includes a Tala bulb', 'active', 'Lighting.php', 'li6.jpg'),
('oexxi0zQjfLrXbSV70ZN', 'Terra Light', '480', 'li7.jpg', 'Terra 1.5 Pendant Light - Solid Rod ', 'active', 'Lighting.php', 'li8.jpg'),
('KnFMKfpPY8SyBL5iwrbC', 'hanging lamp ', '180', 'li13.jpg', 'Fabric hanging line, Finlandaise hanging lamp', 'active', 'Lighting.php', 'li14.jpg'),
('C0YwMi0Wi6ZIoh3QAk92', 'Danoise lamp', '350', 'li11.jpg', ' Danoise hanging lamp\r\n 38cm in diameter ', 'active', 'Lighting.php', 'li12.jpg'),
('sKaNybkEHnQY4ScTpeOe', 'Yoko hanging lamp', '400', 'li9.jpg', 'hanging lamp Includes a Tala Sphere type bulb ', 'active', 'Lighting.php', 'li10.jpg'),
('CVJJ3Fu6EZDsfYueGkKJ', 'lamp', '100', 'li15.jpg', 'Maroon Large Yoko hanging lamp 14cm', 'active', 'Lighting.php', 'li16.jpg'),
('SQOaYSACkWwLwNmmzQLc', 'Wall lamp', '200', 'li19.jpg', 'Nopal asymmetrical wall lamp light fixture', 'active', 'Lighting.php', 'li20.jpg'),
('prLc6wnCveAuXEhcxRWt', 'Sopal Lamp', '350', 'li21.jpg', ' Sopal large hanging lamp Fabric hanging line', 'active', 'Lighting.php', 'li22.jpg'),
('z3qCocpAlUe6LlhXvy4q', 'Seagrass lamp', '100', 'li23.jpg', ' Geo hanging lamp 40W Adjustable length ', 'active', 'Lighting.php', 'li24.jpg'),
('dq9c87M8JijqLWtnESmQ', 'Lotus lamp', '480', 'li25.jpg', 'Lotus hanging lamp, Includes a Tala bulb', 'active', 'Lighting.php', 'li26.jpg'),
('4WT9i7BqtObu7Vso6Fv6', 'Birds Tablecloth', '40', 'x.jpg', 'Colourful birds recycled polyester tablecloth, Never needs ironing', 'active', 'Kitchen.php', 'x1.jpg'),
('ZcFuBw2DIlBB0mme5pka', 'Lemon Tablecloth', '35', 'X3.jpg', 'Lemon trees recycled polyester tablecloth, 54&#34;X54&#34; Matching napkin also available', 'active', 'Kitchen.php', 'X4.jpg'),
('NVjxJqxuwBcCihwNnjj8', 'stripe tablecloth', '50', 'x5.jpg', 'Vacation stripe recycled cotton tablecloth 58&#34;X76&#34; Matching napkin also available', 'active', 'Kitchen.php', 'x6.jpg'),
('LgeYeemEiPdgK9cHd9YP', 'flowers tablecloth', '26', 'x7.jpg', 'Pink flowers recycled polyester tablecloth, 60&#34;X108&#34;', 'active', 'Kitchen.php', 'x8.jpg'),
('r8zE6NkBQWhjkVIIgWKP', 'apron', '38', 'n.jpg', 'Green gingham coated apron, 28.25&#34; x 35.25&#34;', 'active', 'Kitchen.php', 'n1.jpg'),
('OdiA4fHTTOIrmFlOy2je', 'cotton apron', '50', 'n2.jpg', 'Nautical stripes organic cotton apron', 'active', 'Kitchen.php', 'n3.jpg'),
('d7neX44Eq3wojBeAoSEM', 'Apron.Mitten', '30', 'n4.jpg', 'Macro flower recycled fibre accessories apron and mitten \r\n', 'active', 'Kitchen.php', 'n5.jpg'),
('C4lIT4LyUouuOLF53Nq1', 'long sleeve bib', '35', 'n6.jpg', 'Colorful long sleeve bib\r\nEasy-care, waterproof polyester\r\nAdjustable snap button closure at the neck', 'active', 'Kitchen.php', 'n7.jpg'),
('f4e1TggXgbDQpYFDHwQt', 'napkin', '6', 'j.jpg', 'Lemon trees recycled polyester napkin\r\n46 x 46 cm', 'active', 'Kitchen.php', 'j1.jpg'),
('7u3OPc0EMvdkKNYMm09L', 'polyester napkins', '10', 'j2.jpg', 'Parsley green recycled polyester napkins\r\nSet of 2 , 48 x 48 cm', 'active', 'Kitchen.php', 'j3.jpg'),
('MjpbPsssn9BN2Gv9fKQh', ' leaf placemat', '14', 'kj.jpg', 'Green leaf placemat, 100% cotton', 'active', 'Kitchen.php', 'kj1.jpg'),
('k1hweXxyeKMlxhWa7jK2', 'tapestry placemats', '15', 'kk.jpg', 'Lemon basket tapestry placemats\r\nSet of 2, 33 x 48 cm', 'active', 'Kitchen.php', 'kkk.jpg'),
('RIbFg0XuujK5jali61Eg', 'dinner set', '400', 'y.jpg', 'Organic dinner set\r\n16-piece set, Handmade in Tunisia', 'active', 'Kitchen.php', 'y1.jpg'),
('WrpcicxPDtO629BWDUOZ', 'bowls Set ', '100', 'y2.jpg', 'Ewa stoneware tapas bowls\r\nSet of 4, Microwave and dishwasher safe\r\n', 'active', 'Kitchen.php', 'y3.jpg'),
('XOXwyXsqXb79ak0Wna0o', 'plates', '140', 'yy.jpg', 'Edan stoneware pasta/salad plates\r\nSet of 4, 20 x 4 cm', 'active', 'Kitchen.php', 'yy1.jpg'),
('cPgKUiRwaaZOMoPJrz1Z', 'cups', '88', 'yy2.jpg', 'Edan stoneware coffee and tea cups\r\nSet of 4,  (220 mL) cups\r\nHandmade in Tunisia', 'active', 'Kitchen.php', 'yy3.jpg'),
('Fcz8bohSiYELL6WXVeCL', 'glasses', '30', 'z.jpg', 'Embossed fruit highball glasses\r\nSet of 2', 'active', 'Kitchen.php', 'zz.jpg'),
('QswJvsW8mq14dX6u8EMb', 'cocktail glasses', '75', 'z1.jpg', 'Floral silhouette cocktail glasses\r\nSet of 2', 'active', 'Kitchen.php', 'z2.jpg'),
('tABxeFAGTgwhHkXoH1jg', 'glasses', '15', 'u.jpg', 'Hexagonal small glasses\r\nSet of 2, 7.5 x 10 cm', 'active', 'Kitchen.php', 'u1.jpg'),
('q4BQh3ASE7mVV57CiCUR', 'curve glasses', '15', 'uu.jpg', 'Small retro curve glasses\r\nSet of 2', 'active', 'Kitchen.php', 'uu1.jpg'),
('8JrpnwWLGIxEJY8hDQc6', 'soap pump', '20', 'e.jpg', 'Wildflowers soap pump, Silver pump with a shimmering finish\r\nLarge fill capacity', 'active', 'Toilet.php', 'e1.jpg'),
('k7lfpRoIHTlVWSPZicgi', ' cotton towels', '30', 'e2.jpg', 'Embroidered birds Turkish cotton towels, High-quality cotton grown in Turkey', 'active', 'Toilet.php', 'e3.jpg'),
('SU4QSEwb7keslvFRbUEZ', 'Beetle tray', '14', 'ee.jpg', 'Insects and natural landscapes are popular this season!\r\nPainted metal .. 18 x 18 cm', 'active', 'Toilet.php', 'ee1.jpg'),
('sWvDX7bjkfzwaGcL7Fhp', 'seagrass basket', '20', 'ee2.jpg', 'White accents small seagrass basket, Natural braided seagrass enhanced with white plastic ribbons', 'active', 'Toilet.php', 'ee3.jpg'),
('FVy0BPyTJdcQOPk6mChP', 'cosmetics organizer', '10', 'q.jpg', 'Concrete cosmetics organizer, Small compartment height: 2.25&#39;&#39; (6 cm)', 'active', 'Toilet.php', 'q1.jpg'),
('XVIyos8Q9Skh6uKweOOR', 'striped towels', '40', 'qq.jpg', 'Naram striped towels, Practical hanging loop on the trim\r\nHandmade in India', 'active', 'Toilet.php', 'qq1.jpg'),
('Jsc273yFpv6Kmb6TvMSJ', 'soap dish', '12', 'qqq.jpg', 'Shell soap dish, 14 x 13 cm - Porcelain with a lustrous finish\r\nHandwash only', 'active', 'Toilet.php', 'qqq1.jpg'),
('m76VbrGsoUIRSGeVCom3', 'laundry hamper', '60', 'xx.jpg', 'Bamboo laundry hamper, Removable and washable cover\r\n18&#34; x 12&#34; x 28&#34; (46 x 30 x 71 cm)\r\n', 'active', 'Toilet.php', 'xx1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
('29zoXcU06FPFd0PIQ02L', 'Hana', 'hanahusni@outlook.com', '123', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `price`) VALUES
('bVI8jWj8MTzzixHwkVel', '', 'zLvs1hLD1t1K7axN5U9p', '1000'),
('3ZkjWHOFAehSxQsa1csX', '', 'TS1L1CA53gcU5xsxS5tM', '3500'),
('dhsA8QNONE4aocPgv0DK', '', '1', '2000'),
('mtmGNVpKFmlBweXjG1IW', '', 'VYUqVYlUEV3nAYrlVWDN', '50'),
('hlNr2VVdVn5f1nBxh2a3', '', 'v8zdGWtO6kPUX0sZHOg2', '1000'),
('oEWi5QdLnHbvkBYSbQPd', '', 'HKZQd0UcbuyrNMeZiVvl', '400'),
('id1aGDHN2skquVO6WNNO', '', 'HfTVqeznsqMN7bnUfqiM', '350'),
('LFZa08VGLP2LNFOUSV0T', '', 'YXiRd5ZLLkv1hW1rDNHH', '1000'),
('WiEvRYdvUoakBzfELViv', '', 'yvVGxxSlJmVsm6wlP6xm', '350'),
('mc1P5Pb7Ed54Gly4TSIl', '', 'RQ5YkTfO05WF6fxYiIYP', '1000'),
('Jbof4f5Lu7jBsshOhq9y', '', 'AOpBxxrA6v9IveTkjcr5', '200'),
('wdAE6nLsFiUtRwCI8XFC', '', 'JgnU3DebwhQQpp48FmJX', '350'),
('P7k6oZVDOUNXsgsqvLl2', '', 'o5UnYCnhThEdgNWjolAW', '200'),
('h6N4PcztjAU5zNIOzxHy', '', 'plKrK5Bo8kZEhhFkL88F', '1000'),
('U3VSDqRXedw6kYmm2Sc0', '29zoXcU06FPFd0PIQ02L', '6VYBxJ1wrXprEWR1OEum', '4850'),
('foEZGW8GhWoDc5KtscYl', '29zoXcU06FPFd0PIQ02L', 'ZcFuBw2DIlBB0mme5pka', '35'),
('SLAX1R0kLFvuyhKKuuKL', '29zoXcU06FPFd0PIQ02L', 'XOXwyXsqXb79ak0Wna0o', '140'),
('kglaFpClSuUhWHRrUX3C', '29zoXcU06FPFd0PIQ02L', '9C6KS7S1Ux9FKGSll4XD', '3500'),
('PLsFkcB7MCd4biCOfW32', '29zoXcU06FPFd0PIQ02L', 'gDLuyMDFCHfGuuHDrPdq', '1000'),
('ztGJMV751DSkQ3v3EGTe', '29zoXcU06FPFd0PIQ02L', 'JgnU3DebwhQQpp48FmJX', '350');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
