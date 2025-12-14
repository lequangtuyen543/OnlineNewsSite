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
(12, 'Về chúng tôi', 'https://www.facebook.com/husc.edu.vn', NULL, '2025-10-24 14:38:39', NULL),
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

INSERT INTO `posts`
(`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES

(10,
'Năm 2025: Việt Nam đẩy mạnh chuyển đổi số trong quản lý hành chính',
'Chuyển đổi số tiếp tục là ưu tiên hàng đầu của Việt Nam trong năm 2025.',
'Bước sang năm 2025, Việt Nam tiếp tục đẩy mạnh chương trình chuyển đổi số quốc gia nhằm nâng cao hiệu quả quản lý nhà nước và chất lượng dịch vụ công.\r\n\r\nNhiều địa phương đã mở rộng cung cấp dịch vụ công trực tuyến mức độ cao, cho phép người dân thực hiện thủ tục hành chính hoàn toàn trên môi trường số.\r\n\r\nTheo các chuyên gia, chuyển đổi số không chỉ giúp tiết kiệm chi phí mà còn góp phần tăng tính minh bạch và cải thiện trải nghiệm của người dân.',
149, 3, 14, 'public/post-image/2025-vn-digital.webp', 'enable', 1, 1,
'2025-01-15 08:00:00', '2025-01-15 08:00:00', '2025-01-15 08:00:00'),

(11,
'Kinh tế Việt Nam năm 2025: Doanh nghiệp thận trọng trước biến động toàn cầu',
'Nhiều doanh nghiệp Việt Nam điều chỉnh chiến lược để thích ứng với thị trường.',
'Trong bối cảnh kinh tế thế giới còn nhiều biến động, kinh tế Việt Nam năm 2025 được dự báo tăng trưởng ổn định nhưng đối mặt không ít thách thức.\r\n\r\nDoanh nghiệp trong nước đang tập trung kiểm soát chi phí, mở rộng thị trường xuất khẩu và ứng dụng công nghệ để nâng cao năng lực cạnh tranh.\r\n\r\nCác chuyên gia cho rằng chính sách hỗ trợ doanh nghiệp và ổn định kinh tế vĩ mô sẽ đóng vai trò quan trọng trong năm nay.',
56, 1, 15, 'public/post-image/2025-vn-economy.webp', 'enable', 1, 1,
'2025-02-10 09:00:00', '2025-02-10 09:00:00', '2025-02-10 09:00:00'),

(13,
'Giá cả sinh hoạt tại Việt Nam năm 2025 tiếp tục là mối quan tâm lớn',
'Người dân ưu tiên chi tiêu hợp lý trong bối cảnh giá cả biến động.',
'Số liệu thống kê đầu năm 2025 cho thấy giá nhiều mặt hàng thiết yếu tại Việt Nam vẫn ở mức cao, đặc biệt là thực phẩm và chi phí sinh hoạt tại các đô thị lớn.\r\n\r\nCác cơ quan chức năng cho biết đang theo dõi sát diễn biến thị trường và triển khai các biện pháp bình ổn giá.\r\n\r\nNgười tiêu dùng được khuyến nghị lập kế hoạch chi tiêu phù hợp để giảm áp lực tài chính.',
35, 3, 15, 'public/post-image/2025-vn-price.webp', 'enable', 1, 1,
'2025-03-05 07:30:00', '2025-03-05 07:30:00', '2025-03-05 07:30:00'),

(15,
'Thể thao Việt Nam năm 2025 hướng tới các giải đấu khu vực và quốc tế',
'Các đội tuyển Việt Nam tích cực chuẩn bị cho lịch thi đấu năm 2025.',
'Năm 2025, thể thao Việt Nam tập trung chuẩn bị lực lượng cho các giải đấu quan trọng trong khu vực và quốc tế.\r\n\r\nNhiều vận động viên trẻ được tạo điều kiện cọ xát, tích lũy kinh nghiệm thi đấu nhằm nâng cao thành tích.\r\n\r\nNgành thể thao đặt mục tiêu cải thiện thành tích, đồng thời thúc đẩy phong trào rèn luyện thể chất trong cộng đồng.',
181, 3, 16, 'public/post-image/2025-vn-sport.webp', 'enable', 2, 2,
'2025-04-20 10:00:00', '2025-04-20 10:00:00', '2025-04-20 10:00:00'),

(21,
'Giáo dục Việt Nam năm 2025 chú trọng kỹ năng số và đổi mới chương trình',
'Ngành giáo dục đẩy mạnh đào tạo kỹ năng phù hợp với thời đại số.',
'Năm 2025, giáo dục Việt Nam tiếp tục đổi mới chương trình giảng dạy theo hướng tăng cường kỹ năng số và tư duy sáng tạo cho học sinh, sinh viên.\r\n\r\nNhiều trường học áp dụng mô hình học tập kết hợp giữa trực tiếp và trực tuyến.\r\n\r\nCác chuyên gia cho rằng việc đổi mới giáo dục là nền tảng quan trọng cho phát triển nguồn nhân lực chất lượng cao.',
19, 3, 17, 'public/post-image/2025-vn-education.webp', 'enable', 2, 1,
'2025-05-10 08:30:00', '2025-05-10 08:30:00', '2025-05-10 08:30:00'),

(22,
'Doannh thu ngành du lịch Việt Nam năm 2025 phục hồi mạnh mẽ',
'Ngành du lịch ghi nhận nhiều tín hiệu tích cực trong năm 2025.',
'Năm 2025, du lịch Việt Nam tiếp tục phục hồi mạnh mẽ với lượng khách quốc tế và nội địa tăng so với các năm trước.\r\n\r\nNhiều địa phương tập trung phát triển sản phẩm du lịch xanh, bền vững và trải nghiệm văn hóa.\r\n\r\nNgành du lịch kỳ vọng sẽ đóng góp tích cực vào tăng trưởng kinh tế và tạo thêm nhiều việc làm.',
65, 3, 15, 'public/post-image/2025-vn-tourism.webp', 'enable', 2, 1,
'2025-06-05 09:00:00', '2025-06-05 09:00:00', '2025-06-05 09:00:00');

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
(1, 'admin', 'onlinenewssite@admin.com', '$2y$10$IN3YIlgIvxiHxdBvNVz/GOm72x2h5aBvV9J2QmsVhLLwkvooKBhbm', 'admin', 'cf408fb6caedd3c8308a21254b1a3cb4a5c8757f7740354104af7b43dfe7bff6', 1, NULL, NULL, '2025-11-30 16:17:46', '2025-11-30 16:31:15'),
(2, 'trinh', 'trinh@gmail.com', '$2y$10$Ns6zdyPb/guRQZNVf7aKFOuT7uPZnPD2O1csarFiOK9Bsw1vd7q5i', 'user', NULL, 1, NULL, NULL, '2025-11-23 23:35:51', '2025-11-05 02:10:50'),
(3, 'tam', 'tam@gmail.com', '$2y$10$ZWCn.pbDtnn9kIQsHNIpFujvBgePQUa0z8WOdWAxI8C.ZpeyhS5Be', 'user', NULL, 0, NULL, NULL, '2025-11-06 01:28:40', '2025-11-12 16:13:53'),
(4, 'tuyen', 'tuyen@gmail.com', '$2y$10$IN3YIlgIvxiHxdBvNVz/GOm72x2h5aBvV9J2QmsVhLLwkvooKBhbm', 'admin', NULL, 1, NULL, NULL, '2025-11-01 21:56:13', '2025-11-01 22:18:23');

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

INSERT INTO `posts` 
(`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) 
VALUES
-- 1. AI chạy cục bộ trên điện thoại
(30,
'Cuộc đua AI chạy cục bộ trên smartphone đang nóng hơn bao giờ hết',
'Các hãng smartphone đang cạnh tranh phát triển khả năng chạy mô hình AI trực tiếp trên thiết bị.',
'Từ cuối năm 2024, xu hướng AI on-device bùng nổ mạnh mẽ khi hàng loạt hãng công bố điện thoại có khả năng chạy mô hình AI lớn trực tiếp trên máy.\r\n\r\nQualcomm, Apple và Samsung đều đã tích hợp NPU (Neural Processing Unit) thế hệ mới, cho phép xử lý mô hình hàng tỷ tham số mà không cần gửi dữ liệu lên đám mây.\r\n\r\nViệc xử lý AI cục bộ giúp tốc độ phản hồi nhanh hơn, bảo mật dữ liệu tốt hơn và tiết kiệm chi phí vận hành cho các công ty.\r\n\r\nDự kiến trong năm 2026, hơn 60% ứng dụng AI phổ biến sẽ có chế độ chạy cục bộ.',
0, 1, 14, 'public/post-image/2025-01-05-11-00-00.webp', 'enable', 1, 1,
'2025-01-05 11:00:00', '2025-12-07 16:30:00', NULL),

