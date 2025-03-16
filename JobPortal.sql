-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2025 at 04:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` text DEFAULT NULL,
  `profile_pic` text DEFAULT 'user.png',
  `email` text NOT NULL,
  `createdat` date NOT NULL,
  `gender` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 3,
  `contactno` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `password`, `fullname`, `profile_pic`, `email`, `createdat`, `gender`, `dob`, `address`, `role_id`, `contactno`) VALUES
(1, '$2y$10$yn8FrtD8OkDlbH8xGHAYX.p4PyFfI.rxto0.Y/f1crx2ODyIpwGeS', 'admin Deepak', '21560ff720ef5c73fa38ae6923adf1c5shreemangal.jpg', 'admind@gmail.com', '0000-00-00', 'Male', '2000-06-07', 'Kokar', 3, '7004778337');

-- --------------------------------------------------------

--
-- Table structure for table `applied_jobposts`
--

CREATE TABLE `applied_jobposts` (
  `id_applied` int(11) NOT NULL,
  `id_jobpost` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applied_jobposts`
--

INSERT INTO `applied_jobposts` (`id_applied`, `id_jobpost`, `id_user`, `id_company`, `status`, `createdat`) VALUES
(0, 6, 8, 4, NULL, '2023-07-31 00:00:00'),
(0, 6, 9, 4, NULL, '2023-07-31 00:00:00'),
(0, 6, 10, 4, NULL, '2023-08-01 00:00:00'),
(0, 3, 8, 1, NULL, '2023-08-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `id` int(3) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`id`, `name`) VALUES
(1, 'High School Student'),
(2, 'Undergraduate'),
(3, 'Graduate'),
(4, 'Senior Executive(President, CFO, etc)'),
(5, 'Manager/Supervisor of Staff'),
(6, 'Executive(SVP, VP, Department Head, etc)');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int(11) NOT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `companyname` text NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `address` text DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `contactno` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(250) NOT NULL,
  `aboutme` text DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `createdAt` date NOT NULL,
  `active` int(3) DEFAULT 0,
  `esta_date` date DEFAULT NULL,
  `empno` int(11) DEFAULT NULL,
  `profile_pic` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `industry_id`, `companyname`, `role_id`, `address`, `state_id`, `city_id`, `contactno`, `website`, `email`, `password`, `aboutme`, `hash`, `createdAt`, `active`, `esta_date`, `empno`, `profile_pic`) VALUES
(10, NULL, 'djha', 2, NULL, NULL, NULL, NULL, NULL, 'd@gmail.com', '$2y$10$/11RE5JS6iYVJ4d9X9MIIeMz2pIFomCIK/nVaq4GitxOfmKE6y4J.', NULL, '', '2025-03-16', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_reviews`
--

CREATE TABLE `company_reviews` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `review` text NOT NULL,
  `createdat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts_or_cities`
--

CREATE TABLE `districts_or_cities` (
  `id` int(11) NOT NULL,
  `division_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts_or_cities`
--

INSERT INTO `districts_or_cities` (`id`, `division_id`, `name`) VALUES
(1, 1, 'Darbhanga, Bihar'),
(2, 1, 'Patna, Bihar'),
(3, 1, 'Ranchi, Jharkhand'),
(4, 1, 'Kolkata, West Bengal'),
(5, 1, 'Mumbai, Maharashtra'),
(6, 1, 'Delhi, Delhi'),
(7, 2, 'Bangalore, Karnataka'),
(8, 2, 'Chennai, Tamil Nadu'),
(9, 2, 'Hyderabad, Telangana'),
(10, 2, 'Jaipur, Rajasthan'),
(11, 2, 'Lucknow, Uttar Pradesh'),
(12, 2, 'Kanpur, Uttar Pradesh'),
(13, 2, 'Nagpur, Maharashtra'),
(14, 2, 'Indore, Madhya Pradesh'),
(15, 2, 'Bhopal, Madhya Pradesh'),
(16, 2, 'Surat, Gujarat'),
(17, 2, 'Vadodara, Gujarat'),
(18, 3, 'Agra, Uttar Pradesh'),
(19, 3, 'Ludhiana, Punjab'),
(20, 3, 'Nashik, Maharashtra'),
(21, 3, 'Visakhapatnam, Andhra Pradesh'),
(22, 3, 'Rajkot, Gujarat'),
(23, 3, 'Ghaziabad, Uttar Pradesh'),
(24, 3, 'Thane, Maharashtra'),
(25, 3, 'Guwahati, Assam');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(3) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`) VALUES
(1, 'Diploma Degree'),
(2, 'Bachelor\'s Degree'),
(3, 'Master\'s Degree'),
(4, 'Professional Degree'),
(5, 'Doctoral Degree'),
(6, 'Higher Secondary Education'),
(7, 'Undergraduate'),
(8, 'Secondary Education');

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

