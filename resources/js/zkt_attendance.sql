-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2026 at 09:35 AM
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
(22, 'InstallDate', '', '997b1wKvZ0SzLyRvbdtoVPaD4ktEC1RBDZu1BHK4vJ3aTIbWpIk2'),
(23, 'SysDate', '', '997b1wKvZ0SzLyRvbdtoVPaD4ktEC1RBDZu1BHK4vJ3aTIbWpIk2'),
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
(1, '2026-10-25 15:08:57.147265', NULL, '2026-10-25 15:08:57.147265', NULL, 0, '1', 'default', 1);

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
(1, '2026-10-25 15:08:57.232018', NULL, '2026-10-25 15:08:57.232018', NULL, 0, 1, 7, 7, 0, 12.0, '00:00:00.000000', 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 100, 100, 1, 60, 1, 60, 0, 0, 0, '00:00:00.000000', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, -1, 0, NULL, 0, 0);

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
(1, '2026-10-25 15:08:55.403001', NULL, '2026-10-25 15:08:55.403001', NULL, 0, 'REG', 'Regular', 1, NULL, 1, 1, 8.00, 1, 0, 1, 0.1, 2, 'P', 1, NULL, 1, 1, NULL),
(2, '2026-10-25 15:08:55.452849', NULL, '2026-10-25 15:08:55.452849', NULL, 0, 'L', 'Late In', 4, NULL, 2, 1, 8.00, 1, 0, 1, 1.0, 1, 'L', 2, NULL, 1, 1, NULL),
(3, '2026-10-25 15:08:55.500524', NULL, '2026-10-25 15:08:55.500524', NULL, 0, 'E', 'Early Out', 4, NULL, 3, 1, 8.00, 1, 0, 1, 1.0, 1, 'E', 3, NULL, 1, 1, NULL),
(4, '2026-10-25 15:08:55.566457', NULL, '2026-10-25 15:08:55.566457', NULL, 0, 'A', 'Absence', 4, NULL, 4, 1, 8.00, 1, 0, 1, 0.1, 2, 'A', 4, NULL, 1, 1, NULL),
(5, '2026-10-25 15:08:55.588130', NULL, '2026-10-25 15:08:55.588130', NULL, 0, 'NOT', 'Normal OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 5, NULL, 1, 1, NULL),
(6, '2026-10-25 15:08:55.621981', NULL, '2026-10-25 15:08:55.621981', NULL, 0, 'WOT', 'Weekend OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 6, NULL, 1, 1, NULL),
(7, '2026-10-25 15:08:55.663822', NULL, '2026-10-25 15:08:55.663822', NULL, 0, 'HOT', 'Holiday OT', 2, NULL, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 7, NULL, 1, 1, NULL),
(8, '2026-10-25 15:08:55.795590', NULL, '2026-10-25 15:08:55.795590', NULL, 0, 'OT1', 'OT1', 2, 6, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 8, NULL, 1, 1, NULL),
(9, '2026-10-25 15:08:55.858483', NULL, '2026-10-25 15:08:55.858483', NULL, 0, 'OT2', 'OT2', 2, 7, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 9, NULL, 1, 1, NULL),
(10, '2026-10-25 15:08:55.890243', NULL, '2026-10-25 15:08:55.890243', NULL, 0, 'OT3', 'OT3', 2, 8, NULL, 1, 8.00, 1, 0, 1, 0.1, 2, '', 10, NULL, 1, 1, NULL),
(11, '2026-10-25 15:08:55.922471', NULL, '2026-10-25 15:08:55.922471', NULL, 0, 'AL', 'Annual Leave', 3, NULL, NULL, 0, 8.00, 1, 1, 1, 0.1, 2, '', 11, NULL, 1, 1, NULL),
(12, '2026-10-25 15:08:55.955820', NULL, '2026-10-25 15:08:55.955820', NULL, 0, 'SL', 'Sick Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 12, NULL, 1, 1, NULL),
(13, '2026-10-25 15:08:55.987570', NULL, '2026-10-25 15:08:55.987570', NULL, 0, 'CL', 'Casual Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 13, NULL, 1, 1, NULL),
(14, '2026-10-25 15:08:56.022799', NULL, '2026-10-25 15:08:56.022799', NULL, 0, 'ML', 'Maternity Leave', 3, NULL, NULL, 0, 8.00, 0, 1, 1, 0.1, 2, '', 14, NULL, 1, 1, NULL),
(15, '2026-10-25 15:08:56.074612', NULL, '2026-10-25 15:08:56.074612', NULL, 0, 'COL', 'Compassionate Leave', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 15, NULL, 1, 1, NULL),
(16, '2026-10-25 15:08:56.115226', NULL, '2026-10-25 15:08:56.115226', NULL, 0, 'BT', 'Business Trip', 3, NULL, NULL, 0, 8.00, 0, 0, 1, 0.1, 2, '', 16, NULL, 1, 1, NULL),
(17, '2026-10-25 15:08:56.147510', NULL, '2026-10-25 15:08:56.147510', NULL, 0, 'CP', 'Compensatory', 1, NULL, 5, 0, 8.00, 0, 0, 1, 0.1, 2, '', 17, NULL, 1, 1, NULL),
(18, '2026-10-25 15:08:56.183230', NULL, '2026-10-25 15:08:56.183230', NULL, 0, 'CPL', 'Compensatory Leave', 3, NULL, 6, 0, 8.00, 0, 0, 1, 0.1, 2, '', 18, NULL, 1, 1, NULL);

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
(1, '2026-10-25 15:08:45.804288', NULL, '2026-10-25 15:08:45.804288', NULL, 0, 11, 0, 1, 1, NULL, '', 0),
(2, '2026-10-25 15:08:45.859336', NULL, '2026-10-25 15:08:45.859336', NULL, 0, 11, 0, 2, 1, NULL, '', 0),
(3, '2026-10-25 15:08:45.906565', NULL, '2026-10-25 15:08:45.906565', NULL, 0, 11, 0, 3, 1, NULL, '', 0),
(4, '2026-10-25 15:08:45.953945', NULL, '2026-10-25 15:08:45.953945', NULL, 0, 11, 0, 7, 1, NULL, '', 0),
(5, '2026-10-25 15:08:45.986214', NULL, '2026-10-25 15:08:45.986214', NULL, 0, 12, 121, 4, 1, NULL, '', 0),
(6, '2026-10-25 15:08:46.018505', NULL, '2026-10-25 15:08:46.018505', NULL, 0, 12, 121, 5, 1, NULL, '', 0),
(7, '2026-10-25 15:08:46.091727', NULL, '2026-10-25 15:08:46.091727', NULL, 0, 12, 121, 6, 1, NULL, '', 0),
(8, '2026-10-25 15:08:46.117758', NULL, '2026-10-25 15:08:46.117758', NULL, 0, 12, 122, 4, 1, NULL, '', 0),
(9, '2026-10-25 15:08:46.145336', NULL, '2026-10-25 15:08:46.145336', NULL, 0, 12, 122, 5, 1, NULL, '', 0),
(10, '2026-10-25 15:08:46.192659', NULL, '2026-10-25 15:08:46.192659', NULL, 0, 12, 122, 6, 1, NULL, '', 0),
(11, '2026-10-25 15:08:46.240614', NULL, '2026-10-25 15:08:46.240614', NULL, 0, 12, 123, 4, 1, NULL, '', 0),
(12, '2026-10-25 15:08:46.287888', NULL, '2026-10-25 15:08:46.287888', NULL, 0, 12, 123, 5, 1, NULL, '', 0),
(13, '2026-10-25 15:08:46.320133', NULL, '2026-10-25 15:08:46.320133', NULL, 0, 12, 123, 6, 1, NULL, '', 0),
(14, '2026-10-25 15:08:46.367822', NULL, '2026-10-25 15:08:46.367822', NULL, 0, 12, 124, 4, 1, NULL, '', 0),
(15, '2026-10-25 15:08:46.416741', NULL, '2026-10-25 15:08:46.416741', NULL, 0, 12, 124, 5, 1, NULL, '', 0),
(16, '2026-10-25 15:08:46.449579', NULL, '2026-10-25 15:08:46.449579', NULL, 0, 12, 124, 6, 1, NULL, '', 0),
(17, '2026-10-25 15:08:46.487020', NULL, '2026-10-25 15:08:46.487020', NULL, 0, 12, 125, 4, 1, NULL, '', 0),
(18, '2026-10-25 15:08:46.519827', NULL, '2026-10-25 15:08:46.519827', NULL, 0, 12, 125, 5, 1, NULL, '', 0),
(19, '2026-10-25 15:08:46.551537', NULL, '2026-10-25 15:08:46.551537', NULL, 0, 12, 125, 6, 1, NULL, '', 0),
(20, '2026-10-25 15:08:46.583778', NULL, '2026-10-25 15:08:46.583778', NULL, 0, 13, 1310, 4, 1, NULL, '', 0),
(21, '2026-10-25 15:08:46.633507', NULL, '2026-10-25 15:08:46.633507', NULL, 0, 13, 1310, 5, 1, NULL, '', 0),
(22, '2026-10-25 15:08:46.663029', NULL, '2026-10-25 15:08:46.663029', NULL, 0, 13, 1310, 6, 1, NULL, '', 0),
(23, '2026-10-25 15:08:46.773096', NULL, '2026-10-25 15:08:46.773096', NULL, 0, 13, 1311, 4, 1, NULL, '', 0),
(24, '2026-10-25 15:08:46.818695', NULL, '2026-10-25 15:08:46.818695', NULL, 0, 13, 1311, 5, 1, NULL, '', 0),
(25, '2026-10-25 15:08:46.852904', NULL, '2026-10-25 15:08:46.852904', NULL, 0, 13, 1311, 6, 1, NULL, '', 0),
(26, '2026-10-25 15:08:46.900720', NULL, '2026-10-25 15:08:46.900720', NULL, 0, 14, 149, 4, 1, NULL, '', 0),
(27, '2026-10-25 15:08:46.948973', NULL, '2026-10-25 15:08:46.948973', NULL, 0, 14, 149, 5, 1, NULL, '', 0),
(28, '2026-10-25 15:08:46.981591', NULL, '2026-10-25 15:08:46.981591', NULL, 0, 14, 149, 6, 1, NULL, '', 0),
(29, '2026-10-25 15:08:47.029842', NULL, '2026-10-25 15:08:47.029842', NULL, 0, 15, 0, 201, 1, NULL, '', 0),
(30, '2026-10-25 15:08:47.078216', NULL, '2026-10-25 15:08:47.078216', NULL, 0, 16, 0, 202, 1, NULL, '', 0),
(31, '2026-10-25 15:08:47.110134', NULL, '2026-10-25 15:08:47.110134', NULL, 0, 17, 0, 203, 1, NULL, '', 0),
(32, '2026-10-25 15:08:47.142402', NULL, '2026-10-25 15:08:47.142402', NULL, 0, 18, 0, 14, 1, NULL, '', 0),
(33, '2026-10-25 15:08:47.190890', NULL, '2026-10-25 15:08:47.190890', NULL, 0, 18, 0, 15, 1, NULL, '', 0),
(34, '2026-10-25 15:08:47.223196', NULL, '2026-10-25 15:08:47.223196', NULL, 0, 21, 0, 1, 2, NULL, '', 0),
(35, '2026-10-25 15:08:47.254986', NULL, '2026-10-25 15:08:47.254986', NULL, 0, 21, 0, 2, 2, NULL, '', 0),
(36, '2026-10-25 15:08:47.286310', NULL, '2026-10-25 15:08:47.286310', NULL, 0, 21, 0, 3, 2, NULL, '', 0),
(37, '2026-10-25 15:08:47.318832', NULL, '2026-10-25 15:08:47.318832', NULL, 0, 21, 0, 7, 2, NULL, '', 0),
(38, '2026-10-25 15:08:47.352546', NULL, '2026-10-25 15:08:47.352546', NULL, 0, 22, 0, 201, 2, NULL, '', 0),
(39, '2026-10-25 15:08:47.407795', NULL, '2026-10-25 15:08:47.407795', NULL, 0, 32, 321, 4, 3, NULL, '', 0),
(40, '2026-10-25 15:08:47.436176', NULL, '2026-10-25 15:08:47.436176', NULL, 0, 32, 321, 5, 3, NULL, '', 0),
(41, '2026-10-25 15:08:47.474575', NULL, '2026-10-25 15:08:47.474575', NULL, 0, 32, 321, 6, 3, NULL, '', 0),
(42, '2026-10-25 15:08:47.507845', NULL, '2026-10-25 15:08:47.507845', NULL, 0, 32, 322, 4, 3, NULL, '', 0),
(43, '2026-10-25 15:08:47.531898', NULL, '2026-10-25 15:08:47.531898', NULL, 0, 32, 322, 5, 3, NULL, '', 0),
(44, '2026-10-25 15:08:47.569343', NULL, '2026-10-25 15:08:47.569343', NULL, 0, 32, 322, 6, 3, NULL, '', 0),
(45, '2026-10-25 15:08:47.617467', NULL, '2026-10-25 15:08:47.617467', NULL, 0, 32, 323, 4, 3, NULL, '', 0),
(46, '2026-10-25 15:08:47.658944', NULL, '2026-10-25 15:08:47.658944', NULL, 0, 32, 323, 5, 3, NULL, '', 0),
(47, '2026-10-25 15:08:47.695995', NULL, '2026-10-25 15:08:47.695995', NULL, 0, 32, 323, 6, 3, NULL, '', 0),
(48, '2026-10-25 15:08:47.813374', NULL, '2026-10-25 15:08:47.813374', NULL, 0, 32, 324, 4, 3, NULL, '', 0),
(49, '2026-10-25 15:08:47.860577', NULL, '2026-10-25 15:08:47.860577', NULL, 0, 32, 324, 5, 3, NULL, '', 0),
(50, '2026-10-25 15:08:47.886004', NULL, '2026-10-25 15:08:47.886004', NULL, 0, 32, 324, 6, 3, NULL, '', 0),
(51, '2026-10-25 15:08:47.933723', NULL, '2026-10-25 15:08:47.933723', NULL, 0, 32, 325, 4, 3, NULL, '', 0),
(52, '2026-10-25 15:08:47.977351', NULL, '2026-10-25 15:08:47.977351', NULL, 0, 32, 325, 5, 3, NULL, '', 0),
(53, '2026-10-25 15:08:48.032944', NULL, '2026-10-25 15:08:48.032944', NULL, 0, 32, 325, 6, 3, NULL, '', 0),
(54, '2026-10-25 15:08:48.064396', NULL, '2026-10-25 15:08:48.064396', NULL, 0, 33, 3310, 4, 3, NULL, '', 0),
(55, '2026-10-25 15:08:48.096379', NULL, '2026-10-25 15:08:48.096379', NULL, 0, 33, 3310, 5, 3, NULL, '', 0),
(56, '2026-10-25 15:08:48.145405', NULL, '2026-10-25 15:08:48.145405', NULL, 0, 33, 3310, 6, 3, NULL, '', 0),
(57, '2026-10-25 15:08:48.177750', NULL, '2026-10-25 15:08:48.177750', NULL, 0, 33, 3311, 4, 3, NULL, '', 0),
(58, '2026-10-25 15:08:48.225669', NULL, '2026-10-25 15:08:48.225669', NULL, 0, 33, 3311, 5, 3, NULL, '', 0),
(59, '2026-10-25 15:08:48.286473', NULL, '2026-10-25 15:08:48.287296', NULL, 0, 33, 3311, 6, 3, NULL, '', 0),
(60, '2026-10-25 15:08:48.337195', NULL, '2026-10-25 15:08:48.337195', NULL, 0, 34, 349, 4, 3, NULL, '', 0),
(61, '2026-10-25 15:08:48.371612', NULL, '2026-10-25 15:08:48.371612', NULL, 0, 34, 349, 5, 3, NULL, '', 0),
(62, '2026-10-25 15:08:48.409173', NULL, '2026-10-25 15:08:48.409173', NULL, 0, 34, 349, 6, 3, NULL, '', 0),
(63, '2026-10-25 15:08:48.449816', NULL, '2026-10-25 15:08:48.449816', NULL, 0, 42, 421, 4, 4, NULL, '', 0),
(64, '2026-10-25 15:08:48.498552', NULL, '2026-10-25 15:08:48.498552', NULL, 0, 42, 421, 5, 4, NULL, '', 0),
(65, '2026-10-25 15:08:48.532440', NULL, '2026-10-25 15:08:48.532440', NULL, 0, 42, 421, 6, 4, NULL, '', 0),
(66, '2026-10-25 15:08:48.552317', NULL, '2026-10-25 15:08:48.552317', NULL, 0, 42, 422, 4, 4, NULL, '', 0),
(67, '2026-10-25 15:08:48.600196', NULL, '2026-10-25 15:08:48.600196', NULL, 0, 42, 422, 5, 4, NULL, '', 0),
(68, '2026-10-25 15:08:48.631712', NULL, '2026-10-25 15:08:48.631712', NULL, 0, 42, 422, 6, 4, NULL, '', 0),
(69, '2026-10-25 15:08:48.665508', NULL, '2026-10-25 15:08:48.665508', NULL, 0, 42, 423, 4, 4, NULL, '', 0),
(70, '2026-10-25 15:08:48.809914', NULL, '2026-10-25 15:08:48.809914', NULL, 0, 42, 423, 5, 4, NULL, '', 0),
(71, '2026-10-25 15:08:48.853546', NULL, '2026-10-25 15:08:48.853546', NULL, 0, 42, 423, 6, 4, NULL, '', 0),
(72, '2026-10-25 15:08:48.969409', NULL, '2026-10-25 15:08:48.969409', NULL, 0, 42, 424, 4, 4, NULL, '', 0),
(73, '2026-10-25 15:08:49.066121', NULL, '2026-10-25 15:08:49.066121', NULL, 0, 42, 424, 5, 4, NULL, '', 0),
(74, '2026-10-25 15:08:49.098166', NULL, '2026-10-25 15:08:49.098166', NULL, 0, 42, 424, 6, 4, NULL, '', 0),
(75, '2026-10-25 15:08:49.129854', NULL, '2026-10-25 15:08:49.129854', NULL, 0, 42, 425, 4, 4, NULL, '', 0),
(76, '2026-10-25 15:08:49.161398', NULL, '2026-10-25 15:08:49.161398', NULL, 0, 42, 425, 5, 4, NULL, '', 0),
(77, '2026-10-25 15:08:49.193561', NULL, '2026-10-25 15:08:49.193561', NULL, 0, 42, 425, 6, 4, NULL, '', 0),
(78, '2026-10-25 15:08:49.283323', NULL, '2026-10-25 15:08:49.283323', NULL, 0, 43, 4310, 4, 4, NULL, '', 0),
(79, '2026-10-25 15:08:49.316792', NULL, '2026-10-25 15:08:49.316792', NULL, 0, 43, 4310, 5, 4, NULL, '', 0),
(80, '2026-10-25 15:08:49.353930', NULL, '2026-10-25 15:08:49.353930', NULL, 0, 43, 4310, 6, 4, NULL, '', 0),
(81, '2026-10-25 15:08:49.399564', NULL, '2026-10-25 15:08:49.399564', NULL, 0, 43, 4311, 4, 4, NULL, '', 0),
(82, '2026-10-25 15:08:49.431738', NULL, '2026-10-25 15:08:49.431738', NULL, 0, 43, 4311, 5, 4, NULL, '', 0),
(83, '2026-10-25 15:08:49.464125', NULL, '2026-10-25 15:08:49.464125', NULL, 0, 43, 4311, 6, 4, NULL, '', 0),
(84, '2026-10-25 15:08:49.498797', NULL, '2026-10-25 15:08:49.498797', NULL, 0, 44, 449, 4, 4, NULL, '', 0),
(85, '2026-10-25 15:08:49.527159', NULL, '2026-10-25 15:08:49.527159', NULL, 0, 44, 449, 5, 4, NULL, '', 0),
(86, '2026-10-25 15:08:49.591793', NULL, '2026-10-25 15:08:49.591793', NULL, 0, 44, 449, 6, 4, NULL, '', 0),
(87, '2026-10-25 15:08:49.623829', NULL, '2026-10-25 15:08:49.623829', NULL, 0, 0, 0, 101, 5, NULL, '', 0),
(88, '2026-10-25 15:08:49.655764', NULL, '2026-10-25 15:08:49.655764', NULL, 0, 0, 0, 102, 5, NULL, '', 0);

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
(1, '2026-10-25 15:08:49.711576', NULL, '2026-10-25 15:08:49.711576', NULL, 0, 1, 'menu_att_manualLog', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(2, '2026-10-25 15:08:49.800457', NULL, '2026-10-25 15:08:49.800457', NULL, 0, 2, 'menu_att_leave', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(3, '2026-10-25 15:08:49.848992', NULL, '2026-10-25 15:08:49.848992', NULL, 0, 3, 'menu_att_overtime', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(4, '2026-10-25 15:08:49.897562', NULL, '2026-10-25 15:08:49.897562', NULL, 0, 4, 'menu_att_training', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(5, '2026-10-25 15:08:49.929426', NULL, '2026-10-25 15:08:49.929426', NULL, 0, 5, 'menu_att_adjustSchedule', 'menu_attendance', 'menu_group_approvalManagement', 1, 1, 0, 0, 0, 0),
(6, '2026-10-25 15:08:49.961702', NULL, '2026-10-25 15:08:49.961702', NULL, 0, 6, 'payCode.default.lateIn', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(7, '2026-10-25 15:08:49.994368', NULL, '2026-10-25 15:08:49.994368', NULL, 0, 7, 'payCode.default.earlyOut', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(8, '2026-10-25 15:08:50.033330', NULL, '2026-10-25 15:08:50.033330', NULL, 0, 8, 'payCode.default.absence', 'menu_attendance', 'menu_group_att_rule', 1, 1, 0, 0, 0, 0),
(9, '2026-10-25 15:08:50.066576', NULL, '2026-10-25 15:08:50.066576', NULL, 0, 9, 'menu.visitor.registration', 'menu.visitor.registration.visitor', 'menu.visitor.reservation', 1, 0, 0, 0, 0, 0),
(10, '2026-10-25 15:08:50.100197', NULL, '2026-10-25 15:08:50.100197', NULL, 0, 10, 'meeting.menus.meeting', 'meeting.menus.meeting', 'meeting.menus.meeting', 1, 0, 0, 0, 0, 0),
(11, '2026-10-25 15:08:50.148070', NULL, '2026-10-25 15:08:50.148070', NULL, 0, 11, 'meeting.menus.manualLog', 'meeting.menus.meeting', 'meeting.menus.manualLog', 1, 0, 0, 0, 0, 0),
(12, '2026-10-25 15:08:50.179888', NULL, '2026-10-25 15:08:50.179888', NULL, 0, 12, 'menu_device_publicMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0, 0, 0),
(13, '2026-10-25 15:08:50.212318', NULL, '2026-10-25 15:08:50.212318', NULL, 0, 13, 'menu_device_privateMessage', 'menu_group_device_deviceManagement', 'menu_mobile_announcement', 0, 1, 0, 0, 0, 0),
(14, '2026-10-25 15:08:50.243150', NULL, '2026-10-25 15:08:50.243150', NULL, 0, 14, 'transaction_punchState_checkIn', 'menu_device_terminal', 'menu_device_transaction', 0, 0, 0, 0, 0, 0),
(15, '2026-10-25 15:08:50.276877', NULL, '2026-10-25 15:08:50.276877', NULL, 0, 15, 'transaction_punchState_checkOut', 'menu_device_terminal', 'menu_device_transaction', 0, 0, 0, 0, 0, 0);

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
(22, 'installdate', '', '4532zGHV6JA6Q9VETt_OlKfmmw6XRQbr4k_w4nYIECzPuXej56iL'),
(23, 'sys_date', '', '4532zGHV6JA6Q9VETt_OlKfmmw6XRQbr4k_w4nYIECzPuXej56iL'),
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
(1, 'personnel', '0001_initial', '2026-10-25 15:01:18.228250'),
(2, 'contenttypes', '0001_initial', '2026-10-25 15:01:19.282417'),
(3, 'contenttypes', '0002_remove_content_type_name', '2026-10-25 15:01:20.265431'),
(4, 'workflow', '0001_initial', '2026-10-25 15:01:41.310585'),
(5, 'iclock', '0001_initial', '2026-10-25 15:01:47.518445'),
(6, 'auth', '0001_initial', '2026-10-25 15:01:50.735308'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-10-25 15:01:51.247380'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-10-25 15:01:51.295150'),
(9, 'auth', '0004_alter_user_username_opts', '2026-10-25 15:01:51.327043'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-10-25 15:01:51.374494'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-10-25 15:01:51.406840'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-10-25 15:01:51.439273'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-10-25 15:01:51.487458'),
(14, 'base', '0001_initial', '2026-10-25 15:01:57.884685'),
(15, 'accounts', '0001_initial', '2026-10-25 15:02:01.374937'),
(16, 'base', '0002_auto_20200901_1642', '2026-10-25 15:02:06.283427'),
(17, 'att', '0001_initial', '2026-10-25 15:02:09.031656'),
(18, 'att', '0002_auto_20200901_1642', '2026-10-25 15:03:12.387407'),
(19, 'personnel', '0002_auto_20200901_1642', '2026-10-25 15:03:26.135483'),
(20, 'acc', '0001_initial', '2026-10-25 15:03:27.738914'),
(21, 'acc', '0002_auto_20200901_1642', '2026-10-25 15:03:32.879987'),
(22, 'acc', '0003_auto_20200901_1642', '2026-10-25 15:03:38.252038'),
(23, 'acc', '0004_auto_20210721_1158', '2026-10-25 15:03:38.616830'),
(24, 'acc', '0005_auto_20210908_1006', '2026-10-25 15:03:38.680534'),
(25, 'personnel', '0003_auto_20201229_0852', '2026-10-25 15:03:41.429259'),
(26, 'personnel', '0004_auto_20210908_1006', '2026-10-25 15:03:47.417483'),
(27, 'base', '0003_auto_20201229_0852', '2026-10-25 15:03:50.423516'),
(28, 'base', '0004_auto_20210908_1006', '2026-10-25 15:03:54.618451'),
(29, 'base', '0005_auto_20211201_1434', '2026-10-25 15:03:54.937968'),
(30, 'personnel', '0005_auto_20211201_1434', '2026-10-25 15:03:59.299551'),
(31, 'personnel', '0006_auto_20211201_1516', '2026-10-25 15:03:59.443143'),
(32, 'personnel', '0007_auto_20211201_1602', '2026-10-25 15:04:06.161120'),
(33, 'personnel', '0008_auto_20220106_1103', '2026-10-25 15:04:07.174385'),
(34, 'personnel', '0009_auto_20220419_1516', '2026-10-25 15:04:07.874992'),
(35, 'personnel', '0010_auto_20221202_1852', '2026-10-25 15:04:07.956496'),
(36, 'personnel', '0011_auto_20230223_1026', '2026-10-25 15:04:12.936927'),
(37, 'personnel', '0012_901_attr_type_change', '2026-10-25 15:04:13.118733'),
(38, 'personnel', '0013_alter_area_area_name_alter_certification_cert_name_and_more', '2026-10-25 15:04:17.882370'),
(39, 'accounts', '0002_auto_20200901_1642', '2026-10-25 15:04:25.190170'),
(40, 'accounts', '0003_auto_20201021_1551', '2026-10-25 15:04:25.248556'),
(41, 'accounts', '0004_auto_20201229_0852', '2026-10-25 15:04:25.665317'),
(42, 'accounts', '0005_auto_20210908_1006', '2026-10-25 15:04:25.760186'),
(43, 'accounts', '0006_myuser_assign_company', '2026-10-25 15:04:26.011360'),
(44, 'accounts', '0007_auto_20220106_1103', '2026-10-25 15:04:26.087623'),
(45, 'accounts', '0008_auto_20230223_1026', '2026-10-25 15:04:26.186950'),
(46, 'accounts', '0009_userprofile_employee_fields', '2026-10-25 15:04:27.136887'),
(47, 'accounts', '0010_901_notification_category', '2026-10-25 15:04:27.305722'),
(48, 'accounts', '0011_903_emoloyee_noticifation', '2026-10-25 15:04:29.754026'),
(49, 'accounts', '0012_auto_20241212_20114', '2026-10-25 15:04:30.082615'),
(50, 'accounts', '0013_auto_20250103_20141', '2026-10-25 15:04:30.993036'),
(51, 'admin', '0001_initial', '2026-10-25 15:04:33.290896'),
(52, 'admin', '0002_logentry_remove_auto_add', '2026-10-25 15:04:33.332712'),
(53, 'admin', '0003_logentry_add_action_flag_choices', '2026-10-25 15:04:33.403084'),
(54, 'base', '0006_autoimporttask_company', '2026-10-25 15:04:34.955467'),
(55, 'base', '0007_auto_20221202_1852', '2026-10-25 15:04:35.005320'),
(56, 'att', '0003_auto_20200909_1810', '2026-10-25 15:04:35.469930'),
(57, 'att', '0004_auto_20201021_1551', '2026-10-25 15:04:36.138974'),
(58, 'att', '0005_auto_20201106_1538', '2026-10-25 15:04:36.785083'),
(59, 'att', '0006_auto_20201116_1052', '2026-10-25 15:04:36.832441'),
(60, 'att', '0007_auto_20201229_0852', '2026-10-25 15:04:47.254359'),
(61, 'att', '0008_auto_20210908_1006', '2026-10-25 15:05:05.436958'),
(62, 'att', '0009_reporttemplate_employee', '2026-10-25 15:05:06.453923'),
(63, 'att', '0010_auto_20220106_1103', '2026-10-25 15:05:11.789491'),
(64, 'att', '0011_auto_20220118_1536', '2026-10-25 15:05:11.913078'),
(65, 'att', '0012_auto_20220419_1516', '2026-10-25 15:05:12.793861'),
(66, 'att', '0013_auto_20221202_1852', '2026-10-25 15:05:13.148286'),
(67, 'att', '0014_auto_20230223_1026', '2026-10-25 15:05:27.209621'),
(68, 'att', '0015_alter_holiday_end_date', '2026-10-25 15:05:27.347846'),
(69, 'att', '0016_903_calculate_workcode', '2026-10-25 15:05:30.882672'),
(70, 'att', '0017_pro_903_2024090600', '2026-10-25 15:05:30.949366'),
(71, 'att', '0018_auto_20250214_20236', '2026-10-25 15:05:31.030799'),
(72, 'auth', '0009_alter_user_last_name_max_length', '2026-10-25 15:05:31.077737'),
(73, 'auth', '0010_alter_group_name_max_length', '2026-10-25 15:05:31.472904'),
(74, 'auth', '0011_update_proxy_permissions', '2026-10-25 15:05:31.699405'),
(75, 'auth', '0012_alter_user_first_name_max_length', '2026-10-25 15:05:31.744644'),
(76, 'authtoken', '0001_initial', '2026-10-25 15:05:32.784754'),
(77, 'authtoken', '0002_auto_20160226_1747', '2026-10-25 15:05:32.908370'),
(78, 'authtoken', '0003_tokenproxy', '2026-10-25 15:05:32.957131'),
(79, 'base', '0008_auto_20230223_1026', '2026-10-25 15:05:36.454097'),
(80, 'base', '0009_auto_20230411_1415', '2026-10-25 15:05:37.057003'),
(81, 'base', '0010_901_zoomsetting', '2026-10-25 15:05:38.277370'),
(82, 'base', '0011_901_backup_db_encrypt', '2026-10-25 15:05:38.843018'),
(83, 'base', '0012_linenotifysetting_send_photo_linenotifyforemployee', '2026-10-25 15:05:40.264282'),
(84, 'base', '0013_alter_syncarea_area_name_and_more', '2026-10-25 15:05:43.035166'),
(85, 'base', '0014_eventalertsetting_lineapp_alert', '2026-10-25 15:05:43.270618'),
(86, 'base', '0015_auto_20241212_20114', '2026-10-25 15:05:43.761736'),
(87, 'base', '0015_pro_903_2024090600', '2026-10-25 15:05:44.201621'),
(88, 'base', '0016_v904', '2026-10-25 15:05:44.496655'),
(89, 'django_celery_beat', '0001_initial', '2026-10-25 15:05:47.601892'),
(90, 'django_celery_beat', '0002_auto_20161118_0346', '2026-10-25 15:05:49.091385'),
(91, 'django_celery_beat', '0003_auto_20161209_0049', '2026-10-25 15:05:49.321133'),
(92, 'django_celery_beat', '0004_auto_20170221_0000', '2026-10-25 15:05:49.357485'),
(93, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2026-10-25 15:05:49.493341'),
(94, 'django_celery_beat', '0006_auto_20180322_0932', '2026-10-25 15:05:50.063076'),
(95, 'django_celery_beat', '0007_auto_20180521_0826', '2026-10-25 15:05:50.573591'),
(96, 'django_celery_beat', '0008_auto_20180914_1922', '2026-10-25 15:05:50.674591'),
(97, 'django_celery_beat', '0006_auto_20180210_1226', '2026-10-25 15:05:50.742273'),
(98, 'django_celery_beat', '0006_periodictask_priority', '2026-10-25 15:05:51.968722'),
(99, 'django_celery_beat', '0009_periodictask_headers', '2026-10-25 15:05:53.261322'),
(100, 'django_celery_beat', '0010_auto_20190429_0326', '2026-10-25 15:05:53.476747'),
(101, 'django_celery_beat', '0011_auto_20190508_0153', '2026-10-25 15:05:54.710777'),
(102, 'django_celery_beat', '0012_periodictask_expire_seconds', '2026-10-25 15:05:55.920385'),
(103, 'django_celery_beat', '0013_auto_20200609_0727', '2026-10-25 15:05:55.954454'),
(104, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2026-10-25 15:05:56.167120'),
(105, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2026-10-25 15:05:56.223773'),
(106, 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2026-10-25 15:05:56.281150'),
(107, 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2026-10-25 15:05:56.353493'),
(108, 'django_celery_beat', '0018_improve_crontab_helptext', '2026-10-25 15:05:56.441264'),
(109, 'visitor', '0001_initial', '2026-10-25 15:05:56.830320'),
(110, 'visitor', '0002_reservation_visitor_visitorconfig_visitorlog', '2026-10-25 15:06:10.824653'),
(111, 'iclock', '0002_auto_20200901_1642', '2026-10-25 15:06:25.677306'),
(112, 'ep', '0001_initial', '2026-10-25 15:06:28.148156'),
(113, 'ep', '0002_auto_20201217_1608', '2026-10-25 15:06:29.230723'),
(114, 'ep', '0003_auto_20201229_0852', '2026-10-25 15:06:29.262581'),
(115, 'iclock', '0003_auto_20201229_0852', '2026-10-25 15:06:31.121305'),
(116, 'iclock', '0004_auto_20210908_1006', '2026-10-25 15:06:35.862260'),
(117, 'iclock', '0005_terminalworkcode_company', '2026-10-25 15:06:36.819909'),
(118, 'iclock', '0006_auto_20220419_1516', '2026-10-25 15:06:37.703237'),
(119, 'iclock', '0007_auto_20221202_1852', '2026-10-25 15:06:37.918897'),
(120, 'iclock', '0008_auto_20230223_1026', '2026-10-25 15:06:37.981816'),
(121, 'iclock', '0009_auto_20230411_1415', '2026-10-25 15:06:39.335367'),
(122, 'iclock', '0010_901_push_version_width', '2026-10-25 15:06:39.670572'),
(123, 'iclock', '0012_alter_biophoto_first_name_alter_biophoto_last_name_and_more', '2026-10-25 15:06:42.419097'),
(124, 'iclock', '903_workcode_add_paycode', '2026-10-25 15:06:43.788646'),
(125, 'meeting', '0001_initial', '2026-10-25 15:06:57.242076'),
(126, 'meeting', '0002_meetingroom_enable_room', '2026-10-25 15:06:57.533212'),
(127, 'meeting', '0003_auto_20210908_1006', '2026-10-25 15:07:03.438506'),
(128, 'meeting', '0004_901_meetingzoom', '2026-10-25 15:07:04.335957'),
(129, 'mobile', '0001_initial', '2026-10-25 15:07:06.034386'),
(130, 'mobile', '0002_auto_20200901_1642', '2026-10-25 15:07:12.852559'),
(131, 'mobile', '0003_auto_20201229_0852', '2026-10-25 15:07:19.305494'),
(132, 'mobile', '0004_mobileapirequestlog', '2026-10-25 15:07:22.119782'),
(133, 'mobile', '0005_location_field_type_903', '2026-10-25 15:07:23.436040'),
(134, 'payroll', '0001_initial', '2026-10-25 15:07:29.429134'),
(135, 'payroll', '0002_auto_20200901_1642', '2026-10-25 15:07:39.840691'),
(136, 'payroll', '0003_auto_20200901_1642', '2026-10-25 15:07:47.890122'),
(137, 'payroll', '0004_auto_20210908_1006', '2026-10-25 15:07:48.213551'),
(138, 'payroll', '0005_auto_20221202_1852', '2026-10-25 15:07:48.293101'),
(139, 'payroll', '0006_901_salary_th', '2026-10-25 15:07:54.267446'),
(140, 'payroll', '0007_extradeduction_special_type_and_more', '2026-10-25 15:07:55.891297'),
(141, 'payroll', '0008_pro_903_2024090600', '2026-10-25 15:07:56.784080'),
(142, 'personnel', '0014_auto_20241212_20114', '2026-10-25 15:07:57.196076'),
(143, 'personnel', '0015_auto_20250102_20141', '2026-10-25 15:07:57.373823'),
(144, 'personnel', '0016_pro_903_2024090600', '2026-10-25 15:08:01.117012'),
(145, 'rest_framework_tracking', '0001_initial', '2026-10-25 15:08:02.552539'),
(146, 'rest_framework_tracking', '0002_auto_20170118_1713', '2026-10-25 15:08:03.537840'),
(147, 'rest_framework_tracking', '0003_add_errors', '2026-10-25 15:08:03.847321'),
(148, 'rest_framework_tracking', '0004_add_verbose_name', '2026-10-25 15:08:03.887109'),
(149, 'rest_framework_tracking', '0005_auto_20171219_1537', '2026-10-25 15:08:04.036383'),
(150, 'rest_framework_tracking', '0006_view_and_view_method_nullable', '2026-10-25 15:08:06.488669'),
(151, 'rest_framework_tracking', '0006_auto_20180315_1442', '2026-10-25 15:08:06.619333'),
(152, 'rest_framework_tracking', '0007_merge_20180419_1646', '2026-10-25 15:08:06.720429'),
(153, 'rest_framework_tracking', '0008_auto_20200201_2048', '2026-10-25 15:08:07.023016'),
(154, 'rest_framework_tracking', '0009_view_method_max_length_200', '2026-10-25 15:08:08.171879'),
(155, 'rest_framework_tracking', '0010_auto_20200609_1404', '2026-10-25 15:08:08.286009'),
(156, 'rest_framework_tracking', '0011_auto_20201117_2016', '2026-10-25 15:08:08.502653'),
(157, 'sessions', '0001_initial', '2026-10-25 15:08:09.102696'),
(158, 'staff', '0001_initial', '2026-10-25 15:08:10.270535'),
(159, 'staff', '0002_approvalchangeschedule_approvalleave_approvalmanuallog_approvalovertime_approvaltraining_pendingchan', '2026-10-25 15:08:10.353516'),
(160, 'staff_meeting', '0001_initial', '2026-10-25 15:08:10.403511'),
(161, 'visitor', '0003_reservation_email', '2026-10-25 15:08:10.597643'),
(162, 'visitor', '0004_auto_20210908_1006', '2026-10-25 15:08:15.502717'),
(163, 'visitor', '0005_auto_20211201_1434', '2026-10-25 15:08:15.569403'),
(164, 'staff_visitor', '0001_initial', '2026-10-25 15:08:15.610604'),
(165, 'visitor', '0006_auto_20220419_1516', '2026-10-25 15:08:16.222446'),
(166, 'visitor', '0007_auto_20221202_1852', '2026-10-25 15:08:16.286486'),
(167, 'visitor', '0008_auto_20230411_1415', '2026-10-25 15:08:17.052641'),
(168, 'visitor', '0009_alter_visitorbiophoto_first_name_and_more', '2026-10-25 15:08:18.340358'),
(169, 'visitor', '0010_alter_bio_type_903', '2026-10-25 15:08:18.393581'),
(170, 'visitor', '0011_pro_903_2024090900', '2026-10-25 15:08:22.135996'),
(171, 'workflow', '0002_auto_20211201_1434', '2026-10-25 15:08:22.285973'),
(172, 'workflow', '0003_auto_20221202_1852', '2026-10-25 15:08:22.419287'),
(173, 'workflow', '0004_auto_20230223_1026', '2026-10-25 15:08:24.445303'),
(174, 'workflow', '0005_auto_20230411_1415', '2026-10-25 15:08:29.903200');

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
(1, '2026-10-25 15:09:08.569427', NULL, '2026-10-25 15:09:08.569427', NULL, 0, 1, 37.3, 99.2, 1, 1, 1);

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
(1, '2026-10-25 15:08:52.315885', NULL, '2026-10-25 15:08:52.315885', NULL, 0, 0, 0, 1, 1, 1, 1, 1, 8, 0, 10, 1, 1, '00:00;14:05', 9999, 9999, 9999, 9999, 0, 0, 0, 3, 3, 1, '00:00;12:00', 0);

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
(38, '2026_10_25_000000_link_zkt_devices_to_roster_locations', 1);

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
(1, '1', 'company.default', 1, NULL, NULL, '2026-10-25 15:04:09.121292', NULL, NULL, NULL, '2026-10-25 15:04:09.975322', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL);

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
(1, 15, 10, 10, 15, '2026-10-25 08:59:49', '2026-10-25 08:59:49');

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
(1, 'Law', 'Law', 1, NULL, NULL),
(2, 'English', 'English', 1, NULL, NULL),
(3, 'CSE', 'Computer Science & Engineering', 1, NULL, NULL),
(4, 'Science & Humanities', 'Science & Humanities', 1, NULL, NULL),
(5, 'Adjunct Faculty', 'Adjunct Faculty', 1, NULL, NULL);

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
(1, 'Associate Professor and Head of the Department', 1, NULL, NULL),
(2, 'Assistant Professor', 1, NULL, NULL),
(3, 'Assistant Professor & Program Coordinator', 1, NULL, NULL),
(4, 'Lecturer', 1, NULL, NULL),
(5, 'District & Sessions Judge', 1, NULL, NULL),
(6, 'Professor, Comilla University', 1, NULL, NULL),
(7, 'Advocate', 1, NULL, NULL),
(8, 'Joint District & Sessions Judge', 1, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `tblrosterperson`
--

CREATE TABLE `tblrosterperson` (
  `RosterPersonID` bigint UNSIGNED NOT NULL,
  `SourceTeacherID` bigint UNSIGNED DEFAULT NULL,
  `EmployeeCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `tblrosterperson` (`RosterPersonID`, `SourceTeacherID`, `EmployeeCode`, `PersonName`, `RoleName`, `DepartmentName`, `DepartmentID`, `DesignationID`, `RunsRoster`, `WorkMode`, `ZKUserID`, `Status`, `created_at`, `updated_at`) VALUES
(1, NULL, '22-71-08', 'Dr. Md. Nayem Alimul Hyder', 'Associate Professor and Head of the Department', 'Law', 1, 1, 1, 'Both', '22-71-08', 1, '2026-10-25 09:15:03', '2026-10-25 09:15:03'),
(2, NULL, '19-71-05', 'Mst. Rezwana Karim', 'Assistant Professor', 'Law', 1, 2, 1, 'Both', '19-71-05', 1, '2026-10-25 09:20:27', '2026-10-25 09:20:27'),
(3, NULL, '19-71-06', 'Dipannita Kundu Rumki', 'Assistant Professor', 'Law', 1, 2, 1, 'Both', '19-71-06', 1, '2026-10-25 09:22:08', '2026-10-25 09:22:08'),
(4, NULL, '24-71-13', 'Tanjila Tamanna', 'Assistant Professor & Program Coordinator', 'Law', 1, 3, 1, 'Both', '24-71-13', 1, '2026-10-25 09:23:11', '2026-10-25 09:29:47'),
(5, NULL, '22-71-09', 'Shadab Bin Ashraf', 'Assistant Professor', 'Law', 1, 2, 1, 'Both', '22-71-09', 1, '2026-10-25 09:24:47', '2026-10-25 09:24:47'),
(6, NULL, '22-71-10', 'Nadia Islam Nody', 'Assistant Professor', 'Law', 1, 2, 1, 'Both', '22-71-10', 1, '2026-10-25 09:26:13', '2026-10-25 09:26:13'),
(7, NULL, '23-71-11', 'Md Shamim Ahmed', 'Assistant Professor', 'Law', 1, 2, 1, 'Both', '23-71-11', 1, '2026-10-25 09:27:13', '2026-10-25 09:29:39'),
(8, NULL, '24-71-15', 'Lamia Dilshad Waziha', 'Lecturer', 'Law', 1, 4, 1, 'Both', '24-71-15', 1, '2026-10-25 09:28:08', '2026-10-25 09:28:08'),
(9, NULL, '25-71-17', 'Saimur Rahman', 'Lecturer', 'Law', 1, 4, 1, 'Both', '25-71-17', 1, '2026-10-25 09:29:06', '2026-10-25 09:29:06'),
(10, NULL, '26-71-19', 'Sadd Been Hossain Fahim', 'Lecturer', 'Law', 1, 4, 1, 'Both', '26-71-19', 1, '2026-10-25 09:30:33', '2026-10-25 09:30:33'),
(11, NULL, '26-41-37', 'Anisur Rahman', 'Lecturer', 'English', 2, 4, 1, 'Both', '26-41-37', 1, '2026-10-25 09:32:06', '2026-10-25 09:32:06'),
(12, NULL, '24-11-61', 'Saad Bin Kamal', 'Lecturer', 'Computer Science & Engineering', 3, 4, 1, 'Both', '24-11-61', 1, '2026-10-25 09:33:06', '2026-10-25 09:33:06'),
(13, NULL, '25-42-41', 'Sharmin Akter', 'Lecturer', 'Science & Humanities', 4, 4, 1, 'Both', '25-42-41', 1, '2026-10-25 09:34:11', '2026-10-25 09:34:11'),
(14, NULL, '26-42-49', 'Nazmul Alam Ridoy', 'Lecturer', 'Science & Humanities', 4, 4, 1, 'Both', '26-42-49', 1, '2026-10-25 09:35:01', '2026-10-25 09:35:01');

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
(1, 15, 10, 10, 15, '2026-10-25 08:59:58', '2026-10-25 08:59:58');

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
(1, 'Super Admin', 'admin@baiust.com', NULL, '$2y$12$0PFvO4d6tf0J78Hof9.BzOjBzA.znoXrRMNFR4kh7afXEK/ZxiHMe', 'superadmin', NULL, NULL, '2026-10-25 09:00:11', '2026-10-25 09:00:11'),
(2, 'Dr. Md. Nayem Alimul Hyder', 'head.law@baiust.ac.bd', NULL, '$2y$12$87aIdvP7MIN7Kp5fh1.c9OvgVFLYqQw9tBecA2i0c5GxgWNVoUFva', 'employee', 1, NULL, '2026-10-25 09:15:04', '2026-10-25 09:15:04'),
(3, 'Mst. Rezwana Karim', 'rezwana.law@baiust.ac.bd', NULL, '$2y$12$6N8nF21sATMBAlq0/zwMm.1VgC2INVI9TlLT1MFDpLuuzaxIfd5za', 'employee', 2, NULL, '2026-10-25 09:20:27', '2026-10-25 09:20:27'),
(4, 'Dipannita Kundu Rumki', 'drumki.law@baiust.ac.bd', NULL, '$2y$12$jC1F4VUdMzNwGaSNXGGCx.waPXI55JooWf2/2RHHLZ5zU8hA1CcJ.', 'employee', 3, NULL, '2026-10-25 09:22:08', '2026-10-25 09:22:08'),
(5, 'Tanjila Tamanna', 'tanjila.law@baiust.ac.bd', NULL, '$2y$12$wEVNaApwD9UoN7choS7hcuwa5h3yPRmG1wpOgsSjLCCKGbwRURFLm', 'employee', 4, NULL, '2026-10-25 09:23:12', '2026-10-25 09:23:12'),
(6, 'Shadab Bin Ashraf', 'ashraf.law@baiust.ac.bd', NULL, '$2y$12$sAN0DzBWG.6QgyYjNoET1e46dS/Uvto9VAsl6SVbEJeXVUqy2kZrK', 'employee', 5, NULL, '2026-10-25 09:24:47', '2026-10-25 09:24:47'),
(7, 'Nadia Islam Nody', 'nadia.law@baiust.ac.bd', NULL, '$2y$12$pKopoOieHmDdpz176pm1veCkVlx7jJUgadtqmutS/48YMXw4l3oui', 'employee', 6, NULL, '2026-10-25 09:26:13', '2026-10-25 09:26:13'),
(8, 'Md Shamim Ahmed', 'mdshamim.law@baiust.ac.bd', NULL, '$2y$12$NdfFig2PMds.f8i1NigLVOwEf9rrff40oYrWnk7OlL6F9loExE9Li', 'employee', 7, NULL, '2026-10-25 09:27:13', '2026-10-25 09:27:13'),
(9, 'Lamia Dilshad Waziha', 'lamia.law@baiust.ac.bd', NULL, '$2y$12$eeM6l14zE3yD9ilurqIm.O7T2fnN/FjdBk9Y85TtJgOZobVLeewJy', 'employee', 8, NULL, '2026-10-25 09:28:08', '2026-10-25 09:28:08'),
(10, 'Saimur Rahman', 'saimur.law@baiust.ac.bd', NULL, '$2y$12$VT2zAgB5vXyvUU7XCHtsB.g8B8V9Y2Cf94bd4jxnVcoMk/45BM4tm', 'employee', 9, NULL, '2026-10-25 09:29:06', '2026-10-25 09:29:06'),
(11, 'Sadd Been Hossain Fahim', 'fahim.law@baiust.ac.bd', NULL, '$2y$12$g/ome2w0DC4C6g5YCQPuv.DwU0jOqfzWYp.7nAWT7DbVoxq9.Tv3u', 'employee', 10, NULL, '2026-10-25 09:30:33', '2026-10-25 09:30:33'),
(12, 'Anisur Rahman', 'anis.english@baiust.ac.bd', NULL, '$2y$12$25JKSTsu2klVVfsTTw264.9nAfaSCvqQl2Kol/Mp8OOV.d4Xi6efm', 'employee', 11, NULL, '2026-10-25 09:32:06', '2026-10-25 09:32:06'),
(13, 'Saad Bin Kamal', 'saad.cse@baiust.ac.bd', NULL, '$2y$12$U9K4bWmUo1yf2xTZy7NXS.NtmI8BDioHIPBKHfU/AKNWHbBT4ehRu', 'employee', 12, NULL, '2026-10-25 09:33:07', '2026-10-25 09:33:07'),
(14, 'Sharmin Akter', 'sharmin.scnhum@baiust.ac.bd', NULL, '$2y$12$2IvRmUCY3LgYqVhjqKGs.eRjryGb7mMYweR31wP9A0ffn5WItPXKy', 'employee', 13, NULL, '2026-10-25 09:34:11', '2026-10-25 09:34:11'),
(15, 'Nazmul Alam Ridoy', 'nazmul.scnhum@baiust.ac.bd', NULL, '$2y$12$K7OMkbIMyzZxK2Yr5mpnFu.J0274XJ6o60W/8jG2gaQAevQuoevVi', 'employee', 14, NULL, '2026-10-25 09:35:01', '2026-10-25 09:35:01');

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
(1, '2026-10-25 15:09:07.220319', NULL, '2026-10-25 15:09:07.220319', NULL, 0, 1, 'V', 8, 1, NULL, 0, 9999);

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
  ADD UNIQUE KEY `tblrosterperson_zkuserid_unique` (`ZKUserID`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `BatchID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `DepartmentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbldesignation`
--
ALTER TABLE `tbldesignation`
  MODIFY `DesignationID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbldevice`
--
ALTER TABLE `tbldevice`
  MODIFY `DeviceID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `RosterAssignmentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblrosterlocation`
--
ALTER TABLE `tblrosterlocation`
  MODIFY `RosterLocationID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblrosterperson`
--
ALTER TABLE `tblrosterperson`
  MODIFY `RosterPersonID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `SubjectID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblteacher`
--
ALTER TABLE `tblteacher`
  MODIFY `TeacherID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