-- 2. Apple Vision Pro gen 2
(31,
'Apple chuẩn bị ra mắt Vision Pro thế hệ 2 với trọng lượng nhẹ hơn 25%',
'Thiết kế nhẹ hơn và pin gắn sau đầu giúp tăng thời gian sử dụng.',
'Theo nhiều nguồn tin rò rỉ, Apple đang hoàn tất giai đoạn phát triển Vision Pro thế hệ 2 với hai cải tiến lớn: trọng lượng nhẹ hơn 25% và pin có thể gắn phía sau đầu như hệ VR chuyên nghiệp.\r\n\r\nThiết bị mới dự kiến tập trung nhiều vào AI và khả năng hội thoại thực tế ảo, đồng thời tối ưu cho công việc và giải trí.\r\n\r\nNgoài ra, Apple có thể tung ra phiên bản “Vision Air” với giá dễ tiếp cận hơn nhằm mở rộng thị trường.',
0, 1, 14, 'public/post-image/2025-01-06-08-20-00.webp', 'enable', 1, 1,
'2025-01-06 08:20:00', '2025-12-07 16:31:00', NULL),

-- 3. Google ra mắt Gemini 2.0
(32,
'Google ra mắt Gemini 2.0: nhanh hơn, rẻ hơn và hỗ trợ lập trình mạnh mẽ',
'Gemini 2.0 được tối ưu cho phát triển ứng dụng, lập trình và tích hợp sâu vào Android.',
'Google đã chính thức công bố Gemini 2.0 với khả năng suy luận nhanh hơn 40% ở các tác vụ lập trình và phân tích dữ liệu.\r\n\r\nGemini 2.0 còn hỗ trợ lập trình thời gian thực, phân tích code lỗi, tạo test và mô phỏng API. Điều này biến nó trở thành công cụ mạnh mẽ dành cho lập trình viên.\r\n\r\nGoogle cũng giới thiệu Gemini Nano 2 chạy trực tiếp trên Android, giúp nhiều tác vụ AI hoạt động mà không cần internet.',
0, 1, 14, 'public/post-image/2025-01-07-09-00-00.webp', 'enable', 1, 1,
'2025-01-07 09:00:00', '2025-12-07 16:32:00', NULL),

