-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 06:36 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `defense`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add accounts', 7, 'add_accounts'),
(26, 'Can change accounts', 7, 'change_accounts'),
(27, 'Can delete accounts', 7, 'delete_accounts'),
(28, 'Can view accounts', 7, 'view_accounts'),
(29, 'Can add prediction', 8, 'add_prediction'),
(30, 'Can change prediction', 8, 'change_prediction'),
(31, 'Can delete prediction', 8, 'delete_prediction'),
(32, 'Can view prediction', 8, 'view_prediction');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$YqdxGcYpIVFwL1KFWINIYl$szUIw8pZUQ+My2TPkspauS8IF1FRVwHBp0Fb7voM5L4=', NULL, 1, 'lynch', '', '', 'paololorenzo.longcob@gmail.com', 1, 1, '2025-05-09 14:39:50.252357'),
(2, 'pbkdf2_sha256$1000000$SGtqPsEWM4lJnriPz2Ypf1$UkK7540nd2WrwZ4TWKBFlFMFLeoem8qd089JGfQldA8=', '2025-05-09 14:43:44.771718', 1, 'paolo', '', '', 'paololorenzo.longcob@gmail.com', 1, 1, '2025-05-09 14:43:16.458884'),
(3, 'pbkdf2_sha256$1000000$sNd0rDJDX82UXbZW9fikTN$7m9ENvPXiG508kz5qZRztsvhZ5MkOkEISwDrh00GXqY=', '2025-05-09 16:35:05.284623', 0, 'admin', '', '', 'paololorenzo.longcob@gmail.com', 0, 1, '2025-05-09 16:16:46.090223'),
(4, 'pbkdf2_sha256$1000000$LBCy6CdM10g03jjUtdhh6x$11wYymbRoIyujPO/9jBwuigyonPSXyEqdRW9/a2hnxU=', '2025-05-09 16:32:54.427419', 0, 'ItimAngDinuguan', '', '', 'paololorenzo.longcob@gmail.com', 0, 1, '2025-05-09 16:32:39.026982');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `defeapp_accounts`
--

CREATE TABLE `defeapp_accounts` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `defeapp_prediction`
--

CREATE TABLE `defeapp_prediction` (
  `id` bigint(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `study_hours_per_day` double NOT NULL,
  `social_media_hours` double NOT NULL,
  `netflix_hours` double NOT NULL,
  `part_time_job` int(11) NOT NULL,
  `attendance_percentage` double NOT NULL,
  `sleep_hours` double NOT NULL,
  `diet_quality` int(11) NOT NULL,
  `exercise_frequency` int(11) NOT NULL,
  `parental_education_level` int(11) NOT NULL,
  `internet_quality` int(11) NOT NULL,
  `mental_health_rating` int(11) NOT NULL,
  `extracurricular_participation` int(11) NOT NULL,
  `prediction_result` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `defeapp_prediction`
--

INSERT INTO `defeapp_prediction` (`id`, `age`, `gender`, `study_hours_per_day`, `social_media_hours`, `netflix_hours`, `part_time_job`, `attendance_percentage`, `sleep_hours`, `diet_quality`, `exercise_frequency`, `parental_education_level`, `internet_quality`, `mental_health_rating`, `extracurricular_participation`, `prediction_result`, `created_at`, `user_id`) VALUES
(1, 20, 1, 2, 2, 2, 1, 30, 2, -1, 2, -1, -1, 2, 1, 32.944754355215615, '2025-05-09 15:43:58.331114', NULL),
(2, 21, -1, 1, 6, 2, -1, 100, 5, -1, 2, -1, -1, 4, -1, 31.68825606308618, '2025-05-09 15:46:05.075860', NULL),
(3, 21, -1, 1, 6, 2, -1, 100, 5, -1, 2, -1, -1, 4, -1, 31.68825606308618, '2025-05-09 15:48:39.541780', NULL),
(4, 21, -1, 1, 6, 2, -1, 100, 5, -1, 2, -1, -1, 4, -1, 31.68825606308618, '2025-05-09 15:48:54.679555', NULL),
(5, 21, -1, 1, 6, 2, -1, 100, 5, -1, 2, -1, -1, 4, -1, 31.68825606308618, '2025-05-09 15:49:32.427547', NULL),
(6, 20, 1, 2, 6, 2, 1, 20, 5, -1, 2, -1, -1, 10, 1, 42.2994652658637, '2025-05-09 15:54:47.646924', NULL),
(7, 20, 1, 2, 6, 2, 1, 20, 5, -1, 2, -1, -1, 10, 1, 42.2994652658637, '2025-05-09 15:55:53.968263', NULL),
(8, 23, 0, 2, 2, 2, 1, 100, 2, -1, 2, -1, -1, 10, 1, 58.70913261865007, '2025-05-09 16:17:32.461165', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'defeapp', 'accounts'),
(8, 'defeapp', 'prediction'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-01 17:19:31.103420'),
(2, 'auth', '0001_initial', '2025-05-01 17:19:31.324287'),
(3, 'admin', '0001_initial', '2025-05-01 17:19:31.375155'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-05-01 17:19:31.415735'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-01 17:19:31.424672'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-05-01 17:19:31.477186'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-05-01 17:19:31.508901'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-05-01 17:19:31.530211'),
(9, 'auth', '0004_alter_user_username_opts', '2025-05-01 17:19:31.537303'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-05-01 17:19:31.566139'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-05-01 17:19:31.568819'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-05-01 17:19:31.577332'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-05-01 17:19:31.597277'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-05-01 17:19:31.618181'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-05-01 17:19:31.641104'),
(16, 'auth', '0011_update_proxy_permissions', '2025-05-01 17:19:31.648678'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-05-01 17:19:31.671319'),
(18, 'sessions', '0001_initial', '2025-05-01 17:19:31.713815'),
(19, 'defeapp', '0001_initial', '2025-05-09 14:30:56.881897');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('we0oiswqaqbq4jb0czdsvb979p8fz8sm', '.eJxVjMsOwiAQRf-FtSEwlMe4dO83EGBAqgaS0q6M_65NutDtPefcF_NhW6vfRl78TOzMFDv9bjGkR247oHtot85Tb-syR74r_KCDXzvl5-Vw_w5qGPVbTy5ZIposAGJxiE5IWUxOOUohwGJQqBPEooxIEhUIBVhM0ZpAZ1Ts_QHMCzb6:1uDQgj:VRyCFdsDeBqEBDUvTKEBntGmqKYJ9mTl-rSuwNIT_Iw', '2025-05-23 16:35:05.288698');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `defeapp_accounts`
--
ALTER TABLE `defeapp_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `defeapp_prediction`
--
ALTER TABLE `defeapp_prediction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `defeapp_prediction_user_id_d309d587_fk_defeapp_accounts_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `defeapp_accounts`
--
ALTER TABLE `defeapp_accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `defeapp_prediction`
--
ALTER TABLE `defeapp_prediction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `defeapp_prediction`
--
ALTER TABLE `defeapp_prediction`
  ADD CONSTRAINT `defeapp_prediction_user_id_d309d587_fk_defeapp_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `defeapp_accounts` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
