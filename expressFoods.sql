-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2019 at 12:40 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ExpressFood`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `firstname`, `lastname`, `email`, `phone`) VALUES
(1, 'john', 'smith', 'johnsmith@gmail.com', '0098-343-0987'),
(2, 'sarah', 'gilligan', 'sarah.g@gmail.com', '890-345-2376'),
(3, 'jim', 'mcstuffit', 'jmcs@gmail.com', '8780-2342-345'),
(4, 'cliff', 'floyd', 'cliff.f@gmail.com', '9283-0987-3453'),
(5, 'jenny', 'macsavage', 'jenmsavage@yahoo.ie', '980-4533-097');

-- --------------------------------------------------------

--
-- Table structure for table `client_address`
--

CREATE TABLE `client_address` (
  `address_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_address`
--

INSERT INTO `client_address` (`address_id`, `client_id`, `street`, `city`, `postcode`) VALUES
(1, 1, '22 lookout lane', 'dublin', '22'),
(2, 2, '13 trinity gardens', 'dublin', '17'),
(3, 3, '10 casteheany avenue', 'dublin', '15'),
(4, 4, '24 whistlers avenue', 'dublin', '2'),
(5, 5, '19 beehive grove', 'dublin', '11');

-- --------------------------------------------------------

--
-- Table structure for table `client_order`
--

CREATE TABLE `client_order` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_time` time NOT NULL,
  `price` decimal(19,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_order`
--

INSERT INTO `client_order` (`order_id`, `client_id`, `address_id`, `delivery_date`, `delivery_time`, `price`) VALUES
(1, 1, 1, '2019-03-05', '11:15:00', NULL),
(2, 2, 2, '2019-03-20', '18:00:00', NULL),
(3, 3, 3, '2019-03-24', '19:30:00', NULL),
(4, 4, 4, '2019-03-29', '15:45:00', NULL),
(5, 5, 5, '2019-03-03', '01:35:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_driver`
--

CREATE TABLE `delivery_driver` (
  `driver_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_driver`
--

INSERT INTO `delivery_driver` (`driver_id`, `firstname`, `lastname`, `phone`) VALUES
(1, 'danny', 'champion', '0987-3456-098'),
(2, 'jimmy', 'sliders', '678-3452-098');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `dish_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`dish_id`, `name`, `description`, `price`) VALUES
(1, 'apple tart', 'dessert', 5),
(2, 'cherry pie', 'dessert', 3),
(3, 'banoffee pie', 'dessert', 4),
(4, 'banana split', 'dessert', 4),
(5, 'ice-cream sunday', 'dessert', 5),
(6, 'apple crumble', 'dessert', 2),
(7, 'baileys cheese cake', 'dessert', 5),
(8, 'coffee slice', 'dessert', 4),
(9, 'jelly and ice-cream', 'dessert', 2),
(10, 'green tea cake', 'dessert', 6),
(11, 'strawberry ice-cream', 'dessert', 3),
(12, 'chef''s choice pudding', 'dessert', 5),
(13, 'caramel dream', 'dessert', 6),
(14, 'chocolate brownie', 'dessert', 4),
(15, 'Big burger and chips', 'main', 10),
(16, 'cod with peas and carrots', 'main', 12),
(17, 'shepherds pie', 'main', 6),
(18, 'pizza margarita', 'main', 9),
(19, 'mighty meaty pizza', 'main', 13),
(20, 'chilli con carne', 'main', 9),
(21, 'chilli sin carne', 'main', 8),
(22, 'lasagne and chips', 'main', 13),
(23, 'Sunday roast', 'main', 10),
(24, 'vegetarian kebab', 'main', 8),
(25, 'vegetarian burger and chips', 'main', 11),
(26, 'batter sausage with wedges', 'main', 5),
(27, 'batter burger with wedges', 'main', 7),
(28, 'tortilla special', 'main', 14),
(29, 'sushi plate', 'main', 16),
(30, 'lemon sorbet', 'dessert', 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `dish_id`, `quantity`, `price`) VALUES
(1, 4, 2, NULL),
(1, 20, 2, NULL),
(2, 2, 2, NULL),
(2, 27, 2, NULL),
(3, 10, 1, NULL),
(3, 18, 1, NULL),
(4, 9, 1, NULL),
(4, 27, 1, NULL),
(5, 11, 2, NULL),
(5, 29, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `client_address`
--
ALTER TABLE `client_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `client_order`
--
ALTER TABLE `client_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `delivery_driver`
--
ALTER TABLE `delivery_driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`dish_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_address`
--
ALTER TABLE `client_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_order`
--
ALTER TABLE `client_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `delivery_driver`
--
ALTER TABLE `delivery_driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `dish_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_address`
--
ALTER TABLE `client_address`
  ADD CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `client_order`
--
ALTER TABLE `client_order`
  ADD CONSTRAINT `client_order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `client_address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `client_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `menu_items` (`dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
