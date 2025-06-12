-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2024 at 11:18 AM
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
-- Database: `vexmacloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `default_value` varchar(200) DEFAULT NULL,
  `is_required` varchar(20) DEFAULT '0',
  `show_attribute` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `uuid`, `name`, `type`, `default_value`, `is_required`, `show_attribute`, `created_at`, `updated_at`) VALUES
(1, 'b6ca493c-3144-42d7-bb39-a0e9ce2a5519', 'Wight', 'text', 'null', 'true', 1, '2024-11-13 07:31:48', '2024-11-13 07:31:48'),
(2, '6b88ec4b-5833-4685-b606-4310a55e919a', 'Fusing Agent', 'text', 'null', 'true', 1, '2024-11-13 07:33:15', '2024-11-13 07:33:15'),
(3, 'e69fc5a3-17da-4992-9821-8efb1533eee0', 'Detailing Agent', 'text', 'null', 'true', 1, '2024-11-13 07:33:59', '2024-11-13 07:33:59'),
(4, 'c515062d-1d72-4f1e-85ae-9ed3328e02b0', 'Paint', 'text', 'null', 'true', 1, '2024-11-13 08:17:31', '2024-11-13 08:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_docs`
--

CREATE TABLE `client_docs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `column_spec`
--

CREATE TABLE `column_spec` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `column_name` text DEFAULT NULL,
  `lable` text DEFAULT NULL,
  `column_type` text DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `nullable` tinyint(1) DEFAULT NULL,
  `index` tinyint(1) DEFAULT NULL,
  `data_table_name` text DEFAULT NULL,
  `show_in_listing` text DEFAULT NULL,
  `show_in_form` text DEFAULT NULL,
  `form_input_type` text DEFAULT NULL,
  `form_drop_down_list` varchar(191) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `show_if` text DEFAULT NULL,
  `list_from` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `column_position` int(11) DEFAULT NULL,
  `column_position_listing` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `column_spec`
--

INSERT INTO `column_spec` (`id`, `uuid`, `column_name`, `lable`, `column_type`, `length`, `nullable`, `index`, `data_table_name`, `show_in_listing`, `show_in_form`, `form_input_type`, `form_drop_down_list`, `required`, `show_if`, `list_from`, `created_at`, `updated_at`, `column_position`, `column_position_listing`, `type`) VALUES
(21, '16a1c623-c783-417c-b0f9-69e785819cb2', 'type', 'Type ', 'text', NULL, 1, 0, 'column_spec', '1', '1', 'select', 'Attribute,QC Attribute,General ', 1, NULL, NULL, '2024-10-26 07:52:05', '2024-10-26 07:52:05', 0, 0, 'Attribute'),
(22, '69e08625-df23-43bd-8e13-6d6b6ac6423c', 'column_name', 'Column Name', 'text', NULL, 1, 0, 'column_spec', '1', '1', 'text', NULL, NULL, NULL, '', '2024-07-04 11:13:08', '2024-07-04 11:13:08', 1, NULL, NULL),
(23, '5a86e83e-d034-43c5-a58a-6755f7b6e32a', 'lable', 'Lable', 'text', NULL, 1, 0, 'column_spec', '1', '1', 'text', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 7, NULL, NULL),
(24, '4c7f7edf-d4e1-4a4e-a102-ce992a6c2011', 'column_type', 'Column Type', 'text', NULL, 1, 0, 'column_spec', '1', '1', 'select', 'number,varchar,string,integer,text,unsignedbigInteger,bigInteger,tinyInt,boolean,decimal,timestamp,dateTime,enum', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 2, NULL, NULL),
(25, '08111c7e-47a6-4428-bcbd-0b3033c67ca9', 'length', 'Length', 'integer', 11, 1, 0, 'column_spec', '0', '1', 'number', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 3, NULL, NULL),
(26, 'a9af165e-c08e-4970-b2d4-69bf78da7686', 'nullable', 'Nullable', 'tinyint', 1, 1, 0, 'column_spec', '0', '1', 'check_box', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 4, NULL, NULL),
(27, 'c372d720-8563-4658-8ff2-79af173df8d0', 'index', 'Index', 'tinyint', 1, 1, 0, 'column_spec', '0', '1', 'check_box', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 5, NULL, NULL),
(28, 'be107943-c308-43e8-a50b-1dfde30e33fc', 'data_table_name', 'Data Table Name', 'text', NULL, 1, 0, 'column_spec', '1', '1', 'select', '', NULL, NULL, 'get-table-list', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 6, NULL, NULL),
(29, '7fe86fb1-b7a8-4ac1-bdb0-13ef12cfb547', 'show_in_listing', 'Show in Listing', 'tinyint', 1, 1, 0, 'column_spec', '1', '1', 'check_box', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 7, NULL, NULL),
(30, '52a2c6e0-a901-44e4-ad60-c7526fd1d338', 'show_in_form', 'Show in Form', 'tinyint', 1, 1, 0, 'column_spec', '1', '1', 'check_box', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 8, NULL, NULL),
(31, '4ea15e81-1547-40cb-82f6-cb0e97cca85c', 'form_input_type', 'Form Input Type', 'text', NULL, 1, 0, 'column_spec', '0', '1', 'select', 'text,number,varchar,textarea,check_box,select,timestamp,dateTime', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 9, NULL, NULL),
(32, '4096c27b-5891-4f62-ab0c-f6ff6777a09a', 'form_drop_down_list', 'Form Dropdown List', 'varchar', 191, 1, 0, 'column_spec', '0', '1', 'text', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 10, NULL, NULL),
(33, '5f9b5d74-1ff5-4ba5-ad5a-50639b3766ef', 'list_from', 'List From', 'text', NULL, 1, 0, 'column_spec', '0', '1', 'select', '', NULL, NULL, '', '2024-07-04 11:30:17', '2024-07-04 11:30:17', 11, NULL, NULL),
(106, 'df0e54ab-de2a-443e-b45a-38971eebe50f', 'description', 'Description', 'string', NULL, 1, NULL, 'work_flow2', '1', '1', 'textarea', NULL, NULL, NULL, NULL, '2024-07-14 23:16:04', '2024-07-14 23:16:04', 3, 3, NULL),
(115, '640c9570-7026-49bf-af31-7a4c510a842c', 'name', 'Name', 'text', NULL, 1, NULL, 'work_flow', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-14 23:17:22', '2024-07-14 23:17:22', 1, 1, NULL),
(121, 'bd006a9f-bd80-447a-8faf-e0204e6010a2', 'stage_no', 'Stage No.', 'integer', 11, 1, NULL, 'work_flow2', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-07-14 23:31:18', '2024-07-14 23:31:18', 0, 0, NULL),
(123, '3d3be924-c263-4ade-928c-478df93f35b8', 'work_flow_id', 'Work Flow Id', 'text', NULL, 1, NULL, 'work_flow', '1', '0', 'text', NULL, NULL, NULL, NULL, '2024-07-14 23:31:19', '2024-07-14 23:31:19', 0, 0, NULL),
(124, 'c9196884-9686-4ce6-a909-5078f92f45c3', 'process_uuid', 'Process', 'text', NULL, 1, 1, 'work_flow2', '1', '1', 'select', NULL, NULL, NULL, 'all-process', '2024-07-14 23:37:08', '2024-07-14 23:37:08', 1, 1, NULL),
(125, 'f53c05ed-e5e4-4919-be20-174c60b33e45', 'name', 'Process Name', 'text', 100, 1, 0, 'process', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-15 08:44:20', '2024-07-15 08:44:20', 0, NULL, NULL),
(126, '8350dc06-df55-485c-8d7a-a6f084d3c50a', 'show_if', 'Show If', 'text', 1, 1, NULL, 'column_spec', '', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-15 04:06:02', '2024-07-15 04:06:02', 12, NULL, NULL),
(127, '2fcd0212-f233-400f-b4f6-49020e84d0e4', 'required', 'Required', 'tinyint', 1, 1, NULL, 'column_spec', '', '1', 'check_box', NULL, NULL, NULL, NULL, '2024-07-15 04:06:02', '2024-07-15 04:06:02', 13, NULL, NULL),
(229, '5aed3ccc-e61a-499a-b551-bee200ba7ce8', 'batch_order_parts', 'Part Name', 'varchar', 100, 1, 1, 'order_plan2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-07-16 00:18:30', '2024-07-16 00:18:30', 1, 1, NULL),
(248, 'afba0968-422f-4c4c-899c-a7468afabc77', 'inward_uuid', 'Machine Id', 'text', NULL, 1, NULL, 'print', NULL, '1', 'select', NULL, 1, NULL, 'machineData+all-machines', '2024-07-17 03:35:46', '2024-07-17 03:35:46', 6, 6, NULL),
(249, '7d525efc-0a51-4dcf-a525-1fb89308fe5d', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'print', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-07-17 03:35:46', '2024-07-17 03:35:46', 2, 2, NULL),
(250, 'e76c7955-4b53-4a38-ab46-108568b66773', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'print', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-07-17 03:35:46', '2024-07-17 03:35:46', 3, 3, NULL),
(252, '1cc20a49-f973-4123-9d58-2675af6ea416', 'total_hrs', 'Total Time', 'integer', NULL, 1, NULL, 'print', '1', '0', 'number', NULL, NULL, NULL, NULL, '2024-07-17 04:08:14', '2024-07-17 04:08:14', 5, 5, NULL),
(253, '42ba25c2-cee3-4632-abb8-98dd497bd956', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'print', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-17 04:08:15', '2024-07-17 04:08:15', 7, 7, NULL),
(254, 'fd3760e8-506c-49b3-9728-a5882fc248f6', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'print', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-07-17 04:08:15', '2024-07-17 04:08:15', 8, 4, NULL),
(255, '31e50115-44aa-4a8e-939e-29356d459ced', 'total_part_cc', 'Dimension', 'integer', NULL, 1, NULL, 'print', '0', '0', 'number', NULL, NULL, NULL, NULL, '2024-07-17 04:08:15', '2024-07-17 04:08:15', 9, 9, NULL),
(256, 'b5730d61-3fb5-4e33-ba9e-10186ad77129', 'assigned_to', 'Assigned To', 'text', NULL, 1, NULL, 'print', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-07-17 04:08:15', '2024-07-17 04:08:15', 10, 10, NULL),
(272, 'df0ec379-5acf-4b9a-a9a1-6f27c0942251', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'print2', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-07-17 05:56:17', '2024-07-17 05:56:17', 1, NULL, 'General'),
(273, '050c54ba-7f5c-49d8-8b64-ae7d06f2eb46', 'parent_uuid', 'OP Id', 'varchar', 50, 1, 1, 'print2', NULL, NULL, 'select', NULL, 1, NULL, NULL, '2024-07-17 05:57:09', '2024-07-17 05:57:09', 2, NULL, 'General'),
(275, '326a24dc-3bd0-46ac-b26d-9fa9b98041b7', 'batch_uuid', 'Batch Id', 'varchar', NULL, 1, 1, 'print2', NULL, '1', 'select', NULL, 1, NULL, 'all/OrderPlan', '2024-07-17 05:57:09', '2024-07-17 05:57:09', 3, NULL, 'General'),
(276, '355da600-9999-4b98-8786-8d1b04841d94', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'print2', NULL, '1', 'select', NULL, 1, NULL, 'all/OrderPlan2', '2024-07-17 05:57:10', '2024-07-17 05:57:10', 4, NULL, 'General'),
(277, '68140dd2-d0d2-4ab8-a7d5-6e1e8431fc53', 'qty', 'Processed Qty', 'integer', NULL, 1, NULL, 'print2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-07-17 05:57:10', '2024-07-17 05:57:10', 5, NULL, NULL),
(278, '97bbeba1-2f86-4b5e-8de7-031032d93649', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'print2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-07-17 05:57:10', '2024-07-17 05:57:10', 6, NULL, NULL),
(279, '2401d36b-eaf5-4471-9ae3-596bcf46171f', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'print2', '1', '1', 'select', 'Pass, Fail', 1, NULL, NULL, '2024-07-17 05:57:10', '2024-07-17 05:57:10', 7, NULL, NULL),
(280, 'd8258138-63e8-412b-adb2-cef2447bda23', 'actual_weight', 'Actual Part Weight (Gm)', 'text', NULL, 1, NULL, 'print2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-07-17 05:57:11', '2024-07-17 05:57:11', 8, NULL, NULL),
(281, '16390475-7a39-4b34-9e6b-331164422274', 'failure_reason', 'Reason For Part Failure', 'text', 200, 1, NULL, 'print2', '0', '0', 'text', NULL, 1, NULL, NULL, '2024-07-17 22:44:51', '2024-07-17 22:44:51', 9, NULL, 'General'),
(282, '6278a412-3454-434d-b622-a1bd6d27bba7', 'column_position', 'Input Filed Number in Form', 'integer', 11, NULL, NULL, 'column_spec', NULL, '1', 'number', NULL, 1, NULL, NULL, '2024-07-17 22:55:48', '2024-07-17 22:55:48', 0, NULL, NULL),
(288, '83ad2c7e-8f41-4b5c-b872-fb2ebf8f1d62', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'post_process', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology', '2024-07-17 23:30:02', '2024-07-17 23:30:02', 1, NULL, NULL),
(291, '2ae4421f-bba9-4eb5-b27e-2deb6b2e73de', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'post_process', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-07-17 23:30:03', '2024-07-17 23:30:03', 4, NULL, NULL),
(292, '5dbf6230-e163-4a33-aae8-1d0ef1560801', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'post_process', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-07-17 23:30:03', '2024-07-17 23:30:03', 5, NULL, NULL),
(293, '3c173c11-8fd9-42fe-8434-fa475fb8ec97', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'post_process', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-07-17 23:30:04', '2024-07-17 23:30:04', 6, NULL, NULL),
(294, 'b274dc6b-4a6d-4456-82b7-548f6e8246b1', 'assigned_by', 'Assigned By', 'varchar', NULL, 1, 1, 'post_process', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-07-17 23:30:04', '2024-07-17 23:30:04', 7, NULL, NULL),
(295, 'adc9d050-8fb4-44ce-8298-ce68d5743dfa', 'total_hrs', 'Total Hours', 'number', NULL, 1, NULL, 'post_process', '1', '0', 'number', NULL, NULL, NULL, NULL, '2024-07-17 23:30:04', '2024-07-17 23:30:04', 8, NULL, NULL),
(298, 'd47e5911-c2fd-4d22-8cc3-dbc772c5db32', 'op_id', 'OP Id', 'varchar', 50, 1, 0, 'post_process', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-17 23:34:25', '2024-07-17 23:34:25', 0, NULL, NULL),
(299, '84de3bc9-a2f2-4653-bff3-98458440efff', 'parent_uuid', 'OP Id', 'varchar', 50, 1, 1, 'post_process2', '0', '0', NULL, NULL, 1, NULL, NULL, '2024-07-17 23:45:43', '2024-07-17 23:45:43', 0, NULL, NULL),
(300, 'bdec9811-79fb-463a-b82f-f983f811259b', 'part_uuid', 'Part Name', 'varchar', 50, 1, 1, 'post_process2', '1', '1', 'select', NULL, 1, NULL, 'all/OrderPlan2', '2024-07-17 23:45:43', '2024-07-17 23:45:43', 2, NULL, NULL),
(301, '452ff1d5-2d61-42d1-b72d-88fa78e05e09', 'qty', 'Processed Qty', 'integer', 50, 1, NULL, 'post_process2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-07-17 23:45:44', '2024-07-17 23:45:44', 3, NULL, NULL),
(304, '5c80f61f-924e-4e6a-9988-93322d21c30b', 'difference_weight', 'Difference', 'integer', 50, 1, NULL, 'post_process2', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-07-17 23:45:45', '2024-07-17 23:45:45', 6, NULL, NULL),
(305, '4f9e4ca6-b531-4fe0-8ca3-5beeeabf7e54', 'part_status', 'Part Status', 'varchar', 50, 1, NULL, 'post_process2', '1', '1', 'select', 'Pass,Fail', 1, NULL, NULL, '2024-07-17 23:45:45', '2024-07-17 23:45:45', 7, NULL, NULL),
(306, '5862773e-0ac0-4684-92ea-699170443b4b', 'failed_qty', 'Failed Qty', 'integer', 50, 1, NULL, 'post_process2', '1', '1', 'number', NULL, 0, NULL, NULL, '2024-07-17 23:45:45', '2024-07-17 23:45:45', 8, NULL, NULL),
(307, '986ecd8b-a9ef-4d6b-a8c0-3558ea63f147', 'failure_reason', 'Failure Reason', 'text', 50, 1, NULL, 'post_process2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-07-17 23:45:46', '2024-07-17 23:45:46', 9, NULL, NULL),
(308, '3e602a9e-9437-46fc-a589-201926e53403', 'assigned_to', 'Assigned To', 'varchar', 50, 1, 1, 'post_process2', '1', '1', 'select', NULL, 0, NULL, 'employeeData+all-employees', '2024-07-17 23:45:46', '2024-07-17 23:45:46', 10, NULL, NULL),
(309, '0f47d557-0eb9-41a0-b25c-53d710001482', 'column_position_listing', 'Listing Column Number', 'integer', 11, 1, NULL, 'column_spec', NULL, '1', 'number', NULL, 1, NULL, NULL, '2024-07-18 04:27:50', '2024-07-18 04:27:50', 16, NULL, NULL),
(310, 'dadb3fa0-5b3d-489c-9c41-75518640917c', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'quality_check', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-07-18 04:46:55', '2024-07-18 04:46:55', 2, 2, NULL),
(311, 'eb8319cf-bc8f-463b-93fa-3bb06c53d898', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'quality_check2', '1', '1', 'select', NULL, 1, NULL, 'all/OrderPlan2', '2024-07-18 04:46:55', '2024-07-18 04:46:55', 2, 2, NULL),
(312, '9703a41f-657a-406b-925f-4856519f3912', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'quality_check', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology', '2024-07-18 04:46:55', '2024-07-18 04:46:55', 1, 3, NULL),
(313, 'b670d02d-ebf2-4df1-9d86-d36a005b2651', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'quality_check', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-07-18 04:46:56', '2024-07-18 04:46:56', 3, 4, NULL),
(314, '276d7afc-6a9b-40ad-b828-5126690d9435', 'start_time', 'Start Time', 'date', NULL, 1, NULL, 'quality_check', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-07-18 04:46:56', '2024-07-18 04:46:56', 4, 5, NULL),
(315, 'db238109-413e-4259-8f6e-6750e8c131d3', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'quality_check', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-07-18 04:46:56', '2024-07-18 04:46:56', 5, 6, NULL),
(316, '605be429-37fc-4273-94bf-650c0f57cfd4', 'parent_uuid', 'OP Id', 'varchar', NULL, 1, 1, 'quality_check2', '1', '0', 'text', NULL, 1, NULL, NULL, '2024-07-18 04:46:57', '2024-07-18 04:46:57', 1, 1, NULL),
(317, '13cf58f2-f4be-4ce8-825a-57a88fb1fbf0', 'qty', 'Processed Qty', 'integer', NULL, 1, NULL, 'quality_check2', '0', '1', 'number', NULL, NULL, NULL, NULL, '2024-07-18 04:46:57', '2024-07-18 04:46:57', 3, 3, NULL),
(318, '566122f6-780d-4166-9f4f-0c215bd87a62', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, 0, 'quality_check2', NULL, '1', 'number', '', NULL, NULL, NULL, '2024-07-18 04:46:57', '2024-07-18 04:46:57', 4, 4, NULL),
(320, '58152077-90e5-4438-98d3-8c5e6bc99ea6', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'work_flow', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology', '2024-07-22 01:31:11', '2024-07-22 01:31:11', 2, 2, NULL),
(321, '3c2e6613-ab3a-445e-9e25-aab266b89201', 'work_flow_uuid', 'Work FLow Id', 'varchar', 50, 1, 1, 'work_flow_rules', '1', '1', 'select', NULL, 1, NULL, 'all/WorkFlow', '2024-07-22 02:14:07', '2024-07-22 02:14:07', 1, 1, NULL),
(322, 'cd5e1599-dc78-4ef4-b5b6-72028af33bdb', 'work_flow2_uuid', 'Stage Name', 'varchar', NULL, 1, 1, 'work_flow_rules', '1', '1', 'select', NULL, 1, NULL, 'all/WorkFlow2', '2024-07-22 02:14:07', '2024-07-22 02:14:07', 2, 2, NULL),
(323, '3c333f22-5f07-4853-8d18-d77f8014adec', 'rule', 'Rule to be followed', 'text', NULL, 1, NULL, 'work_flow_rules', '1', '1', 'text', NULL, 1, NULL, NULL, '2024-07-22 02:14:08', '2024-07-22 02:14:08', 3, 3, NULL),
(324, '65afa772-c4ef-4c68-a2eb-c0c5f6b9455c', 'rule_status', 'Activate This Rule..?', 'tinyInt', NULL, 1, NULL, 'work_flow_rules', '', '1', 'check_box', NULL, 1, NULL, NULL, '2024-07-22 02:14:08', '2024-07-22 02:14:08', 4, 4, NULL),
(325, 'fec5c9e4-0205-4721-9882-21059bb662f3', 'order_uuid', 'Order Id', 'varchar', 99, 1, 1, 'pre_audit', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-08-05 01:24:41', '2024-08-05 01:24:41', 0, 1, NULL),
(326, 'f5101e7d-49d8-4eb6-a7a6-bb49a405bc02', 'audit_id', 'Pre Audit  ID', 'varchar', NULL, 1, NULL, 'pre_audit', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-05 01:24:41', '2024-08-05 01:24:41', 1, 0, NULL),
(329, 'a649e0e5-534b-4e3d-8ae4-e468e4e649d0', 'batch_id', 'Batch Id', 'text', NULL, 1, 1, 'order_plan', '1', '0', 'text', NULL, NULL, NULL, NULL, '2024-08-05 03:31:28', '2024-08-05 03:31:28', 2, 2, NULL),
(330, 'f4cb3cb2-13db-4de0-9585-04a86586fc0b', 'order_uuid', 'Order Id', 'text', NULL, 1, 1, 'order_plan', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-08-05 03:31:49', '2024-08-05 03:31:49', 1, 1, NULL),
(331, '3e873f0f-7494-4a95-af2c-37a61712f148', 'batch_total_qty', 'Total Part Qty', 'int', 11, 1, NULL, 'order_plan', '1', '0', 'int', NULL, NULL, NULL, NULL, '2024-08-05 03:31:51', '2024-08-05 03:31:51', 0, 8, NULL),
(332, 'f3eb36bd-261e-42df-8f7d-0469a76d7419', 'batch_status', 'Status', 'varchar', NULL, 1, 1, 'order_plan', '1', '1', 'select', NULL, 1, NULL, 'order-status', '2024-08-05 03:31:57', '2024-08-05 03:31:57', 2, 2, NULL),
(333, 'a7c08c16-5538-42cd-b6ae-8a72d6f34fe5', 'batch_part_list', 'Part List', 'text', NULL, 1, NULL, 'order_plan', '0', '1', 'select', NULL, 1, NULL, NULL, '2024-08-05 03:31:57', '2024-08-05 03:31:57', 4, 3, NULL),
(338, '6fd1f11d-a4b6-4bb5-8d97-3497ccfd9e6a', 'start_date', 'Start Date', 'date', NULL, 1, NULL, 'order_plan', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-08-05 03:39:42', '2024-08-05 03:39:42', 3, 4, NULL),
(339, '6c88a746-a921-4833-bef1-38a204f0c582', 'end_date', 'Exp. Ship Date', 'date', NULL, 1, NULL, 'order_plan', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-08-05 03:39:42', '2024-08-05 03:39:42', 5, 5, NULL),
(340, 'f4e7ec2c-9dd3-43ae-916c-8638da0cf681', 'part_list_uuid', 'Part UUID', 'varchar', 99, 1, 1, 'order_plan2', '0', '0', 'select', NULL, 1, NULL, '', '2024-08-05 04:39:53', '2024-08-05 04:39:53', 0, NULL, NULL),
(341, 'b46aa167-d87c-4e61-9d5b-b518072de556', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'order_plan2', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-08-05 04:39:53', '2024-08-05 04:39:53', 2, 2, NULL),
(342, '58f004ea-e468-44a0-aab0-4b9a02a64390', 'parent_uuid', 'Batch Id', 'varchar', NULL, 1, 1, 'order_plan2', '1', '0', 'select', 'order_plan', 1, NULL, NULL, '2024-08-05 04:39:54', '2024-08-05 04:39:54', 3, 0, NULL),
(343, '7c625c88-a011-4c14-93b5-97cdf054d3fd', 'part_qty', 'Part Qty', 'integer', NULL, 1, NULL, 'order_plan2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-08-05 04:39:54', '2024-08-05 04:39:54', 4, 3, NULL),
(344, '7584eda7-27a5-499f-8b3a-1ab184b81b1d', 'work_flow_uuid', 'Work Flow', 'varchar', 99, 1, 1, 'order_plan', NULL, '1', 'select', NULL, 1, NULL, 'all/WorkFlow', '2024-08-07 21:47:40', '2024-08-07 21:47:40', 6, 6, NULL),
(345, '21f3feef-11e0-4df8-99aa-daa9f546b1ce', 'work_flow2_uuid', 'Work Flow Stages', 'text', NULL, 1, 1, 'order_plan', '1', '1', 'select', NULL, 1, NULL, NULL, '2024-08-07 21:47:40', '2024-08-07 21:47:40', 7, 7, NULL),
(346, '34bedc5d-a6e7-4d83-8443-62f3bc319a09', 'upcoming_process', 'Next Stage', 'varchar', 99, 1, 1, 'order_plan2', '1', '0', NULL, NULL, NULL, NULL, NULL, '2024-08-08 03:29:49', '2024-08-08 03:29:49', 5, 5, NULL),
(347, '509f28f5-91ea-4db4-b149-287f2a3c9357', 'current_process', 'Current Stage', 'varchar', NULL, 1, 1, 'order_plan2', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-08 03:29:49', '2024-08-08 03:29:49', 6, 6, NULL),
(348, '95d0f0cb-b54b-4458-9376-710ae8b49c3a', 'data_table_name', 'Data Table', 'varchar', 99, 1, 1, 'process', '0', '0', 'select', NULL, 1, NULL, 'get-table-list', '2024-08-08 04:35:42', '2024-08-08 04:35:42', 2, NULL, NULL),
(350, '13091e4f-bc02-4b4d-b18f-86563fa29933', 'current_stage', 'Current Stage', 'varchar', 99, 1, 1, 'order_plan', '1', NULL, NULL, NULL, 0, NULL, NULL, '2024-08-09 22:20:11', '2024-08-09 22:20:11', 10, 10, NULL),
(351, 'b164e1a5-bac0-486d-924c-535dddf0ed3a', 'order_plan_uuid', 'Batch Id', 'text', NULL, 1, 1, 'print_plan', '1', '1', 'select', NULL, NULL, NULL, 'all/PrintPlan/getInline', '2024-08-12 02:29:24', '2024-08-12 02:29:24', 1, 1, NULL),
(352, '1560fac2-c18b-4632-9198-cf5f9f19d5d8', 'order_plan2_uuid', 'Batch Parts', 'text', NULL, 1, 0, 'print_plan', '1', '1', 'select', NULL, 1, NULL, 'all/PrintPlan2/getInline', '2024-08-12 02:29:25', '2024-08-12 02:29:25', 2, 2, NULL),
(353, '5421597c-2fd6-409d-afd1-f58fbcd5e84e', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'print_plan', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology', '2024-08-12 02:29:25', '2024-08-12 02:29:25', 0, 0, NULL),
(354, '1de43e9f-038b-44c3-be06-06181b0d5ccc', 'op_id', 'Plan Id', 'varchar', NULL, 1, 1, 'print_plan', '1', '0', 'text', NULL, 1, NULL, NULL, '2024-08-12 02:29:25', '2024-08-12 02:29:25', 3, 3, NULL),
(355, 'f0ab1c6b-674e-460f-895c-948d7dd72cd2', 'parent_uuid', 'Plan Id', 'varchar', 99, 1, 1, 'print_plan2', '1', '0', 'text', NULL, 1, NULL, NULL, '2024-08-12 02:36:13', '2024-08-12 02:36:13', 0, 0, NULL),
(356, 'aeee31c4-281a-464d-80d3-e9d9a09a5969', 'part_uuid', 'Batch Part', 'varchar', NULL, 1, 1, 'print_plan2', '1', '1', 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-08-12 02:36:13', '2024-08-12 02:36:13', 1, 1, NULL),
(357, 'a1e6ad59-a77e-4101-9009-9bf131bd18bd', 'qty', 'Plan Qty', 'integer', NULL, 1, NULL, 'print_plan2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-08-12 02:36:13', '2024-08-12 02:36:13', 2, 2, NULL),
(358, '4ac38dac-3323-46b7-b58c-77dc9a4d0cce', 'total_plan_qty', 'Total Plan Qty', 'integer', NULL, 1, NULL, 'print_plan', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-08-12 02:36:14', '2024-08-12 02:36:14', 4, 4, NULL),
(360, 'fab33be7-2633-4e71-b621-ce686bb04bce', 'assigned_by', 'Assigned By', 'varchar', 99, 1, 1, 'order_plan', '0', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-08-17 03:42:41', '2024-08-17 03:42:41', 12, 12, NULL),
(361, '190a858c-caab-43d0-9c07-a979a8ed5c94', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'order_plan', '0', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-08-17 03:42:42', '2024-08-17 03:42:42', 13, 13, NULL),
(362, 'e493df33-520c-4555-aae1-0ca48e104957', 'assigned_by', 'Assigned By', 'varchar', 99, 1, 1, 'print_plan', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-08-19 23:43:58', '2024-08-19 23:43:58', 5, 5, NULL),
(363, '2a79e104-b4fb-4eac-a576-9fee3e71082c', 'assigned_to', 'Assigned To', 'varchar', 99, 1, 1, 'print_plan', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-08-19 23:43:58', '2024-08-19 23:43:58', 6, 6, NULL),
(364, 'aabf8781-270d-49e1-a236-c7557162d905', 'op_id', 'OP Id', 'varchar', 50, 1, NULL, 'quality_check', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-09-12 00:52:30', '2024-09-12 00:52:30', 8, 2, NULL),
(365, '33b7eabf-9e07-4a7e-ad2f-c42e9e3889ce', 'op_id', 'OP Id', 'varchar', 50, 1, NULL, 'print', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-09-12 00:57:59', '2024-09-12 00:57:59', 10, 1, NULL),
(376, '8023a224-0e79-4ce0-a489-177a46f46d56', 'op1_uuid', 'Operation No. 1', 'varchar', 50, 1, 1, 'qc_verify', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-09-17 21:54:02', '2024-09-17 21:54:02', 1, 2, NULL),
(377, '99acc45d-d6e4-42e8-98ca-f5002535f0d9', 'op1_date', 'OP1 Date', 'dateTime', NULL, 1, NULL, 'qc_verify', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-17 21:54:03', '2024-09-17 21:54:03', 2, 3, NULL),
(378, '00315e16-bd76-4b26-93b0-bcda9ecdbbfa', 'op2_uuid', 'Operation No. 2', 'varchar', NULL, 1, 1, 'qc_verify', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-09-17 21:54:03', '2024-09-17 21:54:03', 3, 4, NULL),
(379, '7175da59-e61e-4373-bae7-86ae22acfb63', 'op2_date', 'OP2 Date', 'dateTime', NULL, 1, NULL, 'qc_verify', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-17 21:54:03', '2024-09-17 21:54:03', 4, 5, NULL),
(380, 'b8170eb2-d3cf-4529-b95a-f8365b287fb4', 'op3_uuid', 'Operation No. 3', 'varchar', NULL, 1, 1, 'qc_verify', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-09-17 21:54:04', '2024-09-17 21:54:04', 5, 6, NULL),
(381, 'b7170b4c-40b7-4894-ba84-4dc4a75665f1', 'op3_date', 'OP3 Date', 'dateTime', NULL, 1, NULL, 'qc_verify', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-17 21:54:04', '2024-09-17 21:54:04', 6, 7, NULL),
(382, '34af45a4-d553-4e21-a1fd-6a6fff801c16', 'qc_by', 'QC Verify By', 'varchar', 50, 1, 1, 'print2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-09-21 01:06:45', '2024-09-21 01:06:45', 10, 6, 'qc_attribute'),
(383, '7c80ce98-692e-47dc-8c77-92649dacacfa', 'qc_attribute', 'Attribute', 'varchar', NULL, 1, NULL, 'print2', NULL, '1', 'select', 'Width,Length,Thickness,Hole Diameter,# Holes', 1, NULL, NULL, '2024-09-21 01:06:45', '2024-09-21 01:06:45', 11, 7, 'qc_attribute'),
(384, 'd005452a-26fb-4ab3-b245-43f5ff5c37e7', 'qc_measure', 'Measured Dimension', 'integer', NULL, 1, NULL, 'print2', NULL, '1', 'number', NULL, 1, NULL, NULL, '2024-09-21 01:06:46', '2024-09-21 01:06:46', 12, 8, 'qc_attribute'),
(385, 'c466406f-c35e-4fb9-860f-81d77f55781b', 'qc_remark', 'Remarks by QC', 'text', NULL, 1, NULL, 'print2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-09-21 05:13:08', '2024-09-21 05:13:08', 14, 9, 'qc_attribute'),
(386, 'da86ae8f-1fbc-49ff-9375-38e137c5584c', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'post_process2', NULL, '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-09-21 23:16:19', '2024-09-21 23:16:19', 13, 4, NULL),
(387, 'a91ef0a6-5f49-4fa4-b83b-db75f2976e41', 'qc_attribute', 'Attribute', 'varchar', 50, 1, NULL, 'post_process2', '1', '1', 'select', 'Length,Width,Thickness,Hole Diameter,# Holes', NULL, NULL, NULL, '2024-09-21 23:16:19', '2024-09-21 23:16:19', 14, 6, 'qc_attribute'),
(388, '19179fa9-1e03-479b-8a45-8da318259c04', 'qc_measure', 'Measured Value', 'integer', 50, 1, NULL, 'post_process2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-09-21 23:16:19', '2024-09-21 23:16:19', 15, 7, 'qc_attribute'),
(389, '1facb137-31cb-4fb3-8c72-42c7003815bf', 'qc_by', 'QC Verify By', 'varchar', 50, 1, 1, 'post_process2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-09-21 23:16:20', '2024-09-21 23:16:20', 16, 8, 'qc_attribute'),
(390, '8a7c5069-986a-460c-9c5b-7d5fcdb5501a', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'quality_check2', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-09-22 01:40:41', '2024-09-22 01:40:41', 6, 4, NULL),
(391, '7b413df8-54e6-41d1-a32e-be84873e5c87', 'qc_attribute', 'Attribute', 'text', NULL, 1, NULL, 'quality_check2', '1', '1', 'select', 'Length,Width,Thickness,Hole Diameter,# Holes', 1, NULL, NULL, '2024-09-22 01:40:41', '2024-09-22 01:40:41', 7, 6, 'qc_attribute'),
(392, '5e7b9a58-6080-48a3-a9e9-de50f212b962', 'qc_measure', 'Measured Value', 'integer', NULL, 1, NULL, 'quality_check2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-09-22 01:40:41', '2024-09-22 01:40:41', 8, 7, 'qc_attribute'),
(393, '6ba5af15-6dbf-4d31-8174-83813c35e0fc', 'qc_by', 'QC Verify By', 'varchar', NULL, 1, 1, 'quality_check2', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-09-22 01:40:41', '2024-09-22 01:40:41', 9, 8, 'qc_attribute'),
(394, 'dfdbb725-df5b-4d5b-a896-65e278d5b49a', 'qc_qty', 'Qty', 'integer', 11, 1, NULL, 'quality_check2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-09-22 22:34:43', '2024-09-22 22:34:43', 10, 5, 'qc_attribute'),
(395, '9a1763fd-788a-4812-aedb-f3d8c8c0e6de', 'qc_remark', 'Add Note', 'text', NULL, 1, NULL, 'quality_check2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-09-22 23:26:03', '2024-09-22 23:26:03', 11, 10, 'qc_attribute'),
(396, '4c1c6d4f-37fe-4f75-a28e-d8232a28cd69', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'print2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-23 22:49:49', '2024-09-23 22:49:49', 14, 8, 'qc_attribute'),
(397, 'de105ea6-ff72-422d-80e6-869358c28815', 'qc_date', 'QC Date', 'dateTime', 50, 1, NULL, 'post_process2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-23 22:49:49', '2024-09-23 22:49:49', 17, 9, 'qc_attribute'),
(398, '9462ea4b-84f2-4ba2-8c74-2f4aa72d13f2', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'quality_check2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-09-23 22:49:49', '2024-09-23 22:49:49', 12, 9, 'qc_attribute'),
(400, '3694a617-0f71-49db-b215-68bc72cab896', 'qc_remark', 'QC Remark', 'text', 50, 1, NULL, 'post_process2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-09-23 22:51:44', '2024-09-23 22:51:44', 19, 10, 'qc_attribute'),
(401, 'e2202ef4-9112-4219-8846-d9d3f3243012', 'remark', 'Remark', 'text', NULL, 1, NULL, 'print2', '0', '0', 'text', NULL, NULL, NULL, NULL, '2024-10-05 03:42:16', '2024-10-05 03:42:16', 10, 10, 'General'),
(402, '4e15772c-1b71-4298-81e5-cc8e9a59c570', 'remark', 'Remark', 'text', 50, 1, NULL, 'post_process2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-10-05 03:42:16', '2024-10-05 03:42:16', 10, 10, NULL),
(403, '512b36e7-eb33-4748-ae3f-606ac8aa8dd0', 'remark', 'Remark', 'text', NULL, 1, NULL, 'quality_check2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-10-05 03:42:17', '2024-10-05 03:42:17', 10, 10, NULL),
(404, 'f5f1030f-e091-4b99-b904-c3035640e270', 'material_type', 'Material Type', 'text', NULL, 1, NULL, 'operation_d', '1', '1', 'select', NULL, NULL, NULL, 'materialData+all-material', '2024-10-14 03:35:45', '2024-10-14 03:35:45', 4, 4, NULL),
(407, '08087cdf-8aa2-4eed-ba2a-bdd1cd31588b', 'machine', 'Machine', 'varchar', NULL, 1, NULL, 'operation_d', '1', '1', 'select', NULL, NULL, NULL, 'machineData+all-machines', '2024-10-14 03:35:46', '2024-10-14 03:35:46', 5, 5, NULL),
(408, '96023452-e92b-450c-92df-f8674a848878', 'part_uuid', 'Part Name', 'varchar', NULL, 1, NULL, 'operation_d2', '1', '1', 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-10-14 03:35:46', '2024-10-14 03:35:46', 6, 6, NULL),
(409, '5267e78c-4baf-41ac-b10c-45271153f4f0', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_d2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-10-14 03:35:47', '2024-10-14 03:35:47', 7, 7, 'General'),
(410, '64d1c1e0-2a02-4d2b-a00a-a8e7764161ec', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'operation_d', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-10-14 03:35:47', '2024-10-14 03:35:47', 6, 6, NULL),
(411, '7e380b55-323e-4c9e-b0ee-8be19f221aca', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'operation_d', '0', '0', NULL, NULL, 1, NULL, 'orderData+all-orders', '2024-10-15 04:58:38', '2024-10-15 04:58:38', 1, 3, NULL),
(412, '80019737-ba66-46af-af0d-668e5ab95ded', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_d', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-10-15 04:58:39', '2024-10-15 04:58:39', 7, 7, NULL),
(413, '8bf9594c-cd06-44f5-8617-2c72198a570d', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_d', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-10-16 00:13:55', '2024-10-16 00:13:55', 8, 8, NULL),
(414, 'e69478c0-df92-4f94-9846-493c1adca8c0', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_d', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-10-16 00:13:56', '2024-10-16 00:13:56', 9, 9, NULL),
(415, 'd68a174c-7dac-4496-9e04-035bd7a73661', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_d', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-10-16 00:13:56', '2024-10-16 00:13:56', 10, 10, NULL),
(416, '31c689e0-8639-4f2c-9fda-e73251bca784', 'part_status', 'Part Status', 'varchar', 20, 1, NULL, 'operation_d2', '1', '1', 'select', 'Pass, Fail', 1, NULL, NULL, '2024-10-16 00:26:15', '2024-10-16 00:26:15', 8, 8, 'General'),
(417, 'ee10150b-7667-4572-888a-e50f26beb832', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_d2', '1', '1', 'number', NULL, 0, NULL, NULL, '2024-10-16 00:26:16', '2024-10-16 00:26:16', 9, 9, 'General'),
(418, 'fffc99ef-2d4f-4009-98ff-0338d69f7402', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_d2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-10-16 00:26:16', '2024-10-16 00:26:16', 10, 10, 'General'),
(419, '464455ce-0c36-4a8e-a27e-bad2dffc1c60', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_d2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-10-16 00:26:16', '2024-10-16 00:26:16', 11, 11, 'General'),
(420, '70cf326a-da9a-465f-ad14-584f3751a5a1', 'qc_by', 'QC Verify By', 'varchar', NULL, 1, 1, 'operation_d2', NULL, '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-10-16 00:26:17', '2024-10-16 00:26:17', 12, 12, 'QC Attribute'),
(421, '8551ca19-5d5c-4a25-8617-99c44954d243', 'qc_attribute', 'Attribute', 'varchar', NULL, 1, NULL, 'operation_d2', NULL, '1', 'select', 'Width,Length,Thickness,Hole Diameter,# Holes', NULL, NULL, NULL, '2024-10-16 00:26:17', '2024-10-16 00:26:17', 13, 13, 'qc_attribute'),
(422, '69f28b61-a9bd-496f-b999-4e9a68c9362e', 'qc_measure', 'Measured Dimension', 'integer', NULL, 1, NULL, 'operation_d2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-10-16 00:26:17', '2024-10-16 00:26:17', 14, 14, 'qc_attribute'),
(423, '47845e4a-addf-4dfd-8037-ddd1e1bc93bb', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_d2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-10-16 00:26:18', '2024-10-16 00:26:18', 15, 15, 'qc_attribute'),
(424, '3be97d77-a213-4a1c-aaab-fec9bc048658', 'qc_status', 'QC Status', 'varchar', NULL, 1, NULL, 'operation_d2', '1', '1', 'select', 'Pass,Fail', NULL, NULL, NULL, '2024-10-16 00:26:18', '2024-10-16 00:26:18', 16, 16, 'qc_attribute'),
(425, '2b422a7c-d26e-4526-a064-4acc693acec8', 'op_id', 'OP Id', 'varchar', 50, 1, NULL, 'operation_d', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-10-16 00:56:03', '2024-10-16 00:56:03', 0, 1, NULL),
(426, 'be0efef4-e036-4f52-a66a-640ed5996a73', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'operation_d2', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-10-16 01:30:40', '2024-10-16 01:30:40', 2, 3, NULL),
(427, 'd58e3689-2ef5-4345-a11e-0a28b7f980dd', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_d2', '0', '1', 'text', NULL, 1, NULL, NULL, '2024-10-16 06:43:40', '2024-10-16 06:43:40', 14, 13, 'qc_attribute'),
(431, '7d899966-c338-4f79-a046-5e441864bfe5', 'start_date', 'Start Date', 'date', NULL, NULL, NULL, 'quality_check2', '1', '1', NULL, NULL, 1, NULL, NULL, '2024-10-24 22:59:09', '2024-10-24 22:59:09', NULL, NULL, NULL),
(437, 'd07a9fd0-621f-4e9c-8c22-06896ee5e709', 'individual_cc', 'Individual CC', 'integer', NULL, NULL, NULL, 'print2', '0', '0', 'number', NULL, 1, NULL, NULL, '2024-10-28 05:23:41', '2024-10-28 05:23:41', NULL, NULL, 'General'),
(438, '35457013-5689-4924-807b-9e4225dcb484', 'total_cc', 'Total CC', 'integer', NULL, NULL, NULL, 'print2', '0', '0', 'number', NULL, 1, NULL, NULL, '2024-10-28 05:23:41', '2024-10-28 05:23:41', NULL, NULL, 'General'),
(442, '10e4d4bf-b753-41c3-bb03-c9b762b929d6', 'inline_from_uuid', 'Operation Id', 'varchar', 50, 1, 1, 'quality_check', NULL, '1', 'select', NULL, NULL, NULL, NULL, '2024-10-29 04:54:56', '2024-10-29 04:54:56', 14, NULL, NULL),
(443, 'ac673201-c603-4cde-b5d1-efbad09c218c', 'inline_from_uuid', 'Operation Id', 'varchar', NULL, 1, 1, 'quality_check2', NULL, '1', 'select', NULL, NULL, NULL, NULL, '2024-10-29 04:54:56', '2024-10-29 04:54:56', 18, NULL, NULL),
(446, '7de23763-665c-4991-b836-ca6f81ded758', 'fusing_agent', 'Fusing Agent', 'integer', 11, 1, NULL, 'print', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-11-18 11:21:20', '2024-11-18 11:21:20', NULL, NULL, 'Attribute'),
(447, '4509e1de-a164-4ad4-b0f3-fb868749c1ab', 'detailing_agent', 'Detailing Agent', 'integer', NULL, 1, NULL, 'print', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-11-18 11:21:20', '2024-11-18 11:21:20', NULL, NULL, 'Attribute'),
(448, '3ef1d0fb-fc65-44da-8773-814dce9a0c39', 'packing_density', 'Packing Density', 'integer', NULL, 1, NULL, 'print', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-11-18 11:21:20', '2024-11-18 11:21:20', NULL, NULL, 'Attribute'),
(449, '6a74802a-bf29-45e3-b40e-2320a57a4560', 'weight', 'Weight (in grams)', 'integer', NULL, 1, NULL, 'print', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-11-18 11:21:20', '2024-11-18 11:21:20', NULL, NULL, 'Attribute'),
(450, '6f61348a-06d6-4a97-a3c4-0b5aeb0f3f61', 'op_id', 'Operation Id', 'varchar', 50, 1, 0, 'operation_f', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-25 04:32:21', '2024-11-25 04:32:21', NULL, NULL, 'General'),
(451, '92470482-9515-4362-ac5e-4fee5eff50f1', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_f', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-11-25 04:32:21', '2024-11-25 04:32:21', NULL, NULL, 'General'),
(452, 'fbcec4cb-24cb-49fc-92fd-78beef1ed194', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_f', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-11-25 04:32:21', '2024-11-25 04:32:21', NULL, NULL, 'General'),
(453, 'a12245fc-d735-48d7-9664-1a0b87a0074f', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_f', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-11-25 04:32:22', '2024-11-25 04:32:22', NULL, NULL, 'General'),
(454, '10c51627-0864-4c67-800b-7f2eb8d11d19', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_f', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-11-25 04:32:22', '2024-11-25 04:32:22', NULL, NULL, 'General'),
(455, '69c7d2ff-408d-48fd-b33f-1f6dcb57ed4e', 'parent_uuid', 'Operation F uuid', 'varchar', NULL, 1, 1, 'operation_f2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 04:32:22', '2024-11-25 04:32:22', NULL, NULL, 'General'),
(456, 'e4bc9d8a-ba7c-403a-86d2-10b492df7ece', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_f2', '1', '1', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-11-25 04:32:23', '2024-11-25 04:32:23', NULL, NULL, 'General'),
(457, 'd775dbee-eeba-49f1-b8ce-90a2b578ec94', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'operation_f2', '1', '1', 'select', NULL, 1, NULL, 'all/OrderPlan2', '2024-11-25 04:32:23', '2024-11-25 04:32:23', NULL, NULL, 'General'),
(458, '03d30d55-db06-446b-af13-c30ec230aaff', 'part_status', 'Part Status', 'varchar', NULL, 1, NULL, 'operation_f2', NULL, '1', 'select', 'Pass,Fail', 1, NULL, NULL, '2024-11-25 04:32:23', '2024-11-25 04:32:23', NULL, NULL, 'General'),
(459, '3bf59e94-8074-4146-9ca5-2ec9ad8a28dd', 'file_path', 'Part Image', 'text', NULL, 1, NULL, 'operation_f2', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-11-25 04:32:24', '2024-11-25 04:32:24', NULL, NULL, 'General'),
(460, '7e949bb0-13be-4f45-ad4c-54e3512a0454', 'qty', 'Quantity', 'integer', NULL, 1, NULL, 'operation_f2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-11-25 04:32:24', '2024-11-25 04:32:24', NULL, NULL, 'General'),
(461, '65e401a9-ae2f-47f0-9f33-e31816923bbf', 'failed_qty', 'Failed Quantity', 'integer', NULL, 1, NULL, 'operation_f2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-25 04:32:24', '2024-11-25 04:32:24', NULL, NULL, 'General'),
(462, 'e6058ba1-2a36-4a09-9e56-77c03252d70a', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_f2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 04:32:25', '2024-11-25 04:32:25', NULL, NULL, 'General'),
(463, '61b9f8d9-5eef-4579-9b7a-91875e1ee8fe', 'failure_reason', 'Failure Reson', 'text', NULL, 1, NULL, 'operation_f2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 04:32:25', '2024-11-25 04:32:25', NULL, NULL, 'General'),
(464, '4c3b0bb2-5769-40b5-9b2e-14bfa99bb00f', 'qc_by', 'Qc Done By', 'varchar', NULL, 1, 1, 'operation_f2', '1', '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-11-25 04:32:25', '2024-11-25 04:32:25', NULL, NULL, 'QC Attribute'),
(465, 'f9ee548e-ebc8-4719-953b-f3fe515bb975', 'qc_qty', 'QC Quantity', 'integer', NULL, 1, 0, 'operation_f2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-11-25 04:32:25', '2024-11-25 04:32:25', NULL, NULL, 'QC Attribute'),
(466, '034c1b61-fa91-4f8d-80cc-6c3da773941e', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_f2', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-11-25 04:32:26', '2024-11-25 04:32:26', NULL, NULL, 'QC Attribute'),
(467, 'eb4660ba-12e1-4cb3-95f0-87e79c6ebc1b', 'qc_attribute', 'QC Attribute', 'varchar', NULL, 1, NULL, 'operation_f2', '1', '1', 'select', 'Width,Length,Thickness,Hole Diameter,# Holes', 1, NULL, NULL, '2024-11-25 04:32:26', '2024-11-25 04:32:26', NULL, NULL, 'QC Attribute'),
(468, 'b48e131d-eafa-4314-b949-206ca6f9bd89', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_f2', '1', '1', 'number', NULL, 1, NULL, NULL, '2024-11-25 04:32:26', '2024-11-25 04:32:26', NULL, NULL, 'QC Attribute'),
(469, '9ec4755e-91d2-43c1-88db-a57a1a1443e0', 'op_id', 'OP Id', 'text', 50, 1, NULL, 'operation_g', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:28:31', '2024-11-25 03:28:31', NULL, NULL, 'General'),
(470, 'b6c27c2f-ae80-46c6-9f59-e7c58a37d6fd', 'start_time', 'Start Time', 'dateTime', NULL, NULL, NULL, 'operation_g', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-25 03:28:32', '2024-11-25 03:28:32', NULL, NULL, 'General'),
(471, '9ec4755e-91d2-43c1-88db-a57a1a1443e0', 'op_id', NULL, 'text', NULL, 1, NULL, 'operation_g', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-25 12:00:29', '2024-11-25 12:00:29', NULL, NULL, NULL),
(472, '8c65e1c2-fd5c-490f-b4e7-cec9a12cadcf', 'end_time', 'End Time', 'dateTime', NULL, NULL, NULL, 'operation_g', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-25 03:28:32', '2024-11-25 03:28:32', NULL, NULL, 'General'),
(473, '603cd597-cc9a-4768-b290-ff3a61a09a08', 'total_hrs', 'Total Hours', 'text', NULL, NULL, NULL, 'operation_g', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:28:32', '2024-11-25 03:28:32', NULL, NULL, 'General'),
(474, '5fe39edf-5444-46c5-8ae9-e1fefc4e4ff9', 'assigned_to', 'Assigned To', 'text', NULL, 1, NULL, 'operation_g', '1', '1', 'text', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-25 03:43:45', '2024-11-25 03:43:45', NULL, NULL, 'General'),
(475, 'f5246e23-1957-49eb-a5e1-3f10d8a5200b', 'order_uuid', 'Order Id', 'text', NULL, 1, 1, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, 'orderData+all-orders', '2024-11-25 03:43:46', '2024-11-25 03:43:46', NULL, NULL, 'General'),
(476, '4d8215ac-99c5-4232-bf0c-9b145608c8f5', 'part_uuid', 'Part Name', 'text', NULL, 1, 1, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, 'all/OrderPlan2', '2024-11-25 03:43:46', '2024-11-25 03:43:46', NULL, NULL, 'General'),
(477, '9652fce8-4a49-4d5f-a41c-fda3c2d8aa89', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:46', '2024-11-25 03:43:46', NULL, NULL, 'General'),
(478, '79f95474-ea86-4fe2-bd98-da177a511fc3', 'file_path', 'File Path', 'text', NULL, 1, NULL, 'operation_g2', '0', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:46', '2024-11-25 03:43:46', NULL, NULL, 'General'),
(479, '4ced83bf-1888-4701-8a77-a72df3cd2490', 'qty', 'Quantity', 'integer', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:47', '2024-11-25 03:43:47', NULL, NULL, 'General'),
(480, '139e46f3-02d4-4fbf-9538-72fbea8895dc', 'failed_qty', 'Failed Quantity', 'integer', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:47', '2024-11-25 03:43:47', NULL, NULL, 'General'),
(481, '708ac4f9-a773-446e-b9fd-be110cea5059', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:47', '2024-11-25 03:43:47', NULL, NULL, 'General'),
(482, '4e6bfbc5-4343-496b-bf38-3e273b00e8b6', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:47', '2024-11-25 03:43:47', NULL, NULL, 'General'),
(483, '807e79ca-b3fa-4d26-808a-9c3941080b95', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:48', '2024-11-25 03:43:48', NULL, NULL, 'General'),
(484, '2abaf133-aaed-4652-898b-cb8d9e87cdd1', 'qc_qty', 'QC Quantity', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:48', '2024-11-25 03:43:48', NULL, NULL, 'General'),
(485, '3dc3c044-8911-4ab0-9099-d2620bb0b987', 'qc_by', 'QC By', 'text', NULL, 1, 1, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:48', '2024-11-25 03:43:48', NULL, NULL, 'General'),
(486, '95346c53-818a-4e66-a64f-4bc65bd84475', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:48', '2024-11-25 03:43:48', NULL, NULL, 'General'),
(487, '7294a236-1aba-4dec-b88e-30bf4eb6a158', 'qc_measure', 'QC Measure', 'text', NULL, 1, NULL, 'operation_g2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:48', '2024-11-25 03:43:48', NULL, NULL, 'General'),
(488, '24223f31-afca-491c-8e1e-9ac017cf370b', 'parent_uuid', NULL, 'text', NULL, 1, NULL, 'operation_g2', '0', '0', 'text', NULL, NULL, NULL, NULL, '2024-11-25 03:43:49', '2024-11-25 03:43:49', NULL, NULL, 'General'),
(489, '71f3a8ae-179a-4e04-b4c3-9d0158f87c74', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_h2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-24 22:54:40', '2024-11-24 22:54:40', NULL, NULL, 'QC Attribute'),
(490, '6a6b6883-298b-4d81-97ab-9b7254269e77', 'op_id', 'Operation Id', 'integer', 50, 1, NULL, 'operation_h', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-24 22:54:33', '2024-11-24 22:54:33', NULL, NULL, 'General'),
(491, '16ca7474-9422-48a2-a6d4-55f070cb2b78', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_h', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-11-24 22:54:34', '2024-11-24 22:54:34', NULL, NULL, 'General'),
(492, '04dd0db8-03b5-4936-b2a1-6fd110ee678c', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_h', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-24 22:54:34', '2024-11-24 22:54:34', NULL, NULL, 'General'),
(493, 'c5f7815c-a30c-40c3-bf3d-400f67d0ab07', 'total_hrs', 'Total Hrs', 'integer', NULL, 1, NULL, 'operation_h', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-11-24 22:54:35', '2024-11-24 22:54:35', NULL, NULL, 'General'),
(494, '5a5bc8a4-e3fc-4b48-96a2-b641b5d0e9ea', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, NULL, 'operation_h', '1', NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-24 22:54:35', '2024-11-24 22:54:35', NULL, NULL, 'General'),
(495, 'ed745c9d-5740-4dcf-adfc-7820311f733f', 'order_uuid', 'Order Id', 'varchar', NULL, 1, NULL, 'operation_h2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-11-24 22:54:35', '2024-11-24 22:54:35', NULL, NULL, 'General'),
(496, 'a692adcb-455c-4376-a837-98417043f662', 'part_uuid', 'Part Name', 'varchar', NULL, 1, NULL, 'operation_h2', '1', '1', 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-11-24 22:54:36', '2024-11-24 22:54:36', NULL, NULL, 'General'),
(497, 'a2d46598-7b4a-4583-b98f-2e7d82b27403', 'part_status', 'Part Status', 'varchar', NULL, 1, NULL, 'operation_h2', NULL, NULL, 'select', 'Pass,Fail', NULL, NULL, NULL, '2024-11-24 22:54:36', '2024-11-24 22:54:36', NULL, NULL, 'General'),
(498, '2ff32cf0-339f-41c9-8c05-17bcc62d9f06', 'file_path', 'Image', 'text', NULL, 1, NULL, 'operation_h2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-24 22:54:37', '2024-11-24 22:54:37', NULL, NULL, 'General'),
(499, '0a332af8-de1f-43bb-9177-dad9d6be2c12', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_h2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-24 22:54:37', '2024-11-24 22:54:37', NULL, NULL, 'General'),
(500, '66c1e1d1-e306-4970-8ea8-2985c03079e8', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_h2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-24 22:54:37', '2024-11-24 22:54:37', NULL, NULL, 'General'),
(501, '215ffd50-7652-4c9e-a2ca-1922cbe52649', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_h2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-24 22:54:38', '2024-11-24 22:54:38', NULL, NULL, 'General'),
(502, 'eb4d5605-abce-4492-9656-8b649e380532', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_h2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-24 22:54:38', '2024-11-24 22:54:38', NULL, NULL, 'General'),
(503, '76b1a15b-6f0b-420b-ab89-c04048c77dd9', 'parent_uuid', NULL, 'varchar', NULL, 1, NULL, 'operation_h2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-24 22:54:39', '2024-11-24 22:54:39', NULL, NULL, 'General'),
(504, '0739a5d4-e14e-4517-a0a5-2e50bb462258', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_h2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-24 22:54:39', '2024-11-24 22:54:39', NULL, NULL, 'QC Attribute'),
(505, '85c140e4-cb04-42fb-b93a-16e6c1eddcfa', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_h2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-24 22:54:39', '2024-11-24 22:54:39', NULL, NULL, 'QC Attribute'),
(507, 'a0daa7dd-79d6-46e4-b079-616c4b227bfa', 'qc_by', 'QC By', 'varchar', NULL, 1, NULL, 'operation_h2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-24 22:54:40', '2024-11-24 22:54:40', NULL, NULL, 'QC Attribute'),
(508, 'd0a89549-04ad-45e3-bd95-dd92157f0858', 'qc_attribute', 'QC Attribute', 'varchar', NULL, 1, NULL, 'operation_h2', '1', '1', 'select', 'Length,Width,Thickness,Hole daimeter,Holes', NULL, NULL, NULL, '2024-11-24 22:54:41', '2024-11-24 22:54:41', NULL, NULL, 'QC Attribute'),
(509, '0013e9cc-b4f1-440c-a66c-23cdde04dd45', 'qc_measure', 'QC Measures', 'integer', NULL, 1, NULL, 'operation_h2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-24 22:54:41', '2024-11-24 22:54:41', NULL, NULL, 'QC Attribute'),
(511, '6c136e71-4e90-4c84-85bd-dba5ad7a409c', 'op_id', 'OP Id', 'text', 50, 1, NULL, 'operation_e', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-05 21:37:10', '2024-11-05 21:37:10', 1, 1, 'General');
INSERT INTO `column_spec` (`id`, `uuid`, `column_name`, `lable`, `column_type`, `length`, `nullable`, `index`, `data_table_name`, `show_in_listing`, `show_in_form`, `form_input_type`, `form_drop_down_list`, `required`, `show_if`, `list_from`, `created_at`, `updated_at`, `column_position`, `column_position_listing`, `type`) VALUES
(512, '4703c6eb-7852-480f-8ac8-98467582a1c4', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_e', '0', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-05 21:37:10', '2024-11-05 21:37:10', 8, 8, 'General'),
(513, '31e1bac7-7f60-4e52-aaf1-db13d78454d8', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_e', '0', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-05 21:37:11', '2024-11-05 21:37:11', 9, 9, 'General'),
(514, '2fe7fc97-65c3-46fc-a0f8-d79b6d6e33c7', 'total_hours', 'Total Duration', 'integer', NULL, 1, NULL, 'operation_e', '1', '0', 'number', NULL, NULL, NULL, NULL, '2024-11-05 21:37:11', '2024-11-05 21:37:11', 10, 10, 'General'),
(515, 'c8c2afd2-e76b-4fa4-8d0d-75a5a473429e', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_e', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-05 21:37:11', '2024-11-05 21:37:11', 7, 7, 'General'),
(516, 'e889e54a-f4cb-44ca-840e-1bf7fb5e1b62', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'operation_e2', '1', '1', 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-11-05 21:37:11', '2024-11-05 21:37:11', 4, 4, 'General'),
(517, 'e3b17056-3844-4ae7-b5ae-cac7eb3a90ef', 'order_uuid', 'Order Id', 'varchar', NULL, 1, NULL, 'operation_e2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-11-05 21:37:12', '2024-11-05 21:37:12', 3, 3, 'General'),
(519, 'dc81df7d-6630-4a0a-92ad-f9c96f0f924c', 'part_status', 'Part Status', 'varchar', NULL, 1, 0, 'operation_e2', '1', '1', 'select', 'Pass,Fail', NULL, NULL, NULL, '2024-11-05 21:37:12', '2024-11-05 21:37:12', 5, 5, 'General'),
(520, '8dab8cf4-1074-4fe3-a4c7-313d3cae6db6', 'qty', 'Processed Qty', 'integer', 11, 1, NULL, 'operation_e2', '1', '1', NULL, NULL, 1, NULL, NULL, '2024-11-05 22:12:02', '2024-11-05 22:12:02', 6, 6, 'General'),
(521, '6ee62bdd-075c-4c00-89d1-f35f6bcdb87d', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_e2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-05 22:12:03', '2024-11-05 22:12:03', 7, 7, 'General'),
(522, '4b0f9c8a-7b18-46a1-a78c-9916dedbfeb2', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_e', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-11-05 22:12:03', '2024-11-05 22:12:03', 8, 8, 'General'),
(523, 'c9c8f9b1-e8c0-4b21-b18d-092a2759240e', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_e2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-11-05 22:12:03', '2024-11-05 22:12:03', 9, 9, 'General'),
(524, '4d5b19dc-4d12-420e-8c0c-58556a91f743', 'qc_by', 'QC By', 'text', NULL, 1, NULL, 'operation_e2', NULL, '1', 'select', NULL, 1, NULL, 'employeeData+all-employees', '2024-11-05 22:12:04', '2024-11-05 22:12:04', 10, 10, 'QC Attribute'),
(525, '66207e25-9d5b-4b87-9068-90b8cb299b23', 'qc_remark', 'Remarks by QC', 'text', NULL, 1, NULL, 'operation_e2', NULL, '1', 'text', NULL, 1, NULL, NULL, '2024-11-05 22:12:04', '2024-11-05 22:12:04', 11, 11, 'QC Attribute'),
(526, 'ac362073-0656-40f1-bcff-5983b91a53b3', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_e2', NULL, '1', 'number', NULL, 1, NULL, NULL, '2024-11-05 22:12:04', '2024-11-05 22:12:04', 12, 12, 'QC Attribute'),
(527, '81579c27-b36c-4914-b2cb-ad1bcaf53dd5', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_e2', NULL, '1', 'dateTime', NULL, 1, NULL, NULL, '2024-11-05 22:12:04', '2024-11-05 22:12:04', 13, 13, 'QC Attribute'),
(528, '82217b0f-287b-4565-b860-872882d9655b', 'qc_attribute', 'Attribute', 'text', NULL, 1, NULL, 'operation_e2', NULL, '1', 'select', 'Length,Width,Thickness,Hole Diameter,# Holes', 1, NULL, NULL, '2024-11-05 22:12:05', '2024-11-05 22:12:05', 14, 14, 'QC Attribute'),
(529, 'd9debc2d-e315-4c76-af7b-f5355e8ca654', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_e2', NULL, '1', 'number', NULL, 1, NULL, NULL, '2024-11-05 22:12:05', '2024-11-05 22:12:05', 15, 15, 'QC Attribute'),
(530, '12373dfe-4bfc-484a-b4e2-377fc9fb663f', 'parent_uuid', 'op_e_uuid', 'text', NULL, NULL, NULL, 'operation_e2', '0', '0', NULL, NULL, NULL, NULL, NULL, '2024-11-08 09:26:37', '2024-11-08 09:26:37', NULL, NULL, NULL),
(532, 'b24b2f9c-9ff7-49ee-9c07-2c98790748d1', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_i', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-11-25 22:29:54', '2024-11-25 22:29:54', NULL, NULL, 'General'),
(533, 'bce62e59-5a52-4f5f-a2fd-9a24da0c6091', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_i', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-11-25 22:29:55', '2024-11-25 22:29:55', NULL, NULL, 'General'),
(534, 'dcea1ef5-7da8-44a9-a6dc-b7ca8ac4d0a8', 'total_hrs', 'Total hrs', 'integer', NULL, 1, NULL, 'operation_i', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-11-25 22:29:55', '2024-11-25 22:29:55', NULL, NULL, 'General'),
(535, '03604624-e3cf-405b-92e6-1d43dc6ffddd', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, NULL, 'operation_i', NULL, NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-25 22:29:55', '2024-11-25 22:29:55', NULL, NULL, 'General'),
(536, 'ccb5e410-6296-46df-8f79-a57c7a60d942', 'order_uuid', 'Order Id', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-11-25 22:29:56', '2024-11-25 22:29:56', NULL, NULL, 'General'),
(537, '8b68b75d-1bbe-41ba-bfaa-3733e944fd5f', 'part_uuid', 'Part Name', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-11-25 22:29:56', '2024-11-25 22:29:56', NULL, NULL, 'General'),
(538, '41133a09-b1cb-4d07-b6ad-689e2da9db6b', 'part_status', 'Part Status', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'select', 'Pass,Fail', NULL, NULL, NULL, '2024-11-25 22:29:57', '2024-11-25 22:29:57', NULL, NULL, 'General'),
(539, 'b4f228e4-d381-46fe-bd00-925aed80fdaa', 'file_path', 'Image', 'text', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-25 22:29:58', '2024-11-25 22:29:58', NULL, NULL, 'General'),
(540, '2f5d9af9-08ff-4be1-a49e-68abea3128bd', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-11-25 22:29:58', '2024-11-25 22:29:58', NULL, NULL, 'General'),
(541, '7e3bdfc8-35be-4b56-9652-48c308c369f2', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-11-25 22:29:58', '2024-11-25 22:29:58', NULL, NULL, 'General'),
(542, 'd584d918-1f37-47fd-816e-2b4c7ed14870', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-25 22:29:59', '2024-11-25 22:29:59', NULL, NULL, 'General'),
(543, '56079a1e-d81b-43e5-a649-642b32a9cf60', 'remark', 'Remark', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-25 22:29:59', '2024-11-25 22:29:59', NULL, NULL, 'General'),
(544, 'daf8e69f-e1f7-4df7-ac64-15214cb3bce1', 'parent_uuid', NULL, 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 22:30:00', '2024-11-25 22:30:00', NULL, NULL, 'General'),
(545, '9cdec85d-6c6b-444f-acf5-95e9830e9fc2', 'qc_remark', 'QC Remark', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-25 22:30:00', '2024-11-25 22:30:00', NULL, NULL, 'QC Attribute'),
(546, 'e7d9a6b7-7173-437f-a74e-9075f139baed', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-11-25 22:30:00', '2024-11-25 22:30:00', NULL, NULL, 'QC Attribute'),
(547, 'f6fdb969-be3d-4e3f-a760-27e9b25991c1', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-11-25 22:30:01', '2024-11-25 22:30:01', NULL, NULL, 'QC Attribute'),
(548, 'f1198744-4478-4587-b4b8-68a9bb726fbe', 'qc_by', 'QC By', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'varchar', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-25 22:30:01', '2024-11-25 22:30:01', NULL, NULL, 'QC Attribute'),
(549, 'd5f5ae82-0845-4f73-8366-8ee9ac794ae6', 'qc_attribute', 'QC Attribute', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'select', 'Holes,Hole Diametr,Length,Width,Thickness', NULL, NULL, NULL, '2024-11-25 22:30:01', '2024-11-25 22:30:01', NULL, NULL, 'QC Attribute'),
(550, '19e1c103-7eaa-4818-b206-a1aa4a15e473', 'qc_measure', 'QC Measure', 'varchar', NULL, 1, NULL, 'operation_i2', NULL, NULL, 'varchar', NULL, NULL, NULL, NULL, '2024-11-25 22:30:02', '2024-11-25 22:30:02', NULL, NULL, 'QC Attribute'),
(551, '748744d6-8b2c-417f-9007-22a1af358c35', 'op_id', 'Operation Id', 'varchar', 50, 1, NULL, 'operation_i', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-25 22:40:17', '2024-11-25 22:40:17', NULL, NULL, 'General'),
(552, 'f14cf9d4-42b1-40e3-910d-5991bb1318ee', 'op_id', 'Operation Id', 'varchar', 50, 1, NULL, 'operation_j', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-11-26 00:57:01', '2024-11-26 00:57:01', NULL, NULL, 'General'),
(553, '2f22160d-69ad-4d1e-9260-6fa5ce99142d', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_j', NULL, '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-26 00:57:01', '2024-11-26 00:57:01', NULL, NULL, 'General'),
(554, 'fa89a5e6-6b59-49e2-8a7d-fddc937f87ec', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_j', NULL, '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-26 00:57:02', '2024-11-26 00:57:02', NULL, NULL, 'General'),
(555, 'cfdc7414-9666-4d40-a4c1-af021e52171e', 'total_hrs', 'Total hrs', 'integer', NULL, 1, NULL, 'operation_j', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-26 00:57:03', '2024-11-26 00:57:03', NULL, NULL, 'General'),
(556, '239c86e8-b6e2-4cb3-94a7-6e87cd24eba8', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, NULL, 'operation_j', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-26 00:57:03', '2024-11-26 00:57:03', NULL, NULL, 'General'),
(557, '9ef0bbac-fa03-4a72-95b6-8072b0188754', 'order_uuid', 'Order Id', 'varchar', NULL, 1, NULL, 'operation_j2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-11-26 00:57:04', '2024-11-26 00:57:04', NULL, NULL, 'General'),
(558, 'fa2b1d9b-059f-4e4e-a286-5262af4c2c10', 'part_uuid', 'Part Name', 'varchar', NULL, 1, NULL, 'operation_j2', '1', '1', 'select', NULL, NULL, NULL, 'all/OrderPlan2', '2024-11-26 00:57:04', '2024-11-26 00:57:04', NULL, NULL, 'General'),
(559, '6530e9a3-745d-42da-9877-18d2318b7313', 'part_status', 'Part Status', 'varchar', NULL, 1, NULL, 'operation_j2', '1', '1', 'select', 'Pass,Fail', NULL, NULL, NULL, '2024-11-26 00:57:04', '2024-11-26 00:57:04', NULL, NULL, 'General'),
(560, '969f832a-f44d-4e18-825c-35537c4560bc', 'file_path', 'Image', 'text', NULL, 1, NULL, 'operation_j2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-11-26 00:57:05', '2024-11-26 00:57:05', NULL, NULL, 'General'),
(561, '710365a7-16f3-4e60-bff9-aa404b12e3e3', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_j2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-26 00:57:05', '2024-11-26 00:57:05', NULL, NULL, 'General'),
(562, '5fbd2f76-0d40-41d2-b279-f5f416faed8f', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_j2', NULL, '1', 'number', NULL, NULL, NULL, NULL, '2024-11-26 00:57:06', '2024-11-26 00:57:06', NULL, NULL, 'General'),
(563, '7df7d5b5-f498-439a-8ba7-a3e199cfbbad', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_j2', '1', NULL, 'text', NULL, NULL, NULL, NULL, '2024-11-26 00:57:06', '2024-11-26 00:57:06', NULL, NULL, 'General'),
(564, 'eb7debf9-5094-4264-835c-eb94c7a24de5', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_j2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-11-26 00:57:07', '2024-11-26 00:57:07', NULL, NULL, 'General'),
(565, '34de6868-9808-443c-857d-b6a554ce9dcf', 'parent_uuid', NULL, 'varchar', NULL, 1, NULL, 'operation_j2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 00:57:07', '2024-11-26 00:57:07', NULL, NULL, 'General'),
(566, '6a492187-d09b-4a18-a29e-563f8fc002b3', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_j2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-11-26 00:57:07', '2024-11-26 00:57:07', NULL, NULL, 'QC Attribute'),
(567, 'd86aa3b6-b96b-4a9b-808a-a1718a791957', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_j2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-26 00:57:08', '2024-11-26 00:57:08', NULL, NULL, 'QC Attribute'),
(568, '6916cb74-9c84-47e3-89b6-b95d0f0633f9', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_j2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-11-26 00:57:08', '2024-11-26 00:57:08', NULL, NULL, 'QC Attribute'),
(569, '0b88eae2-278f-49d6-b525-967c4244de7c', 'qc_by', 'QC By', 'varchar', NULL, 1, NULL, 'operation_j2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-11-26 00:57:09', '2024-11-26 00:57:09', NULL, NULL, 'QC Attribute'),
(570, 'a72cfe94-d4c3-475e-8e69-333e48e61401', 'qc_attribute', 'QC Attribute', 'varchar', NULL, 1, NULL, 'operation_j2', '1', '1', 'select', 'Length,Width,Thickness,Hole Diameter,Holes', NULL, NULL, NULL, '2024-11-26 00:57:09', '2024-11-26 00:57:09', NULL, NULL, 'QC Attribute'),
(571, '0b550df3-99b5-43e8-abd1-b7ceba2b3667', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_j2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-11-26 00:57:10', '2024-11-26 00:57:10', NULL, NULL, 'QC Attribute'),
(572, 'e7dcbada-b3d9-4dbc-9d11-c0c9685d7684', 'order_uuid', 'Order Id', 'varchar', 50, 1, 1, 'print_plan2', NULL, '0', 'select', NULL, 1, NULL, 'orderData+all-orders', '2024-11-27 22:51:00', '2024-11-27 22:51:00', NULL, NULL, 'General'),
(573, 'c01bc682-2a61-4c3e-9329-e3ca67885ce7', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'operation_f', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-11-27 23:50:59', '2024-11-27 23:50:59', NULL, NULL, 'General'),
(574, '6c0e874f-929a-4750-88fc-8de9b7249900', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'operation_e', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-11-27 23:52:35', '2024-11-27 23:52:35', NULL, NULL, 'General'),
(575, '78ce0f9c-313d-402e-8e1f-80d4e98c1fb6', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_f2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-11-28 01:30:00', '2024-11-28 01:30:00', NULL, NULL, 'QC Attribute'),
(576, '77019cfc-b01d-4a0b-ac89-cf5c484f6b4a', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'quality_check2', '1', '1', 'select', 'Pass,Fail', 1, NULL, NULL, '2024-11-30 06:51:25', '2024-11-30 06:51:25', NULL, NULL, 'General'),
(577, '6d0bb441-8a01-4443-af3b-64fd6e01364f', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'quality_check', '1', '1', 'dateTime', NULL, 1, NULL, NULL, '2024-12-03 03:05:44', '2024-12-03 03:05:44', NULL, NULL, 'General'),
(581, 'e94a8381-176b-4b51-b3ef-3272940e3e3b', 'total_hrs', 'Total Hours', 'integer', 11, 1, NULL, 'quality_check', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-03 03:10:05', '2024-12-03 03:10:05', NULL, NULL, 'General'),
(582, '213c8b3e-a95c-4572-ba9f-73f6fdb796dd', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'print', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology', '2024-12-04 00:04:36', '2024-12-04 00:04:36', NULL, NULL, 'General'),
(583, 'f18c06f3-1595-43d6-9ff8-d2d92fc090d3', 'technology_uuid', 'Service', 'varchar', 50, 1, 1, 'operation_d', NULL, '1', NULL, NULL, 1, NULL, 'technologyData+all-technology', '2024-12-04 05:48:24', '2024-12-04 05:48:24', NULL, NULL, 'General'),
(584, '8b57e79e-d951-40b9-a5c7-5a1a0bb09a1a', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'print2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:16', '2024-12-06 07:02:16', NULL, NULL, 'General'),
(585, 'c67ba58f-2110-405c-9209-068824f61250', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_d2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:16', '2024-12-06 07:02:16', NULL, NULL, 'General'),
(586, '8dc36e29-2bac-420f-9507-ae8a1b07bea8', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'quality_check2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:16', '2024-12-06 07:02:16', NULL, NULL, 'General'),
(587, '0922c68f-cbe7-48e0-ab32-0565a2f2d1df', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'post_process2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:16', '2024-12-06 07:02:16', NULL, NULL, 'General'),
(588, '7d175084-ada1-42e2-9f85-7c42ac92e1cb', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_h2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(589, '315c432e-8b03-42ba-b2c7-49a223594a99', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_f2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(590, '40421533-734a-4968-a121-8efdc385c67e', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_j2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(591, '8afac2f1-d47b-4bee-85e3-259e039bc47d', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_i2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(592, '8c435836-c8f6-4df1-843c-daac4db28bc6', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_e2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(593, '2a18b4a1-872c-4340-a745-3079f382a93f', 'fail_image', 'Failed Part Image', 'text', NULL, 1, NULL, 'operation_g2', NULL, '1', 'text', NULL, NULL, NULL, NULL, '2024-12-06 07:02:17', '2024-12-06 07:02:17', NULL, NULL, 'General'),
(594, '5dbd2783-bcdf-4fb5-8cb2-d182e08cff2d', 'technology_uuid', 'Service', 'varchar', 99, 1, 1, 'operation_i', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-06 09:19:54', '2024-12-06 09:19:54', NULL, NULL, 'General'),
(595, 'b19669d1-7260-4e56-bf62-a3e5c26674d2', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_j', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-06 09:19:54', '2024-12-06 09:19:54', NULL, NULL, 'General'),
(596, 'aa761124-372e-410b-bbc9-e2a7184f23a5', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_g', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-06 09:19:54', '2024-12-06 09:19:54', NULL, NULL, 'General'),
(597, '898ea6b9-6282-4892-b5e2-0c0f9bb6598d', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_h', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-06 09:19:54', '2024-12-06 09:19:54', NULL, NULL, 'General'),
(598, '908a075d-1e57-49e9-8632-7811a605cc39', 'technology_uuid', 'Service', 'varchar', 99, 1, 1, 'operation_o', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-24 22:59:15', '2024-12-24 22:59:15', NULL, NULL, 'General'),
(599, 'a5c82d5b-6241-4844-846d-e7ca320fa712', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_o', '1', '0', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:15', '2024-12-24 22:59:15', NULL, NULL, 'General'),
(600, '7a28b8da-247d-47ba-8ef8-aa667cc1e80f', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_o', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 22:59:15', '2024-12-24 22:59:15', NULL, NULL, 'General'),
(601, '259137b0-363e-4251-9a0c-a7a22a53f248', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_o', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 22:59:16', '2024-12-24 22:59:16', NULL, NULL, 'General'),
(602, 'cd4fc95b-8632-475f-bc79-68471ae74772', 'op_id', 'OP Id', 'text', NULL, 1, NULL, 'operation_o', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:16', '2024-12-24 22:59:16', NULL, NULL, 'General'),
(603, '286b34a4-185a-460d-8e26-00e746ef98b0', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_o', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 22:59:16', '2024-12-24 22:59:16', NULL, NULL, 'General'),
(604, '765c7588-95fd-4b59-bcbd-c4691c58b6ad', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'operation_o', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 22:59:17', '2024-12-24 22:59:17', NULL, NULL, 'General'),
(605, '90a6825f-a6c5-446e-b7db-edc6f84f87de', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_p', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-24 22:59:17', '2024-12-24 22:59:17', NULL, NULL, 'General'),
(606, '26dafbf1-051c-41d7-bfed-5b867f3925e3', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_p', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:17', '2024-12-24 22:59:17', NULL, NULL, 'General'),
(607, '938d98ba-7607-43c3-bf7c-538f8731b59d', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_p', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 22:59:17', '2024-12-24 22:59:17', NULL, NULL, 'General'),
(608, '712d80a8-0465-4220-816c-46ccf9292eab', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_p', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 22:59:18', '2024-12-24 22:59:18', NULL, NULL, 'General'),
(609, '9b22cb34-c00d-4d1e-bcee-788de53cf82c', 'op_id', 'OP Id', 'dateTime', NULL, 1, NULL, 'operation_p', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:18', '2024-12-24 22:59:18', NULL, NULL, 'General'),
(610, '23b41821-5f9a-40bf-abed-2124802f6a8f', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_p', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 22:59:18', '2024-12-24 22:59:18', NULL, NULL, 'General'),
(611, '22c8d034-2e45-4cc2-bda0-32cbad844104', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'operation_p', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 22:59:18', '2024-12-24 22:59:18', NULL, NULL, 'General'),
(612, 'ecf6ec24-692e-4f6b-a369-e4d559830c18', 'parent_uuid', 'Parent Id', 'varchar', NULL, 1, 1, 'operation_o2', '1', '1', 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 22:59:19', '2024-12-24 22:59:19', NULL, NULL, 'General'),
(613, '9e082f28-4f45-4703-9989-46ed44f6d2ab', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 22:59:19', '2024-12-24 22:59:19', NULL, NULL, 'General'),
(614, '04a17270-bb61-4401-8d96-84ca376569f4', 'part_uuid', 'Part Id', 'varchar', NULL, 1, 1, 'operation_o2', '1', '1', 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 22:59:19', '2024-12-24 22:59:19', NULL, NULL, 'General'),
(615, 'e858d24b-7c93-4294-905a-bd758286626b', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 22:59:19', '2024-12-24 22:59:19', NULL, NULL, 'General'),
(616, '33e146be-de0a-4bce-9fde-380c52ea7707', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:20', '2024-12-24 22:59:20', NULL, NULL, 'General'),
(617, '2a51486b-09d6-4b11-a315-4419456d110d', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:20', '2024-12-24 22:59:20', NULL, NULL, 'General'),
(618, '845e08de-680d-4891-bdd5-6859134b1ce8', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:20', '2024-12-24 22:59:20', NULL, NULL, 'General'),
(619, 'a3946cbb-bd7b-43a6-b34b-9e2c049c9356', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:20', '2024-12-24 22:59:20', NULL, NULL, 'General'),
(620, 'c415f076-cdea-41e0-9a2a-ac3937ce61bd', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:21', '2024-12-24 22:59:21', NULL, NULL, 'General'),
(621, '4bdc0bde-1184-4141-923a-b887dba940d7', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:21', '2024-12-24 22:59:21', NULL, NULL, 'QC Attribute'),
(622, 'a1edab9b-ce2c-41d3-8331-5f22a636af1e', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:21', '2024-12-24 22:59:21', NULL, NULL, 'QC Attribute'),
(623, 'd0f4391c-0258-4484-8653-65cf75fd09f2', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:21', '2024-12-24 22:59:21', NULL, NULL, 'QC Attribute'),
(624, 'e7304231-cc50-42fb-bdcf-3d72dc9a28e7', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_o2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 22:59:22', '2024-12-24 22:59:22', NULL, NULL, 'QC Attribute'),
(625, '18fedf12-83a1-4dce-9fe2-5e3f624dd368', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:22', '2024-12-24 22:59:22', NULL, NULL, 'QC Attribute'),
(626, 'a78ced79-9312-4847-be44-b74698a2766b', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_o2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:23', '2024-12-24 22:59:23', NULL, NULL, 'QC Attribute'),
(627, '4181db76-7efa-40eb-996e-643aa2c6c9ec', 'parent_uuid', 'Parent Id', 'varchar', NULL, 1, 1, 'operation_p2', '1', '1', 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 22:59:23', '2024-12-24 22:59:23', NULL, NULL, 'General'),
(628, '9f26da02-55dd-4802-99d3-e3715e5e530d', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 22:59:24', '2024-12-24 22:59:24', NULL, NULL, 'General'),
(629, '5e790ea3-88fb-4e24-96f8-6d1c8892e48b', 'part_uuid', 'Part Id', 'varchar', NULL, 1, 1, 'operation_p2', '1', '1', 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 22:59:24', '2024-12-24 22:59:24', NULL, NULL, 'General'),
(630, 'bdc81df8-9c11-41d2-8e06-c4cbf62f5dde', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 22:59:24', '2024-12-24 22:59:24', NULL, NULL, 'General'),
(631, 'cbf142a5-0a3c-48e9-9e17-7a8846d5bc6f', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:24', '2024-12-24 22:59:24', NULL, NULL, 'General'),
(632, '6af6490e-86b5-4e85-8606-9e0bb64a5ebd', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_p2', NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:25', '2024-12-24 22:59:25', NULL, NULL, 'General'),
(633, 'a0ca28f7-3a2d-4307-b54c-78deeabfb061', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:25', '2024-12-24 22:59:25', NULL, NULL, 'General'),
(634, '55e4cde6-7d7f-4c30-b0c8-ca56c12069d3', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:25', '2024-12-24 22:59:25', NULL, NULL, 'General'),
(635, '2fcc89be-9b75-4698-8266-661debee29f1', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:25', '2024-12-24 22:59:25', NULL, NULL, 'General'),
(636, '48c4e1ad-4683-4250-a27d-f0e18ee60d49', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:25', '2024-12-24 22:59:25', NULL, NULL, 'QC Attribute'),
(637, '606dff67-5d82-4de8-b72a-657ab02c658d', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:26', '2024-12-24 22:59:26', NULL, NULL, 'QC Attribute'),
(638, '93eace37-afe5-47c3-81b4-c16a037c0f79', 'qc_date', 'QC Date', 'integer', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:26', '2024-12-24 22:59:26', NULL, NULL, 'QC Attribute'),
(639, 'b3de5e4c-47d2-4085-b2e8-1752516e5aef', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_p2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 22:59:26', '2024-12-24 22:59:26', NULL, NULL, 'QC Attribute'),
(640, 'aca9597e-706f-4e26-887e-7ebad3d36e66', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:26', '2024-12-24 22:59:26', NULL, NULL, 'QC Attribute'),
(641, 'acbb9482-5d6f-4c0c-bb6a-decdd07792e7', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_p2', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 22:59:27', '2024-12-24 22:59:27', NULL, NULL, 'QC Attribute'),
(642, 'de75bfe9-31f9-45e2-ae29-2b9a3b3f8271', 'parent_uuid', 'OP Id', 'varchar', 99, 1, 1, 'operation_q2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-12-24 23:18:31', '2024-12-24 23:18:31', NULL, NULL, 'General'),
(643, 'b7a30ada-020e-42e8-82ce-e8e630e942ea', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_q2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 23:18:31', '2024-12-24 23:18:31', NULL, NULL, 'General'),
(644, '6ed81bcd-0adc-4305-a757-562535e94f52', 'part_uuid', 'Part Id', 'varchar', NULL, 1, 1, 'operation_q2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-12-24 23:18:31', '2024-12-24 23:18:31', NULL, NULL, 'General'),
(645, '48c46a79-8f19-4bbd-b878-8bc23c7b6158', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'select', 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 23:18:32', '2024-12-24 23:18:32', NULL, NULL, 'General'),
(646, 'f8566d5f-93f9-4a55-ac52-2b54ab3a050a', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:32', '2024-12-24 23:18:32', NULL, NULL, 'General'),
(647, 'e4ff9e23-d316-4de0-9d7d-ddff82501551', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_q2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:32', '2024-12-24 23:18:32', NULL, NULL, 'General'),
(648, '86763604-f5e8-4c3c-85b7-be475ed51587', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_q2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:32', '2024-12-24 23:18:32', NULL, NULL, 'General'),
(649, '85009cac-b972-4ceb-8071-6fde6395a4a3', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:33', '2024-12-24 23:18:33', NULL, NULL, 'General'),
(650, '2419c8e0-7a2d-4894-9274-2e861c9b2598', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:33', '2024-12-24 23:18:33', NULL, NULL, 'General'),
(651, '510d62c6-3e58-411b-bc0d-7c3a02d76030', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:33', '2024-12-24 23:18:33', NULL, NULL, 'QC Attribute'),
(652, '03234cc1-89ec-4e1a-8e09-0b442a409fda', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_q2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:34', '2024-12-24 23:18:34', NULL, NULL, 'QC Attribute'),
(653, '8338bffb-c24a-42d4-99bb-d675950a2742', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_q2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 23:18:34', '2024-12-24 23:18:34', NULL, NULL, 'QC Attribute'),
(654, '71c262b9-55a6-4b58-bfdc-12e4cc62aef6', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_q2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:34', '2024-12-24 23:18:34', NULL, NULL, 'QC Attribute'),
(655, '1347a8bc-f4d3-48c7-8c53-fcca63754563', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_q2', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 23:18:34', '2024-12-24 23:18:34', NULL, NULL, 'QC Attribute'),
(656, 'b98c8cec-e552-4ee4-83ad-889b1382df12', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_q2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:35', '2024-12-24 23:18:35', NULL, NULL, 'QC Attribute'),
(657, '752862db-4d8c-43e4-9c51-4a0502a97dc5', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_q', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology', '2024-12-24 23:18:35', '2024-12-24 23:18:35', NULL, NULL, 'General'),
(658, 'b3cb1037-b9a0-4e87-9f97-f1adb6660b2b', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_q', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 23:18:35', '2024-12-24 23:18:35', NULL, NULL, 'General'),
(659, 'b9eea7af-6d1d-47ee-8123-6fcfe757f60d', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_q', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 23:18:35', '2024-12-24 23:18:35', NULL, NULL, 'General'),
(660, '905d978e-4ab8-4793-a8b8-6b92f8773566', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_q', '1', '1', 'select', NULL, NULL, NULL, 'employeeData+all-employees', '2024-12-24 23:18:36', '2024-12-24 23:18:36', NULL, NULL, 'General'),
(661, 'fcf337f2-83b9-4f9d-b7e6-3c69e3544f5a', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_q', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:36', '2024-12-24 23:18:36', NULL, NULL, 'General'),
(662, 'feef0cfb-e48f-425b-a1fb-6725bb433eb9', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'operation_q', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 23:18:36', '2024-12-24 23:18:36', NULL, NULL, 'General'),
(663, '7aa03f59-028f-47d6-811d-84e90ee7e899', 'op_id', 'OP Id', 'varchar', NULL, 1, 0, 'operation_q', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 23:18:36', '2024-12-24 23:18:36', NULL, NULL, 'General'),
(664, 'd89349a2-6f29-4f5a-b711-1748b3fd06bb', 'technology_uuid', 'Technology', 'varchar', 99, 1, 1, 'operation_k', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology\n', '2024-12-24 17:48:39', '2024-12-24 17:48:39', NULL, NULL, 'General'),
(665, 'cef55cd6-f6d5-477a-92f4-c594c83660e9', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_k', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 17:48:40', '2024-12-24 17:48:40', NULL, NULL, 'General'),
(666, '4716bdb8-7cd5-4919-a082-a6cc1ef13152', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_k', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 17:48:41', '2024-12-24 17:48:41', NULL, NULL, 'General'),
(667, '1b770cf6-aaa0-4b16-b7a4-c6d7dff0adb1', 'total_hrs', 'Total Hrs.', 'integer', NULL, 1, NULL, 'operation_k', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 17:48:41', '2024-12-24 17:48:41', NULL, NULL, 'General'),
(668, '8fd26af0-0c49-4906-a42e-7ac64ada1cb7', 'assigned_to', 'Assigned to', 'varchar', NULL, 1, 1, 'operation_k', NULL, NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 17:48:42', '2024-12-24 17:48:42', NULL, NULL, 'General'),
(669, 'df523165-5196-4d89-92e0-f1b453723bd6', 'total_qty', 'Total Qty', 'integer', NULL, 1, NULL, 'operation_k', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 17:48:42', '2024-12-24 17:48:42', NULL, NULL, 'General'),
(670, '74d80576-d111-4df2-a3bc-9b3456caf692', 'op_id', 'OP Id', 'varchar', NULL, 1, NULL, 'operation_k', NULL, NULL, 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 17:48:43', '2024-12-24 17:48:43', NULL, NULL, 'General'),
(671, 'e03f6550-17ef-41ac-8ad0-db3576c2f285', 'order_uuid', 'Order Id', 'varchar', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 17:48:43', '2024-12-24 17:48:43', NULL, NULL, 'General'),
(672, '5dc011e7-7ba1-44be-9b2e-b2ba4ebd1bc3', 'part_uuid', 'Part Id', 'varchar', NULL, 1, 1, 'operation_k2', NULL, NULL, 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 17:48:43', '2024-12-24 17:48:43', NULL, NULL, 'General'),
(673, '22db6d5f-b3eb-4297-a82b-691356a89bb3', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 17:48:44', '2024-12-24 17:48:44', NULL, NULL, 'General'),
(674, '90762351-9ec1-4faf-b23e-dc6902ab6f89', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 17:48:44', '2024-12-24 17:48:44', NULL, NULL, 'General'),
(675, '76f5c838-52f7-4d0c-bdad-b6ae5cdf4c96', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 17:48:45', '2024-12-24 17:48:45', NULL, NULL, 'General'),
(676, '4987fdb0-3387-4d95-af0f-4e897b068bbd', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 17:48:45', '2024-12-24 17:48:45', NULL, NULL, 'General'),
(677, '00c6acf5-6c57-4a27-8612-d044af0ccfa3', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 17:48:45', '2024-12-24 17:48:45', NULL, NULL, 'General'),
(678, '395d7f92-6ebe-47a7-8cd7-3fa79acb403b', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 17:48:46', '2024-12-24 17:48:46', NULL, NULL, 'General'),
(679, 'd2f9c7de-fd18-499e-ac4c-7b75348ae4ff', 'parent_uuid', NULL, 'varchar', NULL, 1, NULL, 'operation_k2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:48:46', '2024-12-24 17:48:46', NULL, NULL, 'General'),
(680, '55058f51-af27-41f7-aa55-f61b394866fa', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 17:48:47', '2024-12-24 17:48:47', NULL, NULL, 'QC Attribute'),
(681, '9c299527-e4b4-48cb-b11e-42a4f25d23bd', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_j2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 17:48:47', '2024-12-24 17:48:47', NULL, NULL, 'QC Attribute'),
(682, '1f6a2350-4410-4fe0-bf0e-eef45fa0bf4a', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:49', '2024-12-24 18:45:49', NULL, NULL, 'General'),
(683, '01a6a95f-06e5-4505-9956-4f32c13acc00', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 18:45:49', '2024-12-24 18:45:49', NULL, NULL, 'QC Attribute'),
(684, '7a13739e-86a9-4f0e-a3e2-1a13439d381e', 'qc_by', 'QC By', 'varchar', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 18:45:50', '2024-12-24 18:45:50', NULL, NULL, 'QC Attribute'),
(685, '846cb6cd-c85f-4d0b-bd02-0a2054848151', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:50', '2024-12-24 18:45:50', NULL, NULL, 'QC Attribute'),
(686, 'd777e8e1-d369-4044-a5ea-dfd720523c4c', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_k2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:50', '2024-12-24 18:45:50', NULL, NULL, 'QC Attribute'),
(687, '9de1d9bb-8cc9-48aa-9f9d-9e1a5269e775', 'op_id', 'OP ID', 'varchar', NULL, 1, NULL, 'operation_l', NULL, NULL, 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 18:45:51', '2024-12-24 18:45:51', NULL, NULL, 'General'),
(688, '99d769a6-a463-4f7d-9ee9-a970b1ce1606', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_l', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 18:45:51', '2024-12-24 18:45:51', NULL, NULL, 'General'),
(689, '988453fd-7606-44d4-a003-7230a8f74d05', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_l', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 18:45:51', '2024-12-24 18:45:51', NULL, NULL, 'General'),
(690, 'c0819235-742f-4709-b902-c832a2411da2', 'total_hrs', 'Total Hrs', 'integer', NULL, 1, NULL, 'operation_l', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:52', '2024-12-24 18:45:52', NULL, NULL, 'General'),
(691, '6409158f-9566-4c90-93e3-7dd787e51b98', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_l', NULL, NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 18:45:52', '2024-12-24 18:45:52', NULL, NULL, 'General'),
(692, 'ef4a48e9-0d85-4b25-bd25-3c533145f9ff', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_l2', NULL, NULL, 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 18:45:53', '2024-12-24 18:45:53', NULL, NULL, 'General'),
(693, 'd2d239a2-b863-462e-b28f-f0682176bd45', 'part_uuid', 'Part Id', 'varchar', NULL, 1, 1, 'operation_l2', NULL, NULL, 'varchar', NULL, NULL, NULL, NULL, '2024-12-24 18:45:53', '2024-12-24 18:45:53', NULL, NULL, 'General'),
(694, '5a4ed37e-6f94-4df8-a954-290f591c6a79', 'part_status', 'Part Status', 'varchar', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 18:45:54', '2024-12-24 18:45:54', NULL, NULL, 'General'),
(695, '69b6a35b-7cea-44a8-a609-0f6878e71e76', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:54', '2024-12-24 18:45:54', NULL, NULL, 'General'),
(696, '57b4959e-2038-420d-9c4e-cf684c06add9', 'qty', 'Qty', 'integer', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:54', '2024-12-24 18:45:54', NULL, NULL, 'General'),
(697, '7e1d2006-e6ec-412d-a8ec-801035a9f510', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:55', '2024-12-24 18:45:55', NULL, NULL, 'General'),
(698, '9dcc7341-0f46-4f1f-a7ca-cf006d924a07', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:55', '2024-12-24 18:45:55', NULL, NULL, 'General'),
(699, 'f1063c99-3cd3-4d61-9e1f-2daa6039dc51', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:56', '2024-12-24 18:45:56', NULL, NULL, 'General'),
(700, '420637b4-e11a-4b0b-b544-8021f2be2c66', 'parent_uuid', NULL, 'varchar', NULL, 1, NULL, 'operation_l2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 18:45:56', '2024-12-24 18:45:56', NULL, NULL, 'General'),
(701, '529ade1b-e40f-4b45-a250-e80de2534fbc', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:56', '2024-12-24 18:45:56', NULL, NULL, 'QC Attribute'),
(702, 'd132b925-b97d-4612-a7d9-b489d2243ed1', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:57', '2024-12-24 18:45:57', NULL, NULL, 'QC Attribute'),
(703, '3eeb029b-9c2e-44a9-b41b-4d4a6c54cc51', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 18:45:57', '2024-12-24 18:45:57', NULL, NULL, 'QC Attribute'),
(704, '4c355738-7b39-46c7-a1b4-fc54a40d9003', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_l2', NULL, NULL, 'select', NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 18:45:57', '2024-12-24 18:45:57', NULL, NULL, 'QC Attribute'),
(705, '01b2df09-82db-4e06-b16a-031ce687424d', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 18:45:58', '2024-12-24 18:45:58', NULL, NULL, 'QC Attribute'),
(706, 'e7a437ca-4cbd-4da3-bd6f-ed01757f1cc9', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_l2', NULL, NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 18:45:58', '2024-12-24 18:45:58', NULL, NULL, 'QC Attribute'),
(707, 'b361d5ed-07b7-46b6-9d2c-e709bbebe291', 'technology_uuid', 'Technology', 'varchar', NULL, 1, 1, 'operation_l', NULL, NULL, 'select', NULL, NULL, NULL, 'technologyData+all-technology\n', '2024-12-24 19:00:10', '2024-12-24 19:00:10', NULL, NULL, 'General'),
(708, 'f94b4008-d089-47ef-b205-17d7c2a06e56', 'technology_uuid', 'Technology', 'varchar', 50, 1, 1, 'operation_l', NULL, NULL, 'select', NULL, NULL, NULL, 'technologyData+all-technology\n', '2024-12-24 19:00:46', '2024-12-24 19:00:46', NULL, NULL, 'General'),
(709, '07217eb6-fd2b-436e-9493-c3047cd44c3c', 'technology_uuid', 'Service', 'varchar', 99, 1, 1, 'operation_m', '1', '1', 'select', NULL, NULL, NULL, 'technologyData+all-technology\n', '2024-12-24 17:03:26', '2024-12-24 17:03:26', NULL, NULL, 'General'),
(710, 'e23a08f9-95fd-4e50-81f7-c3a5f2a9cfbb', 'start_end', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_m', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 17:03:26', '2024-12-24 17:03:26', NULL, NULL, 'General'),
(711, '464f124a-bc30-4c80-be6f-6f3fe8240f33', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_m', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 17:03:27', '2024-12-24 17:03:27', NULL, NULL, 'General'),
(712, 'e74051d2-cba5-4b8b-9944-8765bb33e141', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_m', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:27', '2024-12-24 17:03:27', NULL, NULL, 'General'),
(713, '50f56a8f-2061-4a03-bcf5-497ec1d152b5', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_m', '1', '1', NULL, NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 17:03:28', '2024-12-24 17:03:28', NULL, NULL, 'General'),
(714, '5b1d6539-5e1a-41c8-847a-84f25e9604c9', 'op_id', 'OP ID', 'text', NULL, 1, NULL, 'operation_m', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:28', '2024-12-24 17:03:28', NULL, NULL, 'General'),
(715, '61b676c8-d163-454e-99c7-642aba2eca12', 'total_qty', 'Total Quantity', 'integer', NULL, 1, NULL, 'operation_m', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:29', '2024-12-24 17:03:29', NULL, NULL, 'General'),
(716, 'e9788151-93dd-4b8e-98ed-222bbb05c237', 'technology_uuid', 'Service', 'varchar', NULL, 1, 1, 'operation_n', '1', '1', 'select', NULL, 1, NULL, 'technologyData+all-technology\n', '2024-12-24 17:03:29', '2024-12-24 17:03:29', NULL, NULL, 'General'),
(717, '157157a2-7c3c-49f0-9fe2-1d3f60fb215d', 'start_time', 'Start Time', 'dateTime', NULL, 1, NULL, 'operation_n', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:29', '2024-12-24 17:03:29', NULL, NULL, 'General'),
(718, '6120fc90-9655-4ee3-b61f-f23fc71e46ea', 'end_time', 'End Time', 'dateTime', NULL, 1, NULL, 'operation_n', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:30', '2024-12-24 17:03:30', NULL, NULL, 'General'),
(719, '7133ece6-9fcb-464a-89f1-a9d2d772d84e', 'total_hrs', 'Total Hours', 'integer', NULL, 1, NULL, 'operation_n', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:30', '2024-12-24 17:03:30', NULL, NULL, 'General'),
(720, '7b10996f-8a6e-48b1-8597-4845ef41f39e', 'assigned_to', 'Assigned To', 'varchar', NULL, 1, 1, 'operation_n', '1', '1', NULL, NULL, NULL, NULL, 'employeeData+all-employees\n', '2024-12-24 17:03:30', '2024-12-24 17:03:30', NULL, NULL, 'General'),
(721, '3cf39c98-51e2-4ca0-be81-b3268a61eae5', 'op_id', 'OP ID', 'text', NULL, 1, NULL, 'operation_n', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:31', '2024-12-24 17:03:31', NULL, NULL, 'General'),
(722, '94c045af-dd46-4a44-a6d9-6b87648c4515', 'total_qty', 'Total Quantity', 'integer', NULL, 1, NULL, 'operation_n', '1', '1', NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:03:31', '2024-12-24 17:03:31', NULL, NULL, 'General'),
(723, '11159fc6-f53f-4b44-ae52-96507474995f', 'parent_uuid', 'OP Id', 'varchar', 99, 1, 1, 'operation_m2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:25', '2024-12-24 21:06:25', NULL, NULL, 'General'),
(724, '7a6022e8-d5ac-4c84-ba91-0d780e4f7038', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_m2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 21:06:26', '2024-12-24 21:06:26', NULL, NULL, 'General'),
(725, '71f3d679-0973-446b-b18c-038c1f9f6206', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'operation_m2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-12-24 21:06:26', '2024-12-24 21:06:26', NULL, NULL, 'General'),
(726, '197fb350-5a03-4b37-b866-b9067b29a77a', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'select', 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 21:06:26', '2024-12-24 21:06:26', NULL, NULL, 'General'),
(727, '6d78d768-4aa8-455b-8f15-3d72ff633f02', 'file_path', 'File', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:26', '2024-12-24 21:06:26', NULL, NULL, 'General'),
(728, '88aba075-8387-4c4c-9164-17f76e2f6587', 'qty', 'Quantity', 'integer', NULL, 1, NULL, 'operation_m2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:27', '2024-12-24 21:06:27', NULL, NULL, 'General'),
(729, '393d1e1d-6e7c-4c2d-994d-233cabce7578', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_m2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:27', '2024-12-24 21:06:27', NULL, NULL, 'General'),
(730, 'a1ce88a6-359a-4d22-9b40-956d4ba7d4d1', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:27', '2024-12-24 21:06:27', NULL, NULL, 'General'),
(731, 'e60ae6ab-0c61-494f-80b6-c651388e3e0e', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:28', '2024-12-24 21:06:28', NULL, NULL, 'General');
INSERT INTO `column_spec` (`id`, `uuid`, `column_name`, `lable`, `column_type`, `length`, `nullable`, `index`, `data_table_name`, `show_in_listing`, `show_in_form`, `form_input_type`, `form_drop_down_list`, `required`, `show_if`, `list_from`, `created_at`, `updated_at`, `column_position`, `column_position_listing`, `type`) VALUES
(732, '1da3e8d1-4d85-4b7c-b43a-45697a9bda02', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_m2', '1', '1', 'select', NULL, NULL, NULL, 'all-employees', '2024-12-24 21:06:28', '2024-12-24 21:06:28', NULL, NULL, 'QC Attribute'),
(733, 'e572b628-35e5-47f9-9850-8526ff747a5a', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_m2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:28', '2024-12-24 21:06:28', NULL, NULL, 'QC Attribute'),
(734, '7ab3efbe-2689-42d7-a4db-5b5bdff31092', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_m2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:29', '2024-12-24 21:06:29', NULL, NULL, 'QC Attribute'),
(735, '6ef4d749-f5f3-4843-8306-a9e16916e5eb', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_m2', '1', '1', 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 21:06:29', '2024-12-24 21:06:29', NULL, NULL, 'QC Attribute'),
(736, '566afaf4-0592-4ba2-a558-5137158067ab', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:29', '2024-12-24 21:06:29', NULL, NULL, 'QC Attribute'),
(737, 'dd8adc49-a1a4-431a-ba3a-685238f7ec46', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_m2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:30', '2024-12-24 21:06:30', NULL, NULL, 'QC Attribute'),
(738, 'b450413a-4475-4bcc-a79e-0f6d06d6e8d4', 'parent_uuid', 'OP Id', 'varchar', NULL, 1, 1, 'operation_n2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:30', '2024-12-24 21:06:30', NULL, NULL, 'General'),
(739, 'dc2cd610-54b0-4e4c-97e3-d28b27166586', 'order_uuid', 'Order Id', 'varchar', NULL, 1, 1, 'operation_n2', '1', '1', 'select', NULL, NULL, NULL, 'orderData+all-orders', '2024-12-24 21:06:30', '2024-12-24 21:06:30', NULL, NULL, 'General'),
(740, '96b1eb4c-0514-48a7-8a6e-e138cd0c2e43', 'part_uuid', 'Part Name', 'varchar', NULL, 1, 1, 'operation_n2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-12-24 21:06:31', '2024-12-24 21:06:31', NULL, NULL, 'General'),
(741, 'de106dec-c446-4dff-86e0-f2947327e498', 'part_status', 'Part Status', 'text', NULL, 1, NULL, 'operation_n2', '1', '1', 'select', 'Pass, Fail', NULL, NULL, NULL, '2024-12-24 21:06:31', '2024-12-24 21:06:31', NULL, NULL, 'General'),
(742, '5478eab7-40b0-4556-8bac-4db72a4397c2', 'qty', 'Quantity', 'integer', NULL, 1, NULL, 'operation_n2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:31', '2024-12-24 21:06:31', NULL, NULL, 'General'),
(743, '9fbfaf7f-9b92-465c-b606-004454b8b877', 'failed_qty', 'Failed Qty', 'integer', NULL, 1, NULL, 'operation_n2', '1', '1', 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:32', '2024-12-24 21:06:32', NULL, NULL, 'General'),
(744, '4cc2f520-7bc2-427e-be94-ad9aa0c3ab7d', 'remark', 'Remark', 'text', NULL, 1, NULL, 'operation_n2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:32', '2024-12-24 21:06:32', NULL, NULL, 'General'),
(745, '3dd1aa30-79be-48be-a2cc-c7ecae1a8fa0', 'failure_reason', 'Failure Reason', 'text', NULL, 1, NULL, 'operation_n2', '1', '1', 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:32', '2024-12-24 21:06:32', NULL, NULL, 'General'),
(746, 'f870f117-c29c-4793-9fa8-78c92febd4be', 'qc_remark', 'QC Remark', 'text', NULL, 1, NULL, 'operation_n2', '1', NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:33', '2024-12-24 21:06:33', NULL, NULL, 'QC Attribute'),
(747, 'c1103ebe-1468-45fe-aacd-6053658c3fc0', 'qc_qty', 'QC Qty', 'integer', NULL, 1, NULL, 'operation_n2', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:33', '2024-12-24 21:06:33', NULL, NULL, 'QC Attribute'),
(748, '59a18cd3-96b3-4e6b-b374-4ec1fc686802', 'qc_date', 'QC Date', 'dateTime', NULL, 1, NULL, 'operation_n2', '1', NULL, 'dateTime', NULL, NULL, NULL, NULL, '2024-12-24 21:06:33', '2024-12-24 21:06:33', NULL, NULL, 'QC Attribute'),
(749, '0e3e4efe-f379-46fe-8eca-e14b3728c17f', 'qc_by', 'QC By', 'varchar', NULL, 1, 1, 'operation_n2', '1', '1', 'select', NULL, NULL, NULL, NULL, '2024-12-24 21:06:33', '2024-12-24 21:06:33', NULL, NULL, 'QC Attribute'),
(750, 'b8aa4c0d-4373-4888-9930-ab747f924284', 'qc_attribute', 'QC Attribute', 'text', NULL, 1, NULL, 'operation_n2', '1', NULL, 'text', NULL, NULL, NULL, NULL, '2024-12-24 21:06:34', '2024-12-24 21:06:34', NULL, NULL, 'QC Attribute'),
(751, 'facd43f1-a966-4484-8348-9043614ac746', 'qc_measure', 'QC Measure', 'integer', NULL, 1, NULL, 'operation_n2', '1', NULL, 'number', NULL, NULL, NULL, NULL, '2024-12-24 21:06:34', '2024-12-24 21:06:34', NULL, NULL, 'QC Attribute');

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `order_uuid` text DEFAULT NULL,
  `complain_reason` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `salesperson_bde` varchar(99) DEFAULT NULL,
  `user_uuid` varchar(99) DEFAULT NULL,
  `action` varchar(99) DEFAULT NULL,
  `complain_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `complain_id` varchar(99) DEFAULT NULL,
  `exp_delivery_date` date DEFAULT NULL,
  `all_order_count` varchar(250) DEFAULT NULL,
  `year_order_count` varchar(250) DEFAULT NULL,
  `complain_status` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complain_docs`
--

CREATE TABLE `complain_docs` (
  `uuid` char(36) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `complain_uuid` char(36) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, 'aba260c7-0668-4288-8355-104d13a5734f', 'Accounts', '2024-03-27 12:38:08', '2024-03-27 12:38:08'),
(4, 'b7772001-31f8-45f6-8cc5-c8d155665175', 'Marketing', '2024-02-23 15:42:16', '2024-03-27 12:38:18'),
(5, '4dd644c5-6654-4135-bd8d-86bc416cc399', 'Sales', '2024-02-24 07:07:00', '2024-02-24 07:07:00'),
(7, '4b4507b0-039a-471c-8614-4925c08adad8', 'R&D', '2024-02-28 08:52:44', '2024-02-28 08:52:44'),
(10, 'f3b7d489-e311-49b7-9492-c1d2780cc8e7', 'Production', '2024-03-27 12:38:27', '2024-03-27 12:38:27'),
(11, 'ecb7ab5d-f0b9-4120-8ac9-3a16e3218a0b', 'Purchase', '2024-03-27 12:38:55', '2024-03-27 12:38:55'),
(12, '9de09ea9-1cdb-4bd7-b0c3-ffc7a6e99bb6', 'HR', '2024-03-27 12:39:27', '2024-03-27 12:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `event_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` text DEFAULT NULL,
  `top_deal` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `event_by` varchar(100) DEFAULT NULL,
  `coupon_code` varchar(99) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `technology_uuid` text DEFAULT NULL,
  `moq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_qc`
--

CREATE TABLE `final_qc` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `order_uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qc_by` varchar(100) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` int(36) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `industry_type` varchar(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `uuid`, `industry_type`, `created_at`, `updated_at`) VALUES
(17, '7288a4b9-f9f6-43f0-8cb4-ea7bc4b2aa2d', 'Aerospace', '2024-09-12 06:54:40', '2024-09-12 06:54:40'),
(18, 'b4ff44a1-6783-412f-96ba-dc7aea3248c8', 'Architecture', '2024-09-12 06:56:01', '2024-09-12 06:56:01'),
(19, 'f251d748-3429-4667-9043-1c3ca960ec30', 'Defence', '2024-09-12 12:37:44', '2024-09-12 12:37:44'),
(20, '8eba0789-2202-414c-9082-fd9568cb699e', 'Electronics', '2024-09-12 07:05:13', '2024-09-12 07:05:13'),
(21, '8b16c29b-39af-420b-b793-15c2e9faa63e', 'Industrial', '2024-09-12 07:05:48', '2024-09-12 07:05:48'),
(22, 'ec193f7e-78b4-4aa4-b212-0ee2155b4ce4', 'Medical', '2024-09-12 07:06:16', '2024-09-12 07:06:16'),
(23, '15dd4cae-dca8-4dab-834d-4a72f6fe4aee', 'Oli and Gas', '2024-09-12 07:06:42', '2024-09-12 07:06:42'),
(24, '2f2cf62b-cc03-4d44-9c3c-445f5b718329', 'Plastic(FMCG)', '2024-09-12 07:07:13', '2024-09-12 07:07:13'),
(25, 'ac6f21b1-ffb2-44bb-be7d-09c68343f5ea', 'B2B', '2024-09-14 00:17:32', '2024-09-14 00:17:32'),
(27, '4f6be53e-ac87-4c3b-be92-fbed2110a380', 'Automotive', '2024-10-09 08:52:27', '2024-10-09 08:52:27'),
(28, 'a2378f5d-8f29-47e6-8709-357013816ac3', 'University', '2024-11-13 08:24:56', '2024-11-13 08:24:56'),
(29, 'f73c5ff7-f0b2-42b8-8e4c-a47fc9bea497', 'Toy', '2024-12-14 09:32:53', '2024-12-14 09:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `inline_management`
--

CREATE TABLE `inline_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `order_plan2_uuid` varchar(99) DEFAULT NULL,
  `print_plan2_uuid` varchar(99) DEFAULT NULL,
  `current_process` varchar(50) DEFAULT NULL,
  `upcoming_process` varchar(99) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `processed_qty` int(11) DEFAULT NULL,
  `pending_qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `mobile` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `inquiry_id` text NOT NULL,
  `quantity_of_parts` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company` text DEFAULT NULL,
  `cost` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `year_order_count` varchar(250) NOT NULL,
  `all_order_count` varchar(240) NOT NULL,
  `order_uuid` char(36) DEFAULT NULL,
  `inquiry_date` date DEFAULT NULL,
  `status` varchar(224) DEFAULT NULL,
  `client_type` text DEFAULT NULL,
  `salesperson_bde` char(36) DEFAULT NULL,
  `new_client_name` text DEFAULT NULL,
  `quotation_status` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `quotation_uuid` char(36) DEFAULT NULL,
  `technology_name` text DEFAULT NULL,
  `lost_reason` text DEFAULT NULL,
  `tentative_timeline` int(11) DEFAULT NULL,
  `outsourcing` varchar(36) DEFAULT NULL,
  `total_CC` varchar(200) DEFAULT NULL,
  `target_cost` varchar(36) DEFAULT NULL,
  `inquiry_type` varchar(100) DEFAULT NULL,
  `industry_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `material_variant` text DEFAULT NULL,
  `material_name` text DEFAULT NULL,
  `technical_specification` text DEFAULT NULL,
  `material` text DEFAULT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `unit_category` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `vendor_uuid` char(36) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `min_acceptable_qty` decimal(8,2) DEFAULT NULL,
  `inward` decimal(8,2) DEFAULT NULL,
  `outward` decimal(8,2) DEFAULT NULL,
  `available_stock` decimal(8,2) DEFAULT NULL,
  `stock_value` decimal(8,2) DEFAULT NULL,
  `category_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(199) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `order_uuid` varchar(199) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `invoice_date` date NOT NULL DEFAULT current_timestamp(),
  `delivery_terms` varchar(199) DEFAULT NULL,
  `generated_by` varchar(199) DEFAULT NULL,
  `shipping_type` varchar(199) DEFAULT NULL,
  `discount` varchar(199) DEFAULT NULL,
  `packing` varchar(199) DEFAULT NULL,
  `final_price` varchar(199) DEFAULT NULL,
  `invoice_id` text DEFAULT NULL,
  `all_order_count` int(11) DEFAULT NULL,
  `year_order_count` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inward_qc`
--

CREATE TABLE `inward_qc` (
  `id` int(100) NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `requested_date` date DEFAULT NULL,
  `purchase_item_uuid` varchar(50) DEFAULT NULL,
  `inventory_uuid` varchar(50) DEFAULT NULL,
  `iqc_by` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `type_description` varchar(100) DEFAULT NULL,
  `qty` int(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `rejected_qty` int(50) DEFAULT NULL,
  `reject_reason` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inward_sheet`
--

CREATE TABLE `inward_sheet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `inward_date` datetime DEFAULT NULL,
  `material` text DEFAULT NULL,
  `inventory_uuid` char(36) DEFAULT NULL,
  `vendor_uuid` char(36) DEFAULT NULL,
  `container_id` text DEFAULT NULL,
  `spool_container_number` int(11) DEFAULT NULL,
  `material_weight` decimal(8,2) DEFAULT NULL,
  `container_status` text DEFAULT 'Available',
  `outward_weight` decimal(8,2) DEFAULT 0.00,
  `weight_available` decimal(8,2) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `category_uuid` char(36) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `unit_category` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `inward_by` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_uuid` varchar(99) DEFAULT NULL,
  `order_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledege_center`
--

CREATE TABLE `knowledege_center` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `service_uuid` char(36) DEFAULT NULL,
  `sub_service_uuid` char(36) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `id` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `machine_code` varchar(100) DEFAULT NULL,
  `machine_name` varchar(100) DEFAULT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `machine_status` text DEFAULT NULL,
  `bed_size` text DEFAULT NULL,
  `machine_type` varchar(110) DEFAULT NULL,
  `production_capacity` int(110) DEFAULT NULL,
  `current_output` varchar(110) DEFAULT NULL,
  `cycle_time` int(110) DEFAULT NULL,
  `down_time` int(110) DEFAULT NULL,
  `availability` int(110) DEFAULT NULL,
  `utilization_rate` int(110) DEFAULT NULL,
  `changeover_time` int(110) DEFAULT NULL,
  `overall_equipment_efficiency` int(110) DEFAULT NULL,
  `scrap_rate` int(110) DEFAULT NULL,
  `yield_rate` int(110) DEFAULT NULL,
  `maintenance_frequency` int(110) DEFAULT NULL,
  `energy_consumption` int(110) DEFAULT NULL,
  `inspection_results` text DEFAULT NULL,
  `lead_time` int(110) DEFAULT NULL,
  `comments` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_d`
--

CREATE TABLE `operation_d` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `machine` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `material_type` text DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_d2`
--

CREATE TABLE `operation_d2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_status` varchar(50) DEFAULT NULL,
  `part_status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `qc_remark` text DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_e`
--

CREATE TABLE `operation_e` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` tinytext DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_e2`
--

CREATE TABLE `operation_e2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) NOT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_by` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_f`
--

CREATE TABLE `operation_f` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_f2`
--

CREATE TABLE `operation_f2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_g`
--

CREATE TABLE `operation_g` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `end_time` datetime DEFAULT NULL,
  `total_hrs` text DEFAULT NULL,
  `assigned_to` text DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_g2`
--

CREATE TABLE `operation_g2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` text DEFAULT NULL,
  `part_uuid` text DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` text DEFAULT NULL,
  `qc_by` text DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` text DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_h`
--

CREATE TABLE `operation_h` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` int(50) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_h2`
--

CREATE TABLE `operation_h2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_i`
--

CREATE TABLE `operation_i` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `technology_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_i2`
--

CREATE TABLE `operation_i2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_remark` varchar(50) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` varchar(50) DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_j`
--

CREATE TABLE `operation_j` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_j2`
--

CREATE TABLE `operation_j2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_k`
--

CREATE TABLE `operation_k` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_k2`
--

CREATE TABLE `operation_k2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_l`
--

CREATE TABLE `operation_l` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `op_id` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_l2`
--

CREATE TABLE `operation_l2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_m`
--

CREATE TABLE `operation_m` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `start_end` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` text DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `technology_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_m2`
--

CREATE TABLE `operation_m2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `parent_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_n`
--

CREATE TABLE `operation_n` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `technology_uuid` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `op_id` text DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_n2`
--

CREATE TABLE `operation_n2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_o`
--

CREATE TABLE `operation_o` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `total_hrs` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `op_id` text DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `technology_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_o2`
--

CREATE TABLE `operation_o2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_p`
--

CREATE TABLE `operation_p` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(99) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `technology_uuid` varchar(50) DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `op_id` datetime DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_p2`
--

CREATE TABLE `operation_p2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_q`
--

CREATE TABLE `operation_q` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `technology_uuid` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_q2`
--

CREATE TABLE `operation_q2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `parent_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `order_status_uuid` char(36) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `order_id` text DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `inquiry_date` date DEFAULT NULL,
  `value` text DEFAULT NULL,
  `quantity_of_parts` text DEFAULT NULL,
  `finish_status` text DEFAULT NULL,
  `payment_status` text DEFAULT NULL,
  `length` text DEFAULT NULL,
  `width` text DEFAULT NULL,
  `height` text DEFAULT NULL,
  `salesperson_bde` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `material_uuid` char(36) DEFAULT NULL,
  `shipping_service` text DEFAULT NULL,
  `tracking_id` text DEFAULT NULL,
  `status` text DEFAULT '\'Disable\'',
  `all_order_count` int(11) DEFAULT NULL,
  `year_order_count` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `cancel_reason` text DEFAULT NULL,
  `technology_name` text DEFAULT NULL,
  `outsourcing` varchar(36) DEFAULT NULL,
  `rework_reason` varchar(255) DEFAULT NULL,
  `exp_delivery_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_files`
--

CREATE TABLE `orders_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `order_uuid` char(36) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `order_uuid` char(36) DEFAULT NULL,
  `order_status_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_plan`
--

CREATE TABLE `order_plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `batch_part_list` text DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `batch_status` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `batch_id` varchar(99) DEFAULT NULL,
  `batch_total_qty` int(11) DEFAULT NULL,
  `work_flow2_uuid` text DEFAULT NULL,
  `work_flow_uuid` varchar(99) DEFAULT NULL,
  `current_stage` varchar(99) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `assigned_by` varchar(99) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `processed_qty` int(11) DEFAULT NULL,
  `pending_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_plan2`
--

CREATE TABLE `order_plan2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `batch_order_parts` varchar(100) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `part_qty` int(11) DEFAULT NULL,
  `part_list_uuid` varchar(99) DEFAULT NULL,
  `current_process` varchar(50) DEFAULT NULL,
  `upcoming_process` varchar(99) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `processed_qty` int(11) DEFAULT NULL,
  `pending_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, 'd1394013-c731-462e-b7eb-75aa60f49e7f', 'Order Confirmation', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(2, '65d8bf8f-d2e8-4dd7-ac9a-297a35ae9939', 'PO Pending', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(3, '6d1cba00-4a18-4ed8-a0db-fd1bf7bbffb5', 'PO Received', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(4, 'b9b5620a-c37f-44fa-9af8-861a725249e2', 'Pre-Audit', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(5, '540ee125-60da-4fb3-8295-ebe0106a10b2', 'Design Modification', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(6, '03da47eb-e762-4a8b-8395-6689896a43c6', '3D Printing', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(7, '22bbe80f-bc6b-45d8-9f80-abb9aa9a47c2', 'Post Processing', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(8, '71590cd5-8bbe-4203-97b6-b337621aa0a7', 'Paint', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(9, '5590d4d9-d751-4351-ad29-aeb9b8aae259', 'Final Audit', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(10, 'c317b93a-c17a-44f2-a680-f8a11b50022a', 'Ready To Ship', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(11, '7c579bc1-b6bb-43ec-82fb-c61f3426a276', 'Shipped', '2023-10-30 03:07:26', '2023-10-30 03:07:26'),
(12, 'a81bc81b-dead-4e5d-abff-90865d1e13b1', 'Hold', '2023-10-30 03:07:26', '2023-10-30 03:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `outward_sheet`
--

CREATE TABLE `outward_sheet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `outward_date` datetime DEFAULT current_timestamp(),
  `technology_uuid` char(36) DEFAULT NULL,
  `material` text DEFAULT NULL,
  `inventory_uuid` char(36) DEFAULT NULL,
  `container_id` text DEFAULT NULL,
  `spool_container_number` int(11) DEFAULT NULL,
  `outward_weight` decimal(8,2) DEFAULT NULL,
  `outward_by` text DEFAULT NULL,
  `category_uuid` char(36) DEFAULT NULL,
  `unit_category` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `department_uuid` varchar(99) DEFAULT NULL,
  `order_uuid` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `part_list`
--

CREATE TABLE `part_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_uuid` char(36) DEFAULT NULL,
  `user_uuid` char(36) DEFAULT NULL,
  `technology_uuid` char(36) DEFAULT NULL,
  `inventory_uuid` char(36) DEFAULT NULL,
  `machine_uuid` char(36) DEFAULT NULL,
  `resolution` varchar(191) DEFAULT NULL,
  `part_name` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `per_part_weight` varchar(256) DEFAULT NULL,
  `volume_cc` varchar(256) DEFAULT NULL,
  `support_cc` varchar(256) DEFAULT NULL,
  `chargable_cc` varchar(256) DEFAULT NULL,
  `total_chargable_cc` varchar(256) DEFAULT NULL,
  `total_cc` varchar(256) DEFAULT NULL,
  `total_weight_cc` varchar(256) DEFAULT NULL,
  `finish_type` text DEFAULT NULL,
  `paint_required` text DEFAULT NULL,
  `mechanical_attachment` text DEFAULT NULL,
  `part_id` text DEFAULT NULL,
  `printed_qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `pending_qty` int(11) DEFAULT NULL,
  `part_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inquiry_id` text DEFAULT NULL,
  `cost_per_part` varchar(255) DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `quotation_uuid` char(255) DEFAULT NULL,
  `vendor_uuid` varchar(255) DEFAULT NULL,
  `part_description` text DEFAULT NULL,
  `rework_qty` int(11) DEFAULT NULL,
  `rework_action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_process`
--

CREATE TABLE `post_process` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `print_uuid` varchar(99) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_process2`
--

CREATE TABLE `post_process2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `part_uuid` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `part_status` varchar(50) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `order_plan2_uuid` varchar(99) DEFAULT NULL,
  `print_uuid` varchar(99) DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print`
--

CREATE TABLE `print` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `machine_uuid` text DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_part_cc` int(11) DEFAULT NULL,
  `assigned_to` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `detailing_agent` int(11) DEFAULT NULL,
  `packing_density` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `fusing_agent` int(11) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print2`
--

CREATE TABLE `print2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_uuid` varchar(50) DEFAULT NULL,
  `batch_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `failed_qty` int(50) DEFAULT NULL,
  `part_status` tinytext DEFAULT NULL,
  `actual_weight` tinytext DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `failure_reason` text DEFAULT NULL,
  `qc_attribute` varchar(50) DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `individual_cc` int(11) DEFAULT NULL,
  `total_cc` int(11) DEFAULT NULL,
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_plan`
--

CREATE TABLE `print_plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_plan2_uuid` text DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `order_plan_uuid` text DEFAULT NULL,
  `total_plan_qty` int(11) DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `assigned_by` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_plan2`
--

CREATE TABLE `print_plan2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `parent_uuid` varchar(99) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(99) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data_table_name` varchar(99) DEFAULT NULL,
  `model_name` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` bigint(20) NOT NULL,
  `purchase_id` char(36) DEFAULT NULL,
  `purchase_request_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `item_recieved_date` date DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `request_by` text DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `order_id` char(36) DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `purchased_by` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `approved_by` varchar(200) DEFAULT NULL,
  `technology` varchar(36) DEFAULT NULL,
  `category` varchar(36) DEFAULT NULL,
  `vendor_uuid` varchar(36) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `receive_by_date` date DEFAULT NULL,
  `unit_category` varchar(100) DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `purchase_department` varchar(100) DEFAULT NULL,
  `recurring_purchase` varchar(99) DEFAULT NULL,
  `recurring_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` bigint(10) NOT NULL,
  `uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `order_id` char(36) DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `purchase_by` varchar(200) DEFAULT NULL,
  `approved_by` varchar(200) DEFAULT NULL,
  `technology` char(36) DEFAULT NULL,
  `category` char(36) DEFAULT NULL,
  `vendor_uuid` mediumtext DEFAULT NULL,
  `image` text DEFAULT NULL,
  `receive_by_date` date DEFAULT NULL,
  `unit_category` varchar(100) DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `item_recieved_date` date DEFAULT NULL,
  `purchase_uuid` varchar(100) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `cost_per_qty` varchar(100) DEFAULT NULL,
  `exp_item_delivery_date` date DEFAULT NULL,
  `vendor_remarks` text DEFAULT NULL,
  `purchase_department` varchar(100) DEFAULT NULL,
  `receive_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quality_check`
--

CREATE TABLE `quality_check` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `op_id` varchar(50) DEFAULT NULL,
  `order_plan_uuid` varchar(99) DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `inline_from_uuid` varchar(50) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hrs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quality_check2`
--

CREATE TABLE `quality_check2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `order_uuid` varchar(50) DEFAULT NULL,
  `part_uuid` varchar(50) DEFAULT NULL,
  `parent_uuid` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `failed_qty` int(11) DEFAULT NULL,
  `part_status` text DEFAULT NULL,
  `order_plan_uuid` varchar(50) DEFAULT NULL,
  `qc_attribute` text DEFAULT NULL,
  `qc_measure` int(11) DEFAULT NULL,
  `qc_by` varchar(50) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `qc_remark` text DEFAULT NULL,
  `qc_date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `inline_from_uuid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `fail_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `inquiry_uuid` char(36) DEFAULT NULL,
  `order_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no` varchar(255) DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `all_order_count` varchar(255) DEFAULT NULL,
  `year_order_count` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `delivery_terms` varchar(255) DEFAULT NULL,
  `modifyquote_reason` varchar(255) DEFAULT NULL,
  `generated_by` text DEFAULT NULL,
  `update_count` int(11) DEFAULT NULL,
  `quotation_type` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `shipping_type` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `packing` varchar(255) DEFAULT NULL,
  `final_price` varchar(255) DEFAULT NULL,
  `employee_uuid` varchar(199) DEFAULT NULL,
  `razorpay_payment_id` varchar(200) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_history`
--

CREATE TABLE `quotation_history` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `quotation_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cost` varchar(255) DEFAULT NULL,
  `cost_per_part` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rework_history`
--

CREATE TABLE `rework_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `order_uuid` char(36) NOT NULL,
  `order_status_uuid` char(36) NOT NULL,
  `rework_reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `role` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_services`
--

CREATE TABLE `sub_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `service_uuid` char(36) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE `technologies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `role_uuid` char(36) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` text DEFAULT NULL,
  `alt_mobile` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `company` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `shopping_address` text DEFAULT NULL,
  `gst` text DEFAULT NULL,
  `designation_uuid` char(36) DEFAULT NULL,
  `department_uuid` char(36) DEFAULT NULL,
  `salesperson_bde` text DEFAULT NULL,
  `reference` text DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `fcm_token` text DEFAULT NULL,
  `recent_chat_time` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_status` varchar(36) DEFAULT NULL,
  `tour_status` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` varchar(191) NOT NULL,
  `receiver_id` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `inquiry_id` varchar(191) DEFAULT NULL,
  `quotation_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `concern_person` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mob_no` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_rfq`
--

CREATE TABLE `vendor_rfq` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_item_uuid` varchar(99) DEFAULT NULL,
  `vendor_uuid` varchar(99) DEFAULT NULL,
  `purchase_uuid` varchar(99) DEFAULT NULL,
  `item_uuid` varchar(99) DEFAULT NULL,
  `purchase_qty` int(11) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `cost` text DEFAULT NULL,
  `approved` varchar(50) DEFAULT NULL,
  `exp_item_delivery_date` date DEFAULT NULL,
  `approved_by` varchar(99) DEFAULT NULL,
  `unit_cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `warehouse_name` varchar(250) DEFAULT NULL,
  `warehouse_code` varchar(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_flow`
--

CREATE TABLE `work_flow` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text DEFAULT NULL,
  `work_flow_id` text DEFAULT NULL,
  `technology_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_flow2`
--

CREATE TABLE `work_flow2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `parent_uuid` text DEFAULT NULL,
  `stage_no` int(11) DEFAULT NULL,
  `process_uuid` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_flow_rules`
--

CREATE TABLE `work_flow_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `work_flow2_uuid` varchar(50) DEFAULT NULL,
  `rule` text DEFAULT NULL,
  `rule_status` tinyint(4) DEFAULT NULL,
  `work_flow_uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `client_docs`
--
ALTER TABLE `client_docs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_docs_uuid_unique` (`uuid`),
  ADD KEY `client_docs_user_uuid_foreign` (`user_uuid`);

--
-- Indexes for table `column_spec`
--
ALTER TABLE `column_spec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`);

--
-- Indexes for table `complain_docs`
--
ALTER TABLE `complain_docs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `complain_uuid` (`complain_uuid`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_uuid_unique` (`uuid`) USING BTREE;

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_uuid_unique` (`uuid`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_uuid` (`uuid`),
  ADD KEY `technology_uuid` (`technology_uuid`(768));

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `final_qc`
--
ALTER TABLE `final_qc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `order_plan_uuid` (`order_uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inline_management`
--
ALTER TABLE `inline_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `current_process` (`current_process`),
  ADD KEY `upcoming_process` (`upcoming_process`),
  ADD KEY `order_plan2_uuid` (`order_plan2_uuid`),
  ADD KEY `print_plan2_uuid` (`print_plan2_uuid`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_uuid` (`order_uuid`),
  ADD KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `inventory_technology_uuid_foreign` (`technology_uuid`),
  ADD KEY `inventory_category_uuid_foreign` (`category_uuid`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foriegn_key` (`user_uuid`,`order_uuid`);

--
-- Indexes for table `inward_qc`
--
ALTER TABLE `inward_qc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inward_sheet`
--
ALTER TABLE `inward_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inward_technology_uuid_foreign` (`technology_uuid`) USING BTREE,
  ADD KEY `inward_category_uuid_foreign` (`category_uuid`),
  ADD KEY `department_uuid` (`department_uuid`),
  ADD KEY `order_uuid` (`order_uuid`);

--
-- Indexes for table `knowledege_center`
--
ALTER TABLE `knowledege_center`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledege_center_service_uuid_foreign` (`service_uuid`),
  ADD KEY `knowledege_center_sub_service_uuid_foreign` (`sub_service_uuid`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_uuid_unique` (`uuid`),
  ADD KEY `materials_technology_uuid_foreign` (`technology_uuid`);

--
-- Indexes for table `operation_d`
--
ALTER TABLE `operation_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_d2`
--
ALTER TABLE `operation_d2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `operation_e`
--
ALTER TABLE `operation_e`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_e2`
--
ALTER TABLE `operation_e2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`),
  ADD KEY `qc_by` (`qc_by`(768));

--
-- Indexes for table `operation_f`
--
ALTER TABLE `operation_f`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operation_f_uuid_index` (`uuid`(768)),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_f2`
--
ALTER TABLE `operation_f2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operation_f2_uuid_index` (`uuid`(768)),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `operation_g`
--
ALTER TABLE `operation_g`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_g2`
--
ALTER TABLE `operation_g2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`(768)),
  ADD KEY `part_uuid` (`part_uuid`(768)),
  ADD KEY `qc_by` (`qc_by`(768));

--
-- Indexes for table `operation_h`
--
ALTER TABLE `operation_h`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_h2`
--
ALTER TABLE `operation_h2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_i`
--
ALTER TABLE `operation_i`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_i2`
--
ALTER TABLE `operation_i2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_j`
--
ALTER TABLE `operation_j`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_j2`
--
ALTER TABLE `operation_j2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_k`
--
ALTER TABLE `operation_k`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `operation_k2`
--
ALTER TABLE `operation_k2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_uuid` (`part_uuid`);

--
-- Indexes for table `operation_l`
--
ALTER TABLE `operation_l`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `operation_l2`
--
ALTER TABLE `operation_l2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`);

--
-- Indexes for table `operation_m`
--
ALTER TABLE `operation_m`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_m2`
--
ALTER TABLE `operation_m2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `operation_n`
--
ALTER TABLE `operation_n`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `operation_n2`
--
ALTER TABLE `operation_n2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_uuid` (`parent_uuid`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`);

--
-- Indexes for table `operation_o`
--
ALTER TABLE `operation_o`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `operation_o2`
--
ALTER TABLE `operation_o2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_uuid` (`parent_uuid`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`);

--
-- Indexes for table `operation_p`
--
ALTER TABLE `operation_p`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `operation_p2`
--
ALTER TABLE `operation_p2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_uuid` (`parent_uuid`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`);

--
-- Indexes for table `operation_q`
--
ALTER TABLE `operation_q`
  ADD PRIMARY KEY (`id`),
  ADD KEY `technology_uuid` (`technology_uuid`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `operation_q2`
--
ALTER TABLE `operation_q2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `parent_uuid` (`parent_uuid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_uuid_unique` (`uuid`),
  ADD KEY `orders_user_uuid_foreign` (`user_uuid`),
  ADD KEY `orders_technology_uuid_foreign` (`technology_uuid`),
  ADD KEY `orders_material_uuid_foreign` (`material_uuid`),
  ADD KEY `orders_order_status_uuid_foreign` (`order_status_uuid`);

--
-- Indexes for table `orders_files`
--
ALTER TABLE `orders_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_files_uuid_unique` (`uuid`),
  ADD KEY `orders_files_order_uuid_foreign` (`order_uuid`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_history_uuid_unique` (`uuid`),
  ADD KEY `order_history_order_uuid_foreign` (`order_uuid`),
  ADD KEY `order_history_order_status_uuid_foreign` (`order_status_uuid`);

--
-- Indexes for table `order_plan`
--
ALTER TABLE `order_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_plan_uuid_index` (`uuid`(768)),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `batch_status` (`batch_status`),
  ADD KEY `work_flow_uuid` (`work_flow_uuid`),
  ADD KEY `current_stage` (`current_stage`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `assigned_by` (`assigned_by`);

--
-- Indexes for table `order_plan2`
--
ALTER TABLE `order_plan2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `batch_order_parts` (`batch_order_parts`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `part_list_uuid` (`part_list_uuid`),
  ADD KEY `current_process` (`current_process`),
  ADD KEY `upcoming_process` (`upcoming_process`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status_uuid_unique` (`uuid`);

--
-- Indexes for table `outward_sheet`
--
ALTER TABLE `outward_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_uuid` (`department_uuid`),
  ADD KEY `order_uuid` (`order_uuid`);

--
-- Indexes for table `part_list`
--
ALTER TABLE `part_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_list_user_uuid_foreign` (`user_uuid`) USING BTREE,
  ADD KEY `part_list_order_uuid_foreign` (`order_uuid`),
  ADD KEY `part_list_inventory_uuid_foreign` (`inventory_uuid`),
  ADD KEY `part_list_order_id_foreign` (`order_id`),
  ADD KEY `part_list_technology_uuid_foreign` (`technology_uuid`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post_process`
--
ALTER TABLE `post_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `technologu_uuid` (`technology_uuid`),
  ADD KEY `print_uuid` (`print_uuid`),
  ADD KEY `assigned_to` (`assigned_to`) USING BTREE;

--
-- Indexes for table `post_process2`
--
ALTER TABLE `post_process2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `order_plan2_uuid` (`order_plan2_uuid`),
  ADD KEY `print_uuid` (`print_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `print`
--
ALTER TABLE `print`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `assigned_to` (`assigned_to`(768)),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `print2`
--
ALTER TABLE `print2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `batch_uuid` (`batch_uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `print_plan`
--
ALTER TABLE `print_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `technology_uuid` (`technology_uuid`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `assigned_by` (`assigned_by`),
  ADD KEY `op_id` (`op_id`) USING BTREE;

--
-- Indexes for table `print_plan2`
--
ALTER TABLE `print_plan2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`(768)),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `data_table_name` (`data_table_name`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_by` (`request_by`,`department`,`technology`,`category`,`order_id`,`purchased_by`,`vendor_uuid`,`approved_by`) USING HASH;

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `item_name` (`item_name`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `vendor_uuid` (`vendor_uuid`(768));

--
-- Indexes for table `quality_check`
--
ALTER TABLE `quality_check`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `technology_uuid` (`technology_uuid`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `order_plan_uuid` (`order_plan_uuid`),
  ADD KEY `inline_from_uuid` (`inline_from_uuid`),
  ADD KEY `assigned_to` (`assigned_to`) USING BTREE;

--
-- Indexes for table `quality_check2`
--
ALTER TABLE `quality_check2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `part_uuid` (`part_uuid`),
  ADD KEY `order_plan_uuid` (`order_plan_uuid`),
  ADD KEY `qc_by` (`qc_by`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `inline_from_uuid` (`inline_from_uuid`),
  ADD KEY `parent_uuid` (`parent_uuid`) USING BTREE;

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_uuid` (`order_uuid`),
  ADD KEY `inquiry_uuid` (`inquiry_uuid`,`uuid`) USING BTREE;

--
-- Indexes for table `quotation_history`
--
ALTER TABLE `quotation_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_uuid` (`quotation_uuid`,`uuid`);

--
-- Indexes for table `rework_history`
--
ALTER TABLE `rework_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order` (`order_uuid`,`order_status_uuid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_uuid_unique` (`uuid`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_uuid_unique` (`uuid`);

--
-- Indexes for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_services_uuid_unique` (`uuid`),
  ADD KEY `sub_services_service_uuid_foreign` (`service_uuid`);

--
-- Indexes for table `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `technologies_uuid_unique` (`uuid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_uuid_foreign` (`role_uuid`),
  ADD KEY `users_designation_uuid_foreign` (`designation_uuid`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_rfq`
--
ALTER TABLE `vendor_rfq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `purchase_uuid` (`purchase_uuid`),
  ADD KEY `vendor_uuid` (`vendor_uuid`),
  ADD KEY `purchase_item_uuid` (`purchase_item_uuid`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`);

--
-- Indexes for table `work_flow`
--
ALTER TABLE `work_flow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `technology_uuid` (`technology_uuid`);

--
-- Indexes for table `work_flow2`
--
ALTER TABLE `work_flow2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_flow2_work_flow_uuid_index` (`parent_uuid`(768)),
  ADD KEY `process_uuid` (`process_uuid`(768)),
  ADD KEY `uuid` (`uuid`);

--
-- Indexes for table `work_flow_rules`
--
ALTER TABLE `work_flow_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_flow2_uuid` (`work_flow2_uuid`),
  ADD KEY `work_flow_uuid` (`work_flow_uuid`),
  ADD KEY `uuid` (`uuid`(768));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_docs`
--
ALTER TABLE `client_docs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `column_spec`
--
ALTER TABLE `column_spec`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complain_docs`
--
ALTER TABLE `complain_docs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_qc`
--
ALTER TABLE `final_qc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `inline_management`
--
ALTER TABLE `inline_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inward_qc`
--
ALTER TABLE `inward_qc`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inward_sheet`
--
ALTER TABLE `inward_sheet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledege_center`
--
ALTER TABLE `knowledege_center`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_d`
--
ALTER TABLE `operation_d`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_d2`
--
ALTER TABLE `operation_d2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_e`
--
ALTER TABLE `operation_e`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_e2`
--
ALTER TABLE `operation_e2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_f`
--
ALTER TABLE `operation_f`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_f2`
--
ALTER TABLE `operation_f2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_g`
--
ALTER TABLE `operation_g`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_g2`
--
ALTER TABLE `operation_g2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_h`
--
ALTER TABLE `operation_h`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_h2`
--
ALTER TABLE `operation_h2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_i`
--
ALTER TABLE `operation_i`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_i2`
--
ALTER TABLE `operation_i2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_j`
--
ALTER TABLE `operation_j`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_j2`
--
ALTER TABLE `operation_j2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_k`
--
ALTER TABLE `operation_k`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_k2`
--
ALTER TABLE `operation_k2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_l`
--
ALTER TABLE `operation_l`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_l2`
--
ALTER TABLE `operation_l2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_m`
--
ALTER TABLE `operation_m`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_m2`
--
ALTER TABLE `operation_m2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_n`
--
ALTER TABLE `operation_n`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_n2`
--
ALTER TABLE `operation_n2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_o`
--
ALTER TABLE `operation_o`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_o2`
--
ALTER TABLE `operation_o2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_p`
--
ALTER TABLE `operation_p`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_p2`
--
ALTER TABLE `operation_p2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_q`
--
ALTER TABLE `operation_q`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_q2`
--
ALTER TABLE `operation_q2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_files`
--
ALTER TABLE `orders_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_plan`
--
ALTER TABLE `order_plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_plan2`
--
ALTER TABLE `order_plan2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `outward_sheet`
--
ALTER TABLE `outward_sheet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `part_list`
--
ALTER TABLE `part_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_process`
--
ALTER TABLE `post_process`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_process2`
--
ALTER TABLE `post_process2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print`
--
ALTER TABLE `print`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print2`
--
ALTER TABLE `print2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print_plan`
--
ALTER TABLE `print_plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print_plan2`
--
ALTER TABLE `print_plan2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quality_check`
--
ALTER TABLE `quality_check`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quality_check2`
--
ALTER TABLE `quality_check2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_history`
--
ALTER TABLE `quotation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rework_history`
--
ALTER TABLE `rework_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_services`
--
ALTER TABLE `sub_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_rfq`
--
ALTER TABLE `vendor_rfq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_flow`
--
ALTER TABLE `work_flow`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_flow2`
--
ALTER TABLE `work_flow2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_flow_rules`
--
ALTER TABLE `work_flow_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `knowledege_center`
--
ALTER TABLE `knowledege_center`
  ADD CONSTRAINT `knowledege_center_service_uuid_foreign` FOREIGN KEY (`service_uuid`) REFERENCES `services` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledege_center_sub_service_uuid_foreign` FOREIGN KEY (`sub_service_uuid`) REFERENCES `sub_services` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_technology_uuid_foreign` FOREIGN KEY (`technology_uuid`) REFERENCES `technologies` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_material_uuid_foreign` FOREIGN KEY (`material_uuid`) REFERENCES `materials` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_order_status_uuid_foreign` FOREIGN KEY (`order_status_uuid`) REFERENCES `order_status` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_technology_uuid_foreign` FOREIGN KEY (`technology_uuid`) REFERENCES `technologies` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_uuid_foreign` FOREIGN KEY (`user_uuid`) REFERENCES `users` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_order_status_uuid_foreign` FOREIGN KEY (`order_status_uuid`) REFERENCES `order_status` (`uuid`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_order_uuid_foreign` FOREIGN KEY (`order_uuid`) REFERENCES `orders` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
