-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2023 at 07:48 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(8, 'public/banner-image/2022-10-24-23-19-09.jpeg', 'http://localhost/OnlineNewsSite/', '2025-10-24 14:19:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(14, 'Công Nghệ', '2025-10-24 09:26:37', '2025-10-24 09:26:43'),
(15, 'Kinh Tế', '2025-10-24 09:36:05', NULL),
(16, 'Thể Thao', '2025-10-24 09:49:39', NULL),
(17, 'Khoa Học', '2025-10-24 10:00:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` enum('unseen','seen','approved') NOT NULL DEFAULT 'unseen',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 'Bài viết khá thú vị đó!', 15, 'approved', '2025-07-23 21:34:25', '2025-08-11 01:48:30'),
(16, 2, 'Nhìn không được đẹp lắm, hơi thất vọng một chút.', 10, 'approved', '2025-04-09 20:23:52', '2025-08-11 01:48:27'),
(20, 4, 'Vừa hào hứng mà cũng hơi căng thẳng nữa!', 22, 'approved', '2025-08-11 01:49:46', '2025-10-04 23:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(300) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `created_at`, `updated_at`) VALUES
(9, 'Được xem nhiều nhất', '#', NULL, '2025-07-17 12:05:11', '2025-10-24 11:33:11'),
(12, 'Về chúng tôi', 'http://localhost/OnlineNewsSite/', NULL, '2025-10-24 14:38:39', NULL),
(13, 'Trang chủ', 'http://localhost/OnlineNewsSite/', NULL, '2025-10-24 14:39:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` text NOT NULL,
  `body` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` enum('disable','enable') NOT NULL DEFAULT 'disable',
  `selected` tinyint(5) NOT NULL DEFAULT 1,
  `breaking_news` tinyint(5) NOT NULL DEFAULT 1,
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES
(10, 'TikTok thất bại trong việc ngăn chặn hầu hết quảng cáo chính trị sai lệch', 'YouTube và Facebook làm tốt hơn trong thử nghiệm.', 'TikTok đã không phát hiện 90% quảng cáo chứa thông tin sai lệch về bầu cử, trong khi YouTube và Facebook xác định và chặn được phần lớn các quảng cáo này, theo kết quả thử nghiệm được thực hiện bởi các nhà nghiên cứu về thông tin sai lệch.\r\n\r\nThử nghiệm do tổ chức Global Witness và nhóm Cybersecurity for Democracy thuộc Trường Kỹ thuật Tandon (ĐH New York) thực hiện, sử dụng các tài khoản giả để gửi 10 quảng cáo bằng tiếng Anh và 10 quảng cáo bằng tiếng Tây Ban Nha lên các nền tảng mạng xã hội. Các nhà nghiên cứu không khai báo rằng đây là quảng cáo chính trị và cũng không thực hiện xác minh danh tính. Họ đã xoá các quảng cáo được chấp nhận trước khi chúng được đăng.\r\n\r\nMỗi quảng cáo đều chứa thông tin sai lệch, như ngày bầu cử không chính xác hoặc thông tin gây hiểu lầm về quy trình bỏ phiếu – những nội dung vi phạm chính sách của Meta (Facebook), Google (YouTube) và TikTok.\r\n\r\nTikTok chỉ từ chối 1 quảng cáo tiếng Anh và 1 quảng cáo tiếng Tây Ban Nha – điều mà các nhà nghiên cứu gọi là “một thất bại lớn”. TikTok đã cấm quảng cáo chính trị từ năm 2019.', 149, 3, 14, 'public/post-image/2022-10-24-18-38-25.webp', 'disable', 1, 1, '2025-01-01 01:00:00', '2025-07-17 12:06:43', '2025-10-24 09:38:25'),

(11, 'Tesla báo cáo lợi nhuận mạnh trong quý 3 nhờ doanh số tăng vọt', 'Hãng xe điện tăng trưởng nhanh nhưng nhà đầu tư lo ngại doanh số có thể chậm lại vì giá cao và lãi suất tăng.', 'Tesla vừa báo cáo mức tăng lợi nhuận lớn trong quý, khi doanh số xe điện tăng mạnh trong ba tháng kết thúc vào tháng 9.\r\n\r\nHãng xe cho biết họ đạt lợi nhuận 3,3 tỷ USD trong quý 3, tăng từ 1,6 tỷ USD cùng kỳ năm trước. Doanh thu đạt 21,5 tỷ USD, tăng từ 13,8 tỷ USD.\r\n\r\nTesla cho biết đã sản xuất hơn 365.000 xe trong quý 3 (tăng 50% so với năm trước). Tuy nhiên, nhà đầu tư ngày càng lo rằng nhu cầu xe sang của hãng có thể suy yếu.\r\n\r\nTesla bán ít hơn khoảng 20.000 xe so với số lượng sản xuất, và thời gian chờ giao xe giảm xuống. Giá xe tăng cao cùng với lãi suất vay mua xe tăng mạnh khiến người mua khó tiếp cận hơn.\r\n\r\nLợi nhuận quý 3 của hãng thấp hơn kỳ vọng của Phố Wall, khiến cổ phiếu giảm 4% trong phiên giao dịch ngoài giờ.', 56, 1, 14, 'public/post-image/2023-06-12-19-45-55.jpeg', 'disable', 1, 1, '2025-01-01 00:00:00', '2025-07-17 12:07:21', '2025-06-12 23:15:55'),

(13, 'Tuần qua trong kinh doanh: Giá cả tiếp tục leo thang', 'Tuần qua trong kinh doanh: Giá cả tiếp tục leo thang', 'Số liệu lạm phát mới công bố hôm thứ Năm đã xoá tan hy vọng rằng Fed sẽ sớm nới lỏng kế hoạch tăng mạnh lãi suất. Chỉ số giá tiêu dùng tăng 8,2% so với cùng kỳ – giảm nhẹ so với tháng trước nhưng vẫn rất cao.\r\n\r\nLạm phát lõi (không tính thực phẩm và nhiên liệu) tăng lên 6,6%. Điều này cho thấy quá trình kiềm chế lạm phát sẽ diễn ra chậm và khó khăn.\r\n\r\nMột số lo ngại lạm phát kéo dài có thể dẫn đến vòng xoáy giá – lương, nơi giá tăng khiến lương tăng, và lương tăng lại đẩy giá lên.\r\n\r\nMột chút tin tốt cho người nghỉ hưu: Cơ quan An sinh Xã hội Mỹ đã thông báo mức tăng phúc lợi 8,7% – mức cao nhất trong hơn 40 năm – để bù lại lạm phát.', 35, 3, 15, 'public/post-image/2022-10-24-18-39-32.webp', 'disable', 1, 1, '2025-01-01 01:00:00', '2025-07-17 12:08:56', '2025-10-24 09:39:32'),

(15, 'Tay đua F1 không hề “một mình” trong buồng lái', 'Họ mang theo hàng loạt thiết bị bảo hộ để giữ an toàn — và tuyệt đối không được đeo trang sức.', 'Khi một tay đua F1 ngồi vào xe, họ mang theo rất nhiều thiết bị. Hầu hết đều bắt buộc bởi quy định của FIA, từ quần áo chống cháy đến cảm biến sinh học.\r\n\r\nQuần áo, găng tay, tất và giày đều phải chống cháy. “Tất nhiên là các tay đua muốn mặc thoải mái hơn, nhưng không thể,” James Clark từ Puma cho biết.\r\n\r\nĐồ bảo hộ phải che kín từ cổ đến mắt cá chân, có dây kéo để cứu hộ dễ dàng kéo ra ngoài. Một vấn đề lớn là trọng lượng: càng nhẹ càng tốt.\r\n\r\nDưới khí hậu ẩm như Singapore, tay đua có thể mang đến 5 bộ đồ cho cả tuần thi đấu.', 181, 3, 16, 'public/post-image/2022-10-24-18-50-58.webp', 'disable', 2, 2, '2025-01-01 01:00:00', '2025-07-17 12:10:04', '2025-10-24 09:50:58'),

(21, 'Buồn hơn nhưng có khôn ngoan hơn? Có thể không', 'Buồn hơn nhưng có khôn ngoan hơn? Có thể không.', '43 năm trước, hai nhà tâm lý Lauren B. Alloy và Lyn Y. Abramson đã thực hiện một thí nghiệm đơn giản, dẫn tới một ý tưởng mang tính đột phá trong tâm lý học: người trầm cảm có xu hướng đánh giá thấp khả năng kiểm soát thế giới xung quanh họ.', 19, 3, 17, 'public/post-image/2022-10-24-19-01-31.webp', 'disable', 2, 1, '2025-01-01 01:00:00', '2025-06-19 22:37:10', '2025-10-24 16:32:51'),

(22, 'Đua xe F1 thường được quyết định bằng… lốp xe', 'Việc chọn đúng loại lốp — mềm, trung bình hoặc cứng — có thể biến kẻ thua thành người thắng.', 'Các đội F1 bỏ ra hàng triệu USD để phát triển xe, nhưng đôi khi chính chiến lược về lốp mới là yếu tố quyết định.\r\n\r\n“Từ trước sự kiện, chúng tôi chạy khoảng 100.000 mô phỏng với nhiều chiến lược khác nhau,” Bernadette Collins, cựu trưởng bộ phận chiến lược Aston Martin cho biết.\r\n\r\nTrong thực tế, các đội sẽ phân tích điều kiện đường đua, thời tiết và cả đối thủ để đưa ra lựa chọn tối ưu nhất.', 65, 3, 16, 'public/post-image/2022-10-24-19-27-44.webp', 'disable', 2, 1, '2025-01-01 01:00:00', '2025-06-19 22:37:55', '2025-10-24 10:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `permission` enum('user','admin') NOT NULL DEFAULT 'user',
  `verify_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(5) NOT NULL DEFAULT 0,
  `forgot_token` varchar(191) DEFAULT NULL,
  `forgot_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permission`, `verify_token`, `is_active`, `forgot_token`, `forgot_token_expire`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'onlinenewssite@admin.com', '$2y$10$IN3YIlgIvxiHxdBvNVz/GOm72x2h5aBvV9J2QmsVhLLwkvooKBhbm', 'admin', 'cf408fb6caedd3c8308a21254b1a3cb4a5c8757f7740354104af7b43dfe7bff6', 1, NULL, NULL, '2025-11-12 16:17:46', '2025-11-12 16:31:15'),
(2, 'trinh', 'trinh123@yahoo.com', '$2y$10$Ns6zdyPb/guRQZNVf7aKFOuT7uPZnPD2O1csarFiOK9Bsw1vd7q5i', 'user', NULL, 1, NULL, NULL, '2025-11-23 23:35:51', '2025-11-05 02:10:50'),
(3, 'tam', 'tam123@gmail.com', '$2y$10$ZWCn.pbDtnn9kIQsHNIpFujvBgePQUa0z8WOdWAxI8C.ZpeyhS5Be', 'user', NULL, 0, NULL, NULL, '2025-11-06 01:28:40', '2025-11-12 16:13:53'),
(4, 'tuyen', 'tuyen123@yahoo.com', '$2y$10$y2UFfO2zw08k4urIOccC6eaN4.fxYfFUZhWHeLYYYowFxU9wpEeo2', 'user', NULL, 1, NULL, NULL, '2025-11-27 21:56:13', '2025-11-27 22:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `websetting`
--

CREATE TABLE `websetting` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_persian_ci;

--
-- Dumping data for table `websetting`
--

INSERT INTO `websetting` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Tin tức trực tuyến', 'Tran tin tức trực tuyến', 'Tin tức, online, báo chí', 'public/setting/logo.png', 'public/setting/icon.jpeg', '2025-11-09 19:54:37', '2025-11-24 16:41:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `websetting`
--
ALTER TABLE `websetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `websetting`
--
ALTER TABLE `websetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
