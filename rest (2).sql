-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 02, 2019 lúc 06:22 PM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `rest`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Mỹ phẩm'),
(2, 'Trang Sức'),
(3, 'Phụ kiện'),
(4, 'Nước hoa'),
(5, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `status`, `user_id`, `total`, `time`, `name`, `phone`, `address`, `email`) VALUES
(56, '0', 0, 2250000, '2019-04-22 07:40:43', NULL, NULL, NULL, NULL),
(57, '0', 0, 2250000, '2019-04-22 08:36:39', NULL, NULL, NULL, NULL),
(58, '0', 0, 70000, '2019-05-01 13:58:59', NULL, NULL, NULL, NULL),
(59, '0', 0, 450000, '2019-05-02 19:09:11', NULL, NULL, NULL, NULL),
(60, '0', 0, 45000, '2019-05-02 19:11:59', NULL, NULL, NULL, NULL),
(61, '0', 0, 135000, '2019-05-02 20:02:09', NULL, NULL, NULL, NULL),
(62, '0', 0, 1125000, '2019-05-02 20:09:37', NULL, NULL, NULL, NULL),
(63, '0', 0, 135000, '2019-05-02 20:11:27', 'Sao Mai', '01414151251', 'Đà Nẵng', 'saomai23@gmail.com'),
(64, '0', 0, 1125000, '2019-05-02 20:37:29', 'Sao Mai', '01214141411', 'Núi Thành, Đà Nẵng', 'saomai@gmail.com'),
(65, '0', 0, 90000, '2019-05-02 23:12:29', 'Đoàn Văn Danh', '0121551125125', 'Đà Nẵng,Việt Nam', 'danhmai2@gmail.com'),
(66, '0', 0, 90000, '2019-05-02 23:14:17', 'Sao Mai', '01414115151251', 'Núi Thành, Đà Nẵng', 'saomai@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`order_id`, `product_id`, `size`, `color`, `number`) VALUES
(56, 10, '', '', 5),
(57, 9, '', '', 2),
(57, 8, '', '', 2),
(57, 10, '', '', 1),
(58, 13, '', '', 5),
(59, 8, '', '', 1),
(60, 14, '', '', 1),
(61, 14, '', '', 3),
(62, 14, '', '', 5),
(62, 2, '', '', 2),
(63, 14, '', '', 3),
(64, 14, '', '', 5),
(64, 10, '', '', 2),
(65, 14, '', '', 2),
(66, 14, '', '', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `new_price` decimal(10,0) NOT NULL,
  `old_price` decimal(10,0) NOT NULL DEFAULT '10000',
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/img/product/Product copy 9.png',
  `category_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Red Pink Yellow',
  `size` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '12 13 14 15',
  `more` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `content`, `new_price`, `old_price`, `img`, `category_id`, `created`, `modified`, `color`, `size`, `more`) VALUES
(1, 'RALPH LAUREN WOMAN EAU DE PARFUM', 'Người phụ nữ của Ralph Lauren không chỉ thanh lịch, sang trọng mà còn lôi cuốn và bản lĩnh. Ralph Lauren Woman tạo dấu ấn bởi thiết kế đẹp tựa tranh vẽ. Một trong những thành phần nổi bật này là hương hoa huệ gợi cảm. Bên cạnh đó, mùi gỗ đàn hương ngọt ngào kết hợp với quả lê tạo nên hương thơm huyền ảo. Thiết kế chai kiểu nắp bật tiện dụng gợi nhớ đến chai rượu bên túi.', '350000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-02.jpg', 2, '2014-06-01 01:12:26', '2014-05-31 10:12:26', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(2, 'GUCCI BLOOM NETTARE DI FIORI EAU', 'Năm 2018, Gucci ra mắt dòng nước hoa lấy cảm hứng từ sự mạnh mẽ bên trong mỗi người phụ nữ. So với phiên bản trước đây, Nettare Di Fiori mang nét trẻ trung và nữ tính hơn. Lớp hương đầu là sự nhẹ nhàng của hoa hồng và chút cay nồng của gừng. Ở lớp hương tiếp theo, hoa huệ trắng, nhài sambac và kim ngân hòa quyện thanh tao. Điểm nhấn là mùi cỏ thơm Ấn độ kết hợp với xạ hương và hoa mộc ở lớp hương cuối. Mọi thứ đều nhẹ nhàng, nồng ấm tựa như bản tình ca dịu êm, sâu lắng.', '450000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-04-1024x1024.jpg', 2, '2014-06-01 01:12:26', '2014-05-31 10:12:26', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(6, 'JO MALONE LONDON HONEYSUCKLE AND DAVANA COLOGNE', 'Honeysuckle là hoa kim ngân – một loại dây leo uốn lượn ở xứ Anh yên bình. Cái tên dường như đã bao hàm tất cả những tinh túy trong dòng nước hoa này. Jo Malone London Honeysuckle and Davana Cologne mang hương thơm tươi mát ngọt lành. Phảng phất đâu đó là mùi tươi non của cỏ cây xen lẫn hương hoa hồng gợi cảm. Chai nước hoa từ Jo Malone London là sự pha trộn giữa những nốt hương từ rêu. Tất cả hòa quyện tạo nên mùi hương vừa cổ điển lại ấm áp.', '450000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-06.jpg', 1, '2014-06-01 01:12:26', '2014-05-30 19:12:21', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(7, 'ESTÉE LAUDER BEAUTIFUL BELLE EAU DE PARFUM', 'Lấy cảm hứng từ ngày cưới – cột mốc đặc biệt trong đời người phụ nữ, Madame Lauder đã tạo nên hương thơm Beautiful đầy gợi cảm. Estée Lauder Beautiful Belle mang đến cảm giác tinh tế, lôi cuốn ngay khi vừa ngửi vào. Lớp hương đầu tràn ngập mùi vị chua ngọt của trái cây và thảo mộc như nhựa galbanum, cam bergamot, chanh và mâm xôi đen. Hỗn hợp nền gồm hoa nhài, hoa huệ, hoàng lan, hoa cam và linh lan làm tăng thêm độ bay bổng. Kế tiếp, hương thơm của hoa hồng, hoa violet hòa quyện với dâu tây và gỗ tuyết tùng. Estée Lauder Beautiful Belle là gợi ý thú vị cho những ai muốn mang chút ngọt ngào đến bên mình.', '450000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-07-1024x974.jpg', 2, '2014-06-01 01:13:45', '2014-05-30 19:13:39', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(8, 'NARCISO ROUGE NARCISO RODRIGUEZ', 'Chẳng có người phụ nữ nào lại không đam mê một mùi hương nước hoa. Nét mềm mại, nữ tính của nàng tựa như thứ vũ khí tối mật. Tuy êm dịu nhưng hương thơm ấy lại chiêu dụ đối phương cuốn vào vòng đam mê bất tận. Chai nước hoa nữ từ Narciso như câu chuyện tình lãng mạn đầy thơ mộng qua nốt xạ hương huyền bí. Mùi hương này hòa quyện cùng hợp hương đỏ rực nồng nàn của hồng Bulgari và diên vĩ. Tất cả để lại những lưu luyến mãi không rời với dấu ấn nồng ấm của gỗ tuyết tùnglet.', '450000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-08-1024x1024.jpg', 2, '2014-06-01 01:14:13', '2014-05-30 19:14:08', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(9, 'GOOD GIRL VELVET FATALE CAROLINA HERRERA', 'Ngay từ cái nhìn đầu tiên, Velvet Fatale Carolina Herrera đã tạo dấu ấn với thiết kế đẹp tựa tác phẩm nghệ thuật. Hương nước hoa nữ từ Good Girl được bao bọc trong lớp nhung đỏ huyền bí. Thiết kế thân chai tựa như chiếc giày gót nhọn quen thuộc của phái nữ. Hình dáng đặc biệt này làm toát lên nét đẹp nữ tính đầy kiêu hãnh. Phiên bản nước hoa đặc biệt giải phóng những hấp dẫn tiềm ẩn của người phụ nữ. Hương thơm vừa dịu dàng, vừa khiêu khích là sự hòa quyện giữa hoa huệ, hoa nhài, hoa cam và hồng Bulgari. Bên cạnh đó, vị chanh, hạnh nhân và cà phê tươi tắn sẽ đánh thức mọi giác quan trong bạn. Ẩn mình sâu trong đó là sự mê đắm, ngọt lịm của cacao, vani, đàn hương, quế và đậu Tonka.', '450000', '350000', 'https://www.elle.vn/wp-content/uploads/2019/01/16/nuoc-hoa-nu-11.gif', 1, '2014-06-01 01:18:36', '2014-05-30 19:18:31', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(10, 'Dior Lip Glow', 'Các nàng có biết không, son dưỡng Dior Lip Glow còn có tính năng “làm tươi màu môi và tươi màu son môi” – nghe thật “vi diệu” đúng không? Bạn này được trang bị công nghệ phản ứng với độ pH tự nhiên của môi giải phóng chất làm sáng và căng mọng môi chị em chúng mình, cảm giác như được cấp nước và hồi sinh từ bên trong vậy.', '450000', '350000', 'https://agiare.vn/wp-content/uploads/2018/01/Dior%E2%80%99s-Lip-Glow.jpg', 2, '2014-06-06 17:10:01', '2014-06-05 11:09:51', 'Red Pink Yellow', '100ml 200ml 300ml', ' <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 88.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 87.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>\r\n                <div class=\"item\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                    <img class=\"description-body__img\" src=\"../img/detail/Layer 85 copy.jpg\"></div>\r\n                <div class=\"item\"><img class=\"description-body__img\" src=\"../img/detail/Layer 86.jpg\">\r\n                    <div><p class=\"description-body__title\"><span>THE MARK</span>OF A LEGEND</p>\r\n                        <p class=\"description-body__text\">Tự hào được ghi là năm mà Tiffany &amp; Co là thành lập, bộ sưu\r\n                            tập mang tính biểu tượng này cung cấp cho một cái gật đầu với qua trong khi thể hiện một cảm\r\n                            giác hiện đại với kiểu dáng đẹp đường cong và đường nét mượt mà.</p></div>\r\n                </div>'),
(14, 'nước hoa a-b-c', 'demo of product\nabc', '45000', '50000', '/img/product/Product copy 9.png', 1, '2019-04-30 23:20:58', '2019-04-30 16:20:58', 'Đỏ Vàng', '12000ml', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `token`, `role`) VALUES
(1, 'Nguyễn kiều Sao Mai', 'nguyenkieusaomai@gmail.com', '123456', '012345234', '24 Lý Thái Tổ, Thạch Thang, Đà Nẵng', NULL, 0),
(2, 'Trần Văn Hưng', 'tranvanhung@gmail.com', '123456', '090345234', '1006 Phạm Văn Đồng, Núi Thành, Quảng Nam', NULL, 0),
(3, 'Huỳnh Thị Diễm Ý', 'huynhthidiemy@gmail.com', '123456', '012145274', '23A Tây Hồ, Hà Nội', NULL, 0),
(4, 'Đoàn Văn Danh', 'doanvandanh@gmail.com', '123456', '098645234', '295 Nguyễn Thị Minh Khai, quận 1, TP.HCM', NULL, 0),
(5, 'Phan Như Nguyệt', 'phannhunguyet@gmail.com', '123456', '012256478', '111 Núi Thành, Vũng Tàu', NULL, 0),
(6, 'Hoàng Nhật Linh', 'hoangnhatlinh@gmail.com', '123456', '036425124', '257 Nguyễn Văn Linh, Hải Châu, Đà Nẵng', NULL, 0),
(7, 'sao mai', 'nguyenkieusaomai2@gmail.com', '123456', '0112414124', 'Núi Thành,Đà Nẵng', NULL, 0),
(8, 'sao mai', 'nguyenkieusaomai3@gmail.com', '123456', '0112414124', 'Núi Thành,Đà Nẵng', NULL, 0),
(9, 'Đoàn Văn Danh', 'danhmai@gmail.com', '123456', '014141141412', 'Đà Nẵng', NULL, 0),
(10, 'Đoàn Văn Danh', 'danhmai2@gmail.com', '123456', '0121551125125', 'Đà Nẵng,Việt Nam', NULL, 0),
(11, 'Đoàn Văn Danh', 'bamboo2017002@gmail.com', '123', '01144141', 'Đà nẵng', NULL, 0),
(12, 'admin', 'admin@gmail.com', '12345', '014141251251', 'Đà Nẵng', NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
