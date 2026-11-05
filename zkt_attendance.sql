-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2026 at 06:37 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zkt_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_adminbiodata`
--

CREATE TABLE `accounts_adminbiodata` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) DEFAULT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `duress` tinyint(1) NOT NULL,
  `admin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_passwordresetkey`
--

CREATE TABLE `accounts_passwordresetkey` (
  `id` int NOT NULL,
  `encrypt_key` varchar(32) NOT NULL,
  `encrypt_iv` varchar(24) NOT NULL,
  `expire_time` datetime(6) NOT NULL,
  `encrypt_time` varchar(64) NOT NULL,
  `encrypt_email` varchar(320) NOT NULL,
  `encrypt_type` varchar(64) NOT NULL,
  `request_time` datetime(6) NOT NULL,
  `user_key` varchar(125) DEFAULT NULL,
  `applied` tinyint(1) NOT NULL,
  `applied_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_usernotification`
--

CREATE TABLE `accounts_usernotification` (
  `id` int NOT NULL,
  `content` longtext NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `read_time` datetime(6) DEFAULT NULL,
  `status` smallint NOT NULL,
  `user_id` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `event` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_acccombination`
--

CREATE TABLE `acc_acccombination` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `combination_no` int NOT NULL,
  `combination_name` varchar(100) NOT NULL,
  `group1` int DEFAULT NULL,
  `group2` int DEFAULT NULL,
  `group3` int DEFAULT NULL,
  `group4` int DEFAULT NULL,
  `group5` int DEFAULT NULL,
  `remark` varchar(999) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accgroups`
--

CREATE TABLE `acc_accgroups` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `group_no` int NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `verify_mode` int NOT NULL,
  `timezone1` int DEFAULT NULL,
  `timezone2` int DEFAULT NULL,
  `timezone3` int DEFAULT NULL,
  `is_include_holiday` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accholiday`
--

CREATE TABLE `acc_accholiday` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  `holiday_id` int NOT NULL,
  `timezone_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accprivilege`
--

CREATE TABLE `acc_accprivilege` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `is_group_timezone` smallint NOT NULL,
  `timezone1` int DEFAULT NULL,
  `timezone2` int DEFAULT NULL,
  `timezone3` int DEFAULT NULL,
  `is_group_verifycode` smallint NOT NULL,
  `verify_mode` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accterminal`
--

CREATE TABLE `acc_accterminal` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `door_name` varchar(50) DEFAULT NULL,
  `door_lock_delay` int NOT NULL,
  `door_sensor_delay` int NOT NULL,
  `door_sensor_type` smallint NOT NULL,
  `door_alarm_delay` int NOT NULL,
  `retry_times` smallint NOT NULL,
  `valid_holiday` smallint NOT NULL,
  `nc_time_period` int NOT NULL,
  `no_time_period` int NOT NULL,
  `speaker_alarm` smallint NOT NULL,
  `duress_fun_on` smallint NOT NULL,
  `alarm_1_1` smallint NOT NULL,
  `alarm_1_n` smallint NOT NULL,
  `alarm_password` smallint NOT NULL,
  `duress_alarm_delay` int NOT NULL,
  `anti_passback_mode` smallint NOT NULL,
  `anti_door_direction` smallint NOT NULL,
  `verify_mode_485` smallint NOT NULL,
  `push_time` datetime(6) DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_acctimezone`
--

CREATE TABLE `acc_acctimezone` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `timezone_no` int NOT NULL,
  `timezone_name` varchar(100) NOT NULL,
  `sun_start` time(6) NOT NULL,
  `sun_end` time(6) NOT NULL,
  `sun_on` smallint DEFAULT NULL,
  `mon_start` time(6) NOT NULL,
  `mon_end` time(6) NOT NULL,
  `mon_on` smallint DEFAULT NULL,
  `tue_start` time(6) NOT NULL,
  `tue_end` time(6) NOT NULL,
  `tue_on` smallint DEFAULT NULL,
  `wed_start` time(6) NOT NULL,
  `wed_end` time(6) NOT NULL,
  `wed_on` smallint DEFAULT NULL,
  `thu_start` time(6) NOT NULL,
  `thu_end` time(6) NOT NULL,
  `thu_on` smallint DEFAULT NULL,
  `fri_start` time(6) NOT NULL,
  `fri_end` time(6) NOT NULL,
  `fri_on` smallint DEFAULT NULL,
  `sat_start` time(6) NOT NULL,
  `sat_end` time(6) NOT NULL,
  `sat_on` smallint DEFAULT NULL,
  `remark` varchar(999) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attparam`
--

CREATE TABLE `attparam` (
  `id` int NOT NULL,
  `paraname` varchar(30) NOT NULL,
  `paratype` varchar(10) DEFAULT NULL,
  `paravalue` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attparam`
--

INSERT INTO `attparam` (`id`, `paraname`, `paratype`, `paravalue`) VALUES
(1, 'ruleID', 'rule_0', '0'),
(2, 'DeptID', 'rule_0', '0'),
(3, 'ApplyName', 'rule_0', 'All'),
(4, 'ruleName', 'rule_0', 'Default Attendance Rules'),
(5, 'MinsEarly', 'rule_0', '0'),
(6, 'MinsLate', 'rule_0', '0'),
(7, 'MinsNoBreakIn', 'rule_0', '60'),
(8, 'MinsNoBreakOut', 'rule_0', '60'),
(9, 'MinsNoIn', 'rule_0', '60'),
(10, 'MinsNoLeave', 'rule_0', '60'),
(11, 'MinsNotOverTime', 'rule_0', '60'),
(12, 'MinsWorkDay', 'rule_0', '480'),
(13, 'NoBreakIn', 'rule_0', '1012'),
(14, 'NoBreakOut', 'rule_0', '1012'),
(15, 'NoIn', 'rule_0', '1001'),
(16, 'NoLeave', 'rule_0', '1002'),
(17, 'OutOverTime', 'rule_0', '0'),
(18, 'TwoDay', 'rule_0', '0'),
(19, 'CheckInColor', 'rule_0', '16777151'),
(20, 'CheckOutColor', 'rule_0', '12910591'),
(21, 'DBVersion', '', '2002'),
(22, 'InstallDate', '', 'd77c2QXn8qo8-JKJctRPqoM-r_nmMeF41bJcduAH-9vOscZBHmZn'),
(23, 'SysDate', '', 'd77c2QXn8qo8-JKJctRPqoM-r_nmMeF41bJcduAH-9vOscZBHmZn'),
(24, 'ADMSDBVersion', '', '544;');

-- --------------------------------------------------------

--
-- Table structure for table `att_attcalclog`
--

CREATE TABLE `att_attcalclog` (
  `id` int NOT NULL,
  `dept_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `log_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_attcode`
--

CREATE TABLE `att_attcode` (
  `id` int NOT NULL,
  `code` varchar(20) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `display_format` smallint NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `round_off` smallint NOT NULL,
  `min_val` decimal(4,1) NOT NULL,
  `symbol_only` tinyint(1) NOT NULL,
  `order` smallint NOT NULL,
  `color_setting` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_attcode`
--

INSERT INTO `att_attcode` (`id`, `code`, `alias`, `display_format`, `symbol`, `round_off`, `min_val`, `symbol_only`, `order`, `color_setting`) VALUES
(1, 'duration', 'Duration', 4, '', 1, 0.1, 0, 1, NULL),
(2, 'duty_duration', 'Duty Duration', 4, '', 1, 0.1, 0, 2, NULL),
(3, 'total_hrs', 'Total Hours', 4, '', 1, 0.1, 0, 3, NULL),
(4, 'worked_hrs', 'Worked Hours', 4, '', 1, 0.1, 0, 4, NULL),
(5, 'actual_worked', 'Actual Worked Hours', 4, '', 1, 0.1, 0, 5, NULL),
(6, 'break_duration', 'Break Duration', 4, '', 1, 0.1, 0, 6, NULL),
(7, 'break_total_hrs', 'Break Total Hours', 4, '', 1, 0.1, 0, 7, NULL),
(8, 'break_hrs', 'Break Hours', 4, '', 1, 0.1, 0, 8, NULL),
(9, 'actual_break', 'Actual Break Hours', 4, '', 1, 0.1, 0, 9, NULL),
(10, 'approval_hrs', 'Approval Hours', 4, '', 1, 0.1, 0, 10, NULL),
(11, 'early_in', 'Early In', 4, '', 1, 0.1, 0, 11, NULL),
(12, 'late_out', 'Late Out', 4, '', 1, 0.1, 0, 12, NULL),
(13, 'unschedule', 'Unscheduled', 4, '', 1, 0.1, 0, 13, NULL),
(14, 'remaining', 'Remaining', 4, '', 1, 0.1, 0, 14, NULL),
(15, 'total_ot', 'Total OT', 4, '', 1, 0.1, 0, 15, NULL),
(16, 'rule_total_ot', 'Rule Total OT', 4, '', 1, 0.1, 0, 16, NULL),
(17, 'total_leave', 'Total Leaves', 2, '', 1, 0.1, 0, 17, NULL),
(18, 'day_off', 'Day Off', 0, 'Off', 0, 0.1, 1, 18, NULL),
(19, 'weekend', 'Weekend', 0, 'W', 0, 0.1, 1, 19, NULL),
(20, 'holiday', 'Holiday', 0, 'H', 0, 0.1, 1, 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `att_attemployee`
--

CREATE TABLE `att_attemployee` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `enable_attendance` tinyint(1) NOT NULL,
  `enable_schedule` tinyint(1) NOT NULL,
  `enable_overtime` tinyint(1) NOT NULL,
  `enable_holiday` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  `ip_address` char(39) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_attgroup`
--

CREATE TABLE `att_attgroup` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_attgroup`
--

INSERT INTO `att_attgroup` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `code`, `name`, `company_id`) VALUES
(1, '2026-11-05 12:20:05.267700', NULL, '2026-11-05 12:20:05.267700', NULL, 0, '1', 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `att_attpolicy`
--

CREATE TABLE `att_attpolicy` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `global_frequency` smallint NOT NULL,
  `global_send_day` smallint NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  `bot_uid` varchar(100) DEFAULT NULL,
  `enable_workcode_calculation` tinyint(1) NOT NULL,
  `enable_workcode_punch_state` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_attpolicy`
--

INSERT INTO `att_attpolicy` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `use_ot`, `weekend1`, `weekend2`, `start_of_week`, `max_hrs`, `day_change`, `paring_rule`, `punch_period`, `daily_ot`, `daily_ot_rule`, `weekly_ot`, `weekly_ot_rule`, `weekend_ot`, `weekend_ot_rule`, `holiday_ot`, `holiday_ot_rule`, `late_in2absence`, `early_out2absence`, `miss_in`, `late_in_hrs`, `miss_out`, `early_out_hrs`, `require_capture`, `require_work_code`, `require_punch_state`, `email_send_time`, `global_frequency`, `global_send_day`, `max_absent`, `max_early_out`, `max_late_in`, `sending_day`, `weekend1_color_setting`, `weekend2_color_setting`, `ot_pay_code_id`, `overtime_policy`, `enable_compensatory`, `bot_uid`, `enable_workcode_calculation`, `enable_workcode_punch_state`) VALUES
(1, '2026-11-05 12:20:05.380088', NULL, '2026-11-05 12:20:05.380088', NULL, 0, 1, 7, 7, 0, 12.0, '00:00:00.000000', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 100, 100, 1, 60, 1, 60, 0, 0, 0, '00:00:00.000000', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, -1, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `att_attreportsetting`
--

CREATE TABLE `att_attreportsetting` (
  `id` int NOT NULL,
  `resign_emp` smallint NOT NULL,
  `short_date` smallint NOT NULL,
  `short_time` smallint NOT NULL,
  `filter_by_hire_date` tinyint(1) NOT NULL,
  `auto_calculate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_attreportsetting`
--

INSERT INTO `att_attreportsetting` (`id`, `resign_emp`, `short_date`, `short_time`, `filter_by_hire_date`, `auto_calculate`) VALUES
(1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `att_attrule`
--

CREATE TABLE `att_attrule` (
  `param_name` varchar(20) NOT NULL,
  `param_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_attrule`
--

INSERT INTO `att_attrule` (`param_name`, `param_value`) VALUES
('global_att_rule', '{\"in_rule\": 1, \"out_rule\": 1, \"use_ot\": 1, \"punch_period\": 1, \"weekend\": [], \"mins_late_absent\": 100, \"mins_early_absent\": 100, \"miss_in\": 1, \"miss_in_mins\": 60, \"miss_out\": 1, \"miss_out_mins\": 60, \"leave_include_in\": 2, \"leave_include_out\": 2, \"training_include_in\": 2, \"training_include_out\": 2, \"check_in\": \"0\", \"check_out\": \"1\", \"break_out\": \"2\", \"break_in\": \"3\", \"overtime_in\": \"4\", \"overtime_out\": \"5\", \"enable_capture\": 0, \"enable_workcode\": 0, \"enable_funckey\": 0}');

-- --------------------------------------------------------

--
-- Table structure for table `att_attschedule`
--

CREATE TABLE `att_attschedule` (
  `id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` int NOT NULL,
  `shift_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_attshift`
--

CREATE TABLE `att_attshift` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL,
  `cycle_unit` smallint NOT NULL,
  `shift_cycle` int NOT NULL,
  `work_weekend` tinyint(1) NOT NULL,
  `weekend_type` smallint NOT NULL,
  `work_day_off` tinyint(1) NOT NULL,
  `day_off_type` smallint NOT NULL,
  `auto_shift` smallint NOT NULL,
  `enable_ot_rule` tinyint(1) NOT NULL,
  `frequency` smallint NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_breaktime`
--

CREATE TABLE `att_breaktime` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL,
  `period_start` time(6) NOT NULL,
  `duration` int NOT NULL,
  `end_margin` int NOT NULL,
  `func_key` smallint NOT NULL,
  `available_interval_type` smallint NOT NULL,
  `available_interval` int NOT NULL,
  `multiple_punch` smallint NOT NULL,
  `calc_type` smallint NOT NULL,
  `minimum_duration` int DEFAULT NULL,
  `early_in` smallint NOT NULL,
  `late_in` smallint NOT NULL,
  `profit_rule` tinyint(1) NOT NULL,
  `min_early_in` int NOT NULL,
  `loss_rule` tinyint(1) NOT NULL,
  `min_late_in` int NOT NULL,
  `loss_code_id` int DEFAULT NULL,
  `profit_code_id` int DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_calculatelastdate`
--

CREATE TABLE `att_calculatelastdate` (
  `id` int NOT NULL,
  `last_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_calculatetask`
--

CREATE TABLE `att_calculatetask` (
  `id` int NOT NULL,
  `emp` int NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `event` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_changeschedule`
--

CREATE TABLE `att_changeschedule` (
  `workflowinstance_ptr_id` int NOT NULL,
  `att_date` date NOT NULL,
  `previous_timeinterval` varchar(100) DEFAULT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` varchar(200) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `timeinterval_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_departmentpolicy`
--

CREATE TABLE `att_departmentpolicy` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `department_id` int NOT NULL,
  `dept_frequency` smallint NOT NULL,
  `dept_send_day` smallint NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  `bot_uid` varchar(100) DEFAULT NULL,
  `enable_workcode_calculation` tinyint(1) NOT NULL,
  `enable_workcode_punch_state` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_departmentschedule`
--

CREATE TABLE `att_departmentschedule` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `department_id` int NOT NULL,
  `shift_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_deptattrule`
--

CREATE TABLE `att_deptattrule` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL,
  `rule` longtext,
  `department_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_grouppolicy`
--

CREATE TABLE `att_grouppolicy` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `use_ot` smallint NOT NULL,
  `weekend1` smallint NOT NULL,
  `weekend2` smallint NOT NULL,
  `start_of_week` smallint NOT NULL,
  `max_hrs` decimal(4,1) NOT NULL,
  `day_change` time(6) NOT NULL,
  `paring_rule` smallint NOT NULL,
  `punch_period` smallint NOT NULL,
  `daily_ot` tinyint(1) NOT NULL,
  `daily_ot_rule` char(32) DEFAULT NULL,
  `weekly_ot` tinyint(1) NOT NULL,
  `weekly_ot_rule` char(32) DEFAULT NULL,
  `weekend_ot` tinyint(1) NOT NULL,
  `weekend_ot_rule` char(32) DEFAULT NULL,
  `holiday_ot` tinyint(1) NOT NULL,
  `holiday_ot_rule` char(32) DEFAULT NULL,
  `late_in2absence` int NOT NULL,
  `early_out2absence` int NOT NULL,
  `miss_in` smallint NOT NULL,
  `late_in_hrs` int NOT NULL,
  `miss_out` smallint NOT NULL,
  `early_out_hrs` int NOT NULL,
  `require_capture` tinyint(1) NOT NULL,
  `require_work_code` tinyint(1) NOT NULL,
  `require_punch_state` tinyint(1) NOT NULL,
  `group_id` int NOT NULL,
  `email_send_time` time(6) NOT NULL,
  `group_frequency` smallint NOT NULL,
  `group_send_day` smallint NOT NULL,
  `max_absent` smallint NOT NULL,
  `max_early_out` smallint NOT NULL,
  `max_late_in` smallint NOT NULL,
  `sending_day` smallint NOT NULL,
  `weekend1_color_setting` varchar(30) DEFAULT NULL,
  `weekend2_color_setting` varchar(30) DEFAULT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `enable_compensatory` tinyint(1) NOT NULL,
  `bot_uid` varchar(100) DEFAULT NULL,
  `enable_workcode_calculation` tinyint(1) NOT NULL,
  `enable_workcode_punch_state` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_groupschedule`
--

CREATE TABLE `att_groupschedule` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `group_id` int NOT NULL,
  `shift_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_holiday`
--

CREATE TABLE `att_holiday` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `duration_day` smallint NOT NULL,
  `enable_ot_rule` tinyint(1) NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `att_group_id` int DEFAULT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_leave`
--

CREATE TABLE `att_leave` (
  `workflowinstance_ptr_id` int NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  `leave_day` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_leavegroup`
--

CREATE TABLE `att_leavegroup` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_leavegroupdetail`
--

CREATE TABLE `att_leavegroupdetail` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `leave_type` int NOT NULL,
  `allow_leave_day` int NOT NULL,
  `min_leave_day` double NOT NULL,
  `deduct_holiday_day` smallint NOT NULL,
  `leave_entitlement` int DEFAULT NULL,
  `leave_interval` int NOT NULL,
  `leave_distribution_time` int DEFAULT NULL,
  `start_day` varchar(5) NOT NULL,
  `set_hire_day` smallint NOT NULL,
  `allow_exceed_limit` smallint NOT NULL,
  `allow_balance` smallint NOT NULL,
  `max_balance` int DEFAULT NULL,
  `entitlement_detail` varchar(999) DEFAULT NULL,
  `leave_group_id` int NOT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_leaveyearbalance`
--

CREATE TABLE `att_leaveyearbalance` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `leave_type` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `entitlement_days` smallint DEFAULT NULL,
  `leave_day` double DEFAULT NULL,
  `pre_balance` smallint DEFAULT NULL,
  `employee_id` int NOT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_manuallog`
--

CREATE TABLE `att_manuallog` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `work_code_id` int DEFAULT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_overtime`
--

CREATE TABLE `att_overtime` (
  `workflowinstance_ptr_id` int NOT NULL,
  `overtime_type` smallint NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_overtimepolicy`
--

CREATE TABLE `att_overtimepolicy` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `mode` smallint NOT NULL,
  `hrs_from` decimal(4,1) NOT NULL,
  `hrs_to` decimal(4,1) NOT NULL,
  `master` char(32) NOT NULL,
  `overnight_pay_code_id` int DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_paycode`
--

CREATE TABLE `att_paycode` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code_type` smallint NOT NULL,
  `tag` smallint DEFAULT NULL,
  `fixed_code` smallint DEFAULT NULL,
  `is_work` tinyint(1) NOT NULL,
  `fixed_hours` decimal(8,2) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_benefit` tinyint(1) NOT NULL,
  `round_off` smallint NOT NULL,
  `min_val` decimal(4,1) NOT NULL,
  `display_format` smallint NOT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `display_order` smallint NOT NULL,
  `desc` longtext,
  `is_display` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `color_setting` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `att_paycode`
--

INSERT INTO `att_paycode` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `code`, `name`, `code_type`, `tag`, `fixed_code`, `is_work`, `fixed_hours`, `is_paid`, `is_benefit`, `round_off`, `min_val`, `display_format`, `symbol`, `display_order`, `desc`, `is_display`, `is_default`, `color_setting`) VALUES
(1, '2026-11-05 12:20:03.775222', NULL, '2026-11-05 12:20:03.775222', NULL, 0, 'REG', 'Regular', 1, NULL, 1, 1, 8.00, 1, 0, 1, 0.1, 2, 'P', 1, NULL, 1, 1, NULL),
(2, '2026-11-05 12:20:03.840879', NULL, '2026-11-05 12:20:03.840879', NULL, 0, 'L', 'Late In', 4, NULL, 2, 1, 8.00, 1, 0, 1, 1.0, 1, 'L', 2, NULL, 1, 1, NULL),
(3, '2026-11-05 12:20:03.897747', NULL, '2026-11-05 12:20:03.897747', NULL, 0, 'E', 'Early Out', 4, NULL, 3, 1, 8.00, 1, 0, 1, 1.0, 1, 'E', 3, NULL, 1, 1, NULL),
(4, '2026-11-05 12:20:03.928171', NULL, '2026-11-05 12:20:03.928171', NULL, 0, 'A', 'Absence', 4, NULL, 4, 1, 8.00, 1, 0, 1, 0.1, 2, 'A', 4, NULL, 1, 1, NULL),
(5, '2026-11-05 12:20:03.966005', NULL, '2026-11-05 12:20:03.966005', NULL, 0, 'NOT', 'Normal OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 5, NULL, 1, 1, NULL),
(6, '2026-11-05 12:20:03.999281', NULL, '2026-11-05 12:20:03.999281', NULL, 0, 'WOT', 'Weekend OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 6, NULL, 1, 1, NULL),
(7, '2026-11-05 12:20:04.032647', NULL, '2026-11-05 12:20:04.032647', NULL, 0, 'HOT', 'Holiday OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 7, NULL, 1, 1, NULL),
(8, '2026-11-05 12:20:04.058237', NULL, '2026-11-05 12:20:04.058237', NULL, 0, 'OT1', 'OT1', 2, 6, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 8, NULL, 1, 1, NULL),
(9, '2026-11-05 12:20:04.099198', NULL, '2026-11-05 12:20:04.099198', NULL, 0, 'OT2', 'OT2', 2, 7, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 9, NULL, 1, 1, NULL),
(10, '2026-11-05 12:20:04.132700', NULL, '2026-11-05 12:20:04.132700', NULL, 0, 'OT3', 'OT3', 2, 8, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 10, NULL, 1, 1, NULL),
(11, '2026-11-05 12:20:04.158126', NULL, '2026-11-05 12:20:04.158126', NULL, 0, 'AL', 'Annual Leave', 3, NULL, NULL, 0, 8.00, 1, 1, 1, 0.1, 2, '', 11, NULL, 1, 1, NULL),
(12, '2026-11-05 12:20:04.208171', NULL, '2026-11-05 12:20:04.208171', NULL, 0, 'SL', 'Sick Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 12, NULL, 1, 1, NULL),
(13, '2026-11-05 12:20:04.248612', NULL, '2026-11-05 12:20:04.248612', NULL, 0, 'CL', 'Casual Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 13, NULL, 1, 1, NULL),
(14, '2026-11-05 12:20:04.278016', NULL, '2026-11-05 12:20:04.278016', NULL, 0, 'ML', 'Maternity Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 14, NULL, 1, 1, NULL),
(15, '2026-11-05 12:20:04.315669', NULL, '2026-11-05 12:20:04.315669', NULL, 0, 'COL', 'Compassionate Leave', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 15, NULL, 1, 1, NULL),
(16, '2026-11-05 12:20:04.348822', NULL, '2026-11-05 12:20:04.348822', NULL, 0, 'BT', 'Business Trip', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 16, NULL, 1, 1, NULL),
(17, '2026-11-05 12:20:04.398093', NULL, '2026-11-05 12:20:04.398093', NULL, 0, 'CP', 'Compensatory', 1, NULL, 5, 0, 8.00, 0, 0, 1, 0.1, 2, '', 17, NULL, 1, 1, NULL),
(18, '2026-11-05 12:20:04.428079', NULL, '2026-11-05 12:20:04.428079', NULL, 0, 'CPL', 'Compensatory Leave', 3, NULL, 6, 0, 8.00, 0, 0, 1, 0.1, 2, '', 18, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadattcode`
--

CREATE TABLE `att_payloadattcode` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `att_code_alias` varchar(50) NOT NULL,
  `att_code_symbol` varchar(20) DEFAULT NULL,
  `duration` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `hours` decimal(6,1) NOT NULL,
  `minutes` decimal(8,1) NOT NULL,
  `is_weekly` tinyint(1) NOT NULL,
  `att_code_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadbase`
--

CREATE TABLE `att_payloadbase` (
  `uuid` varchar(36) NOT NULL,
  `att_date` date DEFAULT NULL,
  `weekday` smallint DEFAULT NULL,
  `check_in` datetime(6) DEFAULT NULL,
  `check_out` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `duty_duration` int DEFAULT NULL,
  `work_day` double NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  `duty_worked` int DEFAULT NULL,
  `actual_worked` int DEFAULT NULL,
  `unscheduled` int DEFAULT NULL,
  `remaining` int DEFAULT NULL,
  `total_worked` int DEFAULT NULL,
  `late` int DEFAULT NULL,
  `early_leave` int DEFAULT NULL,
  `short` int DEFAULT NULL,
  `absent` int DEFAULT NULL,
  `leave` int DEFAULT NULL,
  `exception` varchar(50) DEFAULT NULL,
  `day_off` smallint NOT NULL,
  `break_time_id` varchar(36) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `overtime_id` varchar(36) DEFAULT NULL,
  `timetable_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadbreak`
--

CREATE TABLE `att_payloadbreak` (
  `uuid` varchar(36) NOT NULL,
  `break_out` datetime(6) DEFAULT NULL,
  `break_in` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `taken` int DEFAULT NULL,
  `actual_duration` int DEFAULT NULL,
  `early_in` int DEFAULT NULL,
  `late_in` int DEFAULT NULL,
  `late` int DEFAULT NULL,
  `early_leave` int DEFAULT NULL,
  `absent` int DEFAULT NULL,
  `work_time` int DEFAULT NULL,
  `overtime` int DEFAULT NULL,
  `weekend_ot` int DEFAULT NULL,
  `holiday_ot` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadeffectpunch`
--

CREATE TABLE `att_payloadeffectpunch` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `punch_datetime` datetime(6) NOT NULL,
  `punch_date` date NOT NULL,
  `punch_time` time(6) NOT NULL,
  `week` smallint NOT NULL,
  `weekday` smallint NOT NULL,
  `work_code` varchar(20) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `adjust_state` varchar(5) NOT NULL,
  `emp_id` int NOT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  `trans_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadexception`
--

CREATE TABLE `att_payloadexception` (
  `uuid` varchar(36) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int DEFAULT NULL,
  `days` double DEFAULT NULL,
  `data_type` smallint NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `skd_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadmulpunchset`
--

CREATE TABLE `att_payloadmulpunchset` (
  `id` int NOT NULL,
  `att_date` date NOT NULL,
  `weekday` smallint DEFAULT NULL,
  `data_index` smallint NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `in_id` int DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `out_id` int DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  `worked_time` int DEFAULT NULL,
  `data_type` smallint NOT NULL,
  `emp_id` int NOT NULL,
  `timetable_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadovertime`
--

CREATE TABLE `att_payloadovertime` (
  `uuid` varchar(36) NOT NULL,
  `normal_wt` int DEFAULT NULL,
  `normal_ot` int DEFAULT NULL,
  `weekend_ot` int DEFAULT NULL,
  `holiday_ot` int DEFAULT NULL,
  `ot_lv1` int DEFAULT NULL,
  `ot_lv2` int DEFAULT NULL,
  `ot_lv3` int DEFAULT NULL,
  `total_ot` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadparing`
--

CREATE TABLE `att_payloadparing` (
  `id` char(32) NOT NULL,
  `stamp` bigint NOT NULL,
  `att_date` date NOT NULL,
  `week` smallint NOT NULL,
  `weekday` smallint NOT NULL,
  `data_type` smallint NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `in_date` date DEFAULT NULL,
  `in_time` time(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time(6) DEFAULT NULL,
  `duration` int NOT NULL,
  `worked_duration` int NOT NULL,
  `data_index` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `emp_id` int NOT NULL,
  `in_trans_id` int DEFAULT NULL,
  `out_trans_id` int DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadpaycode`
--

CREATE TABLE `att_payloadpaycode` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `pay_code_alias` varchar(50) NOT NULL,
  `pay_code_symbol` varchar(20) DEFAULT NULL,
  `duration` int NOT NULL,
  `workday` decimal(4,1) NOT NULL,
  `hours` decimal(6,1) NOT NULL,
  `minutes` decimal(8,1) NOT NULL,
  `is_weekly` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `pay_code_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  `time_card_id` char(32) DEFAULT NULL,
  `is_exception` smallint NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadpunch`
--

CREATE TABLE `att_payloadpunch` (
  `uuid` varchar(36) NOT NULL,
  `att_date` date DEFAULT NULL,
  `correct_state` varchar(3) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `orig_id` int DEFAULT NULL,
  `skd_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadtimecard`
--

CREATE TABLE `att_payloadtimecard` (
  `id` char(32) NOT NULL,
  `att_date` date NOT NULL,
  `week` int NOT NULL,
  `weekday` int NOT NULL,
  `date_type` smallint NOT NULL,
  `time_table_alias` varchar(50) NOT NULL,
  `check_in` datetime(6) NOT NULL,
  `check_out` datetime(6) NOT NULL,
  `work_day` decimal(4,1) NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `break_out` datetime(6) DEFAULT NULL,
  `break_in` datetime(6) DEFAULT NULL,
  `lock_down` tinyint(1) NOT NULL,
  `emp_id` int NOT NULL,
  `time_table_id` int DEFAULT NULL,
  `present` smallint NOT NULL,
  `full_attendance` smallint NOT NULL,
  `payload` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_payloadworkcodeparing`
--

CREATE TABLE `att_payloadworkcodeparing` (
  `id` char(32) NOT NULL,
  `stamp` bigint NOT NULL,
  `att_date` date NOT NULL,
  `week` smallint NOT NULL,
  `weekday` smallint NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `duration` int NOT NULL,
  `worked_duration` int NOT NULL,
  `work_code` varchar(8) DEFAULT NULL,
  `pay_code` varchar(50) DEFAULT NULL,
  `workday` decimal(4,1) NOT NULL,
  `emp_id` int NOT NULL,
  `time_card_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_reportparam`
--

CREATE TABLE `att_reportparam` (
  `param_name` varchar(20) NOT NULL,
  `param_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_reporttemplate`
--

CREATE TABLE `att_reporttemplate` (
  `id` int NOT NULL,
  `report` varchar(50) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `template_value` longtext NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `is_auto_export` tinyint(1) NOT NULL,
  `builder_id` int DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `fixed_date_period` tinyint(1) NOT NULL,
  `language` varchar(10) NOT NULL,
  `status` smallint NOT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_shiftdetail`
--

CREATE TABLE `att_shiftdetail` (
  `id` int NOT NULL,
  `in_time` time(6) NOT NULL,
  `out_time` time(6) NOT NULL,
  `day_index` int NOT NULL,
  `shift_id` int NOT NULL,
  `time_interval_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_temporaryschedule`
--

CREATE TABLE `att_temporaryschedule` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `att_date` date NOT NULL,
  `employee_id` int NOT NULL,
  `time_interval_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_tempschedule`
--

CREATE TABLE `att_tempschedule` (
  `id` int NOT NULL,
  `att_date` date DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `rule_flag` smallint NOT NULL,
  `work_type` smallint NOT NULL,
  `employee_id` int NOT NULL,
  `time_interval_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_timeinterval`
--

CREATE TABLE `att_timeinterval` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL,
  `use_mode` smallint NOT NULL,
  `in_time` time(6) NOT NULL,
  `in_ahead_margin` int NOT NULL,
  `in_above_margin` int NOT NULL,
  `out_ahead_margin` int NOT NULL,
  `out_above_margin` int NOT NULL,
  `duration` int NOT NULL,
  `in_required` smallint NOT NULL,
  `out_required` smallint NOT NULL,
  `allow_late` int NOT NULL,
  `allow_leave_early` int NOT NULL,
  `work_day` double NOT NULL,
  `early_in` smallint NOT NULL,
  `min_early_in` int NOT NULL,
  `late_out` smallint NOT NULL,
  `min_late_out` int NOT NULL,
  `overtime_lv` smallint NOT NULL,
  `overtime_lv1` smallint NOT NULL,
  `overtime_lv2` smallint NOT NULL,
  `overtime_lv3` smallint NOT NULL,
  `multiple_punch` smallint NOT NULL,
  `available_interval_type` smallint NOT NULL,
  `available_interval` int NOT NULL,
  `work_time_duration` int NOT NULL,
  `func_key` smallint NOT NULL,
  `work_type` smallint NOT NULL,
  `day_change` time(6) NOT NULL,
  `enable_early_in` tinyint(1) NOT NULL,
  `enable_late_out` tinyint(1) NOT NULL,
  `enable_overtime` tinyint(1) NOT NULL,
  `ot_rule` char(32) DEFAULT NULL,
  `color_setting` varchar(30) DEFAULT NULL,
  `enable_max_ot_limit` tinyint(1) NOT NULL,
  `max_ot_limit` int NOT NULL,
  `count_early_in_interval` tinyint(1) NOT NULL,
  `count_late_out_interval` tinyint(1) NOT NULL,
  `ot_pay_code_id` int DEFAULT NULL,
  `overtime_policy` smallint NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_timeinterval_break_time`
--

CREATE TABLE `att_timeinterval_break_time` (
  `id` int NOT NULL,
  `timeinterval_id` int NOT NULL,
  `breaktime_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_training`
--

CREATE TABLE `att_training` (
  `workflowinstance_ptr_id` int NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `att_webpunch`
--

CREATE TABLE `att_webpunch` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `work_code` varchar(20) DEFAULT NULL,
  `apply_reason` longtext,
  `apply_time` datetime(6) NOT NULL,
  `verify_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 11, 'add_group'),
(6, 'Can change group', 11, 'change_group'),
(8, 'Can view group', 11, 'view_group'),
(9, 'Can GroupDelete group', 11, 'group_delete_group'),
(10, 'Can view email_template_setting', 12, 'view_email_template_setting'),
(11, 'Can view ad_server_setting', 12, 'view_ad_server_setting'),
(12, 'Can view facebook_alert_setting', 12, 'view_facebook_alert_setting'),
(13, 'Can view db_migrate', 12, 'view_db_migrate'),
(14, 'Can view safe_setting', 12, 'view_safe_setting'),
(15, 'Can view twilio_setting', 12, 'view_twilio_setting'),
(16, 'Can view system_setting', 12, 'view_system_setting'),
(17, 'Can view device_config', 13, 'view_device_config'),
(18, 'Can view psnl_config_setting', 14, 'view_psnl_config_setting'),
(19, 'Can view employeeschedule_report', 15, 'view_employeeschedule_report'),
(20, 'Can view transaction_report', 16, 'view_transaction_report'),
(21, 'Can view time_card_report', 16, 'view_time_card_report'),
(22, 'Can view first_last_report', 16, 'view_first_last_report'),
(23, 'Can view first_in_last_out_report', 16, 'view_first_in_last_out_report'),
(24, 'Can view total_time_card_v2', 16, 'view_total_time_card_v2'),
(25, 'Can view daily_activity', 16, 'view_daily_activity'),
(26, 'Can view daily_overtime', 16, 'view_daily_overtime'),
(27, 'Can view daily_leave', 16, 'view_daily_leave'),
(28, 'Can view daily_late_in', 16, 'view_daily_late_in'),
(29, 'Can view daily_early_out', 16, 'view_daily_early_out'),
(30, 'Can view daily_absent', 16, 'view_daily_absent'),
(31, 'Can view daily_exception', 16, 'view_daily_exception'),
(32, 'Can view scheduled_punch_report', 16, 'view_scheduled_punch_report'),
(33, 'Can view punch_paring', 16, 'view_punch_paring'),
(34, 'Can view daily_multiple_punch_paring', 16, 'view_daily_multiple_punch_paring'),
(35, 'Can view daily_multiple_break_paring', 16, 'view_daily_multiple_break_paring'),
(36, 'Can view weekly_worked_hours', 16, 'view_weekly_worked_hours'),
(37, 'Can view weekly_overtime', 16, 'view_weekly_overtime'),
(38, 'Can view monthly_status', 16, 'view_monthly_status'),
(39, 'Can view monthly_work_hours', 16, 'view_monthly_work_hours'),
(40, 'Can view monthly_punch', 16, 'view_monthly_punch'),
(41, 'Can view monthly_overtime', 16, 'view_monthly_overtime'),
(42, 'Can view monthly_absence', 16, 'view_monthly_absence'),
(43, 'Can view emp_summary_report', 16, 'view_emp_summary_report'),
(44, 'Can view employee_overtime', 16, 'view_employee_overtime'),
(45, 'Can view employee_leave', 16, 'view_employee_leave'),
(46, 'Can view dept_summary_report', 16, 'view_dept_summary_report'),
(47, 'Can view department_overtime', 16, 'view_department_overtime'),
(48, 'Can view group_summary_report', 16, 'view_group_summary_report'),
(49, 'Can view group_overtime', 16, 'view_group_overtime'),
(50, 'Can view sage_vip', 16, 'view_sage_vip'),
(51, 'Can view leave_balance_summary_report', 16, 'view_leave_balance_summary_report'),
(52, 'Can view staff_transaction_report', 17, 'view_staff_transaction_report'),
(53, 'Can view staff_scheduledlog_report', 17, 'view_staff_scheduledlog_report'),
(54, 'Can view staff_attdetail_report', 17, 'view_staff_attdetail_report'),
(55, 'Can view staff_summary_report', 17, 'view_staff_summary_report'),
(56, 'Can view staff_multipletransaction_report', 17, 'view_staff_multipletransaction_report'),
(57, 'Can view staff_breaktime_report', 17, 'view_staff_breaktime_report'),
(58, 'Can view staff_timecard_report', 17, 'view_staff_timecard_report'),
(59, 'Can view work_code_paring', 16, 'view_work_code_paring'),
(60, 'Can view emp_workcode_report', 16, 'view_emp_workcode_report'),
(61, 'Can view att_workbench', 18, 'view_att_workbench'),
(62, 'Can view att_rule_page', 19, 'view_att_rule_page'),
(63, 'Can view report_setting_page', 20, 'view_report_setting_page'),
(64, 'Can view calculation_view', 20, 'view_calculation_view'),
(65, 'Can view view_by_personnel', 15, 'view_view_by_personnel'),
(66, 'Can view payrollincrease_report', 21, 'view_payrollincrease_report'),
(67, 'Can view payrolldeduction_report', 21, 'view_payrolldeduction_report'),
(68, 'Can view payrolldetail_report', 21, 'view_payrolldetail_report'),
(69, 'Can view payrollcalcparam_report', 21, 'view_payrollcalcparam_report'),
(70, 'Can view salarystructure_report', 21, 'view_salarystructure_report'),
(71, 'Can view staff_salarystructure_report', 22, 'view_staff_salarystructure_report'),
(72, 'Can view staff_payrollincrease_report', 22, 'view_staff_payrollincrease_report'),
(73, 'Can view staff_payrolldeduction_report', 22, 'view_staff_payrolldeduction_report'),
(74, 'Can view staff_payrolldetail_report', 22, 'view_staff_payrolldetail_report'),
(75, 'Can view staff_payrollcalcparam_report', 22, 'view_staff_payrollcalcparam_report'),
(76, 'Can view socialsecuritydeduction_report', 21, 'view_socialsecuritydeduction_report'),
(77, 'Can view taxdeduction_report', 21, 'view_taxdeduction_report'),
(78, 'Can view payroll_reportcalculator', 21, 'view_payroll_reportcalculator'),
(79, 'Can view payroll_company_stamp_setting', 23, 'view_payroll_company_stamp_setting'),
(80, 'Can view payroll_social_security_deduction_setting', 23, 'view_payroll_social_security_deduction_setting'),
(81, 'Can view payroll_tax_deduction_setting', 23, 'view_payroll_tax_deduction_setting'),
(82, 'Can view payroll_slip_date_setting', 23, 'view_payroll_slip_date_setting'),
(83, 'Can view meeting_attendance_report', 24, 'view_meeting_attendance_report'),
(84, 'Can view meeting_room_scheduled', 24, 'view_meeting_room_scheduled'),
(85, 'Can view ep_dashboard', 25, 'view_ep_dashboard'),
(86, 'Can view daily_detail_report', 26, 'view_daily_detail_report'),
(87, 'Can view department_summary_report', 26, 'view_department_summary_report'),
(88, 'Can view unusual_employees_report', 26, 'view_unusual_employees_report'),
(89, 'Can view ep_real_time_monitoring', 25, 'view_ep_real_time_monitoring'),
(90, 'Can add content type', 75, 'add_contenttype'),
(91, 'Can change content type', 75, 'change_contenttype'),
(92, 'Can delete content type', 75, 'delete_contenttype'),
(93, 'Can view content type', 75, 'view_contenttype'),
(94, 'Can add log entry', 166, 'add_logentry'),
(95, 'Can change log entry', 166, 'change_logentry'),
(96, 'Can delete log entry', 166, 'delete_logentry'),
(97, 'Can view log entry', 166, 'view_logentry'),
(98, 'Can add session', 167, 'add_session'),
(99, 'Can change session', 167, 'change_session'),
(100, 'Can delete session', 167, 'delete_session'),
(101, 'Can view session', 167, 'view_session'),
(102, 'Can add Token', 168, 'add_token'),
(103, 'Can change Token', 168, 'change_token'),
(104, 'Can delete Token', 168, 'delete_token'),
(105, 'Can view Token', 168, 'view_token'),
(106, 'Can add token', 169, 'add_tokenproxy'),
(107, 'Can change token', 169, 'change_tokenproxy'),
(108, 'Can delete token', 169, 'delete_tokenproxy'),
(109, 'Can view token', 169, 'view_tokenproxy'),
(110, 'Can add API Request Log', 28, 'add_apirequestlog'),
(111, 'Can change API Request Log', 28, 'change_apirequestlog'),
(112, 'Can delete API Request Log', 28, 'delete_apirequestlog'),
(113, 'Can view API Request Log', 28, 'view_apirequestlog'),
(114, 'Can add crontab', 170, 'add_crontabschedule'),
(115, 'Can change crontab', 170, 'change_crontabschedule'),
(116, 'Can delete crontab', 170, 'delete_crontabschedule'),
(117, 'Can view crontab', 170, 'view_crontabschedule'),
(118, 'Can add interval', 171, 'add_intervalschedule'),
(119, 'Can change interval', 171, 'change_intervalschedule'),
(120, 'Can delete interval', 171, 'delete_intervalschedule'),
(121, 'Can view interval', 171, 'view_intervalschedule'),
(122, 'Can add periodic task', 172, 'add_periodictask'),
(123, 'Can change periodic task', 172, 'change_periodictask'),
(124, 'Can delete periodic task', 172, 'delete_periodictask'),
(125, 'Can view periodic task', 172, 'view_periodictask'),
(126, 'Can add periodic tasks', 173, 'add_periodictasks'),
(127, 'Can change periodic tasks', 173, 'change_periodictasks'),
(128, 'Can delete periodic tasks', 173, 'delete_periodictasks'),
(129, 'Can view periodic tasks', 173, 'view_periodictasks'),
(130, 'Can add solar event', 174, 'add_solarschedule'),
(131, 'Can change solar event', 174, 'change_solarschedule'),
(132, 'Can delete solar event', 174, 'delete_solarschedule'),
(133, 'Can view solar event', 174, 'view_solarschedule'),
(134, 'Can add clocked', 175, 'add_clockedschedule'),
(135, 'Can change clocked', 175, 'change_clockedschedule'),
(136, 'Can delete clocked', 175, 'delete_clockedschedule'),
(137, 'Can view clocked', 175, 'view_clockedschedule'),
(138, 'Can view base.models.adminLog', 27, 'view_adminlog'),
(139, 'Can add attendance rule', 176, 'add_attparam'),
(140, 'Can change attendance rule', 176, 'change_attparam'),
(141, 'Can delete attendance rule', 176, 'delete_attparam'),
(142, 'Can view attendance rule', 176, 'view_attparam'),
(143, 'Can add attParamDepts', 177, 'add_attparamdepts'),
(144, 'Can change attParamDepts', 177, 'change_attparamdepts'),
(145, 'Can delete attParamDepts', 177, 'delete_attparamdepts'),
(146, 'Can view attParamDepts', 177, 'view_attparamdepts'),
(147, 'Can add base_model_autoAttExportTask', 30, 'add_autoattexporttask'),
(148, 'Can change base_model_autoAttExportTask', 30, 'change_autoattexporttask'),
(149, 'Can delete base_model_autoAttExportTask', 30, 'delete_autoattexporttask'),
(150, 'Can view base_model_autoAttExportTask', 30, 'view_autoattexporttask'),
(151, 'Can add base_model_autoExportTask', 31, 'add_autoexporttask'),
(152, 'Can change base_model_autoExportTask', 31, 'change_autoexporttask'),
(153, 'Can delete base_model_autoExportTask', 31, 'delete_autoexporttask'),
(154, 'Can view base_model_autoExportTask', 31, 'view_autoexporttask'),
(155, 'Can delete base_model_bookmark', 33, 'delete_bookmark'),
(156, 'Can change base_model_bookmark', 33, 'change_bookmark'),
(157, 'Can add base_model_lineNotifySetting', 38, 'add_linenotifysetting'),
(158, 'Can change base_model_lineNotifySetting', 38, 'change_linenotifysetting'),
(159, 'Can delete base_model_lineNotifySetting', 38, 'delete_linenotifysetting'),
(160, 'Can view base_model_lineNotifySetting', 38, 'view_linenotifysetting'),
(161, 'Can add base.models.securityPolicy', 43, 'add_securitypolicy'),
(162, 'Can change base.models.securityPolicy', 43, 'change_securitypolicy'),
(163, 'Can delete base.models.securityPolicy', 43, 'delete_securitypolicy'),
(164, 'Can view base.models.securityPolicy', 43, 'view_securitypolicy'),
(165, 'Can add model_send_email', 178, 'add_sendemail'),
(166, 'Can change model_send_email', 178, 'change_sendemail'),
(167, 'Can delete model_send_email', 178, 'delete_sendemail'),
(168, 'Can view model_send_email', 178, 'view_sendemail'),
(169, 'Can add sftp_setting', 44, 'add_sftpsetting'),
(170, 'Can change sftp_setting', 44, 'change_sftpsetting'),
(171, 'Can delete sftp_setting', 44, 'delete_sftpsetting'),
(172, 'Can view sftp_setting', 44, 'view_sftpsetting'),
(173, 'Can view base_integrationTable_area', 42, 'view_syncarea'),
(174, 'Can view base_integrationTable_department', 39, 'view_syncdepartment'),
(175, 'Can view base_integrationTable_employee', 41, 'view_syncemployee'),
(176, 'Can view base_integrationTable_position', 40, 'view_syncjob'),
(177, 'Can add System Rule', 179, 'add_sysparam'),
(178, 'Can change System Rule', 179, 'change_sysparam'),
(179, 'Can delete System Rule', 179, 'delete_sysparam'),
(180, 'Can view System Rule', 179, 'view_sysparam'),
(181, 'Can add System Parameter related to Department', 180, 'add_sysparamdept'),
(182, 'Can change System Parameter related to Department', 180, 'change_sysparamdept'),
(183, 'Can delete System Parameter related to Department', 180, 'delete_sysparamdept'),
(184, 'Can view System Parameter related to Department', 180, 'view_sysparamdept'),
(185, 'Can view base.models.systemLog', 45, 'view_systemlog'),
(186, 'Can add base.model.systemSetting', 181, 'add_systemsetting'),
(187, 'Can change base.model.systemSetting', 181, 'change_systemsetting'),
(188, 'Can delete base.model.systemSetting', 181, 'delete_systemsetting'),
(189, 'Can view base.model.systemSetting', 181, 'view_systemsetting'),
(190, 'Can add Abstract Permission', 8, 'add_abstractpermission'),
(191, 'Can change Abstract Permission', 8, 'change_abstractpermission'),
(192, 'Can delete Abstract Permission', 8, 'delete_abstractpermission'),
(193, 'Can view Abstract Permission', 8, 'view_abstractpermission'),
(194, 'Can add System Setting Permission', 9, 'add_systemsettingpermission'),
(195, 'Can change System Setting Permission', 9, 'change_systemsettingpermission'),
(196, 'Can delete System Setting Permission', 9, 'delete_systemsettingpermission'),
(197, 'Can view System Setting Permission', 9, 'view_systemsettingpermission'),
(198, 'Can add base.model.emailTemplate', 35, 'add_emailtemplate'),
(199, 'Can change base.model.emailTemplate', 35, 'change_emailtemplate'),
(200, 'Can delete base.model.emailTemplate', 35, 'delete_emailtemplate'),
(201, 'Can view base.model.emailTemplate', 35, 'view_emailtemplate'),
(202, 'Can view base.models.eventAlertSetting', 36, 'view_eventalertsetting'),
(203, 'Can change base.models.eventAlertSetting', 36, 'change_eventalertsetting'),
(204, 'Can delete base_model_autoImportTask', 32, 'delete_autoimporttask'),
(205, 'Can change base_model_autoImportTask', 32, 'change_autoimporttask'),
(206, 'Can view base_model_autoImportTask', 32, 'view_autoimporttask'),
(207, 'Can view base_model_messengersentlog', 47, 'view_messengersentlog'),
(208, 'Can add zoom setting', 48, 'add_zoomsetting'),
(209, 'Can change zoom setting', 48, 'change_zoomsetting'),
(210, 'Can delete zoom setting', 48, 'delete_zoomsetting'),
(211, 'Can view zoom setting', 48, 'view_zoomsetting'),
(212, 'Can add line notify for employee', 37, 'add_linenotifyforemployee'),
(213, 'Can change line notify for employee', 37, 'change_linenotifyforemployee'),
(214, 'Can delete line notify for employee', 37, 'delete_linenotifyforemployee'),
(215, 'Can view line notify for employee', 37, 'view_linenotifyforemployee'),
(216, 'Can add reportoutput_setting', 49, 'add_reportoutputsetting'),
(217, 'Can change reportoutput_setting', 49, 'change_reportoutputsetting'),
(218, 'Can delete reportoutput_setting', 49, 'delete_reportoutputsetting'),
(219, 'Can view reportoutput_setting', 49, 'view_reportoutputsetting'),
(220, 'Can AddLineNotifyService linenotifyforemployee', 37, 'add_line_notify_service_linenotifyforemployee'),
(221, 'Can ManualExport autoexporttask', 31, 'manual_export_autoexporttask'),
(222, 'Can EnableTask autoexporttask', 31, 'enable_task_autoexporttask'),
(223, 'Can DisableTask autoexporttask', 31, 'disable_task_autoexporttask'),
(224, 'Can AddDefault autoimporttask', 32, 'add_default_autoimporttask'),
(225, 'Can AddUserDefine autoimporttask', 32, 'add_user_define_autoimporttask'),
(226, 'Can ManualImport autoimporttask', 32, 'manual_import_autoimporttask'),
(227, 'Can EnableTask autoimporttask', 32, 'enable_task_autoimporttask'),
(228, 'Can DisableTask autoimporttask', 32, 'disable_task_autoimporttask'),
(229, 'Can ManualAttExport autoattexporttask', 30, 'manual_att_export_autoattexporttask'),
(230, 'Can EnableTask autoattexporttask', 30, 'enable_task_autoattexporttask'),
(231, 'Can DisableTask autoattexporttask', 30, 'disable_task_autoattexporttask'),
(232, 'Can DBBackupAuto dbbackuplog', 34, 'd_b_backup_auto_dbbackuplog'),
(233, 'Can DBBackupManually dbbackuplog', 34, 'd_b_backup_manually_dbbackuplog'),
(234, 'Can DBRestoreManually dbbackuplog', 34, 'd_b_restore_manually_dbbackuplog'),
(235, 'Can view bookmark', 33, 'view_bookmark'),
(236, 'Can add iclock_model_bioData', 65, 'add_biodata'),
(237, 'Can change iclock_model_bioData', 65, 'change_biodata'),
(238, 'Can delete iclock_model_bioData', 65, 'delete_biodata'),
(239, 'Can view iclock_model_bioData', 65, 'view_biodata'),
(240, 'Can delete iclock_model_bioPhoto', 70, 'delete_biophoto'),
(241, 'Can view iclock_model_bioPhoto', 70, 'view_biophoto'),
(242, 'Can add iclock_model_deviceConfig', 69, 'add_devicemoduleconfig'),
(243, 'Can change iclock_model_deviceConfig', 69, 'change_devicemoduleconfig'),
(244, 'Can delete iclock_model_deviceConfig', 69, 'delete_devicemoduleconfig'),
(245, 'Can view iclock_model_deviceConfig', 69, 'view_devicemoduleconfig'),
(246, 'Can delete terminal_model_errorCommandLog', 71, 'delete_errorcommandlog'),
(247, 'Can view terminal_model_errorCommandLog', 71, 'view_errorcommandlog'),
(248, 'Can delete iclock_model_privateMessage', 66, 'delete_privatemessage'),
(249, 'Can change iclock_model_privateMessage', 66, 'change_privatemessage'),
(250, 'Can view iclock_model_privateMessage', 66, 'view_privatemessage'),
(251, 'Can delete iclock_model_publicMessage', 67, 'delete_publicmessage'),
(252, 'Can change iclock_model_publicMessage', 67, 'change_publicmessage'),
(253, 'Can view iclock_model_publicMessage', 67, 'view_publicmessage'),
(254, 'Can add terminal.models.shortMessage', 182, 'add_shortmessage'),
(255, 'Can change terminal.models.shortMessage', 182, 'change_shortmessage'),
(256, 'Can delete terminal.models.shortMessage', 182, 'delete_shortmessage'),
(257, 'Can view terminal.models.shortMessage', 182, 'view_shortmessage'),
(258, 'Can add iclock_model_terminal', 59, 'add_terminal'),
(259, 'Can change iclock_model_terminal', 59, 'change_terminal'),
(260, 'Can delete iclock_model_terminal', 59, 'delete_terminal'),
(261, 'Can view iclock_model_terminal', 59, 'view_terminal'),
(262, 'Can delete iclock_model_terminalCommand', 63, 'delete_terminalcommand'),
(263, 'Can view iclock_model_terminalCommand', 63, 'view_terminalcommand'),
(264, 'Can add iclock_model_terminalEmployee', 183, 'add_terminalemployee'),
(265, 'Can change iclock_model_terminalEmployee', 183, 'change_terminalemployee'),
(266, 'Can delete iclock_model_terminalEmployee', 183, 'delete_terminalemployee'),
(267, 'Can view iclock_model_terminalEmployee', 183, 'view_terminalemployee'),
(268, 'Can delete iclock_model_terminalLog', 61, 'delete_terminallog'),
(269, 'Can view iclock_model_terminalLog', 61, 'view_terminallog'),
(270, 'Can add iclock_model_terminalParameter', 73, 'add_terminalparameter'),
(271, 'Can change iclock_model_terminalParameter', 73, 'change_terminalparameter'),
(272, 'Can delete iclock_model_terminalParameter', 73, 'delete_terminalparameter'),
(273, 'Can view iclock_model_terminalParameter', 73, 'view_terminalparameter'),
(274, 'Can delete iclock_model_terminalUploadLog', 62, 'delete_terminaluploadlog'),
(275, 'Can view iclock_model_terminalUploadLog', 62, 'view_terminaluploadlog'),
(276, 'Can add iclock_model_terminalWorkCode', 68, 'add_terminalworkcode'),
(277, 'Can change iclock_model_terminalWorkCode', 68, 'change_terminalworkcode'),
(278, 'Can delete iclock_model_terminalWorkCode', 68, 'delete_terminalworkcode'),
(279, 'Can view iclock_model_terminalWorkCode', 68, 'view_terminalworkcode'),
(280, 'Can view iclock_model_transaction', 60, 'view_transaction'),
(281, 'Can add transaction.proof.command', 184, 'add_transactionproofcmd'),
(282, 'Can change transaction.proof.command', 184, 'change_transactionproofcmd'),
(283, 'Can delete transaction.proof.command', 184, 'delete_transactionproofcmd'),
(284, 'Can view transaction.proof.command', 184, 'view_transactionproofcmd'),
(285, 'Can delete iclock.models.terminalCommandLog', 64, 'delete_terminalcommandlog'),
(286, 'Can view iclock.models.terminalCommandLog', 64, 'view_terminalcommandlog'),
(287, 'Can add Device Setting Permission', 185, 'add_devicesettingpermission'),
(288, 'Can change Device Setting Permission', 185, 'change_devicesettingpermission'),
(289, 'Can delete Device Setting Permission', 185, 'delete_devicesettingpermission'),
(290, 'Can view Device Setting Permission', 185, 'view_devicesettingpermission'),
(291, 'Can TerminalNewArea terminal', 59, 'terminal_new_area_terminal'),
(292, 'Can TerminalClearCommand terminal', 59, 'terminal_clear_command_terminal'),
(293, 'Can TerminalClearAttendanceData terminal', 59, 'terminal_clear_attendance_data_terminal'),
(294, 'Can TerminalDeleteCapture terminal', 59, 'terminal_delete_capture_terminal'),
(295, 'Can TerminalClearAll terminal', 59, 'terminal_clear_all_terminal'),
(296, 'Can TerminalReUploadData terminal', 59, 'terminal_re_upload_data_terminal'),
(297, 'Can TerminalReUploadTransaction terminal', 59, 'terminal_re_upload_transaction_terminal'),
(298, 'Can TerminalReloadData terminal', 59, 'terminal_reload_data_terminal'),
(299, 'Can TerminalDataCompare terminal', 59, 'terminal_data_compare_terminal'),
(300, 'Can TerminalManualSync terminal', 59, 'terminal_manual_sync_terminal'),
(301, 'Can TerminalReboot terminal', 59, 'terminal_reboot_terminal'),
(302, 'Can TerminalReadInformation terminal', 59, 'terminal_read_information_terminal'),
(303, 'Can TerminalEnrollRemotely terminal', 59, 'terminal_enroll_remotely_terminal'),
(304, 'Can TerminalDuplicatePunchPeriod terminal', 59, 'terminal_duplicate_punch_period_terminal'),
(305, 'Can TerminalCapture terminal', 59, 'terminal_capture_terminal'),
(306, 'Can TerminalUpgradeFirmware terminal', 59, 'terminal_upgrade_firmware_terminal'),
(307, 'Can TerminalDaylightSavingTime terminal', 59, 'terminal_daylight_saving_time_terminal'),
(308, 'Can TerminalPunchStateChangeSetting terminal', 59, 'terminal_punch_state_change_setting_terminal'),
(309, 'Can TerminalPullFile terminal', 59, 'terminal_pull_file_terminal'),
(310, 'Can TerminalSetOption terminal', 59, 'terminal_set_option_terminal'),
(311, 'Can USBDataUpload transaction', 60, 'u_s_b_data_upload_transaction'),
(312, 'Can AttCaptureDownload transaction', 60, 'att_capture_download_transaction'),
(313, 'Can PunchRouteMapAction transaction', 60, 'punch_route_map_action_transaction'),
(314, 'Can TerminalUploadLogBulkDelete terminaluploadlog', 62, 'terminal_upload_log_bulk_delete_terminaluploadlog'),
(315, 'Can TerminalCommandBulkDelete terminalcommand', 63, 'terminal_command_bulk_delete_terminalcommand'),
(316, 'Can TerminalCommandLogBulkDelete terminalcommandlog', 64, 'terminal_command_log_bulk_delete_terminalcommandlog'),
(317, 'Can AddPublicMessage publicmessage', 67, 'add_public_message_publicmessage'),
(318, 'Can SendPublicMessage publicmessage', 67, 'send_public_message_publicmessage'),
(319, 'Can AddPrivateMessage privatemessage', 66, 'add_private_message_privatemessage'),
(320, 'Can SendPrivateMessage privatemessage', 66, 'send_private_message_privatemessage'),
(321, 'Can SendWorkCode terminalworkcode', 68, 'send_work_code_terminalworkcode'),
(322, 'Can RemoveWorkCode terminalworkcode', 68, 'remove_work_code_terminalworkcode'),
(323, 'Can BioPhotoApprove biophoto', 70, 'bio_photo_approve_biophoto'),
(324, 'Can BioPhotoQRCode biophoto', 70, 'bio_photo_q_r_code_biophoto'),
(325, 'Can ImportBioPhoto biophoto', 70, 'import_bio_photo_biophoto'),
(326, 'Can view deviceemployee', 72, 'view_deviceemployee'),
(327, 'Can change model_deviceemployee', 72, 'change_deviceemployee'),
(328, 'Can AreaTransfer deviceemployee', 72, 'area_transfer_deviceemployee'),
(329, 'Can ReSync2Device deviceemployee', 72, 're_sync2_device_deviceemployee'),
(330, 'Can ReUpload deviceemployee', 72, 're_upload_deviceemployee'),
(331, 'Can DeleteBioData deviceemployee', 72, 'delete_bio_data_deviceemployee'),
(332, 'Can EnrollFingerprint deviceemployee', 72, 'enroll_fingerprint_deviceemployee'),
(333, 'Can EnrollPalm deviceemployee', 72, 'enroll_palm_deviceemployee'),
(334, 'Can EnrollFacePhoto deviceemployee', 72, 'enroll_face_photo_deviceemployee'),
(335, 'Can add psnl_model_area', 51, 'add_area'),
(336, 'Can change psnl_model_area', 51, 'change_area'),
(337, 'Can delete psnl_model_area', 51, 'delete_area'),
(338, 'Can view psnl_model_area', 51, 'view_area'),
(339, 'Can add model_assign_area_to_employee', 186, 'add_assignareaemployee'),
(340, 'Can change model_assign_area_to_employee', 186, 'change_assignareaemployee'),
(341, 'Can delete model_assign_area_to_employee', 186, 'delete_assignareaemployee'),
(342, 'Can view model_assign_area_to_employee', 186, 'view_assignareaemployee'),
(343, 'Can add psnl_model_certification', 52, 'add_certification'),
(344, 'Can change psnl_model_certification', 52, 'change_certification'),
(345, 'Can delete psnl_model_certification', 52, 'delete_certification'),
(346, 'Can view psnl_model_certification', 52, 'view_certification'),
(347, 'Can add psnl_model_department', 53, 'add_department'),
(348, 'Can change psnl_model_department', 53, 'change_department'),
(349, 'Can delete psnl_model_department', 53, 'delete_department'),
(350, 'Can view psnl_model_department', 53, 'view_department'),
(351, 'Can add model_employee', 54, 'add_employee'),
(352, 'Can change model_employee', 54, 'change_employee'),
(353, 'Can delete model_employee', 54, 'delete_employee'),
(354, 'Can view model_employee', 54, 'view_employee'),
(355, 'Can delete employee certification', 57, 'delete_employeecertification'),
(356, 'Can change employee certification', 57, 'change_employeecertification'),
(357, 'Can view employee certification', 57, 'view_employeecertification'),
(358, 'Can add pnsl_model_empProfile', 187, 'add_employeeprofile'),
(359, 'Can change pnsl_model_empProfile', 187, 'change_employeeprofile'),
(360, 'Can delete pnsl_model_empProfile', 187, 'delete_employeeprofile'),
(361, 'Can view pnsl_model_empProfile', 187, 'view_employeeprofile'),
(362, 'Can add psnl.models.employment', 188, 'add_employment'),
(363, 'Can change psnl.models.employment', 188, 'change_employment'),
(364, 'Can delete psnl.models.employment', 188, 'delete_employment'),
(365, 'Can view psnl.models.employment', 188, 'view_employment'),
(366, 'Can add psnl_model_position', 55, 'add_position'),
(367, 'Can change psnl_model_position', 55, 'change_position'),
(368, 'Can delete psnl_model_position', 55, 'delete_position'),
(369, 'Can view psnl_model_position', 55, 'view_position'),
(370, 'Can delete psnl_model_resign', 56, 'delete_resign'),
(371, 'Can change psnl_model_resign', 56, 'change_resign'),
(372, 'Can view psnl_model_resign', 56, 'view_resign'),
(373, 'Can add employee calendar', 189, 'add_employeecalendar'),
(374, 'Can change employee calendar', 189, 'change_employeecalendar'),
(375, 'Can delete employee calendar', 189, 'delete_employeecalendar'),
(376, 'Can view employee calendar', 189, 'view_employeecalendar'),
(377, 'Can add personnel.models.employeeCustomAttribute', 58, 'add_employeecustomattribute'),
(378, 'Can change personnel.models.employeeCustomAttribute', 58, 'change_employeecustomattribute'),
(379, 'Can delete personnel.models.employeeCustomAttribute', 58, 'delete_employeecustomattribute'),
(380, 'Can view personnel.models.employeeCustomAttribute', 58, 'view_employeecustomattribute'),
(381, 'Can add personnel.models.employeeExtraInfo', 190, 'add_employeeextrainfo'),
(382, 'Can change personnel.models.employeeExtraInfo', 190, 'change_employeeextrainfo'),
(383, 'Can delete personnel.models.employeeExtraInfo', 190, 'delete_employeeextrainfo'),
(384, 'Can view personnel.models.employeeExtraInfo', 190, 'view_employeeextrainfo'),
(385, 'Can add psnl.model.company', 50, 'add_company'),
(386, 'Can change psnl.model.company', 50, 'change_company'),
(387, 'Can delete psnl.model.company', 50, 'delete_company'),
(388, 'Can view psnl.model.company', 50, 'view_company'),
(389, 'Can add Personnel Setting Permission', 10, 'add_personnelsettingpermission'),
(390, 'Can change Personnel Setting Permission', 10, 'change_personnelsettingpermission'),
(391, 'Can delete Personnel Setting Permission', 10, 'delete_personnelsettingpermission'),
(392, 'Can view Personnel Setting Permission', 10, 'view_personnelsettingpermission'),
(393, 'Can Import department', 53, 'import_department'),
(394, 'Can SetDepartment department', 53, 'set_department_department'),
(395, 'Can Import position', 55, 'import_position'),
(396, 'Can SetPosition position', 55, 'set_position_position'),
(397, 'Can Import area', 51, 'import_area'),
(398, 'Can SetArea area', 51, 'set_area_area'),
(399, 'Can Import certification', 52, 'import_certification'),
(400, 'Can ImportEmployee employee', 54, 'import_employee_employee'),
(401, 'Can ImportDocument employee', 54, 'import_document_employee'),
(402, 'Can ImportPhoto employee', 54, 'import_photo_employee'),
(403, 'Can ImportUSBData employee', 54, 'import_u_s_b_data_employee'),
(404, 'Can AdjustDepartment employee', 54, 'adjust_department_employee'),
(405, 'Can PositionTransfer employee', 54, 'position_transfer_employee'),
(406, 'Can AdjustArea employee', 54, 'adjust_area_employee'),
(407, 'Can PassProbation employee', 54, 'pass_probation_employee'),
(408, 'Can Resignation employee', 54, 'resignation_employee'),
(409, 'Can EnableApp employee', 54, 'enable_app_employee'),
(410, 'Can DisableApp employee', 54, 'disable_app_employee'),
(411, 'Can ResynchronizeDevice employee', 54, 'resynchronize_device_employee'),
(412, 'Can ReUploadFromDevice employee', 54, 're_upload_from_device_employee'),
(413, 'Can DeleteBiometricTemplates employee', 54, 'delete_biometric_templates_employee'),
(414, 'Can ExportUSBData employee', 54, 'export_u_s_b_data_employee'),
(415, 'Can AddEmployeeResign resign', 56, 'add_employee_resign_resign'),
(416, 'Can Reinstatement resign', 56, 'reinstatement_resign'),
(417, 'Can Import resign', 56, 'import_resign'),
(418, 'Can DisableAttendanceFunction resign', 56, 'disable_attendance_function_resign'),
(419, 'Can AddEmployeeCert employeecertification', 57, 'add_employee_cert_employeecertification'),
(420, 'Can Import employeecertification', 57, 'import_employeecertification'),
(421, 'Can add workflow_node_instance', 191, 'add_nodeinstance'),
(422, 'Can change workflow_node_instance', 191, 'change_nodeinstance'),
(423, 'Can delete workflow_node_instance', 191, 'delete_nodeinstance'),
(424, 'Can view workflow_node_instance', 191, 'view_nodeinstance'),
(425, 'Can delete workflow_model_workflowEngine', 76, 'delete_workflowengine'),
(426, 'Can change workflow_model_workflowEngine', 76, 'change_workflowengine'),
(427, 'Can view workflow_model_workflowEngine', 76, 'view_workflowengine'),
(428, 'Can add workflow instance', 192, 'add_workflowinstance'),
(429, 'Can change workflow instance', 192, 'change_workflowinstance'),
(430, 'Can delete workflow instance', 192, 'delete_workflowinstance'),
(431, 'Can view workflow instance', 192, 'view_workflowinstance'),
(432, 'Can add workflow_model_workflowNode', 77, 'add_workflownode'),
(433, 'Can change workflow_model_workflowNode', 77, 'change_workflownode'),
(434, 'Can delete workflow_model_workflowNode', 77, 'delete_workflownode'),
(435, 'Can view workflow_model_workflowNode', 77, 'view_workflownode'),
(436, 'Can add workflow_model_workflowRole', 74, 'add_workflowrole'),
(437, 'Can change workflow_model_workflowRole', 74, 'change_workflowrole'),
(438, 'Can delete workflow_model_workflowRole', 74, 'delete_workflowrole'),
(439, 'Can view workflow_model_workflowRole', 74, 'view_workflowrole'),
(440, 'Can WorkFlowRoleAssignEmployee workflowrole', 74, 'work_flow_role_assign_employee_workflowrole'),
(441, 'Can WorkFlowSetupForDepartment workflowengine', 76, 'work_flow_setup_for_department_workflowengine'),
(442, 'Can WorkFlowSetupForPosition workflowengine', 76, 'work_flow_setup_for_position_workflowengine'),
(443, 'Can WorkFlowSetupForEmployee workflowengine', 76, 'work_flow_setup_for_employee_workflowengine'),
(444, 'Can add att_calc_log', 193, 'add_attcalclog'),
(445, 'Can change att_calc_log', 193, 'change_attcalclog'),
(446, 'Can delete att_calc_log', 193, 'delete_attcalclog'),
(447, 'Can view att_calc_log', 193, 'view_attcalclog'),
(448, 'Can change att.models.attCode', 79, 'change_attcode'),
(449, 'Can view att.models.attCode', 79, 'view_attcode'),
(450, 'Can add att.models.attEmployee', 194, 'add_attemployee'),
(451, 'Can change att.models.attEmployee', 194, 'change_attemployee'),
(452, 'Can delete att.models.attEmployee', 194, 'delete_attemployee'),
(453, 'Can view att.models.attEmployee', 194, 'view_attemployee'),
(454, 'Can add att.models.attGroup', 80, 'add_attgroup'),
(455, 'Can change att.models.attGroup', 80, 'change_attgroup'),
(456, 'Can delete att.models.attGroup', 80, 'delete_attgroup'),
(457, 'Can view att.models.attGroup', 80, 'view_attgroup'),
(458, 'Can change att.models.attPolicy', 81, 'change_attpolicy'),
(459, 'Can view att.models.attPolicy', 81, 'view_attpolicy'),
(460, 'Can add att.model.calculateItem', 100, 'add_attreportsetting'),
(461, 'Can change att.model.calculateItem', 100, 'change_attreportsetting'),
(462, 'Can delete att.model.calculateItem', 100, 'delete_attreportsetting'),
(463, 'Can view att.model.calculateItem', 100, 'view_attreportsetting'),
(464, 'Can add att_model_attRule', 84, 'add_attrule'),
(465, 'Can change att_model_attRule', 84, 'change_attrule'),
(466, 'Can delete att_model_attRule', 84, 'delete_attrule'),
(467, 'Can view att_model_attRule', 84, 'view_attrule'),
(468, 'Can delete att_model_schedule', 89, 'delete_attschedule'),
(469, 'Can view att_model_schedule', 89, 'view_attschedule'),
(470, 'Can add att_model_shift', 88, 'add_attshift'),
(471, 'Can change att_model_shift', 88, 'change_attshift'),
(472, 'Can delete att_model_shift', 88, 'delete_attshift'),
(473, 'Can view att_model_shift', 88, 'view_attshift'),
(474, 'Can add att_model_breakTime', 96, 'add_breaktime'),
(475, 'Can change att_model_breakTime', 96, 'change_breaktime'),
(476, 'Can delete att_model_breakTime', 96, 'delete_breaktime'),
(477, 'Can view att_model_breakTime', 96, 'view_breaktime'),
(478, 'Can add att_model_changeSchedule', 97, 'add_changeschedule'),
(479, 'Can change att_model_changeSchedule', 97, 'change_changeschedule'),
(480, 'Can delete att_model_changeSchedule', 97, 'delete_changeschedule'),
(481, 'Can view att_model_changeSchedule', 97, 'view_changeschedule'),
(482, 'Can delete att.models.departmentPolicy', 82, 'delete_departmentpolicy'),
(483, 'Can change att.models.departmentPolicy', 82, 'change_departmentpolicy'),
(484, 'Can view att.models.departmentPolicy', 82, 'view_departmentpolicy'),
(485, 'Can delete att_model_deptSchedule', 98, 'delete_departmentschedule'),
(486, 'Can view att_model_deptSchedule', 98, 'view_departmentschedule'),
(487, 'Can delete att_model_deptAttRule', 95, 'delete_deptattrule'),
(488, 'Can change att_model_deptAttRule', 95, 'change_deptattrule'),
(489, 'Can view att_model_deptAttRule', 95, 'view_deptattrule'),
(490, 'Can delete att.models.groupPolicy', 83, 'delete_grouppolicy'),
(491, 'Can change att.models.groupPolicy', 83, 'change_grouppolicy'),
(492, 'Can view att.models.groupPolicy', 83, 'view_grouppolicy'),
(493, 'Can delete att.models.groupSchedule', 99, 'delete_groupschedule'),
(494, 'Can view att.models.groupSchedule', 99, 'view_groupschedule'),
(495, 'Can delete att_model_holiday', 94, 'delete_holiday'),
(496, 'Can change att_model_holiday', 94, 'change_holiday'),
(497, 'Can view att_model_holiday', 94, 'view_holiday'),
(498, 'Can delete att_model_leave', 91, 'delete_leave'),
(499, 'Can change att_model_leave', 91, 'change_leave'),
(500, 'Can view att_model_leave', 91, 'view_leave'),
(501, 'Can delete att_model_manualLog', 86, 'delete_manuallog'),
(502, 'Can change att_model_manualLog', 86, 'change_manuallog'),
(503, 'Can view att_model_manualLog', 86, 'view_manuallog'),
(504, 'Can delete att_model_overtime', 93, 'delete_overtime'),
(505, 'Can change att_model_overtime', 93, 'change_overtime'),
(506, 'Can view att_model_overtime', 93, 'view_overtime'),
(507, 'Can add att.models.overtimePolicy', 195, 'add_overtimepolicy'),
(508, 'Can change att.models.overtimePolicy', 195, 'change_overtimepolicy'),
(509, 'Can delete att.models.overtimePolicy', 195, 'delete_overtimepolicy'),
(510, 'Can view att.models.overtimePolicy', 195, 'view_overtimepolicy'),
(511, 'Can add att.models.payCode', 78, 'add_paycode'),
(512, 'Can change att.models.payCode', 78, 'change_paycode'),
(513, 'Can delete att.models.payCode', 78, 'delete_paycode'),
(514, 'Can view att.models.payCode', 78, 'view_paycode'),
(515, 'Can add payload att code', 196, 'add_payloadattcode'),
(516, 'Can change payload att code', 196, 'change_payloadattcode'),
(517, 'Can delete payload att code', 196, 'delete_payloadattcode'),
(518, 'Can view payload att code', 196, 'view_payloadattcode'),
(519, 'Can add payload base', 197, 'add_payloadbase'),
(520, 'Can change payload base', 197, 'change_payloadbase'),
(521, 'Can delete payload base', 197, 'delete_payloadbase'),
(522, 'Can view payload base', 197, 'view_payloadbase'),
(523, 'Can add payload break', 198, 'add_payloadbreak'),
(524, 'Can change payload break', 198, 'change_payloadbreak'),
(525, 'Can delete payload break', 198, 'delete_payloadbreak'),
(526, 'Can view payload break', 198, 'view_payloadbreak'),
(527, 'Can add payload effect punch', 199, 'add_payloadeffectpunch'),
(528, 'Can change payload effect punch', 199, 'change_payloadeffectpunch'),
(529, 'Can delete payload effect punch', 199, 'delete_payloadeffectpunch'),
(530, 'Can view payload effect punch', 199, 'view_payloadeffectpunch'),
(531, 'Can add payload exception', 200, 'add_payloadexception'),
(532, 'Can change payload exception', 200, 'change_payloadexception'),
(533, 'Can delete payload exception', 200, 'delete_payloadexception'),
(534, 'Can view payload exception', 200, 'view_payloadexception'),
(535, 'Can add payload mul punch set', 201, 'add_payloadmulpunchset'),
(536, 'Can change payload mul punch set', 201, 'change_payloadmulpunchset'),
(537, 'Can delete payload mul punch set', 201, 'delete_payloadmulpunchset'),
(538, 'Can view payload mul punch set', 201, 'view_payloadmulpunchset'),
(539, 'Can add payload overtime', 202, 'add_payloadovertime'),
(540, 'Can change payload overtime', 202, 'change_payloadovertime'),
(541, 'Can delete payload overtime', 202, 'delete_payloadovertime'),
(542, 'Can view payload overtime', 202, 'view_payloadovertime'),
(543, 'Can add payload paring', 203, 'add_payloadparing'),
(544, 'Can change payload paring', 203, 'change_payloadparing'),
(545, 'Can delete payload paring', 203, 'delete_payloadparing'),
(546, 'Can view payload paring', 203, 'view_payloadparing'),
(547, 'Can add payload pay code', 204, 'add_payloadpaycode'),
(548, 'Can change payload pay code', 204, 'change_payloadpaycode'),
(549, 'Can delete payload pay code', 204, 'delete_payloadpaycode'),
(550, 'Can view payload pay code', 204, 'view_payloadpaycode'),
(551, 'Can add payload punch', 205, 'add_payloadpunch'),
(552, 'Can change payload punch', 205, 'change_payloadpunch'),
(553, 'Can delete payload punch', 205, 'delete_payloadpunch'),
(554, 'Can view payload punch', 205, 'view_payloadpunch'),
(555, 'Can add att.models.payloadTimeCard', 206, 'add_payloadtimecard'),
(556, 'Can change att.models.payloadTimeCard', 206, 'change_payloadtimecard'),
(557, 'Can delete att.models.payloadTimeCard', 206, 'delete_payloadtimecard'),
(558, 'Can view att.models.payloadTimeCard', 206, 'view_payloadtimecard'),
(559, 'Can add att_model_reportParameter', 85, 'add_reportparam'),
(560, 'Can change att_model_reportParameter', 85, 'change_reportparam'),
(561, 'Can delete att_model_reportParameter', 85, 'delete_reportparam'),
(562, 'Can view att_model_reportParameter', 85, 'view_reportparam'),
(563, 'Can add att_model_reportTemplate', 207, 'add_reporttemplate'),
(564, 'Can change att_model_reportTemplate', 207, 'change_reporttemplate'),
(565, 'Can delete att_model_reportTemplate', 207, 'delete_reporttemplate'),
(566, 'Can view att_model_reportTemplate', 207, 'view_reporttemplate'),
(567, 'Can add att_model_shiftDetail', 208, 'add_shiftdetail'),
(568, 'Can change att_model_shiftDetail', 208, 'change_shiftdetail'),
(569, 'Can delete att_model_shiftDetail', 208, 'delete_shiftdetail'),
(570, 'Can view att_model_shiftDetail', 208, 'view_shiftdetail'),
(571, 'Can delete att.models.temporarySchedule', 90, 'delete_temporaryschedule'),
(572, 'Can view att.models.temporarySchedule', 90, 'view_temporaryschedule'),
(573, 'Can delete att_model_tempSchedule', 209, 'delete_tempschedule'),
(574, 'Can change att_model_tempSchedule', 209, 'change_tempschedule'),
(575, 'Can view att_model_tempSchedule', 209, 'view_tempschedule'),
(576, 'Can delete att_model_timeInterval', 87, 'delete_timeinterval'),
(577, 'Can change att_model_timeInterval', 87, 'change_timeinterval'),
(578, 'Can view att_model_timeInterval', 87, 'view_timeinterval'),
(579, 'Can delete att_model_training', 92, 'delete_training'),
(580, 'Can change att_model_training', 92, 'change_training'),
(581, 'Can view att_model_training', 92, 'view_training'),
(582, 'Can add Att Setting Permission', 2, 'add_attsettingpermission'),
(583, 'Can change Att Setting Permission', 2, 'change_attsettingpermission'),
(584, 'Can delete Att Setting Permission', 2, 'delete_attsettingpermission'),
(585, 'Can view Att Setting Permission', 2, 'view_attsettingpermission'),
(586, 'Can add Report Permission', 3, 'add_reportpermission'),
(587, 'Can change Report Permission', 3, 'change_reportpermission'),
(588, 'Can delete Report Permission', 3, 'delete_reportpermission'),
(589, 'Can view Report Permission', 3, 'view_reportpermission'),
(590, 'Can delete menu_att_leavegroup', 101, 'delete_leavegroup'),
(591, 'Can change menu_att_leavegroup', 101, 'change_leavegroup'),
(592, 'Can view menu_att_leavegroup', 101, 'view_leavegroup'),
(593, 'Can add att_model_leavegroupdetail', 102, 'add_leavegroupdetail'),
(594, 'Can change att_model_leavegroupdetail', 102, 'change_leavegroupdetail'),
(595, 'Can delete att_model_leavegroupdetail', 102, 'delete_leavegroupdetail'),
(596, 'Can view att_model_leavegroupdetail', 102, 'view_leavegroupdetail'),
(597, 'Can add att_model_leaveYearBalance', 103, 'add_leaveyearbalance'),
(598, 'Can change att_model_leaveYearBalance', 103, 'change_leaveyearbalance'),
(599, 'Can delete att_model_leaveYearBalance', 103, 'delete_leaveyearbalance'),
(600, 'Can view att_model_leaveYearBalance', 103, 'view_leaveyearbalance'),
(601, 'Can add att.models.webPunch', 210, 'add_webpunch'),
(602, 'Can change att.models.webPunch', 210, 'change_webpunch'),
(603, 'Can delete att.models.webPunch', 210, 'delete_webpunch'),
(604, 'Can view att.models.webPunch', 210, 'view_webpunch'),
(605, 'Can add calculate last date', 211, 'add_calculatelastdate'),
(606, 'Can change calculate last date', 211, 'change_calculatelastdate'),
(607, 'Can delete calculate last date', 211, 'delete_calculatelastdate'),
(608, 'Can view calculate last date', 211, 'view_calculatelastdate'),
(609, 'Can add calculate task', 212, 'add_calculatetask'),
(610, 'Can change calculate task', 212, 'change_calculatetask'),
(611, 'Can delete calculate task', 212, 'delete_calculatetask'),
(612, 'Can view calculate task', 212, 'view_calculatetask'),
(613, 'Can add Att Configurations Permission', 4, 'add_attconfigurationspermission'),
(614, 'Can change Att Configurations Permission', 4, 'change_attconfigurationspermission'),
(615, 'Can delete Att Configurations Permission', 4, 'delete_attconfigurationspermission'),
(616, 'Can view Att Configurations Permission', 4, 'view_attconfigurationspermission'),
(617, 'Can add Schedule View Permission', 5, 'add_scheduleviewpermission'),
(618, 'Can change Schedule View Permission', 5, 'change_scheduleviewpermission'),
(619, 'Can delete Schedule View Permission', 5, 'delete_scheduleviewpermission'),
(620, 'Can view Schedule View Permission', 5, 'view_scheduleviewpermission'),
(621, 'Can add Staff Report Permission', 6, 'add_staffreportpermission'),
(622, 'Can change Staff Report Permission', 6, 'change_staffreportpermission'),
(623, 'Can delete Staff Report Permission', 6, 'delete_staffreportpermission'),
(624, 'Can view Staff Report Permission', 6, 'view_staffreportpermission'),
(625, 'Can add att.menus.userGuid', 7, 'add_attuserguidepermission'),
(626, 'Can change att.menus.userGuid', 7, 'change_attuserguidepermission'),
(627, 'Can delete att.menus.userGuid', 7, 'delete_attuserguidepermission'),
(628, 'Can view att.menus.userGuid', 7, 'view_attuserguidepermission'),
(629, 'Can add payload work code paring', 213, 'add_payloadworkcodeparing'),
(630, 'Can change payload work code paring', 213, 'change_payloadworkcodeparing'),
(631, 'Can delete payload work code paring', 213, 'delete_payloadworkcodeparing'),
(632, 'Can view payload work code paring', 213, 'view_payloadworkcodeparing'),
(633, 'Can SetGroup attgroup', 80, 'set_group_attgroup'),
(634, 'Can AddDepartmentPolicy departmentpolicy', 82, 'add_department_policy_departmentpolicy'),
(635, 'Can AddGroupPolicy grouppolicy', 83, 'add_group_policy_grouppolicy'),
(636, 'Can AddAttSchedule attschedule', 89, 'add_att_schedule_attschedule'),
(637, 'Can Import attschedule', 89, 'import_attschedule'),
(638, 'Can AddDepartmentHoliday holiday', 94, 'add_department_holiday_holiday'),
(639, 'Can AddLeave leave', 91, 'add_leave_leave'),
(640, 'Can BulkAddLeave leave', 91, 'bulk_add_leave_leave'),
(641, 'Can ApproveLeave leave', 91, 'approve_leave_leave'),
(642, 'Can Reject leave', 91, 'reject_leave'),
(643, 'Can Revoke leave', 91, 'revoke_leave'),
(644, 'Can Import leave', 91, 'import_leave'),
(645, 'Can AddManualLog manuallog', 86, 'add_manual_log_manuallog'),
(646, 'Can BulkAddManualLog manuallog', 86, 'bulk_add_manual_log_manuallog'),
(647, 'Can Approve manuallog', 86, 'approve_manuallog'),
(648, 'Can Reject manuallog', 86, 'reject_manuallog'),
(649, 'Can Revoke manuallog', 86, 'revoke_manuallog'),
(650, 'Can Import manuallog', 86, 'import_manuallog'),
(651, 'Can AddOvertime overtime', 93, 'add_overtime_overtime'),
(652, 'Can BulkAddOvertime overtime', 93, 'bulk_add_overtime_overtime'),
(653, 'Can Approve overtime', 93, 'approve_overtime'),
(654, 'Can Reject overtime', 93, 'reject_overtime'),
(655, 'Can Revoke overtime', 93, 'revoke_overtime'),
(656, 'Can Import overtime', 93, 'import_overtime'),
(657, 'Can AddNormalTimetable timeinterval', 87, 'add_normal_timetable_timeinterval'),
(658, 'Can AddFlexibleTimetable timeinterval', 87, 'add_flexible_timetable_timeinterval'),
(659, 'Can AddTemporarySchedule temporaryschedule', 90, 'add_temporary_schedule_temporaryschedule'),
(660, 'Can ImportTemporarySchedule temporaryschedule', 90, 'import_temporary_schedule_temporaryschedule'),
(661, 'Can AddTraining training', 92, 'add_training_training'),
(662, 'Can BulkAddTraining training', 92, 'bulk_add_training_training'),
(663, 'Can Approve training', 92, 'approve_training'),
(664, 'Can Reject training', 92, 'reject_training'),
(665, 'Can Revoke training', 92, 'revoke_training'),
(666, 'Can Import training', 92, 'import_training'),
(667, 'Can BatchAddDepartmentRule deptattrule', 95, 'batch_add_department_rule_deptattrule'),
(668, 'Can Approve changeschedule', 97, 'approve_changeschedule'),
(669, 'Can Reject changeschedule', 97, 'reject_changeschedule'),
(670, 'Can Revoke changeschedule', 97, 'revoke_changeschedule'),
(671, 'Can AddDepartmentSchedule departmentschedule', 98, 'add_department_schedule_departmentschedule'),
(672, 'Can AddGroupSchedule groupschedule', 99, 'add_group_schedule_groupschedule'),
(673, 'Can AssignLeaveGroup leavegroup', 101, 'assign_leave_group_leavegroup'),
(674, 'Can AddLeaveGroup leavegroup', 101, 'add_leave_group_leavegroup'),
(675, 'Can add base_model_user', 29, 'add_myuser'),
(676, 'Can change base_model_user', 29, 'change_myuser'),
(677, 'Can add iclock_model_bioData', 214, 'add_adminbiodata'),
(678, 'Can change iclock_model_bioData', 214, 'change_adminbiodata'),
(679, 'Can delete iclock_model_bioData', 214, 'delete_adminbiodata'),
(680, 'Can view iclock_model_bioData', 214, 'view_adminbiodata'),
(681, 'Can add accounts.models.userNotification', 46, 'add_usernotification'),
(682, 'Can change accounts.models.userNotification', 46, 'change_usernotification'),
(683, 'Can delete accounts.models.userNotification', 46, 'delete_usernotification'),
(684, 'Can view accounts.models.userNotification', 46, 'view_usernotification'),
(685, 'can_enter_menu_system_module', 215, 'enter_system_module'),
(686, 'can_enter_personnel_module', 215, 'enter_personnel_module'),
(687, 'can_enter_terminal_module', 215, 'enter_terminal_module'),
(688, 'can_enter_attendance_module', 215, 'enter_attendance_module'),
(689, 'can_enter_payroll_module', 215, 'enter_payroll_module'),
(690, 'can_enter_access_module', 215, 'enter_access_module'),
(691, 'can_enter_visitor_module', 215, 'enter_visitor_module'),
(692, 'can_enter_meeting_module', 215, 'enter_meeting_module'),
(693, 'can_enter_ep_module', 215, 'enter_ep_module'),
(694, 'Can add password reset key', 216, 'add_passwordresetkey'),
(695, 'Can change password reset key', 216, 'change_passwordresetkey'),
(696, 'Can delete password reset key', 216, 'delete_passwordresetkey'),
(697, 'Can view password reset key', 216, 'view_passwordresetkey'),
(698, 'Can view myuser', 29, 'view_myuser'),
(699, 'Can ChangePassword myuser', 29, 'change_password_myuser'),
(700, 'Can UserDelete myuser', 29, 'user_delete_myuser'),
(701, 'Can MarkerAll usernotification', 46, 'marker_all_usernotification'),
(702, 'Can add StaffToken', 217, 'add_stafftoken'),
(703, 'Can change StaffToken', 217, 'change_stafftoken'),
(704, 'Can delete StaffToken', 217, 'delete_stafftoken'),
(705, 'Can view StaffToken', 217, 'view_stafftoken'),
(706, 'Can view pendingleave', 104, 'view_pendingleave'),
(707, 'Can StaffAddLeave pendingleave', 104, 'staff_add_leave_pendingleave'),
(708, 'Can Revoke pendingleave', 104, 'revoke_pendingleave'),
(709, 'Can view pendingovertime', 105, 'view_pendingovertime'),
(710, 'Can StaffAddOverTime pendingovertime', 105, 'staff_add_over_time_pendingovertime'),
(711, 'Can Revoke pendingovertime', 105, 'revoke_pendingovertime'),
(712, 'Can view pendingmanuallog', 106, 'view_pendingmanuallog'),
(713, 'Can StaffAddManualLog pendingmanuallog', 106, 'staff_add_manual_log_pendingmanuallog'),
(714, 'Can Revoke pendingmanuallog', 106, 'revoke_pendingmanuallog'),
(715, 'Can view pendingtraining', 107, 'view_pendingtraining'),
(716, 'Can StaffAddTraining pendingtraining', 107, 'staff_add_training_pendingtraining'),
(717, 'Can Revoke pendingtraining', 107, 'revoke_pendingtraining'),
(718, 'Can view pendingchangeschedule', 108, 'view_pendingchangeschedule'),
(719, 'Can view approvalleave', 109, 'view_approvalleave'),
(720, 'Can StaffApproveLeave approvalleave', 109, 'staff_approve_leave_approvalleave'),
(721, 'Can Reject approvalleave', 109, 'reject_approvalleave'),
(722, 'Can view approvalovertime', 110, 'view_approvalovertime'),
(723, 'Can Approve approvalovertime', 110, 'approve_approvalovertime'),
(724, 'Can Reject approvalovertime', 110, 'reject_approvalovertime'),
(725, 'Can view approvalmanuallog', 111, 'view_approvalmanuallog'),
(726, 'Can Approve approvalmanuallog', 111, 'approve_approvalmanuallog'),
(727, 'Can Reject approvalmanuallog', 111, 'reject_approvalmanuallog'),
(728, 'Can view approvaltraining', 112, 'view_approvaltraining'),
(729, 'Can Approve approvaltraining', 112, 'approve_approvaltraining'),
(730, 'Can Reject approvaltraining', 112, 'reject_approvaltraining'),
(731, 'Can view approvalchangeschedule', 113, 'view_approvalchangeschedule'),
(732, 'Can Approve approvalchangeschedule', 113, 'approve_approvalchangeschedule');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(733, 'Can Reject approvalchangeschedule', 113, 'reject_approvalchangeschedule'),
(734, 'Can view pendingreservation', 114, 'view_pendingreservation'),
(735, 'Can StaffAddReservation pendingreservation', 114, 'staff_add_reservation_pendingreservation'),
(736, 'Can Revoke pendingreservation', 114, 'revoke_pendingreservation'),
(737, 'Can view approvalreservation', 115, 'view_approvalreservation'),
(738, 'Can Approve approvalreservation', 115, 'approve_approvalreservation'),
(739, 'Can Reject approvalreservation', 115, 'reject_approvalreservation'),
(740, 'Can view pendingmeetingentity', 116, 'view_pendingmeetingentity'),
(741, 'Can Revoke pendingmeetingentity', 116, 'revoke_pendingmeetingentity'),
(742, 'Can AddMeetingAttender pendingmeetingentity', 116, 'add_meeting_attender_pendingmeetingentity'),
(743, 'Can view pendingmeetingmanuallog', 117, 'view_pendingmeetingmanuallog'),
(744, 'Can StaffAddMeetingManualLog pendingmeetingmanuallog', 117, 'staff_add_meeting_manual_log_pendingmeetingmanuallog'),
(745, 'Can Revoke pendingmeetingmanuallog', 117, 'revoke_pendingmeetingmanuallog'),
(746, 'Can view approvalmeetingentity', 118, 'view_approvalmeetingentity'),
(747, 'Can Approve approvalmeetingentity', 118, 'approve_approvalmeetingentity'),
(748, 'Can Reject approvalmeetingentity', 118, 'reject_approvalmeetingentity'),
(749, 'Can view approvalmeetingmanuallog', 119, 'view_approvalmeetingmanuallog'),
(750, 'Can Approve approvalmeetingmanuallog', 119, 'approve_approvalmeetingmanuallog'),
(751, 'Can Reject approvalmeetingmanuallog', 119, 'reject_approvalmeetingmanuallog'),
(752, 'Can delete app_model_announcement', 120, 'delete_announcement'),
(753, 'Can delete app_model_actionLog', 123, 'delete_appactionlog'),
(754, 'Can delete app_model_appList', 121, 'delete_applist'),
(755, 'Can delete app_model_notification', 122, 'delete_appnotification'),
(756, 'Can delete mobile_model_gpsForDepartment', 125, 'delete_gpsfordepartment'),
(757, 'Can change mobile_model_gpsForDepartment', 125, 'change_gpsfordepartment'),
(758, 'Can view mobile_model_gpsForDepartment', 125, 'view_gpsfordepartment'),
(759, 'Can delete mobile_model_gpsForEmployee', 124, 'delete_gpsforemployee'),
(760, 'Can change mobile_model_gpsForEmployee', 124, 'change_gpsforemployee'),
(761, 'Can view mobile_model_gpsForEmployee', 124, 'view_gpsforemployee'),
(762, 'Can add mobile_model_gpsLocation', 126, 'add_gpslocation'),
(763, 'Can change mobile_model_gpsLocation', 126, 'change_gpslocation'),
(764, 'Can delete mobile_model_gpsLocation', 126, 'delete_gpslocation'),
(765, 'Can view mobile_model_gpsLocation', 126, 'view_gpslocation'),
(766, 'Can add mobile api request log', 127, 'add_mobileapirequestlog'),
(767, 'Can change mobile api request log', 127, 'change_mobileapirequestlog'),
(768, 'Can delete mobile api request log', 127, 'delete_mobileapirequestlog'),
(769, 'Can view mobile api request log', 127, 'view_mobileapirequestlog'),
(770, 'Can view appactionlog', 123, 'view_appactionlog'),
(771, 'Can view applist', 121, 'view_applist'),
(772, 'Can ForceOffline applist', 121, 'force_offline_applist'),
(773, 'Can Disable applist', 121, 'disable_applist'),
(774, 'Can Enable applist', 121, 'enable_applist'),
(775, 'Can view announcement', 120, 'view_announcement'),
(776, 'Can AddPublicNotice announcement', 120, 'add_public_notice_announcement'),
(777, 'Can AddPrivateNotice announcement', 120, 'add_private_notice_announcement'),
(778, 'Can view appnotification', 122, 'view_appnotification'),
(779, 'Can AddGPSForDepartment gpsfordepartment', 125, 'add_g_p_s_for_department_gpsfordepartment'),
(780, 'Can AddGPSForEmployee gpsforemployee', 124, 'add_g_p_s_for_employee_gpsforemployee'),
(781, 'Can add payroll_model_deductionFormula', 129, 'add_deductionformula'),
(782, 'Can change payroll_model_deductionFormula', 129, 'change_deductionformula'),
(783, 'Can delete payroll_model_deductionFormula', 129, 'delete_deductionformula'),
(784, 'Can view payroll_model_deductionFormula', 129, 'view_deductionformula'),
(785, 'Can delete payroll_model_empLoan', 134, 'delete_emploan'),
(786, 'Can change payroll_model_empPayrollProfile', 128, 'change_emppayrollprofile'),
(787, 'Can view payroll_model_empPayrollProfile', 128, 'view_emppayrollprofile'),
(788, 'Can add payroll_model_exceptionFormula', 130, 'add_exceptionformula'),
(789, 'Can change payroll_model_exceptionFormula', 130, 'change_exceptionformula'),
(790, 'Can delete payroll_model_exceptionFormula', 130, 'delete_exceptionformula'),
(791, 'Can view payroll_model_exceptionFormula', 130, 'view_exceptionformula'),
(792, 'Can delete payroll_model_extraDeduction', 139, 'delete_extradeduction'),
(793, 'Can change payroll_model_extraDeduction', 139, 'change_extradeduction'),
(794, 'Can view payroll_model_extraDeduction', 139, 'view_extradeduction'),
(795, 'Can delete payroll_model_extraIncrease', 138, 'delete_extraincrease'),
(796, 'Can change payroll_model_extraIncrease', 138, 'change_extraincrease'),
(797, 'Can view payroll_model_extraIncrease', 138, 'view_extraincrease'),
(798, 'Can add payroll_model_increasementFormula', 131, 'add_increasementformula'),
(799, 'Can change payroll_model_increasementFormula', 131, 'change_increasementformula'),
(800, 'Can delete payroll_model_increasementFormula', 131, 'delete_increasementformula'),
(801, 'Can view payroll_model_increasementFormula', 131, 'view_increasementformula'),
(802, 'Can add payroll_model_leaveFormula', 132, 'add_leaveformula'),
(803, 'Can change payroll_model_leaveFormula', 132, 'change_leaveformula'),
(804, 'Can delete payroll_model_leaveFormula', 132, 'delete_leaveformula'),
(805, 'Can view payroll_model_leaveFormula', 132, 'view_leaveformula'),
(806, 'Can add payroll_model_overtimeFormula', 133, 'add_overtimeformula'),
(807, 'Can change payroll_model_overtimeFormula', 133, 'change_overtimeformula'),
(808, 'Can delete payroll_model_overtimeFormula', 133, 'delete_overtimeformula'),
(809, 'Can view payroll_model_overtimeFormula', 133, 'view_overtimeformula'),
(810, 'Can add payroll_model_payroll_payload', 218, 'add_payrollpayload'),
(811, 'Can change payroll_model_payroll_payload', 218, 'change_payrollpayload'),
(812, 'Can delete payroll_model_payroll_payload', 218, 'delete_payrollpayload'),
(813, 'Can view payroll_model_payroll_payload', 218, 'view_payrollpayload'),
(814, 'Can add payroll payload pay code', 219, 'add_payrollpayloadpaycode'),
(815, 'Can change payroll payload pay code', 219, 'change_payrollpayloadpaycode'),
(816, 'Can delete payroll payload pay code', 219, 'delete_payrollpayloadpaycode'),
(817, 'Can view payroll payload pay code', 219, 'view_payrollpayloadpaycode'),
(818, 'Can delete payroll_model_Reimbursement', 135, 'delete_reimbursement'),
(819, 'Can delete payroll_model_SalaryAdvance', 136, 'delete_salaryadvance'),
(820, 'Can delete payroll_model_salarystructure', 137, 'delete_salarystructure'),
(821, 'Can change payroll_model_salarystructure', 137, 'change_salarystructure'),
(822, 'Can view payroll_model_salarystructure', 137, 'view_salarystructure'),
(823, 'Can add Payroll Report Permission', 220, 'add_payrollreportpermission'),
(824, 'Can change Payroll Report Permission', 220, 'change_payrollreportpermission'),
(825, 'Can delete Payroll Report Permission', 220, 'delete_payrollreportpermission'),
(826, 'Can view Payroll Report Permission', 220, 'view_payrollreportpermission'),
(827, 'Can add Staff Payroll Report Permission', 221, 'add_staffpayrollreportpermission'),
(828, 'Can change Staff Payroll Report Permission', 221, 'change_staffpayrollreportpermission'),
(829, 'Can delete Staff Payroll Report Permission', 221, 'delete_staffpayrollreportpermission'),
(830, 'Can view Staff Payroll Report Permission', 221, 'view_staffpayrollreportpermission'),
(831, 'Can add payroll_model_empExpenseExemption', 143, 'add_empexpenseexemption'),
(832, 'Can change payroll_model_empExpenseExemption', 143, 'change_empexpenseexemption'),
(833, 'Can delete payroll_model_empExpenseExemption', 143, 'delete_empexpenseexemption'),
(834, 'Can view payroll_model_empExpenseExemption', 143, 'view_empexpenseexemption'),
(835, 'Can add payroll_model_socialSecurityDeduction', 140, 'add_socialsecuritydeduction'),
(836, 'Can change payroll_model_socialSecurityDeduction', 140, 'change_socialsecuritydeduction'),
(837, 'Can delete payroll_model_socialSecurityDeduction', 140, 'delete_socialsecuritydeduction'),
(838, 'Can view payroll_model_socialSecurityDeduction', 140, 'view_socialsecuritydeduction'),
(839, 'Can add payroll_model_specialPayment', 142, 'add_specialpayment'),
(840, 'Can change payroll_model_specialPayment', 142, 'change_specialpayment'),
(841, 'Can delete payroll_model_specialPayment', 142, 'delete_specialpayment'),
(842, 'Can view payroll_model_specialPayment', 142, 'view_specialpayment'),
(843, 'Can add payroll_model_taxDeduction', 141, 'add_taxdeduction'),
(844, 'Can change payroll_model_taxDeduction', 141, 'change_taxdeduction'),
(845, 'Can delete payroll_model_taxDeduction', 141, 'delete_taxdeduction'),
(846, 'Can view payroll_model_taxDeduction', 141, 'view_taxdeduction'),
(847, 'Can add Payroll Setting Permission', 222, 'add_payrollsettingpermission'),
(848, 'Can change Payroll Setting Permission', 222, 'change_payrollsettingpermission'),
(849, 'Can delete Payroll Setting Permission', 222, 'delete_payrollsettingpermission'),
(850, 'Can view Payroll Setting Permission', 222, 'view_payrollsettingpermission'),
(851, 'Can add payroll_model_payrollPayloadEmpExpenseExemption', 223, 'add_payrollpayloadexpenseexemption'),
(852, 'Can change payroll_model_payrollPayloadEmpExpenseExemption', 223, 'change_payrollpayloadexpenseexemption'),
(853, 'Can delete payroll_model_payrollPayloadEmpExpenseExemption', 223, 'delete_payrollpayloadexpenseexemption'),
(854, 'Can view payroll_model_payrollPayloadEmpExpenseExemption', 223, 'view_payrollpayloadexpenseexemption'),
(855, 'Can AddSpecialPaymentAction specialpayment', 142, 'add_special_payment_action_specialpayment'),
(856, 'Can view emploan', 134, 'view_emploan'),
(857, 'Can AddEmpLoanAction emploan', 134, 'add_emp_loan_action_emploan'),
(858, 'Can view reimbursement', 135, 'view_reimbursement'),
(859, 'Can AddReimbursementAction reimbursement', 135, 'add_reimbursement_action_reimbursement'),
(860, 'Can view salaryadvance', 136, 'view_salaryadvance'),
(861, 'Can AddSalaryAdvanceAction salaryadvance', 136, 'add_salary_advance_action_salaryadvance'),
(862, 'Can AddSalaryStructureAction salarystructure', 137, 'add_salary_structure_action_salarystructure'),
(863, 'Can AddExtraIncreaseAction extraincrease', 138, 'add_extra_increase_action_extraincrease'),
(864, 'Can AddExtraDeductionAction extradeduction', 139, 'add_extra_deduction_action_extradeduction'),
(865, 'Can AddEmpExpenseExemptionAction empexpenseexemption', 143, 'add_emp_expense_exemption_action_empexpenseexemption'),
(866, 'Can add acc_combination', 147, 'add_acccombination'),
(867, 'Can change acc_combination', 147, 'change_acccombination'),
(868, 'Can delete acc_combination', 147, 'delete_acccombination'),
(869, 'Can view acc_combination', 147, 'view_acccombination'),
(870, 'Can add acc_groups', 146, 'add_accgroups'),
(871, 'Can change acc_groups', 146, 'change_accgroups'),
(872, 'Can delete acc_groups', 146, 'delete_accgroups'),
(873, 'Can view acc_groups', 146, 'view_accgroups'),
(874, 'Can add acc_holiday', 145, 'add_accholiday'),
(875, 'Can change acc_holiday', 145, 'change_accholiday'),
(876, 'Can delete acc_holiday', 145, 'delete_accholiday'),
(877, 'Can view acc_holiday', 145, 'view_accholiday'),
(878, 'Can add acc_privilege', 148, 'add_accprivilege'),
(879, 'Can change acc_privilege', 148, 'change_accprivilege'),
(880, 'Can delete acc_privilege', 148, 'delete_accprivilege'),
(881, 'Can view acc_privilege', 148, 'view_accprivilege'),
(882, 'Can change menu_access_terminal', 149, 'change_accterminal'),
(883, 'Can view menu_access_terminal', 149, 'view_accterminal'),
(884, 'Can add acc_timezone', 144, 'add_acctimezone'),
(885, 'Can change acc_timezone', 144, 'change_acctimezone'),
(886, 'Can delete acc_timezone', 144, 'delete_acctimezone'),
(887, 'Can view acc_timezone', 144, 'view_acctimezone'),
(888, 'Can CloneToArea acctimezone', 144, 'clone_to_area_acctimezone'),
(889, 'Can CloneToArea accholiday', 145, 'clone_to_area_accholiday'),
(890, 'Can CloneToArea accgroups', 146, 'clone_to_area_accgroups'),
(891, 'Can SetEmployeeGroup accgroups', 146, 'set_employee_group_accgroups'),
(892, 'Can CloneToArea acccombination', 147, 'clone_to_area_acccombination'),
(893, 'Can AdjustEmployeePrivilege accprivilege', 148, 'adjust_employee_privilege_accprivilege'),
(894, 'Can OpenDoor accterminal', 149, 'open_door_accterminal'),
(895, 'Can CancelAlarm accterminal', 149, 'cancel_alarm_accterminal'),
(896, 'Can SetParameter accterminal', 149, 'set_parameter_accterminal'),
(897, 'Can add visitor.field.reason', 152, 'add_reason'),
(898, 'Can change visitor.field.reason', 152, 'change_reason'),
(899, 'Can delete visitor.field.reason', 152, 'delete_reason'),
(900, 'Can view visitor.field.reason', 152, 'view_reason'),
(901, 'Can change menu.visitor.reservation', 151, 'change_reservation'),
(902, 'Can delete menu.visitor.reservation', 151, 'delete_reservation'),
(903, 'Can add menu.visitor', 150, 'add_visitor'),
(904, 'Can change menu.visitor', 150, 'change_visitor'),
(905, 'Can delete menu.visitor', 150, 'delete_visitor'),
(906, 'Can view menu.visitor', 150, 'view_visitor'),
(907, 'Can change visitor.model.configuration', 154, 'change_visitorconfig'),
(908, 'Can view visitor.model.configuration', 154, 'view_visitorconfig'),
(909, 'Can delete model.visitor.log', 153, 'delete_visitorlog'),
(910, 'Can view model.visitor.log', 153, 'view_visitorlog'),
(911, 'Can view visitor.model.VisitorBioData', 156, 'view_visitorbiodata'),
(912, 'Can delete visitor.model.VisitorBioPhoto', 155, 'delete_visitorbiophoto'),
(913, 'Can view visitor.model.VisitorBioPhoto', 155, 'view_visitorbiophoto'),
(914, 'Can add visitor.models.visitorTransaction', 157, 'add_visitortransaction'),
(915, 'Can change visitor.models.visitorTransaction', 157, 'change_visitortransaction'),
(916, 'Can delete visitor.models.visitorTransaction', 157, 'delete_visitortransaction'),
(917, 'Can view visitor.models.visitorTransaction', 157, 'view_visitortransaction'),
(918, 'Can add psnl_model_certification', 158, 'add_visitorcertification'),
(919, 'Can change psnl_model_certification', 158, 'change_visitorcertification'),
(920, 'Can delete psnl_model_certification', 158, 'delete_visitorcertification'),
(921, 'Can view psnl_model_certification', 158, 'view_visitorcertification'),
(922, 'Can ExitRegistration visitor', 150, 'exit_registration_visitor'),
(923, 'Can view reservation', 151, 'view_reservation'),
(924, 'Can AddReservation reservation', 151, 'add_reservation_reservation'),
(925, 'Can Approve reservation', 151, 'approve_reservation'),
(926, 'Can Reject reservation', 151, 'reject_reservation'),
(927, 'Can Revoke reservation', 151, 'revoke_reservation'),
(928, 'Can ReservationQRCode reservation', 151, 'reservation_q_r_code_reservation'),
(929, 'Can EnableVisitor visitorlog', 153, 'enable_visitor_visitorlog'),
(930, 'Can DisableVisitor visitorlog', 153, 'disable_visitor_visitorlog'),
(931, 'Can VisitorBioPhotoApprove visitorbiophoto', 155, 'visitor_bio_photo_approve_visitorbiophoto'),
(932, 'Can VisitorBioPhotoQRCode visitorbiophoto', 155, 'visitor_bio_photo_q_r_code_visitorbiophoto'),
(933, 'Can add meeting.models.meetingEntity', 161, 'add_meetingentity'),
(934, 'Can change meeting.models.meetingEntity', 161, 'change_meetingentity'),
(935, 'Can delete meeting.models.meetingEntity', 161, 'delete_meetingentity'),
(936, 'Can view meeting.models.meetingEntity', 161, 'view_meetingentity'),
(937, 'Can delete meeting.models.manualLog', 162, 'delete_meetingmanuallog'),
(938, 'Can change meeting.models.manualLog', 162, 'change_meetingmanuallog'),
(939, 'Can view meeting.models.manualLog', 162, 'view_meetingmanuallog'),
(940, 'Can add meeting.models.meetingPayloadBase', 224, 'add_meetingpayloadbase'),
(941, 'Can change meeting.models.meetingPayloadBase', 224, 'change_meetingpayloadbase'),
(942, 'Can delete meeting.models.meetingPayloadBase', 224, 'delete_meetingpayloadbase'),
(943, 'Can view meeting.models.meetingPayloadBase', 224, 'view_meetingpayloadbase'),
(944, 'Can delete meeting.models.meetingRoom', 159, 'delete_meetingroom'),
(945, 'Can change meeting.models.meetingRoom', 159, 'change_meetingroom'),
(946, 'Can view meeting.models.meetingRoom', 159, 'view_meetingroom'),
(947, 'Can add meeting.models.device', 160, 'add_meetingroomdevice'),
(948, 'Can change meeting.models.device', 160, 'change_meetingroomdevice'),
(949, 'Can delete meeting.models.device', 160, 'delete_meetingroomdevice'),
(950, 'Can view meeting.models.device', 160, 'view_meetingroomdevice'),
(951, 'Can view meeting.models.transaction', 163, 'view_meetingtransaction'),
(952, 'Can add Meeting Report Permission', 225, 'add_meetingreportpermission'),
(953, 'Can change Meeting Report Permission', 225, 'change_meetingreportpermission'),
(954, 'Can delete Meeting Report Permission', 225, 'delete_meetingreportpermission'),
(955, 'Can view Meeting Report Permission', 225, 'view_meetingreportpermission'),
(956, 'Can AddMeetingRoom meetingroom', 159, 'add_meeting_room_meetingroom'),
(957, 'Can MeetingCalculation meetingentity', 161, 'meeting_calculation_meetingentity'),
(958, 'Can Approve meetingentity', 161, 'approve_meetingentity'),
(959, 'Can Revoke meetingentity', 161, 'revoke_meetingentity'),
(960, 'Can Reject meetingentity', 161, 'reject_meetingentity'),
(961, 'Can AddMeetingAttender meetingentity', 161, 'add_meeting_attender_meetingentity'),
(962, 'Can SyncMeeting2Device meetingentity', 161, 'sync_meeting2_device_meetingentity'),
(963, 'Can AddMeetingManualLog meetingmanuallog', 162, 'add_meeting_manual_log_meetingmanuallog'),
(964, 'Can Approve meetingmanuallog', 162, 'approve_meetingmanuallog'),
(965, 'Can Reject meetingmanuallog', 162, 'reject_meetingmanuallog'),
(966, 'Can Revoke meetingmanuallog', 162, 'revoke_meetingmanuallog'),
(967, 'Can add ep.models.epSetup', 164, 'add_epsetup'),
(968, 'Can change ep.models.epSetup', 164, 'change_epsetup'),
(969, 'Can delete ep.models.epSetup', 164, 'delete_epsetup'),
(970, 'Can view ep.models.epSetup', 164, 'view_epsetup'),
(971, 'Can add ep.models.epTransaction', 165, 'add_eptransaction'),
(972, 'Can change ep.models.epTransaction', 165, 'change_eptransaction'),
(973, 'Can delete ep.models.epTransaction', 165, 'delete_eptransaction'),
(974, 'Can view ep.models.epTransaction', 165, 'view_eptransaction'),
(975, 'Can add Ep Dashboard Permission', 226, 'add_epdashboardpermission'),
(976, 'Can change Ep Dashboard Permission', 226, 'change_epdashboardpermission'),
(977, 'Can delete Ep Dashboard Permission', 226, 'delete_epdashboardpermission'),
(978, 'Can view Ep Dashboard Permission', 226, 'view_epdashboardpermission'),
(979, 'Can add Report Permission', 227, 'add_epreportpermission'),
(980, 'Can change Report Permission', 227, 'change_epreportpermission'),
(981, 'Can delete Report Permission', 227, 'delete_epreportpermission'),
(982, 'Can view Report Permission', 227, 'view_epreportpermission');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `emp_pin` varchar(30) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `tele_phone` varchar(30) DEFAULT NULL,
  `auth_time_dept` int DEFAULT NULL,
  `login_id` int DEFAULT NULL,
  `login_type` int DEFAULT NULL,
  `login_count` int DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `can_manage_all_dept` tinyint(1) NOT NULL,
  `del_flag` int DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `assign_company` int DEFAULT NULL,
  `password_reset` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_auth_area`
--

CREATE TABLE `auth_user_auth_area` (
  `id` int NOT NULL,
  `myuser_id` int NOT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_auth_dept`
--

CREATE TABLE `auth_user_auth_dept` (
  `id` int NOT NULL,
  `myuser_id` int NOT NULL,
  `department_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `myuser_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_profile`
--

CREATE TABLE `auth_user_profile` (
  `id` int NOT NULL,
  `login_name` varchar(30) NOT NULL,
  `pin_tabs` longtext NOT NULL,
  `disabled_fields` longtext NOT NULL,
  `column_order` longtext NOT NULL,
  `preferences` longtext NOT NULL,
  `pwd_update_time` datetime(6) DEFAULT NULL,
  `user_id` int NOT NULL,
  `employee_fields` longtext NOT NULL DEFAULT (_utf8mb3'')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `myuser_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_adminlog`
--

CREATE TABLE `base_adminlog` (
  `id` int NOT NULL,
  `action` varchar(50) NOT NULL,
  `targets` longtext,
  `targets_repr` longtext,
  `action_status` smallint NOT NULL,
  `description` longtext,
  `ip_address` char(39) DEFAULT NULL,
  `can_routable` tinyint(1) NOT NULL,
  `op_time` datetime(6) NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_attparamdepts`
--

CREATE TABLE `base_attparamdepts` (
  `id` int NOT NULL,
  `rulename` varchar(40) NOT NULL,
  `deptid` int NOT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `optime` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_autoattexporttask`
--

CREATE TABLE `base_autoattexporttask` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_autoexporttask`
--

CREATE TABLE `base_autoexporttask` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_autoimporttask`
--

CREATE TABLE `base_autoimporttask` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `params` longtext,
  `enable` tinyint(1) NOT NULL,
  `process_time` datetime(6) DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_bookmark`
--

CREATE TABLE `base_bookmark` (
  `id` int NOT NULL,
  `title` varchar(128) NOT NULL,
  `filters` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `time_saved` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_dbbackuplog`
--

CREATE TABLE `base_dbbackuplog` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `db_type` varchar(50) NOT NULL,
  `db_name` varchar(50) NOT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `backup_file` varchar(100) NOT NULL,
  `backup_time` datetime(6) NOT NULL,
  `backup_status` smallint NOT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_emailtemplate`
--

CREATE TABLE `base_emailtemplate` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `category` int NOT NULL,
  `sub_category` int NOT NULL,
  `event` int NOT NULL,
  `receiver` int NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `template` longtext NOT NULL,
  `enable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_emailtemplate`
--

INSERT INTO `base_emailtemplate` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `category`, `sub_category`, `event`, `receiver`, `subject`, `template`, `enable`) VALUES
(1, '2026-11-05 12:19:52.918056', NULL, '2026-11-05 12:19:52.918056', NULL, 0, 11, 0, 1, 1, NULL, '', 0),
(2, '2026-11-05 12:19:52.966013', NULL, '2026-11-05 12:19:52.966013', NULL, 0, 11, 0, 2, 1, NULL, '', 0),
(3, '2026-11-05 12:19:53.022726', NULL, '2026-11-05 12:19:53.022726', NULL, 0, 11, 0, 3, 1, NULL, '', 0),
(4, '2026-11-05 12:19:53.065931', NULL, '2026-11-05 12:19:53.065931', NULL, 0, 11, 0, 7, 1, NULL, '', 0),
(5, '2026-11-05 12:19:53.099111', NULL, '2026-11-05 12:19:53.099111', NULL, 0, 12, 121, 4, 1, NULL, '', 0),
(6, '2026-11-05 12:19:53.141249', NULL, '2026-11-05 12:19:53.141249', NULL, 0, 12, 121, 5, 1, NULL, '', 0),
(7, '2026-11-05 12:19:53.178207', NULL, '2026-11-05 12:19:53.178207', NULL, 0, 12, 121, 6, 1, NULL, '', 0),
(8, '2026-11-05 12:19:53.208122', NULL, '2026-11-05 12:19:53.208122', NULL, 0, 12, 122, 4, 1, NULL, '', 0),
(9, '2026-11-05 12:19:53.257905', NULL, '2026-11-05 12:19:53.257905', NULL, 0, 12, 122, 5, 1, NULL, '', 0),
(10, '2026-11-05 12:19:53.297980', NULL, '2026-11-05 12:19:53.297980', NULL, 0, 12, 122, 6, 1, NULL, '', 0),
(11, '2026-11-05 12:19:53.332857', NULL, '2026-11-05 12:19:53.332857', NULL, 0, 12, 123, 4, 1, NULL, '', 0),
(12, '2026-11-05 12:19:53.365231', NULL, '2026-11-05 12:19:53.365231', NULL, 0, 12, 123, 5, 1, NULL, '', 0),
(13, '2026-11-05 12:19:53.398071', NULL, '2026-11-05 12:19:53.398071', NULL, 0, 12, 123, 6, 1, NULL, '', 0),
(14, '2026-11-05 12:19:53.525154', NULL, '2026-11-05 12:19:53.525154', NULL, 0, 12, 124, 4, 1, NULL, '', 0),
(15, '2026-11-05 12:19:53.576581', NULL, '2026-11-05 12:19:53.576581', NULL, 0, 12, 124, 5, 1, NULL, '', 0),
(16, '2026-11-05 12:19:53.608048', NULL, '2026-11-05 12:19:53.608048', NULL, 0, 12, 124, 6, 1, NULL, '', 0),
(17, '2026-11-05 12:19:53.641120', NULL, '2026-11-05 12:19:53.641120', NULL, 0, 12, 125, 4, 1, NULL, '', 0),
(18, '2026-11-05 12:19:53.673658', NULL, '2026-11-05 12:19:53.673658', NULL, 0, 12, 125, 5, 1, NULL, '', 0),
(19, '2026-11-05 12:19:53.748091', NULL, '2026-11-05 12:19:53.748091', NULL, 0, 12, 125, 6, 1, NULL, '', 0),
(20, '2026-11-05 12:19:53.842306', NULL, '2026-11-05 12:19:53.842306', NULL, 0, 13, 1310, 4, 1, NULL, '', 0),
(21, '2026-11-05 12:19:53.908101', NULL, '2026-11-05 12:19:53.908101', NULL, 0, 13, 1310, 5, 1, NULL, '', 0),
(22, '2026-11-05 12:19:53.939647', NULL, '2026-11-05 12:19:53.939647', NULL, 0, 13, 1310, 6, 1, NULL, '', 0),
(23, '2026-11-05 12:19:53.975609', NULL, '2026-11-05 12:19:53.975609', NULL, 0, 13, 1311, 4, 1, NULL, '', 0),
(24, '2026-11-05 12:19:54.009315', NULL, '2026-11-05 12:19:54.009315', NULL, 0, 13, 1311, 5, 1, NULL, '', 0),
(25, '2026-11-05 12:19:54.048103', NULL, '2026-11-05 12:19:54.048103', NULL, 0, 13, 1311, 6, 1, NULL, '', 0),
(26, '2026-11-05 12:19:54.079548', NULL, '2026-11-05 12:19:54.079548', NULL, 0, 14, 149, 4, 1, NULL, '', 0),
(27, '2026-11-05 12:19:54.124876', NULL, '2026-11-05 12:19:54.124876', NULL, 0, 14, 149, 5, 1, NULL, '', 0),
(28, '2026-11-05 12:19:54.157875', NULL, '2026-11-05 12:19:54.157875', NULL, 0, 14, 149, 6, 1, NULL, '', 0),
(29, '2026-11-05 12:19:54.192049', NULL, '2026-11-05 12:19:54.192049', NULL, 0, 15, 0, 201, 1, NULL, '', 0),
(30, '2026-11-05 12:19:54.248021', NULL, '2026-11-05 12:19:54.248021', NULL, 0, 16, 0, 202, 1, NULL, '', 0),
(31, '2026-11-05 12:19:54.277928', NULL, '2026-11-05 12:19:54.277928', NULL, 0, 17, 0, 203, 1, NULL, '', 0),
(32, '2026-11-05 12:19:54.308111', NULL, '2026-11-05 12:19:54.308111', NULL, 0, 18, 0, 14, 1, NULL, '', 0),
(33, '2026-11-05 12:19:54.365878', NULL, '2026-11-05 12:19:54.365878', NULL, 0, 18, 0, 15, 1, NULL, '', 0),
(34, '2026-11-05 12:19:54.397943', NULL, '2026-11-05 12:19:54.397943', NULL, 0, 21, 0, 1, 2, NULL, '', 0),
(35, '2026-11-05 12:19:54.500825', NULL, '2026-11-05 12:19:54.500825', NULL, 0, 21, 0, 2, 2, NULL, '', 0),
(36, '2026-11-05 12:19:54.538211', NULL, '2026-11-05 12:19:54.538211', NULL, 0, 21, 0, 3, 2, NULL, '', 0),
(37, '2026-11-05 12:19:54.600742', NULL, '2026-11-05 12:19:54.600742', NULL, 0, 21, 0, 7, 2, NULL, '', 0),
(38, '2026-11-05 12:19:54.658101', NULL, '2026-11-05 12:19:54.658101', NULL, 0, 22, 0, 201, 2, NULL, '', 0),
(39, '2026-11-05 12:19:54.707910', NULL, '2026-11-05 12:19:54.707910', NULL, 0, 32, 321, 4, 3, NULL, '', 0),
(40, '2026-11-05 12:19:54.738120', NULL, '2026-11-05 12:19:54.738120', NULL, 0, 32, 321, 5, 3, NULL, '', 0),
(41, '2026-11-05 12:19:54.769725', NULL, '2026-11-05 12:19:54.769725', NULL, 0, 32, 321, 6, 3, NULL, '', 0),
(42, '2026-11-05 12:19:54.807913', NULL, '2026-11-05 12:19:54.807913', NULL, 0, 32, 322, 4, 3, NULL, '', 0),
(43, '2026-11-05 12:19:54.838103', NULL, '2026-11-05 12:19:54.838103', NULL, 0, 32, 322, 5, 3, NULL, '', 0),
(44, '2026-11-05 12:19:54.873584', NULL, '2026-11-05 12:19:54.874639', NULL, 0, 32, 322, 6, 3, NULL, '', 0),
(45, '2026-11-05 12:19:54.917882', NULL, '2026-11-05 12:19:54.917882', NULL, 0, 32, 323, 4, 3, NULL, '', 0),
(46, '2026-11-05 12:19:54.957877', NULL, '2026-11-05 12:19:54.957877', NULL, 0, 32, 323, 5, 3, NULL, '', 0),
(47, '2026-11-05 12:19:54.988860', NULL, '2026-11-05 12:19:54.988860', NULL, 0, 32, 323, 6, 3, NULL, '', 0),
(48, '2026-11-05 12:19:55.020708', NULL, '2026-11-05 12:19:55.020708', NULL, 0, 32, 324, 4, 3, NULL, '', 0),
(49, '2026-11-05 12:19:55.057933', NULL, '2026-11-05 12:19:55.057933', NULL, 0, 32, 324, 5, 3, NULL, '', 0),
(50, '2026-11-05 12:19:55.088075', NULL, '2026-11-05 12:19:55.088075', NULL, 0, 32, 324, 6, 3, NULL, '', 0),
(51, '2026-11-05 12:19:55.140023', NULL, '2026-11-05 12:19:55.140023', NULL, 0, 32, 325, 4, 3, NULL, '', 0),
(52, '2026-11-05 12:19:55.167812', NULL, '2026-11-05 12:19:55.167812', NULL, 0, 32, 325, 5, 3, NULL, '', 0),
(53, '2026-11-05 12:19:55.207859', NULL, '2026-11-05 12:19:55.207859', NULL, 0, 32, 325, 6, 3, NULL, '', 0),
(54, '2026-11-05 12:19:55.258912', NULL, '2026-11-05 12:19:55.258912', NULL, 0, 33, 3310, 4, 3, NULL, '', 0),
(55, '2026-11-05 12:19:55.307794', NULL, '2026-11-05 12:19:55.307794', NULL, 0, 33, 3310, 5, 3, NULL, '', 0),
(56, '2026-11-05 12:19:55.358126', NULL, '2026-11-05 12:19:55.358126', NULL, 0, 33, 3310, 6, 3, NULL, '', 0),
(57, '2026-11-05 12:19:55.388016', NULL, '2026-11-05 12:19:55.388016', NULL, 0, 33, 3311, 4, 3, NULL, '', 0),
(58, '2026-11-05 12:19:55.507815', NULL, '2026-11-05 12:19:55.507815', NULL, 0, 33, 3311, 5, 3, NULL, '', 0),
(59, '2026-11-05 12:19:55.567792', NULL, '2026-11-05 12:19:55.567792', NULL, 0, 33, 3311, 6, 3, NULL, '', 0),
(60, '2026-11-05 12:19:55.607891', NULL, '2026-11-05 12:19:55.607891', NULL, 0, 34, 349, 4, 3, NULL, '', 0),
(61, '2026-11-05 12:19:55.637749', NULL, '2026-11-05 12:19:55.637749', NULL, 0, 34, 349, 5, 3, NULL, '', 0),
(62, '2026-11-05 12:19:55.688043', NULL, '2026-11-05 12:19:55.688043', NULL, 0, 34, 349, 6, 3, NULL, '', 0),
(63, '2026-11-05 12:19:55.724058', NULL, '2026-11-05 12:19:55.724058', NULL, 0, 42, 421, 4, 4, NULL, '', 0),
(64, '2026-11-05 12:19:55.777909', NULL, '2026-11-05 12:19:55.777909', NULL, 0, 42, 421, 5, 4, NULL, '', 0),
(65, '2026-11-05 12:19:55.856634', NULL, '2026-11-05 12:19:55.856634', NULL, 0, 42, 421, 6, 4, NULL, '', 0),
(66, '2026-11-05 12:19:55.891083', NULL, '2026-11-05 12:19:55.891083', NULL, 0, 42, 422, 4, 4, NULL, '', 0),
(67, '2026-11-05 12:19:55.937896', NULL, '2026-11-05 12:19:55.937896', NULL, 0, 42, 422, 5, 4, NULL, '', 0),
(68, '2026-11-05 12:19:55.969923', NULL, '2026-11-05 12:19:55.969923', NULL, 0, 42, 422, 6, 4, NULL, '', 0),
(69, '2026-11-05 12:19:56.038887', NULL, '2026-11-05 12:19:56.038887', NULL, 0, 42, 423, 4, 4, NULL, '', 0),
(70, '2026-11-05 12:19:56.118101', NULL, '2026-11-05 12:19:56.118101', NULL, 0, 42, 423, 5, 4, NULL, '', 0),
(71, '2026-11-05 12:19:56.228970', NULL, '2026-11-05 12:19:56.228970', NULL, 0, 42, 423, 6, 4, NULL, '', 0),
(72, '2026-11-05 12:19:56.268102', NULL, '2026-11-05 12:19:56.268102', NULL, 0, 42, 424, 4, 4, NULL, '', 0),
(73, '2026-11-05 12:19:56.303220', NULL, '2026-11-05 12:19:56.303220', NULL, 0, 42, 424, 5, 4, NULL, '', 0),
(74, '2026-11-05 12:19:56.355427', NULL, '2026-11-05 12:19:56.355427', NULL, 0, 42, 424, 6, 4, NULL, '', 0),
(75, '2026-11-05 12:19:56.387780', NULL, '2026-11-05 12:19:56.387780', NULL, 0, 42, 425, 4, 4, NULL, '', 0),
(76, '2026-11-05 12:19:56.468015', NULL, '2026-11-05 12:19:56.468015', NULL, 0, 42, 425, 5, 4, NULL, '', 0),
(77, '2026-11-05 12:19:56.519828', NULL, '2026-11-05 12:19:56.519828', NULL, 0, 42, 425, 6, 4, NULL, '', 0),
(78, '2026-11-05 12:19:56.574485', NULL, '2026-11-05 12:19:56.574485', NULL, 0, 43, 4310, 4, 4, NULL, '', 0),
(79, '2026-11-05 12:19:56.607818', NULL, '2026-11-05 12:19:56.607818', NULL, 0, 43, 4310, 5, 4, NULL, '', 0),
(80, '2026-11-05 12:19:56.647969', NULL, '2026-11-05 12:19:56.647969', NULL, 0, 43, 4310, 6, 4, NULL, '', 0),
(81, '2026-11-05 12:19:56.677957', NULL, '2026-11-05 12:19:56.677957', NULL, 0, 43, 4311, 4, 4, NULL, '', 0),
(82, '2026-11-05 12:19:56.712763', NULL, '2026-11-05 12:19:56.712763', NULL, 0, 43, 4311, 5, 4, NULL, '', 0),
(83, '2026-11-05 12:19:56.780071', NULL, '2026-11-05 12:19:56.780071', NULL, 0, 43, 4311, 6, 4, NULL, '', 0),
(84, '2026-11-05 12:19:56.815834', NULL, '2026-11-05 12:19:56.815834', NULL, 0, 44, 449, 4, 4, NULL, '', 0),
(85, '2026-11-05 12:19:56.848324', NULL, '2026-11-05 12:19:56.848324', NULL, 0, 44, 449, 5, 4, NULL, '', 0),
(86, '2026-11-05 12:19:56.898993', NULL, '2026-11-05 12:19:56.898993', NULL, 0, 44, 449, 6, 4, NULL, '', 0),
(87, '2026-11-05 12:19:56.931939', NULL, '2026-11-05 12:19:56.931939', NULL, 0, 0, 0, 101, 5, NULL, '', 0),
(88, '2026-11-05 12:19:56.965216', NULL, '2026-11-05 12:19:56.965216', NULL, 0, 0, 0, 102, 5, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `base_eventalertsetting`
--

CREATE TABLE `base_eventalertsetting` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `event_id` int NOT NULL,
  `event` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `sub_module` varchar(50) NOT NULL,
  `email_alert` tinyint(1) NOT NULL,
  `app_alert` tinyint(1) NOT NULL,
  `sms_alert` tinyint(1) NOT NULL,
  `whatapp_alert` tinyint(1) NOT NULL,
  `facebook_alert` tinyint(1) NOT NULL,
  `lineapp_alert` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_eventalertsetting`
--

INSERT INTO `base_eventalertsetting` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `event_id`, `event`, `module`, `sub_module`, `email_alert`, `app_alert`, `sms_alert`, `whatapp_alert`, `facebook_alert`, `lineapp_alert`) VALUES
(1, '2026-11-05 12:19:57.005291', NULL, '2026-11-05 12:19:57.005291', NULL, 0, 1, 'menu_att_manualLog', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(2, '2026-11-05 12:19:57.068184', NULL, '2026-11-05 12:19:57.068184', NULL, 0, 2, 'menu_att_leave', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(3, '2026-11-05 12:19:57.107120', NULL, '2026-11-05 12:19:57.107120', NULL, 0, 3, 'menu_att_overtime', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(4, '2026-11-05 12:19:57.140129', NULL, '2026-11-05 12:19:57.141130', NULL, 0, 4, 'menu_att_training', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(5, '2026-11-05 12:19:57.173216', NULL, '2026-11-05 12:19:57.173216', NULL, 0, 5, 'menu_att_adjustSchedule', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(6, '2026-11-05 12:19:57.224454', NULL, '2026-11-05 12:19:57.224454', NULL, 0, 6, 'payCode.default.lateIn', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(7, '2026-11-05 12:19:57.258141', NULL, '2026-11-05 12:19:57.258141', NULL, 0, 7, 'payCode.default.earlyOut', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(8, '2026-11-05 12:19:57.307549', NULL, '2026-11-05 12:19:57.307549', NULL, 0, 8, 'payCode.default.absence', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(9, '2026-11-05 12:19:57.358096', NULL, '2026-11-05 12:19:57.358096', NULL, 0, 9, 'menu.visitor.registration', 'menu.visitor.registration.visitor', 'menu.visitor.reservation', 1, 0, 0, 0, 0, 0),
(10, '2026-11-05 12:19:57.398197', NULL, '2026-11-05 12:19:57.398197', NULL, 0, 10, 'meeting.menus.meeting', 'meeting.menus.meeting', 'meeting.menus.meeting', 1, 0, 0, 0, 0, 0),
(11, '2026-11-05 12:19:57.508062', NULL, '2026-11-05 12:19:57.508062', NULL, 0, 11, 'meeting.menus.manualLog', 'meeting.menus.meeting', 'meeting.menus.manualLog', 1, 0, 0, 0, 0, 0),
(12, '2026-11-05 12:19:57.557772', NULL, '2026-11-05 12:19:57.557772', NULL, 0, 12, 'menu_device_publicMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0, 0, 0),
(13, '2026-11-05 12:19:57.599441', NULL, '2026-11-05 12:19:57.599441', NULL, 0, 13, 'menu_device_privateMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0, 0, 0),
(14, '2026-11-05 12:19:57.633053', NULL, '2026-11-05 12:19:57.633053', NULL, 0, 14, 'transaction_punchState_checkIn', 'menu_device_terminal', 'menu_device_transaction', 0, 0, 0, 0, 0, 0),
(15, '2026-11-05 12:19:57.665951', NULL, '2026-11-05 12:19:57.665951', NULL, 0, 15, 'transaction_punchState_checkOut', 'menu_device_terminal', 'menu_device_transaction', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `base_linenotifyforemployee`
--

CREATE TABLE `base_linenotifyforemployee` (
  `id` int NOT NULL,
  `line_notify_token` varchar(200) DEFAULT NULL,
  `send_photo` tinyint(1) NOT NULL,
  `push_time` time(6) DEFAULT NULL,
  `is_valid` int DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `message_type` int DEFAULT NULL,
  `message_head` varchar(100) DEFAULT NULL,
  `message_tail` varchar(100) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_linenotifysetting`
--

CREATE TABLE `base_linenotifysetting` (
  `id` int NOT NULL,
  `include_sub_department` int DEFAULT NULL,
  `line_notify_token` varchar(200) DEFAULT NULL,
  `message_type` int DEFAULT NULL,
  `message_head` varchar(100) DEFAULT NULL,
  `message_tail` varchar(100) DEFAULT NULL,
  `push_time` time(6) DEFAULT NULL,
  `is_valid` int DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `line_notify_dept_id` int DEFAULT NULL,
  `send_photo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_messengersentlog`
--

CREATE TABLE `base_messengersentlog` (
  `id` bigint NOT NULL,
  `action` smallint NOT NULL,
  `targets` longtext,
  `targets_repr` longtext,
  `action_status` smallint NOT NULL,
  `description` longtext,
  `ip_address` char(39) DEFAULT NULL,
  `can_routable` tinyint(1) NOT NULL,
  `op_time` datetime(6) NOT NULL,
  `bot_uid` varchar(100) DEFAULT NULL,
  `content_type_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_reportoutputsetting`
--

CREATE TABLE `base_reportoutputsetting` (
  `id` int NOT NULL,
  `agreement_message_id` varchar(200) NOT NULL,
  `report_name` varchar(200) NOT NULL,
  `agreement_message` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_securitypolicy`
--

CREATE TABLE `base_securitypolicy` (
  `id` int NOT NULL,
  `single_login` tinyint(1) NOT NULL,
  `security_code` tinyint(1) NOT NULL,
  `code_length` int NOT NULL,
  `valid_duration` int NOT NULL,
  `failed_locked` tinyint(1) NOT NULL,
  `lock_failed_count` int NOT NULL,
  `lock_duration` int NOT NULL,
  `enforce_pwd_change` tinyint(1) NOT NULL,
  `enforce_pwd_expiration` tinyint(1) NOT NULL,
  `validity_period` int NOT NULL,
  `password_level` smallint NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `app_single_user_login` tinyint(1) NOT NULL,
  `session_timeout` int NOT NULL,
  `export_encryption` tinyint(1) NOT NULL,
  `export_encryption_password` varchar(128) DEFAULT NULL,
  `failed_times` int NOT NULL,
  `backup_encryption` tinyint(1) NOT NULL,
  `backup_encryption_password` varchar(128) DEFAULT NULL,
  `reset_password_frequency` smallint NOT NULL,
  `reset_password_validity` smallint NOT NULL,
  `fp_login` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_securitypolicy`
--

INSERT INTO `base_securitypolicy` (`id`, `single_login`, `security_code`, `code_length`, `valid_duration`, `failed_locked`, `lock_failed_count`, `lock_duration`, `enforce_pwd_change`, `enforce_pwd_expiration`, `validity_period`, `password_level`, `is_default`, `app_single_user_login`, `session_timeout`, `export_encryption`, `export_encryption_password`, `failed_times`, `backup_encryption`, `backup_encryption_password`, `reset_password_frequency`, `reset_password_validity`, `fp_login`) VALUES
(1, 0, 0, 5, 1, 0, 5, 60, 0, 0, 90, 2, 1, 0, 60, 1, NULL, 0, 1, NULL, 120, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `base_sendemail`
--

CREATE TABLE `base_sendemail` (
  `id` int NOT NULL,
  `purpose` int NOT NULL,
  `email_to` longtext NOT NULL,
  `email_cc` longtext,
  `email_bcc` longtext,
  `email_subject` varchar(40) NOT NULL,
  `email_content` longtext,
  `send_time` datetime(6) DEFAULT NULL,
  `send_status` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_sftpsetting`
--

CREATE TABLE `base_sftpsetting` (
  `id` int NOT NULL,
  `host` varchar(39) NOT NULL,
  `port` int NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(128) DEFAULT NULL,
  `user_key` longtext,
  `is_sftp` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_sysparam`
--

CREATE TABLE `base_sysparam` (
  `id` int NOT NULL,
  `para_name` varchar(30) NOT NULL,
  `para_type` varchar(10) DEFAULT NULL,
  `para_value` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_sysparam`
--

INSERT INTO `base_sysparam` (`id`, `para_name`, `para_type`, `para_value`) VALUES
(1, 'rule_id', 'rule_0', '0'),
(2, 'dept_id', 'rule_0', '0'),
(3, 'apply_name', 'rule_0', 'All'),
(4, 'rule_name', 'rule_0', 'Default Attendance Rules'),
(5, 'minutes_early', 'rule_0', '0'),
(6, 'minutes_late', 'rule_0', '0'),
(7, 'minutes_no_break_in', 'rule_0', '60'),
(8, 'minutes_no_break_out', 'rule_0', '60'),
(9, 'minutes_no_in', 'rule_0', '60'),
(10, 'minutes_no_leave', 'rule_0', '60'),
(11, 'minutes_not_over_time', 'rule_0', '60'),
(12, 'minutes_work_day', 'rule_0', '480'),
(13, 'no_break_in', 'rule_0', '1012'),
(14, 'no_break_out', 'rule_0', '1012'),
(15, 'no_in', 'rule_0', '1001'),
(16, 'no_leave', 'rule_0', '1002'),
(17, 'out_over_time', 'rule_0', '0'),
(18, 'two_day', 'rule_0', '0'),
(19, 'check_in_color', 'rule_0', '16777151'),
(20, 'check_out_color', 'rule_0', '12910591'),
(21, 'db_version', '', '2002'),
(22, 'installdate', '', '43b8CrJ1PHb6V2JjAxlxfa3gcxNqixJr1DN-Okctlspo80mIT3ap'),
(23, 'sys_date', '', '43b8CrJ1PHb6V2JjAxlxfa3gcxNqixJr1DN-Okctlspo80mIT3ap'),
(24, 'ADMSDBVersion', '', '544');

-- --------------------------------------------------------

--
-- Table structure for table `base_sysparamdept`
--

CREATE TABLE `base_sysparamdept` (
  `id` int NOT NULL,
  `rule_name` varchar(40) NOT NULL,
  `dept_id` int NOT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `op_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_systemlog`
--

CREATE TABLE `base_systemlog` (
  `id` int NOT NULL,
  `execute_time` datetime(6) NOT NULL,
  `operation` smallint NOT NULL,
  `execute_status` smallint NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_systemsetting`
--

CREATE TABLE `base_systemsetting` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_zoomsetting`
--

CREATE TABLE `base_zoomsetting` (
  `id` int NOT NULL,
  `jwt_token` varchar(512) NOT NULL,
  `zoom_user_email` varchar(128) NOT NULL,
  `zoom_enable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL,
  `clocked_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictask`
--

CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int UNSIGNED NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int UNSIGNED DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int UNSIGNED DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictasks`
--

CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_solarschedule`
--

CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(147, 'acc', 'acccombination'),
(146, 'acc', 'accgroups'),
(145, 'acc', 'accholiday'),
(148, 'acc', 'accprivilege'),
(149, 'acc', 'accterminal'),
(144, 'acc', 'acctimezone'),
(214, 'accounts', 'adminbiodata'),
(29, 'accounts', 'myuser'),
(216, 'accounts', 'passwordresetkey'),
(46, 'accounts', 'usernotification'),
(215, 'accounts', 'userprofile'),
(166, 'admin', 'logentry'),
(20, 'att', 'att_configurations_permission'),
(19, 'att', 'att_setting_permission'),
(18, 'att', 'att_user_guide_permission'),
(193, 'att', 'attcalclog'),
(79, 'att', 'attcode'),
(4, 'att', 'attconfigurationspermission'),
(194, 'att', 'attemployee'),
(80, 'att', 'attgroup'),
(81, 'att', 'attpolicy'),
(100, 'att', 'attreportsetting'),
(84, 'att', 'attrule'),
(89, 'att', 'attschedule'),
(2, 'att', 'attsettingpermission'),
(88, 'att', 'attshift'),
(7, 'att', 'attuserguidepermission'),
(96, 'att', 'breaktime'),
(211, 'att', 'calculatelastdate'),
(212, 'att', 'calculatetask'),
(97, 'att', 'changeschedule'),
(82, 'att', 'departmentpolicy'),
(98, 'att', 'departmentschedule'),
(95, 'att', 'deptattrule'),
(83, 'att', 'grouppolicy'),
(99, 'att', 'groupschedule'),
(94, 'att', 'holiday'),
(91, 'att', 'leave'),
(101, 'att', 'leavegroup'),
(102, 'att', 'leavegroupdetail'),
(103, 'att', 'leaveyearbalance'),
(86, 'att', 'manuallog'),
(93, 'att', 'overtime'),
(195, 'att', 'overtimepolicy'),
(78, 'att', 'paycode'),
(196, 'att', 'payloadattcode'),
(197, 'att', 'payloadbase'),
(198, 'att', 'payloadbreak'),
(199, 'att', 'payloadeffectpunch'),
(200, 'att', 'payloadexception'),
(201, 'att', 'payloadmulpunchset'),
(202, 'att', 'payloadovertime'),
(203, 'att', 'payloadparing'),
(204, 'att', 'payloadpaycode'),
(205, 'att', 'payloadpunch'),
(206, 'att', 'payloadtimecard'),
(213, 'att', 'payloadworkcodeparing'),
(16, 'att', 'report_permission'),
(85, 'att', 'reportparam'),
(3, 'att', 'reportpermission'),
(207, 'att', 'reporttemplate'),
(15, 'att', 'schedule_view_permission'),
(5, 'att', 'scheduleviewpermission'),
(208, 'att', 'shiftdetail'),
(17, 'att', 'staff_report_permission'),
(6, 'att', 'staffreportpermission'),
(90, 'att', 'temporaryschedule'),
(209, 'att', 'tempschedule'),
(87, 'att', 'timeinterval'),
(92, 'att', 'training'),
(210, 'att', 'webpunch'),
(11, 'auth', 'group'),
(1, 'auth', 'permission'),
(168, 'authtoken', 'token'),
(169, 'authtoken', 'tokenproxy'),
(8, 'base', 'abstractpermission'),
(27, 'base', 'adminlog'),
(176, 'base', 'attparam'),
(177, 'base', 'attparamdepts'),
(30, 'base', 'autoattexporttask'),
(31, 'base', 'autoexporttask'),
(32, 'base', 'autoimporttask'),
(33, 'base', 'bookmark'),
(34, 'base', 'dbbackuplog'),
(35, 'base', 'emailtemplate'),
(36, 'base', 'eventalertsetting'),
(37, 'base', 'linenotifyforemployee'),
(38, 'base', 'linenotifysetting'),
(47, 'base', 'messengersentlog'),
(49, 'base', 'reportoutputsetting'),
(43, 'base', 'securitypolicy'),
(178, 'base', 'sendemail'),
(44, 'base', 'sftpsetting'),
(42, 'base', 'syncarea'),
(39, 'base', 'syncdepartment'),
(41, 'base', 'syncemployee'),
(40, 'base', 'syncjob'),
(179, 'base', 'sysparam'),
(180, 'base', 'sysparamdept'),
(12, 'base', 'system_setting_permission'),
(45, 'base', 'systemlog'),
(181, 'base', 'systemsetting'),
(9, 'base', 'systemsettingpermission'),
(48, 'base', 'zoomsetting'),
(75, 'contenttypes', 'contenttype'),
(175, 'django_celery_beat', 'clockedschedule'),
(170, 'django_celery_beat', 'crontabschedule'),
(171, 'django_celery_beat', 'intervalschedule'),
(172, 'django_celery_beat', 'periodictask'),
(173, 'django_celery_beat', 'periodictasks'),
(174, 'django_celery_beat', 'solarschedule'),
(25, 'ep', 'ep_dashboard_permission'),
(26, 'ep', 'ep_report_permission'),
(226, 'ep', 'epdashboardpermission'),
(227, 'ep', 'epreportpermission'),
(164, 'ep', 'epsetup'),
(165, 'ep', 'eptransaction'),
(65, 'iclock', 'biodata'),
(70, 'iclock', 'biophoto'),
(13, 'iclock', 'device_setting_permission'),
(72, 'iclock', 'deviceemployee'),
(69, 'iclock', 'devicemoduleconfig'),
(185, 'iclock', 'devicesettingpermission'),
(71, 'iclock', 'errorcommandlog'),
(66, 'iclock', 'privatemessage'),
(67, 'iclock', 'publicmessage'),
(182, 'iclock', 'shortmessage'),
(59, 'iclock', 'terminal'),
(63, 'iclock', 'terminalcommand'),
(64, 'iclock', 'terminalcommandlog'),
(183, 'iclock', 'terminalemployee'),
(61, 'iclock', 'terminallog'),
(73, 'iclock', 'terminalparameter'),
(62, 'iclock', 'terminaluploadlog'),
(68, 'iclock', 'terminalworkcode'),
(60, 'iclock', 'transaction'),
(184, 'iclock', 'transactionproofcmd'),
(24, 'meeting', 'meeting_report_permission'),
(161, 'meeting', 'meetingentity'),
(162, 'meeting', 'meetingmanuallog'),
(224, 'meeting', 'meetingpayloadbase'),
(225, 'meeting', 'meetingreportpermission'),
(159, 'meeting', 'meetingroom'),
(160, 'meeting', 'meetingroomdevice'),
(163, 'meeting', 'meetingtransaction'),
(120, 'mobile', 'announcement'),
(123, 'mobile', 'appactionlog'),
(121, 'mobile', 'applist'),
(122, 'mobile', 'appnotification'),
(125, 'mobile', 'gpsfordepartment'),
(124, 'mobile', 'gpsforemployee'),
(126, 'mobile', 'gpslocation'),
(127, 'mobile', 'mobileapirequestlog'),
(129, 'payroll', 'deductionformula'),
(143, 'payroll', 'empexpenseexemption'),
(134, 'payroll', 'emploan'),
(128, 'payroll', 'emppayrollprofile'),
(130, 'payroll', 'exceptionformula'),
(139, 'payroll', 'extradeduction'),
(138, 'payroll', 'extraincrease'),
(131, 'payroll', 'increasementformula'),
(132, 'payroll', 'leaveformula'),
(133, 'payroll', 'overtimeformula'),
(21, 'payroll', 'payroll_report_permission'),
(23, 'payroll', 'payroll_setting_permission'),
(218, 'payroll', 'payrollpayload'),
(223, 'payroll', 'payrollpayloadexpenseexemption'),
(219, 'payroll', 'payrollpayloadpaycode'),
(220, 'payroll', 'payrollreportpermission'),
(222, 'payroll', 'payrollsettingpermission'),
(135, 'payroll', 'reimbursement'),
(136, 'payroll', 'salaryadvance'),
(137, 'payroll', 'salarystructure'),
(140, 'payroll', 'socialsecuritydeduction'),
(142, 'payroll', 'specialpayment'),
(22, 'payroll', 'staff_payroll_report_permission'),
(221, 'payroll', 'staffpayrollreportpermission'),
(141, 'payroll', 'taxdeduction'),
(51, 'personnel', 'area'),
(186, 'personnel', 'assignareaemployee'),
(52, 'personnel', 'certification'),
(50, 'personnel', 'company'),
(53, 'personnel', 'department'),
(54, 'personnel', 'employee'),
(189, 'personnel', 'employeecalendar'),
(57, 'personnel', 'employeecertification'),
(58, 'personnel', 'employeecustomattribute'),
(190, 'personnel', 'employeeextrainfo'),
(187, 'personnel', 'employeeprofile'),
(188, 'personnel', 'employment'),
(14, 'personnel', 'personnel_setting_permission'),
(10, 'personnel', 'personnelsettingpermission'),
(55, 'personnel', 'position'),
(56, 'personnel', 'resign'),
(28, 'rest_framework_tracking', 'apirequestlog'),
(167, 'sessions', 'session'),
(113, 'staff', 'approvalchangeschedule'),
(109, 'staff', 'approvalleave'),
(111, 'staff', 'approvalmanuallog'),
(110, 'staff', 'approvalovertime'),
(112, 'staff', 'approvaltraining'),
(108, 'staff', 'pendingchangeschedule'),
(104, 'staff', 'pendingleave'),
(106, 'staff', 'pendingmanuallog'),
(105, 'staff', 'pendingovertime'),
(107, 'staff', 'pendingtraining'),
(217, 'staff', 'stafftoken'),
(118, 'staff_meeting', 'approvalmeetingentity'),
(119, 'staff_meeting', 'approvalmeetingmanuallog'),
(116, 'staff_meeting', 'pendingmeetingentity'),
(117, 'staff_meeting', 'pendingmeetingmanuallog'),
(115, 'staff_visitor', 'approvalreservation'),
(114, 'staff_visitor', 'pendingreservation'),
(152, 'visitor', 'reason'),
(151, 'visitor', 'reservation'),
(150, 'visitor', 'visitor'),
(156, 'visitor', 'visitorbiodata'),
(155, 'visitor', 'visitorbiophoto'),
(158, 'visitor', 'visitorcertification'),
(154, 'visitor', 'visitorconfig'),
(153, 'visitor', 'visitorlog'),
(157, 'visitor', 'visitortransaction'),
(191, 'workflow', 'nodeinstance'),
(76, 'workflow', 'workflowengine'),
(192, 'workflow', 'workflowinstance'),
(77, 'workflow', 'workflownode'),
(74, 'workflow', 'workflowrole');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'personnel', '0001_initial', '2026-11-05 12:12:28.438037'),
(2, 'contenttypes', '0001_initial', '2026-11-05 12:12:28.937868'),
(3, 'contenttypes', '0002_remove_content_type_name', '2026-11-05 12:12:29.777616'),
(4, 'workflow', '0001_initial', '2026-11-05 12:12:44.827985'),
(5, 'iclock', '0001_initial', '2026-11-05 12:12:50.408027'),
(6, 'auth', '0001_initial', '2026-11-05 12:12:54.035347'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-11-05 12:12:54.687602'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-11-05 12:12:54.747912'),
(9, 'auth', '0004_alter_user_username_opts', '2026-11-05 12:12:54.807955'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-11-05 12:12:54.867911'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-11-05 12:12:54.908058'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-11-05 12:12:54.950101'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-11-05 12:12:55.017819'),
(14, 'base', '0001_initial', '2026-11-05 12:13:01.037794'),
(15, 'accounts', '0001_initial', '2026-11-05 12:13:04.247880'),
(16, 'base', '0002_auto_20200901_1642', '2026-11-05 12:13:09.027957'),
(17, 'att', '0001_initial', '2026-11-05 12:13:11.562962'),
(18, 'att', '0002_auto_20200901_1642', '2026-11-05 12:14:05.565077'),
(19, 'personnel', '0002_auto_20200901_1642', '2026-11-05 12:14:18.207672'),
(20, 'acc', '0001_initial', '2026-11-05 12:14:19.970266'),
(21, 'acc', '0002_auto_20200901_1642', '2026-11-05 12:14:26.009768'),
(22, 'acc', '0003_auto_20200901_1642', '2026-11-05 12:14:31.086798'),
(23, 'acc', '0004_auto_20210721_1158', '2026-11-05 12:14:31.487997'),
(24, 'acc', '0005_auto_20210908_1006', '2026-11-05 12:14:31.577700'),
(25, 'personnel', '0003_auto_20201229_0852', '2026-11-05 12:14:34.140608'),
(26, 'personnel', '0004_auto_20210908_1006', '2026-11-05 12:14:39.567812'),
(27, 'base', '0003_auto_20201229_0852', '2026-11-05 12:14:42.445056'),
(28, 'base', '0004_auto_20210908_1006', '2026-11-05 12:14:47.657872'),
(29, 'base', '0005_auto_20211201_1434', '2026-11-05 12:14:48.147667'),
(30, 'personnel', '0005_auto_20211201_1434', '2026-11-05 12:14:52.227665'),
(31, 'personnel', '0006_auto_20211201_1516', '2026-11-05 12:14:52.384070'),
(32, 'personnel', '0007_auto_20211201_1602', '2026-11-05 12:14:59.027793'),
(33, 'personnel', '0008_auto_20220106_1103', '2026-11-05 12:15:00.087774'),
(34, 'personnel', '0009_auto_20220419_1516', '2026-11-05 12:15:00.710699'),
(35, 'personnel', '0010_auto_20221202_1852', '2026-11-05 12:15:00.825772'),
(36, 'personnel', '0011_auto_20230223_1026', '2026-11-05 12:15:05.687891'),
(37, 'personnel', '0012_901_attr_type_change', '2026-11-05 12:15:05.800258'),
(38, 'personnel', '0013_alter_area_area_name_alter_certification_cert_name_and_more', '2026-11-05 12:15:11.265723'),
(39, 'accounts', '0002_auto_20200901_1642', '2026-11-05 12:15:19.267696'),
(40, 'accounts', '0003_auto_20201021_1551', '2026-11-05 12:15:19.467837'),
(41, 'accounts', '0004_auto_20201229_0852', '2026-11-05 12:15:19.855571'),
(42, 'accounts', '0005_auto_20210908_1006', '2026-11-05 12:15:19.897843'),
(43, 'accounts', '0006_myuser_assign_company', '2026-11-05 12:15:20.172972'),
(44, 'accounts', '0007_auto_20220106_1103', '2026-11-05 12:15:20.228079'),
(45, 'accounts', '0008_auto_20230223_1026', '2026-11-05 12:15:20.317942'),
(46, 'accounts', '0009_userprofile_employee_fields', '2026-11-05 12:15:21.159955'),
(47, 'accounts', '0010_901_notification_category', '2026-11-05 12:15:21.227938'),
(48, 'accounts', '0011_903_emoloyee_noticifation', '2026-11-05 12:15:24.318212'),
(49, 'accounts', '0012_auto_20241212_20114', '2026-11-05 12:15:24.540616'),
(50, 'accounts', '0013_auto_20250103_20141', '2026-11-05 12:15:24.848113'),
(51, 'admin', '0001_initial', '2026-11-05 12:15:26.717168'),
(52, 'admin', '0002_logentry_remove_auto_add', '2026-11-05 12:15:26.787860'),
(53, 'admin', '0003_logentry_add_action_flag_choices', '2026-11-05 12:15:26.846859'),
(54, 'base', '0006_autoimporttask_company', '2026-11-05 12:15:27.915674'),
(55, 'base', '0007_auto_20221202_1852', '2026-11-05 12:15:27.961846'),
(56, 'att', '0003_auto_20200909_1810', '2026-11-05 12:15:28.343742'),
(57, 'att', '0004_auto_20201021_1551', '2026-11-05 12:15:28.818099'),
(58, 'att', '0005_auto_20201106_1538', '2026-11-05 12:15:29.589870'),
(59, 'att', '0006_auto_20201116_1052', '2026-11-05 12:15:29.639800'),
(60, 'att', '0007_auto_20201229_0852', '2026-11-05 12:15:40.793885'),
(61, 'att', '0008_auto_20210908_1006', '2026-11-05 12:15:55.904199'),
(62, 'att', '0009_reporttemplate_employee', '2026-11-05 12:15:56.972915'),
(63, 'att', '0010_auto_20220106_1103', '2026-11-05 12:15:59.908115'),
(64, 'att', '0011_auto_20220118_1536', '2026-11-05 12:16:00.159092'),
(65, 'att', '0012_auto_20220419_1516', '2026-11-05 12:16:00.623357'),
(66, 'att', '0013_auto_20221202_1852', '2026-11-05 12:16:00.907911'),
(67, 'att', '0014_auto_20230223_1026', '2026-11-05 12:16:11.761904'),
(68, 'att', '0015_alter_holiday_end_date', '2026-11-05 12:16:11.842084'),
(69, 'att', '0016_903_calculate_workcode', '2026-11-05 12:16:15.477849'),
(70, 'att', '0017_pro_903_2024090600', '2026-11-05 12:16:15.559319'),
(71, 'att', '0018_auto_20250214_20236', '2026-11-05 12:16:15.655674'),
(72, 'auth', '0009_alter_user_last_name_max_length', '2026-11-05 12:16:15.781417'),
(73, 'auth', '0010_alter_group_name_max_length', '2026-11-05 12:16:16.071934'),
(74, 'auth', '0011_update_proxy_permissions', '2026-11-05 12:16:16.602465'),
(75, 'auth', '0012_alter_user_first_name_max_length', '2026-11-05 12:16:16.729671'),
(76, 'authtoken', '0001_initial', '2026-11-05 12:16:19.108019'),
(77, 'authtoken', '0002_auto_20160226_1747', '2026-11-05 12:16:19.297697'),
(78, 'authtoken', '0003_tokenproxy', '2026-11-05 12:16:19.377738'),
(79, 'base', '0008_auto_20230223_1026', '2026-11-05 12:16:22.853823'),
(80, 'base', '0009_auto_20230411_1415', '2026-11-05 12:16:23.517867'),
(81, 'base', '0010_901_zoomsetting', '2026-11-05 12:16:23.881350'),
(82, 'base', '0011_901_backup_db_encrypt', '2026-11-05 12:16:24.258169'),
(83, 'base', '0012_linenotifysetting_send_photo_linenotifyforemployee', '2026-11-05 12:16:25.637625'),
(84, 'base', '0013_alter_syncarea_area_name_and_more', '2026-11-05 12:16:29.467836'),
(85, 'base', '0014_eventalertsetting_lineapp_alert', '2026-11-05 12:16:29.817864'),
(86, 'base', '0015_auto_20241212_20114', '2026-11-05 12:16:30.528110'),
(87, 'base', '0015_pro_903_2024090600', '2026-11-05 12:16:30.987741'),
(88, 'base', '0016_v904', '2026-11-05 12:16:31.278147'),
(89, 'django_celery_beat', '0001_initial', '2026-11-05 12:16:34.193569'),
(90, 'django_celery_beat', '0002_auto_20161118_0346', '2026-11-05 12:16:35.469430'),
(91, 'django_celery_beat', '0003_auto_20161209_0049', '2026-11-05 12:16:35.647888'),
(92, 'django_celery_beat', '0004_auto_20170221_0000', '2026-11-05 12:16:35.694292'),
(93, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2026-11-05 12:16:35.737903'),
(94, 'django_celery_beat', '0006_auto_20180322_0932', '2026-11-05 12:16:36.308126'),
(95, 'django_celery_beat', '0007_auto_20180521_0826', '2026-11-05 12:16:36.741777'),
(96, 'django_celery_beat', '0008_auto_20180914_1922', '2026-11-05 12:16:36.798806'),
(97, 'django_celery_beat', '0006_auto_20180210_1226', '2026-11-05 12:16:36.847821'),
(98, 'django_celery_beat', '0006_periodictask_priority', '2026-11-05 12:16:37.937722'),
(99, 'django_celery_beat', '0009_periodictask_headers', '2026-11-05 12:16:39.187899'),
(100, 'django_celery_beat', '0010_auto_20190429_0326', '2026-11-05 12:16:39.435986'),
(101, 'django_celery_beat', '0011_auto_20190508_0153', '2026-11-05 12:16:40.856179'),
(102, 'django_celery_beat', '0012_periodictask_expire_seconds', '2026-11-05 12:16:41.897996'),
(103, 'django_celery_beat', '0013_auto_20200609_0727', '2026-11-05 12:16:41.947996'),
(104, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2026-11-05 12:16:42.157668'),
(105, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2026-11-05 12:16:42.207664'),
(106, 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2026-11-05 12:16:42.257660'),
(107, 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2026-11-05 12:16:42.320044'),
(108, 'django_celery_beat', '0018_improve_crontab_helptext', '2026-11-05 12:16:42.497670'),
(109, 'visitor', '0001_initial', '2026-11-05 12:16:42.797956'),
(110, 'visitor', '0002_reservation_visitor_visitorconfig_visitorlog', '2026-11-05 12:16:56.667928'),
(111, 'iclock', '0002_auto_20200901_1642', '2026-11-05 12:17:12.225686'),
(112, 'ep', '0001_initial', '2026-11-05 12:17:14.847819'),
(113, 'ep', '0002_auto_20201217_1608', '2026-11-05 12:17:15.817897'),
(114, 'ep', '0003_auto_20201229_0852', '2026-11-05 12:17:15.858117'),
(115, 'iclock', '0003_auto_20201229_0852', '2026-11-05 12:17:17.482774'),
(116, 'iclock', '0004_auto_20210908_1006', '2026-11-05 12:17:21.962888'),
(117, 'iclock', '0005_terminalworkcode_company', '2026-11-05 12:17:22.900764'),
(118, 'iclock', '0006_auto_20220419_1516', '2026-11-05 12:17:23.660350'),
(119, 'iclock', '0007_auto_20221202_1852', '2026-11-05 12:17:23.857972'),
(120, 'iclock', '0008_auto_20230223_1026', '2026-11-05 12:17:23.917931'),
(121, 'iclock', '0009_auto_20230411_1415', '2026-11-05 12:17:25.387764'),
(122, 'iclock', '0010_901_push_version_width', '2026-11-05 12:17:25.849509'),
(123, 'iclock', '0012_alter_biophoto_first_name_alter_biophoto_last_name_and_more', '2026-11-05 12:17:28.842773'),
(124, 'iclock', '903_workcode_add_paycode', '2026-11-05 12:17:29.827956'),
(125, 'meeting', '0001_initial', '2026-11-05 12:17:47.871326'),
(126, 'meeting', '0002_meetingroom_enable_room', '2026-11-05 12:17:48.207744'),
(127, 'meeting', '0003_auto_20210908_1006', '2026-11-05 12:17:56.217974'),
(128, 'meeting', '0004_901_meetingzoom', '2026-11-05 12:17:57.486802'),
(129, 'mobile', '0001_initial', '2026-11-05 12:17:59.846780'),
(130, 'mobile', '0002_auto_20200901_1642', '2026-11-05 12:18:09.350098'),
(131, 'mobile', '0003_auto_20201229_0852', '2026-11-05 12:18:15.954410'),
(132, 'mobile', '0004_mobileapirequestlog', '2026-11-05 12:18:18.111510'),
(133, 'mobile', '0005_location_field_type_903', '2026-11-05 12:18:19.653668'),
(134, 'payroll', '0001_initial', '2026-11-05 12:18:26.062980'),
(135, 'payroll', '0002_auto_20200901_1642', '2026-11-05 12:18:39.307792'),
(136, 'payroll', '0003_auto_20200901_1642', '2026-11-05 12:18:48.842954'),
(137, 'payroll', '0004_auto_20210908_1006', '2026-11-05 12:18:49.222551'),
(138, 'payroll', '0005_auto_20221202_1852', '2026-11-05 12:18:49.307933'),
(139, 'payroll', '0006_901_salary_th', '2026-11-05 12:18:55.819859'),
(140, 'payroll', '0007_extradeduction_special_type_and_more', '2026-11-05 12:18:57.727807'),
(141, 'payroll', '0008_pro_903_2024090600', '2026-11-05 12:18:58.657912'),
(142, 'personnel', '0014_auto_20241212_20114', '2026-11-05 12:18:59.178029'),
(143, 'personnel', '0015_auto_20250102_20141', '2026-11-05 12:18:59.339429'),
(144, 'personnel', '0016_pro_903_2024090600', '2026-11-05 12:19:04.347848'),
(145, 'rest_framework_tracking', '0001_initial', '2026-11-05 12:19:05.917873'),
(146, 'rest_framework_tracking', '0002_auto_20170118_1713', '2026-11-05 12:19:06.800350'),
(147, 'rest_framework_tracking', '0003_add_errors', '2026-11-05 12:19:07.118906'),
(148, 'rest_framework_tracking', '0004_add_verbose_name', '2026-11-05 12:19:07.229696'),
(149, 'rest_framework_tracking', '0005_auto_20171219_1537', '2026-11-05 12:19:07.507963'),
(150, 'rest_framework_tracking', '0006_view_and_view_method_nullable', '2026-11-05 12:19:11.937947'),
(151, 'rest_framework_tracking', '0006_auto_20180315_1442', '2026-11-05 12:19:12.098269'),
(152, 'rest_framework_tracking', '0007_merge_20180419_1646', '2026-11-05 12:19:12.147854'),
(153, 'rest_framework_tracking', '0008_auto_20200201_2048', '2026-11-05 12:19:12.581845'),
(154, 'rest_framework_tracking', '0009_view_method_max_length_200', '2026-11-05 12:19:13.915862'),
(155, 'rest_framework_tracking', '0010_auto_20200609_1404', '2026-11-05 12:19:14.038109'),
(156, 'rest_framework_tracking', '0011_auto_20201117_2016', '2026-11-05 12:19:14.387943'),
(157, 'sessions', '0001_initial', '2026-11-05 12:19:14.838163'),
(158, 'staff', '0001_initial', '2026-11-05 12:19:15.907903'),
(159, 'staff', '0002_approvalchangeschedule_approvalleave_approvalmanuallog_approvalovertime_approvaltraining_pendingchan', '2026-11-05 12:19:15.988143'),
(160, 'staff_meeting', '0001_initial', '2026-11-05 12:19:16.051219'),
(161, 'visitor', '0003_reservation_email', '2026-11-05 12:19:16.359740'),
(162, 'visitor', '0004_auto_20210908_1006', '2026-11-05 12:19:21.600087'),
(163, 'visitor', '0005_auto_20211201_1434', '2026-11-05 12:19:21.676704'),
(164, 'staff_visitor', '0001_initial', '2026-11-05 12:19:21.727964'),
(165, 'visitor', '0006_auto_20220419_1516', '2026-11-05 12:19:22.652988'),
(166, 'visitor', '0007_auto_20221202_1852', '2026-11-05 12:19:22.728119'),
(167, 'visitor', '0008_auto_20230411_1415', '2026-11-05 12:19:23.612871'),
(168, 'visitor', '0009_alter_visitorbiophoto_first_name_and_more', '2026-11-05 12:19:25.178246'),
(169, 'visitor', '0010_alter_bio_type_903', '2026-11-05 12:19:25.239907'),
(170, 'visitor', '0011_pro_903_2024090900', '2026-11-05 12:19:29.397950'),
(171, 'workflow', '0002_auto_20211201_1434', '2026-11-05 12:19:29.537856'),
(172, 'workflow', '0003_auto_20221202_1852', '2026-11-05 12:19:29.638037'),
(173, 'workflow', '0004_auto_20230223_1026', '2026-11-05 12:19:31.858177'),
(174, 'workflow', '0005_auto_20230411_1415', '2026-11-05 12:19:36.902329');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ep_epsetup`
--

CREATE TABLE `ep_epsetup` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `temp_alarm` tinyint(1) NOT NULL,
  `temp_warning` decimal(4,1) NOT NULL,
  `temp_warning_F` decimal(4,1) DEFAULT NULL,
  `temp_unit` smallint NOT NULL,
  `mask_alarm` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ep_epsetup`
--

INSERT INTO `ep_epsetup` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `temp_alarm`, `temp_warning`, `temp_warning_F`, `temp_unit`, `mask_alarm`, `is_default`) VALUES
(1, '2026-11-05 12:20:16.393031', NULL, '2026-11-05 12:20:16.393031', NULL, 0, 1, 37.3, 99.2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ep_eptransaction`
--

CREATE TABLE `ep_eptransaction` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `area` varchar(30) NOT NULL,
  `check_datetime` datetime(6) DEFAULT NULL,
  `check_date` date NOT NULL,
  `check_time` time(6) NOT NULL,
  `temperature` decimal(4,1) NOT NULL,
  `is_mask` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `source` smallint NOT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `emp_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_biodata`
--

CREATE TABLE `iclock_biodata` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) NOT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` int NOT NULL,
  `duress` int NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_biophoto`
--

CREATE TABLE `iclock_biophoto` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `enroll_sn` varchar(50) DEFAULT NULL,
  `register_photo` varchar(100) NOT NULL,
  `register_time` datetime(6) NOT NULL,
  `approval_photo` varchar(100) DEFAULT NULL,
  `approval_state` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_devicemoduleconfig`
--

CREATE TABLE `iclock_devicemoduleconfig` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `enable_registration` tinyint(1) NOT NULL,
  `enable_resigned_filter` tinyint(1) NOT NULL,
  `enable_auto_add` tinyint(1) NOT NULL,
  `enable_name_upload` tinyint(1) NOT NULL,
  `enable_name_download` tinyint(1) NOT NULL,
  `enable_card_upload` tinyint(1) NOT NULL,
  `encryption` tinyint(1) NOT NULL,
  `timezone` smallint NOT NULL,
  `global_setup` tinyint(1) NOT NULL,
  `heartbeat` int NOT NULL,
  `transfer_mode` smallint NOT NULL,
  `transfer_interval` int NOT NULL,
  `transfer_time` varchar(100) NOT NULL,
  `transaction_retention` int NOT NULL,
  `command_retention` int NOT NULL,
  `dev_log_retention` int NOT NULL,
  `upload_log_retention` int NOT NULL,
  `edit_policy` smallint NOT NULL,
  `import_policy` smallint NOT NULL,
  `mobile_policy` smallint NOT NULL,
  `device_policy` smallint NOT NULL,
  `api_policy` smallint NOT NULL,
  `sync_mode` smallint NOT NULL,
  `sync_time` varchar(100) NOT NULL,
  `visitor_policy` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `iclock_devicemoduleconfig`
--

INSERT INTO `iclock_devicemoduleconfig` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `enable_registration`, `enable_resigned_filter`, `enable_auto_add`, `enable_name_upload`, `enable_name_download`, `enable_card_upload`, `encryption`, `timezone`, `global_setup`, `heartbeat`, `transfer_mode`, `transfer_interval`, `transfer_time`, `transaction_retention`, `command_retention`, `dev_log_retention`, `upload_log_retention`, `edit_policy`, `import_policy`, `mobile_policy`, `device_policy`, `api_policy`, `sync_mode`, `sync_time`, `visitor_policy`) VALUES
(1, '2026-11-05 12:20:00.108560', NULL, '2026-11-05 12:20:00.108560', NULL, 0, 0, 0, 1, 1, 1, 1, 1, 8, 0, 10, 1, 1, '00:00;14:05', 9999, 9999, 9999, 9999, 0, 0, 0, 3, 3, 1, '00:00;12:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `iclock_errorcommandlog`
--

CREATE TABLE `iclock_errorcommandlog` (
  `id` int NOT NULL,
  `error_code` varchar(16) DEFAULT NULL,
  `error_msg` varchar(50) DEFAULT NULL,
  `data_origin` longtext,
  `cmd` varchar(50) DEFAULT NULL,
  `additional` longtext,
  `upload_time` datetime(6) NOT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_privatemessage`
--

CREATE TABLE `iclock_privatemessage` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `last_send` datetime(6) DEFAULT NULL,
  `employee_id` int NOT NULL,
  `message_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_publicmessage`
--

CREATE TABLE `iclock_publicmessage` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `last_send` datetime(6) DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_shortmessage`
--

CREATE TABLE `iclock_shortmessage` (
  `id` int NOT NULL,
  `message` longtext NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `msg_type` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminal`
--

CREATE TABLE `iclock_terminal` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `sn` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `ip_address` char(39) NOT NULL,
  `real_ip` char(39) DEFAULT NULL,
  `state` int NOT NULL,
  `terminal_tz` smallint NOT NULL,
  `heartbeat` int NOT NULL,
  `transfer_mode` smallint NOT NULL,
  `transfer_interval` int NOT NULL,
  `transfer_time` varchar(100) NOT NULL,
  `product_type` smallint DEFAULT NULL,
  `is_attendance` smallint NOT NULL,
  `is_registration` smallint NOT NULL,
  `purpose` smallint DEFAULT NULL,
  `controller_type` smallint DEFAULT NULL,
  `authentication` smallint NOT NULL,
  `style` varchar(20) DEFAULT NULL,
  `upload_flag` varchar(10) DEFAULT NULL,
  `fw_ver` varchar(100) DEFAULT NULL,
  `push_protocol` varchar(50) NOT NULL,
  `push_ver` varchar(50) DEFAULT NULL,
  `language` int DEFAULT NULL,
  `is_tft` tinyint(1) NOT NULL,
  `terminal_name` varchar(30) DEFAULT NULL,
  `platform` varchar(30) DEFAULT NULL,
  `oem_vendor` varchar(50) DEFAULT NULL,
  `log_stamp` varchar(30) DEFAULT NULL,
  `op_log_stamp` varchar(30) DEFAULT NULL,
  `capture_stamp` varchar(30) DEFAULT NULL,
  `user_count` int DEFAULT NULL,
  `transaction_count` int DEFAULT NULL,
  `fp_count` int DEFAULT NULL,
  `fp_alg_ver` varchar(10) DEFAULT NULL,
  `face_count` int DEFAULT NULL,
  `face_alg_ver` varchar(10) DEFAULT NULL,
  `fv_count` int DEFAULT NULL,
  `fv_alg_ver` varchar(10) DEFAULT NULL,
  `palm_count` int DEFAULT NULL,
  `palm_alg_ver` varchar(10) DEFAULT NULL,
  `lock_func` smallint NOT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `push_time` datetime(6) DEFAULT NULL,
  `is_access` smallint NOT NULL,
  `area_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminalcommand`
--

CREATE TABLE `iclock_terminalcommand` (
  `id` int NOT NULL,
  `content` longtext NOT NULL,
  `commit_time` datetime(6) NOT NULL,
  `transfer_time` datetime(6) DEFAULT NULL,
  `return_time` datetime(6) DEFAULT NULL,
  `return_value` int DEFAULT NULL,
  `package` int DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminalcommandlog`
--

CREATE TABLE `iclock_terminalcommandlog` (
  `id` int NOT NULL,
  `content` longtext NOT NULL,
  `commit_time` datetime(6) NOT NULL,
  `transfer_time` datetime(6) DEFAULT NULL,
  `return_time` datetime(6) DEFAULT NULL,
  `return_value` int DEFAULT NULL,
  `package` int DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminalemployee`
--

CREATE TABLE `iclock_terminalemployee` (
  `id` int NOT NULL,
  `terminal_sn` varchar(50) NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `privilege` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminallog`
--

CREATE TABLE `iclock_terminallog` (
  `id` int NOT NULL,
  `terminal_tz` smallint DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `action_name` smallint DEFAULT NULL,
  `action_time` datetime(6) DEFAULT NULL,
  `object` varchar(50) DEFAULT NULL,
  `param1` int DEFAULT NULL,
  `param2` int DEFAULT NULL,
  `param3` int DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminalparameter`
--

CREATE TABLE `iclock_terminalparameter` (
  `id` int NOT NULL,
  `param_type` varchar(10) DEFAULT NULL,
  `param_name` varchar(30) NOT NULL,
  `param_value` varchar(100) NOT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminaluploadlog`
--

CREATE TABLE `iclock_terminaluploadlog` (
  `id` int NOT NULL,
  `event` varchar(80) NOT NULL,
  `content` varchar(80) NOT NULL,
  `upload_count` int NOT NULL,
  `error_count` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_terminalworkcode`
--

CREATE TABLE `iclock_terminalworkcode` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(8) NOT NULL,
  `alias` varchar(24) NOT NULL,
  `last_activity` datetime(6) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `pay_code_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_transaction`
--

CREATE TABLE `iclock_transaction` (
  `id` int NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `verify_type` int NOT NULL,
  `work_code` varchar(20) DEFAULT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `terminal_alias` varchar(50) DEFAULT NULL,
  `area_alias` varchar(100) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `gps_location` longtext,
  `mobile` varchar(50) DEFAULT NULL,
  `source` smallint DEFAULT NULL,
  `purpose` smallint DEFAULT NULL,
  `crc` varchar(100) DEFAULT NULL,
  `is_attendance` smallint DEFAULT NULL,
  `reserved` varchar(100) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `sync_status` smallint DEFAULT NULL,
  `sync_time` datetime(6) DEFAULT NULL,
  `is_mask` smallint DEFAULT NULL,
  `temperature` decimal(4,1) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `company_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iclock_transactionproofcmd`
--

CREATE TABLE `iclock_transactionproofcmd` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `terminal_count` int DEFAULT NULL,
  `server_count` int DEFAULT NULL,
  `flag` smallint DEFAULT NULL,
  `reserved_init` int DEFAULT NULL,
  `reserved_float` double DEFAULT NULL,
  `reserved_char` varchar(30) DEFAULT NULL,
  `terminal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingentity`
--

CREATE TABLE `meeting_meetingentity` (
  `workflowinstance_ptr_id` int NOT NULL,
  `code` varchar(32) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `meeting_date` date NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `in_required` tinyint(1) NOT NULL,
  `in_start` datetime(6) NOT NULL,
  `in_end` datetime(6) NOT NULL,
  `out_required` tinyint(1) NOT NULL,
  `out_start` datetime(6) NOT NULL,
  `out_end` datetime(6) NOT NULL,
  `apply_reason` varchar(200) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `calculation_time` datetime(6) DEFAULT NULL,
  `sync_time` datetime(6) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `auto_recording` varchar(50) NOT NULL,
  `enable_virtual` tinyint(1) NOT NULL,
  `enable_waiting_room` tinyint(1) NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `jbh_anytime` tinyint(1) NOT NULL,
  `link_data` longtext,
  `mute_upon_entry` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `preferences` longtext,
  `time_zone` smallint NOT NULL,
  `view_date` date NOT NULL,
  `virutal_uuid` varchar(50) DEFAULT NULL,
  `zoom_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingentity_attender`
--

CREATE TABLE `meeting_meetingentity_attender` (
  `id` int NOT NULL,
  `meetingentity_id` int NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingmanuallog`
--

CREATE TABLE `meeting_meetingmanuallog` (
  `workflowinstance_ptr_id` int NOT NULL,
  `punch_time` datetime(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `apply_reason` varchar(200) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `meeting_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingpayloadbase`
--

CREATE TABLE `meeting_meetingpayloadbase` (
  `id` char(32) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `duration` int NOT NULL,
  `meeting_date` date NOT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `attended_duration` int NOT NULL,
  `late_in` int NOT NULL,
  `early_out` int NOT NULL,
  `absent` int NOT NULL,
  `emp_id` int NOT NULL,
  `meeting_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingroom`
--

CREATE TABLE `meeting_meetingroom` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `code` varchar(32) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `location` varchar(200) NOT NULL,
  `remark` longtext,
  `state` smallint NOT NULL,
  `enable_room` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingroomdevice`
--

CREATE TABLE `meeting_meetingroomdevice` (
  `id` int NOT NULL,
  `device_id` int NOT NULL,
  `room_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_meetingtransaction`
--

CREATE TABLE `meeting_meetingtransaction` (
  `id` int NOT NULL,
  `emp_code` varchar(50) NOT NULL,
  `punch_datetime` datetime(6) NOT NULL,
  `punch_date` date NOT NULL,
  `punch_time` time(6) NOT NULL,
  `punch_state` varchar(5) NOT NULL,
  `source` smallint NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `emp_id` int DEFAULT NULL,
  `meeting_id` int DEFAULT NULL,
  `terminal_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_25_090026_create_tbl_department_order_table', 1),
(5, '2026_06_27_064618_create_tbl_designation_order_table', 1),
(6, '2026_06_27_064644_create_tbl_emp_info_table', 1),
(7, '2026_06_27_064707_create_tbl_shift_table', 1),
(8, '2026_06_27_064736_create_tbl_holiday_setup_table', 1),
(9, '2026_06_27_101353_create_tbl_leave_type_table', 1),
(10, '2026_06_27_101429_create_tbl_leave_application_table', 1),
(11, '2026_07_04_065441_create_tbl_teacher_table', 1),
(12, '2026_07_04_072152_create_tbl_subject_table', 1),
(13, '2026_07_04_090814_create_tbl_batch_table', 1),
(14, '2026_07_04_092905_create_tbl_room_table', 1),
(15, '2026_07_04_093818_create_tbl_device_table', 1),
(16, '2026_07_04_095400_create_tbl_routine_table', 1),
(17, '2026_07_04_115111_create_tbl_attendance_log_table', 1),
(18, '2026_09_13_000000_add_zkt_transaction_id_to_tbl_attendance_log_table', 1),
(19, '2026_09_15_000000_create_tbl_attendance_setting_table', 1),
(20, '2026_09_15_010000_add_proxy_teacher_id_to_tbl_routine_table', 1),
(21, '2026_09_22_000000_create_tbl_roster_people_table', 1),
(22, '2026_09_22_000100_create_tbl_roster_locations_table', 1),
(23, '2026_09_22_000200_create_tbl_roster_shifts_table', 1),
(24, '2026_09_22_000300_create_tbl_roster_assignment_table', 1),
(25, '2026_09_22_010000_make_device_room_optional_for_roster', 1),
(26, '2026_09_22_020000_add_employee_fields_to_roster_people', 1),
(27, '2026_09_22_030000_create_tbl_roster_setting_table', 1),
(28, '2026_09_22_040000_add_work_mode_to_roster_people', 1),
(29, '2026_09_24_000000_add_academic_fields_to_roster_assignments', 1),
(30, '2026_09_24_010000_allow_custom_class_times_on_roster_assignments', 1),
(31, '2026_10_13_000000_add_recurrence_fields_to_roster_assignments', 1),
(32, '2026_10_13_000001_add_department_to_batches', 1),
(33, '2026_10_14_000000_add_semester_dates_to_routines', 1),
(34, '2026_10_14_010000_add_role_and_roster_person_to_users_table', 1),
(35, '2026_10_14_010100_promote_initial_administrator_to_superadmin', 1),
(36, '2026_10_18_000000_change_batch_semester_to_string', 1),
(37, '2026_10_24_000000_allow_duplicate_subject_codes', 1),
(38, '2026_10_25_000000_link_zkt_devices_to_roster_locations', 1),
(39, '2026_11_03_000000_add_short_name_to_roster_people', 1),
(40, '2026_11_03_000100_allow_duplicate_roster_short_names', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_announcement`
--

CREATE TABLE `mobile_announcement` (
  `id` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `category` smallint NOT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `system_sender` varchar(50) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `init_sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_appactionlog`
--

CREATE TABLE `mobile_appactionlog` (
  `id` int NOT NULL,
  `user` varchar(20) NOT NULL,
  `client` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `params` longtext,
  `describe` longtext,
  `request_status` smallint NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `remote_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_applist`
--

CREATE TABLE `mobile_applist` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  `last_active` datetime(6) NOT NULL,
  `token` longtext NOT NULL,
  `device_token` longtext NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_category` smallint NOT NULL,
  `active` smallint DEFAULT NULL,
  `enable` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_appnotification`
--

CREATE TABLE `mobile_appnotification` (
  `id` int NOT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `system_sender` varchar(50) DEFAULT NULL,
  `category` smallint NOT NULL,
  `sub_category` int DEFAULT NULL,
  `content` longtext,
  `payload` longtext,
  `source` int DEFAULT NULL,
  `notification_time` datetime(6) NOT NULL,
  `read_status` smallint NOT NULL,
  `read_time` datetime(6) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `init_sender_id` int DEFAULT NULL,
  `receiver_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_gpsfordepartment`
--

CREATE TABLE `mobile_gpsfordepartment` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `distance` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `department_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_gpsfordepartment_location`
--

CREATE TABLE `mobile_gpsfordepartment_location` (
  `id` int NOT NULL,
  `gpsfordepartment_id` int NOT NULL,
  `gpslocation_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_gpsforemployee`
--

CREATE TABLE `mobile_gpsforemployee` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `distance` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_gpsforemployee_location`
--

CREATE TABLE `mobile_gpsforemployee_location` (
  `id` int NOT NULL,
  `gpsforemployee_id` int NOT NULL,
  `gpslocation_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_gpslocation`
--

CREATE TABLE `mobile_gpslocation` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `alias` varchar(100) NOT NULL,
  `location` longtext NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_mobileapirequestlog`
--

CREATE TABLE `mobile_mobileapirequestlog` (
  `id` int NOT NULL,
  `username_persistent` varchar(200) DEFAULT NULL,
  `requested_at` datetime(6) NOT NULL,
  `response_ms` int UNSIGNED NOT NULL,
  `path` varchar(200) NOT NULL,
  `view` varchar(200) DEFAULT NULL,
  `view_method` varchar(200) DEFAULT NULL,
  `remote_addr` char(39) NOT NULL,
  `host` varchar(200) NOT NULL,
  `method` varchar(10) NOT NULL,
  `query_params` longtext,
  `data` longtext,
  `response` longtext,
  `errors` longtext,
  `status_code` int UNSIGNED DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_deductionformula`
--

CREATE TABLE `payroll_deductionformula` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_empexpenseexemption`
--

CREATE TABLE `payroll_empexpenseexemption` (
  `id` int NOT NULL,
  `exemption_name` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `issued_time` datetime(6) NOT NULL,
  `remark` longtext,
  `year` int NOT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_emploan`
--

CREATE TABLE `payroll_emploan` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `loan_amount` double NOT NULL,
  `loan_time` datetime(6) NOT NULL,
  `refund_cycle` smallint NOT NULL,
  `per_cycle_refund` double NOT NULL,
  `loan_clean_time` datetime(6) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_emppayrollprofile`
--

CREATE TABLE `payroll_emppayrollprofile` (
  `id` int NOT NULL,
  `payment_mode` smallint DEFAULT NULL,
  `payment_type` smallint DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_account` varchar(30) DEFAULT NULL,
  `personnel_id` varchar(30) DEFAULT NULL,
  `agent_id` varchar(30) DEFAULT NULL,
  `agent_account` varchar(30) DEFAULT NULL,
  `employee_id` int NOT NULL,
  `internal_emp_num` varchar(50) DEFAULT NULL,
  `national_num` varchar(50) DEFAULT NULL,
  `payroll_num` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_exceptionformula`
--

CREATE TABLE `payroll_exceptionformula` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_exceptionformula`
--

INSERT INTO `payroll_exceptionformula` (`id`, `name`, `formula`, `remark`, `pay_code_id`) VALUES
(1, 'Early Out', '((({Basic Salary}/30)/8)/60)*{E}', '', 3),
(2, 'Late In', '(({Basic Salary}/30)/8)/60*{L}', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_extradeduction`
--

CREATE TABLE `payroll_extradeduction` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `amount` double NOT NULL,
  `issued_time` datetime(6) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `special_type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_extraincrease`
--

CREATE TABLE `payroll_extraincrease` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `amount` double NOT NULL,
  `issued_time` datetime(6) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `special_type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_increasementformula`
--

CREATE TABLE `payroll_increasementformula` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `apply_mode` smallint NOT NULL,
  `special_type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_leaveformula`
--

CREATE TABLE `payroll_leaveformula` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_overtimeformula`
--

CREATE TABLE `payroll_overtimeformula` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `formula` varchar(100) NOT NULL,
  `remark` longtext,
  `pay_code_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_overtimeformula`
--

INSERT INTO `payroll_overtimeformula` (`id`, `name`, `formula`, `remark`, `pay_code_id`) VALUES
(1, 'Weekend OT', '((({Basic Salary}/30)/8)*1)*{WOT}', '', 6),
(2, 'Normal OT', '((({Basic Salary}/30)/8)*1.5)*{NOT}', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpayload`
--

CREATE TABLE `payroll_payrollpayload` (
  `id` int NOT NULL,
  `calc_time` date DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `format_dict` longtext,
  `payment_mode` smallint DEFAULT NULL,
  `increase` double DEFAULT NULL,
  `deduction` double DEFAULT NULL,
  `increase_formula` longtext,
  `deduction_formula` longtext,
  `increase_formula_name` longtext,
  `deduction_formula_name` longtext,
  `extra_increase` double DEFAULT NULL,
  `extra_deduction` double DEFAULT NULL,
  `total_loan_amount` double DEFAULT NULL,
  `refund_loan_amount` double DEFAULT NULL,
  `unrefund_loan_amount` double DEFAULT NULL,
  `loan_deduction` double DEFAULT NULL,
  `loan_increase` double DEFAULT NULL,
  `advance_increase` double DEFAULT NULL,
  `advance_deduction` double DEFAULT NULL,
  `reimbursement` double DEFAULT NULL,
  `total_increase_formula` longtext,
  `total_increase_formula_name` longtext,
  `total_increase_expression` longtext,
  `total_increase` double DEFAULT NULL,
  `total_deduction_formula` longtext,
  `total_deduction_formula_name` longtext,
  `total_deduction_expression` longtext,
  `total_deduction` double DEFAULT NULL,
  `total_salary_expression` longtext,
  `total_salary` double DEFAULT NULL,
  `employee_id` int NOT NULL,
  `calc_end_time` date DEFAULT NULL,
  `net_pay` double DEFAULT NULL,
  `social_security_deduction` double DEFAULT NULL,
  `tax_deduction` double DEFAULT NULL,
  `total_income_per_year` double DEFAULT NULL,
  `total_tax_deduction_per_year` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpayloadexpenseexemption`
--

CREATE TABLE `payroll_payrollpayloadexpenseexemption` (
  `id` int NOT NULL,
  `exemption_id` int DEFAULT NULL,
  `payload_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollpayloadpaycode`
--

CREATE TABLE `payroll_payrollpayloadpaycode` (
  `id` int NOT NULL,
  `amount` double DEFAULT NULL,
  `formula` longtext,
  `formula_name` longtext,
  `pay_code_id` int NOT NULL,
  `payload_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_reimbursement`
--

CREATE TABLE `payroll_reimbursement` (
  `id` int NOT NULL,
  `rmb_amount` double NOT NULL,
  `rmb_time` datetime(6) NOT NULL,
  `rmb_file` varchar(200) DEFAULT NULL,
  `rmb_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salaryadvance`
--

CREATE TABLE `payroll_salaryadvance` (
  `id` int NOT NULL,
  `advance_amount` double NOT NULL,
  `advance_time` datetime(6) NOT NULL,
  `advance_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure`
--

CREATE TABLE `payroll_salarystructure` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `salary_amount` double NOT NULL,
  `effective_date` date NOT NULL,
  `salary_remark` varchar(300) DEFAULT NULL,
  `employee_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure_deductionformula`
--

CREATE TABLE `payroll_salarystructure_deductionformula` (
  `id` int NOT NULL,
  `salarystructure_id` int NOT NULL,
  `deductionformula_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure_exceptionformula`
--

CREATE TABLE `payroll_salarystructure_exceptionformula` (
  `id` int NOT NULL,
  `salarystructure_id` int NOT NULL,
  `exceptionformula_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure_increasementformula`
--

CREATE TABLE `payroll_salarystructure_increasementformula` (
  `id` int NOT NULL,
  `salarystructure_id` int NOT NULL,
  `increasementformula_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure_leaveformula`
--

CREATE TABLE `payroll_salarystructure_leaveformula` (
  `id` int NOT NULL,
  `salarystructure_id` int NOT NULL,
  `leaveformula_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_salarystructure_overtimeformula`
--

CREATE TABLE `payroll_salarystructure_overtimeformula` (
  `id` int NOT NULL,
  `salarystructure_id` int NOT NULL,
  `overtimeformula_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_socialsecuritydeduction`
--

CREATE TABLE `payroll_socialsecuritydeduction` (
  `id` int NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `used` int DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_socialsecuritydeduction`
--

INSERT INTO `payroll_socialsecuritydeduction` (`id`, `country_code`, `used`, `data`) VALUES
(1, 'default', 1, '{\"minimum\": \"1650\", \"minimum_social_security\": \"83\", \"min_max_percent\": [{\"min\": \"1650\", \"max\": \"15000\", \"percent\": \"5\"}], \"maximum\": \"15000\", \"maximum_social_security\": \"750\"}');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_specialpayment`
--

CREATE TABLE `payroll_specialpayment` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_taxdeduction`
--

CREATE TABLE `payroll_taxdeduction` (
  `id` int NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `used` int DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_taxdeduction`
--

INSERT INTO `payroll_taxdeduction` (`id`, `country_code`, `used`, `data`) VALUES
(1, 'default', 1, '{\"min_max_percent\": [{\"min_tax_deduction\": \"0\", \"max_tax_deduction\": \"150000\", \"percent_tax_deduction\": \"0\"}, {\"min_tax_deduction\": \"150000\", \"max_tax_deduction\": \"300000\", \"percent_tax_deduction\": \"5\"}, {\"min_tax_deduction\": \"300000\", \"max_tax_deduction\": \"500000\", \"percent_tax_deduction\": \"10\"}, {\"min_tax_deduction\": \"500000\", \"max_tax_deduction\": \"750000\", \"percent_tax_deduction\": \"15\"}, {\"min_tax_deduction\": \"750000\", \"max_tax_deduction\": \"1000000\", \"percent_tax_deduction\": \"20\"}, {\"min_tax_deduction\": \"1000000\", \"max_tax_deduction\": \"2000000\", \"percent_tax_deduction\": \"25\"}, {\"min_tax_deduction\": \"2000000\", \"max_tax_deduction\": \"4000000\", \"percent_tax_deduction\": \"30\"}], \"maximum\": \"4000000\", \"maximum_percent\": \"35\"}');

-- --------------------------------------------------------

--
-- Table structure for table `personnel_area`
--

CREATE TABLE `personnel_area` (
  `id` int NOT NULL,
  `area_code` varchar(30) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_area_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `device_count` int NOT NULL,
  `employee_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personnel_area`
--

INSERT INTO `personnel_area` (`id`, `area_code`, `area_name`, `is_default`, `parent_area_id`, `company_id`, `device_count`, `employee_count`) VALUES
(1, '1', 'Not Authorized', 1, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `personnel_assignareaemployee`
--

CREATE TABLE `personnel_assignareaemployee` (
  `id` int NOT NULL,
  `assigned_time` datetime(6) NOT NULL,
  `area_id` int NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_certification`
--

CREATE TABLE `personnel_certification` (
  `id` int NOT NULL,
  `cert_code` varchar(20) NOT NULL,
  `cert_name` varchar(100) NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_company`
--

CREATE TABLE `personnel_company` (
  `id` int NOT NULL,
  `company_code` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `logo_pos` smallint NOT NULL,
  `name_pos` smallint NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `status` smallint NOT NULL,
  `website` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personnel_company`
--

INSERT INTO `personnel_company` (`id`, `company_code`, `company_name`, `is_default`, `address`, `address2`, `change_time`, `change_user`, `city`, `country`, `create_time`, `create_user`, `email`, `fax`, `logo`, `logo_pos`, `name_pos`, `phone`, `postal_code`, `state`, `status`, `website`) VALUES
(1, '1', 'company.default', 1, NULL, NULL, '2026-11-05 12:15:01.289868', NULL, NULL, NULL, '2026-11-05 12:15:02.197628', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personnel_department`
--

CREATE TABLE `personnel_department` (
  `id` int NOT NULL,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_dept_id` int DEFAULT NULL,
  `dept_manager_id` int DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personnel_department`
--

INSERT INTO `personnel_department` (`id`, `dept_code`, `dept_name`, `is_default`, `parent_dept_id`, `dept_manager_id`, `company_id`) VALUES
(1, '1', 'Department', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employee`
--

CREATE TABLE `personnel_employee` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `passport` varchar(30) DEFAULT NULL,
  `driver_license_automobile` varchar(30) DEFAULT NULL,
  `driver_license_motorcycle` varchar(30) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `self_password` varchar(128) DEFAULT NULL,
  `device_password` varchar(20) DEFAULT NULL,
  `dev_privilege` int DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `acc_group` varchar(5) DEFAULT NULL,
  `acc_timezone` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `office_tel` varchar(20) DEFAULT NULL,
  `contact_tel` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `national` varchar(50) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `enroll_sn` varchar(20) DEFAULT NULL,
  `ssn` varchar(20) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `verify_mode` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `emp_type` smallint DEFAULT NULL,
  `enable_payroll` tinyint(1) NOT NULL,
  `app_status` smallint DEFAULT NULL,
  `app_role` smallint DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `login_ip` varchar(32) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `leave_group` int DEFAULT NULL,
  `emp_code_digit` bigint DEFAULT NULL,
  `superior_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `password_reset` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employeecalendar`
--

CREATE TABLE `personnel_employeecalendar` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `calendar` varchar(100) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employeecertification`
--

CREATE TABLE `personnel_employeecertification` (
  `id` int NOT NULL,
  `expire_on` date DEFAULT NULL,
  `email_alert` tinyint(1) NOT NULL,
  `before` int DEFAULT NULL,
  `certification_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `certification_code` varchar(20) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employeecustomattribute`
--

CREATE TABLE `personnel_employeecustomattribute` (
  `id` int NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_type` smallint NOT NULL,
  `attr_value` varchar(999) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employeeextrainfo`
--

CREATE TABLE `personnel_employeeextrainfo` (
  `id` int NOT NULL,
  `value` longtext NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employeeprofile`
--

CREATE TABLE `personnel_employeeprofile` (
  `id` int NOT NULL,
  `column_order` longtext NOT NULL,
  `preferences` longtext NOT NULL,
  `pwd_update_time` datetime(6) DEFAULT NULL,
  `emp_id` int NOT NULL,
  `disabled_fields` longtext NOT NULL DEFAULT (_utf8mb3'')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employee_area`
--

CREATE TABLE `personnel_employee_area` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employee_area_privilege`
--

CREATE TABLE `personnel_employee_area_privilege` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employee_flow_role`
--

CREATE TABLE `personnel_employee_flow_role` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `workflowrole_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_employment`
--

CREATE TABLE `personnel_employment` (
  `id` int NOT NULL,
  `employment_type` smallint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active_time` datetime(6) DEFAULT NULL,
  `inactive_time` datetime(6) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_position`
--

CREATE TABLE `personnel_position` (
  `id` int NOT NULL,
  `position_code` varchar(50) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `parent_position_id` int DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personnel_position`
--

INSERT INTO `personnel_position` (`id`, `position_code`, `position_name`, `is_default`, `parent_position_id`, `company_id`) VALUES
(1, '1', 'Position', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personnel_resign`
--

CREATE TABLE `personnel_resign` (
  `id` int NOT NULL,
  `resign_date` date NOT NULL,
  `resign_type` int DEFAULT NULL,
  `disableatt` tinyint(1) NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rest_framework_tracking_apirequestlog`
--

CREATE TABLE `rest_framework_tracking_apirequestlog` (
  `id` int NOT NULL,
  `requested_at` datetime(6) NOT NULL,
  `response_ms` int UNSIGNED NOT NULL,
  `path` varchar(200) NOT NULL,
  `remote_addr` char(39) NOT NULL,
  `host` varchar(200) NOT NULL,
  `method` varchar(10) NOT NULL,
  `query_params` longtext,
  `data` longtext,
  `response` longtext,
  `status_code` int UNSIGNED DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `view` varchar(200) DEFAULT NULL,
  `view_method` varchar(200) DEFAULT NULL,
  `errors` longtext,
  `username_persistent` varchar(200) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_stafftoken`
--

CREATE TABLE `staff_stafftoken` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_area`
--

CREATE TABLE `sync_area` (
  `id` int NOT NULL,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `area_code` varchar(30) NOT NULL,
  `area_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_department`
--

CREATE TABLE `sync_department` (
  `id` int NOT NULL,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_employee`
--

CREATE TABLE `sync_employee` (
  `id` int NOT NULL,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `emp_code` varchar(20) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dept_code` varchar(50) DEFAULT NULL,
  `dept_name` varchar(200) DEFAULT NULL,
  `job_code` varchar(50) DEFAULT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `area_code` varchar(30) DEFAULT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `multi_area` tinyint(1) NOT NULL,
  `hire_date` date DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_job`
--

CREATE TABLE `sync_job` (
  `id` int NOT NULL,
  `post_time` datetime(6) DEFAULT NULL,
  `flag` smallint NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sync_ret` varchar(200) DEFAULT NULL,
  `job_code` varchar(50) NOT NULL,
  `job_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblattendancelog`
--

CREATE TABLE `tblattendancelog` (
  `AttendanceLogID` bigint UNSIGNED NOT NULL,
  `ZKTTransactionID` bigint UNSIGNED DEFAULT NULL,
  `EmployeeID` bigint UNSIGNED NOT NULL,
  `DeviceID` bigint UNSIGNED DEFAULT NULL,
  `DeviceSerialNo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PunchTime` datetime NOT NULL,
  `PunchState` tinyint DEFAULT NULL,
  `VerifyMode` int DEFAULT NULL,
  `WorkCode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Temperature` decimal(5,2) DEFAULT NULL,
  `Mask` tinyint(1) DEFAULT NULL,
  `UploadSource` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ZKTeco',
  `SyncTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsProcessed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblattendancesetting`
--

CREATE TABLE `tblattendancesetting` (
  `id` tinyint NOT NULL,
  `EntryEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `EntryLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblattendancesetting`
--

INSERT INTO `tblattendancesetting` (`id`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `created_at`, `updated_at`) VALUES
(1, 15, 10, 10, 15, '2026-11-05 06:09:28', '2026-11-05 06:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblbatch`
--

CREATE TABLE `tblbatch` (
  `BatchID` bigint UNSIGNED NOT NULL,
  `DepartmentID` bigint UNSIGNED DEFAULT NULL,
  `BatchName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Session` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Semester` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblbatch`
--

INSERT INTO `tblbatch` (`BatchID`, `DepartmentID`, `BatchName`, `Session`, `Semester`, `Status`, `created_at`, `updated_at`) VALUES
(1, 1, '9th Batch', 'Spring-2023', 'L4-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(2, 1, '10th Batch', 'Fall-2023', 'L4-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(3, 1, '11th Batch', 'Spring-2024', 'L3-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(4, 1, '12th Batch', 'Fall-2024', 'L3-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(5, 1, '13th Batch', 'Spring-2025', 'L2-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(6, 1, '14th Batch', 'Fall-2025', 'L2-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(7, 1, '15th Batch', 'Spring-2026', 'L1-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(8, 1, '16th Batch', 'Fall-2026', 'L1-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(9, 5, '16th Batch', 'Spring-2023', 'L4-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(10, 5, '17th Batch', 'Fall-2023', 'L4-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(11, 5, '18th Batch', 'Spring-2024', 'L3-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(12, 5, '19th Batch', 'Fall-2024', 'L3-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(13, 5, '20th Batch', 'Spring-2025', 'L2-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(14, 5, '21th Batch', 'Fall-2025', 'L2-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(15, 5, '22th Batch', 'Spring-2026', 'L1-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(16, 5, '23th Batch', 'Fall-2026', 'L1-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(17, 4, '15th batch', 'Spring-2023', 'L4-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(18, 4, '16th batch', 'Fall-2023', 'L4-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(19, 4, '17th batch', 'Spring-2024', 'L3-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(20, 4, '18th batch', 'Fall-2024', 'L3-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(21, 4, '19th batch', 'Spring-2025', 'L2-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(22, 4, '20th batch', 'Fall-2025', 'L2-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(23, 4, '21th batch', 'Spring-2026', 'L1-T2', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14'),
(24, 4, '22th batch', 'Fall-2026', 'L1-T1', 1, '2026-11-05 06:10:14', '2026-11-05 06:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `DepartmentID` bigint UNSIGNED NOT NULL,
  `DepartmentCode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DepartmentName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`DepartmentID`, `DepartmentCode`, `DepartmentName`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'LAW', 'Law', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(2, 'ENG', 'English', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(3, 'CSE', 'Computer Science & Engineering', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(4, 'CE', 'Communication Engineering', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(5, 'BBA', 'Business Administration', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(6, 'SH', 'Science & Humanities', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(7, 'ADJ', 'Adjunct Faculty', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbldesignation`
--

CREATE TABLE `tbldesignation` (
  `DesignationID` bigint UNSIGNED NOT NULL,
  `DesignationName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbldesignation`
--

INSERT INTO `tbldesignation` (`DesignationID`, `DesignationName`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'Professor & Dean', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(2, 'Professor & Head', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(3, 'Associate Professor', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(4, 'Associate Professor and Head of the Department', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(5, 'Assistant Professor', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(6, 'Assistant Professor & Program Coordinator', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(7, 'Lecturer', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(8, 'District & Sessions Judge', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(9, 'Professor, Comilla University', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(10, 'Advocate', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(11, 'Joint District & Sessions Judge', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(12, 'Lab Technician', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(13, 'Computer Operator', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(14, 'Lab Assistant', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(15, 'Lab Attendant', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51'),
(16, 'Messenger', 1, '2026-11-05 06:09:51', '2026-11-05 06:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbldevice`
--

CREATE TABLE `tbldevice` (
  `DeviceID` bigint UNSIGNED NOT NULL,
  `DeviceName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoomID` bigint UNSIGNED DEFAULT NULL,
  `IPAddress` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SerialNo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbldevice`
--

INSERT INTO `tbldevice` (`DeviceID`, `DeviceName`, `RoomID`, `IPAddress`, `SerialNo`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'Room - 301', NULL, '192.168.25.172', 'SMR5261600058', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(2, 'Room - 302', NULL, '192.168.25.173', 'SMR5261600071', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(3, 'Room - 303', NULL, '192.168.1.103', 'SOYG2146600074', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(4, 'Room - 309', NULL, '192.168.25.175', 'SMR5261600070', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(5, 'Room - 405', NULL, '192.168.25.176', 'SMR5261600065', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(6, 'Room - 406', NULL, '192.168.25.177', 'SMR5261600066', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(7, 'Room - 409', NULL, '192.168.25.178', 'SMR5261600063', 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblempinfo`
--

CREATE TABLE `tblempinfo` (
  `id` bigint UNSIGNED NOT NULL,
  `User_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strdepartment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strdesignation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ysnactive` tinyint(1) NOT NULL DEFAULT '1',
  `RelioGion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bloodGroup` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ysnAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `workStation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shiftName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderNumber` int DEFAULT NULL,
  `ysnRoster` tinyint(1) DEFAULT NULL,
  `cmpID` int DEFAULT NULL,
  `entryBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryDate` datetime DEFAULT NULL,
  `modifyBy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `reporting_boss` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mobile_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reporting_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_admin` tinyint(1) DEFAULT NULL,
  `join_Date` date DEFAULT NULL,
  `inactive_Date` date DEFAULT NULL,
  `inactiveReason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `empType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fatherName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motherName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roll` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `admit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblholidaysetup`
--

CREATE TABLE `tblholidaysetup` (
  `id` bigint UNSIGNED NOT NULL,
  `HolidayName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holidaydate` date NOT NULL,
  `strDescription` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblleave`
--

CREATE TABLE `tblleave` (
  `id` bigint UNSIGNED NOT NULL,
  `empID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_type_id` bigint UNSIGNED NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `total_days` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','Approved','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `approved_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int NOT NULL DEFAULT '0',
  `IsPaid` tinyint(1) NOT NULL DEFAULT '1',
  `Remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblroom`
--

CREATE TABLE `tblroom` (
  `RoomID` bigint UNSIGNED NOT NULL,
  `RoomNo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Floor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrosterassignment`
--

CREATE TABLE `tblrosterassignment` (
  `RosterAssignmentID` bigint UNSIGNED NOT NULL,
  `RosterSeriesID` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RosterDate` date NOT NULL,
  `SeriesStartDate` date DEFAULT NULL,
  `SeriesEndDate` date DEFAULT NULL,
  `RepeatMode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Once',
  `Weekdays` json DEFAULT NULL,
  `RosterPersonID` bigint UNSIGNED NOT NULL,
  `ProxyPersonID` bigint UNSIGNED DEFAULT NULL,
  `RosterShiftID` bigint UNSIGNED DEFAULT NULL,
  `RosterLocationID` bigint UNSIGNED DEFAULT NULL,
  `DeviceID` bigint UNSIGNED DEFAULT NULL,
  `AssignmentType` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'General Duty',
  `DepartmentID` bigint UNSIGNED DEFAULT NULL,
  `BatchID` bigint UNSIGNED DEFAULT NULL,
  `SubjectID` bigint UNSIGNED DEFAULT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CrossesMidnight` tinyint(1) NOT NULL DEFAULT '0',
  `EntryEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `EntryLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `Remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblrosterassignment`
--

INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(1, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(2, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(3, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(4, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(5, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(6, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(7, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(8, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(9, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(10, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(11, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(12, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(13, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(14, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(15, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(16, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(17, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(18, '1c52bb4c-a929-48a6-b5c7-37977c64d24a', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 47, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(19, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(20, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(21, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(22, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(23, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(24, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(25, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:35', '2026-11-05 06:36:35'),
(26, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(27, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(28, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(29, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(30, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(31, '15351267-af73-4084-b4a2-d101ddc3c078', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(32, '15351267-af73-4084-b4a2-d101ddc3c078', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(33, '15351267-af73-4084-b4a2-d101ddc3c078', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(34, '15351267-af73-4084-b4a2-d101ddc3c078', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(35, '15351267-af73-4084-b4a2-d101ddc3c078', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(36, '15351267-af73-4084-b4a2-d101ddc3c078', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 37, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(37, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(38, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(39, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(40, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(41, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(42, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(43, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(44, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(45, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(46, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(47, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(48, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(49, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(50, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(51, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(52, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(53, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(54, 'b4d24102-76dd-4189-9115-d7a00d91a043', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(55, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(56, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(57, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(58, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(59, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(60, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(61, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(62, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(63, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(64, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(65, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(66, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(67, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(68, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(69, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(70, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(71, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(72, '1f194c67-0a3c-456d-8f51-d325b1c9371d', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(73, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(74, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(75, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(76, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(77, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(78, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(79, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(80, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(81, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(82, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(83, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(84, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(85, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(86, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(87, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(88, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(89, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(90, '312a8808-4f2e-486a-9c7c-2768cbe97327', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 14, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 31, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(91, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(92, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(93, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(94, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(95, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(96, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(97, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(98, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(99, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(100, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(101, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(102, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(103, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(104, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(105, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(106, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(107, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(108, 'e1ed356c-f9e2-4091-a71c-0714eddebc4f', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 45, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(109, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(110, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(111, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(112, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(113, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(114, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(115, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(116, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(117, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(118, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(119, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(120, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(121, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(122, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(123, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(124, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(125, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(126, 'c547ee58-d76a-4fb6-b030-7c27c187e13b', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 2, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(127, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(128, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(129, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(130, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(131, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(132, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(133, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(134, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(135, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(136, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(137, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(138, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(139, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(140, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(141, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(142, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(143, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(144, '1a64b5c4-7b79-4068-8f8a-8274bf2b185d', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(145, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(146, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(147, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(148, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(149, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(150, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(151, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(152, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(153, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(154, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(155, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(156, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(157, '5f69b589-eebd-440c-9892-2ff6c431961e', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(158, '5f69b589-eebd-440c-9892-2ff6c431961e', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(159, '5f69b589-eebd-440c-9892-2ff6c431961e', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(160, '5f69b589-eebd-440c-9892-2ff6c431961e', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(161, '5f69b589-eebd-440c-9892-2ff6c431961e', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(162, '5f69b589-eebd-440c-9892-2ff6c431961e', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(163, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(164, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(165, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(166, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(167, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(168, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(169, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(170, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(171, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(172, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(173, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(174, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(175, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(176, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(177, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(178, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(179, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(180, 'c9be3ff4-0833-4b4f-8fc2-9a983d1d6f41', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 19, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(181, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(182, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(183, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(184, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(185, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(186, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(187, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(188, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(189, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(190, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(191, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(192, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(193, '57686616-76db-4f15-a5b3-215b7cfff35d', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(194, '57686616-76db-4f15-a5b3-215b7cfff35d', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(195, '57686616-76db-4f15-a5b3-215b7cfff35d', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(196, '57686616-76db-4f15-a5b3-215b7cfff35d', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(197, '57686616-76db-4f15-a5b3-215b7cfff35d', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(198, '57686616-76db-4f15-a5b3-215b7cfff35d', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 3, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(199, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(200, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(201, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(202, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(203, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(204, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(205, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(206, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(207, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(208, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(209, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(210, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(211, '365e2432-d2c7-4504-9991-e23d076351c0', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(212, '365e2432-d2c7-4504-9991-e23d076351c0', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(213, '365e2432-d2c7-4504-9991-e23d076351c0', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(214, '365e2432-d2c7-4504-9991-e23d076351c0', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(215, '365e2432-d2c7-4504-9991-e23d076351c0', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(216, '365e2432-d2c7-4504-9991-e23d076351c0', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(217, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(218, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(219, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(220, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(221, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(222, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(223, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(224, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(225, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(226, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(227, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(228, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(229, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(230, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(231, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(232, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(233, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(234, '7f2e6fbb-4790-4f09-a751-7c78a76e1fc0', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 33, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(235, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(236, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(237, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(238, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(239, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(240, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(241, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(242, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(243, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(244, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(245, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(246, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(247, '313ad660-7e89-430b-ad66-104080ec67c6', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(248, '313ad660-7e89-430b-ad66-104080ec67c6', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(249, '313ad660-7e89-430b-ad66-104080ec67c6', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(250, '313ad660-7e89-430b-ad66-104080ec67c6', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(251, '313ad660-7e89-430b-ad66-104080ec67c6', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(252, '313ad660-7e89-430b-ad66-104080ec67c6', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 5, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 9, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(253, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(254, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(255, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(256, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(257, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(258, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(259, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(260, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(261, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(262, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(263, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(264, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(265, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(266, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(267, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(268, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(269, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(270, '00ee1757-5bb6-4fe6-b77a-f1bae0102c7a', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 61, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(271, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(272, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(273, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(274, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(275, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(276, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(277, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(278, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(279, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(280, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(281, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(282, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(283, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(284, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(285, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(286, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(287, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(288, '6d51b140-e4b5-4fca-9f48-85b8e3290bc8', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(289, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(290, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(291, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(292, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(293, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(294, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(295, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(296, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(297, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(298, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(299, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(300, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(301, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(302, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(303, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(304, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(305, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(306, 'e06b9616-bee3-440c-aaf2-daa347f9265f', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(307, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(308, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(309, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(310, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(311, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(312, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(313, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(314, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(315, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(316, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(317, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(318, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(319, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(320, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(321, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(322, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(323, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(324, '84ba7e2e-5e48-4e8a-accd-528f4949f4af', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(325, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(326, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(327, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(328, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(329, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(330, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(331, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(332, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(333, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(334, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(335, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(336, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(337, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(338, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(339, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(340, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(341, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(342, '7d2327de-e20f-4549-8aa9-c3b22b6ced30', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 9, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 59, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(343, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(344, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(345, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(346, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(347, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(348, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(349, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(350, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(351, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(352, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(353, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(354, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(355, 'e3e019b6-bf79-442a-b288-701959db843e', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(356, 'e3e019b6-bf79-442a-b288-701959db843e', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(357, 'e3e019b6-bf79-442a-b288-701959db843e', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(358, 'e3e019b6-bf79-442a-b288-701959db843e', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(359, 'e3e019b6-bf79-442a-b288-701959db843e', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(360, 'e3e019b6-bf79-442a-b288-701959db843e', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 42, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(361, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-10-04', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(362, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-10-11', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(363, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-10-18', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(364, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-10-25', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(365, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-11-01', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(366, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-11-08', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(367, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-11-15', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(368, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-11-22', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(369, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-11-29', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(370, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-12-06', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(371, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-12-13', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(372, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-12-20', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(373, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2026-12-27', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(374, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2027-01-03', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(375, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2027-01-10', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(376, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2027-01-17', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(377, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2027-01-24', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(378, '1c32c1b7-e474-4bed-b05f-15a7384017f5', '2027-01-31', '2026-10-01', '2027-01-31', 'Weekly', '[0]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(379, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(380, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(381, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(382, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(383, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(384, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(385, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(386, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(387, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(388, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(389, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(390, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(391, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(392, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(393, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(394, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(395, 'f684a9c4-7191-4f38-9a30-dbfeb9b30eab', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 3, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(396, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(397, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(398, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(399, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(400, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(401, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(402, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(403, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(404, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(405, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(406, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(407, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(408, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(409, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(410, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(411, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(412, '272ca5e7-c19c-4b88-bb47-6a030760d3a1', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 13, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(413, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(414, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(415, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(416, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(417, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(418, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(419, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(420, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(421, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(422, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(423, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(424, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(425, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(426, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(427, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(428, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(429, 'fbb607d1-e6e9-470b-9972-47ba843fb978', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 23, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(430, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(431, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(432, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(433, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(434, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(435, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(436, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(437, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(438, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(439, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(440, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(441, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(442, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(443, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(444, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(445, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(446, '9182197d-41d2-43a1-9e84-9fdffb7ff9b7', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(447, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(448, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(449, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(450, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(451, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(452, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(453, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(454, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(455, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(456, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(457, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(458, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(459, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(460, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(461, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(462, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(463, '4bec03ef-39c3-4167-b9ea-00d67631e0e8', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 15, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 38, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(464, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(465, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(466, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(467, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(468, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(469, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(470, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(471, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(472, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(473, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(474, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(475, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(476, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(477, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(478, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(479, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(480, '7b952b83-5d7c-43fa-9881-c1e617c3044f', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 7, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(481, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(482, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(483, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(484, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(485, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(486, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(487, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(488, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(489, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(490, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(491, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(492, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(493, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(494, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(495, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(496, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(497, '85082a94-fe8c-45f6-b0a9-0fef897b4503', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(498, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(499, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(500, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(501, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(502, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(503, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(504, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(505, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(506, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(507, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(508, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(509, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(510, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(511, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(512, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(513, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(514, 'd1dbf0be-42c1-4e1c-8d81-7616bef5481b', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 46, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(515, 'aa334b43-55f0-470d-8451-83467d958490', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(516, 'aa334b43-55f0-470d-8451-83467d958490', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(517, 'aa334b43-55f0-470d-8451-83467d958490', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(518, 'aa334b43-55f0-470d-8451-83467d958490', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(519, 'aa334b43-55f0-470d-8451-83467d958490', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(520, 'aa334b43-55f0-470d-8451-83467d958490', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(521, 'aa334b43-55f0-470d-8451-83467d958490', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(522, 'aa334b43-55f0-470d-8451-83467d958490', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(523, 'aa334b43-55f0-470d-8451-83467d958490', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(524, 'aa334b43-55f0-470d-8451-83467d958490', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(525, 'aa334b43-55f0-470d-8451-83467d958490', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(526, 'aa334b43-55f0-470d-8451-83467d958490', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(527, 'aa334b43-55f0-470d-8451-83467d958490', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(528, 'aa334b43-55f0-470d-8451-83467d958490', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(529, 'aa334b43-55f0-470d-8451-83467d958490', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(530, 'aa334b43-55f0-470d-8451-83467d958490', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(531, 'aa334b43-55f0-470d-8451-83467d958490', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 36, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(532, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(533, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(534, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(535, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(536, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(537, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(538, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(539, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(540, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(541, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(542, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(543, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(544, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(545, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(546, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(547, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(548, 'd751552c-6d6e-40bf-ae82-25801a73a88a', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:36', '2026-11-05 06:36:36'),
(549, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(550, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(551, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(552, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(553, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(554, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(555, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(556, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(557, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(558, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(559, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(560, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(561, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(562, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(563, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(564, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(565, 'd3e1beff-61dd-4cb9-a9f2-4ce32888fd13', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(566, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(567, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(568, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(569, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(570, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(571, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(572, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(573, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(574, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(575, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(576, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(577, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(578, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(579, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(580, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(581, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(582, '0904b595-d65d-46c3-8011-7e1f8ac81990', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 52, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(583, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(584, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(585, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(586, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(587, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(588, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(589, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(590, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(591, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(592, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(593, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(594, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(595, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(596, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(597, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(598, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(599, 'a1a1d433-1a22-430f-94f5-488461ba96e3', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 48, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(600, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(601, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(602, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(603, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(604, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(605, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(606, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(607, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(608, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(609, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(610, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(611, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(612, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(613, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(614, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(615, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(616, '54004ad8-da50-4cc6-a0d4-62a1fc99acc3', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 3, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 27, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(617, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(618, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(619, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(620, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(621, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(622, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(623, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(624, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(625, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(626, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(627, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(628, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(629, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(630, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(631, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(632, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(633, '3b35cd07-ed6e-421c-b5f4-9609c0a6914e', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(634, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(635, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(636, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(637, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(638, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(639, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(640, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(641, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(642, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(643, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(644, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(645, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(646, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(647, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(648, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(649, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(650, '8cc9a682-1dba-474d-8b58-925e8c208df6', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 21, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(651, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(652, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(653, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(654, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(655, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(656, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(657, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(658, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(659, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(660, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(661, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(662, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(663, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(664, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(665, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(666, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(667, '77f68b49-744c-4ca4-9e92-17fb5369fab9', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 7, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 35, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(668, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(669, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(670, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(671, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(672, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(673, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(674, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(675, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(676, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(677, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(678, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(679, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(680, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(681, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(682, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(683, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(684, '28384bc3-ce99-42e1-b611-62471d9b4a52', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 43, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(685, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(686, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(687, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(688, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(689, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(690, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(691, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(692, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(693, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(694, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(695, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(696, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(697, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(698, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(699, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(700, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(701, 'c30f26bd-e08d-421d-a4e3-768edb24a309', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(702, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(703, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(704, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(705, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(706, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(707, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(708, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(709, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(710, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(711, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(712, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(713, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(714, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(715, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(716, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(717, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(718, '2bd8f63b-12f3-4fef-9e8d-178a45be1471', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 45, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(719, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(720, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(721, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(722, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(723, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(724, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(725, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(726, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(727, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(728, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(729, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(730, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(731, '895745a6-a923-407f-85c3-5a07cb454b6f', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(732, '895745a6-a923-407f-85c3-5a07cb454b6f', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(733, '895745a6-a923-407f-85c3-5a07cb454b6f', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(734, '895745a6-a923-407f-85c3-5a07cb454b6f', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(735, '895745a6-a923-407f-85c3-5a07cb454b6f', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 10, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(736, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(737, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(738, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(739, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(740, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(741, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(742, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(743, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(744, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(745, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(746, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(747, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(748, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(749, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(750, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(751, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(752, '1cc2abc6-8648-47d2-ad82-c30cd70b8b74', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(753, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-10-05', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(754, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-10-12', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(755, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-10-19', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(756, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-10-26', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(757, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-11-02', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(758, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-11-09', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(759, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-11-16', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(760, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-11-23', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(761, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-11-30', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(762, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-12-07', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(763, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-12-14', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(764, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-12-21', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(765, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2026-12-28', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(766, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2027-01-04', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(767, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2027-01-11', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(768, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2027-01-18', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(769, 'f592b52b-6412-477c-8a8b-d307c22bb117', '2027-01-25', '2026-10-01', '2027-01-31', 'Weekly', '[1]', 20, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 54, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(770, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(771, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(772, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(773, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(774, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(775, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(776, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(777, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(778, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:37', '2026-11-05 06:36:37'),
(779, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(780, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(781, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(782, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(783, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(784, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(785, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(786, '1acc600d-708b-446b-a0f1-00ead4e0cbd0', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 55, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(787, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(788, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(789, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(790, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(791, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(792, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(793, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(794, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(795, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(796, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(797, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(798, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(799, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(800, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(801, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(802, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(803, '59df42ee-9baf-4bb3-9215-9130f89683d1', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 14, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 31, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(804, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(805, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(806, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(807, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(808, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(809, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(810, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(811, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(812, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(813, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(814, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(815, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(816, '0d526529-9026-4083-851d-b4f4a03f40bf', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(817, '0d526529-9026-4083-851d-b4f4a03f40bf', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(818, '0d526529-9026-4083-851d-b4f4a03f40bf', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(819, '0d526529-9026-4083-851d-b4f4a03f40bf', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(820, '0d526529-9026-4083-851d-b4f4a03f40bf', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 9, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(821, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(822, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(823, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(824, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(825, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(826, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(827, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(828, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(829, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(830, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(831, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(832, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(833, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(834, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(835, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(836, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(837, 'cbe1a0ed-afda-4d96-8e61-0fee4b0c1a38', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 19, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(838, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(839, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(840, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(841, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(842, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(843, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(844, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(845, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(846, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(847, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(848, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(849, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(850, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(851, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(852, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(853, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(854, '2e352439-0d16-454d-9aa8-3ec79c14e190', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 7, '09:00:00', '10:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(855, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(856, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(857, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(858, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(859, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(860, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(861, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(862, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(863, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(864, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(865, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(866, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(867, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(868, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(869, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(870, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(871, '870b63c3-75a0-47e1-9864-b09e785eebc7', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 21, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(872, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(873, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(874, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(875, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(876, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(877, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(878, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(879, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(880, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(881, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(882, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(883, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(884, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(885, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(886, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(887, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(888, 'eb29119e-2473-4956-b395-c0787eebdbe1', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 2, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 53, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(889, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(890, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(891, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(892, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(893, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(894, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(895, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(896, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(897, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(898, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(899, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(900, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(901, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(902, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(903, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(904, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(905, '2030dcfb-c11f-4965-9652-f28ba56b2cbc', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 49, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(906, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(907, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(908, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(909, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(910, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(911, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(912, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(913, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(914, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(915, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(916, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(917, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(918, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(919, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(920, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(921, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(922, '6c803088-0e5e-4dad-9aa2-b6538d048280', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 1, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(923, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(924, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(925, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(926, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(927, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(928, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(929, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(930, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(931, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(932, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(933, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(934, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(935, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(936, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(937, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(938, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(939, 'a785145e-05ee-4af2-9fbf-d79044418aa7', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 15, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(940, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(941, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(942, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(943, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(944, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(945, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(946, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(947, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(948, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(949, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(950, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(951, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(952, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(953, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(954, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(955, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(956, '7c70a7e8-7568-4727-accd-cf83d20b2ba9', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 27, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(957, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(958, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(959, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(960, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(961, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(962, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(963, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(964, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(965, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(966, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(967, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(968, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(969, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(970, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(971, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(972, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(973, 'ddf4e96c-ee5c-400c-9260-dd65cf342f5a', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 11, '10:30:00', '12:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(974, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(975, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(976, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(977, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(978, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(979, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(980, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(981, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(982, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(983, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(984, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(985, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(986, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(987, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(988, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(989, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(990, '379b2e35-7072-4d79-b34a-8a64fb3fb555', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 40, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(991, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(992, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(993, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(994, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(995, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(996, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(997, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(998, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(999, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1000, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1001, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1002, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1003, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1004, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1005, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1006, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1007, '0f6d7731-0c60-4ec4-aaf8-1b6a06bd9cd8', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 23, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1008, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1009, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1010, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1011, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1012, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1013, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1014, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1015, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1016, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1017, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1018, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1019, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1020, '0806f392-265a-413e-97bb-9cf9e72a4078', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1021, '0806f392-265a-413e-97bb-9cf9e72a4078', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1022, '0806f392-265a-413e-97bb-9cf9e72a4078', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1023, '0806f392-265a-413e-97bb-9cf9e72a4078', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1024, '0806f392-265a-413e-97bb-9cf9e72a4078', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 7, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 35, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1025, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1026, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1027, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1028, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1029, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1030, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1031, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1032, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1033, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1034, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1035, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1036, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1037, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1038, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1039, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1040, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1041, 'd2d15372-59ec-4cd9-a743-e10cf160ecbe', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 4, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 11, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 2 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1042, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1043, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1044, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1045, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1046, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1047, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1048, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1049, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1050, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1051, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1052, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1053, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1054, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1055, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1056, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1057, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1058, 'd8c8e3f6-0378-4b29-801c-1f63d1eab93f', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 3, NULL, NULL, 5, 5, 'Class Duty', 1, 8, 3, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section A', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1059, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1060, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1061, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1062, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1063, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1064, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1065, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1066, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1067, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1068, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1069, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1070, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1071, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1072, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1073, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1074, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1075, '0dba2abf-fbf3-41e1-abcf-2ab3f9463fea', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 12, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 5, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 1 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1076, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1077, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1078, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1079, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38');
INSERT INTO `tblrosterassignment` (`RosterAssignmentID`, `RosterSeriesID`, `RosterDate`, `SeriesStartDate`, `SeriesEndDate`, `RepeatMode`, `Weekdays`, `RosterPersonID`, `ProxyPersonID`, `RosterShiftID`, `RosterLocationID`, `DeviceID`, `AssignmentType`, `DepartmentID`, `BatchID`, `SubjectID`, `StartTime`, `EndTime`, `CrossesMidnight`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `Status`, `Remarks`, `created_at`, `updated_at`) VALUES
(1080, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1081, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1082, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1083, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1084, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1085, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1086, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1087, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1088, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1089, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1090, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1091, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1092, 'a55d47e3-e77a-4fe0-a168-e582934e1f31', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 5, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 51, '12:00:00', '13:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1093, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1094, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1095, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1096, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1097, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1098, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1099, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1100, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1101, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1102, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1103, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1104, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1105, '44277a26-d172-4013-ad28-f8b02e8d9010', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1106, '44277a26-d172-4013-ad28-f8b02e8d9010', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1107, '44277a26-d172-4013-ad28-f8b02e8d9010', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1108, '44277a26-d172-4013-ad28-f8b02e8d9010', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1109, '44277a26-d172-4013-ad28-f8b02e8d9010', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 6, NULL, NULL, 1, 1, 'Class Duty', 1, 8, 39, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1110, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1111, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1112, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1113, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1114, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1115, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1116, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1117, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1118, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1119, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1120, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1121, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1122, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1123, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1124, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1125, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1126, '9b013e9f-6d5c-46cb-bc13-48d81da34833', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 57, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1127, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1128, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1129, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1130, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1131, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1132, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1133, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1134, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1135, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1136, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1137, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1138, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1139, '372f78c9-0729-4f50-9a79-a57dac699015', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1140, '372f78c9-0729-4f50-9a79-a57dac699015', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1141, '372f78c9-0729-4f50-9a79-a57dac699015', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1142, '372f78c9-0729-4f50-9a79-a57dac699015', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1143, '372f78c9-0729-4f50-9a79-a57dac699015', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 10, NULL, NULL, 4, 4, 'Class Duty', 1, 8, 25, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 1 | Section B', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1144, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1145, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1146, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1147, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1148, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1149, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1150, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1151, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1152, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1153, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1154, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1155, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1156, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1157, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1158, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1159, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1160, '27d93881-ab52-4ffd-8c68-69e2a9aee39e', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 9, NULL, NULL, 6, 6, 'Class Duty', 1, 8, 37, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 2 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1161, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1162, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1163, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1164, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1165, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1166, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1167, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1168, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1169, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1170, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1171, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1172, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1173, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1174, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1175, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1176, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1177, '84f113d3-0ec8-4091-b79f-372d278a5ff5', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 8, NULL, NULL, 7, 7, 'Class Duty', 1, 8, 50, '14:00:00', '15:30:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 2', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1178, '7e34d061-c160-47d9-babc-51423985d74a', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1179, '7e34d061-c160-47d9-babc-51423985d74a', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1180, '7e34d061-c160-47d9-babc-51423985d74a', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1181, '7e34d061-c160-47d9-babc-51423985d74a', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1182, '7e34d061-c160-47d9-babc-51423985d74a', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1183, '7e34d061-c160-47d9-babc-51423985d74a', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:38', '2026-11-05 06:36:38'),
(1184, '7e34d061-c160-47d9-babc-51423985d74a', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1185, '7e34d061-c160-47d9-babc-51423985d74a', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1186, '7e34d061-c160-47d9-babc-51423985d74a', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1187, '7e34d061-c160-47d9-babc-51423985d74a', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1188, '7e34d061-c160-47d9-babc-51423985d74a', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1189, '7e34d061-c160-47d9-babc-51423985d74a', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1190, '7e34d061-c160-47d9-babc-51423985d74a', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1191, '7e34d061-c160-47d9-babc-51423985d74a', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1192, '7e34d061-c160-47d9-babc-51423985d74a', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1193, '7e34d061-c160-47d9-babc-51423985d74a', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1194, '7e34d061-c160-47d9-babc-51423985d74a', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 1, NULL, NULL, 2, 2, 'Class Duty', 1, 8, 41, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 3 | Term 1', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1195, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-10-06', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1196, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-10-13', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1197, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-10-20', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1198, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-10-27', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1199, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-11-03', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1200, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-11-10', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1201, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-11-17', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1202, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-11-24', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1203, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-12-01', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1204, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-12-08', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1205, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-12-15', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1206, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-12-22', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1207, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2026-12-29', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1208, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2027-01-05', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1209, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2027-01-12', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1210, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2027-01-19', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39'),
(1211, '37a365e1-57c1-457a-9a74-6dde722faeb5', '2027-01-26', '2026-10-01', '2027-01-31', 'Weekly', '[2]', 19, NULL, NULL, 3, 3, 'Class Duty', 1, 8, 60, '15:30:00', '17:00:00', 0, 15, 10, 10, 15, 'Active', 'Level 4 | Term 2', '2026-11-05 06:36:39', '2026-11-05 06:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblrosterlocation`
--

CREATE TABLE `tblrosterlocation` (
  `RosterLocationID` bigint UNSIGNED NOT NULL,
  `LocationName` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LocationType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DeviceID` bigint UNSIGNED DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblrosterlocation`
--

INSERT INTO `tblrosterlocation` (`RosterLocationID`, `LocationName`, `LocationType`, `Description`, `DeviceID`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'Room - 301', 'Class Room', '2nd Floor', 1, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(2, 'Room - 302', 'Class Room', '2nd Floor', 2, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(3, 'Room - 303', 'Class Room', '2nd Floor', 3, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(4, 'Room - 309', 'Class Room', '2nd Floor', 4, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(5, 'Room - 405', 'Class Room', '3rd Floor', 5, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(6, 'Room - 406', 'Class Room', '3rd Floor', 6, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(7, 'Room - 409', 'Moot Court', '3rd Floor', 7, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(8, 'Room - 401', 'Class Room', '4th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(9, 'Room - 402', 'Class Room', '4th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(10, 'Room - 403', 'Class Room', '4th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(11, 'Room - 404', 'Class Room', '4th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(12, 'Room - 502', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(13, 'Room - 503', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(14, 'Room - 504', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(15, 'Room - 505', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(16, 'Room - 506', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(17, 'Room - 507', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(18, 'Room - 508', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(19, 'Room - 516', 'Class Room', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(20, 'Room - 515', 'Computer Lab', '5th Floor', NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(21, 'Room - 106', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(22, 'Room - 203', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(23, 'Room - 206', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(24, 'Room - 207', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(25, 'Room - 208', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(26, 'Room - 209', 'Class Room', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(27, 'Drawing Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(28, 'AutoCAD Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(29, 'Transport Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(30, 'Water Resource Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(31, 'Environmental Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15'),
(32, 'Materials Lab', 'Lab', NULL, NULL, 1, '2026-11-05 06:10:15', '2026-11-05 06:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblrosterperson`
--

CREATE TABLE `tblrosterperson` (
  `RosterPersonID` bigint UNSIGNED NOT NULL,
  `SourceTeacherID` bigint UNSIGNED DEFAULT NULL,
  `EmployeeCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShortName` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoleName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DepartmentName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DepartmentID` bigint UNSIGNED DEFAULT NULL,
  `DesignationID` bigint UNSIGNED DEFAULT NULL,
  `RunsRoster` tinyint(1) NOT NULL DEFAULT '1',
  `WorkMode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `ZKUserID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblrosterperson`
--

INSERT INTO `tblrosterperson` (`RosterPersonID`, `SourceTeacherID`, `EmployeeCode`, `PersonName`, `ShortName`, `RoleName`, `DepartmentName`, `DepartmentID`, `DesignationID`, `RunsRoster`, `WorkMode`, `ZKUserID`, `Status`, `created_at`, `updated_at`) VALUES
(1, NULL, '22-71-08', 'Dr. Md. Nayem Alimul Hyder', 'NAH', 'Associate Professor and Head of the Department', 'Law', 1, 4, 1, 'Both', '22-71-08', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(2, NULL, '19-71-05', 'Mst. Rezwana Karim', 'MRK', 'Assistant Professor', 'Law', 1, 5, 1, 'Both', '19-71-05', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(3, NULL, '19-71-06', 'Dipannita Kundu Rumki', 'DKR', 'Assistant Professor', 'Law', 1, 5, 1, 'Both', '19-71-06', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(4, NULL, '24-71-13', 'Tanjila Tamanna', 'TT', 'Assistant Professor & Program Coordinator', 'Law', 1, 6, 1, 'Both', '24-71-13', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(5, NULL, '22-71-09', 'Shadab Bin Ashraf', 'SBA', 'Assistant Professor', 'Law', 1, 5, 1, 'Both', '22-71-09', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(6, NULL, '22-71-10', 'Nadia Islam Nody', 'NIN', 'Assistant Professor', 'Law', 1, 5, 1, 'Both', '22-71-10', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(7, NULL, '23-71-11', 'Md Shamim Ahmed', 'MSA', 'Assistant Professor', 'Law', 1, 5, 1, 'Both', '23-71-11', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(8, NULL, '24-71-15', 'Lamia Dilshad Waziha', 'LDW', 'Lecturer', 'Law', 1, 7, 1, 'Both', '24-71-15', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(9, NULL, '25-71-17', 'Saimur Rahman', 'SR', 'Lecturer', 'Law', 1, 7, 1, 'Both', '25-71-17', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(10, NULL, '26-71-19', 'Sadd Been Hossain Fahim', 'SBF', 'Lecturer', 'Law', 1, 7, 1, 'Both', '26-71-19', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(11, NULL, '26-41-36', 'Nafis Ahmed Bhuiyan', 'NAB', 'Lecturer', 'English', 2, 7, 1, 'Both', '26-41-36', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(12, NULL, '26-41-37', 'Anisur Rahman', 'ANR', 'Lecturer', 'English', 2, 7, 1, 'Both', '26-41-37', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(13, NULL, '24-11-61', 'Saad Bin Kamal', 'SBK', 'Lecturer', 'Computer Science & Engineering', 3, 7, 1, 'Both', '24-11-61', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(14, NULL, '25-42-41', 'Sharmin Akter', 'SHA', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', '25-42-41', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(15, NULL, '26-42-49', 'Nazmul Alam Ridoy', 'NAR', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', '26-42-49', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(16, NULL, '26-71-20', 'Saud Hasan', 'SH', 'District & Sessions Judge', 'Adjunct Faculty', 7, 8, 1, 'Both', '26-71-20', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(17, NULL, '26-71-21', 'Dr. Jannatul Ferdous', 'JF', 'Professor, Comilla University', 'Adjunct Faculty', 7, 9, 1, 'Both', '26-71-21', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(18, NULL, '26-71-23', 'Sabbir Ahmed Mukim', 'SAM', 'Advocate', 'Adjunct Faculty', 7, 10, 1, 'Both', '26-71-23', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(19, NULL, '26-71-22', 'Rafiqul Islam Hossaini', 'RIH', 'Advocate', 'Adjunct Faculty', 7, 10, 1, 'Both', '26-71-22', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(20, NULL, '26-71-24', 'Manik Das', 'MD', 'Joint District & Sessions Judge', 'Adjunct Faculty', 7, 11, 1, 'Both', '26-71-24', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(21, NULL, '18-31-16', 'Dr. Md. Tahidur Rahman', 'TR', 'Professor & Dean', 'Business Administration', 5, 1, 1, 'Both', '18-31-16', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(22, NULL, '16-31-003', 'Dr. Fatema Johara', 'FJ', 'Professor & Head', 'Business Administration', 5, 2, 1, 'Both', '16-31-003', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(23, NULL, '16-31-007', 'Dr. Mohammad Shariful Islam', 'MSI', 'Associate Professor', 'Business Administration', 5, 3, 1, 'Both', '16-31-007', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(24, NULL, '18-31-17', 'Md. Ariful Haque Chowdhury', 'AHC', 'Associate Professor', 'Business Administration', 5, 3, 1, 'Both', '18-31-17', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(25, NULL, '22-31-33', 'Md. Shahanur Islam', 'SI', 'Associate Professor', 'Business Administration', 5, 3, 1, 'Both', '22-31-33', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(26, NULL, '22-31-34', 'Tawhid Ahmed Chowdhury', 'TAC', 'Assistant Professor', 'Business Administration', 5, 5, 1, 'Both', '22-31-34', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(27, NULL, '18-31-19', 'Rebaka Sultana', 'RS', 'Assistant Professor', 'Business Administration', 5, 5, 1, 'Both', '18-31-19', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(28, NULL, '19-31-25', 'Farhana Jesmin', 'FJS', 'Assistant Professor', 'Business Administration', 5, 5, 1, 'Both', '19-31-25', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(29, NULL, '20-31-28', 'Fatema Tuz Zohora', 'FTZ', 'Assistant Professor', 'Business Administration', 5, 5, 1, 'Both', '20-31-28', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(30, NULL, '24-31-38', 'Md Abdullah Al Noman', 'AN', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '24-31-38', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(31, NULL, '24-31-37', 'Yeakub Ali', 'YA', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '24-31-37', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(32, NULL, '24-31-39', 'Sabiha Shirin Sara', 'SSS', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '24-31-39', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(33, NULL, '25-31-41', 'Shipa Akter', 'SHA', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '25-31-41', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(34, NULL, '25-31-43', 'Tahsin Mamun Prottoy', 'TMP', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '25-31-43', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(35, NULL, '45-31-44', 'Imran Hossain', 'IH', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '45-31-44', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(36, NULL, '26-31-46', 'Dr. Aklima Akter', 'AA', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '26-31-46', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(37, NULL, '26-31-47', 'Md. Sabbir Ahmed Mayen', 'SAM', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '26-31-47', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(38, NULL, '26-31-48', 'Mirza Shakil', 'MS', 'Lecturer', 'Business Administration', 5, 7, 1, 'Both', '26-31-48', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(39, NULL, '23-21-29', 'Md Imam Hossain', 'IH', 'Assistant Professor', 'Communication Engineering', 4, 5, 1, 'Both', 'IH', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(40, NULL, '24-21-35', 'Lutfar Rahman Talukder', 'LR', 'Assistant Professor', 'Communication Engineering', 4, 5, 1, 'Both', 'LR', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(41, NULL, '19-21-16', 'Ann Nazmun Sakib', 'ANS', 'Assistant Professor', 'Communication Engineering', 4, 5, 1, 'Both', 'ANS', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(42, NULL, '21-21-23', 'Arman Hossain Patwary', 'AHP', 'Lecturer', 'Communication Engineering', 4, 7, 1, 'Both', 'AHP', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(43, NULL, '25-21-40', 'Arshil Azeem', 'AA', 'Lecturer', 'Communication Engineering', 4, 7, 1, 'Both', 'AA', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(44, NULL, '25-21-42', 'S.M Tanvir Ahmed', 'TA', 'Lecturer', 'Communication Engineering', 4, 7, 1, 'Both', 'TA', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(45, NULL, '26-21-46', 'Md. Tahmidul Islam', 'MTI', 'Lecturer', 'Communication Engineering', 4, 7, 1, 'Both', 'MTI', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(46, NULL, '26-21-45', 'Jannatul Akmum', 'JA', 'Lecturer', 'Communication Engineering', 4, 7, 1, 'Both', 'JA', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(47, NULL, '22-21-28', 'Md Belal Hossain', NULL, 'Lab Technician', 'Communication Engineering', 4, 12, 1, 'Both', '22-21-28', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(48, NULL, '22-21-25', 'Md Saiful Islam', NULL, 'Lab Technician', 'Communication Engineering', 4, 12, 1, 'Both', '22-21-25', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(49, NULL, '25-21-38', 'Fazle Rabbi Rakib', NULL, 'Computer Operator', 'Communication Engineering', 4, 13, 1, 'Both', '25-21-38', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(50, NULL, '24-21-34', 'Md. Rafi Mahmud', NULL, 'Lab Assistant', 'Communication Engineering', 4, 14, 1, 'Both', '24-21-34', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(51, NULL, '25-21-41', 'Md. Raquib Uddin Sorkar', NULL, 'Lab Assistant', 'Communication Engineering', 4, 14, 1, 'Both', '25-21-41', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(52, NULL, '17-02-52', 'Md Abu Sayed Rony', NULL, 'Lab Attendant', 'Communication Engineering', 4, 15, 1, 'Both', '17-02-52', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(53, NULL, '26-21-44', 'Md. Obaidullah Sobhani', NULL, 'Messenger', 'Communication Engineering', 4, 16, 1, 'Both', '26-21-44', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(54, NULL, 'MNI', 'Dr. Md. Nazrul Islam', 'MNI', 'Associate Professor', 'Science & Humanities', 6, 3, 1, 'Both', 'MNI', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(55, NULL, 'MGM', 'Md. Gulam Mustafa', 'MGM', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'MGM', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(56, NULL, 'YAA', 'Md. Yasir Arafat Arman', 'YAA', 'Assistant Professor', 'Science & Humanities', 6, 5, 1, 'Both', 'YAA', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(57, NULL, 'TT', 'Tazin Tamanna', 'TT', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'TT', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(58, NULL, 'SA', 'Sharmin Akther', 'SA', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'SA', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(59, NULL, 'SHT', 'Sajjad Hossain Tamim', 'SHT', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'SHT', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(60, NULL, 'MMH', 'Md. Mehadi Hasan', 'MMH', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'MMH', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(61, NULL, 'MJM', 'Md. Jaman Mia', 'MJM', 'Lecturer', 'Science & Humanities', 6, 7, 1, 'Both', 'MJM', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(62, NULL, 'AI', 'Afroz Islam', 'AI', 'Lecturer', 'Computer Science & Engineering', 3, 7, 1, 'Both', 'AI', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(63, NULL, 'NM', 'Nafisa Maliyat', 'NM', 'Lecturer', 'English', 2, 7, 1, 'Both', 'NM', 1, '2026-11-05 06:09:52', '2026-11-05 06:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblrostersetting`
--

CREATE TABLE `tblrostersetting` (
  `id` bigint UNSIGNED NOT NULL,
  `EntryEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `EntryLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblrostersetting`
--

INSERT INTO `tblrostersetting` (`id`, `EntryEarlyMinutes`, `EntryLateMinutes`, `ExitEarlyMinutes`, `ExitLateMinutes`, `created_at`, `updated_at`) VALUES
(1, 15, 10, 10, 15, '2026-11-05 06:09:38', '2026-11-05 06:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblrostershift`
--

CREATE TABLE `tblrostershift` (
  `RosterShiftID` bigint UNSIGNED NOT NULL,
  `ShiftName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CrossesMidnight` tinyint(1) NOT NULL DEFAULT '0',
  `EntryEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `EntryLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitEarlyMinutes` smallint UNSIGNED NOT NULL DEFAULT '10',
  `ExitLateMinutes` smallint UNSIGNED NOT NULL DEFAULT '15',
  `RequiredPeople` smallint UNSIGNED NOT NULL DEFAULT '1',
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblroutine`
--

CREATE TABLE `tblroutine` (
  `RoutineID` bigint UNSIGNED NOT NULL,
  `RoutineDate` date NOT NULL,
  `SemesterStartDate` date DEFAULT NULL,
  `SemesterEndDate` date DEFAULT NULL,
  `TeacherID` bigint UNSIGNED NOT NULL,
  `ProxyTeacherID` bigint UNSIGNED DEFAULT NULL,
  `SubjectID` bigint UNSIGNED NOT NULL,
  `BatchID` bigint UNSIGNED NOT NULL,
  `RoomID` bigint UNSIGNED NOT NULL,
  `DeviceID` bigint UNSIGNED NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `GraceMinute` int NOT NULL DEFAULT '0',
  `DayName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassType` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text COLLATE utf8mb4_unicode_ci,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblshift`
--

CREATE TABLE `tblshift` (
  `id` bigint UNSIGNED NOT NULL,
  `shiftName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` time NOT NULL,
  `workinghour` decimal(5,2) NOT NULL,
  `ysnActive` tinyint(1) NOT NULL DEFAULT '1',
  `daystart` time DEFAULT NULL,
  `dayhour` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubject`
--

CREATE TABLE `tblsubject` (
  `SubjectID` bigint UNSIGNED NOT NULL,
  `Code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SubjectName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DepartmentID` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblsubject`
--

INSERT INTO `tblsubject` (`SubjectID`, `Code`, `SubjectName`, `DepartmentID`, `created_at`, `updated_at`) VALUES
(1, '4211101', 'Jurisprudence and Legal Theory (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(2, '4211101', 'Jurisprudence and Legal Theory (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(3, '4211102', 'Legal History and Legal System of Bangladesh (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(4, '4211102', 'Legal History and Legal System of Bangladesh (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(5, '2311101', 'Functional English (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(6, '2311101', 'Functional English (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(7, '2301102', 'English for Law (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(8, '2301102', 'English for Law (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(9, '4211203', 'Constitutional Law of Bangladesh and Interpretation of Statutes(Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(10, '4211203', 'Constitutional Law of Bangladesh and Interpretation of Statutes (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(11, '4211204', 'Law of Torts and Consumer Protection(Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(12, '4211204', 'Law of Torts and Consumer Protection (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(13, '4211205', 'Muslim Law (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(14, '4211205', 'Muslim Law (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(15, '4211206', 'Law of Contract (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(16, '4211206', 'Law of Contract (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(17, '6111203', 'Computer and Its Application (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(18, '6111203', 'Computer and Its Application (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(19, '2311204', 'Public Speaking (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(20, '2311204', 'Public Speaking (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(21, '4212101', 'Company and Securities Law (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(22, '4212101', 'Company and Securities Law (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(23, '4212102', 'Law of Equity and Trust (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(24, '4212102', 'Law of Equity and Trust (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(25, '4212103', 'Law of Partnership and Insurance (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(26, '4212103', 'Law of Partnership and Insurance (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(27, '4212104', 'Hindu Law and Christian Law (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(28, '4212104', 'Hindu Law and Christian Law (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(29, '3122105', 'Government and Politics (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(30, '3122105', 'Government and Politics (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(31, '2322106', 'Bangla Language and Literature (Section A)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(32, '2322106', 'Bangla Language and Literature (Section B)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(33, '4212205', 'Media and Information Technology Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(34, '4212206', 'Public International Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(35, '4212207', 'Land Laws of Bangladesh', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(36, '4212208', 'Sale of Goods and Carriage of Goods', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(37, '4212209', 'Law of Banking and Money Laundering Prevention', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(38, '2222207', 'Bangladesh Studies', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(39, '4213101', 'Environmental Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(40, '4213102', 'Fiscal Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(41, '4213103', 'Intellectual Property Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(42, '4213104', 'Law of Specific Relief, Limitation and Public Demand Recovery', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(43, '4213105', 'Law of Transfer of Property and Registration', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(44, '3183108', 'Criminology & Criminal Administration', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(45, 'LAW 3206', 'Law of Crimes I', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(46, 'LAW 3207', 'Labour Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(47, 'LAW 3208', 'Law of Civil Procedure I', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(48, 'LAW 3209', 'Law of Criminal Procedure I', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(49, 'GED 3209', 'Introduction to International Relations', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(50, 'GED 3210', 'Introduction to Economics', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(51, 'LAW 4101', 'Law of Crimes II', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(52, 'LAW 4102', 'Law of Civil Procedure II', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(53, 'LAW 4103', 'Law of Criminal Procedure II', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(54, 'LAW 4104', 'Law of Evidence', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(55, 'LAW 4105', 'Medical Jurisprudence', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(56, 'GED 4111', 'Peace and Conflict Studies', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(57, 'LAW 4206', 'Legal Research and Monograph', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(58, 'LAW 4207', 'Mock Trial & Advocacy (Civil and Criminal)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(59, 'LAW 4208', 'Law of Alternative Dispute Resolution', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(60, 'LAW 4209', 'Legal Drafting (Civil and Criminal)', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(61, 'LAW 4210', 'International Human Rights Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(62, 'LAW 4211', 'Administrative Law', 1, '2026-11-05 06:10:07', '2026-11-05 06:10:07'),
(63, 'ACC4705', 'Cost Accounting', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(64, 'FIN4706', 'Working Capital Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(65, 'FIN4703', 'Financial Institutions & Markets', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(66, 'FIN4812', 'Insurance & Risk Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(67, 'FIN4704', 'Corporate Finance', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(68, 'HRM4810', 'Training & Development', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(69, 'MKT4814', 'E-Marketing', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(70, 'HRM4703', 'Industrial Relations', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(71, 'HRM4704', 'Conflict Management and Negotiation', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(72, 'HRM4702', 'Career Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(73, 'GED3616', 'Ethics and Sustainability', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(74, 'MGT4802', 'Strategic Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(75, 'ACC4704', 'Advanced Accounting', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(76, 'ACC4811', 'Accounting based on IFRS', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(77, 'FIN4705', 'Investment Analysis and Portfolio Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(78, 'FIN4811', 'Bank Fund Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(79, 'MKT4812', 'Integrated Marketing Communication', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(80, 'MKT4704', 'Consumer Behavior', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(81, 'HRM4809', 'Strategic HRM', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(82, 'HRM4812', 'Compensation Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(83, 'GED1208', 'Introduction to Sociology and Psychology', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(84, 'GED1010', 'History of the Emergence of Independent Bangladesh', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(85, 'ACC1201', 'Principles of Accounting', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(86, 'MKT2301', 'Principles of Marketing', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(87, 'BUS3603', 'Legal Environment of Business', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(88, 'BUS1201', 'Business Communication', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(89, 'GED1202', 'Advanced Mathematics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(90, 'BUS2304', 'Microeconomics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(91, 'ACC2302', 'Intermediate Accounting', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(92, 'BUS2411', 'International Business Environment', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(93, 'GED3510', 'Advanced Statistics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(94, 'GED3511', 'Advanced Statistics Sessional*', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(95, 'FIN2402', 'Financial Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(96, 'BUS2407', 'Organizational Behavior', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(97, 'MKT2402', 'Marketing Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(98, 'GED3105', 'Computer Application in Business', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(99, 'GED3106', 'Computer Application in Business Sessional*', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(100, 'BUS3509', 'Macroeconomics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(101, 'FIN3503', 'Banking & Insurance', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(102, 'ACC3603', 'Management Accounting', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(103, 'HRM3501', 'Human Resources Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(104, 'BUS3510', 'Entrepreneurship Development', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(105, 'BUS3612', 'Research Methodology', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(106, 'BUS3614', 'Research Methodology Sessional*', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(107, 'BUS3613', 'Project Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(108, 'ACC2306', 'Taxation', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(109, 'BUS3601', 'Operation & Supply Chain Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(110, 'BUS4815', 'Industrial Attachment*', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(111, 'GED3615', 'Data Analytics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(112, 'ACC4707', 'Corporate Taxation', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(113, 'ACC4708', 'Auditing', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(114, 'ACC4709', 'Accounting Theory', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(115, 'GED1103', 'Functional English', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(116, 'GED1106', 'Functional English Sessional*', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(117, 'BUS1207', 'Introduction to Business', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(118, 'GED1104', 'Bangladesh Studies', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(119, 'GED1101', 'Fundamentals of Mathematics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(120, 'MGT1101', 'Principles of Management', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(121, 'GED2305', 'Fundamentals of Statistics', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(122, 'FIN2301', 'Principles of Finance', 5, '2026-11-05 06:10:10', '2026-11-05 06:10:10'),
(123, 'PHY-1101', 'Physics I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(124, 'MATH-1101', 'Mathematics I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(125, 'CHEM-1101', 'Chemistry I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(126, 'GED-1103', 'Sociology and Bangladesh Studies', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(127, 'CE-1101', 'Engineering Mechanics', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(128, 'CHEM-1102', 'Chemistry Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(129, 'LANG-1101', 'English', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(130, 'CE-1100', 'Civil Engineering Drawing', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(131, 'PHY-1203', 'Physics II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(132, 'MATH-1203', 'Mathematics II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(133, 'EEE-1265', 'Basic Electrical Technology', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(134, 'CE-1203', 'Surveying', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(135, 'LANG-1201', 'Bangla Language and Literature', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(136, 'LANG-1202', 'Developing English Language Skills', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(137, 'PHY-1202', 'Physics Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(138, 'CE-1210', 'Computer Aided Drawing', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(139, 'CE-1212', 'GIS and Remote sensing', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(140, 'CE-1204', 'Practical Surveying', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(141, 'MATH-2203', 'Mathematics IV', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(142, 'CE-2201', 'Engineering Materials', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(143, 'CE-2215', 'Numerical Methods', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(144, 'GED-2207', 'Socio-economic Aspects of Development Projects', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(145, 'CE-2213', 'Mechanics of Solids-II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(146, 'CE-2208', 'Quantity Surveying', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(147, 'CSE-2211', 'Engineering Computation Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(148, 'CE-2212', 'Structural Mechanics & Materials Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(149, 'GED-3113', 'Fundamentals of Research Methodology', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(150, 'CE-3111', 'Structural Analysis & Design-I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(151, 'CE-3115', 'Design of Concrete Structures-I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(152, 'CE-3131', 'Environmental Engineering-I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(153, 'CE-3141', 'Principle of Soil Mechanics', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(154, 'CE-3132', 'Environmental Engineering Laboratory', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(155, 'CE-3142', 'Geotechnical Engineering Sessional-I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(156, 'CE-3217', 'Design of Concrete Structures-II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(157, 'CE-3219', 'Design of Steel Structures', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(158, 'CE-3233', 'Environmental Engineering-II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(159, 'CE-3251', 'Fundamentals of Transportation Engineering', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(160, 'CE-3271', 'Open Channel Hydraulics', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(161, 'CE-3216', 'Design of Concrete Structures Sessional I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(162, 'CE-3212', 'Structural Analysis & Design Sessional-I', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(163, 'CE-3272', 'Open Channel Hydraulics Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(164, 'CE-3200', 'Civil Engineering Students’ Internship Programme (CESIP)', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(165, 'CE-4111', 'Structural Analysis & Design-II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(166, 'CE-4141', 'Foundation Engineering', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(167, 'CE-4151', 'Highway Materials, Pavement Design and Railway Engineering', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(168, 'CE-4163', 'Hydrology and Irrigation Engineering', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(169, 'CE-4110', 'Structural Analysis and Design Sessional-II', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(170, 'CE-4152', 'Highway Materials, Mix Design and Traffic Engineering Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(171, 'GED-4201', 'Project Planning and Construction Management', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(172, 'GED-4203', 'Professional Practice and Communication', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(173, 'CE-4215', 'Prestressed Concrete', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(174, 'CE-4219', 'Introduction to Finite Element Method', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(175, 'CE-4212', 'Bridge Design Sessional', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(176, 'CE-4233', 'Environmental Pollution and Management', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(177, 'CE-4239', 'Environmental Impact Assessment and Sustainability', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12'),
(178, 'CE-4232', 'Design of Water Supply, Sanitation and Sewerage System', 4, '2026-11-05 06:10:12', '2026-11-05 06:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `tblteacher`
--

CREATE TABLE `tblteacher` (
  `TeacherID` bigint UNSIGNED NOT NULL,
  `EmployeeID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TeacherName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DepartmentID` bigint UNSIGNED NOT NULL,
  `DesignationID` bigint UNSIGNED NOT NULL,
  `Mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZKUserID` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `RosterPersonID` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `RosterPersonID`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@baiust.com', NULL, '$2y$12$5XSEV9qT45UgCUNUeIqdZuFbjn38NPDcT3inRNkEtstYeAYMvhuX6', 'superadmin', NULL, NULL, '2026-11-05 06:09:50', '2026-11-05 06:09:50'),
(2, 'Dr. Md. Nayem Alimul Hyder', 'head.law@baiust.ac.bd', NULL, '$2y$12$yRG7ooiEb39mSTbydwDJyeszWqtw2m32OyIyqV4pkajbk2GdsOYlO', 'employee', 1, NULL, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(3, 'Mst. Rezwana Karim', 'rezwana.law@baiust.ac.bd', NULL, '$2y$12$eOMHxsqmZLpRCIexj0hLfeF4Xi.Y.prTUyoNaY8kCtcFh4SOmMVrO', 'employee', 2, NULL, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(4, 'Dipannita Kundu Rumki', 'drumki.law@baiust.ac.bd', NULL, '$2y$12$JNuD33ZFSXpe5DeuBDP7l.8bmyw53EBOpHks.a/7OZ9rOPmVtiD6i', 'employee', 3, NULL, '2026-11-05 06:09:52', '2026-11-05 06:09:52'),
(5, 'Tanjila Tamanna', 'tanjila.law@baiust.ac.bd', NULL, '$2y$12$.YxtrK5sShu75YUv5J0k3uAvDyRLGJOoYFlMFpDDKN8iXZvnBNHRC', 'employee', 4, NULL, '2026-11-05 06:09:53', '2026-11-05 06:09:53'),
(6, 'Shadab Bin Ashraf', 'ashraf.law@baiust.ac.bd', NULL, '$2y$12$eEk6usfQOoOrEupWnr9UhuuxiGcvXDJatKMXcF.ijdqyP5sHzQoQa', 'employee', 5, NULL, '2026-11-05 06:09:53', '2026-11-05 06:09:53'),
(7, 'Nadia Islam Nody', 'nadia.law@baiust.ac.bd', NULL, '$2y$12$VFfnAiwYgxW1TuF/4HeJpOI.stUYlQnGzY0t.TmlMSXRKismdPyru', 'employee', 6, NULL, '2026-11-05 06:09:53', '2026-11-05 06:09:53'),
(8, 'Md Shamim Ahmed', 'mdshamim.law@baiust.ac.bd', NULL, '$2y$12$jx7lXA3eqhOefs1U32czPuX5wMklo0n2MZn4AV9Wqf3scY9U7w4Qm', 'employee', 7, NULL, '2026-11-05 06:09:54', '2026-11-05 06:09:54'),
(9, 'Lamia Dilshad Waziha', 'lamia.law@baiust.ac.bd', NULL, '$2y$12$aOljwdOT3/gCt.wx5t0U5.x8FRk.uRhj/m8Gkuj3rBwRf9VsgaDJC', 'employee', 8, NULL, '2026-11-05 06:09:54', '2026-11-05 06:09:54'),
(10, 'Saimur Rahman', 'saimur.law@baiust.ac.bd', NULL, '$2y$12$Az5iFuV.zOaMQegjYemyBuMbUO5F5oRzfU/zoNl8VaiB.pRwrktP.', 'employee', 9, NULL, '2026-11-05 06:09:54', '2026-11-05 06:09:54'),
(11, 'Sadd Been Hossain Fahim', 'fahim.law@baiust.ac.bd', NULL, '$2y$12$XLugjMVMRvlS.HKV.4RH5u0zqLscBzp52rDWxkP0BIwv.HnlhWVkK', 'employee', 10, NULL, '2026-11-05 06:09:55', '2026-11-05 06:09:55'),
(12, 'Nafis Ahmed Bhuiyan', 'nafis.english@baiust.ac.bd', NULL, '$2y$12$sN1bVdqvuV3fgWbp336tROfO8q81QZJ2oECz1i9c2Juu2tHO0ETAO', 'employee', 11, NULL, '2026-11-05 06:09:55', '2026-11-05 06:09:55'),
(13, 'Anisur Rahman', 'anis.english@baiust.ac.bd', NULL, '$2y$12$xXCXpMNTbOVpCHQ/xabh1O8J0BNdx7QLWHnWrJaERmAB3A63mBLmG', 'employee', 12, NULL, '2026-11-05 06:09:55', '2026-11-05 06:09:55'),
(14, 'Saad Bin Kamal', 'saad.cse@baiust.ac.bd', NULL, '$2y$12$VsAkAG1s7d2juuMjIohZvuJa0kY1lzk08sk5tOVqXkq0yCJuBJP6e', 'employee', 13, NULL, '2026-11-05 06:09:56', '2026-11-05 06:09:56'),
(15, 'Sharmin Akter', 'sharmin.scnhum@baiust.ac.bd', NULL, '$2y$12$.h9KaALFuRNLfimGZAyDW.QODVRwfrrjlIgb4nepn5D9KkOia35G.', 'employee', 14, NULL, '2026-11-05 06:09:56', '2026-11-05 06:09:56'),
(16, 'Nazmul Alam Ridoy', 'nazmul.scnhum@baiust.ac.bd', NULL, '$2y$12$ZKIUSPTfkIcG303w.CGWJu7OA7kKuvM8QQrqC4.1DTGUFFjx2oyea', 'employee', 15, NULL, '2026-11-05 06:09:56', '2026-11-05 06:09:56'),
(17, 'Saud Hasan', 'sauddu@gmail.com', NULL, '$2y$12$liKV45dou52dlaVyQySVneEE6EpIATYnvD4DwVB28azqAxBML2sP6', 'employee', 16, NULL, '2026-11-05 06:09:57', '2026-11-05 06:09:57'),
(18, 'Dr. Jannatul Ferdous', 'jannat.lata@yahoo.com', NULL, '$2y$12$Z5v4HVjlFvBu0u8v054Tx.BDZAgDPJapLYD1pv54AzjDrsKdRoTe6', 'employee', 17, NULL, '2026-11-05 06:09:57', '2026-11-05 06:09:57'),
(19, 'Sabbir Ahmed Mukim', 'samukim1@gmail.com', NULL, '$2y$12$Zwn/9RHVRVmYKZoP.QSJnOWNueBlu9V7assPlvkd4NTrCR8QoeKca', 'employee', 18, NULL, '2026-11-05 06:09:57', '2026-11-05 06:09:57'),
(20, 'Rafiqul Islam Hossaini', 'advrih@gmail.com', NULL, '$2y$12$wjUSqKgKJXNKo4STwx4qAugbIiVOeshzZLpLtW9qpiiZW2STNYfpa', 'employee', 19, NULL, '2026-11-05 06:09:57', '2026-11-05 06:09:57'),
(21, 'Manik Das', 'maniklaw88@gmail.com', NULL, '$2y$12$WVrz2Ov28vCaaDoeUVzpqO9zcrqtxPn7ogRzZAImEDgGXAHhvkQfm', 'employee', 20, NULL, '2026-11-05 06:09:58', '2026-11-05 06:09:58'),
(22, 'Dr. Md. Tahidur Rahman', 'tahidur.dba@baiust.ac.bd', NULL, '$2y$12$xx4cZvjGgzz3feanJHC1Q.9YZ01NYxdHMdpEde0JkU07PEzyJ/H5W', 'employee', 21, NULL, '2026-11-05 06:09:58', '2026-11-05 06:09:58'),
(23, 'Dr. Fatema Johara', 'fatema.dba@baiust.ac.bd', NULL, '$2y$12$P8ZNjJUu0cRPG14fGoNxDOQLU/u/KAurGHvl9BBttAIVsQUQ/maZi', 'employee', 22, NULL, '2026-11-05 06:09:58', '2026-11-05 06:09:58'),
(24, 'Dr. Mohammad Shariful Islam', 'shariful.dba@baiust.ac.bd', NULL, '$2y$12$.m8ACvumbsBFVfOprEbNzeZoYDICB/2U3xuZpwojK4jX6r4S6OhGO', 'employee', 23, NULL, '2026-11-05 06:09:59', '2026-11-05 06:09:59'),
(25, 'Md. Ariful Haque Chowdhury', 'ariful.dba@baiust.ac.bd', NULL, '$2y$12$OjDl6x4XF1uxMyFgaTzgLuidEV9vIw35QJ9COi4vQgxSiSMs.jOma', 'employee', 24, NULL, '2026-11-05 06:09:59', '2026-11-05 06:09:59'),
(26, 'Md. Shahanur Islam', 'shahanur.dba@baiust.ac.bd', NULL, '$2y$12$/hmTSiDSFRTBmqL7j90ea.eL6b1MWwvdNTmV0BmI3VdXJFu7Kk6ay', 'employee', 25, NULL, '2026-11-05 06:09:59', '2026-11-05 06:09:59'),
(27, 'Tawhid Ahmed Chowdhury', 'tawhid.dba@baiust.ac.bd', NULL, '$2y$12$P049C7psw9HsEh35yrxaQ.M/JVFerBXe./iMcgUWPQobJV0V4bTim', 'employee', 26, NULL, '2026-11-05 06:10:00', '2026-11-05 06:10:00'),
(28, 'Rebaka Sultana', 'rebaka.dba@baiust.ac.bd', NULL, '$2y$12$jHi/sPWDN7nWBdnpIx4uV.sBNezOxWfjSAKQmJ6u8AJSS1BvCEy96', 'employee', 27, NULL, '2026-11-05 06:10:00', '2026-11-05 06:10:00'),
(29, 'Farhana Jesmin', 'farjes.dba@baiust.ac.bd', NULL, '$2y$12$vuKdCU38yh07yn7a2kB0E.WME68Nm0KwXt0n0QogmM3QdU4vAT/dq', 'employee', 28, NULL, '2026-11-05 06:10:00', '2026-11-05 06:10:00'),
(30, 'Fatema Tuz Zohora', 'ftztarin.dba@baiust.ac.bd', NULL, '$2y$12$0UO2JlZ9oKGW19Pi6oJAgOCM7lRAdUqmtOdnzrfph3EoL/WNTfRgW', 'employee', 29, NULL, '2026-11-05 06:10:01', '2026-11-05 06:10:01'),
(31, 'Md Abdullah Al Noman', 'noman.dba@baiust.ac.bd', NULL, '$2y$12$5UUxnt5xt.pssifTwjxCo.vG6FL2qAfP.hSyBG3wbWiJ01IPs0DJK', 'employee', 30, NULL, '2026-11-05 06:10:01', '2026-11-05 06:10:01'),
(32, 'Yeakub Ali', 'yeakub.dba@baiust.ac.bd', NULL, '$2y$12$EoGnugIEAHwh/rvdiNT5ROea26Jc4oaRcoitcZypRWx7w3DYEb4PG', 'employee', 31, NULL, '2026-11-05 06:10:01', '2026-11-05 06:10:01'),
(33, 'Sabiha Shirin Sara', 'sara.dba@baiust.ac.bd', NULL, '$2y$12$pmHt71kxqUaKSHO7ODOPpOJDqcQpWopBSDsedIk4DlMEDRrYtN53O', 'employee', 32, NULL, '2026-11-05 06:10:02', '2026-11-05 06:10:02'),
(34, 'Shipa Akter', 'shipa.dba@baiust.ac.bd', NULL, '$2y$12$xRv0CWilfeKlPn4z/W7.Y.T5/gS7SHFK1oSi1AJtBZcjeQCOLCHfi', 'employee', 33, NULL, '2026-11-05 06:10:02', '2026-11-05 06:10:02'),
(35, 'Tahsin Mamun Prottoy', 'tahsin.dba@baiust.ac.bd', NULL, '$2y$12$mirDx/bwQ5ViwduW2Wu8jOzgjBcMu7LS7JSGgEBqqsj.Eiyj2OFka', 'employee', 34, NULL, '2026-11-05 06:10:02', '2026-11-05 06:10:02'),
(36, 'Imran Hossain', 'imran.dba@baiust.ac.bd', NULL, '$2y$12$5dfWId1IXFBWhhsbwGIJM.LtBsLX7JomCu4elxYaFL4pntKQ9/s72', 'employee', 35, NULL, '2026-11-05 06:10:02', '2026-11-05 06:10:02'),
(37, 'Dr. Aklima Akter', 'aklima3rd@yahoo.com', NULL, '$2y$12$i.49hvZNgx3kMU6ZbOZuZeEmU8pQQ/2tYz/oX5p/buC4uk/6IPKCK', 'employee', 36, NULL, '2026-11-05 06:10:03', '2026-11-05 06:10:03'),
(38, 'Md. Sabbir Ahmed Mayen', 'shabbirahmedmayen@gmail.com', NULL, '$2y$12$4Fe2nvHkD0QhrklTb2TCx.xoCFSmTGsjhufaapn22LXY7xWlPaG1y', 'employee', 37, NULL, '2026-11-05 06:10:03', '2026-11-05 06:10:03'),
(39, 'Mirza Shakil', 'shakilmirzajkknu@gmail.com', NULL, '$2y$12$CvGKHbjulxLh2sFoqg0uRO.DzV4Eoqk5oWJb.6v35UhZESW7nvuLO', 'employee', 38, NULL, '2026-11-05 06:10:03', '2026-11-05 06:10:03'),
(40, 'Md Imam Hossain', 'imam.ce@baiust.ac.bd', NULL, '$2y$12$SoakBI5554P7WCysL/551e5tJqQPGTrAi.iX0dmACuNR2IBW6N/DC', 'employee', 39, NULL, '2026-11-05 06:10:04', '2026-11-05 06:10:04'),
(41, 'Lutfar Rahman Talukder', 'lutfar.ce@baiust.ac.bd', NULL, '$2y$12$27S8q1LfXK.Uc/MJtzzPOuyJ1xynprexxSvpWiHe3fq5BBjZzl9PK', 'employee', 40, NULL, '2026-11-05 06:10:04', '2026-11-05 06:10:04'),
(42, 'Ann Nazmun Sakib', 'sakib.ce@baiust.ac.bd', NULL, '$2y$12$v6kyQ7RYEpLEzU9PktIb4eeqHJ5x6055jyIzjOh78mRinmGx6ap.a', 'employee', 41, NULL, '2026-11-05 06:10:04', '2026-11-05 06:10:04'),
(43, 'Arman Hossain Patwary', 'arman.ce@baiust.ac.bd', NULL, '$2y$12$Npp7Oq6BZJJ.ASb/a/nueepevf/BTTrXdn8bI/EC/XWZ5vQEFziEu', 'employee', 42, NULL, '2026-11-05 06:10:05', '2026-11-05 06:10:05'),
(44, 'Arshil Azeem', 'azeem.ce@baiust.ac.bd', NULL, '$2y$12$qciarV6S2PrFIHlkAEIbNe0fU0DmWlWRkCvV6IaJR.yvkUmDV692u', 'employee', 43, NULL, '2026-11-05 06:10:05', '2026-11-05 06:10:05'),
(45, 'S.M Tanvir Ahmed', 'tanvir.ce@baiust.ac.bd', NULL, '$2y$12$wSlMcoMXnT6IESKVIdlC6Of1WZa1uJqrte/AA8hAiMK79pCLlW1Ai', 'employee', 44, NULL, '2026-11-05 06:10:05', '2026-11-05 06:10:05'),
(46, 'Md. Tahmidul Islam', 'tahmidul.ce@baiust.ac.bd', NULL, '$2y$12$MXafo3BXOx.xqV2.eTy5puSDyw2ielzmppyhUdp/f6jygUEN7yYG2', 'employee', 45, NULL, '2026-11-05 06:10:05', '2026-11-05 06:10:05'),
(47, 'Jannatul Akmum', 'jannatul.ce@baiust.ac.bd', NULL, '$2y$12$K0./WRtU2zh3Ria/wwbqheS7pMuNr9ZLKiQE5QN36UC13hcs4nVrG', 'employee', 46, NULL, '2026-11-05 06:10:06', '2026-11-05 06:10:06'),
(48, 'Fazle Rabbi Rakib', 'sectionoffice.ce@baiust.ac.bd', NULL, '$2y$12$VhmPjFYt8MG4Kc4g8bvxiui05e/rqyZti0EfVwEEH12Ep.E5BD.qW', 'employee', 49, NULL, '2026-11-05 06:10:06', '2026-11-05 06:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_reason`
--

CREATE TABLE `visitor_reason` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visit_reason` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_reservation`
--

CREATE TABLE `visitor_reservation` (
  `workflowinstance_ptr_id` int NOT NULL,
  `vis_first_name` varchar(25) DEFAULT NULL,
  `vis_last_name` varchar(25) DEFAULT NULL,
  `cert_no` varchar(50) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `visit_quantity` int NOT NULL,
  `visit_date` datetime(6) NOT NULL,
  `apply_time` datetime(6) NOT NULL,
  `apply_reason` longtext,
  `cert_type_id` int NOT NULL,
  `visit_department_id` int DEFAULT NULL,
  `visit_reason_id` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitor`
--

CREATE TABLE `visitor_visitor` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_code` varchar(20) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `cert_no` varchar(50) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `ssn` varchar(20) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `visit_quantity` int NOT NULL,
  `entry_carrying_goods` varchar(200) DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `exit_time` datetime(6) DEFAULT NULL,
  `exit_carrying_goods` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `cert_type_id` int NOT NULL,
  `visit_department_id` int DEFAULT NULL,
  `visit_reason_id` int DEFAULT NULL,
  `visited_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitorbiodata`
--

CREATE TABLE `visitor_visitorbiodata` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `bio_tmp` longtext NOT NULL,
  `bio_no` int DEFAULT NULL,
  `bio_index` int DEFAULT NULL,
  `bio_type` int NOT NULL,
  `major_ver` varchar(30) NOT NULL,
  `minor_ver` varchar(30) DEFAULT NULL,
  `bio_format` int DEFAULT NULL,
  `valid` int NOT NULL,
  `duress` int NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `visitor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitorbiophoto`
--

CREATE TABLE `visitor_visitorbiophoto` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `enroll_sn` varchar(50) DEFAULT NULL,
  `register_photo` varchar(100) NOT NULL,
  `register_time` datetime(6) NOT NULL,
  `approval_photo` varchar(100) DEFAULT NULL,
  `approval_state` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `visitor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitorcertification`
--

CREATE TABLE `visitor_visitorcertification` (
  `id` int NOT NULL,
  `cert_code` varchar(20) NOT NULL,
  `cert_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitorconfig`
--

CREATE TABLE `visitor_visitorconfig` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `qr_code_policy` smallint NOT NULL,
  `code_prefix` varchar(5) NOT NULL,
  `code_width` int NOT NULL,
  `code_start` int NOT NULL,
  `access_limited` longtext,
  `auto_delete_data` smallint NOT NULL,
  `data_retention` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `visitor_visitorconfig`
--

INSERT INTO `visitor_visitorconfig` (`id`, `create_time`, `create_user`, `change_time`, `change_user`, `status`, `qr_code_policy`, `code_prefix`, `code_width`, `code_start`, `access_limited`, `auto_delete_data`, `data_retention`) VALUES
(1, '2026-11-05 12:20:15.341889', NULL, '2026-11-05 12:20:15.341889', NULL, 0, 1, 'V', 8, 1, NULL, 0, 9999);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitorlog`
--

CREATE TABLE `visitor_visitorlog` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_status` smallint DEFAULT NULL,
  `visitor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitortransaction`
--

CREATE TABLE `visitor_visitortransaction` (
  `id` int NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `create_user` varchar(150) DEFAULT NULL,
  `change_time` datetime(6) DEFAULT NULL,
  `change_user` varchar(150) DEFAULT NULL,
  `status` smallint NOT NULL,
  `visitor_code` varchar(50) NOT NULL,
  `area` varchar(30) NOT NULL,
  `punch_time` datetime(6) DEFAULT NULL,
  `punch_state` varchar(5) NOT NULL,
  `verify_type` int NOT NULL,
  `temperature` decimal(4,1) NOT NULL,
  `is_mask` int NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `source` smallint NOT NULL,
  `terminal_sn` varchar(50) DEFAULT NULL,
  `terminal_alias` varchar(50) DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `visitor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitor_acc_groups`
--

CREATE TABLE `visitor_visitor_acc_groups` (
  `id` int NOT NULL,
  `visitor_id` int NOT NULL,
  `accgroups_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_visitor_area`
--

CREATE TABLE `visitor_visitor_area` (
  `id` int NOT NULL,
  `visitor_id` int NOT NULL,
  `area_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_nodeinstance`
--

CREATE TABLE `workflow_nodeinstance` (
  `id` int NOT NULL,
  `node_name` varchar(30) NOT NULL,
  `order_id` int NOT NULL,
  `approval_status` smallint NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `approval_remark` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `targeted` tinyint(1) NOT NULL,
  `approver_employee_id` int DEFAULT NULL,
  `workflow_instance_id` int DEFAULT NULL,
  `workflow_node_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflowengine`
--

CREATE TABLE `workflow_workflowengine` (
  `id` int NOT NULL,
  `workflow_code` varchar(50) NOT NULL,
  `workflow_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `workflow_type` smallint NOT NULL,
  `applicant_position_id` int DEFAULT NULL,
  `content_type_id` int DEFAULT NULL,
  `departments_id` int DEFAULT NULL,
  `is_leave` tinyint(1) NOT NULL,
  `leave_type_id` int DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflowengine_employee`
--

CREATE TABLE `workflow_workflowengine_employee` (
  `id` int NOT NULL,
  `workflowengine_id` int NOT NULL,
  `employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflowinstance`
--

CREATE TABLE `workflow_workflowinstance` (
  `id` int NOT NULL,
  `approval_time` datetime(6) DEFAULT NULL,
  `approval_status` smallint NOT NULL,
  `approval_remark` longtext,
  `approver` varchar(30) DEFAULT NULL,
  `approver_instance` longtext,
  `employee_id` int NOT NULL,
  `workflow_engine_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflownode`
--

CREATE TABLE `workflow_workflownode` (
  `id` int NOT NULL,
  `node_name` varchar(30) NOT NULL,
  `order_id` int NOT NULL,
  `approver_by_overall` tinyint(1) NOT NULL,
  `notify_by_overall` tinyint(1) NOT NULL,
  `workflow_engine_id` int DEFAULT NULL,
  `from_day` int DEFAULT NULL,
  `to_day` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflownode_approver`
--

CREATE TABLE `workflow_workflownode_approver` (
  `id` int NOT NULL,
  `workflownode_id` int NOT NULL,
  `workflowrole_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflownode_notifier`
--

CREATE TABLE `workflow_workflownode_notifier` (
  `id` int NOT NULL,
  `workflownode_id` int NOT NULL,
  `workflowrole_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_workflowrole`
--

CREATE TABLE `workflow_workflowrole` (
  `id` int NOT NULL,
  `role_code` varchar(30) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `company_id` int NOT NULL,
  `parent_role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_adminbiodata`
--
ALTER TABLE `accounts_adminbiodata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_adminbiodata_admin_id_1e6d2d45_fk_auth_user_id` (`admin_id`);

--
-- Indexes for table `accounts_passwordresetkey`
--
ALTER TABLE `accounts_passwordresetkey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_usernotification`
--
ALTER TABLE `accounts_usernotification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_usernotific_employee_id_c98d9de8_fk_personnel` (`employee_id`),
  ADD KEY `accounts_usernotification_user_id_b86755b3_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `acc_acccombination`
--
ALTER TABLE `acc_acccombination`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_acccombination_area_id_combination_no_619eb4f5_uniq` (`area_id`,`combination_no`),
  ADD KEY `acc_acccombination_area_id_0d22c34e` (`area_id`);

--
-- Indexes for table `acc_accgroups`
--
ALTER TABLE `acc_accgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_accgroups_area_id_group_no_5130a89c_uniq` (`area_id`,`group_no`),
  ADD KEY `acc_accgroups_area_id_b83745c3` (`area_id`);

--
-- Indexes for table `acc_accholiday`
--
ALTER TABLE `acc_accholiday`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_accholiday_area_id_holiday_id_6630c2eb_uniq` (`area_id`,`holiday_id`),
  ADD KEY `acc_accholiday_area_id_d15c19da` (`area_id`),
  ADD KEY `acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id` (`holiday_id`),
  ADD KEY `acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id` (`timezone_id`);

--
-- Indexes for table `acc_accprivilege`
--
ALTER TABLE `acc_accprivilege`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_accprivilege_area_id_employee_id_group_id_f3b297d8_uniq` (`area_id`,`employee_id`,`group_id`),
  ADD KEY `acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id` (`employee_id`),
  ADD KEY `acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id` (`group_id`),
  ADD KEY `acc_accprivilege_area_id_2123ff6f` (`area_id`);

--
-- Indexes for table `acc_accterminal`
--
ALTER TABLE `acc_accterminal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id` (`terminal_id`);

--
-- Indexes for table `acc_acctimezone`
--
ALTER TABLE `acc_acctimezone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_acctimezone_area_id_timezone_no_0cb8250f_uniq` (`area_id`,`timezone_no`),
  ADD KEY `acc_acctimezone_area_id_e9ce7a7a` (`area_id`);

--
-- Indexes for table `attparam`
--
ALTER TABLE `attparam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attparam_paraname_paratype_6f176d25_uniq` (`paraname`,`paratype`);

--
-- Indexes for table `att_attcalclog`
--
ALTER TABLE `att_attcalclog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `att_attcode`
--
ALTER TABLE `att_attcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indexes for table `att_attemployee`
--
ALTER TABLE `att_attemployee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`),
  ADD KEY `att_attemployee_group_id_18d3954d_fk_att_attgroup_id` (`group_id`);

--
-- Indexes for table `att_attgroup`
--
ALTER TABLE `att_attgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_attgroup_company_id_code_0e94d13b_uniq` (`company_id`,`code`),
  ADD KEY `att_attgroup_company_id_cd1b54f8` (`company_id`);

--
-- Indexes for table `att_attpolicy`
--
ALTER TABLE `att_attpolicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_attpolicy_ot_pay_code_id_b189b952_fk_att_paycode_id` (`ot_pay_code_id`);

--
-- Indexes for table `att_attreportsetting`
--
ALTER TABLE `att_attreportsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `att_attrule`
--
ALTER TABLE `att_attrule`
  ADD PRIMARY KEY (`param_name`);

--
-- Indexes for table `att_attschedule`
--
ALTER TABLE `att_attschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_attschedule_employee_id_caa61686_fk_personnel_employee_id` (`employee_id`),
  ADD KEY `att_attschedule_shift_id_13d2db9a_fk_att_attshift_id` (`shift_id`);

--
-- Indexes for table `att_attshift`
--
ALTER TABLE `att_attshift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_attshift_company_id_2c0a4f56` (`company_id`);

--
-- Indexes for table `att_breaktime`
--
ALTER TABLE `att_breaktime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_breaktime_alias_6212d9cf_uniq` (`alias`),
  ADD KEY `att_breaktime_loss_code_id_2ffb5432_fk_att_paycode_id` (`loss_code_id`),
  ADD KEY `att_breaktime_profit_code_id_63cdbbcc_fk_att_paycode_id` (`profit_code_id`),
  ADD KEY `att_breaktime_company_id_fbb9a2b7` (`company_id`);

--
-- Indexes for table `att_calculatelastdate`
--
ALTER TABLE `att_calculatelastdate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_calculatelastdate_last_date_1441abdc` (`last_date`);

--
-- Indexes for table `att_calculatetask`
--
ALTER TABLE `att_calculatetask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_calculatetask_start_date_7bbaa889` (`start_date`),
  ADD KEY `att_calculatetask_end_date_75d1d6d2` (`end_date`);

--
-- Indexes for table `att_changeschedule`
--
ALTER TABLE `att_changeschedule`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `att_changeschedule_timeinterval_id_d41ac077_fk_att_timei` (`timeinterval_id`);

--
-- Indexes for table `att_departmentpolicy`
--
ALTER TABLE `att_departmentpolicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_departmentpolicy_department_id_77059a9d_fk_personnel` (`department_id`),
  ADD KEY `att_departmentpolicy_ot_pay_code_id_390411dd_fk_att_paycode_id` (`ot_pay_code_id`);

--
-- Indexes for table `att_departmentschedule`
--
ALTER TABLE `att_departmentschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_departmentschedu_department_id_c68fca3d_fk_personnel` (`department_id`),
  ADD KEY `att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id` (`shift_id`);

--
-- Indexes for table `att_deptattrule`
--
ALTER TABLE `att_deptattrule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_deptattrule_department_id_f333c8f0` (`department_id`);

--
-- Indexes for table `att_grouppolicy`
--
ALTER TABLE `att_grouppolicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_grouppolicy_group_id_b2e4dfe8_fk_att_attgroup_id` (`group_id`),
  ADD KEY `att_grouppolicy_ot_pay_code_id_1ec83080_fk_att_paycode_id` (`ot_pay_code_id`);

--
-- Indexes for table `att_groupschedule`
--
ALTER TABLE `att_groupschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_groupschedule_group_id_c341493f_fk_att_attgroup_id` (`group_id`),
  ADD KEY `att_groupschedule_shift_id_287e7fc0_fk_att_attshift_id` (`shift_id`),
  ADD KEY `att_groupschedule_start_date_638b6d85` (`start_date`);

--
-- Indexes for table `att_holiday`
--
ALTER TABLE `att_holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_holiday_department_id_fbbbd185` (`department_id`),
  ADD KEY `att_holiday_att_group_id_9ddf13ba_fk_att_attgroup_id` (`att_group_id`);

--
-- Indexes for table `att_leave`
--
ALTER TABLE `att_leave`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `att_leave_pay_code_id_2fadf493_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `att_leavegroup`
--
ALTER TABLE `att_leavegroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `att_leavegroup_company_id_a1c75fcb` (`company_id`);

--
-- Indexes for table `att_leavegroupdetail`
--
ALTER TABLE `att_leavegroupdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_leavegroupdetail_leave_group_id_28f69ada_fk_att_leave` (`leave_group_id`),
  ADD KEY `att_leavegroupdetail_pay_code_id_5013b373_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `att_leaveyearbalance`
--
ALTER TABLE `att_leaveyearbalance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_leaveyearbalance_employee_id_year_pay_code_id_2ec71517_uniq` (`employee_id`,`year`,`pay_code_id`),
  ADD KEY `att_leaveyearbalance_pay_code_id_82632aca_fk_att_paycode_id` (`pay_code_id`),
  ADD KEY `att_leaveyearbalance_employee_id_14febdb3` (`employee_id`);

--
-- Indexes for table `att_manuallog`
--
ALTER TABLE `att_manuallog`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `att_manuallog_work_code_id_09ac4580` (`work_code_id`);

--
-- Indexes for table `att_overtime`
--
ALTER TABLE `att_overtime`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `att_overtime_pay_code_id_05600ee0_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `att_overtimepolicy`
--
ALTER TABLE `att_overtimepolicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_overtimepolicy_overnight_pay_code_i_274ce1b0_fk_att_payco` (`overnight_pay_code_id`),
  ADD KEY `att_overtimepolicy_pay_code_id_285b0a61_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `att_paycode`
--
ALTER TABLE `att_paycode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `att_payloadattcode`
--
ALTER TABLE `att_payloadattcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadattcode_att_code_id_0d635efd_fk_att_attcode_id` (`att_code_id`),
  ADD KEY `att_payloadattcode_emp_id_36569f54_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadattcode_shift_id_731faddf_fk_att_attshift_id` (`shift_id`),
  ADD KEY `att_payloadattcode_att_date_19b2621e` (`att_date`),
  ADD KEY `att_payloadattcode_time_card_id_e8a37c7a` (`time_card_id`);

--
-- Indexes for table `att_payloadbase`
--
ALTER TABLE `att_payloadbase`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `break_time_id` (`break_time_id`),
  ADD UNIQUE KEY `overtime_id` (`overtime_id`),
  ADD KEY `att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id` (`timetable_id`);

--
-- Indexes for table `att_payloadbreak`
--
ALTER TABLE `att_payloadbreak`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `att_payloadeffectpunch`
--
ALTER TABLE `att_payloadeffectpunch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadeffectpun_trans_id_94affbe6_fk_iclock_tr` (`trans_id`),
  ADD KEY `att_payloadeffectpunch_emp_id_67e28e01_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadeffectpunch_att_date_1e3de2d4` (`att_date`),
  ADD KEY `att_payloadeffectpunch_time_card_id_52f69aaf` (`time_card_id`);

--
-- Indexes for table `att_payloadexception`
--
ALTER TABLE `att_payloadexception`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `att_payloadexception_item_id_a08bfe48_fk_att_leave` (`item_id`),
  ADD KEY `att_payloadexception_skd_id_b2e9ecaa` (`skd_id`);

--
-- Indexes for table `att_payloadmulpunchset`
--
ALTER TABLE `att_payloadmulpunchset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadmulpunchset_timetable_id_9a439a09` (`timetable_id`);

--
-- Indexes for table `att_payloadovertime`
--
ALTER TABLE `att_payloadovertime`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `att_payloadparing`
--
ALTER TABLE `att_payloadparing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadparing_emp_id_c5daac4f_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadparing_in_trans_id_50a8040e_fk_iclock_transaction_id` (`in_trans_id`),
  ADD KEY `att_payloadparing_out_trans_id_8b2375b9_fk_iclock_transaction_id` (`out_trans_id`),
  ADD KEY `att_payloadparing_pay_code_id_aa241cca_fk_att_paycode_id` (`pay_code_id`),
  ADD KEY `att_payloadparing_att_date_5daaa45d` (`att_date`),
  ADD KEY `att_payloadparing_time_card_id_3adc3517` (`time_card_id`);

--
-- Indexes for table `att_payloadpaycode`
--
ALTER TABLE `att_payloadpaycode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadpaycode_emp_id_78e75279_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadpaycode_pay_code_id_4a096cc7_fk_att_paycode_id` (`pay_code_id`),
  ADD KEY `att_payloadpaycode_shift_id_79a0901e_fk_att_attshift_id` (`shift_id`),
  ADD KEY `att_payloadpaycode_att_date_aa048d7b` (`att_date`),
  ADD KEY `att_payloadpaycode_time_card_id_1696b969` (`time_card_id`);

--
-- Indexes for table `att_payloadpunch`
--
ALTER TABLE `att_payloadpunch`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id` (`orig_id`),
  ADD KEY `att_payloadpunch_skd_id_17596d82` (`skd_id`);

--
-- Indexes for table `att_payloadtimecard`
--
ALTER TABLE `att_payloadtimecard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_payloadtimecard_emp_id_att_date_time_table_id_9df16bc5_uniq` (`emp_id`,`att_date`,`time_table_id`),
  ADD KEY `att_payloadtimecard_time_table_id_6e0b0137_fk_att_timei` (`time_table_id`),
  ADD KEY `att_payloadtimecard_att_date_48c1dc00` (`att_date`);

--
-- Indexes for table `att_payloadworkcodeparing`
--
ALTER TABLE `att_payloadworkcodeparing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_payloadworkcodep_emp_id_4090ec8c_fk_personnel` (`emp_id`),
  ADD KEY `att_payloadworkcodeparing_att_date_e60235b8` (`att_date`),
  ADD KEY `att_payloadworkcodeparing_time_card_id_3538bf00` (`time_card_id`);

--
-- Indexes for table `att_reportparam`
--
ALTER TABLE `att_reportparam`
  ADD PRIMARY KEY (`param_name`);

--
-- Indexes for table `att_reporttemplate`
--
ALTER TABLE `att_reporttemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_reporttemplate_builder_id_e1bb15c6_fk_auth_user_id` (`builder_id`),
  ADD KEY `att_reporttemplate_employee_id_4f80d866_fk_personnel_employee_id` (`employee_id`);

--
-- Indexes for table `att_shiftdetail`
--
ALTER TABLE `att_shiftdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id` (`time_interval_id`),
  ADD KEY `att_shiftdetail_shift_id_7d694501_fk_att_attshift_id` (`shift_id`);

--
-- Indexes for table `att_temporaryschedule`
--
ALTER TABLE `att_temporaryschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_temporaryschedul_employee_id_2b2b94c2_fk_personnel` (`employee_id`),
  ADD KEY `att_temporaryschedule_att_date_8aed8916` (`att_date`),
  ADD KEY `att_temporaryschedule_time_interval_id_2be60ee4` (`time_interval_id`);

--
-- Indexes for table `att_tempschedule`
--
ALTER TABLE `att_tempschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id` (`employee_id`),
  ADD KEY `att_tempschedule_time_interval_id_08dd8eb3` (`time_interval_id`);

--
-- Indexes for table `att_timeinterval`
--
ALTER TABLE `att_timeinterval`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `att_timeinterval_ot_pay_code_id_17438af8_fk_att_paycode_id` (`ot_pay_code_id`),
  ADD KEY `att_timeinterval_company_id_9824d651` (`company_id`);

--
-- Indexes for table `att_timeinterval_break_time`
--
ALTER TABLE `att_timeinterval_break_time`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_timeinterval_break_t_timeinterval_id_breaktim_6e1bfb4e_uniq` (`timeinterval_id`,`breaktime_id`),
  ADD KEY `att_timeinterval_bre_breaktime_id_08462308_fk_att_break` (`breaktime_id`);

--
-- Indexes for table `att_training`
--
ALTER TABLE `att_training`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `att_training_pay_code_id_5790afdd_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `att_webpunch`
--
ALTER TABLE `att_webpunch`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- Indexes for table `auth_user_auth_area`
--
ALTER TABLE `auth_user_auth_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_auth_area_myuser_id_area_id_02a19d63_uniq` (`myuser_id`,`area_id`),
  ADD KEY `auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id` (`area_id`);

--
-- Indexes for table `auth_user_auth_dept`
--
ALTER TABLE `auth_user_auth_dept`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_auth_dept_myuser_id_department_id_61d83386_uniq` (`myuser_id`,`department_id`),
  ADD KEY `auth_user_auth_dept_department_id_5866c514_fk_personnel` (`department_id`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_myuser_id_group_id_664bdfc3_uniq` (`myuser_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_profile`
--
ALTER TABLE `auth_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_myuser_id_permission_id_a558717f_uniq` (`myuser_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `base_adminlog`
--
ALTER TABLE `base_adminlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_adminlog_content_type_id_3e553c30_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `base_adminlog_user_id_ecf659f8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_attparamdepts`
--
ALTER TABLE `base_attparamdepts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rulename` (`rulename`);

--
-- Indexes for table `base_autoattexporttask`
--
ALTER TABLE `base_autoattexporttask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_code` (`task_code`);

--
-- Indexes for table `base_autoexporttask`
--
ALTER TABLE `base_autoexporttask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_code` (`task_code`);

--
-- Indexes for table `base_autoimporttask`
--
ALTER TABLE `base_autoimporttask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_code` (`task_code`),
  ADD KEY `base_autoimporttask_company_id_d18431a1` (`company_id`);

--
-- Indexes for table `base_bookmark`
--
ALTER TABLE `base_bookmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `base_bookmark_user_id_5f2d5ca2_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_dbbackuplog`
--
ALTER TABLE `base_dbbackuplog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_emailtemplate`
--
ALTER TABLE `base_emailtemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_eventalertsetting`
--
ALTER TABLE `base_eventalertsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_linenotifyforemployee`
--
ALTER TABLE `base_linenotifyforemployee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `base_linenotifysetting`
--
ALTER TABLE `base_linenotifysetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_linenotifysetting_line_notify_dept_id_line_dd79374f_uniq` (`line_notify_dept_id`,`line_notify_token`,`message_type`),
  ADD KEY `base_linenotifysetting_line_notify_dept_id_0643a5ed` (`line_notify_dept_id`);

--
-- Indexes for table `base_messengersentlog`
--
ALTER TABLE `base_messengersentlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_messengersentlo_content_type_id_e6e9b3d5_fk_django_co` (`content_type_id`),
  ADD KEY `base_messengersentlog_emp_id_44eba15e_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `base_messengersentlog_user_id_64034c70_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_reportoutputsetting`
--
ALTER TABLE `base_reportoutputsetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_reportoutputsetting_agreement_message_id_rep_a17e86da_uniq` (`agreement_message_id`,`report_name`);

--
-- Indexes for table `base_securitypolicy`
--
ALTER TABLE `base_securitypolicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_sendemail`
--
ALTER TABLE `base_sendemail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_sftpsetting`
--
ALTER TABLE `base_sftpsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_sysparam`
--
ALTER TABLE `base_sysparam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_sysparam_para_name_para_type_3086789a_uniq` (`para_name`,`para_type`);

--
-- Indexes for table `base_sysparamdept`
--
ALTER TABLE `base_sysparamdept`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rule_name` (`rule_name`);

--
-- Indexes for table `base_systemlog`
--
ALTER TABLE `base_systemlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_systemsetting`
--
ALTER TABLE `base_systemsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_zoomsetting`
--
ALTER TABLE `base_zoomsetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jwt_token` (`jwt_token`),
  ADD UNIQUE KEY `zoom_user_email` (`zoom_user_email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  ADD KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  ADD KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  ADD KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`);

--
-- Indexes for table `django_celery_beat_periodictasks`
--
ALTER TABLE `django_celery_beat_periodictasks`
  ADD PRIMARY KEY (`ident`);

--
-- Indexes for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`);

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
-- Indexes for table `ep_epsetup`
--
ALTER TABLE `ep_epsetup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ep_eptransaction`
--
ALTER TABLE `ep_eptransaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ep_eptransaction_emp_code_check_datetime_0b54f31f_uniq` (`emp_code`,`check_datetime`),
  ADD KEY `ep_eptransaction_emp_id_1006883f_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `ep_eptransaction_terminal_id_4490b209_fk_iclock_terminal_id` (`terminal_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `iclock_biodata`
--
ALTER TABLE `iclock_biodata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iclock_biodata_employee_id_bio_no_bio_i_bc5286ed_uniq` (`employee_id`,`bio_no`,`bio_index`,`bio_type`,`bio_format`,`major_ver`,`minor_ver`),
  ADD KEY `iclock_biodata_employee_id_ff748ea7` (`employee_id`);

--
-- Indexes for table `iclock_biophoto`
--
ALTER TABLE `iclock_biophoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id` (`employee_id`);

--
-- Indexes for table `iclock_devicemoduleconfig`
--
ALTER TABLE `iclock_devicemoduleconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iclock_errorcommandlog`
--
ALTER TABLE `iclock_errorcommandlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_errorcommandl_terminal_id_3b2d7cbd_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `iclock_privatemessage`
--
ALTER TABLE `iclock_privatemessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_privatemessag_employee_id_e84a34c0_fk_personnel` (`employee_id`),
  ADD KEY `iclock_privatemessag_message_id_e3145d3b_fk_iclock_sh` (`message_id`);

--
-- Indexes for table `iclock_publicmessage`
--
ALTER TABLE `iclock_publicmessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_publicmessage_message_id_7d125e28_fk_iclock_sh` (`message_id`),
  ADD KEY `iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id` (`terminal_id`);

--
-- Indexes for table `iclock_shortmessage`
--
ALTER TABLE `iclock_shortmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iclock_terminal`
--
ALTER TABLE `iclock_terminal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sn` (`sn`),
  ADD KEY `iclock_terminal_area_id_c019c6f0` (`area_id`);

--
-- Indexes for table `iclock_terminalcommand`
--
ALTER TABLE `iclock_terminalcommand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_terminalcomma_terminal_id_3dcf836f_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `iclock_terminalcommandlog`
--
ALTER TABLE `iclock_terminalcommandlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_terminalcomma_terminal_id_35ea8b2b_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `iclock_terminalemployee`
--
ALTER TABLE `iclock_terminalemployee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iclock_terminallog`
--
ALTER TABLE `iclock_terminallog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id` (`terminal_id`);

--
-- Indexes for table `iclock_terminalparameter`
--
ALTER TABLE `iclock_terminalparameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iclock_terminalparameter_terminal_id_param_name_8abbb5c0_uniq` (`terminal_id`,`param_name`);

--
-- Indexes for table `iclock_terminaluploadlog`
--
ALTER TABLE `iclock_terminaluploadlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_terminaluploa_terminal_id_9c9a7664_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `iclock_terminalworkcode`
--
ALTER TABLE `iclock_terminalworkcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `iclock_terminalworkc_company_id_77625f26_fk_personnel` (`company_id`),
  ADD KEY `iclock_terminalworkcode_pay_code_id_a8dad5f2_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `iclock_transaction`
--
ALTER TABLE `iclock_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iclock_transaction_company_code_emp_code_pu_2665c3d7_uniq` (`company_code`,`emp_code`,`punch_time`),
  ADD KEY `iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id` (`emp_id`),
  ADD KEY `iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id` (`terminal_id`);

--
-- Indexes for table `iclock_transactionproofcmd`
--
ALTER TABLE `iclock_transactionproofcmd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iclock_transactionpr_terminal_id_08b81e1e_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_meetingentity`
--
ALTER TABLE `meeting_meetingentity`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `meeting_meetingentity_room_id_bc2c738e_fk_meeting_meetingroom_id` (`room_id`),
  ADD KEY `meeting_meetingentity_zoom_id_7f87d666_fk_base_zoomsetting_id` (`zoom_id`);

--
-- Indexes for table `meeting_meetingentity_attender`
--
ALTER TABLE `meeting_meetingentity_attender`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_meetingentity_at_meetingentity_id_employe_b556fc2d_uniq` (`meetingentity_id`,`employee_id`),
  ADD KEY `meeting_meetingentit_employee_id_ee898064_fk_personnel` (`employee_id`);

--
-- Indexes for table `meeting_meetingmanuallog`
--
ALTER TABLE `meeting_meetingmanuallog`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `meeting_meetingmanua_meeting_id_a672eaaf_fk_meeting_m` (`meeting_id`);

--
-- Indexes for table `meeting_meetingpayloadbase`
--
ALTER TABLE `meeting_meetingpayloadbase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_meetingpaylo_emp_id_ed6ec148_fk_personnel` (`emp_id`),
  ADD KEY `meeting_meetingpaylo_meeting_id_ca9d20cc_fk_meeting_m` (`meeting_id`);

--
-- Indexes for table `meeting_meetingroom`
--
ALTER TABLE `meeting_meetingroom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `meeting_meetingroomdevice`
--
ALTER TABLE `meeting_meetingroomdevice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_id` (`device_id`),
  ADD KEY `meeting_meetingroomd_room_id_e000d78d_fk_meeting_m` (`room_id`);

--
-- Indexes for table `meeting_meetingtransaction`
--
ALTER TABLE `meeting_meetingtransaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_meetingtransaction_emp_id_punch_datetime_65665dce_uniq` (`emp_id`,`punch_datetime`),
  ADD KEY `meeting_meetingtrans_meeting_id_e4e505e5_fk_meeting_m` (`meeting_id`),
  ADD KEY `meeting_meetingtrans_terminal_id_047426f2_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_announcement`
--
ALTER TABLE `mobile_announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_announcement_admin_id_6af3868c_fk_auth_user_id` (`admin_id`),
  ADD KEY `mobile_announcement_init_sender_id_2f5e35bd_fk_personnel` (`init_sender_id`),
  ADD KEY `mobile_announcement_receiver_id_ddf2a860_fk_personnel` (`receiver_id`);

--
-- Indexes for table `mobile_appactionlog`
--
ALTER TABLE `mobile_appactionlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_applist`
--
ALTER TABLE `mobile_applist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_appnotification`
--
ALTER TABLE `mobile_appnotification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_appnotification_admin_id_29c27197_fk_auth_user_id` (`admin_id`),
  ADD KEY `mobile_appnotificati_init_sender_id_d8aff845_fk_personnel` (`init_sender_id`),
  ADD KEY `mobile_appnotificati_receiver_id_90c4a355_fk_personnel` (`receiver_id`);

--
-- Indexes for table `mobile_gpsfordepartment`
--
ALTER TABLE `mobile_gpsfordepartment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_gpsfordepartm_department_id_988ccf22_fk_personnel` (`department_id`);

--
-- Indexes for table `mobile_gpsfordepartment_location`
--
ALTER TABLE `mobile_gpsfordepartment_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_gpsfordepartment__gpsfordepartment_id_gpsl_58226033_uniq` (`gpsfordepartment_id`,`gpslocation_id`),
  ADD KEY `mobile_gpsfordepartm_gpslocation_id_48b82e9e_fk_mobile_gp` (`gpslocation_id`);

--
-- Indexes for table `mobile_gpsforemployee`
--
ALTER TABLE `mobile_gpsforemployee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_gpsforemploye_employee_id_982b7cef_fk_personnel` (`employee_id`);

--
-- Indexes for table `mobile_gpsforemployee_location`
--
ALTER TABLE `mobile_gpsforemployee_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_gpsforemployee_lo_gpsforemployee_id_gpsloc_9ceb93bf_uniq` (`gpsforemployee_id`,`gpslocation_id`),
  ADD KEY `mobile_gpsforemploye_gpslocation_id_497a214f_fk_mobile_gp` (`gpslocation_id`);

--
-- Indexes for table `mobile_gpslocation`
--
ALTER TABLE `mobile_gpslocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_mobileapirequestlog`
--
ALTER TABLE `mobile_mobileapirequestlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_mobileapirequ_user_id_dfd3ded1_fk_personnel` (`user_id`),
  ADD KEY `mobile_mobileapirequestlog_requested_at_a8c85067` (`requested_at`),
  ADD KEY `mobile_mobileapirequestlog_path_830043b5` (`path`),
  ADD KEY `mobile_mobileapirequestlog_view_50dbf600` (`view`),
  ADD KEY `mobile_mobileapirequestlog_view_method_2e13cf95` (`view_method`),
  ADD KEY `mobile_mobileapirequestlog_status_code_c2de0c48` (`status_code`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payroll_deductionformula`
--
ALTER TABLE `payroll_deductionformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `payroll_empexpenseexemption`
--
ALTER TABLE `payroll_empexpenseexemption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_empexpenseex_employee_id_5372811d_fk_personnel` (`employee_id`);

--
-- Indexes for table `payroll_emploan`
--
ALTER TABLE `payroll_emploan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id` (`employee_id`);

--
-- Indexes for table `payroll_emppayrollprofile`
--
ALTER TABLE `payroll_emppayrollprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `payroll_exceptionformula`
--
ALTER TABLE `payroll_exceptionformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `payroll_exceptionformula_pay_code_id_97609b51_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `payroll_extradeduction`
--
ALTER TABLE `payroll_extradeduction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_extradeducti_employee_id_53072441_fk_personnel` (`employee_id`),
  ADD KEY `payroll_extradeducti_special_type_id_50673042_fk_payroll_s` (`special_type_id`);

--
-- Indexes for table `payroll_extraincrease`
--
ALTER TABLE `payroll_extraincrease`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_extraincreas_employee_id_f902e6bb_fk_personnel` (`employee_id`),
  ADD KEY `payroll_extraincreas_special_type_id_d15ce699_fk_payroll_s` (`special_type_id`);

--
-- Indexes for table `payroll_increasementformula`
--
ALTER TABLE `payroll_increasementformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `payroll_increasement_special_type_id_88016f0b_fk_payroll_s` (`special_type_id`);

--
-- Indexes for table `payroll_leaveformula`
--
ALTER TABLE `payroll_leaveformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `payroll_leaveformula_pay_code_id_63c7b4bd_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `payroll_overtimeformula`
--
ALTER TABLE `payroll_overtimeformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `payroll_overtimeformula_pay_code_id_36d2f10e_fk_att_paycode_id` (`pay_code_id`);

--
-- Indexes for table `payroll_payrollpayload`
--
ALTER TABLE `payroll_payrollpayload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollpaylo_employee_id_bc868f2b_fk_personnel` (`employee_id`);

--
-- Indexes for table `payroll_payrollpayloadexpenseexemption`
--
ALTER TABLE `payroll_payrollpayloadexpenseexemption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollpaylo_exemption_id_2effb718_fk_payroll_e` (`exemption_id`),
  ADD KEY `payroll_payrollpaylo_payload_id_46c8357d_fk_payroll_p` (`payload_id`);

--
-- Indexes for table `payroll_payrollpayloadpaycode`
--
ALTER TABLE `payroll_payrollpayloadpaycode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_payrollpaylo_pay_code_id_c057af1f_fk_att_payco` (`pay_code_id`),
  ADD KEY `payroll_payrollpaylo_payload_id_f085c4e8_fk_payroll_p` (`payload_id`);

--
-- Indexes for table `payroll_reimbursement`
--
ALTER TABLE `payroll_reimbursement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_reimbursemen_employee_id_c4bbde36_fk_personnel` (`employee_id`);

--
-- Indexes for table `payroll_salaryadvance`
--
ALTER TABLE `payroll_salaryadvance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_salaryadvanc_employee_id_2abd43e5_fk_personnel` (`employee_id`);

--
-- Indexes for table `payroll_salarystructure`
--
ALTER TABLE `payroll_salarystructure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_salarystruct_employee_id_98996e15_fk_personnel` (`employee_id`);

--
-- Indexes for table `payroll_salarystructure_deductionformula`
--
ALTER TABLE `payroll_salarystructure_deductionformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_salarystructure__salarystructure_id_deduc_794e8449_uniq` (`salarystructure_id`,`deductionformula_id`),
  ADD KEY `payroll_salarystruct_deductionformula_id_b174d5b6_fk_payroll_d` (`deductionformula_id`);

--
-- Indexes for table `payroll_salarystructure_exceptionformula`
--
ALTER TABLE `payroll_salarystructure_exceptionformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_salarystructure__salarystructure_id_excep_a5e869ff_uniq` (`salarystructure_id`,`exceptionformula_id`),
  ADD KEY `payroll_salarystruct_exceptionformula_id_8f6dadb3_fk_payroll_e` (`exceptionformula_id`);

--
-- Indexes for table `payroll_salarystructure_increasementformula`
--
ALTER TABLE `payroll_salarystructure_increasementformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_salarystructure__salarystructure_id_incre_749132b3_uniq` (`salarystructure_id`,`increasementformula_id`),
  ADD KEY `payroll_salarystruct_increasementformula__3cd77082_fk_payroll_i` (`increasementformula_id`);

--
-- Indexes for table `payroll_salarystructure_leaveformula`
--
ALTER TABLE `payroll_salarystructure_leaveformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_salarystructure__salarystructure_id_leave_4efdce30_uniq` (`salarystructure_id`,`leaveformula_id`),
  ADD KEY `payroll_salarystruct_leaveformula_id_049f9024_fk_payroll_l` (`leaveformula_id`);

--
-- Indexes for table `payroll_salarystructure_overtimeformula`
--
ALTER TABLE `payroll_salarystructure_overtimeformula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_salarystructure__salarystructure_id_overt_0d0a0e81_uniq` (`salarystructure_id`,`overtimeformula_id`),
  ADD KEY `payroll_salarystruct_overtimeformula_id_40ad89ef_fk_payroll_o` (`overtimeformula_id`);

--
-- Indexes for table `payroll_socialsecuritydeduction`
--
ALTER TABLE `payroll_socialsecuritydeduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_specialpayment`
--
ALTER TABLE `payroll_specialpayment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `payroll_taxdeduction`
--
ALTER TABLE `payroll_taxdeduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personnel_area`
--
ALTER TABLE `personnel_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_area_company_id_area_code_aa39c55c_uniq` (`company_id`,`area_code`),
  ADD KEY `personnel_area_parent_area_id_39028fda_fk_personnel_area_id` (`parent_area_id`),
  ADD KEY `personnel_area_company_id_59750eb5` (`company_id`);

--
-- Indexes for table `personnel_assignareaemployee`
--
ALTER TABLE `personnel_assignareaemployee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personnel_assignarea_area_id_6f049d6a_fk_personnel` (`area_id`),
  ADD KEY `personnel_assignarea_employee_id_a3d4dd25_fk_personnel` (`employee_id`);

--
-- Indexes for table `personnel_certification`
--
ALTER TABLE `personnel_certification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_certification_cert_code_company_id_c1b12208_uniq` (`cert_code`,`company_id`),
  ADD KEY `personnel_certification_company_id_c1b1bd00` (`company_id`);

--
-- Indexes for table `personnel_company`
--
ALTER TABLE `personnel_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_code` (`company_code`);

--
-- Indexes for table `personnel_department`
--
ALTER TABLE `personnel_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_department_company_id_dept_code_dfa8fff7_uniq` (`company_id`,`dept_code`),
  ADD KEY `personnel_department_parent_dept_id_d0b44024_fk_personnel` (`parent_dept_id`),
  ADD KEY `personnel_department_dept_manager_id_c5124a7d_fk_personnel` (`dept_manager_id`),
  ADD KEY `personnel_department_company_id_00867fd8` (`company_id`);

--
-- Indexes for table `personnel_employee`
--
ALTER TABLE `personnel_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employee_company_id_emp_code_81daa575_uniq` (`company_id`,`emp_code`),
  ADD KEY `personnel_employee_department_id_068bbd08` (`department_id`),
  ADD KEY `personnel_employee_position_id_c9321343` (`position_id`),
  ADD KEY `personnel_employee_superior_id_ad6e1c47_fk_personnel_employee_id` (`superior_id`),
  ADD KEY `personnel_employee_company_id_95b3fd72` (`company_id`);

--
-- Indexes for table `personnel_employeecalendar`
--
ALTER TABLE `personnel_employeecalendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employeecalendar_employee_id_calendar_10f7278d_uniq` (`employee_id`,`calendar`);

--
-- Indexes for table `personnel_employeecertification`
--
ALTER TABLE `personnel_employeecertification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employeecertif_employee_id_certificatio_7bcf4c7d_uniq` (`employee_id`,`certification_id`),
  ADD KEY `personnel_employeece_certification_id_faabed40_fk_personnel` (`certification_id`);

--
-- Indexes for table `personnel_employeecustomattribute`
--
ALTER TABLE `personnel_employeecustomattribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attr_name` (`attr_name`);

--
-- Indexes for table `personnel_employeeextrainfo`
--
ALTER TABLE `personnel_employeeextrainfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `personnel_employeeprofile`
--
ALTER TABLE `personnel_employeeprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- Indexes for table `personnel_employee_area`
--
ALTER TABLE `personnel_employee_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employee_area_employee_id_area_id_00b3d777_uniq` (`employee_id`,`area_id`),
  ADD KEY `personnel_employee_area_area_id_64c21925_fk_personnel_area_id` (`area_id`);

--
-- Indexes for table `personnel_employee_area_privilege`
--
ALTER TABLE `personnel_employee_area_privilege`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employee_area__employee_id_area_id_99f40c1a_uniq` (`employee_id`,`area_id`),
  ADD KEY `personnel_employee_a_area_id_6e42535e_fk_personnel` (`area_id`);

--
-- Indexes for table `personnel_employee_flow_role`
--
ALTER TABLE `personnel_employee_flow_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_employee_flow__employee_id_workflowrole_46b0e5e0_uniq` (`employee_id`,`workflowrole_id`),
  ADD KEY `personnel_employee_f_workflowrole_id_4704db32_fk_workflow_` (`workflowrole_id`);

--
-- Indexes for table `personnel_employment`
--
ALTER TABLE `personnel_employment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `personnel_position`
--
ALTER TABLE `personnel_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_position_company_id_position_code_4708726e_uniq` (`company_id`,`position_code`),
  ADD KEY `personnel_position_parent_position_id_a496a36b_fk_personnel` (`parent_position_id`),
  ADD KEY `personnel_position_company_id_f06c5d2a` (`company_id`);

--
-- Indexes for table `personnel_resign`
--
ALTER TABLE `personnel_resign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `rest_framework_tracking_apirequestlog`
--
ALTER TABLE `rest_framework_tracking_apirequestlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rest_framework_track_user_id_671b70b7_fk_auth_user` (`user_id`),
  ADD KEY `rest_framework_tracking_apirequestlog_requested_at_b6f1c2f2` (`requested_at`),
  ADD KEY `rest_framework_tracking_apirequestlog_path_fe81f91b` (`path`),
  ADD KEY `rest_framework_tracking_apirequestlog_view_5bd1e407` (`view`),
  ADD KEY `rest_framework_tracking_apirequestlog_view_method_dd790881` (`view_method`),
  ADD KEY `rest_framework_tracking_apirequestlog_status_code_3c9e2003` (`status_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `staff_stafftoken`
--
ALTER TABLE `staff_stafftoken`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `sync_area`
--
ALTER TABLE `sync_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sync_area_area_code_area_name_200046d1_uniq` (`area_code`,`area_name`);

--
-- Indexes for table `sync_department`
--
ALTER TABLE `sync_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sync_department_dept_code_dept_name_93923213_uniq` (`dept_code`,`dept_name`);

--
-- Indexes for table `sync_employee`
--
ALTER TABLE `sync_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sync_employee_emp_code_521bf06d_uniq` (`emp_code`);

--
-- Indexes for table `sync_job`
--
ALTER TABLE `sync_job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sync_job_job_code_job_name_4ec5619e_uniq` (`job_code`,`job_name`);

--
-- Indexes for table `tblattendancelog`
--
ALTER TABLE `tblattendancelog`
  ADD PRIMARY KEY (`AttendanceLogID`),
  ADD UNIQUE KEY `UQ_AttendanceLog` (`EmployeeID`,`PunchTime`,`DeviceSerialNo`),
  ADD UNIQUE KEY `UQ_AttendanceLog_ZKTTransaction` (`ZKTTransactionID`);

--
-- Indexes for table `tblattendancesetting`
--
ALTER TABLE `tblattendancesetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbatch`
--
ALTER TABLE `tblbatch`
  ADD PRIMARY KEY (`BatchID`),
  ADD KEY `tblbatch_departmentid_foreign` (`DepartmentID`);

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD UNIQUE KEY `tbldepartment_departmentcode_unique` (`DepartmentCode`);

--
-- Indexes for table `tbldesignation`
--
ALTER TABLE `tbldesignation`
  ADD PRIMARY KEY (`DesignationID`);

--
-- Indexes for table `tbldevice`
--
ALTER TABLE `tbldevice`
  ADD PRIMARY KEY (`DeviceID`),
  ADD KEY `tbldevice_roomid_foreign` (`RoomID`);

--
-- Indexes for table `tblempinfo`
--
ALTER TABLE `tblempinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tblempinfo_user_id_unique` (`User_id`);

--
-- Indexes for table `tblholidaysetup`
--
ALTER TABLE `tblholidaysetup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleave`
--
ALTER TABLE `tblleave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tblleave_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblroom`
--
ALTER TABLE `tblroom`
  ADD PRIMARY KEY (`RoomID`),
  ADD UNIQUE KEY `tblroom_roomno_unique` (`RoomNo`);

--
-- Indexes for table `tblrosterassignment`
--
ALTER TABLE `tblrosterassignment`
  ADD PRIMARY KEY (`RosterAssignmentID`),
  ADD KEY `tblrosterassignment_rosterpersonid_foreign` (`RosterPersonID`),
  ADD KEY `tblrosterassignment_proxypersonid_foreign` (`ProxyPersonID`),
  ADD KEY `tblrosterassignment_rostershiftid_foreign` (`RosterShiftID`),
  ADD KEY `tblrosterassignment_rosterlocationid_foreign` (`RosterLocationID`),
  ADD KEY `tblrosterassignment_deviceid_foreign` (`DeviceID`),
  ADD KEY `tblrosterassignment_rosterdate_rosterpersonid_index` (`RosterDate`,`RosterPersonID`),
  ADD KEY `tblrosterassignment_rosterdate_deviceid_index` (`RosterDate`,`DeviceID`),
  ADD KEY `tblrosterassignment_departmentid_foreign` (`DepartmentID`),
  ADD KEY `tblrosterassignment_batchid_foreign` (`BatchID`),
  ADD KEY `tblrosterassignment_subjectid_foreign` (`SubjectID`),
  ADD KEY `tblrosterassignment_rosterdate_departmentid_index` (`RosterDate`,`DepartmentID`),
  ADD KEY `tblrosterassignment_rosterseriesid_index` (`RosterSeriesID`);

--
-- Indexes for table `tblrosterlocation`
--
ALTER TABLE `tblrosterlocation`
  ADD PRIMARY KEY (`RosterLocationID`),
  ADD UNIQUE KEY `tblrosterlocation_locationname_unique` (`LocationName`),
  ADD UNIQUE KEY `tblrosterlocation_deviceid_unique` (`DeviceID`);

--
-- Indexes for table `tblrosterperson`
--
ALTER TABLE `tblrosterperson`
  ADD PRIMARY KEY (`RosterPersonID`),
  ADD UNIQUE KEY `tblrosterperson_sourceteacherid_unique` (`SourceTeacherID`),
  ADD UNIQUE KEY `tblrosterperson_employeecode_unique` (`EmployeeCode`),
  ADD UNIQUE KEY `tblrosterperson_zkuserid_unique` (`ZKUserID`),
  ADD KEY `tblrosterperson_shortname_index` (`ShortName`);

--
-- Indexes for table `tblrostersetting`
--
ALTER TABLE `tblrostersetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrostershift`
--
ALTER TABLE `tblrostershift`
  ADD PRIMARY KEY (`RosterShiftID`),
  ADD UNIQUE KEY `tblrostershift_shiftname_unique` (`ShiftName`);

--
-- Indexes for table `tblroutine`
--
ALTER TABLE `tblroutine`
  ADD PRIMARY KEY (`RoutineID`),
  ADD KEY `tblroutine_teacherid_foreign` (`TeacherID`),
  ADD KEY `tblroutine_subjectid_foreign` (`SubjectID`),
  ADD KEY `tblroutine_batchid_foreign` (`BatchID`),
  ADD KEY `tblroutine_roomid_foreign` (`RoomID`),
  ADD KEY `tblroutine_deviceid_foreign` (`DeviceID`),
  ADD KEY `tblroutine_proxyteacherid_foreign` (`ProxyTeacherID`),
  ADD KEY `routine_semester_dates_index` (`SemesterStartDate`,`SemesterEndDate`);

--
-- Indexes for table `tblshift`
--
ALTER TABLE `tblshift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubject`
--
ALTER TABLE `tblsubject`
  ADD PRIMARY KEY (`SubjectID`),
  ADD KEY `tblsubject_departmentid_foreign` (`DepartmentID`);

--
-- Indexes for table `tblteacher`
--
ALTER TABLE `tblteacher`
  ADD PRIMARY KEY (`TeacherID`),
  ADD KEY `tblteacher_departmentid_foreign` (`DepartmentID`),
  ADD KEY `tblteacher_designationid_foreign` (`DesignationID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_rosterpersonid_unique` (`RosterPersonID`);

--
-- Indexes for table `visitor_reason`
--
ALTER TABLE `visitor_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_reservation`
--
ALTER TABLE `visitor_reservation`
  ADD PRIMARY KEY (`workflowinstance_ptr_id`),
  ADD KEY `visitor_reservation_visit_reason_id_c9ac83ac_fk_visitor_r` (`visit_reason_id`),
  ADD KEY `visitor_reservation_visit_department_id_2d293e10` (`visit_department_id`),
  ADD KEY `visitor_reservation_cert_type_id_4f047f2a_fk_visitor_v` (`cert_type_id`);

--
-- Indexes for table `visitor_visitor`
--
ALTER TABLE `visitor_visitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_code` (`visitor_code`),
  ADD KEY `visitor_visitor_visit_reason_id_4b9a2d23_fk_visitor_reason_id` (`visit_reason_id`),
  ADD KEY `visitor_visitor_visit_department_id_f7dbdcb4` (`visit_department_id`),
  ADD KEY `visitor_visitor_visited_id_8043a7ea` (`visited_id`),
  ADD KEY `visitor_visitor_cert_type_id_f62ea604_fk_visitor_v` (`cert_type_id`);

--
-- Indexes for table `visitor_visitorbiodata`
--
ALTER TABLE `visitor_visitorbiodata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_visitorbiodata_visitor_id_bio_no_bio_in_225ce182_uniq` (`visitor_id`,`bio_no`,`bio_index`,`bio_type`,`bio_format`,`major_ver`,`minor_ver`),
  ADD KEY `visitor_visitorbiodata_visitor_id_b944ed37` (`visitor_id`);

--
-- Indexes for table `visitor_visitorbiophoto`
--
ALTER TABLE `visitor_visitorbiophoto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_visitorbioph_visitor_id_9816daf7_fk_visitor_v` (`visitor_id`);

--
-- Indexes for table `visitor_visitorcertification`
--
ALTER TABLE `visitor_visitorcertification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cert_code` (`cert_code`),
  ADD UNIQUE KEY `cert_name` (`cert_name`);

--
-- Indexes for table `visitor_visitorconfig`
--
ALTER TABLE `visitor_visitorconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_visitorlog`
--
ALTER TABLE `visitor_visitorlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_visitorlog_visitor_id_ebaafde1_fk_visitor_visitor_id` (`visitor_id`);

--
-- Indexes for table `visitor_visitortransaction`
--
ALTER TABLE `visitor_visitortransaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_visitortransaction_visitor_code_punch_time_2b871513_uniq` (`visitor_code`,`punch_time`),
  ADD KEY `visitor_visitortrans_visitor_id_0ee95624_fk_visitor_v` (`visitor_id`),
  ADD KEY `visitor_visitortrans_terminal_id_7527ef69_fk_iclock_te` (`terminal_id`);

--
-- Indexes for table `visitor_visitor_acc_groups`
--
ALTER TABLE `visitor_visitor_acc_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_visitor_acc_groups_visitor_id_accgroups_id_bb522609_uniq` (`visitor_id`,`accgroups_id`),
  ADD KEY `visitor_visitor_acc__accgroups_id_b1487149_fk_acc_accgr` (`accgroups_id`);

--
-- Indexes for table `visitor_visitor_area`
--
ALTER TABLE `visitor_visitor_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_visitor_area_visitor_id_area_id_27d158cc_uniq` (`visitor_id`,`area_id`),
  ADD KEY `visitor_visitor_area_area_id_b402c047_fk_personnel_area_id` (`area_id`);

--
-- Indexes for table `workflow_nodeinstance`
--
ALTER TABLE `workflow_nodeinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_nodeinstanc_workflow_instance_id_afe84fe4_fk_workflow_` (`workflow_instance_id`),
  ADD KEY `workflow_nodeinstanc_workflow_node_id_166f36c4_fk_workflow_` (`workflow_node_id`),
  ADD KEY `workflow_nodeinstanc_approver_employee_id_d36cd45d_fk_personnel` (`approver_employee_id`);

--
-- Indexes for table `workflow_workflowengine`
--
ALTER TABLE `workflow_workflowengine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflow_code` (`workflow_code`),
  ADD KEY `workflow_workfloweng_applicant_position_i_8a65e03a_fk_personnel` (`applicant_position_id`),
  ADD KEY `workflow_workfloweng_content_type_id_f7345c20_fk_django_co` (`content_type_id`),
  ADD KEY `workflow_workflowengine_departments_id_0f06d4c7` (`departments_id`),
  ADD KEY `workflow_workflowengine_leave_type_id_7f03c9cc_fk_att_paycode_id` (`leave_type_id`),
  ADD KEY `workflow_workflowengine_company_id_c42adcb0` (`company_id`);

--
-- Indexes for table `workflow_workflowengine_employee`
--
ALTER TABLE `workflow_workflowengine_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflow_workflowengine__workflowengine_id_employ_8128deb2_uniq` (`workflowengine_id`,`employee_id`),
  ADD KEY `workflow_workfloweng_employee_id_803a409e_fk_personnel` (`employee_id`);

--
-- Indexes for table `workflow_workflowinstance`
--
ALTER TABLE `workflow_workflowinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_workflowins_workflow_engine_id_1e6ac40f_fk_workflow_` (`workflow_engine_id`),
  ADD KEY `workflow_workflowinstance_employee_id_c7cff08e` (`employee_id`);

--
-- Indexes for table `workflow_workflownode`
--
ALTER TABLE `workflow_workflownode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_workflownod_workflow_engine_id_04c8f470_fk_workflow_` (`workflow_engine_id`);

--
-- Indexes for table `workflow_workflownode_approver`
--
ALTER TABLE `workflow_workflownode_approver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflow_workflownode_ap_workflownode_id_workflow_7543ba37_uniq` (`workflownode_id`,`workflowrole_id`),
  ADD KEY `workflow_workflownod_workflowrole_id_c8e00d42_fk_workflow_` (`workflowrole_id`);

--
-- Indexes for table `workflow_workflownode_notifier`
--
ALTER TABLE `workflow_workflownode_notifier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflow_workflownode_no_workflownode_id_workflow_cac02b37_uniq` (`workflownode_id`,`workflowrole_id`),
  ADD KEY `workflow_workflownod_workflowrole_id_73de7fc2_fk_workflow_` (`workflowrole_id`);

--
-- Indexes for table `workflow_workflowrole`
--
ALTER TABLE `workflow_workflowrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workflow_workflowrole_company_id_role_name_afcc5f2b_uniq` (`company_id`,`role_name`),
  ADD UNIQUE KEY `workflow_workflowrole_company_id_role_code_a4e809d7_uniq` (`company_id`,`role_code`),
  ADD KEY `workflow_workflowrol_parent_role_id_91433355_fk_workflow_` (`parent_role_id`),
  ADD KEY `workflow_workflowrole_company_id_bbb75590` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_adminbiodata`
--
ALTER TABLE `accounts_adminbiodata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_passwordresetkey`
--
ALTER TABLE `accounts_passwordresetkey`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_usernotification`
--
ALTER TABLE `accounts_usernotification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_acccombination`
--
ALTER TABLE `acc_acccombination`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accgroups`
--
ALTER TABLE `acc_accgroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accholiday`
--
ALTER TABLE `acc_accholiday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accprivilege`
--
ALTER TABLE `acc_accprivilege`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accterminal`
--
ALTER TABLE `acc_accterminal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_acctimezone`
--
ALTER TABLE `acc_acctimezone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attparam`
--
ALTER TABLE `attparam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `att_attcalclog`
--
ALTER TABLE `att_attcalclog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_attcode`
--
ALTER TABLE `att_attcode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `att_attemployee`
--
ALTER TABLE `att_attemployee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_attgroup`
--
ALTER TABLE `att_attgroup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `att_attpolicy`
--
ALTER TABLE `att_attpolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `att_attreportsetting`
--
ALTER TABLE `att_attreportsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `att_attschedule`
--
ALTER TABLE `att_attschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_attshift`
--
ALTER TABLE `att_attshift`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_breaktime`
--
ALTER TABLE `att_breaktime`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_calculatelastdate`
--
ALTER TABLE `att_calculatelastdate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_calculatetask`
--
ALTER TABLE `att_calculatetask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_departmentpolicy`
--
ALTER TABLE `att_departmentpolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_departmentschedule`
--
ALTER TABLE `att_departmentschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_deptattrule`
--
ALTER TABLE `att_deptattrule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_grouppolicy`
--
ALTER TABLE `att_grouppolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_groupschedule`
--
ALTER TABLE `att_groupschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_holiday`
--
ALTER TABLE `att_holiday`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_leavegroup`
--
ALTER TABLE `att_leavegroup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_leavegroupdetail`
--
ALTER TABLE `att_leavegroupdetail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_leaveyearbalance`
--
ALTER TABLE `att_leaveyearbalance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_overtimepolicy`
--
ALTER TABLE `att_overtimepolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_paycode`
--
ALTER TABLE `att_paycode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `att_payloadmulpunchset`
--
ALTER TABLE `att_payloadmulpunchset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_reporttemplate`
--
ALTER TABLE `att_reporttemplate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_shiftdetail`
--
ALTER TABLE `att_shiftdetail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_temporaryschedule`
--
ALTER TABLE `att_temporaryschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_tempschedule`
--
ALTER TABLE `att_tempschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_timeinterval`
--
ALTER TABLE `att_timeinterval`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `att_timeinterval_break_time`
--
ALTER TABLE `att_timeinterval_break_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=983;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_auth_area`
--
ALTER TABLE `auth_user_auth_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_auth_dept`
--
ALTER TABLE `auth_user_auth_dept`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_profile`
--
ALTER TABLE `auth_user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_adminlog`
--
ALTER TABLE `base_adminlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_attparamdepts`
--
ALTER TABLE `base_attparamdepts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_autoattexporttask`
--
ALTER TABLE `base_autoattexporttask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_autoexporttask`
--
ALTER TABLE `base_autoexporttask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_autoimporttask`
--
ALTER TABLE `base_autoimporttask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_bookmark`
--
ALTER TABLE `base_bookmark`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_dbbackuplog`
--
ALTER TABLE `base_dbbackuplog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_emailtemplate`
--
ALTER TABLE `base_emailtemplate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `base_eventalertsetting`
--
ALTER TABLE `base_eventalertsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `base_linenotifyforemployee`
--
ALTER TABLE `base_linenotifyforemployee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_linenotifysetting`
--
ALTER TABLE `base_linenotifysetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_messengersentlog`
--
ALTER TABLE `base_messengersentlog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_reportoutputsetting`
--
ALTER TABLE `base_reportoutputsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_securitypolicy`
--
ALTER TABLE `base_securitypolicy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `base_sendemail`
--
ALTER TABLE `base_sendemail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_sftpsetting`
--
ALTER TABLE `base_sftpsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_sysparam`
--
ALTER TABLE `base_sysparam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `base_sysparamdept`
--
ALTER TABLE `base_sysparamdept`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_systemlog`
--
ALTER TABLE `base_systemlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_systemsetting`
--
ALTER TABLE `base_systemsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_zoomsetting`
--
ALTER TABLE `base_zoomsetting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `ep_epsetup`
--
ALTER TABLE `ep_epsetup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ep_eptransaction`
--
ALTER TABLE `ep_eptransaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_biodata`
--
ALTER TABLE `iclock_biodata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_biophoto`
--
ALTER TABLE `iclock_biophoto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_devicemoduleconfig`
--
ALTER TABLE `iclock_devicemoduleconfig`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iclock_errorcommandlog`
--
ALTER TABLE `iclock_errorcommandlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_privatemessage`
--
ALTER TABLE `iclock_privatemessage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_publicmessage`
--
ALTER TABLE `iclock_publicmessage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_shortmessage`
--
ALTER TABLE `iclock_shortmessage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminal`
--
ALTER TABLE `iclock_terminal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminalcommand`
--
ALTER TABLE `iclock_terminalcommand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminalcommandlog`
--
ALTER TABLE `iclock_terminalcommandlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminalemployee`
--
ALTER TABLE `iclock_terminalemployee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminallog`
--
ALTER TABLE `iclock_terminallog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminalparameter`
--
ALTER TABLE `iclock_terminalparameter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminaluploadlog`
--
ALTER TABLE `iclock_terminaluploadlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_terminalworkcode`
--
ALTER TABLE `iclock_terminalworkcode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_transaction`
--
ALTER TABLE `iclock_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iclock_transactionproofcmd`
--
ALTER TABLE `iclock_transactionproofcmd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_meetingentity_attender`
--
ALTER TABLE `meeting_meetingentity_attender`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_meetingroom`
--
ALTER TABLE `meeting_meetingroom`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_meetingroomdevice`
--
ALTER TABLE `meeting_meetingroomdevice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_meetingtransaction`
--
ALTER TABLE `meeting_meetingtransaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `mobile_announcement`
--
ALTER TABLE `mobile_announcement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_appactionlog`
--
ALTER TABLE `mobile_appactionlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_applist`
--
ALTER TABLE `mobile_applist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_appnotification`
--
ALTER TABLE `mobile_appnotification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_gpsfordepartment`
--
ALTER TABLE `mobile_gpsfordepartment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_gpsfordepartment_location`
--
ALTER TABLE `mobile_gpsfordepartment_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_gpsforemployee`
--
ALTER TABLE `mobile_gpsforemployee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_gpsforemployee_location`
--
ALTER TABLE `mobile_gpsforemployee_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_gpslocation`
--
ALTER TABLE `mobile_gpslocation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_mobileapirequestlog`
--
ALTER TABLE `mobile_mobileapirequestlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_deductionformula`
--
ALTER TABLE `payroll_deductionformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_empexpenseexemption`
--
ALTER TABLE `payroll_empexpenseexemption`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_emploan`
--
ALTER TABLE `payroll_emploan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_emppayrollprofile`
--
ALTER TABLE `payroll_emppayrollprofile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_exceptionformula`
--
ALTER TABLE `payroll_exceptionformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_extradeduction`
--
ALTER TABLE `payroll_extradeduction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_extraincrease`
--
ALTER TABLE `payroll_extraincrease`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_increasementformula`
--
ALTER TABLE `payroll_increasementformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_leaveformula`
--
ALTER TABLE `payroll_leaveformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_overtimeformula`
--
ALTER TABLE `payroll_overtimeformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_payrollpayload`
--
ALTER TABLE `payroll_payrollpayload`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollpayloadexpenseexemption`
--
ALTER TABLE `payroll_payrollpayloadexpenseexemption`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollpayloadpaycode`
--
ALTER TABLE `payroll_payrollpayloadpaycode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_reimbursement`
--
ALTER TABLE `payroll_reimbursement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salaryadvance`
--
ALTER TABLE `payroll_salaryadvance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure`
--
ALTER TABLE `payroll_salarystructure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure_deductionformula`
--
ALTER TABLE `payroll_salarystructure_deductionformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure_exceptionformula`
--
ALTER TABLE `payroll_salarystructure_exceptionformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure_increasementformula`
--
ALTER TABLE `payroll_salarystructure_increasementformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure_leaveformula`
--
ALTER TABLE `payroll_salarystructure_leaveformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_salarystructure_overtimeformula`
--
ALTER TABLE `payroll_salarystructure_overtimeformula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_socialsecuritydeduction`
--
ALTER TABLE `payroll_socialsecuritydeduction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_specialpayment`
--
ALTER TABLE `payroll_specialpayment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_taxdeduction`
--
ALTER TABLE `payroll_taxdeduction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personnel_area`
--
ALTER TABLE `personnel_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personnel_assignareaemployee`
--
ALTER TABLE `personnel_assignareaemployee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_certification`
--
ALTER TABLE `personnel_certification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_company`
--
ALTER TABLE `personnel_company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personnel_department`
--
ALTER TABLE `personnel_department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personnel_employee`
--
ALTER TABLE `personnel_employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employeecalendar`
--
ALTER TABLE `personnel_employeecalendar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employeecertification`
--
ALTER TABLE `personnel_employeecertification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employeecustomattribute`
--
ALTER TABLE `personnel_employeecustomattribute`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employeeextrainfo`
--
ALTER TABLE `personnel_employeeextrainfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employeeprofile`
--
ALTER TABLE `personnel_employeeprofile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employee_area`
--
ALTER TABLE `personnel_employee_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employee_area_privilege`
--
ALTER TABLE `personnel_employee_area_privilege`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employee_flow_role`
--
ALTER TABLE `personnel_employee_flow_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_employment`
--
ALTER TABLE `personnel_employment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personnel_position`
--
ALTER TABLE `personnel_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personnel_resign`
--
ALTER TABLE `personnel_resign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rest_framework_tracking_apirequestlog`
--
ALTER TABLE `rest_framework_tracking_apirequestlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_area`
--
ALTER TABLE `sync_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_department`
--
ALTER TABLE `sync_department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_employee`
--
ALTER TABLE `sync_employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_job`
--
ALTER TABLE `sync_job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblattendancelog`
--
ALTER TABLE `tblattendancelog`
  MODIFY `AttendanceLogID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbatch`
--
ALTER TABLE `tblbatch`
  MODIFY `BatchID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `DepartmentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbldesignation`
--
ALTER TABLE `tbldesignation`
  MODIFY `DesignationID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbldevice`
--
ALTER TABLE `tbldevice`
  MODIFY `DeviceID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblempinfo`
--
ALTER TABLE `tblempinfo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblholidaysetup`
--
ALTER TABLE `tblholidaysetup`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblleave`
--
ALTER TABLE `tblleave`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblroom`
--
ALTER TABLE `tblroom`
  MODIFY `RoomID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblrosterassignment`
--
ALTER TABLE `tblrosterassignment`
  MODIFY `RosterAssignmentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1212;

--
-- AUTO_INCREMENT for table `tblrosterlocation`
--
ALTER TABLE `tblrosterlocation`
  MODIFY `RosterLocationID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblrosterperson`
--
ALTER TABLE `tblrosterperson`
  MODIFY `RosterPersonID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tblrostersetting`
--
ALTER TABLE `tblrostersetting`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblrostershift`
--
ALTER TABLE `tblrostershift`
  MODIFY `RosterShiftID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblroutine`
--
ALTER TABLE `tblroutine`
  MODIFY `RoutineID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblshift`
--
ALTER TABLE `tblshift`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblsubject`
--
ALTER TABLE `tblsubject`
  MODIFY `SubjectID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `tblteacher`
--
ALTER TABLE `tblteacher`
  MODIFY `TeacherID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `visitor_reason`
--
ALTER TABLE `visitor_reason`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitor`
--
ALTER TABLE `visitor_visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitorbiodata`
--
ALTER TABLE `visitor_visitorbiodata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitorbiophoto`
--
ALTER TABLE `visitor_visitorbiophoto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitorcertification`
--
ALTER TABLE `visitor_visitorcertification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitorconfig`
--
ALTER TABLE `visitor_visitorconfig`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visitor_visitorlog`
--
ALTER TABLE `visitor_visitorlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitortransaction`
--
ALTER TABLE `visitor_visitortransaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitor_acc_groups`
--
ALTER TABLE `visitor_visitor_acc_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_visitor_area`
--
ALTER TABLE `visitor_visitor_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_nodeinstance`
--
ALTER TABLE `workflow_nodeinstance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflowengine`
--
ALTER TABLE `workflow_workflowengine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflowengine_employee`
--
ALTER TABLE `workflow_workflowengine_employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflowinstance`
--
ALTER TABLE `workflow_workflowinstance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflownode`
--
ALTER TABLE `workflow_workflownode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflownode_approver`
--
ALTER TABLE `workflow_workflownode_approver`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflownode_notifier`
--
ALTER TABLE `workflow_workflownode_notifier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_workflowrole`
--
ALTER TABLE `workflow_workflowrole`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_adminbiodata`
--
ALTER TABLE `accounts_adminbiodata`
  ADD CONSTRAINT `accounts_adminbiodata_admin_id_1e6d2d45_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_usernotification`
--
ALTER TABLE `accounts_usernotification`
  ADD CONSTRAINT `accounts_usernotific_employee_id_c98d9de8_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `accounts_usernotification_user_id_b86755b3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `acc_acccombination`
--
ALTER TABLE `acc_acccombination`
  ADD CONSTRAINT `acc_acccombination_area_id_0d22c34e_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `acc_accgroups`
--
ALTER TABLE `acc_accgroups`
  ADD CONSTRAINT `acc_accgroups_area_id_b83745c3_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `acc_accholiday`
--
ALTER TABLE `acc_accholiday`
  ADD CONSTRAINT `acc_accholiday_area_id_d15c19da_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `acc_accholiday_holiday_id_a9efe924_fk_att_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `att_holiday` (`id`),
  ADD CONSTRAINT `acc_accholiday_timezone_id_450d2d1e_fk_acc_acctimezone_id` FOREIGN KEY (`timezone_id`) REFERENCES `acc_acctimezone` (`id`);

--
-- Constraints for table `acc_accprivilege`
--
ALTER TABLE `acc_accprivilege`
  ADD CONSTRAINT `acc_accprivilege_area_id_2123ff6f_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `acc_accprivilege_employee_id_5fc55f95_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `acc_accprivilege_group_id_c5ed7003_fk_acc_accgroups_id` FOREIGN KEY (`group_id`) REFERENCES `acc_accgroups` (`id`);

--
-- Constraints for table `acc_accterminal`
--
ALTER TABLE `acc_accterminal`
  ADD CONSTRAINT `acc_accterminal_terminal_id_fc92cce2_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `acc_acctimezone`
--
ALTER TABLE `acc_acctimezone`
  ADD CONSTRAINT `acc_acctimezone_area_id_e9ce7a7a_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `att_attemployee`
--
ALTER TABLE `att_attemployee`
  ADD CONSTRAINT `att_attemployee_emp_id_52457e3c_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_attemployee_group_id_18d3954d_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`);

--
-- Constraints for table `att_attgroup`
--
ALTER TABLE `att_attgroup`
  ADD CONSTRAINT `att_attgroup_company_id_cd1b54f8_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`);

--
-- Constraints for table `att_attpolicy`
--
ALTER TABLE `att_attpolicy`
  ADD CONSTRAINT `att_attpolicy_ot_pay_code_id_b189b952_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_attschedule`
--
ALTER TABLE `att_attschedule`
  ADD CONSTRAINT `att_attschedule_employee_id_caa61686_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_attschedule_shift_id_13d2db9a_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`);

--
-- Constraints for table `att_attshift`
--
ALTER TABLE `att_attshift`
  ADD CONSTRAINT `att_attshift_company_id_2c0a4f56_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`);

--
-- Constraints for table `att_breaktime`
--
ALTER TABLE `att_breaktime`
  ADD CONSTRAINT `att_breaktime_company_id_fbb9a2b7_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `att_breaktime_loss_code_id_2ffb5432_fk_att_paycode_id` FOREIGN KEY (`loss_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_breaktime_profit_code_id_63cdbbcc_fk_att_paycode_id` FOREIGN KEY (`profit_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_changeschedule`
--
ALTER TABLE `att_changeschedule`
  ADD CONSTRAINT `att_changeschedule_timeinterval_id_d41ac077_fk_att_timei` FOREIGN KEY (`timeinterval_id`) REFERENCES `att_timeinterval` (`id`),
  ADD CONSTRAINT `att_changeschedule_workflowinstance_ptr_cee602bb_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `att_departmentpolicy`
--
ALTER TABLE `att_departmentpolicy`
  ADD CONSTRAINT `att_departmentpolicy_department_id_77059a9d_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `att_departmentpolicy_ot_pay_code_id_390411dd_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_departmentschedule`
--
ALTER TABLE `att_departmentschedule`
  ADD CONSTRAINT `att_departmentschedu_department_id_c68fca3d_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `att_departmentschedule_shift_id_c37d5ade_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`);

--
-- Constraints for table `att_deptattrule`
--
ALTER TABLE `att_deptattrule`
  ADD CONSTRAINT `att_deptattrule_department_id_f333c8f0_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`);

--
-- Constraints for table `att_grouppolicy`
--
ALTER TABLE `att_grouppolicy`
  ADD CONSTRAINT `att_grouppolicy_group_id_b2e4dfe8_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`),
  ADD CONSTRAINT `att_grouppolicy_ot_pay_code_id_1ec83080_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_groupschedule`
--
ALTER TABLE `att_groupschedule`
  ADD CONSTRAINT `att_groupschedule_group_id_c341493f_fk_att_attgroup_id` FOREIGN KEY (`group_id`) REFERENCES `att_attgroup` (`id`),
  ADD CONSTRAINT `att_groupschedule_shift_id_287e7fc0_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`);

--
-- Constraints for table `att_holiday`
--
ALTER TABLE `att_holiday`
  ADD CONSTRAINT `att_holiday_att_group_id_9ddf13ba_fk_att_attgroup_id` FOREIGN KEY (`att_group_id`) REFERENCES `att_attgroup` (`id`),
  ADD CONSTRAINT `att_holiday_department_id_fbbbd185_fk_personnel_department_id` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`);

--
-- Constraints for table `att_leave`
--
ALTER TABLE `att_leave`
  ADD CONSTRAINT `att_leave_pay_code_id_2fadf493_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_leave_workflowinstance_ptr_39aaa9d9_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `att_leavegroup`
--
ALTER TABLE `att_leavegroup`
  ADD CONSTRAINT `att_leavegroup_company_id_a1c75fcb_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`);

--
-- Constraints for table `att_leavegroupdetail`
--
ALTER TABLE `att_leavegroupdetail`
  ADD CONSTRAINT `att_leavegroupdetail_leave_group_id_28f69ada_fk_att_leave` FOREIGN KEY (`leave_group_id`) REFERENCES `att_leavegroup` (`id`),
  ADD CONSTRAINT `att_leavegroupdetail_pay_code_id_5013b373_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_leaveyearbalance`
--
ALTER TABLE `att_leaveyearbalance`
  ADD CONSTRAINT `att_leaveyearbalance_employee_id_14febdb3_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_leaveyearbalance_pay_code_id_82632aca_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_manuallog`
--
ALTER TABLE `att_manuallog`
  ADD CONSTRAINT `att_manuallog_work_code_id_09ac4580_fk_iclock_te` FOREIGN KEY (`work_code_id`) REFERENCES `iclock_terminalworkcode` (`id`),
  ADD CONSTRAINT `att_manuallog_workflowinstance_ptr_22a3fbd0_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `att_overtime`
--
ALTER TABLE `att_overtime`
  ADD CONSTRAINT `att_overtime_pay_code_id_05600ee0_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_overtime_workflowinstance_ptr_6bd6a6f4_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `att_overtimepolicy`
--
ALTER TABLE `att_overtimepolicy`
  ADD CONSTRAINT `att_overtimepolicy_overnight_pay_code_i_274ce1b0_fk_att_payco` FOREIGN KEY (`overnight_pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_overtimepolicy_pay_code_id_285b0a61_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_payloadattcode`
--
ALTER TABLE `att_payloadattcode`
  ADD CONSTRAINT `att_payloadattcode_att_code_id_0d635efd_fk_att_attcode_id` FOREIGN KEY (`att_code_id`) REFERENCES `att_attcode` (`id`),
  ADD CONSTRAINT `att_payloadattcode_emp_id_36569f54_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadattcode_shift_id_731faddf_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`);

--
-- Constraints for table `att_payloadbase`
--
ALTER TABLE `att_payloadbase`
  ADD CONSTRAINT `att_payloadbase_emp_id_2c0f6a7b_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadbase_timetable_id_a389e3d8_fk_att_timeinterval_id` FOREIGN KEY (`timetable_id`) REFERENCES `att_timeinterval` (`id`);

--
-- Constraints for table `att_payloadeffectpunch`
--
ALTER TABLE `att_payloadeffectpunch`
  ADD CONSTRAINT `att_payloadeffectpun_trans_id_94affbe6_fk_iclock_tr` FOREIGN KEY (`trans_id`) REFERENCES `iclock_transaction` (`id`),
  ADD CONSTRAINT `att_payloadeffectpunch_emp_id_67e28e01_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_payloadexception`
--
ALTER TABLE `att_payloadexception`
  ADD CONSTRAINT `att_payloadexception_item_id_a08bfe48_fk_att_leave` FOREIGN KEY (`item_id`) REFERENCES `att_leave` (`workflowinstance_ptr_id`);

--
-- Constraints for table `att_payloadmulpunchset`
--
ALTER TABLE `att_payloadmulpunchset`
  ADD CONSTRAINT `att_payloadmulpunchset_emp_id_f47610c8_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_payloadparing`
--
ALTER TABLE `att_payloadparing`
  ADD CONSTRAINT `att_payloadparing_emp_id_c5daac4f_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadparing_in_trans_id_50a8040e_fk_iclock_transaction_id` FOREIGN KEY (`in_trans_id`) REFERENCES `iclock_transaction` (`id`),
  ADD CONSTRAINT `att_payloadparing_out_trans_id_8b2375b9_fk_iclock_transaction_id` FOREIGN KEY (`out_trans_id`) REFERENCES `iclock_transaction` (`id`),
  ADD CONSTRAINT `att_payloadparing_pay_code_id_aa241cca_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_payloadpaycode`
--
ALTER TABLE `att_payloadpaycode`
  ADD CONSTRAINT `att_payloadpaycode_emp_id_78e75279_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadpaycode_pay_code_id_4a096cc7_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_payloadpaycode_shift_id_79a0901e_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`);

--
-- Constraints for table `att_payloadpunch`
--
ALTER TABLE `att_payloadpunch`
  ADD CONSTRAINT `att_payloadpunch_emp_id_053da2f0_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadpunch_orig_id_16b26416_fk_iclock_transaction_id` FOREIGN KEY (`orig_id`) REFERENCES `iclock_transaction` (`id`);

--
-- Constraints for table `att_payloadtimecard`
--
ALTER TABLE `att_payloadtimecard`
  ADD CONSTRAINT `att_payloadtimecard_emp_id_47caeab4_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `att_payloadtimecard_time_table_id_6e0b0137_fk_att_timei` FOREIGN KEY (`time_table_id`) REFERENCES `att_timeinterval` (`id`);

--
-- Constraints for table `att_payloadworkcodeparing`
--
ALTER TABLE `att_payloadworkcodeparing`
  ADD CONSTRAINT `att_payloadworkcodep_emp_id_4090ec8c_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_reporttemplate`
--
ALTER TABLE `att_reporttemplate`
  ADD CONSTRAINT `att_reporttemplate_builder_id_e1bb15c6_fk_auth_user_id` FOREIGN KEY (`builder_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `att_reporttemplate_employee_id_4f80d866_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_shiftdetail`
--
ALTER TABLE `att_shiftdetail`
  ADD CONSTRAINT `att_shiftdetail_shift_id_7d694501_fk_att_attshift_id` FOREIGN KEY (`shift_id`) REFERENCES `att_attshift` (`id`),
  ADD CONSTRAINT `att_shiftdetail_time_interval_id_777dde8f_fk_att_timeinterval_id` FOREIGN KEY (`time_interval_id`) REFERENCES `att_timeinterval` (`id`);

--
-- Constraints for table `att_temporaryschedule`
--
ALTER TABLE `att_temporaryschedule`
  ADD CONSTRAINT `att_temporaryschedul_employee_id_2b2b94c2_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_tempschedule`
--
ALTER TABLE `att_tempschedule`
  ADD CONSTRAINT `att_tempschedule_employee_id_b89c7e54_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `att_timeinterval`
--
ALTER TABLE `att_timeinterval`
  ADD CONSTRAINT `att_timeinterval_company_id_9824d651_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `att_timeinterval_ot_pay_code_id_17438af8_fk_att_paycode_id` FOREIGN KEY (`ot_pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `att_timeinterval_break_time`
--
ALTER TABLE `att_timeinterval_break_time`
  ADD CONSTRAINT `att_timeinterval_bre_breaktime_id_08462308_fk_att_break` FOREIGN KEY (`breaktime_id`) REFERENCES `att_breaktime` (`id`),
  ADD CONSTRAINT `att_timeinterval_bre_timeinterval_id_2287017e_fk_att_timei` FOREIGN KEY (`timeinterval_id`) REFERENCES `att_timeinterval` (`id`);

--
-- Constraints for table `att_training`
--
ALTER TABLE `att_training`
  ADD CONSTRAINT `att_training_pay_code_id_5790afdd_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `att_training_workflowinstance_ptr_0aef1508_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `att_webpunch`
--
ALTER TABLE `att_webpunch`
  ADD CONSTRAINT `att_webpunch_workflowinstance_ptr_c5f1c02e_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
-- Constraints for table `auth_user_auth_area`
--
ALTER TABLE `auth_user_auth_area`
  ADD CONSTRAINT `auth_user_auth_area_area_id_d1e54c70_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `auth_user_auth_area_myuser_id_5fb9a803_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_auth_dept`
--
ALTER TABLE `auth_user_auth_dept`
  ADD CONSTRAINT `auth_user_auth_dept_department_id_5866c514_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `auth_user_auth_dept_myuser_id_18a51b27_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_myuser_id_d03e8dcc_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_profile`
--
ALTER TABLE `auth_user_profile`
  ADD CONSTRAINT `auth_user_profile_user_id_f9aded29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_myuser_id_679b1527_fk_auth_user_id` FOREIGN KEY (`myuser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_adminlog`
--
ALTER TABLE `base_adminlog`
  ADD CONSTRAINT `base_adminlog_content_type_id_3e553c30_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `base_adminlog_user_id_ecf659f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_autoimporttask`
--
ALTER TABLE `base_autoimporttask`
  ADD CONSTRAINT `base_autoimporttask_company_id_d18431a1_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`);

--
-- Constraints for table `base_bookmark`
--
ALTER TABLE `base_bookmark`
  ADD CONSTRAINT `base_bookmark_content_type_id_b6a0e799_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `base_bookmark_user_id_5f2d5ca2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_linenotifyforemployee`
--
ALTER TABLE `base_linenotifyforemployee`
  ADD CONSTRAINT `base_linenotifyforem_employee_id_42fb91f8_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `base_linenotifysetting`
--
ALTER TABLE `base_linenotifysetting`
  ADD CONSTRAINT `base_linenotifysetti_line_notify_dept_id_0643a5ed_fk_personnel` FOREIGN KEY (`line_notify_dept_id`) REFERENCES `personnel_department` (`id`);

--
-- Constraints for table `base_messengersentlog`
--
ALTER TABLE `base_messengersentlog`
  ADD CONSTRAINT `base_messengersentlo_content_type_id_e6e9b3d5_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `base_messengersentlog_emp_id_44eba15e_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `base_messengersentlog_user_id_64034c70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`);

--
-- Constraints for table `ep_eptransaction`
--
ALTER TABLE `ep_eptransaction`
  ADD CONSTRAINT `ep_eptransaction_emp_id_1006883f_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `ep_eptransaction_terminal_id_4490b209_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_biodata`
--
ALTER TABLE `iclock_biodata`
  ADD CONSTRAINT `iclock_biodata_employee_id_ff748ea7_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `iclock_biophoto`
--
ALTER TABLE `iclock_biophoto`
  ADD CONSTRAINT `iclock_biophoto_employee_id_3dba5819_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `iclock_errorcommandlog`
--
ALTER TABLE `iclock_errorcommandlog`
  ADD CONSTRAINT `iclock_errorcommandl_terminal_id_3b2d7cbd_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_privatemessage`
--
ALTER TABLE `iclock_privatemessage`
  ADD CONSTRAINT `iclock_privatemessag_employee_id_e84a34c0_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `iclock_privatemessag_message_id_e3145d3b_fk_iclock_sh` FOREIGN KEY (`message_id`) REFERENCES `iclock_shortmessage` (`id`);

--
-- Constraints for table `iclock_publicmessage`
--
ALTER TABLE `iclock_publicmessage`
  ADD CONSTRAINT `iclock_publicmessage_message_id_7d125e28_fk_iclock_sh` FOREIGN KEY (`message_id`) REFERENCES `iclock_shortmessage` (`id`),
  ADD CONSTRAINT `iclock_publicmessage_terminal_id_c3b5e4cf_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminal`
--
ALTER TABLE `iclock_terminal`
  ADD CONSTRAINT `iclock_terminal_area_id_c019c6f0_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `iclock_terminalcommand`
--
ALTER TABLE `iclock_terminalcommand`
  ADD CONSTRAINT `iclock_terminalcomma_terminal_id_3dcf836f_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminalcommandlog`
--
ALTER TABLE `iclock_terminalcommandlog`
  ADD CONSTRAINT `iclock_terminalcomma_terminal_id_35ea8b2b_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminallog`
--
ALTER TABLE `iclock_terminallog`
  ADD CONSTRAINT `iclock_terminallog_terminal_id_667b3ea7_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminalparameter`
--
ALTER TABLE `iclock_terminalparameter`
  ADD CONSTRAINT `iclock_terminalparam_terminal_id_443872e3_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminaluploadlog`
--
ALTER TABLE `iclock_terminaluploadlog`
  ADD CONSTRAINT `iclock_terminaluploa_terminal_id_9c9a7664_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_terminalworkcode`
--
ALTER TABLE `iclock_terminalworkcode`
  ADD CONSTRAINT `iclock_terminalworkc_company_id_77625f26_fk_personnel` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `iclock_terminalworkcode_pay_code_id_a8dad5f2_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `iclock_transaction`
--
ALTER TABLE `iclock_transaction`
  ADD CONSTRAINT `iclock_transaction_emp_id_60fa3521_fk_personnel_employee_id` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `iclock_transaction_terminal_id_451c81c2_fk_iclock_terminal_id` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `iclock_transactionproofcmd`
--
ALTER TABLE `iclock_transactionproofcmd`
  ADD CONSTRAINT `iclock_transactionpr_terminal_id_08b81e1e_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `meeting_meetingentity`
--
ALTER TABLE `meeting_meetingentity`
  ADD CONSTRAINT `meeting_meetingentit_workflowinstance_ptr_dbd9ab40_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`),
  ADD CONSTRAINT `meeting_meetingentity_room_id_bc2c738e_fk_meeting_meetingroom_id` FOREIGN KEY (`room_id`) REFERENCES `meeting_meetingroom` (`id`),
  ADD CONSTRAINT `meeting_meetingentity_zoom_id_7f87d666_fk_base_zoomsetting_id` FOREIGN KEY (`zoom_id`) REFERENCES `base_zoomsetting` (`id`);

--
-- Constraints for table `meeting_meetingentity_attender`
--
ALTER TABLE `meeting_meetingentity_attender`
  ADD CONSTRAINT `meeting_meetingentit_employee_id_ee898064_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `meeting_meetingentit_meetingentity_id_b96dbc7d_fk_meeting_m` FOREIGN KEY (`meetingentity_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`);

--
-- Constraints for table `meeting_meetingmanuallog`
--
ALTER TABLE `meeting_meetingmanuallog`
  ADD CONSTRAINT `meeting_meetingmanua_meeting_id_a672eaaf_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`),
  ADD CONSTRAINT `meeting_meetingmanua_workflowinstance_ptr_bd514862_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `meeting_meetingpayloadbase`
--
ALTER TABLE `meeting_meetingpayloadbase`
  ADD CONSTRAINT `meeting_meetingpaylo_emp_id_ed6ec148_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `meeting_meetingpaylo_meeting_id_ca9d20cc_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`);

--
-- Constraints for table `meeting_meetingroomdevice`
--
ALTER TABLE `meeting_meetingroomdevice`
  ADD CONSTRAINT `meeting_meetingroomd_device_id_a09e8a7d_fk_iclock_te` FOREIGN KEY (`device_id`) REFERENCES `iclock_terminal` (`id`),
  ADD CONSTRAINT `meeting_meetingroomd_room_id_e000d78d_fk_meeting_m` FOREIGN KEY (`room_id`) REFERENCES `meeting_meetingroom` (`id`);

--
-- Constraints for table `meeting_meetingtransaction`
--
ALTER TABLE `meeting_meetingtransaction`
  ADD CONSTRAINT `meeting_meetingtrans_emp_id_fbcdd686_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `meeting_meetingtrans_meeting_id_e4e505e5_fk_meeting_m` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meetingentity` (`workflowinstance_ptr_id`),
  ADD CONSTRAINT `meeting_meetingtrans_terminal_id_047426f2_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`);

--
-- Constraints for table `mobile_announcement`
--
ALTER TABLE `mobile_announcement`
  ADD CONSTRAINT `mobile_announcement_admin_id_6af3868c_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `mobile_announcement_init_sender_id_2f5e35bd_fk_personnel` FOREIGN KEY (`init_sender_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `mobile_announcement_receiver_id_ddf2a860_fk_personnel` FOREIGN KEY (`receiver_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `mobile_appnotification`
--
ALTER TABLE `mobile_appnotification`
  ADD CONSTRAINT `mobile_appnotificati_init_sender_id_d8aff845_fk_personnel` FOREIGN KEY (`init_sender_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `mobile_appnotificati_receiver_id_90c4a355_fk_personnel` FOREIGN KEY (`receiver_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `mobile_appnotification_admin_id_29c27197_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mobile_gpsfordepartment`
--
ALTER TABLE `mobile_gpsfordepartment`
  ADD CONSTRAINT `mobile_gpsfordepartm_department_id_988ccf22_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`);

--
-- Constraints for table `mobile_gpsfordepartment_location`
--
ALTER TABLE `mobile_gpsfordepartment_location`
  ADD CONSTRAINT `mobile_gpsfordepartm_gpsfordepartment_id_23e9af3a_fk_mobile_gp` FOREIGN KEY (`gpsfordepartment_id`) REFERENCES `mobile_gpsfordepartment` (`id`),
  ADD CONSTRAINT `mobile_gpsfordepartm_gpslocation_id_48b82e9e_fk_mobile_gp` FOREIGN KEY (`gpslocation_id`) REFERENCES `mobile_gpslocation` (`id`);

--
-- Constraints for table `mobile_gpsforemployee`
--
ALTER TABLE `mobile_gpsforemployee`
  ADD CONSTRAINT `mobile_gpsforemploye_employee_id_982b7cef_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `mobile_gpsforemployee_location`
--
ALTER TABLE `mobile_gpsforemployee_location`
  ADD CONSTRAINT `mobile_gpsforemploye_gpsforemployee_id_a52023d5_fk_mobile_gp` FOREIGN KEY (`gpsforemployee_id`) REFERENCES `mobile_gpsforemployee` (`id`),
  ADD CONSTRAINT `mobile_gpsforemploye_gpslocation_id_497a214f_fk_mobile_gp` FOREIGN KEY (`gpslocation_id`) REFERENCES `mobile_gpslocation` (`id`);

--
-- Constraints for table `mobile_mobileapirequestlog`
--
ALTER TABLE `mobile_mobileapirequestlog`
  ADD CONSTRAINT `mobile_mobileapirequ_user_id_dfd3ded1_fk_personnel` FOREIGN KEY (`user_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_empexpenseexemption`
--
ALTER TABLE `payroll_empexpenseexemption`
  ADD CONSTRAINT `payroll_empexpenseex_employee_id_5372811d_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_emploan`
--
ALTER TABLE `payroll_emploan`
  ADD CONSTRAINT `payroll_emploan_employee_id_97a251ef_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_emppayrollprofile`
--
ALTER TABLE `payroll_emppayrollprofile`
  ADD CONSTRAINT `payroll_emppayrollpr_employee_id_6c97078c_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_exceptionformula`
--
ALTER TABLE `payroll_exceptionformula`
  ADD CONSTRAINT `payroll_exceptionformula_pay_code_id_97609b51_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `payroll_extradeduction`
--
ALTER TABLE `payroll_extradeduction`
  ADD CONSTRAINT `payroll_extradeducti_employee_id_53072441_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `payroll_extradeducti_special_type_id_50673042_fk_payroll_s` FOREIGN KEY (`special_type_id`) REFERENCES `payroll_specialpayment` (`id`);

--
-- Constraints for table `payroll_extraincrease`
--
ALTER TABLE `payroll_extraincrease`
  ADD CONSTRAINT `payroll_extraincreas_employee_id_f902e6bb_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `payroll_extraincreas_special_type_id_d15ce699_fk_payroll_s` FOREIGN KEY (`special_type_id`) REFERENCES `payroll_specialpayment` (`id`);

--
-- Constraints for table `payroll_increasementformula`
--
ALTER TABLE `payroll_increasementformula`
  ADD CONSTRAINT `payroll_increasement_special_type_id_88016f0b_fk_payroll_s` FOREIGN KEY (`special_type_id`) REFERENCES `payroll_specialpayment` (`id`);

--
-- Constraints for table `payroll_leaveformula`
--
ALTER TABLE `payroll_leaveformula`
  ADD CONSTRAINT `payroll_leaveformula_pay_code_id_63c7b4bd_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `payroll_overtimeformula`
--
ALTER TABLE `payroll_overtimeformula`
  ADD CONSTRAINT `payroll_overtimeformula_pay_code_id_36d2f10e_fk_att_paycode_id` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `payroll_payrollpayload`
--
ALTER TABLE `payroll_payrollpayload`
  ADD CONSTRAINT `payroll_payrollpaylo_employee_id_bc868f2b_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_payrollpayloadexpenseexemption`
--
ALTER TABLE `payroll_payrollpayloadexpenseexemption`
  ADD CONSTRAINT `payroll_payrollpaylo_exemption_id_2effb718_fk_payroll_e` FOREIGN KEY (`exemption_id`) REFERENCES `payroll_empexpenseexemption` (`id`),
  ADD CONSTRAINT `payroll_payrollpaylo_payload_id_46c8357d_fk_payroll_p` FOREIGN KEY (`payload_id`) REFERENCES `payroll_payrollpayload` (`id`);

--
-- Constraints for table `payroll_payrollpayloadpaycode`
--
ALTER TABLE `payroll_payrollpayloadpaycode`
  ADD CONSTRAINT `payroll_payrollpaylo_pay_code_id_c057af1f_fk_att_payco` FOREIGN KEY (`pay_code_id`) REFERENCES `att_paycode` (`id`),
  ADD CONSTRAINT `payroll_payrollpaylo_payload_id_f085c4e8_fk_payroll_p` FOREIGN KEY (`payload_id`) REFERENCES `payroll_payrollpayload` (`id`);

--
-- Constraints for table `payroll_reimbursement`
--
ALTER TABLE `payroll_reimbursement`
  ADD CONSTRAINT `payroll_reimbursemen_employee_id_c4bbde36_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_salaryadvance`
--
ALTER TABLE `payroll_salaryadvance`
  ADD CONSTRAINT `payroll_salaryadvanc_employee_id_2abd43e5_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_salarystructure`
--
ALTER TABLE `payroll_salarystructure`
  ADD CONSTRAINT `payroll_salarystruct_employee_id_98996e15_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `payroll_salarystructure_deductionformula`
--
ALTER TABLE `payroll_salarystructure_deductionformula`
  ADD CONSTRAINT `payroll_salarystruct_deductionformula_id_b174d5b6_fk_payroll_d` FOREIGN KEY (`deductionformula_id`) REFERENCES `payroll_deductionformula` (`id`),
  ADD CONSTRAINT `payroll_salarystruct_salarystructure_id_5ca7cdb5_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`);

--
-- Constraints for table `payroll_salarystructure_exceptionformula`
--
ALTER TABLE `payroll_salarystructure_exceptionformula`
  ADD CONSTRAINT `payroll_salarystruct_exceptionformula_id_8f6dadb3_fk_payroll_e` FOREIGN KEY (`exceptionformula_id`) REFERENCES `payroll_exceptionformula` (`id`),
  ADD CONSTRAINT `payroll_salarystruct_salarystructure_id_3c087208_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`);

--
-- Constraints for table `payroll_salarystructure_increasementformula`
--
ALTER TABLE `payroll_salarystructure_increasementformula`
  ADD CONSTRAINT `payroll_salarystruct_increasementformula__3cd77082_fk_payroll_i` FOREIGN KEY (`increasementformula_id`) REFERENCES `payroll_increasementformula` (`id`),
  ADD CONSTRAINT `payroll_salarystruct_salarystructure_id_8752401c_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`);

--
-- Constraints for table `payroll_salarystructure_leaveformula`
--
ALTER TABLE `payroll_salarystructure_leaveformula`
  ADD CONSTRAINT `payroll_salarystruct_leaveformula_id_049f9024_fk_payroll_l` FOREIGN KEY (`leaveformula_id`) REFERENCES `payroll_leaveformula` (`id`),
  ADD CONSTRAINT `payroll_salarystruct_salarystructure_id_cf98fdd7_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`);

--
-- Constraints for table `payroll_salarystructure_overtimeformula`
--
ALTER TABLE `payroll_salarystructure_overtimeformula`
  ADD CONSTRAINT `payroll_salarystruct_overtimeformula_id_40ad89ef_fk_payroll_o` FOREIGN KEY (`overtimeformula_id`) REFERENCES `payroll_overtimeformula` (`id`),
  ADD CONSTRAINT `payroll_salarystruct_salarystructure_id_64f75042_fk_payroll_s` FOREIGN KEY (`salarystructure_id`) REFERENCES `payroll_salarystructure` (`id`);

--
-- Constraints for table `personnel_area`
--
ALTER TABLE `personnel_area`
  ADD CONSTRAINT `personnel_area_company_id_59750eb5_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `personnel_area_parent_area_id_39028fda_fk_personnel_area_id` FOREIGN KEY (`parent_area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `personnel_assignareaemployee`
--
ALTER TABLE `personnel_assignareaemployee`
  ADD CONSTRAINT `personnel_assignarea_area_id_6f049d6a_fk_personnel` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `personnel_assignarea_employee_id_a3d4dd25_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_certification`
--
ALTER TABLE `personnel_certification`
  ADD CONSTRAINT `personnel_certificat_company_id_c1b1bd00_fk_personnel` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`);

--
-- Constraints for table `personnel_department`
--
ALTER TABLE `personnel_department`
  ADD CONSTRAINT `personnel_department_company_id_00867fd8_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `personnel_department_dept_manager_id_c5124a7d_fk_personnel` FOREIGN KEY (`dept_manager_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `personnel_department_parent_dept_id_d0b44024_fk_personnel` FOREIGN KEY (`parent_dept_id`) REFERENCES `personnel_department` (`id`);

--
-- Constraints for table `personnel_employee`
--
ALTER TABLE `personnel_employee`
  ADD CONSTRAINT `personnel_employee_company_id_95b3fd72_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `personnel_employee_department_id_068bbd08_fk_personnel` FOREIGN KEY (`department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `personnel_employee_position_id_c9321343_fk_personnel_position_id` FOREIGN KEY (`position_id`) REFERENCES `personnel_position` (`id`),
  ADD CONSTRAINT `personnel_employee_superior_id_ad6e1c47_fk_personnel_employee_id` FOREIGN KEY (`superior_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employeecalendar`
--
ALTER TABLE `personnel_employeecalendar`
  ADD CONSTRAINT `personnel_employeeca_employee_id_165e0779_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employeecertification`
--
ALTER TABLE `personnel_employeecertification`
  ADD CONSTRAINT `personnel_employeece_certification_id_faabed40_fk_personnel` FOREIGN KEY (`certification_id`) REFERENCES `personnel_certification` (`id`),
  ADD CONSTRAINT `personnel_employeece_employee_id_b7bd3867_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employeeextrainfo`
--
ALTER TABLE `personnel_employeeextrainfo`
  ADD CONSTRAINT `personnel_employeeex_employee_id_41e2b04d_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employeeprofile`
--
ALTER TABLE `personnel_employeeprofile`
  ADD CONSTRAINT `personnel_employeepr_emp_id_3a69c313_fk_personnel` FOREIGN KEY (`emp_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employee_area`
--
ALTER TABLE `personnel_employee_area`
  ADD CONSTRAINT `personnel_employee_a_employee_id_8e5cec21_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `personnel_employee_area_area_id_64c21925_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`);

--
-- Constraints for table `personnel_employee_area_privilege`
--
ALTER TABLE `personnel_employee_area_privilege`
  ADD CONSTRAINT `personnel_employee_a_area_id_6e42535e_fk_personnel` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `personnel_employee_a_employee_id_1ee6fb47_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_employee_flow_role`
--
ALTER TABLE `personnel_employee_flow_role`
  ADD CONSTRAINT `personnel_employee_f_employee_id_c27f8a56_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `personnel_employee_f_workflowrole_id_4704db32_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`);

--
-- Constraints for table `personnel_employment`
--
ALTER TABLE `personnel_employment`
  ADD CONSTRAINT `personnel_employment_employee_id_f797c7d9_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `personnel_position`
--
ALTER TABLE `personnel_position`
  ADD CONSTRAINT `personnel_position_company_id_f06c5d2a_fk_personnel_company_id` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `personnel_position_parent_position_id_a496a36b_fk_personnel` FOREIGN KEY (`parent_position_id`) REFERENCES `personnel_position` (`id`);

--
-- Constraints for table `personnel_resign`
--
ALTER TABLE `personnel_resign`
  ADD CONSTRAINT `personnel_resign_employee_id_dd9b7e08_fk_personnel_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `rest_framework_tracking_apirequestlog`
--
ALTER TABLE `rest_framework_tracking_apirequestlog`
  ADD CONSTRAINT `rest_framework_track_user_id_671b70b7_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `staff_stafftoken`
--
ALTER TABLE `staff_stafftoken`
  ADD CONSTRAINT `staff_stafftoken_user_id_39c937fa_fk_personnel_employee_id` FOREIGN KEY (`user_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `tblbatch`
--
ALTER TABLE `tblbatch`
  ADD CONSTRAINT `tblbatch_departmentid_foreign` FOREIGN KEY (`DepartmentID`) REFERENCES `tbldepartment` (`DepartmentID`);

--
-- Constraints for table `tbldevice`
--
ALTER TABLE `tbldevice`
  ADD CONSTRAINT `tbldevice_roomid_foreign` FOREIGN KEY (`RoomID`) REFERENCES `tblroom` (`RoomID`) ON UPDATE CASCADE;

--
-- Constraints for table `tblleave`
--
ALTER TABLE `tblleave`
  ADD CONSTRAINT `tblleave_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `tblleavetype` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tblrosterassignment`
--
ALTER TABLE `tblrosterassignment`
  ADD CONSTRAINT `tblrosterassignment_batchid_foreign` FOREIGN KEY (`BatchID`) REFERENCES `tblbatch` (`BatchID`),
  ADD CONSTRAINT `tblrosterassignment_departmentid_foreign` FOREIGN KEY (`DepartmentID`) REFERENCES `tbldepartment` (`DepartmentID`),
  ADD CONSTRAINT `tblrosterassignment_deviceid_foreign` FOREIGN KEY (`DeviceID`) REFERENCES `tbldevice` (`DeviceID`),
  ADD CONSTRAINT `tblrosterassignment_proxypersonid_foreign` FOREIGN KEY (`ProxyPersonID`) REFERENCES `tblrosterperson` (`RosterPersonID`),
  ADD CONSTRAINT `tblrosterassignment_rosterlocationid_foreign` FOREIGN KEY (`RosterLocationID`) REFERENCES `tblrosterlocation` (`RosterLocationID`),
  ADD CONSTRAINT `tblrosterassignment_rosterpersonid_foreign` FOREIGN KEY (`RosterPersonID`) REFERENCES `tblrosterperson` (`RosterPersonID`),
  ADD CONSTRAINT `tblrosterassignment_rostershiftid_foreign` FOREIGN KEY (`RosterShiftID`) REFERENCES `tblrostershift` (`RosterShiftID`),
  ADD CONSTRAINT `tblrosterassignment_subjectid_foreign` FOREIGN KEY (`SubjectID`) REFERENCES `tblsubject` (`SubjectID`);

--
-- Constraints for table `tblrosterlocation`
--
ALTER TABLE `tblrosterlocation`
  ADD CONSTRAINT `tblrosterlocation_deviceid_foreign` FOREIGN KEY (`DeviceID`) REFERENCES `tbldevice` (`DeviceID`) ON DELETE SET NULL;

--
-- Constraints for table `tblroutine`
--
ALTER TABLE `tblroutine`
  ADD CONSTRAINT `tblroutine_batchid_foreign` FOREIGN KEY (`BatchID`) REFERENCES `tblbatch` (`BatchID`),
  ADD CONSTRAINT `tblroutine_deviceid_foreign` FOREIGN KEY (`DeviceID`) REFERENCES `tbldevice` (`DeviceID`),
  ADD CONSTRAINT `tblroutine_proxyteacherid_foreign` FOREIGN KEY (`ProxyTeacherID`) REFERENCES `tblteacher` (`TeacherID`),
  ADD CONSTRAINT `tblroutine_roomid_foreign` FOREIGN KEY (`RoomID`) REFERENCES `tblroom` (`RoomID`),
  ADD CONSTRAINT `tblroutine_subjectid_foreign` FOREIGN KEY (`SubjectID`) REFERENCES `tblsubject` (`SubjectID`),
  ADD CONSTRAINT `tblroutine_teacherid_foreign` FOREIGN KEY (`TeacherID`) REFERENCES `tblteacher` (`TeacherID`);

--
-- Constraints for table `tblsubject`
--
ALTER TABLE `tblsubject`
  ADD CONSTRAINT `tblsubject_departmentid_foreign` FOREIGN KEY (`DepartmentID`) REFERENCES `tbldepartment` (`DepartmentID`);

--
-- Constraints for table `tblteacher`
--
ALTER TABLE `tblteacher`
  ADD CONSTRAINT `tblteacher_departmentid_foreign` FOREIGN KEY (`DepartmentID`) REFERENCES `tbldepartment` (`DepartmentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tblteacher_designationid_foreign` FOREIGN KEY (`DesignationID`) REFERENCES `tbldesignation` (`DesignationID`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_rosterpersonid_foreign` FOREIGN KEY (`RosterPersonID`) REFERENCES `tblrosterperson` (`RosterPersonID`) ON DELETE SET NULL;

--
-- Constraints for table `visitor_reservation`
--
ALTER TABLE `visitor_reservation`
  ADD CONSTRAINT `visitor_reservation_cert_type_id_4f047f2a_fk_visitor_v` FOREIGN KEY (`cert_type_id`) REFERENCES `visitor_visitorcertification` (`id`),
  ADD CONSTRAINT `visitor_reservation_visit_department_id_2d293e10_fk_personnel` FOREIGN KEY (`visit_department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `visitor_reservation_visit_reason_id_c9ac83ac_fk_visitor_r` FOREIGN KEY (`visit_reason_id`) REFERENCES `visitor_reason` (`id`),
  ADD CONSTRAINT `visitor_reservation_workflowinstance_ptr_3787bcd6_fk_workflow_` FOREIGN KEY (`workflowinstance_ptr_id`) REFERENCES `workflow_workflowinstance` (`id`);

--
-- Constraints for table `visitor_visitor`
--
ALTER TABLE `visitor_visitor`
  ADD CONSTRAINT `visitor_visitor_cert_type_id_f62ea604_fk_visitor_v` FOREIGN KEY (`cert_type_id`) REFERENCES `visitor_visitorcertification` (`id`),
  ADD CONSTRAINT `visitor_visitor_visit_department_id_f7dbdcb4_fk_personnel` FOREIGN KEY (`visit_department_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `visitor_visitor_visit_reason_id_4b9a2d23_fk_visitor_reason_id` FOREIGN KEY (`visit_reason_id`) REFERENCES `visitor_reason` (`id`),
  ADD CONSTRAINT `visitor_visitor_visited_id_8043a7ea_fk_personnel_employee_id` FOREIGN KEY (`visited_id`) REFERENCES `personnel_employee` (`id`);

--
-- Constraints for table `visitor_visitorbiodata`
--
ALTER TABLE `visitor_visitorbiodata`
  ADD CONSTRAINT `visitor_visitorbiodata_visitor_id_b944ed37_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `visitor_visitorbiophoto`
--
ALTER TABLE `visitor_visitorbiophoto`
  ADD CONSTRAINT `visitor_visitorbioph_visitor_id_9816daf7_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `visitor_visitorlog`
--
ALTER TABLE `visitor_visitorlog`
  ADD CONSTRAINT `visitor_visitorlog_visitor_id_ebaafde1_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `visitor_visitortransaction`
--
ALTER TABLE `visitor_visitortransaction`
  ADD CONSTRAINT `visitor_visitortrans_terminal_id_7527ef69_fk_iclock_te` FOREIGN KEY (`terminal_id`) REFERENCES `iclock_terminal` (`id`),
  ADD CONSTRAINT `visitor_visitortrans_visitor_id_0ee95624_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `visitor_visitor_acc_groups`
--
ALTER TABLE `visitor_visitor_acc_groups`
  ADD CONSTRAINT `visitor_visitor_acc__accgroups_id_b1487149_fk_acc_accgr` FOREIGN KEY (`accgroups_id`) REFERENCES `acc_accgroups` (`id`),
  ADD CONSTRAINT `visitor_visitor_acc__visitor_id_8ce09562_fk_visitor_v` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `visitor_visitor_area`
--
ALTER TABLE `visitor_visitor_area`
  ADD CONSTRAINT `visitor_visitor_area_area_id_b402c047_fk_personnel_area_id` FOREIGN KEY (`area_id`) REFERENCES `personnel_area` (`id`),
  ADD CONSTRAINT `visitor_visitor_area_visitor_id_98d7ed05_fk_visitor_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor_visitor` (`id`);

--
-- Constraints for table `workflow_nodeinstance`
--
ALTER TABLE `workflow_nodeinstance`
  ADD CONSTRAINT `workflow_nodeinstanc_approver_employee_id_d36cd45d_fk_personnel` FOREIGN KEY (`approver_employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `workflow_nodeinstanc_workflow_instance_id_afe84fe4_fk_workflow_` FOREIGN KEY (`workflow_instance_id`) REFERENCES `workflow_workflowinstance` (`id`),
  ADD CONSTRAINT `workflow_nodeinstanc_workflow_node_id_166f36c4_fk_workflow_` FOREIGN KEY (`workflow_node_id`) REFERENCES `workflow_workflownode` (`id`);

--
-- Constraints for table `workflow_workflowengine`
--
ALTER TABLE `workflow_workflowengine`
  ADD CONSTRAINT `workflow_workfloweng_applicant_position_i_8a65e03a_fk_personnel` FOREIGN KEY (`applicant_position_id`) REFERENCES `personnel_position` (`id`),
  ADD CONSTRAINT `workflow_workfloweng_company_id_c42adcb0_fk_personnel` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `workflow_workfloweng_content_type_id_f7345c20_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `workflow_workfloweng_departments_id_0f06d4c7_fk_personnel` FOREIGN KEY (`departments_id`) REFERENCES `personnel_department` (`id`),
  ADD CONSTRAINT `workflow_workflowengine_leave_type_id_7f03c9cc_fk_att_paycode_id` FOREIGN KEY (`leave_type_id`) REFERENCES `att_paycode` (`id`);

--
-- Constraints for table `workflow_workflowengine_employee`
--
ALTER TABLE `workflow_workflowengine_employee`
  ADD CONSTRAINT `workflow_workfloweng_employee_id_803a409e_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `workflow_workfloweng_workflowengine_id_6ebcc5f2_fk_workflow_` FOREIGN KEY (`workflowengine_id`) REFERENCES `workflow_workflowengine` (`id`);

--
-- Constraints for table `workflow_workflowinstance`
--
ALTER TABLE `workflow_workflowinstance`
  ADD CONSTRAINT `workflow_workflowins_employee_id_c7cff08e_fk_personnel` FOREIGN KEY (`employee_id`) REFERENCES `personnel_employee` (`id`),
  ADD CONSTRAINT `workflow_workflowins_workflow_engine_id_1e6ac40f_fk_workflow_` FOREIGN KEY (`workflow_engine_id`) REFERENCES `workflow_workflowengine` (`id`);

--
-- Constraints for table `workflow_workflownode`
--
ALTER TABLE `workflow_workflownode`
  ADD CONSTRAINT `workflow_workflownod_workflow_engine_id_04c8f470_fk_workflow_` FOREIGN KEY (`workflow_engine_id`) REFERENCES `workflow_workflowengine` (`id`);

--
-- Constraints for table `workflow_workflownode_approver`
--
ALTER TABLE `workflow_workflownode_approver`
  ADD CONSTRAINT `workflow_workflownod_workflownode_id_d814c941_fk_workflow_` FOREIGN KEY (`workflownode_id`) REFERENCES `workflow_workflownode` (`id`),
  ADD CONSTRAINT `workflow_workflownod_workflowrole_id_c8e00d42_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`);

--
-- Constraints for table `workflow_workflownode_notifier`
--
ALTER TABLE `workflow_workflownode_notifier`
  ADD CONSTRAINT `workflow_workflownod_workflownode_id_57298016_fk_workflow_` FOREIGN KEY (`workflownode_id`) REFERENCES `workflow_workflownode` (`id`),
  ADD CONSTRAINT `workflow_workflownod_workflowrole_id_73de7fc2_fk_workflow_` FOREIGN KEY (`workflowrole_id`) REFERENCES `workflow_workflowrole` (`id`);

--
-- Constraints for table `workflow_workflowrole`
--
ALTER TABLE `workflow_workflowrole`
  ADD CONSTRAINT `workflow_workflowrol_company_id_bbb75590_fk_personnel` FOREIGN KEY (`company_id`) REFERENCES `personnel_company` (`id`),
  ADD CONSTRAINT `workflow_workflowrol_parent_role_id_91433355_fk_workflow_` FOREIGN KEY (`parent_role_id`) REFERENCES `workflow_workflowrole` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