-- 4. Xe điện và pin thể rắn 2025
(33,
'Các hãng xe điện tăng tốc chuyển sang pin thể rắn vào cuối năm 2025',
'Công nghệ pin thể rắn hứa hẹn tăng gấp đôi phạm vi di chuyển và giảm nguy cơ cháy nổ.',
'Nhiều hãng xe điện lớn như Toyota, BMW và Hyundai đã xác nhận sẽ thử nghiệm xe sử dụng pin thể rắn vào cuối năm 2025.\r\n\r\nPin thể rắn có mật độ năng lượng cao hơn 70% và mức độ an toàn vượt trội so với pin lithium-ion hiện nay.\r\n\r\nNếu thương mại hóa thành công, giá xe điện có thể giảm mạnh nhờ chi phí sản xuất thấp hơn và tuổi thọ pin cao hơn.',
0, 1, 14, 'public/post-image/2025-01-08-10-00-00.webp', 'enable', 1, 1,
'2025-01-08 10:00:00', '2025-12-07 16:33:00', NULL),

-- 5. Cybersecurity 2025
(34,
'Tấn công mạng tăng 180% trong năm 2025: doanh nghiệp nhỏ là mục tiêu dễ bị tổn thương nhất',
'Nhiều cuộc tấn công lợi dụng AI để tự động hóa việc dò tìm lỗ hổng.',
'Báo cáo mới nhất từ các công ty an ninh mạng ghi nhận số vụ tấn công ransomware và lừa đảo trực tuyến tăng 180% so với năm trước.\r\n\r\nĐiểm đáng lo ngại là 65% vụ tấn công nhắm vào doanh nghiệp nhỏ – nhóm vốn ít đầu tư vào bảo mật.\r\n\r\nHacker đang sử dụng công cụ AI để quét lỗ hổng nhanh hơn, viết mã độc tự động và tạo email lừa đảo gần như không thể phân biệt.\r\n\r\nChuyên gia khuyến cáo các doanh nghiệp cần cập nhật hệ thống, kích hoạt xác thực đa lớp và đào tạo nhận diện rủi ro cho nhân viên.',
0, 1, 14, 'public/post-image/2025-01-09-13-00-00.webp', 'enable', 1, 1,
'2025-01-09 13:00:00', '2025-12-07 16:34:00', NULL);