CREATE TABLE `industry` (
  `id` int(3) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `industry`
--

INSERT INTO `industry` (`id`, `name`) VALUES
(1, 'Accounting/Finance'),
(2, 'Bank/ Non-Bank Fin. Institution'),
(3, 'Supply Chain/ Procurement'),
(4, 'Education/Training'),
(5, 'Engineer/Architects'),
(6, 'Garments/Textile'),
(7, 'HR/Org. Development'),
(8, 'Gen Mgt/Admin'),
(9, 'Design/Creative'),
(10, 'Production/Operation'),
(11, 'Hospitality/ Travel/ Tourism'),
(12, 'Commercial'),
(13, 'Beauty Care/ Health & Fitness'),
(14, 'IT & Telecommunication'),
(15, 'Marketing/Sales'),
(16, 'Customer Service/Call Centre'),
(17, 'Media/Ad./Event Mgt.'),
(18, 'Medical/Pharma'),
(19, 'Agro (Plant/Animal/Fisheries)'),
(20, 'NGO/Development'),
(21, 'Research/Consultancy'),
(22, 'Secretary/Receptionist'),
(23, 'Data Entry/Operator/BPO'),
(24, 'Driving/Motor Technician'),
(25, 'Security/Support Service'),
(26, 'Law/Legal'),
(27, 'Electrician/ Construction/ Repair');

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `id_jobpost` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `jobtitle` text NOT NULL,
  `industry_id` int(11) NOT NULL,
  `job_status` int(11) NOT NULL,
  `description` text NOT NULL,
  `minimumsalary` decimal(10,2) NOT NULL,
  `maximumsalary` decimal(10,2) NOT NULL,
  `state_id` int(3) NOT NULL,
  `city_id` int(3) NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `experience` int(2) NOT NULL,
  `edu_qualification` text NOT NULL,
  `skills_ability` text NOT NULL,
  `responsibility` text NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_type`
--

INSERT INTO `job_type` (`id`, `type`) VALUES
(1, 'Full Time'),
(2, 'Part Time'),
(3, 'Internship');

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobposts`
--

CREATE TABLE `saved_jobposts` (
  `id_saved` int(11) NOT NULL,
  `id_jobpost` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `createdat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `address` text DEFAULT NULL,
  `headline` text DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `city_id` int(3) DEFAULT NULL,
  `state_id` int(3) DEFAULT NULL,
  `contactno` varchar(15) DEFAULT NULL,
  `education_id` int(3) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `active` int(3) DEFAULT 0,
  `aboutme` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `profile_pic` text DEFAULT 'user.png',
  `createdat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `company_reviews`
--
ALTER TABLE `company_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts_or_cities`
--
ALTER TABLE `districts_or_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry`
--
ALTER TABLE `industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id_jobpost`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_jobposts`
--
ALTER TABLE `saved_jobposts`
  ADD PRIMARY KEY (`id_saved`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company_reviews`
--
ALTER TABLE `company_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `industry`
--
ALTER TABLE `industry`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id_jobpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `saved_jobposts`
--
ALTER TABLE `saved_jobposts`
  MODIFY `id_saved` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
