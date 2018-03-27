-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2018 at 11:46 AM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruizeanm_ruizean_markets`
--

-- --------------------------------------------------------

--
-- Table structure for table `cc_admin_email`
--

CREATE TABLE `cc_admin_email` (
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员邮箱';

--
-- Dumping data for table `cc_admin_email`
--

INSERT INTO `cc_admin_email` (`email`) VALUES
('it.admin@ruizean.com');

-- --------------------------------------------------------

--
-- Table structure for table `cc_adver`
--

CREATE TABLE `cc_adver` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `marginTop` int(11) NOT NULL DEFAULT '0',
  `marginSide` int(11) NOT NULL DEFAULT '0',
  `isApproved` int(1) NOT NULL DEFAULT '0',
  `isAutoClose` int(1) NOT NULL DEFAULT '0',
  `isOnlyDefault` int(1) NOT NULL DEFAULT '0',
  `isShowOnce` int(1) NOT NULL DEFAULT '0',
  `lang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc_config_data`
--

CREATE TABLE `cc_config_data` (
  `key` varchar(50) NOT NULL,
  `val` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='所有设置数据';

-- --------------------------------------------------------

--
-- Table structure for table `cc_contact`
--

CREATE TABLE `cc_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `subscribe` int(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(10) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `createip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系我们相关';

-- --------------------------------------------------------

--
-- Table structure for table `cc_google_analytics`
--

CREATE TABLE `cc_google_analytics` (
  `email` varchar(100) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cc_google_analytics`
--

INSERT INTO `cc_google_analytics` (`email`, `pwd`) VALUES
('', '');

-- --------------------------------------------------------

--
-- Table structure for table `cc_home_character_value`
--

CREATE TABLE `cc_home_character_value` (
  `spread` varchar(20) NOT NULL,
  `leverage` varchar(20) NOT NULL,
  `banks` varchar(20) NOT NULL,
  `kindsOfProducts` varchar(20) NOT NULL,
  `lowestSaving` varchar(20) NOT NULL,
  `fundsMethod` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Homepage charater value';

--
-- Dumping data for table `cc_home_character_value`
--

INSERT INTO `cc_home_character_value` (`spread`, `leverage`, `banks`, `kindsOfProducts`, `lowestSaving`, `fundsMethod`, `id`) VALUES
('0.1', '400:1', '22', '65+', '200', '6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_ibcontact`
--

CREATE TABLE `cc_ibcontact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `subscribe` int(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(10) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `createip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ib data collection';

-- --------------------------------------------------------

--
-- Table structure for table `cc_info`
--

CREATE TABLE `cc_info` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL DEFAULT '0',
  `classId` varchar(200) NOT NULL,
  `ordinal` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `subTitle` varchar(200) NOT NULL,
  `titleStyle` varchar(200) DEFAULT NULL,
  `alias` varchar(1000) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pageTitle` varchar(200) DEFAULT NULL,
  `keywords` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `publishedDate` varchar(10) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `intro` text,
  `content` longtext,
  `imageUrl` varchar(100) DEFAULT NULL,
  `bigImageUrl` varchar(100) DEFAULT NULL,
  `images` text,
  `files` text,
  `filename` varchar(200) DEFAULT NULL,
  `isApproved` smallint(6) NOT NULL DEFAULT '0',
  `isTop` smallint(6) NOT NULL DEFAULT '0',
  `isHot` smallint(6) NOT NULL DEFAULT '0',
  `isRecommended` smallint(6) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `downloadCount` int(11) NOT NULL DEFAULT '0',
  `createdUserId` int(11) NOT NULL,
  `createdDate` int(10) NOT NULL,
  `lastModifiedUserId` int(11) DEFAULT NULL,
  `lastModifiedDate` int(10) DEFAULT NULL,
  `extend` text,
  `sourceHtml` varchar(100) DEFAULT NULL,
  `lang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息相关';

--
-- Dumping data for table `cc_info`
--

INSERT INTO `cc_info` (`id`, `companyId`, `classId`, `ordinal`, `title`, `subTitle`, `titleStyle`, `alias`, `url`, `pageTitle`, `keywords`, `description`, `publishedDate`, `source`, `author`, `intro`, `content`, `imageUrl`, `bigImageUrl`, `images`, `files`, `filename`, `isApproved`, `isTop`, `isHot`, `isRecommended`, `hits`, `downloadCount`, `createdUserId`, `createdDate`, `lastModifiedUserId`, `lastModifiedDate`, `extend`, `sourceHtml`, `lang`) VALUES
(1, 0, '102', 460, '标准账户', '', '', NULL, NULL, NULL, NULL, NULL, '01/25/2017', NULL, NULL, NULL, 'a:13:{s:9:\"fromPrice\";s:50:\"Original ECN Inter-bank or Institutional-level STP\";s:6:\"spread\";s:13:\"From 1.8 pips\";s:8:\"platform\";s:3:\"MT4\";s:6:\"server\";s:22:\"New York - Equinix NY4\";s:8:\"leverage\";s:11:\"Up to 400:1\";s:5:\"banks\";s:12:\"Metatrader 4\";s:10:\"lowestFund\";s:8:\"$200 USD\";s:16:\"currencyClassify\";s:3:\"50+\";s:11:\"minTradeNum\";s:8:\"0.01 lot\";s:10:\"tradeFunds\";s:7:\" $0 USD\";s:12:\"lowestSaving\";s:24:\"Minimum deposit $200 USD\";s:11:\"programLang\";s:4:\"MQL4\";s:3:\"ppl\";s:11:\"All traders\";}', NULL, NULL, '', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1485315655, 2, 1507591064, NULL, NULL, 'en'),
(2, 0, '102', 510, '机构账户', '', '', NULL, NULL, NULL, NULL, NULL, '01/25/2017', NULL, NULL, NULL, 'a:13:{s:9:\"fromPrice\";s:33:\"原始ECN银行间或机构级STP\";s:6:\"spread\";s:13:\"From 0.1 pips\";s:8:\"platform\";s:3:\"MT4\";s:6:\"server\";s:20:\"纽约 - Equinix NY4\";s:8:\"leverage\";s:11:\"Up to 400:1\";s:5:\"banks\";s:12:\"Metatrader 4\";s:10:\"lowestFund\";s:12:\"$50000美元\";s:16:\"currencyClassify\";s:3:\"50+\";s:11:\"minTradeNum\";s:6:\"0.1手\";s:10:\"tradeFunds\";s:183:\"Commision $3.5 USD*/lot for each FX transactions. (One-way fee) no commissions for Metals and CFDs transactions. </br></br>*Converted to or approximately the equivalent amount of AUD.\";s:12:\"lowestSaving\";s:28:\"最低存款只需$200美元\";s:11:\"programLang\";s:4:\"MQL4\";s:3:\"ppl\";s:15:\"专业交易员\";}', NULL, NULL, '', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1485315666, 2, 1508198352, NULL, NULL, 'en'),
(3, 0, '103', 10, 'logo management', '', '', NULL, NULL, NULL, NULL, NULL, '01/25/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1485331856, 2, 1489058252, NULL, NULL, 'en'),
(5, 0, '104', 80, 'banner management', '', '', NULL, NULL, NULL, NULL, NULL, '01/27/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1485470689, 2, 1489058677, NULL, NULL, 'en'),
(6, 0, '105', 10, 'logo management', '', '', NULL, NULL, '', '', '', '01/27/2017', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1485476219, 2, 1508198659, NULL, NULL, 'en'),
(7, 0, '108', 10, 'holiday trading time', '', '', NULL, NULL, '', '', '', '01/30/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-02/20170209102954674526.pdf', 'sample-3pp.pdf', 1, 0, 0, 0, 0, 0, 1, 1485728990, 2, 1488354134, NULL, NULL, 'en'),
(9, 0, '106101', 10, 'July 8 trading (nonfarm payroll) Risk Warning', '', '', NULL, NULL, 'July 8 trading (nonfarm payroll) Risk Warning', '', '', '03/03/2017', NULL, 'Ruizean Trader', 'On March 10, 2017 (Friday) 11:30PM Sydney time. The US Department of Labor will release US March non-farm employment data.', 'On March 10, 2017 (Friday) 11:30PM Sydney time. The US Department of Labor will release US March non-farm employment data. The previous market number is 227,000, and the expected value of 175,000. This time the non-farm data may become a key indicator about whether the Fed in March to raise interest rates to the market. Please wait and see.', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486342834, 2, 1488798228, NULL, NULL, 'en'),
(10, 0, '106101', 20, 'Market odds of March rise in US interest rates hit 80%', '', '', NULL, NULL, 'Market odds of March rise in US interest rates hit 80%', '', '', '08/05/2016', NULL, 'Ruizean Trader', 'High quality global journalism requires investment. Please share this article with others using the link below, do not cut & paste the article. See our T&Cs and Copyright Policy for more detail.', '<p>\r\n	High quality global journalism requires investment. Please share this article with others using the link below, do not cut &amp; paste the article. See our T&amp;Cs and Copyright Policy for more detail. </p>\r\n<p>\r\n	The market odds of a March increase in US interest rates shot up to 80 per cent on Tuesday as Federal Reserve policymakers insisted they did not need to see Republican tax reforms and other policies before they act. </p>\r\n<p>\r\n	High quality global journalism requires investment. Please share this article with others using the link below, do not cut &amp; paste the article. See our T&amp;Cs and Copyright Policy for more detail. </p>\r\n<p>\r\n	William Dudley, influential head of the New York Federal Reserve, said that the prospects for adding to the December 2016 rate increase had become &ldquo;a lot more compelling&rdquo;. </p>\r\n<p>\r\n	&ldquo;It seems to me that most of the data we&rsquo;ve seen over the last couple months is very much consistent with the economy continuing to grow at an above-trend pace, job gains remain pretty sturdy, inflation has actually drifted up a little bit as energy prices have increased,&rdquo; he said in an interview with CNN.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486342919, 2, 1488799103, NULL, NULL, 'en'),
(11, 0, '106101', 30, 'OPEC to Cut Production', '', '', NULL, NULL, 'OPEC to Cut Production', '', '', '12/01/2016', NULL, 'Ruizean Trader', 'Two years after Saudi Arabia coaxed its fellow OPEC members into letting market forces set the oil price, it has performed a nifty half-pirouette.', '<p>\r\n	Two years after Saudi Arabia coaxed its fellow OPEC members into letting market forces set the oil price, it has performed a nifty half-pirouette. On November 30th it led members of the oil producers&rsquo; cartel in a pledge to remove 1.2m barrels a day (b/d) from global oil production, if non-OPEC countries such as Russia chip in with a further 600,000 b/d. That would amount to almost 2% of global production, far more than markets expected. It showed that OPEC is not dead yet. </p>\r\n<p>\r\n	The size of the proposed cut, the first since 2008, caused a surge in Brent oil prices to above $50 a barrel. Some speculators think it may mark the beginning of the end of a two-year glut in the world&rsquo;s oil markets, during which prices have fallen by half and producers such as Venezuela have come close to collapse. As long as prices continue to recover, Saudi Arabia can probably shrug off the fact that its previous strategy damaged OPEC at least as badly as non-members, and that this week&rsquo;s deal gave more breathing space to its arch-rival Iran than it would have liked. </p>\r\n<p>\r\n	The rally&rsquo;s continuation, however, depends on non-OPEC members such as Russia reliably committing to cut output at a meeting on December 9th. It also hinges on the speed at which American shale producers step up production, and on Donald Trump&rsquo;s dream of oil self-reliance.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486342955, 2, 1488799032, NULL, NULL, 'en'),
(12, 0, '106101', 40, 'US election: What does a Donald Trump win mean for the Federal Reserve?', '', '', NULL, NULL, 'US election: What does a Donald Trump win mean for the Federal Reserve?', '', '', '11/10/2016', NULL, 'Ruizean Trader', 'Up until recently, the big question across global markets has been the future of the Federal Reserve\'s plans to raise interest rates and whether \"lift off\" from the near-zero setting would be recommenced at next month\'s meeting.', '<p>\r\n	Up until recently, the big question across global markets has been the future of the Federal Reserve&#39;s plans to raise interest rates and whether &quot;lift off&quot; from the near-zero setting would be recommenced at next month&#39;s meeting. </p>\r\n<p>\r\n	Now the question is shifting to the future of the current Fed under the incoming Trump administration. </p>\r\n<p>\r\n	Mr Trump has had a lot to say about the Federal Reserve recently, and none of it nice. </p>\r\n<p>\r\n	A precis of Mr Trump&#39;s view is that the Fed under chair Janet Yellen has been merely a wing of the Democratic Party, holding interest rates down to support President Obama. </p>\r\n<p>\r\n	More pointedly, the President-elect has said Dr Yellen &quot;should be ashamed of herself&quot; as she created a &quot;big, ugly bubble&quot; in the US economy and equity markets, which will burst once Mr Obama leaves office and interest rates are let go. </p>\r\n<p>\r\n	Not exactly a ringing endorsement.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486342983, 2, 1488799005, NULL, NULL, 'en'),
(13, 0, '106102', 10, 'Market odds of March rise in US interest rates hit 80%', '', '', NULL, NULL, 'Market odds of March rise in US interest rates hit 80%', '', '', '02/06/2017', NULL, 'Ruizean Trader', NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, 0, 1, 0, 0, 2, 1486343831, 2, 1488798738, NULL, 'http://test.legenddigital.com.au/ruizeanTrader/en/newsDetail/1/10', 'en'),
(14, 0, '106101', 50, 'Why Hillary Clinton lost the election: the economy, trust and a weak message', '', '', NULL, NULL, 'Why Hillary Clinton lost the election: the economy, trust and a weak message', '', '', '10/26/2016', NULL, 'Ruizean Trader', 'How Hillary Clinton managed to lose an election to a candidate as divisive and unpopular as Donald Trump will baffle observers and agonise Democrats for years to come. Once the shockwave passes, some glimpses of rational explanation may become visible.', '<p>\r\n	How Hillary Clinton managed to lose an election to a candidate as divisive and unpopular as Donald Trump will baffle observers and agonise Democrats for years to come. Once the shockwave passes, some glimpses of rational explanation may become visible. </p>\r\n<p>\r\n	Incumbent parties rarely hold on to power after eight years in office. George HW Bush, following Reagan, was an exception, but politics has become steadily more polarised since and pendulums have a habit of swinging. </p>\r\n<p>\r\n	Trump&rsquo;s defiance of expectations has itself also become somewhat of a golden rule in American politics in 2016. Written off repeatedly during the Republican primary, and only rarely taken seriously during the general election, he nonetheless epitomises the same anti-establishment mood that led Britain to vote to leave the European Union and Democrats in 22 US states to nominate Bernie Sanders. Fairly or not, it is an establishment with which Clinton could not have been more closely aligned in the minds of many voters if she tried.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486349903, 2, 1488798966, NULL, NULL, 'en'),
(15, 0, '106101', 60, 'Who is Theresa May? Britain\'s PM looking to complete UK\'s \'Brexit\'', '', '', NULL, NULL, 'Who is Theresa May? Britain\'s PM looking to complete UK\'s \'Brexit\'', '', '', '08/04/2016', NULL, 'Ruizean Trader', 'Britain\'s new Prime Minister Theresa May is a pragmatist who has emerged from the chaos of the Brexit referendum unscarred, portraying herself as the one who will lead the country out of the EU.', '<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">Britain&#39;s new Prime Minister Theresa May is a pragmatist who has emerged from the chaos of the Brexit referendum unscarred, portraying herself as the one who will lead the country out of the EU.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">The country&#39;s second female leader after fellow Conservative Margaret Thatcher, Ms May was officially &mdash; but unenthusiastically &mdash; in favour of Britain staying in the European Union.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">She kept a low profile throughout the campaign, and when the June 23 referendum delivered a shock &quot;Leave&quot; result, stepped into the political vacuum left by David Cameron&#39;s decision to quit.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">She insists &quot;Brexit means Brexit&quot;.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">Although Ms May trounced her rivals for the premiership, she faces an uphill struggle to unite a country and a party deeply split by the referendum.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;font-family:Arial;mso-fareast-font-family:\r\n\">She has been labelled, in an unguarded moment, a &quot;bloody difficult woman&quot; by senior Conservative Kenneth Clarke.<o:p></o:p></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;margin-bottom:.0001pt;text-align:\r\njustify;text-justify:inter-ideograph;line-height:normal;background:white\">\r\n	<span style=\"font-family: Arial; font-size: 9pt;\">But the 59-year-old claims this is the very quality which will stand her in good stead for the battles ahead. &quot;The next person to find that out will be Jean-Claude Juncker,&quot; she reportedly told MPs, referring to Brexit negotiations with the European Commission president.</span></p>\r\n<p>\r\n	<style>\r\n<!--{cke_protected}%3C!%2D%2D%0A%20%2F*%20Font%20Definitions%20*%2F%0A%40font-face%0A%09%7Bfont-family%3AArial%3B%0A%09panose-1%3A2%2011%206%204%202%202%202%202%202%204%3B%0A%09mso-font-charset%3A0%3B%0A%09mso-generic-font-family%3Aauto%3B%0A%09mso-font-pitch%3Avariable%3B%0A%09mso-font-signature%3A10887%20-2147483648%208%200%20511%200%3B%7D%0A%40font-face%0A%09%7Bfont-family%3A%22Cambria%20Math%22%3B%0A%09panose-1%3A2%204%205%203%205%204%206%203%202%204%3B%0A%09mso-font-charset%3A0%3B%0A%09mso-generic-font-family%3Aauto%3B%0A%09mso-font-pitch%3Avariable%3B%0A%09mso-font-signature%3A-1610611985%201107304683%200%200%20159%200%3B%7D%0A%40font-face%0A%09%7Bfont-family%3A%22Microsoft%20YaHei%22%3B%0A%09panose-1%3A2%2011%205%203%202%202%204%202%202%204%3B%0A%09mso-font-charset%3A80%3B%0A%09mso-generic-font-family%3Aauto%3B%0A%09mso-font-pitch%3Avariable%3B%0A%09mso-font-signature%3A-2147483001%20705641554%2022%200%20262175%200%3B%7D%0A%40font-face%0A%09%7Bfont-family%3A%22%5C%40Microsoft%20YaHei%22%3B%0A%09panose-1%3A2%2011%205%203%202%202%204%202%202%204%3B%0A%09mso-font-charset%3A80%3B%0A%09mso-generic-font-family%3Aauto%3B%0A%09mso-font-pitch%3Avariable%3B%0A%09mso-font-signature%3A-2147483001%20705641554%2022%200%20262175%200%3B%7D%0A%40font-face%0A%09%7Bfont-family%3A%E7%AD%89%E7%BA%BF%3B%0A%09panose-1%3A0%200%200%200%200%200%200%200%200%200%3B%0A%09mso-font-alt%3A%22Adobe%20Garamond%20Pro%22%3B%0A%09mso-font-charset%3A80%3B%0A%09mso-generic-font-family%3Aroman%3B%0A%09mso-font-format%3Aother%3B%0A%09mso-font-pitch%3Aauto%3B%0A%09mso-font-signature%3A0%200%200%200%200%200%3B%7D%0A%40font-face%0A%09%7Bfont-family%3A%22%5C%40%E7%AD%89%E7%BA%BF%22%3B%0A%09panose-1%3A0%200%200%200%200%200%200%200%200%200%3B%0A%09mso-font-charset%3A80%3B%0A%09mso-generic-font-family%3Aroman%3B%0A%09mso-font-format%3Aother%3B%0A%09mso-font-pitch%3Aauto%3B%0A%09mso-font-signature%3A0%200%200%200%200%200%3B%7D%0A%20%2F*%20Style%20Definitions%20*%2F%0Ap.MsoNormal%2C%20li.MsoNormal%2C%20div.MsoNormal%0A%09%7Bmso-style-unhide%3Ano%3B%0A%09mso-style-qformat%3Ayes%3B%0A%09mso-style-parent%3A%22%22%3B%0A%09margin-top%3A0cm%3B%0A%09margin-right%3A0cm%3B%0A%09margin-bottom%3A8.0pt%3B%0A%09margin-left%3A0cm%3B%0A%09line-height%3A106%25%3B%0A%09mso-pagination%3Awidow-orphan%3B%0A%09font-size%3A11.0pt%3B%0A%09font-family%3A%22%E7%AD%89%E7%BA%BF%22%2C%22serif%22%3B%0A%09mso-ascii-font-family%3A%E7%AD%89%E7%BA%BF%3B%0A%09mso-ascii-theme-font%3Aminor-latin%3B%0A%09mso-fareast-font-family%3A%E7%AD%89%E7%BA%BF%3B%0A%09mso-fareast-theme-font%3Aminor-fareast%3B%0A%09mso-hansi-font-family%3A%E7%AD%89%E7%BA%BF%3B%0A%09mso-hansi-theme-font%3Aminor-latin%3B%0A%09mso-bidi-font-family%3A%22Times%20New%20Roman%22%3B%0A%09mso-bidi-theme-font%3Aminor-bidi%3B%0A%09mso-ansi-language%3AEN-AU%3B%7D%0A.MsoChpDefault%0A%09%7Bmso-style-type%3Aexport-only%3B%0A%09mso-default-props%3Ayes%3B%0A%09font-size%3A10.5pt%3B%0A%09mso-ansi-font-size%3A10.5pt%3B%0A%09mso-bidi-font-size%3A11.0pt%3B%0A%09font-family%3A%22%E7%AD%89%E7%BA%BF%22%2C%22serif%22%3B%0A%09mso-bidi-font-family%3A%22Times%20New%20Roman%22%3B%0A%09mso-bidi-theme-font%3Aminor-bidi%3B%7D%0A%20%2F*%20Page%20Definitions%20*%2F%0A%40page%0A%09%7Bmso-page-border-surround-header%3Ano%3B%0A%09mso-page-border-surround-footer%3Ano%3B%7D%0A%40page%20WordSection1%0A%09%7Bsize%3A612.0pt%20792.0pt%3B%0A%09margin%3A72.0pt%2090.0pt%2072.0pt%2090.0pt%3B%0A%09mso-header-margin%3A36.0pt%3B%0A%09mso-footer-margin%3A36.0pt%3B%0A%09mso-paper-source%3A0%3B%7D%0Adiv.WordSection1%0A%09%7Bpage%3AWordSection1%3B%7D%0A%2D%2D%3E-->\r\n</style></p>\r\n', NULL, NULL, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 2, 1486349941, 2, 1488798925, NULL, NULL, 'en'),
(16, 0, '106102', 20, 'OPEC to Cut Production', '', '', NULL, NULL, '', '', '', '02/02/2017', NULL, 'Ruizean Trader', NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, 0, 1, 0, 0, 2, 1486349966, 2, 1488798778, NULL, 'http://test.legenddigital.com.au/ruizeanTrader/en/newsDetail/1/11', 'en'),
(17, 0, '109', 10, 'How do I open a real account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	First click &ldquo;Start Real Account&rdquo; and fill out the account application form, making sure that you upload all of the required supporting documents. Once you have submitted the application form and all of your documents have been reviewed, we will contact you and confirm your account. Once your account registration has been confirmed, we will email you your login details and you are then able to login to your new account.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486357899, 2, 1488768629, NULL, NULL, 'en'),
(18, 0, '109', 20, 'What are the costs of using a Ruizean Trader forex trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	There are two foreign exchange accounts - a standard account on the Ruizean Trader MetaTrader4 platform and an ECN account. For the standard account, Ruizean Trader does not charge any commissions, but rather marks up the spread by 1 pip above the interbank rate received from our liquidity providers. The Ruizean Trader ECN account shows the raw interbank spread received from our liquidity providers, and on this account there is a commission of $7 per standard lot round turn, which is more cost efficient than trading with a standard account.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486357940, 2, 1488768671, NULL, NULL, 'en'),
(19, 0, '109', 30, 'How can I become an IB (Introducing Broker)?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	We are happy that you want to participate in our IB program. Simply read the guidance manual and then fill in and submit the application form. Once we receive your application, we will contact you to complete your application.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486357968, 2, 1488768700, NULL, NULL, 'en'),
(20, 0, '109', 40, 'Are there any withdrawal fees?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	To avoid complications with processing refunds, all credit card withdrawals are completed after 60 days of the request.</p>\r\n<p>\r\n	Some banks or intermediate banks have a surcharge for international money transfers and the amount you are charged will be dependent on the bank. Ruizean Trader does not charge any withdrawal fees themselves.</p>\r\n<p>\r\n	Cash CUP exchange rate: This is also a direct quote from the bank. Customers need to pay an additional fee to convert the transferred money into their own currency, and the rate changes daily. Ruizean Trader does not charge any fees themselves.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358010, 2, 1488770394, NULL, NULL, 'en'),
(21, 0, '109', 50, 'How do I make a deposit?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader supports the following deposit transfers:</p>\r\n<ul>\r\n	<li>\r\n		Bank Wire Transfers (Bank Wire).</li>\r\n	<li>\r\n		Credit/Debit Cards (Credit Cards).</li>\r\n	<li>\r\n		Neteller.</li>\r\n	<li>\r\n		Skrill.</li>\r\n	<li>\r\n		Broker to broker transfer (inter-company transfer for foreign exchange).</li>\r\n	<li>\r\n		China Union Pay (CUP).</li>\r\n</ul>\r\n<p>\r\n	For more payment details, please read our deposit page.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358031, 2, 1488768946, NULL, NULL, 'en'),
(22, 0, '109', 60, 'What is the minimum amount to open a live account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	For a Standard Account on the MT4 platform you need to deposit $200 to activate your account; an agency will need to deposit $50,000 into their account.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358061, 2, 1488768978, NULL, NULL, 'en'),
(23, 0, '109', 70, 'What is the Ruizean Trader margin call level?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The Ruizean Trader margin call level is 120%, which means that you will receive a margin call when your Equity is 120% of the margin required on your open positions.</p>\r\n<p>\r\n	The Ruizean Trader margin stop out level is 80%, which this means that if your Free Margin falls below 80%, then your positions will be automatically closed. MetaTrader 4 will automatically close open positions in order of the largest loosing position to the smallest.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358086, 2, 1488769026, NULL, NULL, 'en'),
(25, 0, '109', 90, 'The margin stop out level is calculated using the following formula.', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Margin level = (equity/used margin) x 100%<br />\r\n	= margin level % <br />\r\n	<br />\r\n	Example: <br />\r\n	A net worth of $10,000 in the account holding 1 lot USD/JPY, leveraged 100 times their margin is calculated as follows:<br />\r\n	= (10,000/1,000) x 100% <br />\r\n	= 1000% (margin level) <br />\r\n	If the value of your securities fell to $5,000:<br />\r\n	= (5,000/1,000) x 100%<br />\r\n	= 500% (margin level)<br />\r\n	<br />\r\n	When the market continues to run, because you&rsquo;re net worth fell to $799, your account will be liquidated. This is because your margin level of 79.9% is lower than the prescribed 80%.<br />\r\n	= (799/1,000) x 100% <br />\r\n	= 79.9% (margin level)</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358333, 2, 1488769192, NULL, NULL, 'en'),
(26, 0, '109', 100, 'How do I know which account is best for me?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader offers two types of accounts: MT4 standard accounts and institutional accounts. You can choose the most suitable type according to your needs. For specific differences between the two accounts, please view the account type comparison tables.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358361, 2, 1488769398, NULL, NULL, 'en'),
(27, 0, '109', 110, 'What are the Ruizean Trader’s minimum spreads?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader offers the forex industry&#39;s most competitive spreads, with a point difference between the averages of up to 1.8 points. For specific points difference, please see our list of spreads.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358390, 2, 1488769419, NULL, NULL, 'en'),
(29, 0, '109', 130, 'How do I withdraw from my account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	If you need to withdraw, simply login to your account and fill in a withdrawal request form. After logging in, select the &quot;withdrawal&quot; option, select the withdrawal method and enter your bank account information, and then click &ldquo;submit&rdquo;.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358446, 2, 1488769444, NULL, NULL, 'en'),
(30, 0, '109', 140, 'Ruizean Trader standard accounts and institutional accounts - what is the difference?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	We have two foreign exchange accounts - a standard account on the Ruizean Trader MetaTrader4 platform, and institutional accounts. We do not charge commissions on the standard accounts. However, there is a $7 fee per lot for institutional/agency accounts.<br />\r\n	For specific comparisons between these two accounts, please check the type of trading account comparison table.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358471, 2, 1488769700, NULL, NULL, 'en'),
(31, 0, '109', 150, 'How do I change my MT4 password?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Login to MT4, select Tools &gt; Options, then select the Server Tab and &gt; Change. A pop-up box will appear, where you can enter the old password and a new password.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486358502, 2, 1488769723, NULL, NULL, 'en'),
(32, 0, '109', 160, 'Why can’t I connect to the server?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	If you can&rsquo;t log onto the platform, you can try a proxy server. Please check the proxy server settings for MT4. If you still cannot log into the platform, visit our home page and contact us, so we can help to fix the problem.<br />\r\n	Some network connection are slow, so please be patient and wait for about 1 minute. Please also note that some public networks will run a limited trading platform.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361265, 2, 1488769765, NULL, NULL, 'en'),
(33, 0, '109', 170, 'Where can I see the interest table?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Interest can be viewed directly on the platform in Metatrader4. Right-click anywhere and choose &quot;Product List&quot; in the pop-up window, then select the product you want to see in the &quot;Market Watch&quot; window for the currency pair. Click on the right side of the &quot;Properties&quot; tab, and then in the pop-up window you will see the &quot;pay off inventory costs&rdquo; and &ldquo;selling single stock swap fees&rdquo; &ndash; these are the buying and selling interests overnight.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361768, 2, 1488769785, NULL, NULL, 'en'),
(34, 0, '109', 180, 'What is a margin and how can I calculate the margin (down payment)?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	On the MT4 platform, a margin is known as an &ldquo;advance&rdquo;. Margin refers to your open positions and must be paid in lump sum. IC Markets provides up to a 500-fold margin leverage. The margin requirement is calculated in units of the base currency and then converted to US dollars by the spot price. If your usable margin opens below the margin you need, you will not be allowed to open any trades. Free margin is the difference between the equity in your account and the open position&rsquo;s margin.</p>\r\n<p>\r\n	Margin is calculated by the following equation: The required margin = (current market price x number of transactions)/Account Leverage</p>\r\n<p>\r\n	For example: If you want to open in EUR/USD current price (1.35645) on the basis of a quantity of 0.1 hand (10000 base units) orders, account leverage is 400 times - your required margin is calculated as follows:<br />\r\n	<br />\r\n	(1.35645 x 10000)/400 = $33.91</p>\r\n<p>\r\n	In this example, the next 0.1 hand orders required margin 33.91 dollars, so the margin available in your account need to be at least 33.91 dollars, before you can successfully open a position.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361803, 2, 1488769908, NULL, NULL, 'en'),
(35, 0, '109', 190, 'How do we ensure the security of your funds?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader is committed to providing customers with a superior trading environment and the best quality service. We work within a strict regulatory compliance framework with rigorously high standards of security, which ensures that customer funds are kept highly secured at all times. Click here for our regulatory mechanism.</p>\r\n<p>\r\n	Our beneficiary bank is Australia&#39;s largest commercial bank &ndash; Westpac, which has a Global AA-class and is one of Australia&rsquo;s four major international banks. Ruizean Trader strictly maintains the separation of clients&#39; funds from our own assets, and is in full compliance with regulatory ASIC 212 and 227; all client funds are reviewed daily.</p>\r\n<p>\r\n	Ruizean Trader is well known for its strict compliance with the Australian Securities and Investments Commission (ASIC) regulations and we hold professional liability insurance (Professional Indemnity Insurance). We are committed to providing full transparency at all times, sending daily transaction reports to our active customers.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361879, 2, 1488769964, NULL, NULL, 'en'),
(36, 0, '109', 200, 'Which currencies does Ruizean Trader accept?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader accepts AUD and USD, as well as onshore Renminbi into gold.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361903, 2, 1488769982, NULL, NULL, 'en'),
(37, 0, '109', 210, 'How long will it take for my deposit to be in my account, so I can start trading? ', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	This depends on how the customer has made their deposit. In general EFT (Bank/Wire Transfers) will need 1-2 business days to reach your account, however for a credit card (Credit / Debit Card), Neteller, Skrill and CUP (China Union Pay) deposits, customers can immediately start trading.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486361929, 2, 1488770002, NULL, NULL, 'en'),
(49, 0, '110101', 10, 'Who is Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader&nbsp;is a regulated Forex broker, providing traders access to the global forex market through top tier FX liquidity providers.&nbsp;With Ruizean Trader, you will experience super-fast forex execution, as well as interbank grade, RAW ECN spreads.&nbsp;We give clients access to forex markets through stable forex trading platforms, including MetaTrader 4,&nbsp;and multiple&nbsp;mobile trading apps&nbsp;for iPhone and Android devices.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366291, 2, 1488771569, NULL, NULL, 'en'),
(50, 0, '110101', 20, 'What markets can I trade on MT4 with Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	With Ruizean Trader, you can trade a multitude of&nbsp;Forex,&nbsp;Commodities&nbsp;and&nbsp;Indices&nbsp;markets all from our industry leading MT4 platform.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366311, 2, 1488771589, NULL, NULL, 'en'),
(51, 0, '110101', 30, 'Is Ruizean Trader Regulated?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader&nbsp;is an&nbsp;ASIC regulated Forex Broker. Under Australian Securities and Investment Commission (ASIC) regulation, Ruizean Trader guarantees absolute transparency across all forex trading operations.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366335, 2, 1488771609, NULL, NULL, 'en'),
(53, 0, '110101', 50, 'Where are the Ruizean Trader trading servers located?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	A strategic partnership with Equinix provides Ruizean Trader with a fibre optic network solution, which connects our Forex trading servers&nbsp;worldwide.&nbsp;This guarantees lighting fast executions on every trade.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366427, 2, 1488771646, NULL, NULL, 'en'),
(54, 0, '110101', 60, 'Do you accept clients from the US?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Due to CFTC regulation, US traders are unable to trade with non US brokers.&nbsp;As we are based in Australia and strictly regulated by the Australian Securities and Investment Commission (ASIC), CFTC regulations mean that Ruizean Trader is unfortunately unable to accept clients based in the US.&nbsp;Traders from all other countries are welcome to apply.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366445, 2, 1488771669, NULL, NULL, 'en'),
(55, 0, '110101', 70, 'What liquidity providers does Ruizean Trader use?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader is a true&nbsp;STP/ECN Forex broker. This means that we aggregate the best bid and ask prices from deep liquidity pools in the underlying FX market.&nbsp;These prices are provided by the top tier investment banks listed on our home page.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486366470, 2, 1488771693, NULL, NULL, 'en'),
(56, 0, '110102', 10, 'How can I open a Free Ruizean Trader demo?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	To open a FREE $50,000 Ruizean Trader MT4 demo&nbsp;account, click the purple &lsquo;Demo Account&rsquo; button at the top right hand corner of every page.&nbsp;Simply fill in your details and submit the form.&nbsp;You will then be able to instantly start learning to trade in the forex markets.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367701, 2, 1488771721, NULL, NULL, 'en'),
(57, 0, '110102', 20, 'How long does a Free Ruizean Trader demo account last?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Each&nbsp;Ruizean Trader&nbsp;MT4 demo account lasts for 30 days before your login will expire.&nbsp;We encourage our new traders to demo trade until they are comfortable with both the Ruizean Trader MT4 platform, as well as their own trading strategy.&nbsp;If you require a non-expiring demo, please don&rsquo;t hesitate to send us an email.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367717, 2, 1488771738, NULL, NULL, 'en'),
(58, 0, '110102', 30, 'How can I open a live Forex trading account with Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	To open a Ruizean Trader MT4 live account, click the red &lsquo;Live Account&rsquo; button at the top right hand corner of every page.&nbsp;Complete the forms, provide the required documentation for proof of identity and once approved, your new account details will be emailed to you.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367732, 2, 1488771758, NULL, NULL, 'en'),
(59, 0, '110102', 40, 'How long does it take to open a live Forex trading account with Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The online forms required for a live forex trading account are fast and easy to complete.&nbsp;If you submit the accompanying required&nbsp;proof of identity&nbsp;documentation when you submit the form, you can be set up and trading within 24 hours.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367749, 2, 1488771777, NULL, NULL, 'en'),
(60, 0, '110102', 50, 'What documentation do I have to provide to open a live Forex trading account with Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	To open a live forex trading account, Ruizean Trader&rsquo;s AML and CT&nbsp;regulations&nbsp;require some proof of identity to be submitted alongside your application.&nbsp; Using a smartphone, digital camera or scanner, simply email us a clear picture of the&nbsp;required documents&nbsp;to&nbsp;application@ruizeantrader.com.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367764, 2, 1488771802, NULL, NULL, 'en'),
(61, 0, '110102', 60, 'Does a live Forex trading account with Ruizean Trader cost anything?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	There are ZERO account opening or maintenance fees on all Ruizean Trader live forex trading accounts.&nbsp;This ensures that you are able to fund and trade your capital at your own pace with no pressure from Ruizean Trader.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367839, 2, 1488771822, NULL, NULL, 'en'),
(62, 0, '110102', 70, 'How can I deposit funds to my Ruizean Trader MT4 trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader clients can&nbsp;fund their account&nbsp;in a number of ways. We accept domestic bank transfers, international bank transfers, BPAY, Skrill and online credit or debit card payments.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367858, 2, 1488771935, NULL, NULL, 'en'),
(63, 0, '110102', 80, 'What is the minimum deposit needed to open a Ruizean Trader live Forex trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The minimum deposit that Ruizean Trader can accept is $100 for all&nbsp;Standard STP&nbsp;accounts and $1000 for an&nbsp;ECN account. Just remember that you can open and keep a live forex trading account with a $0 balance.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367874, 2, 1488771958, NULL, NULL, 'en'),
(64, 0, '110102', 90, 'Is my Credit Card verified for deposits?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The first time you use a credit card for&nbsp;deposits&nbsp;into your live MT4 trading account, it must first be verified.&nbsp;Using a smartphone, digital camera or scanner, simply email us a clear picture of the front of the credit card to tradersupport@ruizean.com</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367895, 2, 1488771979, NULL, NULL, 'en'),
(65, 0, '110102', 100, 'How can I withdraw funds from my Ruizean Trader MT4 trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader clients can&nbsp;withdraw funds&nbsp;online by following our simple online withdrawal form, or alternatively by completing a manual withdrawal form and emailing us a completed copy to&nbsp;withdraw@ruizeantrader.com</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367916, 2, 1488772003, NULL, NULL, 'en'),
(66, 0, '110102', 110, 'How long does it take to deposit/withdraw funds?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader does everything it can to make sure our clients receive their funds the same day that they make their withdrawal request.&nbsp;For withdrawals received prior to 12:00 AEST (02:00 GMT), the request will be processed on the same business day.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367937, 2, 1488772020, NULL, NULL, 'en'),
(67, 0, '110102', 120, 'Does Ruizean Trader charge any fees on deposits/withdrawals?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader does not charge any internal fees for deposits or withdrawals. However, please note payments to and from overseas banking institutions may attract intermediary transfer fees from either party, which are independent of Ruizean Trader.&nbsp;</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367953, 2, 1488772041, NULL, NULL, 'en'),
(68, 0, '110102', 130, 'What is the difference between a Standard STP and RAW ECN Account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Compare the difference between our&nbsp;Standard STP&nbsp;and&nbsp;ECN&nbsp;trading accounts by using the table at our compare Forex trading accounts&nbsp;page.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367976, 2, 1488772064, NULL, NULL, 'en'),
(69, 0, '110102', 140, 'What is the maximum leverage I can get on a Ruizean Trader live Forex trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader&rsquo;s standard&nbsp;Forex leverage&nbsp;starts from 100:1. The maximum Forex leverage Ruizean Trader may offer is up to 400:1.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486367993, 2, 1488772087, NULL, NULL, 'en'),
(70, 0, '110102', 150, 'Can I change the leverage on my Ruizean Trader Forex trading account?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Yes. Navigate to the&nbsp;change of leverage&nbsp;page inside the client menu on the Ruizean Trader website and use the form at the bottom of the page to request a change of leverage on your MT4 trading account.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368012, 2, 1488772106, NULL, NULL, 'en'),
(71, 0, '110102', 160, 'Can I change my Ruizean Trader Forex trading account type between Standard STP and RAW ECN?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	If after comparing our forex trading accounts, you require your live MT4 trading account to be changed between Standard STP&nbsp;and&nbsp;RAW ECN, simply&nbsp;contact us&nbsp;by phone, or email us at&nbsp;support@vantagefx.com.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368029, 2, 1488772132, NULL, NULL, 'en'),
(72, 0, '110102', 170, 'When will I receive Account Statements?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Daily account statements will only be emailed to you on the days that your&nbsp;MT4 trading account&nbsp;has experienced trading activity.&nbsp;You will also receive a monthly account statement on the first day of every new month regardless of trading activity.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368045, 2, 1488772149, NULL, NULL, 'en'),
(73, 0, '110102', 180, 'What is the level my account must reach to be stopped out via margin call?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader will alert you via email when the &lsquo;Margin Level&rsquo; in your MT4 Terminal reaches 80%.&nbsp; From here, we will email you the deposit requirements needed to keep your position open.&nbsp;If your Margin Level drops to 50%, then your position will be automatically closed via a margin call.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368063, 2, 1488772167, NULL, NULL, 'en'),
(74, 0, '110102', 190, 'Can I go long and short the same market, at the same time? (Can I hedge?)', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Holding both an open long and short position in the same forex currency pair at the same time (otherwise known as hedging/lock positions) is permitted on all live Ruizean Trader MT4 accounts.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368079, 2, 1488772186, NULL, NULL, 'en'),
(75, 0, '110102', 200, 'What if I’ve forgotten or want to change my password?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Inside your Ruizean Trader MT4 platform, select Tools &gt; Options, then select the Server tab and then select &gt; Change.&nbsp;For security reasons, if you have forgotten your password, it can only be reset by the Ruizean Trader Support team.&nbsp;Please call or email&nbsp;cs@ruizeantrader.com.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368095, 2, 1488772204, NULL, NULL, 'en'),
(76, 0, '110102', 210, 'How can I find my Investor Password?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Inside your Ruizean Trader MT4 platform, select Tools &gt; Options, then select the Server tab and then select &gt; Change.&nbsp; From here you can use your master password to create an investor password by ticking the change investor&rsquo;s password box.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368111, 2, 1488772222, NULL, NULL, 'en'),
(77, 0, '110103', 10, 'What platforms can I trade Forex on with Ruizean Trader?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Under Ruizean Trader&rsquo;s&nbsp;partnership with MetaQuotes, Ruizean Trader offers Forex, Commodities and Indices trading on the industry leading MetaTrader 4 platform.&nbsp; The Ruizean Trader MT4 platform becomes even more powerful once SmartTrader Tools&nbsp;are installed and it is connected to deep FX liquidity pools via the custom made&nbsp;oneZero&trade; MT4 Bridge, increasing execution speed and price transparency for all clients.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368143, 2, 1488772252, NULL, NULL, 'en'),
(78, 0, '110103', 20, 'Can I access my Ruizean Trader MT4 Forex trading account on my mobile?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader offers its traders the official&nbsp;MT4 mobile app, allowing you to trade anywhere, anytime. Gain fast and stable access to your forex trading account via the official MetaQuotes mobile application. This app is available across all mobile platforms including both Apple and Android.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368159, 2, 1488772273, NULL, NULL, 'en'),
(79, 0, '110103', 30, 'Can I use MT4 on my Mac?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader has developed a unique solution for Apple users, allowing them to fully exploit the powerful capabilities of the MT4 platform on their iOS based devices. Installed directly on your Mac, this version works seamlessly and includes all the same features as the Windows platform. Forex traders using&nbsp;MT4 for Mac, have the ability to run&nbsp;Expert Advisors&nbsp;and all custom made FX Indicators.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368175, 2, 1488772294, NULL, NULL, 'en'),
(80, 0, '110103', 40, 'What server time does Ruizean Trader run on?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader servers run on the GMT+2 time zone.&nbsp; This can be found in your Market Watch time on your MT4 trading platform.&nbsp;If you use an Expert Advisor (EA), which requires the GMT offset to be manually entered, please check that this has been completed.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368191, 2, 1488772325, NULL, NULL, 'en'),
(81, 0, '110103', 50, 'Can I change the time on my Ruizean Trader MT4 Charts?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The trading&nbsp;platform time&nbsp;cannot be changed via the Ruizean Trader MetaTrader 4&nbsp;(MT4) interface.&nbsp;If you download and install custom indicators that claim to do this, you will have problems with some platform settings, as our servers will no longer line up with yours.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368208, 2, 1488772367, NULL, NULL, 'en'),
(82, 0, '110103', 60, 'What is the difference between the bid and ask price?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	The &lsquo;ask&rsquo; is the price at which a trader can sell a paticular financial instrument, such as currency pairs. It is otherwise known as the &lsquo;offer&rsquo;.&nbsp;The &lsquo;bid&rsquo; is the price at which a trader can buy a paticular financial instrument, such as currency pairs. </p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368226, 2, 1488772386, NULL, NULL, 'en'),
(83, 0, '110103', 70, 'Does my chart show the bid or the ask price?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	By default, the Ruizean Trader MetaTrader 4 platform displays the bid price.&nbsp; If you wish to also display the ask price, right click your chart, select Properties &gt; Common Tab and check the &lsquo;show ask line&rsquo; box.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368243, 2, 1488772402, NULL, NULL, 'en');
INSERT INTO `cc_info` (`id`, `companyId`, `classId`, `ordinal`, `title`, `subTitle`, `titleStyle`, `alias`, `url`, `pageTitle`, `keywords`, `description`, `publishedDate`, `source`, `author`, `intro`, `content`, `imageUrl`, `bigImageUrl`, `images`, `files`, `filename`, `isApproved`, `isTop`, `isHot`, `isRecommended`, `hits`, `downloadCount`, `createdUserId`, `createdDate`, `lastModifiedUserId`, `lastModifiedDate`, `extend`, `sourceHtml`, `lang`) VALUES
(84, 0, '110103', 80, 'Why can’t I see all currency pairs in the Ruizean Trader MT4 Market Watch?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	If you can&rsquo;t see all the&nbsp;Forex,&nbsp;Commodities&nbsp;and&nbsp;Indices&nbsp;symbols that Ruizean Trader offers in your Market Watch, they may just be hidden.&nbsp;Simply right click anywhere inside the Market Watch and select &lsquo;show all&rsquo;.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368262, 2, 1488772547, NULL, NULL, 'en'),
(85, 0, '110103', 90, 'How do I find the latest swap rates on MT4?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	Inside the Market Watch window, right click on the specific forex currency pair you are looking for and select &lsquo;specifications&rsquo;. &nbsp;This will bring up all contract specifications for the forex currency pair, which includes both long and short&nbsp;swap rates.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368279, 2, 1488772563, NULL, NULL, 'en'),
(86, 0, '110103', 100, 'Why do I get charged a higher swap rate on FX positions on a Wednesday?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	This is because a&nbsp;swap&nbsp;involves pushing back the value date on the underlying futures contract and on a Wednesday this date changes from Friday to Monday.&nbsp;Swap is therefore charged for the extra 2 weekend days.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368293, 2, 1488772579, NULL, NULL, 'en'),
(87, 0, '110103', 110, 'What do I do if I see the message ‘invalid account’?', '', '', NULL, NULL, NULL, NULL, NULL, '02/06/2017', NULL, NULL, NULL, '<p>\r\n	If you see this message on a live account, this means that you have entered an incorrect login or password.&nbsp;Simply&nbsp;contact us&nbsp;and we will instantly reset your password.</p>\r\n<p>\r\n	If you see this message on a Demo account, your 30 day license may have expired. Either move to a live account, or contact us for a non-expiring demo account.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486368307, 2, 1488772604, NULL, NULL, 'en'),
(88, 0, '107', 10, '富瑞登交易学院', '', '', NULL, NULL, '', '', '', '02/07/2017', NULL, 'Ruizean Trader', '富瑞登交易学院在厦门召开为期2天的培训课程，主讲老师是来自富瑞登特聘华尔街专家Abraham COFNAS和全球交易商运营专家叶汇陶老师，为厦门的交易者们带来了一次难忘的课程体验。    全球外汇二元期权教父Abe(Abraham COFNAS)对二元期权以及基本面进行了讲解。', '<p>\r\n	富瑞登交易学院在厦门召开为期2天的培训课程，主讲老师是来自富瑞登特聘华尔街专家Abraham COFNAS和全球交易商运营专家叶汇陶老师，为厦门的交易者们带来了一次难忘的课程体验。 &nbsp; &nbsp;全球外汇二元期权教父Abe(Abraham COFNAS)对二元期权以及基本面进行了讲解。如何运用市场情绪来做交易，还讲解了如何看着股指期货的图表交易货币来获得利润，学员都深深的被基本面分析技术所吸引，互动环节中，结合自己原有的技术分析方法与Abe老师就目前欧元行情做出了激烈的讨论，而在第二天的课程里，Abe开始现场边授课边交易下单，将理论与实践结合，同学们群情激昂，兴致勃勃，学习的热情升至高点！ &nbsp;晚间的百炼成钻经纪商高级课程，由来自富瑞登的叶汇陶老师倾情奉献，叶老师向在座交易代理商介绍了如何构建一家世界级的金融服务公司以及面对当下互联网浪潮中的经济商营销策略。从生金融经纪业务的道与术全方面讲述、探讨了业务发展中的各种问题和解决方案。&rdquo;</p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214131349309066.png\" /></p>\r\n<p>\r\n	复旦大学证券研究所主办的&ldquo;走进华尔街系列讲座---华尔街交易员养成记&rdquo;的公开课在复旦大学美国研究中心圆满举行。外汇、期货、银行、证券等行业的近150位专业人士汇聚一堂，共同参加了这次由Abe Cofnas主讲的课程。 课上Abe生动的讲述了&ldquo;什么是职业交易员&rdquo;&nbsp;、&ldquo;除了交易投资以外你还需要哪些技能&rdquo;、&ldquo;衡量交易员的关键指标&rdquo;、&ldquo;交易基本面和技术面&rdquo;等，并为大家讲解如何规避市场风险。Abe认为，作为一个外汇交易的初学者，一开始的目标不应该是追求巨大盈利，能够取得盈亏平衡才是成为职业交易员的第一步。Abe认为，在外汇交易中不仅需要拥有专业知识，还需要良好的交易心态。课程的最后，一位操盘3000万人民币的专业交易员向Mr. Abaham COFNAS提出自己的疑惑，这位交易员已经操盘4年已久，并获得了持续稳定的收益，但是却非常地惧怕下一次交易的风险。Mr. Abaham COFNAS对此作出了认真的回答，强调一个称职的交易员必须具备良好的交易心态，才能在这个行业中长足发展。 这次精彩的演讲讲述了Abe作为华尔街专业交易员的成长道路，分享了经验和干货，听者们受益匪浅，并期待下一场主题公开课。</p>\r\n', '2017-02/20170214131619919423.png', NULL, '2017-02/20170214131349309066.png', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486422684, 2, 1487049425, NULL, NULL, 'en'),
(89, 0, '107', 20, '金秋十月活动', '', '', NULL, NULL, '', '', '', '02/01/2017', NULL, 'Ruizean Trader', '金秋十月，云淡风轻。在这收获的季节，浦发银行在上海举行了——首批“金种子”第一阶段现场集训。', '<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132249483214.png\" /></p>\r\n<p>\r\n	金秋十月，云淡风轻。在这收获的季节，浦发银行在上海举行了&mdash;&mdash;首批&ldquo;金种子&rdquo;第一阶段现场集训。富瑞登金融学院创始人叶汇陶老师，被邀请为来自全国十五分行的产品经理和理财经理，进行针对性的银行三方业务营销策略与银行贵金属量化交易。叶汇陶老师讲课时精神饱满，精简、干练的语言阐述了最实用的道理。为了让培训人员深刻理解这一主题，他还通过精心准备的两套金钱游戏，供大家参与体会交易系统的胜率KPI，引起了大家的极大兴趣。课程中，叶老师还展示了其创立的顶尖交易员专业训练十大模块，为理财经理演示了如何通过专业训练服务，来帮助客户提升专业水平进而成为优质稳健的交易客户。培训会结束后，大家都表示，这样的培训让人铭记在心，体会颇多，收获更多，仅仅一天的课程，丰富的培训内容，主题明确，内容充实，形式却多种多样。期待下一次的课程。</p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132319318111.png\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132332174142.png\" /></p>\r\n', '2017-02/20170214132641295902.png', NULL, '2017-02/20170214132249483214.png,2017-02/20170214132319318111.png,2017-02/20170214132332174142.png', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486423042, 2, 1487050001, NULL, NULL, 'en'),
(90, 0, '107', 30, 'Ruizean Trader与您一起成长共同发展', '', '', NULL, NULL, '', '', '', '01/31/2017', NULL, 'Ruizean Trader', '金融业瞬息万变，要一直紧贴其中发展殊不容易，iFX EXPO旨在填补这个缺口，通过有业内专家参与的主题会议及工作坊，分享金融知识及诀窍。', '<p>\r\n	&quot;金融业瞬息万变，要一直紧贴其中发展殊不容易，iFX EXPO旨在填补这个缺口，通过有业内专家参与的主题会议及工作坊，分享金融知识及诀窍。在为期两天的展会期间，来自中国本土与海外的参展商各展风采，共同上演了一场精彩绝伦的外汇盛宴。据主办方统计，本次展会有超过2500名与会者出席，参展人数激增展馆规模全面升级，可谓盛况空前。大会目的是提供机会，促进服务供应商及外汇从业员相互间的业务增长，不仅协助从业员透过市场推广、平台及服务供应商认识最新业界趋势，更让他们与业内人士结识交流，从中引介经纪。 </p>\r\n<p>\r\n	2017年一届，将有80多家参展商及赞助商参加，预计出席者将超过2,500人。题材方面，将包括当今交易场所最热门的技术趋势、英国脱欧对欧洲和亚洲影响的深入了解、中国外汇经纪要面对的挑战和机遇、手机技术如何影响外汇交易，以及有关亚洲商品交易前景的各种不同见解。 </p>\r\n<p>\r\n	Ruizean Trader作为代表澳大利亚的活跃劵商，我们将带领广大交易者们，一起参与各大外汇盛事，更多地了解外汇市场，一起成长共同发展。&quot;</p>\r\n', '2017-03/20170309055621201131.jpg', NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486423056, 2, 1489010334, NULL, NULL, 'en'),
(91, 0, '107', 40, '近期活动', '', '', NULL, NULL, '', '', '', '01/31/2017', NULL, 'Ruizean Trader', '敬请各位期待我们下次的交流会内容，感谢万分。', '<p>\r\n	近期活动: Ruizean Trader作为活跃在澳大利亚的外汇交易商，我们一直致力与与客户共同发展与成长。</p>\r\n<p>\r\n	我们拥有和客户互利互惠的成熟运营模式，也有为客户提供学习外汇的机会. 除了专业的客户经理维护，资深的分析师提供行情解析，我们也为客户精心的准备了线下的交流会，互相分享成功交易的经验，市场的各种趣闻与知识等等。</p>\r\n<p>\r\n	敬请各位期待我们下次的交流会内容，感谢万分。</p>\r\n', '2017-02/20170207071942818517.jpg', NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1486423182, 2, 1489010352, NULL, NULL, 'en'),
(98, 0, '111', 10, 'Database Optimize', '', '', NULL, NULL, NULL, NULL, NULL, '02/14/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1487048473, 2, 1488843201, NULL, 'http://www.google.com.au', 'en'),
(99, 0, '111', 20, 'Database Optimize2', '', '', NULL, NULL, NULL, NULL, NULL, '02/08/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1487048492, 2, 1488843211, NULL, 'http://www.google.com.au', 'en'),
(100, 0, '113', 10, 'Regulation & License', '', '', NULL, NULL, NULL, NULL, NULL, '02/16/2017', NULL, NULL, NULL, '<p>\r\n	Ruizean Trader has its headquarters in Sydney, Australia and are supervised by the Australian Securities and Investment Commission (ASIC); ABN 600 177 473, AFS Licence No. 0000000.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	The Australian Securities and Investments Commission (ASIC) are the Australian banking, securities, foreign exchange and retail industry regulators. With the 2001 introduction of the Australian &quot;Securities and Investments Commission Act&quot;, ASIC supervises and regulates not only the retail forex market, but also the banking, securities, insurance and other financial sectors and is a vital part of Australia&#39;s national financial system.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	The basic functions of the ASIC are the maintenance of market integrity and consumer protection. ASIC with its strict enforcement of the regulatory system, has long been recognized as one of the world&#39;s most rigorous and robust, financial regulatory systems.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Ruizean Trader consistently abides by the laws and regulations of these regulatory authorities, adhering to their strict standards, and preserving adequate capital funds at all times. We also provide financial statements to these regulatory authorities, and have maintained a flawless record to date. We endeavour to provide a transparent, impartial and speedy transaction service to all of our clients.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	According to the Australian Securities and Investments Commission&rsquo;s (ASIC) regulatory requirements, all of our clients&#39; funds are kept separate in trust accounts of Australia&#39;s top banks, and are kept independent of Ruizean Trader&rsquo;s company funds.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	In order to meet all of our regulatory obligations, we provide the following documents for you to download:</p>\r\n<p>\r\n	Financial Services Guide.</p>\r\n<p>\r\n	Product Disclosure Regulations.</p>\r\n<p>\r\n	Customer Terms.</p>\r\n<p>\r\n	We strongly recommend that all customers download and read these documents, making sure that you fully understand the nature of foreign exchange and CFD trading, and understand your rights and obligations when trading.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1487213168, 1, 1489650965, NULL, NULL, 'en'),
(101, 0, '113', 20, 'The Freedom Financial Trading Academy', '', '', NULL, NULL, NULL, NULL, NULL, '02/16/2017', NULL, NULL, NULL, '<p>\r\n	For the past 16 years, the Freedom Financial Trading Academy has been training professional traders in high-end financial institutions. The Academy offers more than 3000 hours of online training in trading and more than 10,000 students have been trained, and are now working as professional traders.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	The Freedom Financial Trading Academy has created a precedent for the industry, using their experience and extensive knowledge to explain the practical operations of trading to students. On completion of this training, students have the equivalent of 2-3 years&rsquo; work experience with a comprehensive knowledge of precious metals trading.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	As the largest trading training institution, the Academy has established an enviable reputation for excellence. Many of their graduating students have joined some of the most prestigious and well-known trading firms in the world and have been very successful in their careers.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	The Freedom Financial Academy follows the norms of the international trading training guidelines for both the Chinese financial market and the international financial markets. With this type of training, graduates can easily engage in either personal trading or become a trader for a major institution.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1487214003, 2, 1488780893, NULL, NULL, 'en'),
(102, 0, '114', 10, '名师宝典', '', '', NULL, NULL, NULL, NULL, NULL, '02/16/2017', NULL, NULL, NULL, '<p>\r\n	书籍《外汇交易教程》</p>', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1487224639, 2, 1489106251, NULL, NULL, 'en'),
(103, 0, '114', 20, 'Abraham COFNAS 介绍', '', '', NULL, NULL, NULL, NULL, NULL, '02/16/2017', NULL, NULL, NULL, '<p>\r\n	三十年职业生涯，世界级二元期权专家，北美衍生品交易所技术顾问，衍生品交易权威杂志《Futures Magazine》首位专栏评论员，定期为全球顶尖财经频道CNBC提供市场分析。曾先后就任Strategic Commodity公司交易部门总监和全美最大零售股票经纪公司之一Dean Witter总裁。由其组建的自营基金团队长期在全球金融市场进行外汇、证券、债券、期货和期权间的跨品种交易。</p>\r\n<p>\r\n	书籍《交易密码》</p>', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1487224676, 2, 1489106263, NULL, NULL, 'en'),
(105, 0, '114', 40, '叶汇陶介绍', '', '', NULL, NULL, NULL, NULL, NULL, '02/16/2017', NULL, NULL, NULL, '<p>\r\n	10年外汇交易实战经验，12年金融行业创业和高管经验，6年机构交易员团队组建和训练经验。曾先后担任英国艾福瑞中国区首任首席代表、东航金融外汇业务创始人和负责人，期间共培养来自全国3000多家投资公司职业经理人和交易员团队，并为海外总公司组建和培养了自营交易员团队。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	太极咏春交易系统（交易信号提醒器）</p>\r\n<p>\r\n	太极咏春交易系统手机版，pc版</p>\r\n<p>\r\n	太极咏春交易系统使用说明</p>\r\n<p>\r\n	交易法宝</p>\r\n<p>\r\n	1，精华文章</p>\r\n<p>\r\n	2，太极咏春教程</p>\r\n<p>\r\n	3，太极咏春组合拳移动系统</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1487224725, 2, 1489106271, NULL, NULL, 'en'),
(106, 0, '102', 420, '标准账户', '', '', '', '', '', '', '', '01/25/2017', '', '', '', 'a:13:{s:9:\"fromPrice\";s:33:\"原始ECN银行间或机构级STP\";s:6:\"spread\";s:9:\"从1.8起\";s:8:\"platform\";s:3:\"MT4\";s:6:\"server\";s:20:\"纽约 - Equinix NY4\";s:8:\"leverage\";s:17:\"杠杆高达400:1\";s:5:\"banks\";s:12:\"Metatrader 4\";s:10:\"lowestFund\";s:10:\"$200美元\";s:16:\"currencyClassify\";s:3:\"50+\";s:11:\"minTradeNum\";s:7:\"0.01手\";s:10:\"tradeFunds\";s:8:\"$0美元\";s:12:\"lowestSaving\";s:28:\"最低存款只需$200美元\";s:11:\"programLang\";s:4:\"MQL4\";s:3:\"ppl\";s:15:\"所有交易员\";}', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1508200062, '', '', 'zh-cn'),
(107, 0, '102', 410, '机构账户', '', '', '', '', '', '', '', '01/25/2017', '', '', '', 'a:13:{s:9:\"fromPrice\";s:33:\"原始ECN银行间或机构级STP\";s:6:\"spread\";s:12:\"从0.1点起\";s:8:\"platform\";s:3:\"MT4\";s:6:\"server\";s:20:\"纽约 - Equinix NY4\";s:8:\"leverage\";s:17:\"杠杆高达400:1\";s:5:\"banks\";s:12:\"Metatrader 4\";s:10:\"lowestFund\";s:12:\"$50000美元\";s:16:\"currencyClassify\";s:3:\"50+\";s:11:\"minTradeNum\";s:6:\"0.1手\";s:10:\"tradeFunds\";s:14:\"$7美元每手\";s:12:\"lowestSaving\";s:28:\"最低存款只需$200美元\";s:11:\"programLang\";s:4:\"MQL4\";s:3:\"ppl\";s:15:\"专业交易员\";}', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1508200052, '', '', 'zh-cn'),
(108, 0, '103', 10, 'logo management', '', '', '', '', '', '', '', '01/25/2017', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(109, 0, '104', 140, 'banner management', '', '', '', '', '', '', '', '01/27/2017', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1489059945, '', '', 'zh-cn'),
(110, 0, '105', 10, 'logo management', '', '', '', '', '', '', '', '01/27/2017', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1508199700, '', '', 'zh-cn'),
(111, 0, '108', 10, 'holiday trading time', '', '', '', '', '', '', '', '01/30/2017', '', '', '', '', '', '', '', '2017-02/20170209102954674526.pdf', 'sample-3pp.pdf', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(112, 0, '106101', 10, '2017年3月10日交易（非农）风险提示', '', '', '', '', '2017年3月10日交易（非农）风险提示', '', '', '08/04/2016', '', 'Ruizean Trader', '交易（非农）风险提示 北京时间 2017年03月10日（周五）20:30 美国劳工部将发布美国3月非农就业数据。', '<p>\r\n	交易（非农）风险提示 北京时间 2017年03月10日（周五）20:30 美国劳工部将发布美国3月非农就业数据。市场前值22.7万，预期值17.5万。这次的非农数据可能会为美联储3月是否加息给市场一个更加明确的指引。请大家拭目以待。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797304, '', '', 'zh-cn'),
(113, 0, '106101', 20, '3月加息概率狂飙至90%！', '', '', '', '', '3月加息概率狂飙至90%！', '', '', '03/03/2017', '', 'Ruizean Trader', '全球利率概率（WIRP）显示，市场预期美联储3月加息概率达到90%，一周以前大概只有20%，相当于加息概率在一周内翻了三倍多。', '<p>\r\n	全球利率概率（WIRP）显示，市场预期美联储3月加息概率达到90%，一周以前大概只有20%，相当于加息概率在一周内翻了三倍多。这主要得益于美联储官员们的&ldquo;嘴炮&rdquo;功夫。受此影响，加之此前公布的美国上周初请失业金人数降至44年新低，美元创8周新高，现报102.14，现货黄金跌幅扩大至1.4%，逼近1230美元/盎司关口，现货白银跌幅短线迅速扩大，一度逼近4%，现报17.77美元/盎司。 </p>\r\n<p>\r\n	本周以来，已有五位美联储高官密集释放鹰派信号。今年FOMC票委、达拉斯联储主席卡普兰周一和周二接连表示，加息&ldquo;宜早不宜迟&rdquo;； 美联储主席耶伦的老下级、旧金山联储主席威廉姆斯周二称，美联储已经非常接近就业和通胀目标，他预期3月会议将&ldquo;认真考虑&rdquo;加息。 </p>\r\n<p>\r\n	美联储&ldquo;三号人物&rdquo;、纽约联储主席杜德利周二表示，加息的理由显得更为紧迫，预计联储可能在&ldquo;相对不远的将来&rdquo;加息。与耶伦关系密切、美联储理事布雷纳德周三认为，当前内外形势都有利于加息，若持续进步，迅速加息可能适宜。 </p>\r\n<p>\r\n	周四晚间最新发表讲话的是美联储理事鲍威尔。他表示三月加息在美联储的讨论日程之中，今年加息三次依然感觉不错。他希望在缩表前看到利率远远高于零。随着这些高官陆续讲话，WIRP显示的市场对美联储3月加息的预期概率一路从20%、30%左右升至50%、70%、80%，最后达到90%。</p>\r\n<p>\r\n	但请注意，WIRP只是衡量市场对美联储加息概率预期的一种指标，它可能高估真实预期，但无疑体现了市场对3月加息预期高涨这种趋势。芝加哥商业交易所（CME）根据美国联邦基金期货交易制作的&ldquo;美联储观察工具&rdquo;则显示，目前市场预期3月加息概率达到75.3%，也明显高于一周前的30%。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797427, '', '', 'zh-cn'),
(114, 0, '106101', 30, 'OPEC减产协议背后：谁是赢家，谁是输家？', '', '', '', '', 'OPEC减产协议背后：谁是赢家，谁是输家？', '', '', '12/01/2016', '', 'Ruizean Trader', '随着OPEC终于将“用嘴动产”变成了“白纸黑字”，市场也立即给了激增10%的反应。', '<p>\r\n	随着OPEC终于将&ldquo;用嘴动产&rdquo;变成了&ldquo;白纸黑字&rdquo;，市场也立即给了激增10%的反应。 </p>\r\n<p>\r\n	但纵观OPEC内部的限产额度分配，非OPEC产油国的&ldquo;鼎力相助&rdquo;，以及美国页岩油的&ldquo;隔岸观火&rdquo;，或许各方都仍在疯狂打着自己的小算盘。 </p>\r\n<p>\r\n	首先，美国页岩油几乎能够肯定将借此东风在2017年回升产量。其次，&ldquo;慷慨&rdquo;的俄罗斯最多将减产约30万桶/天，但也有分析对其最终究竟能完成多少提出质疑。就算是在OPEC内部，携手承担大部分削减份额的沙特及其海湾阿拉伯盟国，与牺牲较少的伊朗伊拉克，在这场博弈中也是各有输赢。 </p>\r\n<p>\r\n	非OPEC的主要产油国也贡献了60万桶/天的减产量以携手度过难关，其中最引人注目的是十五年来首度参加限产的俄罗斯，贡献了约一半份额。俄罗斯能源部长Novak称，由于技术性原因，俄罗斯准备且只会在2017年上半年循序渐进地减产最多30万桶/日。 </p>\r\n<p>\r\n	但也有分析师对俄罗斯究竟能最终完成多少份额提出质疑，他们指出俄罗斯对于减产的贡献可能只会是自然下降或是产量增长放缓，而并不是适当的减产。</p>\r\n<p>\r\n	除俄罗斯以外的非OPEC产油国剩余的30万桶/日减产量，目前仍然不确定具体分配来源。哈萨克斯坦和阿曼均表示愿意做出贡献，但未有具体细节。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797464, '', '', 'zh-cn'),
(115, 0, '106101', 40, '谁当选最符合美联储的心意', '', '', '', '', '谁当选最符合美联储的心意', '', '', '11/09/2016', '', 'Ruizean Trader', '耶伦今年秋天抛出一个观点，认为若低利率维持更长时间，即“高压经济”下或许能让闲置劳动力重回经济，有助于修补金融危机期间造成的损害。', '<p>\r\n	耶伦今年秋天抛出一个观点，认为若低利率维持更长时间，即&ldquo;高压经济&rdquo;下或许能让闲置劳动力重回经济，有助于修补金融危机期间造成的损害。这个构想实质上就是要让美联储即使在经济增速或通胀率超出目标时，仍继续大开水龙头，一部分是寄望能够刺激生产力上升。 </p>\r\n<p>\r\n	但如果特朗普当选，将使市场天下大乱，可能让原本机会甚高的12月加息无法实现。此外，特朗普计划在缺乏财源的情况下减税，并主张保护主义措施，这将会在短期内刺激经济增长率，有可能威胁通胀走高。如此一来，美联储能够控制风险的空间将更少。再者，特朗普当选后料将施压美联储，并挑战美联储的独立性，这一点将让美联储更没有机会采取&ldquo;高压经济&rdquo;路线。 </p>\r\n<p>\r\n	而如果民主党大获全胜，则可能会有更多刺激性财政政策推出，这应会鼓励美联储采取更加常规化的路线，回归&ldquo;正常&rdquo;利率，在12月采取加息举措，明年再加息两次或三次。</p>\r\n<p>\r\n	如果希拉里获选、国会由两党分治的话，则意味着会出现僵局，或者非常类似僵局的情况。届时将没有太大财政刺激的空间，充其量就是在一些细枝末节上小打小闹，比如像公司税改革这些有共同基础的问题。这是最可能出现的结果，也最有可能促使美联储加息一次，然后在接下来的加息进程中极其缓慢地行动。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797518, '', '', 'zh-cn'),
(116, 0, '106102', 10, 'OPEC减产协议背后：谁是赢家，谁是输家？', '', '', '', '', 'OPEC减产协议背后：谁是赢家，谁是输家？', '', '', '02/06/2017', '', 'Ruizean Trader', '', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 1, 1488354395, 2, 1488796459, '', 'http://test.legenddigital.com.au/ruizeanTrader/zh-cn/newsDetail/1/114', 'zh-cn'),
(117, 0, '106101', 50, '调查：更多共和党人预计希拉里将当选美国总统', '', '', '', '', '调查：更多共和党人预计希拉里将当选美国总统', '', '', '08/05/2016', '', 'Ruizean Trader', '现在有更多的美国共和党人认为，民主党总统候选人希拉里将击败共和党候选人特朗普赢得大选，因为特朗普正面对各种不利因素苦苦挣扎，其中包括对其性行为不检的指责，以及他暗示可能拒绝接受败选结果。', '<p>\r\n	现在有更多的美国共和党人认为，民主党总统候选人希拉里将击败共和党候选人特朗普赢得大选，因为特朗普正面对各种不利因素苦苦挣扎，其中包括对其性行为不检的指责，以及他暗示可能拒绝接受败选结果。 </p>\r\n<p>\r\n	周三发布的调查结果显示，41%的共和党人预计希拉里将赢得大选，而选择特朗普的共和党人为40%。本次调查于10月20日至24日进行。这一结果说明共和党人的信心较上月大幅下滑，上月时有58%的共和党人称认为特朗普将胜选，23%的人预计希拉里将胜出。 </p>\r\n<p>\r\n	在特朗普的支持者中，49%的人认为特朗普将获胜，低于月初时的67%。尽管悲观情绪渐涨，但特朗普在党内仍获得压倒性的支持。约有79%可能投票的共和党人表示将投给特朗普。许多选民称支持特朗普，是因为预期他将在国会推动保守派议程，以及会在最高法院任命保守派法官。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797547, '', '', 'zh-cn'),
(118, 0, '106101', 60, '决定欧洲前途的女性：特雷莎·梅与默克尔将在英退谈判中交锋', '', '', '', '', '决定欧洲前途的女性：特雷莎·梅与默克尔将在英退谈判中交锋', '', '', '08/04/2016', '', 'Ruizean Trader', '同样都是牧师之女，也都是学者从政，然后再登上本国保守党领袖之位，英国新任首相特雷莎·梅(文翠珊，Theresa May)及德国总理默克尔，都以坚毅但务实的态度着称，现在这两位领导人将正面交锋，决定英国与欧洲的未来关系。', '<p>\r\n	同样都是牧师之女，也都是学者从政，然后再登上本国保守党领袖之位，英国新任首相特雷莎&middot;梅(文翠珊，Theresa May)及德国总理默克尔，都以坚毅但务实的态度着称，现在这两位领导人将正面交锋，决定英国与欧洲的未来关系。 </p>\r\n<p>\r\n	特雷莎&middot;梅现年59岁，比默克尔年轻两岁，在欧洲官员之中有很高评价。一名曾与特雷莎&middot;梅密切合作的德国高层官员形容她&ldquo;非常有纪律&rdquo;。巴黎一名消息人士表示，特雷莎&middot;梅与法国内政部长Bernard Cazeneuve&ldquo;关系绝佳&rdquo;。如今她将需要尽其可能在欧洲争取友善支持。特雷莎&middot;梅的挑战是对付默克尔的谈判力量及耐力。默克尔在担任德国总理的10年来，经常在挑灯夜战的欧盟马拉松会议上，比其他欧盟领袖撑得更久。 </p>\r\n<p>\r\n	根据里斯本条约，英国退出欧盟的协议必须与欧洲理事会达成；欧洲理事会成员包括其他27个欧盟成员国领袖。 </p>\r\n<p>\r\n	但默克尔扮演了关键角色。6月23日英国民众公投选择退欧后，默克尔与法国及意大利领袖会面，规划欧盟前途，显示出欧盟几个最大的成员国希望由他们来决定欧盟前途，而不是欧盟的各大机构。 </p>\r\n<p>\r\n	这两名女性领导人都是一路过关斩将，击败男性对手，一步步登上执政高位。默克尔是在2005年击败做派更为张扬闪耀的前总理施罗德。特雷莎&middot;梅过去六年担任英国内政部长，她之所以能成为首相，单纯是因为国会保守党成员选她担任执政党党魁。但就是这位宣称自己并非&ldquo;作秀政客&rdquo;的特雷莎&middot;梅，将亲欧盟但在公投中大意失荆州的卡梅伦给换下来。 </p>\r\n<p>\r\n	默克尔和特雷莎&middot;梅都认同的是：英国民众选择退欧就是要退欧。默克尔坚称，公投结果必须予以尊重。除了这点之外，战场已经设定好了。特雷莎&middot;梅称，英国不急于根据里斯本条约推进正式退欧程序。但默克尔希望英国迅速表明其意向。</p>\r\n', '', '', '', '', '', 1, 1, 0, 0, 0, 0, 1, 1488354395, 2, 1488797588, '', '', 'zh-cn'),
(119, 0, '106102', 20, '3月加息概率狂飙至90%！', '', '', '', '', '3月加息概率狂飙至90%！', '', '', '02/02/2017', '', 'Ruizean Trader', '', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 1, 1488354395, 2, 1488795883, '', 'http://test.legenddigital.com.au/ruizeanTrader/zh-cn/newsDetail/1/113', 'zh-cn'),
(120, 0, '109', 10, '我要申请真实账户，该如何操作？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	很简单，点击开始<a href=\"\">真实账户</a>，拼音填写开户申请，并上传证明文件；完成所有步骤并提交，总部依次审核证明文件，一旦审核通过，将由上海代表处和您电话确认信息激活账户，在此期间请保持电话畅通；确认信息之后，您将收到客户专区的登录信息和交易账户的登录信息；您的申请步骤已经完成，接下来即可以登录<a href=\"\">客户专区</a>入金。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(121, 0, '109', 20, '在Ruiizean Trader交易外汇需要支付哪些费用？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的MetaTrader4平台上有两种外汇账户，一种标准账户，另一种为行业领先的真正的ECN账户。关于标准账户，我们不收佣金，但会在来自于流动性提供商提供的银行间报价上加1个点作为服务费用。而关于真正的ECN账户，则直接显示来自于流动性提供商提供的银行间报价，在这个ECN账户上我们加收每标准手7美金的佣金。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(122, 0, '109', 30, '我如何才能成为IB（介绍经纪商）？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	我们非常欢迎IB进行合作，如果希望成为我们的经纪商，填写<a href=\"\">介绍经纪人申请</a>，填写完毕后，我们会有IB专员负责与您联系。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1489106936, '', '', 'zh-cn'),
(123, 0, '109', 40, '您们的真实交易服务器IP地址是什么？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(124, 0, '109', 50, '取款需要手续费吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	通过信用卡取款（60天内)是通过退款的方式处理所以不发生费用。</p>\r\n<p>\r\n	国际汇款业务手续费：&nbsp;20澳元 + 30-35美金（中间行收取）请注意：其中仅20澳元为Ruizean Trader代为扣除银行汇款手续费，中间行费用为中间行直接收取，且不同国家不同银行各有不同。因此在客户专区中并无此注释，敬请理解。</p>\r\n<p>\r\n	银联取款汇率也是由银行直接报价。Ruizean Trader作为STP交易商，不是客户的交易对手，其性质决定了无法完全承担客户的出入金手续费。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(125, 0, '109', 60, '我该如何入金？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader支持如下方式汇款：</p>\r\n<ul>\r\n	<li>\r\n		Bank / Wire Transfer （银行电汇）</li>\r\n	<li>\r\n		Credit / Debit Card （信用卡）</li>\r\n	<li>\r\n		Neteller</li>\r\n	<li>\r\n		Skrill</li>\r\n	<li>\r\n		Broker to broker transfer （外汇公司间转账）</li>\r\n	<li>\r\n		China Union Pay &nbsp;（银联入金）</li>\r\n</ul>\r\n<p>\r\n	 我们的<a href=\"\">入金页面</a>有详细的入金介绍</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(126, 0, '109', 70, '开设真实账户的最低入金要求是多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的MT4平台的标准账户只需200美金即可激活账户，而机构帐户则需要50000美金。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(127, 0, '109', 80, 'Ruizean Trader的保证金（预付款）强制平仓水平是多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的保证金追缴水平为预付款（保证金）比例到达120%时平台内的最大亏损订单出现颜色提醒，但不会强制平仓。当预付款比例降低到80%以下时，系统便会开始强制平仓，平仓顺序是从亏损最大的订单到亏损最小的订单开始逐个平仓。注意：不是同一时间全部平仓所有仓位，而是逐个平仓。当平掉一个最大的亏损仓位时，预付款比例高于80%，系统不会再继续平仓，而是等待预付款比例再次到达80%以下时，才开始平掉下一个亏损最大的订单。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(128, 0, '109', 90, '保证金强平公式如下：', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	预付款比例水平=净值 / 已用预付款 x 100% <br />\r\n	= 预付款水平 %&nbsp;</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(129, 0, '109', 100, '样例', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	一个净值10000美金的账户中，持有1标准手USD/JPY, 杠杆100倍，其保证金计算如下：<br />\r\n	= 10,000 / 1,000（已用保证金） x 100%<br />\r\n	= 1000% （保证金水平）<br />\r\n	如果这个行情与您的持仓相反晕倒导致您的净值跌到5000美元。<br />\r\n	= 5,000 / 1,000 x 100%<br />\r\n	= 500% （保证金水平）<br />\r\n	当行情继续运行，导致您的净值跌到799美金时，您的账户将会被强制平仓。因为此时你的保证金水平为79.9%，低于规定的80%。<br />\r\n	= 799 / 1,000 x 100%<br />\r\n	= 79.9% （保证金水平）</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(130, 0, '109', 110, '我该如何选择最适合我的账户类型？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader提供两种类型的账户：MT4的标准账户和机构账户。您可以根据自身交易特点选择最适合您的账户类型。<br />\r\n	两种账户的具体区别请查看<a href=\"http://test.legenddigital.com.au/ruizeanTrader/?con=web&amp;ctl=accounttype\">账户类型比较表</a>。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(131, 0, '109', 120, 'Ruizean Trader的点差是多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader提供整个外汇行业最具竞争力的点差，比如欧美点差平均低至1.8个点。<br />\r\n	具体的点差请查看我们的<a href=\"\">点差列表</a>。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(132, 0, '109', 130, '我该如何办理取款？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果需要取款，只需登录<a href=\"\">客户端登陆区</a>填写取款申请表即可完成取款。登录进去之后，选择&quot;<a href=\"\">取款</a>&quot;选项，并选择取款方式，然后输入自己的银行账号信息，提交即可。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(133, 0, '109', 140, 'Ruizean Trader的标准账户与机构账户有什么区别？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的MetaTrader4平台上有两种外汇账户，一种标准账户，另一种为机构帐户。关于标准账户，我们不收佣金。而关于机构账户，则直接显示来自于流动性提供商提供的银行间报价，在这个机构账户上我们加收每标准手7美金的佣金。<br />\r\n	关于两者之间的具体比较，请查看<a href=\"\">交易账户类型比较表格</a>。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(134, 0, '109', 150, '我该如何修改MT4的投资密码？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	登录MT4，点击平台上方的&rdquo;工具&ldquo;，选择下拉菜单&rdquo;选项&ldquo;，进入&rdquo;服务器&ldquo;， 在账号密码后点击&rdquo;变更&ldquo;，随后会弹出变更密码，在弹出框中依次输入旧密码和新密码即可完成更改。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(135, 0, '109', 160, '为什么我连接不上服务器？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	我们的服务器状态如下：. 状态 :&nbsp;所有服务器运行正常 如果您登录不上平台，您可以试下代理服务器，详情请查看设置MT4代理服务器。如果您依旧登录不上平台，登陆我们的主页在主页的旁边有我们的联系方式，协助您查看下网络链接情况。<br />\r\n	有些网络连接速度比较慢，所以请耐心等待1分钟左右。同时也请注意有些公共网络会限制交易平台的运行。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(136, 0, '109', 170, '在哪里能看到利息表？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '利息可以在Metatrader4平台里直接查看。在”市场报价“窗口中任意位置点击右键，选择”商品列表“，在弹出的窗口中选择您想查看的货币对，然后点击右边的”属性“，随后弹出的窗口中可以看到”买单掉期库存费“及”卖单掉期库存费“ 即是买入和卖出的隔夜利息。', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(137, 0, '109', 180, '保证金是什么意思，以及如何计算保证金（预付款）？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在MT4平台上，将Magin翻译成预付款。一般我们称为&quot;保证金&rdquo;。保证金是指您为了开设仓位而必须预付在账户中的一笔款项。IC Markets提供高达500倍的保证金杠杆。所需保证金是以基础货币为单位进行计算然后按现汇价格换算成美元来计算。如果您的可用保证金（预付款）低于您开仓时所需要的保证金，您将不能开仓。可用保证金是用来衡量可以开设多少新仓位所需的保证金。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(138, 0, '109', 190, '保证金是用由以下公式计算得出：', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	所需保证金 = (现在市场报价 x 交易数量) / 账户杠杆<br />\r\n	举例如下：<br />\r\n	如果您希望在EUR/USD的现价（1.35645）基础上开仓一个数量为0.1手（10000基础单位）的订单，账户杠杆是400倍，则您的所需保证金计算公式如下：<br />\r\n	<br />\r\n	(1.35645 x 10000) / 400 = $33.91<br />\r\n	在这个例子中，下一个0.1手的订单所需保证金为33.91美金，所以您的账户内可用保证金至少有33.91美金，才可以开设仓位成功。<br />\r\n	<br />\r\n	如果是USD/JPY 等USD作为基础货币的货币对，则所需保证金则直接为：交易数量/杠杆。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(139, 0, '109', 200, '如何确保资金安全？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader致力于为客户提供出众的交易环境和最优质的服务，并且严格遵循法规架构，实施严谨及高标准的管理流程，以确保客户资金在高度安全的机制下被妥善管理。点击&nbsp;这里&nbsp;了解监管机制。Ruizean Trader具备良好的管理和充裕的资金，我们的收款银行是澳洲最大的商业银行 &mdash;全球 AA 级的国际银行西太平洋银行，其服务于全球多个国家和地区投资者，是澳大利亚四大银行之一。Ruizean Trader严格执行客户资金分离制度, 并且完全遵从 ASIC 监管条例第 212 和 227 条，所有客户的资金将进行每日银行审核与结算。Ruizean Trader严格遵守澳大利亚证券投资委员会 ASIC 监管规定购买专业责任保险 (Professional indemnity insurance)。Ruizean Trader致力于提供全面的透明性，每天向客户发送交易报告，并遵照ASIC的监管要求，将实时入金、出金交易执行确认，以及交易记录呈交备案。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(140, 0, '109', 210, '开户的最低入金要求是多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader 为我们的客户提供良种类型的帐户供您选择，考虑到让客户享受最佳交易体验，其中标准帐户最低入金是200美元，ECN机构客户最低入金50000美元。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(141, 0, '109', 220, 'Ruizean Trader 提供哪些入金的方式？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader支持如下方式汇款：</p>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		Bank / Wire Transfer （银行电汇）</li>\r\n	<li>\r\n		Credit / Debit Card （信用卡）</li>\r\n	<li>\r\n		Neteller</li>\r\n	<li>\r\n		Skrill</li>\r\n	<li>\r\n		Broker to broker transfer （不同交易商之间转账）</li>\r\n	<li>\r\n		China Union Pay &nbsp;（银联入金）</li>\r\n</ul>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(142, 0, '109', 230, 'Ruizean Trader接受哪些货币的入金？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader接受澳币AUD，美元USD，以及在岸人民币入金。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(143, 0, '109', 240, '入金需要多少时间才能到账开始交易?', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	这要取决于客户用哪种入金方式入金，一般来讲电汇（Bank / Wire Transfer）需要1-2个工作日才会到达我们的客户资金托管银行，而选择信用卡（Credit / Debit Card），Neteller，Skrill以及银联（China Union Pay ）入金的客户，我们都可以做到即时到账，客户马上就可以开始交易。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(144, 0, '110101', 10, 'Ruizean Trader是谁？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader是一家接受世界顶级监管的外汇经纪商，通过与世界顶级一流的外汇流动性提供商合作，向交易者提供全球外汇市场准入。在Ruizean Trader，交易者可以体验极速的外汇交易执行、银行同业等级待遇以及RAW ECN价差。我们提供Windows版本的MetaTrader 4&nbsp;以及适用于苹果与安卓客户端等移动交易MT4 的稳定的外汇交易平台，向客户提供全球外汇市场准入。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(145, 0, '110101', 20, 'Ruizean Trader的MT4交易平台可以交易哪些市场？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader使用行业领先的MT4交易平台，支持包括外汇,&nbsp;大宗商品以及指数市场在内的多种品种交易。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(146, 0, '110101', 30, 'Ruizean Trader接受监管了吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader是一家接受澳大利亚证券投资委员会ASIC监管的外汇经纪商。在澳大利亚证券投资委员会（ASIC）的监管下，Ruizean Trader保障其所有外汇交易的绝对透明。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(147, 0, '110101', 40, 'Ruizean Trader的交易账户里面的资金安全吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader所属客户的资金都存放在澳大利亚AA-级银行西太平洋银行（Westpac）的独立隔离账户，保障客户账户资金的安全。西太平洋银行（Westpac）是澳大利亚四大银行之一，总资产超过2000亿澳元，该银行为超过750万的客户提供服务</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(148, 0, '110101', 50, 'Ruizean Trader的交易服务器在哪里？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader使用光纤布线解决方案，链接全球范围内的外汇交易服务器。这保障了每笔交易的极速执行。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(149, 0, '110101', 60, 'Ruizean Trader接收来自美国的客户吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	受限于美国商品期货交易委员会（CFTC）规定，美国交易者不能通过非美国经纪商交易。Ruizean Trader处于澳大利亚，接收ASIC监管，按照CFTC相关规定，很遗憾并不能接收来自美国的客户。但对于其它国家的交易者，很欢迎他们选择Ruizean Trader。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(150, 0, '110101', 70, 'Ruizean Trader使用了哪些流动性提供商？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader是真正的STP/ECN外汇经纪商，在潜在外汇市场上的深流动性池汇集了最好的卖价与买价。这些价格是在我们网站主页所列及的那些顶级投资银行提供。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(151, 0, '110102', 10, '如何申请Ruizean Trader的免费模拟账户？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	想要在Ruizean Trader申请一个免费MT4模拟账户，可点击每一页面右上角顶端的&ldquo;模拟账户&rdquo;的按钮。仅需简单填写您的信息，然后提交表格，即可立即下载MT4交易平台，开始学习外汇交易。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(152, 0, '110102', 20, 'Ruizean Trader的免费模式账户的使用时限是多长时间？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	每一个Ruizean Trader的MT4免费模拟账户的使用时间是30天。Ruizean Trader建议交易新手先使用模拟账户体验外汇交易，一直等到适应Ruizean Trader的MT4交易平台以及自己的交易策略。如果您的模拟账户已过期并且想要申请新的模拟账户，请随时发送电子邮件联系我们。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(153, 0, '110102', 30, '随时发送电子邮件联系我们。 如何申请Ruizean Trader的真实交易账户？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	想要申请Ruizean Trader的MT4真实账户，可点击每一页面右上角顶端的&ldquo;真实账户&rdquo;的按钮。填写表格，提交证明身份的相关文件，申请受理之后，新的账户详细信息将会通过电子邮件发送至您预留的邮箱。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(154, 0, '110102', 40, '申请开设一个Ruizean Trader的真实外汇交易账户需要多长时间？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	申请真实外汇交易账户所要求填写的网上表格可以方便快速地完成。如果提交时已经上传了要求的身份证明文件，即可建立账户，并能够在24小时内交易。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(155, 0, '110102', 50, '申请Ruizean Trader的外汇交易真实账户需要提供什么文件？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	按照Ruizean Trader的相关规则，提交申请真实外汇交易账户时，还需要同时提交一些身份证明文件。可使用智能手机、数码照相机抑或是扫描仪等，将一张清晰的要求文件发送至application@ruizeantrader.com。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(156, 0, '110102', 60, 'Ruizean Trader的真实外汇交易账户收费吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的真实外汇交易账户为零申请费用账户及管理费用账户，这保障了不同的交易者可以按照自身的情况入金及交易。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(157, 0, '110102', 70, '如何向Ruizean Trader的MT4交易账户入金？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader对客户提供多种方式进行账户入金。支持国内银行间转账、国际银行间转账、中国银联支付、Neteller、Skrill、以及信用卡支付。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(158, 0, '110102', 80, '开设Ruizean Trader的真实交易账户的最低入金额度为多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader支持的最低入金额度，所有STP标准账户为$200，ECN机构账户为$50000。值得注意的是，即便是$0也可以申请及保留外汇交易真实账户。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(159, 0, '110102', 90, '信用卡入金需要验证吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	首次使用信用卡向真实MT4交易账户入金时，必须首先验证信用卡。可使用智能手机、数码照相机抑或是扫描仪等，将一张清晰的信用卡正面照片发送至tradersupport@ruizean.com。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(160, 0, '110102', 100, '如何从Ruizean Trader的MT4交易账户出金？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的客户既可以通过在登陆客户端里提交出金申请，亦可选择发送邮件的方式申请出金，只需发送一封出金请求的邮件即可至withdraw@ruizeantrader.com即可。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(161, 0, '110102', 110, '账户出/入金需要多长时间？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader尽力保障客户申请出金的当天收到出金款项。在12:00AEST之前提交的出金申请，将在48小时内受理。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(162, 0, '110102', 120, 'Ruizean Trader的出/入金收费吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader不对任何的出/入金收入任何内部费用。然而，国外银行机构间的出入账可能会对任一方收取一定的中介汇款费用，这些收费并不受Ruizean Trader控制。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(163, 0, '110102', 130, '标准STP标准账户与机构账户之间的区别是什么？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	可以使用Ruizean Trader的外汇交易账户对比页面的表格，比较STP标准账户与机构账户之间的区别。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(164, 0, '110102', 140, 'Ruizean Trader的真实外汇交易账户的最大杠杆是多少？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader的标准外汇杠杆从100:1开始，Ruizean Trader提供的外汇交易最大杠杆是400:1。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(165, 0, '110102', 150, '可以更改Ruizean Trader的外汇交易账户的杠杆吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在Ruizean Trader的网站客户一栏浏览至变更杠杆页面MT4交易账户的杠杆。如果您的交易策略需要更大的杠杆，可以发送邮件到cs@ruizeantrader.com进行修改。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(166, 0, '110102', 160, 'Ruizean Trader的交易账户类型可以在STP标准账户与机构账户之间更改吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果在对比外汇交易账户类型之后，想要将交易账户在STP标准账户与机构账户之间进行修改的话，请通过电话联系我们，或发送邮件至cs@ruizeantrader.com进行变更申请。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(167, 0, '110102', 170, '何时可以收到账单？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	无论是否有交易活动，Ruizean Trader会在每月的第一天由系统后台自动发送月度交易账单给我们的客户。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(168, 0, '110102', 180, '账户需要达到什么水平会发生追加保证金止损平仓？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	当MT4交易终端的&ldquo;保证金水平&rdquo;如果保证金水平下降至80%以下时，账户将会因未追加保证金而自动平仓。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(169, 0, '110102', 190, '在同一市场，可在同一时间持有长短仓吗？（可以对冲吗？）', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader支持所有的MT4交易账户在同一时间、同一外汇货币对、同时持有看涨看跌交易（亦称对冲）。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(170, 0, '110102', 200, '忘记密码或想要修改密码了怎么办？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在Ruizean Trader的MT4交易平台，选择&lsquo;工具&rsquo;&mdash;&lsquo;选项&rsquo;，选择&lsquo;服务器&rsquo;，然后选择&lsquo;变更&rsquo;。出于账户安全考虑，在忘记密码的情况下，只有Ruizean Trader服务团队方有权限重设密码。可电话咨询抑或发送邮件至cs@ruizeantrader.com。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(171, 0, '110102', 210, '如何找到投资者密码？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在Ruizean Trader的MT4交易平台，选择&lsquo;工具&rsquo;&mdash;&lsquo;选项&rsquo;，选择&lsquo;服务器&rsquo;，然后选择&lsquo;变更&rsquo;。在这里可以通过点击更改投资者密码框，使用主密码创建投资者密码。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(172, 0, '110103', 10, '可以在移动设备上交易Ruizean Trader的MT4外汇交易账户吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	Ruizean Trader为客户提供官方版MT4 移动客户端，支持随时随地交易。通过官方版MetaQuotes移动应用，快速稳定链接外汇交易账户。这一移动客户端适用于包括苹果与安卓在内的所有移动平台。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(173, 0, '110103', 20, '可以更改Ruizean Trader的MT4图表中的时间吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在Ruizean Trader的MT4界面不能更改交易平台时间。如果你下载并安装了支持此项个性化设置，注意有些平台设置将不能正常使用。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(174, 0, '110103', 30, '卖价与买价之间的区别是什么？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	&ldquo;卖价&rdquo;是指卖价愿意卖出货币对的价格，同样以&ldquo;要价&rdquo;著称。&ldquo;买价&rdquo;是指买家愿意买入货币对的价格。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(175, 0, '110103', 40, '图表显示卖价与买价了吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	默认情况下，Ruizean Trader的 MT4交易平台显示买价。如果想要同时显示卖价，可右击图表，选择&ldquo;属性&rdquo;，浏览至&ldquo;常用选项&rdquo;，点击&ldquo;显示卖价栏&rdquo;一框。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(176, 0, '110103', 50, '为什么在Ruizean Trader的MT4平台市场报价一栏无法查看到全部的货币对？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果在市场报价栏无法查看所有的外汇,&nbsp;商品期货及指数索引，可能是隐藏起来了。可直接在市场报价栏任一处右击，并选择&ldquo;显示全部&rdquo;即可。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(177, 0, '110103', 60, '如何在Ruizean Trader的MT4查看最新的掉期利率？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	在市场报价栏中，右击你选择的具体货币对，并选择&ldquo;规格&rdquo;。将会显示所选货币对包括买单卖单掉期利率在内的所有详情。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(178, 0, '110103', 70, '为什么外汇仓位在周三的掉期利率较平常高些？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	这是因为掉期利率涉及将潜在的期货合约的起息日后推了，而在周三，其起息日则是从周五变成了周一。由此掉期也就顺带了增加了两个工作日收费。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(179, 0, '110103', 80, '收到“账号错误”信息应该怎么办？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果是在真实账户中看到此消息，意味着输入了错误的登录信息或者密码。可直接联系我们，我们将立即帮你重置密码。如果是在模拟账户查看到此消息，可能是模拟账户30天的使用期限已经到了。可申请真实账户，亦可联系我们重新申请一个新的模拟账户。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(180, 0, '110103', 90, '收到“交易系统正忙”信息应该怎么办？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	交易MT4时收到&ldquo;交易系统正忙&rdquo;的信息，通常意味着系统同时在处理两个交易。解决这一问题，仅需关闭并重启MT4交易平台即可。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(181, 0, '110103', 100, '可以申请多个Ruizean Trader的MT4交易账户吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果您已经是Ruizean Trader的客户，并想要申请一个MT4子账户，可在登陆客户端开立新帐户页面填写表格。或者联系我们客服代表为您开立新的帐户，每一客户最多可同时拥有5个账户。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(182, 0, '110103', 110, '可以下载另一个Ruizean Trader的MT4交易平台吗？', '', '', '', '', '', '', '', '02/06/2017', '', '', '', '<p>\r\n	如果想要为另一电脑终端申请另一MT4交易平台，只需联系我们，我们将通过邮件发送给您足够的MT4安装文件。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(183, 0, '107', 10, '富瑞登交易学院', '', '', '', '', '', '', '', '02/07/2017', '', 'Ruizean Trader', '富瑞登交易学院在厦门召开为期2天的培训课程，主讲老师是来自富瑞登特聘华尔街专家Abraham COFNAS和全球交易商运营专家叶汇陶老师，为厦门的交易者们带来了一次难忘的课程体验。    全球外汇二元期权教父Abe(Abraham COFNAS)对二元期权以及基本面进行了讲解。', '<p>\r\n	富瑞登交易学院在厦门召开为期2天的培训课程，主讲老师是来自富瑞登特聘华尔街专家Abraham COFNAS和全球交易商运营专家叶汇陶老师，为厦门的交易者们带来了一次难忘的课程体验。 &nbsp; &nbsp;全球外汇二元期权教父Abe(Abraham COFNAS)对二元期权以及基本面进行了讲解。如何运用市场情绪来做交易，还讲解了如何看着股指期货的图表交易货币来获得利润，学员都深深的被基本面分析技术所吸引，互动环节中，结合自己原有的技术分析方法与Abe老师就目前欧元行情做出了激烈的讨论，而在第二天的课程里，Abe开始现场边授课边交易下单，将理论与实践结合，同学们群情激昂，兴致勃勃，学习的热情升至高点！ &nbsp;晚间的百炼成钻经纪商高级课程，由来自富瑞登的叶汇陶老师倾情奉献，叶老师向在座交易代理商介绍了如何构建一家世界级的金融服务公司以及面对当下互联网浪潮中的经济商营销策略。从生金融经纪业务的道与术全方面讲述、探讨了业务发展中的各种问题和解决方案。&rdquo;</p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214131349309066.png\" /></p>\r\n<p>\r\n	复旦大学证券研究所主办的&ldquo;走进华尔街系列讲座---华尔街交易员养成记&rdquo;的公开课在复旦大学美国研究中心圆满举行。外汇、期货、银行、证券等行业的近150位专业人士汇聚一堂，共同参加了这次由Abe Cofnas主讲的课程。 课上Abe生动的讲述了&ldquo;什么是职业交易员&rdquo;&nbsp;、&ldquo;除了交易投资以外你还需要哪些技能&rdquo;、&ldquo;衡量交易员的关键指标&rdquo;、&ldquo;交易基本面和技术面&rdquo;等，并为大家讲解如何规避市场风险。Abe认为，作为一个外汇交易的初学者，一开始的目标不应该是追求巨大盈利，能够取得盈亏平衡才是成为职业交易员的第一步。Abe认为，在外汇交易中不仅需要拥有专业知识，还需要良好的交易心态。课程的最后，一位操盘3000万人民币的专业交易员向Mr. Abaham COFNAS提出自己的疑惑，这位交易员已经操盘4年已久，并获得了持续稳定的收益，但是却非常地惧怕下一次交易的风险。Mr. Abaham COFNAS对此作出了认真的回答，强调一个称职的交易员必须具备良好的交易心态，才能在这个行业中长足发展。 这次精彩的演讲讲述了Abe作为华尔街专业交易员的成长道路，分享了经验和干货，听者们受益匪浅，并期待下一场主题公开课。</p>\r\n', '2017-02/20170214131619919423_zh-cn.png', '', '2017-02/20170214131349309066.png', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(184, 0, '107', 20, '金秋十月活动', '', '', '', '', '', '', '', '02/01/2017', '', 'Ruizean Trader', '金秋十月，云淡风轻。在这收获的季节，浦发银行在上海举行了——首批“金种子”第一阶段现场集训。', '<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132249483214.png\" /></p>\r\n<p>\r\n	金秋十月，云淡风轻。在这收获的季节，浦发银行在上海举行了&mdash;&mdash;首批&ldquo;金种子&rdquo;第一阶段现场集训。富瑞登金融学院创始人叶汇陶老师，被邀请为来自全国十五分行的产品经理和理财经理，进行针对性的银行三方业务营销策略与银行贵金属量化交易。叶汇陶老师讲课时精神饱满，精简、干练的语言阐述了最实用的道理。为了让培训人员深刻理解这一主题，他还通过精心准备的两套金钱游戏，供大家参与体会交易系统的胜率KPI，引起了大家的极大兴趣。课程中，叶老师还展示了其创立的顶尖交易员专业训练十大模块，为理财经理演示了如何通过专业训练服务，来帮助客户提升专业水平进而成为优质稳健的交易客户。培训会结束后，大家都表示，这样的培训让人铭记在心，体会颇多，收获更多，仅仅一天的课程，丰富的培训内容，主题明确，内容充实，形式却多种多样。期待下一次的课程。</p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132319318111.png\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"/ruizeanTrader/data/upload/2017-02/20170214132332174142.png\" /></p>\r\n', '2017-02/20170214132641295902_zh-cn.png', '', '2017-02/20170214132249483214.png,2017-02/20170214132319318111.png,2017-02/20170214132332174142.png', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(185, 0, '107', 30, 'Ruizean Trader与您一起成长共同发展', '', '', '', '', '', '', '', '01/31/2017', '', 'Ruizean Trader', '我们将带领广大交易者们，一起参与各大外汇盛事，更多地了解外汇市场，一起成长共同发展', '<p>\r\n	&quot;金融业瞬息万变，要一直紧贴其中发展殊不容易，iFX EXPO旨在填补这个缺口，通过有业内专家参与的主题会议及工作坊，分享金融知识及诀窍。在为期两天的展会期间，来自中国本土与海外的参展商各展风采，共同上演了一场精彩绝伦的外汇盛宴。据主办方统计，本次展会有超过2500名与会者出席，参展人数激增展馆规模全面升级，可谓盛况空前。大会目的是提供机会，促进服务供应商及外汇从业员相互间的业务增长，不仅协助从业员透过市场推广、平台及服务供应商认识最新业界趋势，更让他们与业内人士结识交流，从中引介经纪。</p>\r\n<p>\r\n	<img alt=\"\" height=\"600\" src=\"/ruizeanTrader/data/upload/2017-03/20170309060658121663.jpg\" width=\"800\" /></p>\r\n<p>\r\n	2017年一届，将有80多家参展商及赞助商参加，预计出席者将超过2,500人。题材方面，将包括当今交易场所最热门的技术趋势、英国脱欧对欧洲和亚洲影响的深入了解、中国外汇经纪要面对的挑战和机遇、手机技术如何影响外汇交易，以及有关亚洲商品交易前景的各种不同见解。 </p>\r\n<p>\r\n	<img alt=\"\" height=\"533\" src=\"/ruizeanTrader/data/upload/2017-03/20170309060729135109.jpg\" width=\"400\" /></p>\r\n<p>\r\n	Ruizean Trader作为代表澳大利亚的活跃劵商，我们将带领广大交易者们，一起参与各大外汇盛事，更多地了解外汇市场，一起成长共同发展。</p>\r\n<p>\r\n	<img alt=\"\" height=\"533\" src=\"/ruizeanTrader/data/upload/2017-03/20170309060756286572.jpg\" width=\"400\" /></p>\r\n<p>\r\n	<img alt=\"\" height=\"533\" src=\"/ruizeanTrader/data/upload/2017-03/20170309060822225231.jpg\" width=\"400\" /></p>', '2017-03/20170309060447239041.jpg', '', '2017-03/20170309060658121663.jpg,2017-03/20170309060729135109.jpg,2017-03/20170309060756286572.jpg,2017-03/20170309060822225231.jpg', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1489010927, '', '', 'zh-cn'),
(187, 0, '107', 50, '近期活动', '', '', '', '', '', '', '', '02/01/2017', '', 'Ruizean Trader', 'Ruizean Trader作为活跃在澳大利亚的外汇交易商，我们一直致力与与客户共同发展与成长。', '<p>\r\n	近期活动: </p>\r\n<p>\r\n	Ruizean Trader作为活跃在澳大利亚的外汇交易商，我们一直致力与与客户共同发展与成长。 我们拥有和客户互利互惠的成熟运营模式，也有为客户提供学习外汇的机会. 除了专业的客户经理维护，资深的分析师提供行情解析，我们也为客户精心的准备了线下的交流会，互相分享成功交易的经验，市场的各种趣闻与知识等等。 </p>\r\n<p>\r\n	敬请各位期待我们下次的交流会内容，感谢万分。</p>\r\n', '2017-02/20170207123116825455_zh-cn.jpg', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 2, 1489010763, '', '', 'zh-cn'),
(193, 0, '111', 10, '关于数据库优化', '', '', '', '', '', '', '', '02/14/2017', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', 'http://www.google.com.au', 'zh-cn'),
(194, 0, '111', 20, '顶部数据库优化2', '', '', '', '', '', '', '', '02/08/2017', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', 'http://www.google.com.au', 'zh-cn'),
(195, 0, '113', 10, '监管牌照', '', '', '', '', '', '', '', '02/16/2017', '', '', '', '<p>\r\n	Ruizean Trader是总部位于澳洲悉尼的外汇经纪商，我们经澳大利亚证券和投资委员会（ASIC）的监管 （ABN 600 177 473，AFS Licence No. 0000000）。澳大利亚证券和投资委员会（ASIC）是澳大利亚银行、证券、外汇零售行业的监管者。随着2001年澳大利亚《证券投资委员会法案》的出台，ASIC从此把零售外汇交易市场纳入日常监管范围，与银行、证券、保险等金融行业一同监管，成为了澳大利亚国家金融体系的重要组成部分。ASIC的基本职能体现在维护市场诚信和保护消费者权益方面。ASIC完善的金融监管体系和严格的执行力度，受到了各国投资者和监管同行的一致认可，一直以来都被公认为世界上最严格、最健全、最能保护投资者权益的金融监管体系之一。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Ruizean Trader一贯遵守监管部门的法律法规，公司遵守严格的标准，包括资本充足要求。定期向监管部门提供财务报表，严格监管和标准化管理，多年来我们保持无瑕记录，并承诺向客户提供透明、公正和迅捷的交易服务。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	根据澳大利亚证券和投资委员会（ASIC）的监管要求，所有我们客户的资金都独立存放在澳洲顶级银行的信托账户中，绝不与Ruizean Trader的公司资金结合在一起。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	为了符合我们的所有监管的义务，我们为客户提供可下载的文件参阅，我们的金融服务指南，产品披露书和客户条规条款。我们强烈建议所有的客户下载并且阅读这些文件，确保他们完全明白外汇交易和差价合约交易的本质，并熟知客户在交易中的的权利和义务。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1489651044, '', '', 'zh-cn'),
(196, 0, '113', 20, '交易学院介绍', '', '', '', '', '', '', '', '02/16/2017', '', '', '', '<p>\r\n	RuizeanTrader官方合作伙伴富瑞登金融交易学院介绍</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Ruizean Trader携手富瑞登金融交易学院共同为客户提供专业的教育培训</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	富瑞登交易学院是首家超过16年职业交易培训经验的高端金融教育机构，提供在线交易培训累计时长超过3000小时，累计培养输送超过万名学员从事专业交易工作，开创行业先河，采用扎实知识讲解+交易账户实操+岗位从业指导，对学员进行知识加实战式的系统培训，结业时相当于2到3年工作经验，将具有全面的贵金属交易专业知识、实战交易经验。作为国内最大的职业交易培训机构，已与多个国内外知名对冲基金建立合伙人制度合作，优秀学员推荐参加国内最大的金融交易实战比赛或加入海外对冲基金交易团队。遵循规范的国际化交易培训准则，交易培训体系适合中国金融交易市场、国际金融交易市场，相当于掌握国内、国际通用交易准则，从事个人交易或机构交易都能轻松应对。</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(197, 0, '114', 10, '名师宝典', '', '', '', '', '', '', '', '02/16/2017', '', '', '', '<p>\r\n	书籍《外汇交易教程》</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(198, 0, '114', 20, 'Abraham COFNAS 介绍', '', '', '', '', '', '', '', '02/16/2017', '', '', '', '<p>\r\n	三十年职业生涯，世界级二元期权专家，北美衍生品交易所技术顾问，衍生品交易权威杂志《Futures Magazine》首位专栏评论员，定期为全球顶尖财经频道CNBC提供市场分析。曾先后就任Strategic Commodity公司交易部门总监和全美最大零售股票经纪公司之一Dean Witter总裁。由其组建的自营基金团队长期在全球金融市场进行外汇、证券、债券、期货和期权间的跨品种交易。</p>\r\n<p>\r\n	书籍《交易密码》</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(199, 0, '114', 40, '叶汇陶介绍', '', '', '', '', '', '', '', '02/16/2017', '', '', '', '<p>\r\n	10年外汇交易实战经验，12年金融行业创业和高管经验，6年机构交易员团队组建和训练经验。曾先后担任英国艾福瑞中国区首任首席代表、东航金融外汇业务创始人和负责人，期间共培养来自全国3000多家投资公司职业经理人和交易员团队，并为海外总公司组建和培养了自营交易员团队。</p>\r\n<p>\r\n	太极咏春交易系统（交易信号提醒器）</p>\r\n<p>\r\n	太极咏春交易系统手机版，pc版</p>\r\n<p>\r\n	太极咏春交易系统使用说明</p>\r\n<p>\r\n	交易法宝</p>\r\n<p>\r\n	1，精华文章</p>\r\n<p>\r\n	2，太极咏春教程</p>\r\n<p>\r\n	3，太极咏春组合拳移动系统</p>\r\n', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 1, 1488354395, 1, 1488354395, '', '', 'zh-cn'),
(200, 0, '110103', 120, 'What do I do if I see the message ‘trade context is busy’?', '', '', NULL, NULL, NULL, NULL, NULL, '03/06/2017', NULL, NULL, NULL, '<p>\r\n	When trading in MetaTrader 4 (MT4) and the &lsquo;Trade Context is Busy&rsquo; message appears, it generally means that it is trying to process two orders at the same time.&nbsp;To resolve this issue, simply close and reload your MT4 trading platform.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1488772619, 2, 1488772619, NULL, NULL, 'en'),
(201, 0, '110103', 130, 'Can I open multiple MT4 trading accounts?', '', '', NULL, NULL, NULL, NULL, NULL, '03/06/2017', NULL, NULL, NULL, '<p>\r\n	If you are an existing client and wish to create an additional MT4 account login, please complete the form on our request an additional MT4 login&nbsp;page.&nbsp;We allow for a maximum of 5 logins per client.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1488772633, 2, 1488772633, NULL, NULL, 'en');
INSERT INTO `cc_info` (`id`, `companyId`, `classId`, `ordinal`, `title`, `subTitle`, `titleStyle`, `alias`, `url`, `pageTitle`, `keywords`, `description`, `publishedDate`, `source`, `author`, `intro`, `content`, `imageUrl`, `bigImageUrl`, `images`, `files`, `filename`, `isApproved`, `isTop`, `isHot`, `isRecommended`, `hits`, `downloadCount`, `createdUserId`, `createdDate`, `lastModifiedUserId`, `lastModifiedDate`, `extend`, `sourceHtml`, `lang`) VALUES
(202, 0, '110103', 140, 'Can I download another Ruizean Trader MT4 platform?', '', '', NULL, NULL, NULL, NULL, NULL, '03/06/2017', NULL, NULL, NULL, '<p>\r\n	If you require another Ruizean Trader MT4 platform for another computer, simply&nbsp;contact us&nbsp;and we will email you another MT4 installation file for you to use on as many different computers as you please.</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 1488772646, 2, 1488772646, NULL, NULL, 'en'),
(203, 0, '106101', 120, '02月22日 主要数据及事件一览', '', '', NULL, NULL, '02月22日 主要数据及事件一览', '', '', '02/22/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下：', '<p>\r\n	日内主要经济数据及事件如下： </p>\r\n<p>\r\n	17:30PM 英国第四季度GDP年率修正值 前值2.2% 市场预测2.2% 结果2% </p>\r\n<p>\r\n	18:00PM 欧元区1月消费者物价指数年率终值 前值1.8% 市场预测1.8% 结果1.8%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488795990, 2, 1488797187, NULL, NULL, 'zh-cn'),
(204, 0, '106101', 110, '02月23日 主要数据及事件一览', '', '', NULL, NULL, '02月23日 主要数据及事件一览', '', '', '02/23/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下：', '<p>\r\n	日内主要经济数据及事件如下： </p>\r\n<p>\r\n	15:00PM 德国第四季度GDP年率终值（未季调） 前值1.2% 市场预测1.2% 结果1.2%</p>\r\n<p>\r\n	21:30PM 美国上周续请失业金人数 前值207.6万 市场预测206.5万 结果206万</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488796022, 2, 1488797204, NULL, NULL, 'zh-cn'),
(205, 0, '106101', 100, '02月24日 主要数据及事件一览', '', '', NULL, NULL, '02月24日 主要数据及事件一览', '', '', '02/24/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下： ', '<p>\r\n	日内主要经济数据及事件如下： </p>\r\n<p>\r\n	06:30AM 澳洲联储主席洛威出席国会作证词 </p>\r\n<p>\r\n	00:00AM 美国上周EIA原油库存变化 前值952.7万 市场预测350万 结果56.4万</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488796054, 2, 1488797217, NULL, NULL, 'zh-cn'),
(206, 0, '106101', 90, '02月28日 主要数据及事件一览', '', '', NULL, NULL, '02月28日 主要数据及事件一览', '', '', '02/28/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下：', '<p>\r\n	日内主要经济数据及事件如下： </p>\r\n<p>\r\n	21:30PM 美国1月商品贸易帐 前值-650亿 市场预测-660亿 结果-692亿 </p>\r\n<p>\r\n	21:30PM 美国第四季度GDP年化季率修正值 前值1.9% 市场预测2.1% 结果1.9%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488796092, 2, 1488797229, NULL, NULL, 'zh-cn'),
(207, 0, '106101', 80, '03月1日 主要数据及事件一览', '', '', NULL, NULL, '03月1日 主要数据及事件一览', '', '', '03/01/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下：', '<p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph;\r\nbackground:white\">\r\n	<span microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\r\n\">日内主要经济数据及事件如下：</span><span microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;mso-fareast-font-family:\r\n\"> <span lang=\"EN-AU\"><o:p></o:p></span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph;\r\nbackground:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;\r\nfont-family:Arial;mso-fareast-font-family:\">10:00AM<span style=\"mso-tab-count:1\">&nbsp; </span></span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">美国总统特朗普到国会进行发言</span><span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\"><o:p></o:p></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph;\r\nbackground:white\">\r\n	<span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;\r\nfont-family:Arial;mso-fareast-font-family:\">23:00PM<span style=\"mso-tab-count:1\">&nbsp; </span></span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">加央行公布利率决议；央行行长波洛兹出席新闻发布会</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\"><span style=\"mso-tab-count:2\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span lang=\"EN-US\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;mso-fareast-font-family:\r\n\"><o:p></o:p></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align:justify;text-justify:inter-ideograph;\r\nbackground:white\">\r\n	<span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;\r\nfont-family:Arial;mso-fareast-font-family:\">05:30AM<span style=\"mso-tab-count:1\">&nbsp; </span></span><span microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:\">美国上周</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">API</span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">原油库存变化</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\"><span style=\"mso-spacerun:yes\">&nbsp;&nbsp;&nbsp; </span></span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">前值</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\">-88.4</span><span microsoft=\"\" mso-hansi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;\r\nfont-family:\">万桶</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;mso-fareast-font-family:\r\n\"><span style=\"mso-tab-count:1\">&nbsp; </span><span style=\"mso-spacerun:yes\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:\">市场预测</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">285</span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">万桶</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\"><span style=\"mso-tab-count:1\">&nbsp;&nbsp; </span></span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">结果</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\">250.2</span><span microsoft=\"\" mso-hansi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;\r\nfont-family:\">万桶</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;mso-fareast-font-family:\r\n\"><o:p></o:p></span></p>\r\n<p>\r\n<!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Revision>0</o:Revision>\r\n  <o:TotalTime>0</o:TotalTime>\r\n  <o:Pages>1</o:Pages>\r\n  <o:Words>28</o:Words>\r\n  <o:Characters>164</o:Characters>\r\n  <o:Company>Monash</o:Company>\r\n  <o:Lines>1</o:Lines>\r\n  <o:Paragraphs>1</o:Paragraphs>\r\n  <o:CharactersWithSpaces>191</o:CharactersWithSpaces>\r\n  <o:Version>14.0</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:DrawingGridVerticalSpacing>10 pt</w:DrawingGridVerticalSpacing>\r\n  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>\r\n  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-AU</w:LidThemeOther>\r\n  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:SpaceForUL/>\r\n   <w:BalanceSingleByteDoubleByteWidth/>\r\n   <w:DoNotLeaveBackslashAlone/>\r\n   <w:ULTrailSpace/>\r\n   <w:DoNotExpandShiftReturn/>\r\n   <w:AdjustLineHeightInTable/>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n   <w:UseFELayout/>\r\n  </w:Compatibility>\r\n  <w:NoLineBreaksAfter Lang=\"JA\">$([{£¥·‘“〈《「『【〔〖〝﹙﹛﹝＄（．［｛￡￥</w:NoLineBreaksAfter>\r\n  <w:NoLineBreaksBefore Lang=\"JA\">!%),.:;>?]}¢¨°·ˇˉ―‖’”…‰′″›℃∶、。〃〉》」』】〕〗〞︶︺︾﹀﹄﹚﹜﹞！＂％＇），．：；？］｀｜｝～￠</w:NoLineBreaksBefore>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\r\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"276\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]-->	<style>\r\n<!--{cke_protected}%3C!%2D%2D%7Bcke_protected%7D%253C!%252D%252D%250A%2520%252F*%2520Font%2520Definitions%2520*%252F%250A%2540font-face%250A%2509%257Bfont-family%253AArial%253B%250A%2509panose-1%253A2%252011%25206%25204%25202%25202%25202%25202%25202%25204%253B%250A%2509mso-font-charset%253A0%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A10887%2520-2147483648%25208%25200%2520511%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253A%25E5%25AE%258B%25E4%25BD%2593%253B%250A%2509panose-1%253A2%25201%25206%25200%25203%25201%25201%25201%25201%25201%253B%250A%2509mso-font-charset%253A80%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A3%2520680460288%252022%25200%2520262145%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253A%2522Cambria%2520Math%2522%253B%250A%2509panose-1%253A2%25204%25205%25203%25205%25204%25206%25203%25202%25204%253B%250A%2509mso-font-charset%253A0%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A-1610611985%25201107304683%25200%25200%2520159%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253A%2522%255C%2540%25E5%25AE%258B%25E4%25BD%2593%2522%253B%250A%2509panose-1%253A2%25201%25206%25200%25203%25201%25201%25201%25201%25201%253B%250A%2509mso-font-charset%253A80%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A3%2520680460288%252022%25200%2520262145%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253ACalibri%253B%250A%2509panose-1%253A2%252015%25205%25202%25202%25202%25204%25203%25202%25204%253B%250A%2509mso-font-charset%253A0%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A-1610611985%25201073750139%25200%25200%2520159%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253A%2522Microsoft%2520YaHei%2522%253B%250A%2509panose-1%253A2%252011%25205%25203%25202%25202%25204%25202%25202%25204%253B%250A%2509mso-font-charset%253A80%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A-2147483001%2520705641554%252022%25200%2520262175%25200%253B%257D%250A%2540font-face%250A%2509%257Bfont-family%253A%2522%255C%2540Microsoft%2520YaHei%2522%253B%250A%2509panose-1%253A2%252011%25205%25203%25202%25202%25204%25202%25202%25204%253B%250A%2509mso-font-charset%253A80%253B%250A%2509mso-generic-font-family%253Aauto%253B%250A%2509mso-font-pitch%253Avariable%253B%250A%2509mso-font-signature%253A-2147483001%2520705641554%252022%25200%2520262175%25200%253B%257D%250A%2520%252F*%2520Style%2520Definitions%2520*%252F%250Ap.MsoNormal%252C%2520li.MsoNormal%252C%2520div.MsoNormal%250A%2509%257Bmso-style-unhide%253Ano%253B%250A%2509mso-style-qformat%253Ayes%253B%250A%2509mso-style-parent%253A%2522%2522%253B%250A%2509margin-top%253A0cm%253B%250A%2509margin-right%253A0cm%253B%250A%2509margin-bottom%253A8.0pt%253B%250A%2509margin-left%253A0cm%253B%250A%2509line-height%253A107%2525%253B%250A%2509mso-pagination%253Awidow-orphan%253B%250A%2509font-size%253A11.0pt%253B%250A%2509font-family%253ACalibri%253B%250A%2509mso-ascii-font-family%253ACalibri%253B%250A%2509mso-ascii-theme-font%253Aminor-latin%253B%250A%2509mso-fareast-font-family%253A%25E5%25AE%258B%25E4%25BD%2593%253B%250A%2509mso-fareast-theme-font%253Aminor-fareast%253B%250A%2509mso-hansi-font-family%253ACalibri%253B%250A%2509mso-hansi-theme-font%253Aminor-latin%253B%250A%2509mso-bidi-font-family%253A%2522Times%2520New%2520Roman%2522%253B%250A%2509mso-bidi-theme-font%253Aminor-bidi%253B%250A%2509mso-ansi-language%253AEN-AU%253B%257D%250A.MsoChpDefault%250A%2509%257Bmso-style-type%253Aexport-only%253B%250A%2509mso-default-props%253Ayes%253B%250A%2509font-size%253A11.0pt%253B%250A%2509mso-ansi-font-size%253A11.0pt%253B%250A%2509mso-bidi-font-size%253A11.0pt%253B%250A%2509font-family%253ACalibri%253B%250A%2509mso-bidi-font-family%253A%2522Times%2520New%2520Roman%2522%253B%250A%2509mso-bidi-theme-font%253Aminor-bidi%253B%250A%2509mso-font-kerning%253A0pt%253B%250A%2509mso-ansi-language%253AEN-AU%253B%257D%250A.MsoPapDefault%250A%2509%257Bmso-style-type%253Aexport-only%253B%250A%2509margin-bottom%253A8.0pt%253B%250A%2509line-height%253A107%2525%253B%257D%250A%2520%252F*%2520Page%2520Definitions%2520*%252F%250A%2540page%250A%2509%257Bmso-page-border-surround-header%253Ano%253B%250A%2509mso-page-border-surround-footer%253Ano%253B%257D%250A%2540page%2520WordSection1%250A%2509%257Bsize%253A612.0pt%2520792.0pt%253B%250A%2509margin%253A72.0pt%252090.0pt%252072.0pt%252090.0pt%253B%250A%2509mso-header-margin%253A36.0pt%253B%250A%2509mso-footer-margin%253A36.0pt%253B%250A%2509mso-paper-source%253A0%253B%257D%250Adiv.WordSection1%250A%2509%257Bpage%253AWordSection1%253B%257D%250A%252D%252D%253E%2D%2D%3E-->\r\n</style> <!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\ntable.MsoNormalTable\r\n	{mso-style-name:普通表格;\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:Calibri;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-ansi-language:EN-AU;}\r\n</style>\r\n<![endif]--><!--StartFragment--><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">08:30AM&nbsp; </span><span microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:\">澳大利亚第四季度</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">GDP</span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">年率</span><span lang=\"EN-AU\" microsoft=\"\" mso-bidi-language:=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\">&nbsp; </span><span microsoft=\"\" mso-ascii-font-family:=\"\" style=\"font-size:\r\n9.0pt;line-height:107%;font-family:\">前值</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">1.8%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</span><span microsoft=\"\" mso-bidi-font-family:=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:\">市场预测</span><span lang=\"EN-AU\" microsoft=\"\" mso-bidi-language:=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:Arial;mso-fareast-font-family:\">1.9%&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </span><span microsoft=\"\" style=\"font-size:9.0pt;\r\nline-height:107%;font-family:\">结果</span><span lang=\"EN-AU\" microsoft=\"\" style=\"font-size:9.0pt;line-height:107%;font-family:Arial;\r\nmso-fareast-font-family:\">2.4%</span><!--EndFragment--></p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488796146, 2, 1488797238, NULL, NULL, 'zh-cn'),
(208, 0, '106101', 70, '03月2日 主要数据及事件一览', '', '', NULL, NULL, '03月2日 主要数据及事件一览', '', '', '03/02/2017', NULL, 'RuizeanTrader', '日内主要经济数据及事件如下： ', '<p>\r\n	日内主要经济数据及事件如下：</p>\r\n<p>\r\n	14:45PM 瑞士第四季度GDP年率 前值1.3% 市场预测1.3% 结果0.6% </p>\r\n<p>\r\n	18:00PM 欧元区2月消费者物价指数年率初值 前值1.8% 市场预测1.9% 结果2.0% </p>\r\n<p>\r\n	21:30PM 加拿大12月GDP年率 前值1.6% 市场预测1.7% 结果2.0% </p>\r\n<p>\r\n	21:30PM 加拿大第四季度GDP年化季率 前值3.5% 市场预测2.0% 结果2.6%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488796177, 2, 1488797258, NULL, NULL, 'zh-cn'),
(209, 0, '106101', 70, '22nd Feb Main data and events at a glance', '', '', NULL, NULL, '22nd Feb Main data and events at a glance', '', '', '02/22/2017', NULL, 'RuizeanTrader', '20:30PM	GBP Gross Domestic Product (YoY) (4Q P)', '<p>\r\n	20:30PM GBP Gross Domestic Product (YoY) (4Q P) Actual 2.0% Forecast 2.2% Previous 2.2% </p>\r\n<p>\r\n	21:00PM EUR Euro-Zone Consumer Price Index (MoM) (JAN) Actual -0.8% Forecast -0.8% Previous 0.5%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798398, 2, 1488798866, NULL, NULL, 'en'),
(210, 0, '106101', 80, '23rd Feb Main data and events at a glance', '', '', NULL, NULL, '23rd Feb Main data and events at a glance', '', '', '02/23/2017', NULL, 'RuizeanTrader', '06:00AM	USD FOMC Meeting Minutes (FEB 01)', '<p>\r\n	06:00AM USD FOMC Meeting Minutes (FEB 01) </p>\r\n<p>\r\n	18:00PM EUR German Gross Domestic Product n.s.a. (YoY) (4Q F) Actual 1.2% Forecast 1.2% Previous 1.2%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798426, 2, 1488798836, NULL, NULL, 'en'),
(211, 0, '106101', 90, '24th Feb Main data and events at a glance', '', '', NULL, NULL, '24th Feb Main data and events at a glance', '', '', '02/24/2017', NULL, 'RuizeanTrader', '', '<p>\r\n	09:30AM AUD RBA&#39;s Lowe Testimony to Parliament Committee </p>\r\n<p>\r\n	03:00AM USD DOE U.S. Crude Oil Inventories (FEB 17) Actual 564K Forecast 3385K Previous 9527K </p>\r\n<p>\r\n	20:30PM GBP BBA Loans for House Purchase (JAN) Actual 44657 Forecast 42600 Previous 43581</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798453, 2, 1488798852, NULL, NULL, 'en'),
(212, 0, '106101', 100, '28th Feb Main data and events at a glance', '', '', NULL, NULL, '28th Feb Main data and events at a glance', '', '', '02/28/2017', NULL, 'RuizeanTrader', '00:30AM	USD Durable Goods Orders (JAN P)', '<p>\r\n	00:30AM USD Durable Goods Orders (JAN P) Actual 1.8% Forecast 1.6% Previous -0.5% </p>\r\n<p>\r\n	10:50AM JPY Retail Trade (YoY) (JAN) Actual 1.0% Forecast 1.0% Previous 0.6%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798491, 2, 1488798823, NULL, NULL, 'en'),
(213, 0, '106101', 110, '1st March Main data and events at a glance', '', '', NULL, NULL, '1st March Main data and events at a glance', '', '', '03/01/2017', NULL, 'RuizeanTrader', '', '<p>\r\n	01:00PM USD President Trump Addresses Joint Congress 02:00AM CAD Bank of Canada Rate Decision (MAR 01) </p>\r\n<p>\r\n	11:30AM AUD Gross Domestic Product Actual 1.1% Forecast 2.0% Previous 1.9% </p>\r\n<p>\r\n	19:55PM EUR German Unemployment Rate Feb Actual 5.9% Forecast 5.9% Previous 5.9%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798542, 2, 1488798811, NULL, NULL, 'en'),
(214, 0, '106101', 120, '2nd  March Main data and events at a glance', '', '', NULL, NULL, '2nd  March Main data and events at a glance', '', '', '03/02/2017', NULL, 'RuizeanTrader', '', '<p>\r\n	17:45PM CHF Gross Domestic Product (YoY) (4Q) Actual 0.6% Forecast 1.3% Previous 1.4% </p>\r\n<p>\r\n	21:00PM EUR Euro-Zone Consumer Price Index Estimate (YoY) (FEB) Actual 2.0% Forecast 2.0% Previous 1.8% </p>\r\n<p>\r\n	00:30AM CAD Gross Domestic Product (YoY) (DEC) Actual 2.0% Forecast 1.7% Previous 1.9% </p>\r\n<p>\r\n	00:30AM CAD Quarterly Gross Domestic Product Annualized (4Q) Actual 2.0% Forecast 1.7% Previous 1.9%</p>\r\n', NULL, NULL, '', NULL, NULL, 1, 0, 0, 1, 0, 0, 2, 1488798570, 2, 1488798797, NULL, NULL, 'en'),
(215, 0, '112', 10, 'Account Terms', '', '', NULL, NULL, NULL, NULL, NULL, '10/17/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171017130342375542.pdf', 'Ruizean Trader Account Terms.pdf', 1, 0, 0, 0, 0, 0, 2, 1508205822, 2, 1508205822, NULL, NULL, 'en'),
(216, 0, '112', 20, 'Complaints Procedure', '', '', NULL, NULL, NULL, NULL, NULL, '10/17/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171017130408154931.pdf', 'Ruizean Trader Complaints Procedure.pdf', 1, 0, 0, 0, 0, 0, 2, 1508205848, 2, 1508205848, NULL, NULL, 'en'),
(217, 0, '112', 30, 'Privacy Policy', '', '', NULL, NULL, NULL, NULL, NULL, '10/17/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171017130423186201.pdf', 'Ruizean Trader Privacy Policy.pdf', 1, 0, 0, 0, 0, 0, 2, 1508205863, 2, 1508205863, NULL, NULL, 'en'),
(218, 0, '112', 40, 'Website Terms of Use', '', '', NULL, NULL, NULL, NULL, NULL, '10/17/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171017130439949404.pdf', 'Ruizean Trader Website Terms of Use.pdf', 1, 0, 0, 0, 0, 0, 2, 1508205879, 2, 1508205879, NULL, NULL, 'en'),
(219, 0, '112', 50, 'Wholesale Client Eligible Test', '', '', NULL, NULL, NULL, NULL, NULL, '10/18/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171018135808774502.pdf', 'Ruizean Trader Wholesale Client Eligible Test.pdf', 1, 0, 0, 0, 0, 0, 2, 1508295488, 2, 1508295488, NULL, NULL, 'en'),
(220, 0, '112', 10, '帐户条款', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020102607204621.pdf', 'Ruizean Trader Account Terms.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455567, 2, 1508455567, NULL, NULL, 'zh-cn'),
(221, 0, '112', 20, '隐私政策', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020102649210136.pdf', 'Ruizean Trader Privacy Policy.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455609, 2, 1508455609, NULL, NULL, 'zh-cn'),
(222, 0, '112', 30, '争议解决', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020102703179456.pdf', 'Ruizean Trader Complaints Procedure.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455623, 2, 1508455623, NULL, NULL, 'zh-cn'),
(223, 0, '112', 40, '网站条款', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020102716534436.pdf', 'Ruizean Trader Website Terms of Use.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455636, 2, 1508455636, NULL, NULL, 'zh-cn'),
(224, 0, '112', 50, '产品时间表', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020102812546031.pdf', 'Ruizean Trader Product Schedule.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455692, 2, 1508455692, NULL, NULL, 'zh-cn'),
(225, 0, '112', 60, 'Product Schedule', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020103158737029.pdf', 'Ruizean Trader Product Schedule.pdf', 1, 0, 0, 0, 0, 0, 2, 1508455918, 2, 1508455918, NULL, NULL, 'en'),
(226, 0, '112', 60, '机构资格测试表', '', '', NULL, NULL, NULL, NULL, NULL, '10/20/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171020154639875125.pdf', 'Wholesale Eligibility Test.pdf', 1, 0, 0, 0, 0, 0, 2, 1508474799, 2, 1509341097, NULL, NULL, 'zh-cn'),
(227, 0, '112', 70, 'Client Complaint Form', '', '', NULL, NULL, NULL, NULL, NULL, '10/30/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171030154941212021.pdf', 'Ruizean Trader_Client_Complaint_Form.pdf', 1, 0, 0, 0, 0, 0, 2, 1509338981, 2, 1509338981, NULL, NULL, 'en'),
(228, 0, '112', 70, '客户投诉表', '', '', NULL, NULL, NULL, NULL, NULL, '10/30/2017', NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10/20171030155300969291.pdf', 'Ruizean Trader_Client_Complaint_Form.pdf', 1, 0, 0, 0, 0, 0, 2, 1509339180, 2, 1509341104, NULL, NULL, 'zh-cn');

-- --------------------------------------------------------

--
-- Table structure for table `cc_infoclass`
--

CREATE TABLE `cc_infoclass` (
  `id` varchar(200) NOT NULL,
  `companyId` int(11) NOT NULL DEFAULT '0',
  `ordinal` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `nameEn` varchar(200) NOT NULL,
  `alias` varchar(1000) DEFAULT NULL,
  `domain` int(1) DEFAULT '0',
  `classStyle` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pageTitle` varchar(100) DEFAULT NULL,
  `keywords` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `intro` text,
  `content` longtext,
  `imageUrl` varchar(100) DEFAULT NULL,
  `bigImageUrl` varchar(100) DEFAULT NULL,
  `files` text,
  `maxLayer` tinyint(4) NOT NULL DEFAULT '2',
  `perPageCount` int(4) NOT NULL DEFAULT '20',
  `defaultDisplayMode` tinyint(4) NOT NULL DEFAULT '2',
  `displayModes` varchar(100) NOT NULL,
  `extend` text,
  `info` text,
  `other` text,
  `template` varchar(50) DEFAULT NULL,
  `lang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息分类';

--
-- Dumping data for table `cc_infoclass`
--

INSERT INTO `cc_infoclass` (`id`, `companyId`, `ordinal`, `name`, `nameEn`, `alias`, `domain`, `classStyle`, `url`, `pageTitle`, `keywords`, `description`, `intro`, `content`, `imageUrl`, `bigImageUrl`, `files`, `maxLayer`, `perPageCount`, `defaultDisplayMode`, `displayModes`, `extend`, `info`, `other`, `template`, `lang`) VALUES
('101', 0, 10, 'HomePage product character value', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:9:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:6:\"hasHot\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:13:\"hasTitleStyle\";s:1:\"1\";s:11:\"hasImageUrl\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('102', 0, 20, 'accountType', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'N;', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('103', 0, 30, 'logo management', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:3:\"197\";s:14:\"infopic1height\";s:2:\"28\";s:13:\"infopic2width\";s:3:\"197\";s:14:\"infopic2height\";s:2:\"28\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('104', 0, 40, 'banner management', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:4:\"1900\";s:14:\"infopic1height\";s:3:\"727\";s:13:\"infopic2width\";s:4:\"1900\";s:14:\"infopic2height\";s:3:\"727\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('105', 0, 50, 'logo redirect', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:3:\"126\";s:14:\"infopic1height\";s:2:\"80\";s:13:\"infopic2width\";s:3:\"126\";s:14:\"infopic2height\";s:2:\"80\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('106', 0, 60, 'newslist', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'a:4:{i:0;a:3:{i:0;i:1;i:1;s:15:\"Graphic content\";i:2;b:1;}i:1;a:3:{i:0;i:2;i:1;s:9:\"News List\";i:2;b', 'a:5:{s:8:\"hasAlias\";b:1;s:14:\"hasDisplayMode\";b:1;s:12:\"hasPageTitle\";b:1;s:11:\"hasKeywords\";b:1;s:14:\"hasDescription\";b:1;}', 'a:9:{s:6:\"hasTop\";b:1;s:14:\"hasRecommended\";b:1;s:6:\"hasHot\";b:1;s:12:\"hasPageTitle\";b:1;s:11:\"hasKeywords\";b:1;s:14:\"hasDescription\";b:1;s:13:\"hasTitleStyle\";b:1;s:11:\"hasImageUrl\";b:1;s:10:\"hasContent\";b:1;}', 'N;', NULL, 'en'),
('106101', 0, 10, 'newslist without link', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:9:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:8:\"hasIntro\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('106102', 0, 20, 'newslist with link', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:8:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:13:\"hasSourceHtml\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('107', 0, 70, 'activity publish', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:5:{s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:11:\"hasImageUrl\";s:1:\"1\";s:8:\"hasIntro\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:3:\"350\";s:11:\"cpic1height\";s:3:\"180\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:3:\"350\";s:10:\"pic1height\";s:3:\"180\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('108', 0, 80, 'holiday trading time', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'a:4:{s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:8:\"hasFiles\";s:1:\"1\";}', 'a:1:{s:8:\"hasFiles\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('109', 0, 90, 'faq', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('110', 0, 100, 'help', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('110101', 0, 10, 'Ruizean Trader Company Questions', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'en'),
('110102', 0, 20, 'Ruizean Trader Forex Account Questions', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'en'),
('110103', 0, 30, 'MetaTrader 4 (MT4) Platform Questions', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'en'),
('111', 0, 110, 'edunotice', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:2:{s:14:\"hasPublishdate\";s:1:\"1\";s:13:\"hasSourceHtml\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('112', 0, 120, 'claim file', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:2:{s:11:\"hasSubTitle\";s:1:\"1\";s:8:\"hasFiles\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('113', 0, 130, 'page maintenance', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('114', 0, 140, 'Transaction book', '', '', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', NULL, 'en'),
('101', 0, 10, 'HomePage product character value', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:9:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:6:\"hasHot\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:13:\"hasTitleStyle\";s:1:\"1\";s:11:\"hasImageUrl\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('102', 0, 20, 'accountType', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'N;', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('103', 0, 30, 'logo management', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:3:\"197\";s:14:\"infopic1height\";s:2:\"28\";s:13:\"infopic2width\";s:3:\"197\";s:14:\"infopic2height\";s:2:\"28\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('104', 0, 40, 'banner management', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:4:\"1900\";s:14:\"infopic1height\";s:3:\"727\";s:13:\"infopic2width\";s:4:\"1900\";s:14:\"infopic2height\";s:3:\"727\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('105', 0, 50, 'logo redirect', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasInfoPic\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:3:\"126\";s:14:\"infopic1height\";s:2:\"80\";s:13:\"infopic2width\";s:3:\"126\";s:14:\"infopic2height\";s:2:\"80\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('106', 0, 60, 'newslist', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'a:4:{i:0;a:3:{i:0;i:1;i:1;s:15:\"Graphic content\";i:2;b:1;}i:1;a:3:{i:0;i:2;i:1;s:9:\"News List\";i:2;b', 'a:5:{s:8:\"hasAlias\";b:1;s:14:\"hasDisplayMode\";b:1;s:12:\"hasPageTitle\";b:1;s:11:\"hasKeywords\";b:1;s:14:\"hasDescription\";b:1;}', 'a:9:{s:6:\"hasTop\";b:1;s:14:\"hasRecommended\";b:1;s:6:\"hasHot\";b:1;s:12:\"hasPageTitle\";b:1;s:11:\"hasKeywords\";b:1;s:14:\"hasDescription\";b:1;s:13:\"hasTitleStyle\";b:1;s:11:\"hasImageUrl\";b:1;s:10:\"hasContent\";b:1;}', 'N;', '', 'zh-cn'),
('106101', 0, 10, 'newslist without link', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:9:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:8:\"hasIntro\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('106102', 0, 20, 'newslist with link', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:8:{s:6:\"hasTop\";s:1:\"1\";s:14:\"hasRecommended\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:13:\"hasSourceHtml\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('107', 0, 70, 'activity publish', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:5:{s:14:\"hasPublishdate\";s:1:\"1\";s:9:\"hasAuthor\";s:1:\"1\";s:11:\"hasImageUrl\";s:1:\"1\";s:8:\"hasIntro\";s:1:\"1\";s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:3:\"350\";s:11:\"cpic1height\";s:3:\"180\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:3:\"350\";s:10:\"pic1height\";s:3:\"180\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('108', 0, 80, 'holiday trading time', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'a:4:{s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:8:\"hasFiles\";s:1:\"1\";}', 'a:4:{s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";s:8:\"hasFiles\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('109', 0, 90, 'faq', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('110', 0, 100, 'help', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('110101', 0, 10, '关于Ruizean Trader', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'zh-cn'),
('110102', 0, 20, '关于交易账户', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'zh-cn'),
('110103', 0, 30, '关于MetaTrader 4（MT4）交易平台', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, '', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', 'list', 'zh-cn'),
('111', 0, 110, 'edunotice', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:2:{s:14:\"hasPublishdate\";s:1:\"1\";s:13:\"hasSourceHtml\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('112', 0, 120, 'claim file', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:2:{s:11:\"hasSubTitle\";s:1:\"1\";s:8:\"hasFiles\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('113', 0, 130, 'page maintenance', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'a:5:{s:14:\"hasDisplayMode\";s:1:\"1\";s:8:\"hasAlias\";s:1:\"1\";s:12:\"hasPageTitle\";s:1:\"1\";s:11:\"hasKeywords\";s:1:\"1\";s:14:\"hasDescription\";s:1:\"1\";}', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn'),
('114', 0, 140, 'Transaction book', '', '', 0, '', '', '', '', '', '', '', '', '', '', 2, 20, 2, 'N;', 'N;', 'a:1:{s:10:\"hasContent\";s:1:\"1\";}', 'a:13:{s:10:\"cpic1width\";s:0:\"\";s:11:\"cpic1height\";s:0:\"\";s:10:\"cpic2width\";s:0:\"\";s:11:\"cpic2height\";s:0:\"\";s:9:\"pic1width\";s:0:\"\";s:10:\"pic1height\";s:0:\"\";s:9:\"pic2width\";s:0:\"\";s:10:\"pic2height\";s:0:\"\";s:13:\"infopic1width\";s:0:\"\";s:14:\"infopic1height\";s:0:\"\";s:13:\"infopic2width\";s:0:\"\";s:14:\"infopic2height\";s:0:\"\";s:4:\"exts\";s:0:\"\";}', '', 'zh-cn');

-- --------------------------------------------------------

--
-- Table structure for table `cc_infopic`
--

CREATE TABLE `cc_infopic` (
  `id` int(11) NOT NULL,
  `sortnum` int(11) NOT NULL,
  `infoId` int(11) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `picname` varchar(200) NOT NULL,
  `smallpic` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息多图';

--
-- Dumping data for table `cc_infopic`
--

INSERT INTO `cc_infopic` (`id`, `sortnum`, `infoId`, `pic`, `picname`, `smallpic`) VALUES
(1, 10, 3, '2017-02/20170208065016181252.png', 'partner-01.png', '2017-02/20170208065016282211s.png'),
(2, 20, 3, '2017-02/20170208065016281413.png', 'partner-02.png', '2017-02/20170208065016241013s.png'),
(3, 30, 3, '2017-02/20170208065234205041.png', 'partner-03.png', '2017-02/20170208065234205041.png'),
(7, 40, 3, '2017-02/20170209075735105462.png', 'partner-04.png', '2017-02/20170209075735260121s.png'),
(8, 50, 3, '2017-02/20170209075735910416.png', 'partner-05.png', '2017-02/20170209075735270511s.png'),
(9, 60, 3, '2017-02/20170209075735249219.png', 'partner-06.png', '2017-02/20170209075735197271s.png'),
(16, 10, 5, '2017-02/20170209084417307812.jpg', 'banner.jpg', '2017-02/20170209084417311612s.jpg'),
(17, 20, 5, '2017-02/20170209084418137801.jpg', 'banner.jpg', '2017-02/20170209084418220171s.jpg'),
(18, 30, 5, '2017-02/20170209084418263782.jpg', 'banner.jpg', '2017-02/20170209084418209761s.jpg'),
(19, 0, 108, '2017-02/20170208065016181252_zh-cn.png', 'partner-01.png', '2017-02/20170208065016282211s_zh-cn.png'),
(20, 0, 108, '2017-02/20170208065016281413_zh-cn.png', 'partner-02.png', '2017-02/20170208065016241013s_zh-cn.png'),
(21, 0, 108, '2017-02/20170208065234205041_zh-cn.png', 'partner-03.png', '2017-02/20170208065234205041_zh-cn.png'),
(22, 0, 108, '2017-02/20170209075735105462_zh-cn.png', 'partner-04.png', '2017-02/20170209075735260121s_zh-cn.png'),
(23, 0, 108, '2017-02/20170209075735910416_zh-cn.png', 'partner-05.png', '2017-02/20170209075735270511s_zh-cn.png'),
(24, 0, 108, '2017-02/20170209075735249219_zh-cn.png', 'partner-06.png', '2017-02/20170209075735197271s_zh-cn.png'),
(25, 10, 109, '2017-02/20170209084417307812_zh-cn.jpg', 'banner.jpg', '2017-02/20170209084417311612s_zh-cn.jpg'),
(30, 50, 110, '2017-02/20170209083457862197_zh-cn.png', 'pay-03.png', '2017-02/20170209083457220607s_zh-cn.png'),
(31, 0, 110, '2017-02/20170209083457114283_zh-cn.png', 'pay-04.png', '2017-02/20170209083457200882s_zh-cn.png'),
(32, 0, 110, '2017-02/20170209083457614827_zh-cn.png', 'pay-05.png', '2017-02/20170209083457307651s_zh-cn.png'),
(33, 0, 110, '2017-02/20170209083457880362_zh-cn.png', 'pay-06.png', '2017-02/20170209083457157361s_zh-cn.png'),
(34, 60, 6, '2017-03/20170317092538316532.png', 'SK.png', '2017-03/20170317092538232629s.png'),
(35, 50, 6, '2017-03/20170317092538322761.png', 'NE.png', '2017-03/20170317092538452311s.png'),
(36, 40, 6, '2017-03/20170317092539236632.png', 'WT.png', '2017-03/20170317092539199181s.png'),
(37, 30, 6, '2017-03/20170317092539540025.png', 'UP.png', '2017-03/20170317092539254881s.png');

-- --------------------------------------------------------

--
-- Table structure for table `cc_link`
--

CREATE TABLE `cc_link` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL DEFAULT '1',
  `ordinal` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `isApproved` int(1) NOT NULL DEFAULT '0',
  `createDate` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接相关';

-- --------------------------------------------------------

--
-- Table structure for table `cc_mam`
--

CREATE TABLE `cc_mam` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `area` varchar(100) NOT NULL,
  `subscribe` int(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(10) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `createip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mam';

-- --------------------------------------------------------

--
-- Table structure for table `cc_pick`
--

CREATE TABLE `cc_pick` (
  `id` int(11) NOT NULL,
  `createUserId` int(11) NOT NULL,
  `copyfrom` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `charset` varchar(10) NOT NULL,
  `isOpen` tinyint(1) NOT NULL DEFAULT '1',
  `list` text,
  `item` text,
  `outClassId` text,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据采集规则相关';

-- --------------------------------------------------------

--
-- Table structure for table `cc_pickhis`
--

CREATE TABLE `cc_pickhis` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `outClassId` varchar(60) NOT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `pick_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据采集历史记录';

-- --------------------------------------------------------

--
-- Table structure for table `cc_pick_html`
--

CREATE TABLE `cc_pick_html` (
  `infoId` int(11) NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集过的网址列表';

-- --------------------------------------------------------

--
-- Table structure for table `cc_relation`
--

CREATE TABLE `cc_relation` (
  `id` varchar(20) NOT NULL,
  `ordinal` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `target` varchar(20) NOT NULL,
  `lang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台菜单';

--
-- Dumping data for table `cc_relation`
--

INSERT INTO `cc_relation` (`id`, `ordinal`, `name`, `url`, `target`, `lang`) VALUES
('101', 10, 'Information management', '', '', 'en'),
('102', 20, 'Senior Management', '', '', 'en'),
('103', 30, 'System Management', '', '', 'en'),
('101101', 10, 'Information / Search', '?con=admin&ctl=info/&act=search', '', 'en'),
('101102', 20, 'Information Classification Management', '?con=admin&ctl=info/class', '', 'en'),
('102101', 10, 'Site Settings', '?con=admin&ctl=system/site', '', 'en'),
('103101', 10, 'Role', '?con=admin&ctl=system/role', '', 'en'),
('103102', 20, 'User', '?con=admin&ctl=system/user', '', 'en'),
('102102', 20, 'Admin email', '?con=admin&ctl=adv/adminemail', '', 'en'),
('102103', 30, 'Email Receiver', '?con=admin&ctl=adv/subscribe', '', 'en'),
('102104', 40, 'Email Receiver group', '?con=admin&ctl=adv/subscribeclass', '', 'en'),
('102105', 50, 'Google Analytics setting', '?con=admin&ctl=adv/ga', '', 'en'),
('102106', 60, 'Google Analytics', '?con=admin&ctl=adv/ga&act=login', '', 'en'),
('104', 40, 'Page modify', '', '', 'en'),
('105', 50, 'Function', '', '', 'en'),
('106', 60, 'Email Marketing', '', '', 'en'),
('105101', 10, 'Site settings', '?con=admin&ctl=system/site', '', 'en'),
('105102', 20, 'Admin email', '?con=admin&ctl=adv/adminemail', '', 'en'),
('106101', 10, 'Email Receiver', '?con=admin&ctl=adv/subscribe', '', 'en'),
('106102', 20, 'Email Receiver group', '?con=admin&ctl=adv/subscribeclass', '', 'en'),
('105103', 30, 'Google Analytics', '?con=admin&ctl=adv/ga&act=login', '_blank', 'en'),
('105104', 40, 'Google Analytics setting', '?con=admin&ctl=adv/ga', '', 'en'),
('107', 70, 'Home Page', '', '', 'en'),
('107101', 10, 'HomePage product character', '?con=admin&ctl=adv/hcv&act=edit&noback=1', '', 'en'),
('107103', 30, 'Institutional Account', '?con=admin&ctl=info/redirect&class_id=102&id=2&noback=0', '', 'en'),
('107104', 40, 'logo management', '?con=admin&ctl=info/redirect&class_id=103&id=3&noback=0', '', 'en'),
('107105', 50, 'banner management', '?con=admin&ctl=info/redirect&class_id=104&id=109&noback=0', '', 'en'),
('107106', 60, 'logo', '?con=admin&ctl=info/redirect&class_id=105&id=110&noback=0', '', 'en'),
('108', 80, 'Corporate Profile', '', '', 'en'),
('109', 90, 'data collection', '', '', 'en'),
('112', 120, 'Client Resources', '', '', 'en'),
('113', 130, 'Education', '', '', 'en'),
('114', 140, 'Release News', '', '', 'en'),
('114101', 10, 'News Maintenance ', '?con=admin&ctl=info/&class_id=106101&withSubItems=1&noback=1', '', 'en'),
('114102', 20, 'News Links List', '?con=admin&ctl=info/&class_id=106102&withSubItems=1&noback=1', '', 'en'),
('113101', 10, 'Activity Release', '?con=admin&ctl=info/&class_id=107&withSubItems=1&noback=1', '', 'en'),
('112101', 10, 'Holiday trading hour', '?con=admin&ctl=info/redirect&class_id=108&id=7&noback=0', '', 'en'),
('109101', 10, 'vpsHosting data collection', '?con=admin&ctl=adv/vpsContact', '', 'en'),
('112102', 20, 'faq', '?con=admin&ctl=info/&class_id=109&withSubItems=1&noback=1', '', 'en'),
('112103', 30, 'help and support', '?con=admin&ctl=adv/list&pid=110&level=0 ', '', 'en'),
('113103', 30, 'important notice', '?con=admin&ctl=info/&class_id=111&withSubItems=1&noback=1', '', 'en'),
('109102', 20, 'mam data collection', '?con=admin&ctl=adv/mamContact', '', 'en'),
('108101', 10, 'Disclosure Documents', '?con=admin&ctl=info/&class_id=112&withSubItems=1&noback=1', '', 'en'),
('109103', 30, 'ib data collection', '?con=admin&ctl=adv/ibContact', '', 'en'),
('115', 150, 'maintenance ', '', '', 'en'),
('115101', 10, 'page maintenance ', '?con=admin&ctl=info/&class_id=113&withSubItems=1&noback=1', '', 'en'),
('115102', 20, 'Trading Tips', '?con=admin&ctl=info/&class_id=114&withSubItems=1&noback=1', '', 'en'),
('107102', 20, 'Standard Account', '?con=admin&ctl=info/redirect&class_id=102&id=1&noback=0', '', 'en'),
('109104', 40, 'video data collection', '?con=admin&ctl=adv/videoform', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cc_role`
--

CREATE TABLE `cc_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `isSystem` smallint(6) NOT NULL DEFAULT '0',
  `isSuper` tinyint(4) NOT NULL DEFAULT '0',
  `action` text,
  `info` text,
  `infoClass` text,
  `relation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色相关';

--
-- Dumping data for table `cc_role`
--

INSERT INTO `cc_role` (`id`, `name`, `description`, `isSystem`, `isSuper`, `action`, `info`, `infoClass`, `relation`) VALUES
(1, 'System administrator', 'Permission to have all the features of the system', 1, 0, 'a:40:{i:0;s:10:\"editor/pic\";i:1;s:10:\"upload/pic\";i:2;s:11:\"upload/file\";i:3;s:16:\"info/class/index\";i:4;s:14:\"info/class/add\";i:5;s:15:\"info/class/edit\";i:6;s:18:\"info/class/setting\";i:7;s:17:\"info/class/delete\";i:8;s:24:\"info/class/columnSetting\";i:9;s:16:\"info/index/index\";i:10;s:14:\"info/index/add\";i:11;s:15:\"info/index/edit\";i:12;s:17:\"info/index/delete\";i:13;s:18:\"info/index/preview\";i:14;s:17:\"info/index/search\";i:15;s:15:\"info/index/move\";i:16;s:15:\"info/index/copy\";i:17;s:16:\"info/index/state\";i:18;s:17:\"system/link/index\";i:19;s:15:\"system/link/add\";i:20;s:16:\"system/link/edit\";i:21;s:18:\"system/link/delete\";i:22;s:17:\"system/role/index\";i:23;s:15:\"system/role/add\";i:24;s:16:\"system/role/edit\";i:25;s:18:\"system/role/delete\";i:26;s:21:\"system/role/authorize\";i:27;s:17:\"system/site/index\";i:28;s:17:\"system/site/other\";i:29;s:17:\"system/user/index\";i:30;s:15:\"system/user/add\";i:31;s:16:\"system/user/edit\";i:32;s:18:\"system/user/delete\";i:33;s:21:\"system/user/authorize\";i:34;s:22:\"system/user/changepass\";i:35;s:13:\"0/class/index\";i:36;s:11:\"0/class/add\";i:37;s:13:\"0/index/index\";i:38;s:11:\"0/index/add\";i:39;s:14:\"0/index/search\";}', 'N;', 'N;', 'a:6:{i:0;s:6:\"101101\";i:1;s:6:\"101102\";i:2;s:6:\"102101\";i:3;s:6:\"102102\";i:4;s:6:\"103101\";i:5;s:6:\"103102\";}'),
(2, 'Administrator', '', 1, 0, 'a:45:{i:0;s:10:\"editor/pic\";i:1;s:16:\"info/index/index\";i:2;s:14:\"info/index/add\";i:3;s:15:\"info/index/edit\";i:4;s:20:\"info/index/deletepic\";i:5;s:17:\"info/index/delete\";i:6;s:18:\"info/index/preview\";i:7;s:19:\"info/redirect/index\";i:8;s:16:\"info/class/index\";i:9;s:14:\"info/class/add\";i:10;s:15:\"info/class/edit\";i:11;s:17:\"info/class/delete\";i:12;s:14:\"adv/list/index\";i:13;s:12:\"adv/list/add\";i:14;s:13:\"adv/list/edit\";i:15;s:15:\"adv/list/delete\";i:16;s:21:\"adv/config_data/index\";i:17;s:17:\"adv/contact/index\";i:18;s:16:\"adv/contact/edit\";i:19;s:18:\"adv/contact/delete\";i:20;s:13:\"adv/hcv/index\";i:21;s:12:\"adv/hcv/edit\";i:22;s:14:\"adv/hcv/delete\";i:23;s:20:\"adv/adminemail/index\";i:24;s:19:\"adv/videoform/index\";i:25;s:18:\"adv/videoform/edit\";i:26;s:20:\"adv/videoform/delete\";i:27;s:19:\"adv/ibContact/index\";i:28;s:18:\"adv/ibContact/edit\";i:29;s:20:\"adv/ibContact/delete\";i:30;s:17:\"adv/content/index\";i:31;s:15:\"adv/content/add\";i:32;s:16:\"adv/content/edit\";i:33;s:18:\"adv/content/delete\";i:34;s:20:\"adv/vpsContact/index\";i:35;s:19:\"adv/vpsContact/edit\";i:36;s:21:\"adv/vpsContact/delete\";i:37;s:20:\"adv/mamContact/index\";i:38;s:19:\"adv/mamContact/edit\";i:39;s:21:\"adv/mamContact/delete\";i:40;s:10:\"upload/pic\";i:41;s:11:\"upload/file\";i:42;s:22:\"system/user/changepass\";i:43;s:21:\"system/site.old/index\";i:44;s:17:\"system/site/index\";}', 'N;', 'N;', 'a:22:{i:0;s:6:\"102101\";i:1;s:6:\"102102\";i:2;s:6:\"107101\";i:3;s:6:\"107102\";i:4;s:6:\"107103\";i:5;s:6:\"107104\";i:6;s:6:\"107105\";i:7;s:6:\"107106\";i:8;s:6:\"108101\";i:9;s:6:\"109101\";i:10;s:6:\"109102\";i:11;s:6:\"109103\";i:12;s:6:\"109104\";i:13;s:6:\"112101\";i:14;s:6:\"112102\";i:15;s:6:\"112103\";i:16;s:6:\"113101\";i:17;s:6:\"113103\";i:18;s:6:\"114101\";i:19;s:6:\"114102\";i:20;s:6:\"115101\";i:21;s:6:\"115102\";}');

-- --------------------------------------------------------

--
-- Table structure for table `cc_sites`
--

CREATE TABLE `cc_sites` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pageTitle` varchar(250) NOT NULL,
  `keywords` varchar(120) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `icp` varchar(20) DEFAULT NULL,
  `copyright` text,
  `isCopyrightEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `contact` text,
  `isContactEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `headJavascript` text,
  `isHeadJavascriptEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `footJavascript` text,
  `isFootJavascriptEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点设置相关';

--
-- Dumping data for table `cc_sites`
--

INSERT INTO `cc_sites` (`id`, `name`, `pageTitle`, `keywords`, `description`, `icp`, `copyright`, `isCopyrightEnabled`, `contact`, `isContactEnabled`, `headJavascript`, `isHeadJavascriptEnabled`, `footJavascript`, `isFootJavascriptEnabled`, `lang`) VALUES
(1, 'Ruizean Markets', 'Ruizean Markets', 'Ruizean Market', 'Ruizean Markets', '', '', 0, '', 0, NULL, 0, NULL, 0, 'en'),
(2, 'Ruizean Markets cn', 'Ruizean Markets cn', 'Ruizean Markets cn', 'Ruizean Markets cn', '', '', 1, '', 1, NULL, 0, '', 1, 'zh-cn');

-- --------------------------------------------------------

--
-- Table structure for table `cc_subscribe`
--

CREATE TABLE `cc_subscribe` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL DEFAULT '0',
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `companyName` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  `msn` varchar(50) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `skype` varchar(50) NOT NULL,
  `memo` text NOT NULL,
  `submit_time` int(10) NOT NULL DEFAULT '0',
  `submit_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc_subscribeclass`
--

CREATE TABLE `cc_subscribeclass` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cc_subscribeclass`
--

INSERT INTO `cc_subscribeclass` (`id`, `name`) VALUES
(1, 'No class group');

-- --------------------------------------------------------

--
-- Table structure for table `cc_tags`
--

CREATE TABLE `cc_tags` (
  `info_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息Tags相关';

-- --------------------------------------------------------

--
-- Table structure for table `cc_user`
--

CREATE TABLE `cc_user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `displayName` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `isApproved` smallint(6) NOT NULL DEFAULT '0',
  `lastPasswordChangedDate` int(10) DEFAULT NULL,
  `lastLoginIP` varchar(15) DEFAULT NULL,
  `lastLoginDate` int(10) DEFAULT NULL,
  `loginCount` int(11) NOT NULL DEFAULT '0',
  `createdDate` int(10) NOT NULL,
  `lastModifiedDate` int(10) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `roleExtendType` tinyint(4) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '1',
  `action` text,
  `info` text,
  `infoClass` text,
  `relation` text,
  `oauth_connect` varchar(20) NOT NULL DEFAULT '',
  `oauth_connect_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户相关';

--
-- Dumping data for table `cc_user`
--

INSERT INTO `cc_user` (`id`, `name`, `password`, `displayName`, `email`, `isAdmin`, `isApproved`, `lastPasswordChangedDate`, `lastLoginIP`, `lastLoginDate`, `loginCount`, `createdDate`, `lastModifiedDate`, `role`, `roleExtendType`, `groupid`, `action`, `info`, `infoClass`, `relation`, `oauth_connect`, `oauth_connect_id`) VALUES
(1, 'super_admin', 'e91ee822c8d94b4fdf6513a586eff53d', 'System administrator', 'admin@localhost.com', 1, 1, NULL, NULL, NULL, 0, 1332743248, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', ''),
(2, 'admin', 'e041830d2d568db5e417e64110e37085', 'Administrator', 'admin@localhost.com', 1, 1, NULL, '161.43.101.46', 1518992594, 64, 1333548679, NULL, 2, 1, 0, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cc_videoform`
--

CREATE TABLE `cc_videoform` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `subscribe` int(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(10) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `createip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='video collection';

-- --------------------------------------------------------

--
-- Table structure for table `cc_views`
--

CREATE TABLE `cc_views` (
  `oldid` int(11) NOT NULL,
  `newid` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `viewtime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览关联';

-- --------------------------------------------------------

--
-- Table structure for table `cc_vpscontact`
--

CREATE TABLE `cc_vpscontact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `subscribe` int(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(10) NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT '0',
  `createip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vps collection';

--
-- Dumping data for table `cc_vpscontact`
--

INSERT INTO `cc_vpscontact` (`id`, `name`, `email`, `telephone`, `state`, `subscribe`, `message`, `reply`, `replyuserid`, `replytime`, `createtime`, `createip`) VALUES
(102, ' ', '', '', ' ', 0, '', NULL, 0, 0, 1519800980, NULL),
(103, ' ', '', '', ' ', 0, '', NULL, 0, 0, 1519801030, NULL),
(104, ' ', '', '', ' ', 0, '', NULL, 0, 0, 1519801875, NULL),
(105, ' ', '', '', ' ', 0, '', NULL, 0, 0, 1519801931, NULL),
(106, ' ', '', '', ' ', 0, '', NULL, 0, 0, 1519855891, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cc_wxinfor`
--

CREATE TABLE `cc_wxinfor` (
  `OpenID` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `sex` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `subscribe` int(11) NOT NULL,
  `subscribe_time` int(10) NOT NULL,
  `renew_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc_wxtoken`
--

CREATE TABLE `cc_wxtoken` (
  `tname` varchar(20) NOT NULL,
  `token` varchar(2000) NOT NULL,
  `ttime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc_adver`
--
ALTER TABLE `cc_adver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_contact`
--
ALTER TABLE `cc_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_ibcontact`
--
ALTER TABLE `cc_ibcontact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_info`
--
ALTER TABLE `cc_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_infopic`
--
ALTER TABLE `cc_infopic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infoId` (`infoId`);

--
-- Indexes for table `cc_link`
--
ALTER TABLE `cc_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_mam`
--
ALTER TABLE `cc_mam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_pick`
--
ALTER TABLE `cc_pick`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_pickhis`
--
ALTER TABLE `cc_pickhis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_role`
--
ALTER TABLE `cc_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_sites`
--
ALTER TABLE `cc_sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_subscribe`
--
ALTER TABLE `cc_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_subscribeclass`
--
ALTER TABLE `cc_subscribeclass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_user`
--
ALTER TABLE `cc_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_videoform`
--
ALTER TABLE `cc_videoform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_views`
--
ALTER TABLE `cc_views`
  ADD KEY `oldid` (`oldid`),
  ADD KEY `newid` (`newid`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `cc_vpscontact`
--
ALTER TABLE `cc_vpscontact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc_adver`
--
ALTER TABLE `cc_adver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_contact`
--
ALTER TABLE `cc_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_ibcontact`
--
ALTER TABLE `cc_ibcontact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_info`
--
ALTER TABLE `cc_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `cc_infopic`
--
ALTER TABLE `cc_infopic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `cc_link`
--
ALTER TABLE `cc_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_mam`
--
ALTER TABLE `cc_mam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_pick`
--
ALTER TABLE `cc_pick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_pickhis`
--
ALTER TABLE `cc_pickhis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_role`
--
ALTER TABLE `cc_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cc_sites`
--
ALTER TABLE `cc_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cc_subscribe`
--
ALTER TABLE `cc_subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_subscribeclass`
--
ALTER TABLE `cc_subscribeclass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cc_user`
--
ALTER TABLE `cc_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cc_videoform`
--
ALTER TABLE `cc_videoform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_vpscontact`
--
ALTER TABLE `cc_vpscontact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
