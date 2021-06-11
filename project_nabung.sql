-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2021 at 09:56 PM
-- Server version: 10.5.9-MariaDB-1
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_nabung`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `income` double(16,2) NOT NULL DEFAULT 0.00,
  `expense` double(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `sub_category_id`, `income`, `expense`, `created_at`, `updated_at`) VALUES
(3, 6, 0.00, 1000.00, '2021-05-09 13:05:33', '2021-05-09 13:05:33'),
(4, 6, 0.00, 6000.00, '2021-05-09 13:05:40', '2021-05-09 13:05:40'),
(5, 7, 31231.00, 2212312.00, '2021-05-12 23:55:28', '2021-05-12 23:55:28'),
(6, 7, 0.00, 0.00, '2021-05-12 23:56:19', '2021-05-12 23:56:19'),
(8, 13, 10000.00, 2000.00, '2021-06-10 06:20:30', '2021-06-10 06:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `category_materi_pembelajarans`
--

CREATE TABLE `category_materi_pembelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_materi_pembelajarans`
--

INSERT INTO `category_materi_pembelajarans` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'All Topics', NULL, NULL),
(2, 'Financial Planning', NULL, NULL),
(3, 'Budgeting', NULL, NULL),
(4, 'Saving', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_budgets`
--

CREATE TABLE `master_budgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_budget` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_budgets`
--

INSERT INTO `master_budgets` (`id`, `name_budget`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'lolo', 1, '2021-05-07 18:45:43', '2021-05-07 18:45:43'),
(2, 'beli rudal', 2, '2021-05-09 11:34:49', '2021-05-09 11:34:49'),
(3, 'pop', 2, '2021-05-09 12:55:40', '2021-05-09 12:55:40'),
(4, 'iya', 3, '2021-05-12 23:55:06', '2021-05-12 23:55:06'),
(5, 'coba', 8, '2021-06-11 02:51:19', '2021-06-11 02:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `master_categories`
--

CREATE TABLE `master_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `budget_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_categories`
--

INSERT INTO `master_categories` (`id`, `budget_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'lolo', '2021-05-07 18:45:52', '2021-05-07 18:45:52'),
(2, 2, 'beli', '2021-05-09 11:34:55', '2021-05-09 11:34:55'),
(3, 2, 'mau rudal', '2021-05-09 12:46:43', '2021-05-09 12:46:43'),
(4, 3, 'loh', '2021-05-09 12:55:47', '2021-05-09 12:55:47'),
(5, 4, 'iya', '2021-05-12 23:55:14', '2021-05-12 23:55:14'),
(6, 2, 'mantap', '2021-06-10 06:15:55', '2021-06-10 06:15:55'),
(7, 5, 'hi', '2021-06-11 02:53:25', '2021-06-11 02:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `materi_pembelajarans`
--

CREATE TABLE `materi_pembelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_pembelajaran_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materi_pembelajarans`
--

INSERT INTO `materi_pembelajarans` (`id`, `title`, `body`, `images_url`, `category_pembelajaran_id`, `created_at`, `updated_at`) VALUES
(3, 'Coba Praktekkan Ini Supaya Hidup Lebih Baik', '<p>Seringkali penyebab utama dari berbagai masalah hidup manusia adalah uang, seakan kalo kita punya uang banyak masalah hidup kita akan hilang. Tapi ternyata nggak gitu loh.. Seberapapun uang yang kamu miliki, kalau kamu nggak bisa mengelola uang dengan benar, seterusnya kamu bakalan dihadapi dengan masalah yang sama. Satu keputusan kecil yang kamu ambil di hidup ini berdampak loh untuk hal-hal lainnya yang mungkin baru terasa dikemudian hari.&nbsp;<br><br>Apa aja sih keputusan finansial yang bisa merubah hidup jadi lebih baik? Tapi sebelum mimin kasih tau, kamu juga harus punya kemauan yang besar dari dalam diri sendiri yah karena melek finansial aja ngga cukup.<br><br><span class=\"font-bold capitalize md:text-lg text-base\">1. Spending less than you earn</span><br>Sering danger quotes “The more we earn, the more we spend” ? Salah satu cara agar kamu bisa bebas secara finansial adalah konsisten dengan pengeluaran yang lebih rendah dari pendapatan. Seringkali kita mengandalkan nominal pendapatan, merasa bisa afford hal - hal yang kita inginkan karena pendapatan yang dimiliki jumlahnya besar. Jadi, belanjakan uangmu untuk hal-hal yang penting dan membawa kebahagiaan yah, bukan untuk membuat orang lain terkesan atau karena lagi nge-trend. Nggak ada ruginya untuk menunda kesenangan sementara, supaya kelak bisa memperbaiki kualitas hidup atau mencapai financial goals kamu.&nbsp;<br><br><span class=\"font-bold capitalize md:text-lg text-base\">2. Side hustle</span><br>Kalau selama ini kamu merasa pendapatan kamu pas-pasan buat hidup, kamu bisa cari penghasilan tambahan entah dari pekerjaan sampingan seperti menjadi freelancer, atau reseller maupun mempunyai passive income dari investasi. Segala usaha yang kamu lakukan pasti akan terbayar suatu hari nanti.&nbsp;<br><br><span class=\"font-bold capitalize md:text-lg text-base\">3. Mulai budgeting</span><br>Kenapa sih budgeting ini penting banget? Emang kenapa kalau nggak di-budget, toh selama ini keuanganku fine fine aja. Nah dengan budgeting kamu bisa track dan analyze keuangan kamu supaya nggak ada lagi uang yang terbuang sia-sia malah uangmu teralokasikan sesuai dengan kebutuhanmu. Siapa sih yang nggak mau kondisi keuangannya membaik? Siapa tau salah satu goals kamu bisa tercapai lebih cepat kalau kamu mau belajar mengelola uangmu. Mimin tau nggak semua suka ngeliat angka di spreadsheet, tapi mimin mau kasih tau disini kalian juga bisa nyatet keuangan sambil belajar loh. Yuk mulai manfaatin fasilitas yang berguna ini mumpung masih free alias gak bayar!&nbsp;<br><br>Kuncinya kalian harus konsisten ya, karena kekayaan cuman tertarik sama orang sabar. So, jangan takut buat ambil resiko apalagi demi kehidupan yang lebih baik mendatang!<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\r\n<br>\r\n<p>\r\nSumber: <a class=\"text-blue-500\" href=\"https://benlefort.com/\">benlefort.com</a>\r\n</p>', '1623166872artikel1.png', 2, '2021-06-08 08:41:12', '2021-06-08 08:41:12'),
(7, 'Kemana Uangmu Pergi?', '<p>Salah satu cara agar kita lebih jago dalam mengelola keuangan adalah dengan melacak pengeluaran. Hal ini membantu supaya kedepannya kita punya perencanaan yang jelas dan ga ada lagi uang yang tersesat. Mimin mau kasih tau beberapa cara mudah untuk mengetahui kemana saja perginya uangmu.</p><ol><li></br>1. &nbsp;Kumpulkan semua bukti-bukti transaksi dalam 30 hari terakhir, apapun itu yang merupakan sumber pengeluaran uang entah itu tanda terima, bukti transfer, atau rekening koran. Karena bukti-bukti ini memberikan informasi penting untuk melacak pengeluaran seperti tanggal pembelian, produk yang dibeli, serta harganya.</li><li></br>2. &nbsp;Kategorikan semua pengeluaranmu. Tidak ada patokan yang pasti karena setiap orang punya latar belakang berbeda, keperluan yang berbeda dan juga tujuan finansial yang berbeda. Mimin kasih contoh 50/30/20 rule yang mungkin bisa membantu kalian supaya pengeluaran uang kalian lebih terarah ya. Yang pertama yaitu 50% needs, kategori ini bersifat wajib karena berhubungan dengan kebutuhan hidup sehari-hari. Jangan lebih dari 50% ya, jika merasa kurang coba eliminasi kebutuhan yang sekiranya tidak terlalu penting. 30% wants, kategori ini dikhususkan untuk hal-hal yang kamu inginkan seperti self rewards. Kategori 20% saving untuk menunjang kehidupan yang lebih baik kedepannya seperti investasi, dana darurat, bayar hutang, atau dana pensiun.</li><li></br>3. &nbsp;Gunakan aplikasi pencatatan keuangan atau spreadsheet. Yuk gunakan fitur pencatatan keuangan yang ada di website ini. Selain menghemat waktu, kamu bisa mengakses kapanpun dan dimanapun dengan keamanan yang terjamin. Fitur pencatatan keuangan nabungyuk bisa ngasih tau kamu loh berapa uang yang kamu habiskan setiap bulannya disetiap kategori, jadi sangat membantu kamu untuk menganalisa dan evaluasi kemana aja sih perginya uangmu selama ini. Setelah itu kamu jadi bisa lebih hati-hati untuk tidak mengulangi kesalahan yang sama. Jadi nggak ada lagi ya alasan-alasan lain seperti kelupaan, malas atau tidak punya waktu hehe.</li></ol><p>&nbsp;</p><p>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p><p>sumber: <a style=\"color:blue;\"href=\"https://benlefort.com/\">benlefort.com</a> &nbsp;</p>', '1623172843artikel2.png', 2, '2021-06-08 10:20:43', '2021-06-08 10:20:43'),
(8, 'Tips Biar Makin Jago Mengelola Uang', '<p style=\"text-align:justify;\">Mengelola keuangan pribadi bukanlah sesuatu hal yang susah melainkan skill yang harus kamu kuasai agar kamu bisa mencapai financial goals kamu. Karena yang kamu butuhkan adalah konsistensi dan kesabaran untuk mengendalikan keuanganmu sendiri. Beberapa konsep keuangan yang perlu kamu ketahui untuk mencapai financial goalsmu, diantaranya:<br><br><strong>1. Track pengeluaranmu</strong><br>Seperti yang sudah dijelaskan di artikel sebelumnya, kamu perlu tau kemana saja perginya uangmu supaya kamu lebih bijak dalam menggunakan uang dan menghargai setiap rupiah yang kamu keluarkan. Selain itu, sebelum kamu mengeluarkan uang, kamu bisa decide apakah hanya karena keinginan sesaat atau kamu benar-benar merasa ada value yang didapatkan dari barang itu.<br><br><strong>2. Memiliki dana darurat</strong><br>Seringkali kita bingung berapa sih jumlah dana darurat yang ideal? Banyak dari penasihat finansial maupun ahli keuangan merekomendasikan 3 hingga 6 bulan dari pengeluaran bulanan. Aturan tersebut nggak salah, tapi jumlah dana darurat yang dibutuhkan setiap orang berbeda tergantung pada keadaan masing-masing individu ya salah satunya dipengaruhi oleh job security. The less secure you feel your job is, maka jumlah dana darurat yang dibutuhkan cenderung lebih banyak.<br><br><strong>3. Membayar Hutang</strong><br>Ada dua strategi membayar hutang yang seringkali digunakan. Yang pertama yaitu Snowball method, dimana memprioritaskan hutang dengan nominal terkecil. Strategi ini berkaitan dengan psikologis, ketika seseorang merasakan kemenangan setelah melakukan sesuatu, kemungkinan besar akan melakukan hal yang sama seterusnya. Sebaliknya, ada Avalanche method yang memprioritaskan hutang dengan bunga terbesar supaya cepat kelar melunasi hutang. Gunakan strategi apapun yang sesuai dengan kenyamanan kamu ya, yang penting berhasil membayar hutang sampai lunas.<br><br><strong>4. Investasi</strong><br>Berinvestasi memang punya potensi untuk mendapatkan keuntungan yang lebih besar daripada menabung tanpa harus menukarkan waktu untuk uang. Tapi perlu diingat juga kalau investasi ini adalah untuk tujuan jangka panjang dan pastinya beresiko. Jadi sebelum mulai investasi pastikan kamu punya penghasilan yang lebih besar daripada pengeluaran yaa karena semakin besar pula hasil investasi yang bisa kamu nikmati. Jika sekarang belum mampu it’s okay, fokuskan diri untuk menambah income karena kesempatan pasti selalu ada.<br><br>Supaya kamu makin jago mengelola keuangan, kamu nggak perlu jadi Warren Buffet :p yang penting kamu punya money mindset yang benar agar kamu tetap stick to the plan through good and bad times serta membangun hubungan yang baik dengan keuanganmu.<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\r\n<p style=\"text-align:justify;\">Sumber:&nbsp;<a class=\"text-blue-500\" href=\"https://benlefort.com\">benlefort.com</a> &nbsp;</p>', '1623174517artikel3.png', 2, '2021-06-08 10:48:37', '2021-06-08 10:48:37'),
(10, 'Pentingkah dana darurat?', '<p>Sebelum kamu mau belanja ini itu, pastikan kamu sudah punya yang namanya dana darurat ya. Kalau saat ini kamu baru mau mulai menabung, jadikan dana darurat sebagai tujuan finansialmu dengan menargetkan nominal bulanan yang bisa kamu sisihkan. Kamu harus membangun pondasinya dulu yaitu terbiasa dengan menyisihkan. Mimin tau menabung memang bosenin dan ga bisa dipamerin ke orang lain. Meskipun kamu juga punya hutang yang harus kamu bayar, tetap prioritaskan untuk menabung dana darurat ya. Karena jika kamu tidak memiliki dana darurat, akibatnya kamu akan cenderung berhutang untuk membayar biaya-biaya tidak terduga suatu hari nanti. Jadi, lebih baik mencegah dengan sedia dana darurat. Jangan lupa untuk menyimpan dana pada instrumen yang likuid ya maksudnya mudah diakses ketika dibutuhkan contohnya, tabungan, deposito, mata uang asing, dan logam mulia. Dana darurat hanya boleh digunakan di situasi yang tidak pasti, ketika ada kejadian mendesak seperti service laptop yang tiba tiba rusak, kehilangan pekerjaan, biaya pengobatan ketika sakit, dll.&nbsp;<br><br>“ Personal finance is the art of balancing “the numbers” with your personal preferences. An emergency fund is no different. “<br><br><strong>Lalu bagaimana dengan jumlah uang yang harus disisihkan setiap bulannya?</strong> Ada beberapa faktor yang menjadi pertimbangan, yaitu:<br>Berapa jumlah uang yang kamu keluarkan setiap bulannya untuk kebutuhan hidup sehari-hari<br>Tetapkan berapa bulan dana darurat yang ingin dimiliki<br>Kapan kamu ingin targetmu tercapai.&nbsp;<br>Seberapa banyak uang yang telah kamu simpan untuk dana darurat.&nbsp;<br>Contohnya, pengeluaran bulanan si A sebesar Rp2.000.000 dan dalam 5 bulan kedepan ingin memiliki dana darurat untuk 6 bulan. Sejauh ini uang yang sudah disimpan sebanyak Rp5.000.000. Berarti dana darurat yang harus dikumpulkan si A adalah Rp12.000.000 dengan menyisihkan Rp1.400.000 setiap bulannya.&nbsp;<br><br>Beberapa orang merekomendasikan dana darurat sebanyak 3 sampai 6 kali pengeluaran bulanan. Tapi nominal itu bisa berubah loh berdasarkan seberapa securenya income mu dan preferensi personal. Jika kamu memiliki income yang pasti setiap bulannya, mungkin kamu tidak membutuhkan dana darurat untuk 6 bulan penuh. Kecuali jika mempunyai dana darurat yang berlebih membuatmu lebih aman dan tenang, then go for it. Vice versa, jika pendapatan bulananmu tidak menentu kamu mungkin bisa mempertimbangkan untuk mempunyai dana darurat berlebih.&nbsp;<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://benlefort.com/\"><span style=\"color:hsl(240, 75%, 60%);\">benlefort.com</span></a>&nbsp;</p>', '1623174973artikel4.png', 2, '2021-06-08 10:56:13', '2021-06-08 10:56:13'),
(11, 'Utang sebenernya baik atau buruk sih?', '<p>Kehidupan manusia tidak terlepas dengan yang namanya utang. Utang menjadi solusi untuk beberapa orang disaat belum punya cukup uang untuk membayar langsung secara tunai. Sebenernya utang punya sisi baik loh, walaupun juga tidak sedikit sisi buruknya yang akhirnya bisa menjadi jebakan kalau nggak hati-hati.&nbsp;<br><br>Sebelum memutuskan untuk berhutang, alangkah baiknya untuk menanyakan beberapa hal penting ini ke diri sendiri seperti; apa jenis utangnya, tujuan utang untuk apa, berapa banyak utang yang akan dimiliki, serta suku bunga dan bagaimana syarat pembayaran utang tersebut. Dari situlah kamu bisa menyimpulkan apakah utang ini untuk tujuan yang baik atau malah menjerumuskan diri sendiri.&nbsp;<br><br>Ada dua konsep hutang yang perlu kamu tau, utang konsumtif dan utang produktif. Apaan tuh utang konsumtif? Utang konsumtif adalah pinjaman yang digunakan untuk membeli barang yang nilainya terus menurun dan tidak menghasilkan pemasukan. Utang ini dipakai untuk hal-hal yang berkaitan dengan konsumsi, seperti kebutuhan dan keinginan. Misal nih kamu pingin beli gadget terbaru dengan cara nyicil, maka ini dikategorikan utang konsumtif. Lain cerita kalo kamu beli gadget tapi kamu juga bisa menghasilkan atau memiliki pemasukan dari gadget yang udah kamu beli, maka utang itu dikategorikan utang produktif.&nbsp;<br><br>Sejauh mana kamu boleh ngutang? Kamu bisa coba menghitung rasio utang melalui fitur <a class=\"cursor-pointer text-blue-500\" href=\"/feature/\">Financial Check Up </a> di website nabungyuk loh. Rumusnya yaitu jumlah cicilan perbulan : penghasilan per bulan x 100%. Idealnya, rasio utang yang sehat tidak melebihi 30% dari income.&nbsp;<br><br>Jangan lupa untuk memiliki perencanaan keuangan yang jelas ya sebelum memutuskan untuk memiliki utang. Yuk mulai kurangi pengeluaran yang tidak perlu dan jika ada cicilan segera dilunasin yaa!<br><br>“ Akar dari masalah utang itu karena ga bisa budgeting” - Natalia Pace<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>', '1623176572artikel5.png', 2, '2021-06-08 11:22:52', '2021-06-08 11:22:52'),
(12, 'Punya uang 1 Milyar, mungkin ngga ya?', '<p>Ngga sedikit dari kita yang ngerasa ngumpulin duit sampe 1 miliar tuh susah banget bahkan mustahil. Tapi jangan khawatir, di postingan ini mimin mau kasih tau kalian gimana caranya biar kesampean punya uang 1 miliar pertamamu. Kalo berhasil, boleh dong bagi ke mimin dikit? Hehe. Sebenarnya caranya mudah dan mimin yakin kamu sendiri juga udah sering denger, yaitu membuat uang bekerja buat kamu. Yap benar, caranya dengan “investasi”.<br><br>Tapi kan penghasilanku ngga besar-besar amat min mana bisa nyampe 1 miliar? Jawabannya bisa dong, asal kamu mau belajar dan sabar ya karena kekayaan nggak bisa dibangun semalem aja. Mimin kasih contoh ya kalo kamu mulai menabung rutin setiap bulannya sebesar 1 juta ke reksadana selama 20 tahun kamu akan memiliki uang sebesar 1,4 miliar loh dengan asumsi return 15% setiap tahunnya. Tapi kok lamaaa banget min! :( Kalo kamu pengen lebih cepet, rajin-rajinlah menabung dan menambah pemasukan. Dijaman sekarang ada banyak cara untuk punya penghasilan tambahan, entah itu jadi content creator, freelancer, reseller, dan masi banyak lagi. Instrumen investasi yang kamu gunain nggak harus reksadana ya, bisa disesuaikan sama profil resiko masing-masing.&nbsp;<br><br>Jangan lupa sebelum kamu memutuskan untuk investasi, pastikan kamu sudah memiliki dana darurat yang bisa mengcover kebutuhan hidup selama 3 sampai 6 bulan kedepan ya. Juga jangan lupa untuk terbiasa mengelola uang dengan nominal kecil supaya nanti ngga kalap. Karena di website ini mimin fokusnya bahas tentang menabung, mimin ngga bisa kasih banyak penjelasan tentang investasi.. Tapi jangan menyerah karena kamu bisa belajar dari banyak sumber lainnya. Kalau sudah berhasil jangan mudah puas yaa, ini hanya salah satu pencapaian hidup dan masih banyak yang harus dipelajari serta diraih. Semangat!&nbsp;<br><br>“ Everytime you increase your financial knowledge, you increase what’s financially possible for you.”&nbsp;<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://benlefort.com/\"><span style=\"color:hsl(240, 75%, 60%);\">benlefort.com</span></a><span style=\"color:hsl(240, 75%, 60%);\"> &nbsp;</span></p>', '1623407751artikel6.png', 2, '2021-06-11 03:35:51', '2021-06-11 03:35:51'),
(13, 'Perlukah menyimpan uang direkening tabungan?', '<p>Judul artikel ini terkesan clickbait, tapi sebenarnya perlu dipertimbangkan loh untuk menyimpan uang dalam jangka waktu yang lama meskipun bunga bank rendah. Contohnya, kalian menabung sebesar 1.000.000 dan dalam sebulan kalian akan mendapatkan tambahan uang sebesar 3,50% dari 1.000.000 yang berarti kalian mendapatkan Rp2.973 saja. Nah, sedikit sekali bukan? Apakah sebaiknya uang tersebut di investasi saja daripada ditabung?&nbsp;<br><br>Karena kita memiliki banyak kebutuhan, penting untuk melakukan “budgeting”. Tentu saja tambahan pendapatan dari bunga merupakan hal yang yang menguntungkan, maka dari itu sebisa mungkin uang yang kita miliki menghasilkan bunga sebanyak mungkin. Dalam perencanaan keuangan, budgeting yang sehat adalah ketika sekumpulan uang menunggu untuk digunakan. Uang tersebut tidak menganggur melainkan sudah teralokasi untuk kebutuhan yang spesifik. Masih bingung? Begini ilustrasinya:&nbsp;<br><br>Kamu memiliki uang sebesar Rp500.000. Dari uang itu kamu mengalokasikan Rp350.000 untuk membayar cicilan. Jadi kamu memiliki sisa Rp150.000 dari uang yang kamu alokasikan.<br><br>Uang sisa tersebut sebaiknya tidak digunakan dan ditimbun selama bertaun-tahun sehingga menghasilkan bunga yang besar! Jika kalian menggunakan Nabung Yuk untuk beberapa bulan, kamu dapat melihat berapa sisa-sisa uang yang dibiarkan menggunung tepat saat kamu butuhkan. Mau mencoba melakukan budgeting? Yuk! Belajar step-by-step dengan menggunakan fitur dari Nabung Yuk!<br><br>Dengan timbunan uang yang ada, bunga bisa membuat kita kaya mendadak. Namun dalam rangka menjadi “kaya mendadak”, setidaknya dua dari tiga hal ini harus tersedia: bunga yang tinggi, uang yang banyak untuk ditimbun dan uang tersebut memang dibiarkan berlama-lama disana. Dalam kehidupan yang biasa-biasa saja susah untuk melihat kekuatan dari bunga tersebut namun biasanya terlihat jika kita hutang, maka bunga akan berbalik menyerang kita. Dari sisi baiknya, jika kita mulai menabung untuk hari tua atau pensiun atau bahkan jika kalian memiliki kesempatan untuk menabung untuk kuliah, maka kita akan diuntungkan oleh bunga!<br><br>Nabung Yuk dapat membantu kamu untuk melakukan budgeting dengan simple karena uang-uangnya akan terkumpul dalam satu akun. Simplicity is also a virtue. Makin kaya dengan bantuan tools yang simple banget bersama Nabung Yuk.<br><br>Eh tapi tadi di awal kita udah nyinggung sedikit tentang investasi ya? Oke kita bahas sekarang. Paradigmanya, jaman sekarang menabung itu underrated. Banyak yang bilang jika kita melakukan investasi maka mendatangkan keuntungan yang besar dalam waktu yang cepat. Tapi jangan sampai salah ya dalam berinvestasi, karena selain keuntungan yang besar investasi juga bisa mendatangkan kerugian yang besar! Bacalah buku-buku yang berkaitan dengan investasi. Meskipun terkesan kuno, sebenarnya banyak orang yang masih menemukan kesenangan dalam menabung. Coba deh kalau nggak percaya! Bedanya, waktu masih kecil kamu menabung di celengan ayam tapi sekarang di bank online. Jadi meskipun bunga yang didapat mungkin kecil tapi selain pasti dapat, jika dikumpulkan lama-lama menjadi banyak! Selamat menabung teman-teman!<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>', '1623408000artikel7.png', 4, '2021-06-11 03:40:00', '2021-06-11 03:40:00'),
(14, 'Self Reward Dengan Budget Dibawah 100 Ribu!', '<p>Pergi ke tempat spa? Belanja barang branded? Daftar membership gym? Datang ke konser artis favorit kamu? Wow! Asik banget! Cara-cara fantastis untuk memberi dirimu self-reward setelah kerja keras yang kamu lakukan selama ini. Dengan begitu, kamu menjadi semangat lagi untuk menjalani rutinitasmu. Sayangnya untuk mewujudkan hal-hal tersebut kamu butuh budget. Kalau nggak punya budget terus gimana? Tenang aja! Masih banyak cara yang untuk memanjakan diri kamu tanpa mengeluarkan dana yang banyak kok!&nbsp;<br><br>Nih ada 30 cara yang udah kita rangkum buat kamu supaya kamu nggak kehabisan ide, disimak ya:</p>\n<ol>\n    <li>Dengerin album favorit kamu sambil jalan-jalan. Jangan berhenti ya sampai lagu terakhir diputar. Asik nih kayak di MV-MV gitu!</li>\n    <li>Beli keju yang fancy! Coba samperin toko keju di daerahmu dan beli stilton sambil minum kopi hitam. Kayak di Italy!</li>\n    <li>Beli majalah sambil antri di kasir supermarket.</li>\n    <li>Jangan terlalu strict dengan diri sendiri, sekali-sekali makan junk food tidak apa-apa.</li>\n    <li>Atur settingan HP kamu jadi airplane mode dan beri dirimu me time paling tidak satu jam untuk relaksasi.</li>\n    <li>Minum segelas wine sambil memasak makan malam. Rasanya seperti di Perancis dengan kehidupan yang fancy abis!</li>\n    <li>Kalau kamu punya anjing, ajak dia nge-date ke starbucks dan berikan dia Puppuccino!</li>\n    <li>Beli coklat dari gourmet shop dan makanlah tanpa ada rasa malu dan bersalah. It’s ok a bar of chocolate won’t hurt.</li>\n    <li>Beli kaus kaki baru.</li>\n    <li>Facial sendiri di rumah dengan sheet mask dan air timun sangat menyegarkan.</li>\n    <li>Jalan-jalan dan nikmati pemandangan alam.</li>\n    <li>Movie marathon di Netflix sampai kamu ditanya Netflix apa kamu masih nonton.</li>\n    <li>Beli nail polish baru dan lakukan mani/pedi sendiri di rumah.</li>\n    <li>Pijat diri sendiri dengan massage gun atau alat pijat lainya.</li>\n    <li>Membuat rumahmu seperti hotel mewah dengan cara menata kasur sebelum pergi. Ketika kamu kembali pulang, kasur telah tertata rapi seperti di hotel!</li>\n    <li>Lihatlah ke langit dan ambil momen bahwa kamu merasa hidup.</li>\n    <li>Membuat spa sendiri di rumah dengan garam mandi dan lilin aromatherapy.</li>\n    <li>Beli makanan favorit kamu.</li>\n    <li>Tidur siang.</li>\n    <li>Nggak melakukan apapun.</li>\n    <li>Beli tanaman untuk di rawat.</li>\n    <li>Solo date hanya dengan dirimu sendiri.</li>\n    <li>Beli peralatan memasak yang baru.</li>\n    <li>Membuat jurnal tentang dirimu, apa yang kamu capai da apa yang ingin kamu capai bulan depan.</li>\n    <li>Mencoba kedai kopi yang belum pernah kamu coba.</li>\n    <li>Yoga lewat tutorial YouTube</li>\n    <li>Melihat matahari terbenam dan terbit.</li>\n    <li>Ketika makan malam, nyalakan lilin meskipun makan malamu hanya sereal.</li>\n    <li>Ambil cuti sehari dari kerja tanpa alasan apapun untuk relaksasi.</li>\n    <li>Membuat kopi sendiri di rumah dengan teknik seperti yang dilakukan barista!</li>\n</ol>\n<p>Cobalah untuk menikmati waktu luangmu dengan ide-ide diatas. Selain mereka ramah biaya, ramah terhadap jiwa dan mudah untuk dijalankan oleh diri sendiri! Happy Self-care!<br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>\n<p>&nbsp;</p>', '1623408803artikel8.png', 3, '2021-06-11 03:53:23', '2021-06-11 03:53:23'),
(15, '4 Cara Sederhana Agar Sukses Budgeting', '<p>Ada 4 aturan sederhana agar budgeting kamu sukses. Memang, untuk terbiasa budgeting ada bumbu rahasianya sendiri agar user dapat memahami cara menggunakan fitur budgeting di Nabung Yuk!<br><br><strong>Aturan Pertama: Give every dollar a job</strong><br>Belanjakan uangmu karena you are your own boss. Prioritaskan untuk membelanjakan hal penting jika kamu mendapat uang sehingga dengan langkah sederhana ini perencanaanmu akan sukses. Cara kerjanya adalah ketika kamu mendapat uang, kamu akan menentukan kebutuhan terpenting apa yang kamu miliki. Daripada dibelanajakan secara impulsive atau sesuai mood, uang tersebut telah teralokasi dengan baik. Mengapa ini berhasil? Karena kamu telah membuat peta kemana uangmu akan pergi! Jadi daripada stress karena pengeluaran yang tidak penting, kamu mennyukseskan rencanamu.<br><br><strong>Aturan Kedua: Embrace your true expense</strong><br>Buat uangmu mengendap lebih banyak. Selalu budgetkan biaya-biaya besar yang tak terduga setiap bulan. Maka dari itu, jika suatu saat kamu membutuhkan biaya tak terduga tersebut, maka akan selalu ada dana yang siap membiayai kamu. Say good bye to financial crisis roller coaster. Kemudian uang yang tidak digunakan tersebut akan sangat berguna di akhir. Benar! Itu seperti menabung.&nbsp;<br><br><strong>Aturan Ketiga: Roll with the Punches</strong><br>Dalam olahraga tinju, kamu menggerakan menggerakan tubuhmu searah dengan serangan lawan. Jika lawan memukulmu dan kamu bergerak searah dengan bergerak ke belakang, maka mengurangi risiko terkena pukulan. Sama halnya dengan budgeting. Jadilah fleksibel dan menutupi pengeluaran berlebih dengan semestinya. Begini ilustrasinya: jika kamu melakukan pengeluaran berlebih untuk belanja bulanan dan hal ini tidak dapat dihindari, apakah kamu akan tetap pergi ke pantai memaksakan budget yang ada? Tentu tidak. Keadaan berubah dan rencana berubah menyesuaikan keadaan yang terjadi. Tidak perlu menjadi sempurna! Kamu hanya perlu komitmen dalam proses perencanaan dan tetap mengikuti perencanaanmu sebagaimana mestinya.&nbsp;<br><br><strong>Aturan Keempat: Age your money</strong><br>Ketika kamu membelanjakan uangmu, kamu harus memiliki tujuan yang pasti dan konsisten. Contohnya ketika kamu ingin membayar biaya sewa untuk bulan mei, maka kamu akan membayarnya dengan uang gaji bulan April. Tidak membuang waktu dan membayar tepat waktu saat tagihan datang. Dengan begitu, tidak perlu stress lagi dalam mendapat tagihan!<br><br>Nah sekarang, karena kamu sudah tau apa aja aturannya, kamu bisa mulai melakukannya sekarang loh! GRATIS! Budgeting itu bukan pembatas atau penghalang bagi dirimu, justru dengan budget yang tepat, kamu dapat dengan tepat membelanjakan uangmu. Yuk mulai cobain fitur budgeting di Nabung Yuk!<br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>', '1623409044artikel9.png', 3, '2021-06-11 03:57:24', '2021-06-11 03:57:24'),
(16, 'Saldo Tabungan vs. Budget', '<p>Pertama-tama mari menjelaskan apa itu “tabungan”. Umumnya orang-orang akan menjawab “meletakkan uang di dalam rekening bank”. Nabung Yuk mengajarkan untuk memberi setiap dollar yang kita miliki sebuah pekerjaan termasuk dalam menabung. Kita akan mendefinisikan menabung sebagai “menunda menggunakan uang di lain waktu untuk tujuan tertentu. Membedakan rekening tabungan dengan rekening biasa untuk pembelanjaan sehari-hari merupakan hal wajar. Namun karena di Nabung Yuk, budget juga merupakan tabungan maka jangan takut untuk menjadikan satu antara budget dengan tabunganmu. Nominal besar yang ada di bankmu belum tentu dapat menjelaskan keseluruhan keadaan yang kamu alami seperti memberitahu seberapa banyak belanja bulanan yang kamu butuhkan. Namun budgetmu dapat membantu kamu dalam memberi tahu seberapa banyak belanja bulanan yang kamu butuhkan. Lupakan saldo bankmu dan percayalah pada budgetmu. Maka dari itu, sebenarnya tidak terlalu penting untuk memisahkan rekening tabungan dengan rekening yang biasa kamu pakai untuk berbelanja malahan kamu semakin susah untuk mengontrol kedua akun bank kamu loh!&nbsp;<br><br>Hmmm… berbicara tentang tujuan. Betul, diluar sana banyak orang yang secara natural dapat menabung meskipun tanpa budget. Sayangnya, meskipun mereka pandai menabung, masih banyak yang menabung tanpa tujuan yang jelas dan hanya melakukan hal tersebut karena dirasa hal itu benar. Sebenarnya “hal yang dirasa benar” hanyalah ilusi. Ketika kamu melihat barang menarik di Shopee dan tidak bisa mengendalikan dirimu untuk membelinya, uangmu akan terpakai dan menyesalinya dikemudian hari. Hal ini terjadi karena uangmu tidak memiliki pekerjaan seperti yang dikatakan sebelumnya. Spesifik dalam tujuan menabung merupakan kunci. “Liburan 2021”, “Mobil Jeep”, “HP iPhone terbaru” bahkan “Donasi Natal” dapat kamu budgetkan sehingga uang dapat tersisihkan sedikit demi sedikit. Kamu akan berpikir dua kali untuk membelanjakan uang yang telah kamu tabung untuk hal-hal yang tidak se-worth it tujuanmu. Ya kan?<br><br>Setiap kategori yang kamu buat di Nabung Yuk, adalah tabungan. Mau itu untuk belanja bulanan atau liburan itu semua merupakan tabungan. Sekali lagi, karena uang yang kamu alokasikan sudah memiliki tujuan yang jelas!<br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>', '1623409209artikel10.png', 3, '2021-06-11 04:00:09', '2021-06-11 04:00:09'),
(17, '10 Cara Untuk Satu Langkah Lebih Dulu Dibandingkan Tagihanmu', '<p>Mau nggak dikejar-kejar tagihan? Kita punya ide jitu yang bisa kamu ikutin! Coba bayangin ada sepuluh tagihan yang datang secara bersamaan dan harus dibayar dalam saat itu juga. Jika kamu satu bulan di depan tagihanmu maka kamu nggak bakal pusing lagi buat bayar karena masih ada uang utuh satu bulan kedepan! Wow, oke terdengar susah untuk didapatkan jika kamu tidak berpenghasilan lebih. Tenang ini dia sepuluh cara untuk selangkah lebih cepat dibanding tagihanmu!<br><br><strong>1. Menjual barang-barang yang sudah tidak kamu gunakan</strong><br>Manfaatkan teknologi marketplace seperti Carousell untuk menjual barang-barang yang tidak kamu gunakan lagi. Dengan begitu,kamu bisa mendapat tunai saat itu juga! Selain Carousell, coba Prelo, Tokopedia, OLX, dll yang dapat membuat gudang rumah kamu menjadi tambang emas.<br><br><strong>2. Cancel, cancel dan cancel!</strong><br>Mungkin ini sedikit kejam, tapi potong langgananmu yang tidak perlu seperti layanan streaming music, audiobook dan podcast, menurunkan paket ke langganan yang lebih murah, membatalkan membership gym karena olahraga itu gratis!<br><br><strong>3. Tantang dirimu dalam 34-day reset challenge!</strong><br>Cobalah selama 34 hari memantau dan mencatat pengeluaranmu, hanya membeli barang yang kamu butuhkan, dan tidak membeli makanan diluar! Rasakan dasyatnya…<br><br><strong>4. Masaklah makananmu sendiri.</strong><br>Memasak makanan sendiri lebih murah dibandingkan harus membeli makanan dari restoran takeaway. Selain itu akan lebih sehat karena kamu tau apa yang kamu masak.<br><br><strong>5. Dapatkan barang murah.</strong><br>Secara sederhana mengajak kita untuk mensubstitusi barang-barang yang bias akita konsumsi. Coba untuk menukar produk dari brand favorit kita dengan produk sejenis yang memiliki kualitas yang sama dengan harga lebih murah. Pasti ada! Daripada membeli buku, cobalah untuk meminjam dari perpustakaan.<br><br><strong>6. Tetap gunakan mobilmu yang sekarang, jika rusak masukan ke bengkel.</strong><br>Sebenarnya mobil termurah adalah mobil yang kamu pakai sekarang. Jika ada kendala dan kerusakan jika dimungkinkan coba perbaiki karena secara akumulatif akan lebih murah daripada membeli yang baru meskipun dengan cicilan rendah.&nbsp;<br><br><strong>7. Mengurangi pembelian hadiah</strong><br>Memberikan hadiah terhadap orang yang kita sayangi tentu merupakan kesenangan tersendiri. Namun apakah bentuk kasih sayang hanya dapat diungkapkan menggunakan hadiah? Saat pertemuan keluarga cobalah melakukan aktivitas yang menyenangkan seperti mengungkapkan memori apa saja yang membuatmu bahagia.&nbsp;<br><br><strong>8. Menggunakan lebih sedikit</strong><br>Coba tengoklah tagihanmu. Kira-kira penggunaan apa yang bisa dikurangi ya? Berpergian yang tidak ada hubunganya dengan pekerjaanmu lebih baik dikurangi untuk menghemat bensin.<br><br><strong>9. Simpan kelebihan danamu.</strong><br>Mungkin ada tax return, cek bonus, hadiah dari kakek dan nenek. Perlakukan mereka seperti keju yang mahal, semakin lama semakin baik karena bukan merupakan pemasukan regulermu.<br><br><strong>10. Hustle!</strong><br>Cari pekerjaan tambahan atau melakukan freelance di luar full-time job yang kamu lakukan. Mungkin melelahkan tapi worth it banget loh yang penting kamu enjoy dengan pekerjaan tambahanmu!<br><br><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>', '1623410646artikel11.png', 4, '2021-06-11 04:24:06', '2021-06-11 04:24:06'),
(18, 'Blind Spot Pada Saldo Bankmu', '<p>Blind spot di saldo bank? Apalagi sih ini? Oke bakal mimin jelasin. Jadi coba bayangin kamu berdiri di pertigaan. Awalnya jalanan kelihatan tenang aja tapi saat kamu dekat pertigaan, bisa jadi ada mobil yang ngebut dari arah kiri. Jika tidak bisa mengontrol maka akan terjadi kecelakaan. Aduh, amit-amit deh! Kira-kira seperti itu ilustrasinya. Sama halnya dengan saldo bankmu. Mengapa demikian?</p>\n<ol>\n    <li>Bankmu mungkin tidak mengetahui pembelianmu karena beberapa transaksi membutuhkan waktu lebih dari sehari untuk diproses.</li>\n    <li>Transaksi yang berstatus “pending” sering kali tidak tercermin di saldo totalmu sehingga tidak terlihat penguranganya.&nbsp;</li>\n    <li>Terkadang bank dan merchant membuat kesalahan. Sampai kesalahan itu diperbaiki, nominal saldomu tidak mencerminkan nominal yang sebenarnya.</li>\n    <li>Saldo bankmu juga tidak mengetahui kebutuhan dan prioritasmu, sehingga jika ada pendebetan secara otomatis maka uangmu akan lenyap secara otomatis sesuai tagihan.</li>\n</ol>\n<p>Maka dari itu, jika kamu membuat keputusan berdasarkan saldo bankmu, maka kamu membuka kesempatan adanya kesalahan terkait blind spot tersebut. Lebih baik membuat keputusan berdasarkan budget yang telah kamu buat. Seperti halnya mobil yang melaju kencang dari arah kiri, biaya besar yang mendadak juga mengagetkanmu. Maka dari itu dengan membuat budget yang tepat, kamu dapat secara proaktif meningkatkan stabilitas finansialmu. Contohnya begini, kamu sedang tidak dalam mood untuk memasak, maka dari itu kamu membeli makanan. Saldo bankmu menunjukan angka Rp2.000.000 namun ternyata ada transaksi yang tertunda sebesar Rp1.300.000 sehingga sebenarnya hanya tersisa Rp700.000. Sedihnya, kamu juga punya tagihan asuransi mobil sebesar Rp500.000 yang harus dibayar besok dan kamu juga harus belanja bulanan keesokan harinya. Waktu gajian masih lama dan kamu Cuma punya Rp200.000. Dengan budgeting yang pas maka kamu terhindarkan dari hal-hal seperti ini!</p>\n<p>Sekali lagi gais, budget lebih penting dibandingkan saldo bank dalam mengambil keputusan dan yang terpenting menghindarkanmu dari jerat hutang yang menghantui. So pastikan untuk mencoba budgeting di Nabung Yuk karena gratis loh!</p>\n<p><br>Semua informasi di website ini hanya untuk tujuan edukasi. Berkonsultasilah dengan penasihat finansial anda sebelum mengambil keputusan keuangan yang penting.&nbsp;</p>\n<p>Sumber: <a href=\"https://ynab.com/\"><span style=\"color:hsl(240, 75%, 60%);\">ynab.com</span></a></p>', '1623410841artikel12.png', 4, '2021-06-11 04:27:21', '2021-06-11 04:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_03_20_150116_create_master_budgets_table', 1),
(10, '2021_03_20_150335_create_master_categories_table', 1),
(11, '2021_03_21_145156_create_sub_categories_table', 1),
(12, '2021_03_26_111310_create_activities_table', 1),
(13, '2021_03_28_133623_create_user_details_table', 1),
(14, '2021_06_02_003430_create_category_materi_pembelajarans_table', 2),
(15, '2021_06_02_003405_create_materi_pembelajarans_table', 3),
(16, '2021_06_02_005248_create_category_materi_pembelajarans_table', 4),
(19, '2021_06_02_005257_create_materi_pembelajarans_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('08c8f587e1f96a8dab6458d5ed511d6bbb715e72c3dfe141dafcd2195076c11c49c519869ea4db6d', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:07:18', '2021-06-11 00:07:18', '2022-06-11 07:07:18'),
('0c0fae826b5b76300198959300a05b379420cd35cec2da461121600c661ee57b2bc971aff4fd837e', 7, 1, 'Laravel', '[]', 0, '2021-06-11 01:21:18', '2021-06-11 01:21:18', '2022-06-11 08:21:18'),
('0c495f438849506b7391ec8ff1ee526a65d5a1381477c7d0d52840d4dd2954d7882de8c9bdfa513e', 3, 1, 'Laravel', '[]', 0, '2021-05-12 23:52:38', '2021-05-12 23:52:38', '2022-05-12 19:52:38'),
('17dd30ae5827e69eea41e85b9faa1ae3c1dc8cd0c3f15b161803018af2d3247bf87b8b1906cb57b9', 8, 1, 'Laravel', '[]', 0, '2021-06-11 01:25:22', '2021-06-11 01:25:22', '2022-06-11 08:25:22'),
('2ccbeb5b82c6de4814d94851c548f7029b3066354c5c4e7a3dddcced0380af40819633dc7a78843b', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:42:10', '2021-06-11 00:42:10', '2022-06-11 07:42:10'),
('3e3ee9072db6d5fe4bdb6e96b534203defe8d76283ff1d7fd13ed82cdc848ce6aefe58511f9fd546', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:39:40', '2021-06-11 00:39:40', '2022-06-11 07:39:40'),
('463966e840515a5da4c0bd60aa14e8621d5e75ca1d33d1c9582ca3978d29bcca17feccc0857d0c44', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:16:02', '2021-06-11 00:16:02', '2022-06-11 07:16:02'),
('69ddc963ad5ea631f6560998a211251ed1ca1b95053cb1a630cc5ce43ba9255c19a6f831d7abd3d2', 1, 1, 'Laravel', '[]', 0, '2021-05-07 18:45:14', '2021-05-07 18:45:14', '2022-05-07 14:45:14'),
('6f9c05fa75ca82e8e7183260634f59f8c515e2144d71444fd22af7bfb7900bfbd2996dbc62ee195d', 2, 1, 'Laravel', '[]', 0, '2021-05-09 11:34:36', '2021-05-09 11:34:36', '2022-05-09 07:34:36'),
('7841e7e6e5997acc2f69963ae5843a31cdeba5d77f4fe4a923defac2c204b3c4dfdf377e32505109', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:16:51', '2021-06-11 00:16:51', '2022-06-11 07:16:51'),
('a39d633073b4f16bb1d4704db48fb7fa7b597370b412536e2d3ec5267933f0bfda2b47da6cc930e3', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:15:17', '2021-06-11 00:15:17', '2022-06-11 07:15:17'),
('b45eff15ae7afd47fa29d6010bef5b6c6c4423f8021cd194e67530305c0784416ee26ecd785b41f4', 6, 1, 'Laravel', '[]', 0, '2021-06-11 01:19:17', '2021-06-11 01:19:17', '2022-06-11 08:19:17'),
('cf70423d81b6b9d1d5c87c696d2a56d48afcdd6942f0f00debd8c2aed9429e453305b2d1d60e1320', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:37:23', '2021-06-11 00:37:23', '2022-06-11 07:37:23'),
('d2f63a2caa13264d3208da245ab2078289b066aae2f7a27935434040aed0b66c0ae3acdcdc484f40', 5, 1, 'Laravel', '[]', 0, '2021-06-11 00:11:34', '2021-06-11 00:11:34', '2022-06-11 07:11:34'),
('d4a6bb6d899a0628d80364556cac00797f974965e44576ca66ccff8614ccfcd18f4868ee5f6339f4', 4, 1, 'Laravel', '[]', 0, '2021-06-11 00:06:10', '2021-06-11 00:06:10', '2022-06-11 07:06:10'),
('ebce834e421c0ffdf576ffbecbd55d263dd8f1b294db58fdceb4b91c0a580463a9567c130e02117a', 2, 1, 'Laravel', '[]', 0, '2021-06-10 06:14:26', '2021-06-10 06:14:26', '2022-06-10 13:14:26'),
('edb037b637c3c9b0aa547a58ff2923f380d1c48040bedef340ab66c3f24b2e42ccc1e06971937556', 8, 1, 'Laravel', '[]', 0, '2021-06-11 01:24:58', '2021-06-11 01:24:58', '2022-06-11 08:24:58'),
('f9f7407d1bbaf91045ee6579c3821a1d1c815dded8b42ad6dca5d077b35593a287794e9cb80a02d0', 5, 1, 'Laravel', '[]', 0, '2021-06-11 01:17:56', '2021-06-11 01:17:56', '2022-06-11 08:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'FiGIZENmUuOcsQP3pjvt9M2q0ltk8LW4Q3TaWnma', NULL, 'http://localhost', 1, 0, 0, '2021-05-07 18:33:36', '2021-05-07 18:33:36'),
(2, NULL, 'Laravel Password Grant Client', 'j4e8KuYyMPVg49mweZGlbMjskPjLIJMP7iL7bZJq', 'users', 'http://localhost', 0, 1, 0, '2021-05-07 18:33:36', '2021-05-07 18:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-07 18:33:36', '2021-05-07 18:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `finishBy` date DEFAULT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budgeted` double(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `sub_category_name`, `amount`, `finishBy`, `period`, `budgeted`, `created_at`, `updated_at`, `category_id`) VALUES
(6, 'mau dong', NULL, NULL, NULL, 10000.00, '2021-05-09 12:46:48', '2021-05-09 13:03:59', 3),
(7, 'lah iya kan', NULL, NULL, NULL, 0.00, '2021-05-12 23:55:22', '2021-05-12 23:55:22', 5),
(10, 'www', NULL, NULL, NULL, 0.00, '2021-05-24 12:13:07', '2021-05-24 12:33:08', 2),
(13, 'mantap jariah', NULL, NULL, NULL, 0.00, '2021-06-10 06:19:16', '2021-06-10 07:05:47', 6),
(14, 'maju mundur', NULL, NULL, NULL, 0.00, '2021-06-10 07:00:12', '2021-06-10 07:05:47', 6),
(15, 'maju mundur gerak', NULL, NULL, NULL, 0.00, '2021-06-10 07:00:19', '2021-06-10 07:00:19', 6),
(16, 'deady boy', NULL, NULL, NULL, 0.00, '2021-06-10 07:02:56', '2021-06-10 07:06:12', 6),
(17, 'clue', NULL, NULL, NULL, 0.00, '2021-06-10 07:03:19', '2021-06-10 07:03:19', 6),
(18, 'ww', NULL, NULL, NULL, 0.00, '2021-06-10 07:27:15', '2021-06-10 07:27:15', 6),
(19, 'wwdqwdqdqwd', NULL, NULL, NULL, 0.00, '2021-06-10 07:27:25', '2021-06-10 07:27:25', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `photos`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'w', 'w', '', 'w@gmail.com', NULL, '$2y$10$RPe6FSIlGXckROBc3hU9puYasWyEYF52CebgcYe2k3iyaCLZFtHX2', NULL, '2021-06-11 01:21:06', '2021-06-11 01:24:23'),
(8, 'c', 'c', '2021-06-11 08:30:43artikel4.png', 'cc@gmail.com', NULL, '$2y$10$lKzWpVPgs45imwQsof2XbOnHwk4zQOZYVUIDsKl4NcTqpJ/NCaihW', NULL, '2021-06-11 01:24:53', '2021-06-11 01:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `category_materi_pembelajarans`
--
ALTER TABLE `category_materi_pembelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `master_budgets`
--
ALTER TABLE `master_budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_categories`
--
ALTER TABLE `master_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_categories_budget_id_foreign` (`budget_id`);

--
-- Indexes for table `materi_pembelajarans`
--
ALTER TABLE `materi_pembelajarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materi_pembelajarans_category_pembelajaran_id_foreign` (`category_pembelajaran_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_materi_pembelajarans`
--
ALTER TABLE `category_materi_pembelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_budgets`
--
ALTER TABLE `master_budgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_categories`
--
ALTER TABLE `master_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `materi_pembelajarans`
--
ALTER TABLE `materi_pembelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `master_categories`
--
ALTER TABLE `master_categories`
  ADD CONSTRAINT `master_categories_budget_id_foreign` FOREIGN KEY (`budget_id`) REFERENCES `master_budgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `materi_pembelajarans`
--
ALTER TABLE `materi_pembelajarans`
  ADD CONSTRAINT `materi_pembelajarans_category_pembelajaran_id_foreign` FOREIGN KEY (`category_pembelajaran_id`) REFERENCES `category_materi_pembelajarans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `master_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
