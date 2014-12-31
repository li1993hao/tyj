-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Dec 31, 2014 at 06:41 AM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xjxt`
--

-- --------------------------------------------------------

--
-- Table structure for table `xj_action`
--

CREATE TABLE `xj_action` (
`id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `xj_action`
--

INSERT INTO `xj_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 0, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, -1, 1418542406),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, -1, 1418542415),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, -1, 1418890941),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, -1, 1418540966),
(12, 'update_sports', '更新项目库', '更新项目库', '', '', 1, 1, 1419212751);

-- --------------------------------------------------------

--
-- Table structure for table `xj_action_log`
--

CREATE TABLE `xj_action_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=528 ;

--
-- Dumping data for table `xj_action_log`
--

INSERT INTO `xj_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(481, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 18:16登录了后台', 1, 1419848176),
(482, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 18:16登录了后台', 1, 1419848177),
(483, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-29 18:17登录了后台', 1, 1419848278),
(484, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-29 18:17登录了后台', 1, 1419848279),
(485, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 18:18登录了后台', 1, 1419848305),
(486, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 18:18登录了后台', 1, 1419848306),
(487, 1, 1, 0, 'member', 1, '李浩在2014-12-29 18:51登录了后台', 1, 1419850273),
(488, 1, 1, 0, 'member', 1, '李浩在2014-12-29 18:51登录了后台', 1, 1419850273),
(489, 10, 1, 0, 'Menu', 231, '操作url：/tyj/Admin/Menu/edit.html', 1, 1419850289),
(490, 10, 1, 0, 'Menu', 230, '操作url：/tyj/Admin/Menu/edit.html', 1, 1419850319),
(491, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 18:52登录了后台', 1, 1419850337),
(492, 1, 1, 0, 'member', 1, '李浩在2014-12-29 18:52登录了后台', 1, 1419850353),
(493, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 18:53登录了后台', 1, 1419850391),
(494, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 19:40登录了后台', 1, 1419853259),
(495, 1, 1, 0, 'member', 1, '李浩在2014-12-29 19:41登录了后台', 1, 1419853272),
(496, 10, 1, 0, 'Menu', 238, '操作url：/tyj/Admin/Menu/edit.html', 1, 1419853364),
(497, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 19:43登录了后台', 1, 1419853381),
(498, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 19:44登录了后台', 1, 1419853443),
(499, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 19:44登录了后台', 1, 1419853471),
(500, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 19:44登录了后台', 1, 1419853485),
(501, 1, 1, 0, 'member', 1, '李浩在2014-12-29 19:45登录了后台', 1, 1419853535),
(502, 1, 32, 0, 'member', 32, 'kexun在2014-12-29 19:45登录了后台', 1, 1419853559),
(503, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-29 19:46登录了后台', 1, 1419853583),
(504, 1, 1, 0, 'member', 1, '李浩在2014-12-30 20:16登录了后台', 1, 1419941781),
(505, 1, 1, 0, 'member', 1, '李浩在2014-12-30 20:16登录了后台', 1, 1419941782),
(506, 1, 1, 0, 'member', 1, '李浩在2014-12-31 09:27登录了后台', 1, 1419989230),
(507, 8, 1, 0, 'attribute', 215, '操作url：/tyj/Admin/Attribute/update.html', 1, 1419994493),
(508, 8, 1, 0, 'attribute', 216, '操作url：/tyj/Admin/Attribute/update.html', 1, 1419994571),
(509, 8, 1, 0, 'attribute', 215, '操作url：/tyj/Admin/Attribute/update.html', 1, 1419995404),
(510, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-31 11:34登录了后台', 1, 1419996847),
(511, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-31 11:34登录了后台', 1, 1419996848),
(512, 1, 1, 0, 'member', 1, '李浩在2014-12-31 11:56登录了后台', 1, 1419998196),
(513, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-31 11:57登录了后台', 1, 1419998264),
(514, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-31 11:58登录了后台', 1, 1419998285),
(515, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-31 11:58登录了后台', 1, 1419998286),
(516, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-31 12:05登录了后台', 1, 1419998722),
(517, 1, 29, 0, 'member', 29, 'yundongyuan在2014-12-31 12:05登录了后台', 1, 1419998741),
(518, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-31 12:05登录了后台', 1, 1419998756),
(519, 1, 1, 0, 'member', 1, '李浩在2014-12-31 13:10登录了后台', 1, 1420002638),
(520, 1, 34, 0, 'member', 34, 'yundongyuan1在2014-12-31 13:11登录了后台', 1, 1420002674),
(521, 1, 34, 0, 'member', 34, 'yundongyuan1在2014-12-31 13:11登录了后台', 1, 1420002676),
(522, 1, 1, 0, 'member', 1, '李浩在2014-12-31 13:14登录了后台', 1, 1420002871),
(523, 1, 35, 0, 'member', 35, 'y3在2014-12-31 13:16登录了后台', 1, 1420002986),
(524, 1, 35, 0, 'member', 35, 'y3在2014-12-31 13:16登录了后台', 1, 1420002987),
(525, 1, 30, 0, 'member', 30, 'jiaolian在2014-12-31 13:17登录了后台', 1, 1420003058),
(526, 1, 34, 0, 'member', 34, 'yundongyuan1在2014-12-31 13:18登录了后台', 1, 1420003125),
(527, 1, 1, 0, 'member', 1, '李浩在2014-12-31 13:19登录了后台', 1, 1420003164);

-- --------------------------------------------------------

--
-- Table structure for table `xj_article`
--

CREATE TABLE `xj_article` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `title_color` char(10) NOT NULL DEFAULT '#555' COMMENT '内容页标题颜色',
  `list_color` char(10) NOT NULL DEFAULT '#555' COMMENT '列表页标题颜色',
  `content` text NOT NULL COMMENT '文章内容',
  `is_up` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `position` varchar(100) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `cover` int(10) unsigned NOT NULL COMMENT '封面',
  `extend` text NOT NULL COMMENT '扩展统计字段'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=39 ;

--
-- Dumping data for table `xj_article`
--

INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(9, '有图片的新闻', 1, 55, '性格内敛、场下憨厚老实的刘伟还原了当时的情况，“在防守的时候，身体接触比较多，我当时想站起来，但脚不小心碰到了对方球员，真不是有意去做什么动作，只是想站起来，但碰到他之后，似乎他瞬间就暴怒朝我打过来，我来不及躲。没等我反应过来，他就抱住我的腿，当时我的膝关节就响了一下，脚踝根本动不了了。当时特别疼，然后他(33号外援奥顿)就不停地挥拳，我只能躲。后来还有一个队员也给我脸一拳，当时我就蒙了，就是觉得好几个人打我，也看不清楚是谁了。”', '', -28800, 54, 1419243381, 1419312496, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　不管当值主裁是否秉公判罚，不管四川队33号外援奥顿此刻内心是否存有愧疚，但天津队刘伟却因为对方几名队员的追打受伤且可能赔上接下来的全部比赛。“脚踝肿得比较厉害，膝关节也有扭伤。目前已经拍完片子，右脚踝重度扭伤，膝关节韧带也伤得比较重，还需要进一步治疗才能确诊，从目前情况看，伤得比较重。”赛后，天津队队医坦言，刘伟的伤病并不乐观，不排除赛季报销的可能。&lt;/p&gt;&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;天津四川群殴现场&quot; src=&quot;/tyj/Uploads/editor/image/20141222/5497ef47b80ad.png&quot; title=&quot;天津四川群殴现场&quot; style=&quot;border: 1px solid black; vertical-align: top; display: inline; margin: 0px auto; z-index: 1; position: relative;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;img_descr&quot; style=&quot;display: block; margin: 5px auto; z-index: 1;&quot;&gt;天津四川群殴现场&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　性格内敛、场下憨厚老实的刘伟还原了当时的情况，“在防守的时候，身体接触比较多，我当时想站起来，但脚不小心碰到了对方球员，真不是有意去做什么动作，只是想站起来，但碰到他之后，似乎他瞬间就暴怒朝我打过来，我来不及躲。没等我反应过来，他就抱住我的腿，当时我的膝关节就响了一下，脚踝根本动不了了。当时特别疼，然后他(33号外援奥顿)就不停地挥拳，我只能躲。后来还有一个队员也给我脸一拳，当时我就蒙了，就是觉得好几个人打我，也看不清楚是谁了。”&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 20px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　对于当时的情况，主帅纳什不愿过多指名道姓地评价，只是觉得这样的情况让人难以置信，而两名队员受伤也让纳什在随后的比赛中颇为头疼，“这是一个糟糕的情况，每场比赛都会有激烈的身体对抗，这正是篮球的魅力，但是超出体育道德的行为，我不赞同。每个队员都应该控制好自己的情绪，对方球员的行为极为不理智，这样影响了比赛，也造成了不必要的影响。我很无奈，这是比赛，又不是打架。我现在能做的，就是鼓励我的队员，他们有可能被停赛，这本不该发生，他们又不是罪魁祸首。我希望球员们不要受到影响，毕竟我们还有比赛。我知道，我的队员是最棒的，他们足够有素质，足够大度，尤其是刘伟，在这样混乱场面出现后，都没有去攻击谁，这才是好的队员，但显然对方有的队员不够理智。我想说的就是这些，因为我的心情很糟糕。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '3,', 13, ''),
(10, '平台简介', 1, 49, '', '', -28800, 22, 1419255335, 1419255927, '', 1, '#f83a22', '#555', '&lt;table class=&quot;winstyle42481&quot; width=&quot;100%&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td class=&quot;contentstyle42481&quot; style=&quot;font-size: 9pt; color: rgb(51, 51, 51); line-height: 18px; position: relative;&quot; width=&quot;730&quot;&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;&lt;span style=&quot;text-indent: 2em; font-size: 9pt;&quot;&gt;一、 活动名称：2015中国体育彩票全国新年登高健身&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;活动天津市新年步步高登天塔比赛活动。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;二、主办单位：国家体育总局、中华全国体育总会。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;三、承办单位：国家体育总局登山运动管理中心、国家体育总局体育彩票管理中心、天津市体育局、天津市总工会、共青团天津市委员会、天津市妇女联合会、天津市广播电视台。&lt;/p&gt;&lt;p style=&quot;text-align:left;text-indent: 2em;&quot;&gt;四、协办单位：天津市社会体育管理中心、天津市体育彩票管理中心、天津市登山户外运动协会、天津广播电视塔管理中心。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;五、时间地点：2015年1月1日上午9：30分在天津广播电视塔举行。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;六、参加范围：各区县、行业系统、体育社团、市民、体育健身爱好者，身体健康，具有一定的运动能力的市民均可报名参加。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;七、活动路线：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;由电视塔广场出发--跑步环塔完成600米--天塔入口--沿天塔楼梯攀登--天塔晾望厅（高253米处）。（活动结束后乘电梯返回天塔内广场）&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;八、活动分组：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;1．活动分竞赛组与市民组。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;2．竞赛组报名人数：男子组50名、女子组50名，年龄分组为18岁-40岁、40岁-60岁，报名额满为止。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;3．市民组人数为1900人，报名额满为止。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;九、报名办法：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;1．参加活动的单位或个人请登录天津市体育局官方网站(群体活动)查询比赛规程,下载报名表。必须按规定填写统一的报名表见（附件1），携带相关身份资格的证明材料，报名时所有参赛者必须签字认可参加本次活动的自愿参赛责任书（附件2）。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;2．报名时间与地点：报名者应于2014年12月22日开始至24日截止，报名按先后顺序，额满为止。报名地点：市体育局社体中心（和平区岳阳道114号），联系电话：23121515，联系人：蔡丽娟、马超。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;十、活动要求：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;1．参加活动者提前3 0分钟集合，参加活动前的热身准备活动。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;2．参加活动者的出发顺序为先竞赛组，后为市民组的方式依次出发。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;3．活动起点设在天塔院内广场，起跑仪式上由到会的领导统一鸣枪出发。活动终点设在天塔晾望厅，以活动者到达终点的先后顺序排定名次。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;4．登塔过程中，参加活动者应沿塔内阶梯的右侧成一路纵队攀登，如超越前方的队员时，应从前方队员的左侧超越。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;5．参加活动者必须按规定路线行进，不准对他人实施拖拉、阻挡等行为，休息时不要影响到他人，否则将取消该队员参加活动的资格。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;6.活动中队员若出现身体不适感觉，立即停止并退出活动。&lt;/p&gt;&lt;p style=&quot;text-align:left;text-indent: 2em;&quot;&gt;7．参加活动者未在规定时间45分钟内进入天塔，将不&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;能继续参加登塔比赛。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;十一、奖励办法：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;1．竞赛组分别奖励&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;男子组18岁-40岁组前6名、40-60岁组前6名。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;女子组18岁-40岁组前6名、40-60岁组前6名。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;2．市民组完成全程者，赠与纪念品。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;十二、裁判员：本次活动裁判员由组委会统一选派。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;十三、其它：&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;1．参加活动者需自行办理本人意外人身伤害保险和体检证明,活动中出现伤害事故自理。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;2．活动中个人物品自理。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;3．未尽事宜，另行通知。本规程解释权属组委会。&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(11, '带视频的新闻', 1, 55, '', '', 0, 7, 1419262708, 1419262708, '', 1, '#555', '#555', '&lt;p style=&quot;text-align:center&quot;&gt;&lt;embed type=&quot;application/x-shockwave-flash&quot; class=&quot;edui-faked-video&quot; pluginspage=&quot;http://www.macromedia.com/go/getflashplayer&quot; src=&quot;http://player.youku.com/player.php/sid/XODU0NDc2Mjgw/v.swf&quot; width=&quot;420&quot; height=&quot;280&quot; wmode=&quot;transparent&quot; play=&quot;true&quot; loop=&quot;false&quot; menu=&quot;false&quot; allowscriptaccess=&quot;never&quot; allowfullscreen=&quot;true&quot;/&gt;&lt;/p&gt;&lt;p&gt;大大叔大叔的的撒dasd&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(12, '本地上传的视频', 1, 55, '上传本地视频', '', 0, 8, 1419263569, 1419263569, '', 1, '#555', '#555', '&lt;p&gt;&lt;video class=&quot;edui-upload-video  vjs-default-skin video-js&quot; controls=&quot;&quot; preload=&quot;none&quot; width=&quot;420&quot; height=&quot;280&quot; src=&quot;/tyj/Uploads/editor/video/20141222/54983e461bffa.MP4&quot; data-setup=&quot;{}&quot;&gt;&lt;source src=&quot;/tyj/Uploads/editor/video/20141222/54983e461bffa.MP4&quot; type=&quot;video/MP4&quot;/&gt;&lt;/video&gt;&lt;/p&gt;', 1, '0', 0, ''),
(13, 'dasdas', 1, 56, 'dasda', '', 0, 0, 1419591028, 1419591028, '', 1, '#555', '#555', '&lt;p&gt;asdasdd&lt;/p&gt;', 0, '0', 0, ''),
(14, 'dasd', 1, 55, 'dsasd', 'http://www.baidu.com', 0, 0, 1419649714, 1419649714, '', 1, '#555', '#555', '&lt;p&gt;dasd&lt;/p&gt;', 0, '0', 0, ''),
(15, '训练中心职工宿舍管理规定', 1, 59, '训练中心职工宿舍管理规定', '', -28800, 3, 1419818130, 1419818196, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第一条 为规范中心职工集体宿舍使用和管理，特制订本规定。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第二条 借住范围&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;中心在编职工和签订聘用合同的编外职工及为中心提供服务的单位或个人。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第三条 借住条件&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、由于工作原因每周须加班不少于2次，且加班时间超过晚10点，现所在部门不能安排临时住宿的。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、现居住地点距中心20公里及以上（含江北地区），中心班车及城市公交系统无法有效覆盖的。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、职工本人或配偶已购房，因房屋暂未交付或装修等特殊原因造成无法入住的。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;4、因工作需要为中心提供服务的单位或个人。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第四条 借住审批&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、中心职工需借住的，由借住人根据实际情况填写《职工集体宿舍租用申请表》经职工所在部门负责人签字后，后勤保障部负责人审批，方可入住。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、服务单位或个人需要借住的，由中心对口联系部门填写《职工集体宿舍租用申请表》并提交住宿人员健康证明，经对口部门负责人签字，后勤保障部门负责人审核，中心分管领导批准后，方可入住。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第五条 宿舍交接&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、借住人须服从宿舍管理部门的分配，由管理部门、宿舍管理员及借住人共同确认屋内租用的设施和各表刻度。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、借住人申请借住期限到期后，如需继续借住须重新办理借住审批手续。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、宿舍管理部门根据借住人申请的借住期限或人事部门有关通知，解除与该借住人的借住关系，督促其在规定时间内退房并办理移交手续。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第六条 宿管员职责&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（一）宿舍管理员原则上由宿舍管理部门在借住人员中指定。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（二）宿管员的权利和义务包括：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、保持同宿舍内借住人良好的住宿氛围，协调处理影响他人休息等矛盾；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、及时制止并报告宿舍内发生的意外事件；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、关注同宿舍内借住人的身体健康状况，如有异常情况及时向宿舍管理部门报告；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;4、负责管理本宿舍水、电、气、物业等费用的收缴；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;5、享受宿管员的相关能耗补贴&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第七条 借住公约&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、服从宿舍管理人员的管理&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、寝室内禁止烧煮、烹饪或私自接配电线及装接电器。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、宿舍内不得使用或存放危险及违禁物品。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;4、保持宿舍整洁，及时清理垃圾，严禁向窗外抛掷任何物品。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;5、洗晒衣物需按指定位置晾晒。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;6、不得以任何形式妨碍他人休息。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;7、未经允许不得留宿外人或亲友。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;8、贵重物品应避免携入，遗失自负。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;9、水电气及物业费用由各宿舍借住人自行协商分摊。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;10、宿舍内严禁在床上抽烟，大声喧哗，以及及聚餐、酗酒、赌博等不当行为。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第八条 损坏及维修&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、宿舍配套设施属中心固定资产，借住人在使用过程中发现损坏须及时上报宿舍管理部门进行维修。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、故意破坏或不当使用造成的损失由借住人承担责任。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、如确认属借住人故意损坏租用设施的，管理部门有权解除与该借住人的借住关系，督促其在规定时间内退房并根据损失情况予以追责。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第九条 其他&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;1、宿舍借住押金按床位收取，每张床位押金500元，由宿舍管理部门收取后出具收据，并交中心财务保管。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;2、借住人须在解除借住关系一个月内无条件搬出。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;3、借住人在规定期限内搬出宿舍，归还借用物品完好无损，并支付分摊费用后退还押金。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;第十条 本管理规定自2014年1月起实施，由后勤保障部负责解释。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, '1,2,3,', 21, ''),
(8, '运动项目下面的新闻', 1, 55, '为积极备战第十二届全运会，切实提高今年夏训的效果，江苏女篮青年组于2012年8月12日-25日赴韩国进行了为期两周的集训比赛。 在韩期间，江苏女篮青年组转战三个城市，与多家韩国甲级、乙级女篮俱乐部及优秀高中生队伍进行了交流比赛。在交流过程中教练组和运动员深刻的体会到韩国篮球之所以能在亚洲确立自己的地位，正是由于其一代一代延续并发扬了快、准、灵的技战术风格和严谨、认真、顽强的比赛作风。', '', -28800, 9, 1419242228, 1419312533, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; text-indent: 21pt; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;为积极备战第十二届全运会，切实提高今年夏训的效果，江苏女篮青年组于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;-25&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;日赴韩国进行了为期两周的集训比赛。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; text-indent: 21pt; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;在韩期间，江苏女篮青年组转战三个城市，与多家韩国甲级、乙级女篮俱乐部及优秀高中生&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;队伍进行了交流比赛。在交流过程中教练组和运动员深刻的体会到韩国篮球之所以能在亚洲确立自己的地位，正是由于其一代一代延续并发扬了快、准、灵的技战术风格和严谨、认真、顽强的比赛作风。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; text-indent: 21pt; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;本次江苏女篮青年组赴韩集训比赛密度较大，但是队员们都很珍惜这来之不易的机会，在场场比赛中都做到全力以赴，在打出自己特点的同时，不断汲取对手的优点，不断发现自身存在的问题。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; text-indent: 21pt; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;通过本次交流比赛，运动员们领略到了韩国篮球技战术特点，感受到了韩国体育和韩国篮球特有的文化，学习到了对手认真的态度和敬业的精神。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '3,', 0, ''),
(16, '《训练中心职工宿舍管理规定（暂行）》实施办法', 1, 59, '《训练中心职工宿舍管理规定（暂行）》实施办法', '', 0, 1, 1419818595, 1419818595, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;一、实施原则&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;后勤保障部的生活保障内容，既要满足运动队的生活保障需求，也要提升中心职工的保障水平。由于中心的位置偏僻，周边城市公交系统覆盖不足，从事行政及保障岗位的外聘职工平均收入水平偏低等现实情况，均制约了中心人力资源的发展及储备。为此，冠军楼的职工宿舍已成为中心为职工提供生活保障以及缓解人力资源压力的重要组成部分。《训练中心职工宿舍管理规定（暂行）》（以下简称“规定”）对职工宿舍借用人的范围和条件及借用规则做了明确规范。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;二、实施标准&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（一）适用范围&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;本规定对借用人的范围及借用条件设立了标准。主要范围包括中心非南京籍或因居住地偏远，且因工作要求须长期加班的在编职工和签订聘用合同的编外职工。对计划长期立足于中心，服务运动队，并已购买在建楼盘或所购住房因装修暂未交付的职工，考虑到其与外地职工既有区别也有共性，结合实际情况，规定预留了有前提的弹性审批空间。例如因房屋暂未交付的中心职工以及为中心提供服务的单位或个人也适用本规定。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（二）借用审批&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;规定对借用人的审批权限分为部门负责人审批和中心分管主任审批。部门负责人审批权限的对象仅为本部门中心在编职工和签订聘用合同的编外职工；中心分管主任审批的对象包括但不限于为中心提供服务的单位或个人。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;填写借住申请表时，申请人须根据申请表要求填写基本信息，参照规定第三条内容填写申请原因及申请，并要求根据申请表下方的填报说明备齐所需材料的复印件与申请表一并提交；申请人所在部门应对申请人提出申请的理由和依据进行把关，在能够核实情况的基础上提出明确意见；宿舍管理部门在接受申请时须对借住申请材料进行复审，明确借出意见后交管理宿舍的职能科室办理。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（三）房间及床位分配&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;房间及床位分配由管理宿舍的职能科室根据宿舍管理部门或分管领导签署的分配意见在现有房间和床位的资源进行分配。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;职工宿舍每间寝室原则上不少于2人入住。经中心分管领导批准借用给部门或单位的整套宿舍，由借用部门或单位自行安排床位并承担相应责任，借住到期的须提前一个月重新申请。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（四）宿舍管理&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;根据规定借出宿舍的管理方式主要由管理宿舍的职能科室和宿舍管理员共同执行，经中心分管领导批准借用给部门或单位的整套宿舍由管理宿舍的职能科室和借用单位指定的联系人协同管理。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;宿舍管理科室对职工寝室进行床位分配及宿舍内配套设施的管理，并根据借住人员在中心工作情况和工作职务等综合因素指定宿舍管理员。宿舍管理员则根据规定的宿管员职责和借住公约对借住人进行约束，保持职工宿舍管理渠道的畅通。考虑到宿管员在管理借住人过程中付出的努力，宿管员享有每月100元能耗补贴，此费用由宿舍管理部门确认后通知财务与当月工资一并发放。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;（五）其他说明&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;为加强对借住人使用宿舍及配套设施的自我约束，延长固定资产的使用寿命，以及避免借助人间因能耗等问题产生的矛盾。自本规定颁布并实施起，床位押金为每张500元，用于弥补故意损坏配套设施的赔偿以及拖欠能耗费用、违反规定拖延搬出时间等违规行为造成的损失。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;经中心分管领导审批借用给部门或单位的整套宿舍的押金标准另行协商。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;三、修改及审议&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;宿舍管理部门根据规定的实施情况予以补充和完善，并对解释实施过程中的问题。如涉及借住范围及审批流程等原则条款发生变化须重新拟定的情况，由中心领导审批后执行。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(17, '运动项目管理中心工作职能', 1, 58, '运动项目管理中心工作职能', '', 0, 0, 1419818626, 1419818626, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;一、贯彻执行省体育局训练中心的各项方针、政策，研究制定所属运动项目的发展目标、发展规划和年度计划，并组织贯彻实施；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;二、负责所属运动队的日常训练管理和参赛工作；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;三、在省体育局相关职能部门的统一领导下，负责全省所属运动项目业余训练的管理工作，促进本项目运动队人才梯队的良好衔接；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;四、在省体育局相关职能部门的统一领导下，负责全省所属运动项目教练员的业务培训和考核工作；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;五、在省体育局相关职能部门的统一领导下，负责全省所属运动项目裁判员的培训、考核和使用工作；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;六、负责所属运动队的思想政治工作和运动员的文化教育以及各项保障工作；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;七、积极推进所属运动项目的市场开发等工作，逐步推动本项目的职业化进程；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;八、搞好省所属项目协会的组织建设，充分发挥协会的桥梁和纽带作用；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;九、完成局训练中心交办的其它工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(18, '办公室工作职能', 1, 58, '办公室工作职能', '', 0, 0, 1419818685, 1419818685, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;负责中心综合协调、文书档案和行政管理工作；负责中心发展规划、有关综合性规章制度的制定与编印工作；负责中心各类综合性文稿起草；负责中心新闻宣传、简报信息及网站管理工作；负责中心会务统筹和对外接待工作；负责中心外事管理工作；负责中心文史和文印工作；负责中心党委、团委、工会和运动员委员会的组织建设及日常事务管理；负责中心党风廉政建设和纪检监察工作；协助党委抓好中心组学习，做好党员和干部职工的思想政治工作。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;承办中心领导交办的其它工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(19, '人事教育部工作职能', 1, 58, '人事教育部工作职能', '', 0, 0, 1419818712, 1419818712, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;负责研究制定中心人事管理规章制度；负责管理中心机构编制、职能调整、人员聘用、收入分配、人事调配、考核奖惩、教育培训等工作；负责教练员等专业技术职称评审的管理工作；负责运动员的招收聘用、社会保险、工资福利、就读高校、伤病理赔、职业转换、退役安置等各类保障工作；负责事业单位法人证登记、年检工作；负责中心劳动用工的管理和年检；负责人事档案、人事统计年报管理及出国人员政审工作；负责中心退休人员的管理工作。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 32pt;&quot;&gt;&lt;span style=&quot;font-size: 16pt; font-family: 仿宋_GB2312;&quot;&gt;承办中心领导交办的其它工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(20, '职称评审工作流程', 1, 60, '职称评审工作流程', '', 0, 1, 1419818921, 1419818921, '', 1, '#555', '#555', '&lt;p&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0b78b2ec01.jpg&quot; title=&quot;54a0b78b2ec01.jpg&quot; alt=&quot;20140521163952_32911.jpg&quot;/&gt;&lt;/p&gt;', 0, '0', 23, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(21, '联系我们', 1, 61, '联系我们', '', 0, 0, 1419819290, 1419819290, '', 1, '#555', '#555', '&lt;p&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;地址：西路10号&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp; 邮编：2642093&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp; 电话：0631-5676565316&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 传真：&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;0631-5699262599&lt;/span&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 邮箱：&lt;/span&gt;&lt;a href=&quot;mailto:whtyjd@126.com&quot; style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;whtfdfyjd@126.com&lt;/a&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;br style=&quot;margin: 0px; padding: 0px; list-style: none; font-family: 瀹嬩綋; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);&quot;/&gt;&lt;span style=&quot;font-family: 瀹嬩綋; font-size: medium; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 网址：http://www.sdwhdfdfsports.com/&lt;/span&gt;&lt;/p&gt;', 0, '0', 0, ''),
(22, '江苏女篮青年组赴韩国集训比赛', 1, 55, '江苏女篮青年组赴韩国集训比赛', '', 0, 0, 1419819546, 1419819546, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;为积极备战第十二届全运会，切实提高今年夏训的效果，江苏女篮青年组于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;-25&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;日赴韩国进行了为期两周的集训比赛。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;在韩期间，江苏女篮青年组转战三个城市，与多家韩国甲级、乙级女篮俱乐部及优秀高中生&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;队伍进行了交流比赛。在交流过程中教练组和运动员深刻的体会到韩国篮球之所以能在亚洲确立自己的地位，正是由于其一代一代延续并发扬了快、准、灵的技战术风格和严谨、认真、顽强的比赛作风。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;本次江苏女篮青年组赴韩集训比赛密度较大，但是队员们都很珍惜这来之不易的机会，在场场比赛中都做到全力以赴，在打出自己特点的同时，不断汲取对手的优点，不断发现自身存在的问题。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;通过本次交流比赛，运动员们领略到了韩国篮球技战术特点，感受到了韩国体育和韩国篮球特有的文化，学习到了对手认真的态度和敬业的精神。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0ba188f1be.jpg&quot; title=&quot;54a0ba188f1be.jpg&quot; alt=&quot;20120905150748_25669.jpg&quot;/&gt;&lt;/p&gt;', 0, '0', 24, ''),
(23, '训练中心10月份比赛成绩汇总', 1, 54, '训练中心10月份比赛成绩汇总', '', 0, 1, 1419819611, 1419819611, '', 1, '#555', '#555', '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td height=&quot;30&quot; width=&quot;53&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;序号&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;88&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;项目中心&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;93&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;类别&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;204&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;比赛名称&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;186&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;小项&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;运动员（队）&lt;/strong&gt;&lt;/td&gt;&lt;td width=&quot;207&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;&lt;strong&gt;成绩&lt;/strong&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;1&lt;/td&gt;&lt;td rowspan=&quot;10&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;田径&lt;/td&gt;&lt;td rowspan=&quot;10&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;一类&lt;/td&gt;&lt;td rowspan=&quot;6&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;2014年全国田径锦标赛&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子铁饼&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;吴建&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（58.63米）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;2&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子铁饼&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;谭建&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（61.07米）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;3&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子100米栏&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;孙雅薇&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（13″01）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;4&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子110米栏&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;江帆&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（13″57）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;5&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子十项全能&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;胡雨飞&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（7433分）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;6&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子5000米&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;胥秋子&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（16′01″93）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;7&lt;/td&gt;&lt;td rowspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;2014年全国竞走锦标赛&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子20公里竞走&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;李天蕾&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（1:24:55）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;8&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子50公里竞走个人&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;王振东&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（亚运会带入)&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;9&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子50公里竞走团体总分&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;江苏队&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;10&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子20公里竞走团体总分&lt;/td&gt;&lt;td width=&quot;227&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;江苏队&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第一名（亚运会带入）&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;11&lt;/td&gt;&lt;td rowspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;篮球&lt;/td&gt;&lt;td rowspan=&quot;2&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;一类&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;全国U15女子篮球集训赛&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子篮球&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女篮U18组&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第四名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;12&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;全国U15男子篮球集训赛&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子篮球&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男篮U18组&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;第五名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=&quot;3&quot; height=&quot;90&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;13&lt;/td&gt;&lt;td rowspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;举重&lt;/td&gt;&lt;td rowspan=&quot;5&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;二类&lt;/td&gt;&lt;td rowspan=&quot;4&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;全国男子举重冠军赛&lt;/td&gt;&lt;td rowspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子77公斤级&lt;/td&gt;&lt;td rowspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;陆浩杰&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;抓举165kg&amp;nbsp;&amp;nbsp; 第一名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;挺举196kg&amp;nbsp;&amp;nbsp; 第一名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;总成绩361kg&amp;nbsp;&amp;nbsp; 第一名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;14&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;男子69公斤级&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;黄文文&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;总成绩333kg&amp;nbsp; 第三名&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;30&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;15&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;全国女子举重冠军赛&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;女子53公斤级&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;吴蓉蓉&lt;/td&gt;&lt;td style=&quot;margin: 0px; padding: 0px; vertical-align: middle;&quot;&gt;总成绩209kg&amp;nbsp;&amp;nbsp; 第三名&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(24, '820行为素质训练第78期顺利闭幕', 1, 53, '820行为素质训练第78期顺利闭幕', '', 0, 0, 1419819728, 1419819728, '', 1, '#555', '#555', '&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;820军校行为素质训练第78期（北京第37期）于2014年12月14日正式闭幕。共有来自全国的20余家企业的50多名员工参加了此次培训。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　820军校行为素质训练第78期在北京某现役部队驻地开展，并于2014年12月14日正式闭幕，为期三天。参训人员均为各企业的销售管理人员、销售精英及储备干部。经过三天的培训，参训人员不仅在销售技能、团队建设方面大有收获，同时也解决了长久以来存在于销售工作中的困惑、瓶颈等问题。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/11490c61e4498c2b2b0c6cc8898a6825.jpg&quot; alt=&quot;02.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-size: 14px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/ad59642e4f409b031927e7318116624e.jpg&quot; alt=&quot;03.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　培训采用军事化管理，不同于当下许多培训的度假式培训方式。紧凑的节奏，军事化的作息与住宿环境，是为了改变销售人员长期以来积累的懒散习惯。尽管有些销售人员最初略有微词，但是经过三天的训练却受益匪浅。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/2cc1d48d2f01a04618a8ca3094dddc86.jpg&quot; alt=&quot;04.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/b7b1bac0257847ddae3bb225855df718.jpg&quot; alt=&quot;07.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; text-align: start;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/2efa7a7772be769a2483c96d1ecf293d.jpg&quot; alt=&quot;13.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-size: 14px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　820军校行为素质训练第78期学员来自江西格利特集团的张总深有感触，他表示：虽然自己有着丰富销售经验与管理检验，但此次的培训使自己意识到以前工作中目标管理存在着盲目性。通过培训让我理解管理过程的可操控性，过去我们的管理过程中虽然制定了年度目标、月度计划，过程考核管理等，却没有教给团队成员具体的、可操控且行之有效的方法去实现目标。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/0501ccbc0b7f0c670dca29b8a5e62dac.jpg&quot; alt=&quot;06.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/8f9e7d8a0f39c4ad3e11c5eec87c7439.jpg&quot; alt=&quot;09.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　在过去的业务培训中，过多的是形式和理论的培训，没有具体的实际动作，整个培训很空洞，从而使业务员表面上什么都懂，而一旦面对客户进行实际操作，总是出现这样或那样的错误，最终的结局就是有目标、有培训而难以落地。通过820的培训使我意识到销售人员销售技能的提高是要靠具体的行之有效的事例和落地的方法来实现，在820我真正体会到了，如客户拜访的具体细节及方法，FABE中的利益侧重点等。最后让我感受到的是以前的管理是面，是在套用一些管理理念，而通过820培训，使我意识到在管理面的同时，应该是点的管理，即具体事情用具体的案例或者行之有效的具体方法来培训业务员，通过模拟演练、具体操作，使团队的每个人都能掌握直接有效的客户交流动作，从而达成合作，达到目的，所以感谢820，使我真正意识到行为素质培养的重要性，意识到终端培训的重点。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/ec2ef8ee58e71eff8d7b8a5cf7af8d97.jpg&quot; alt=&quot;08.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/3db6916f25ff74858dedb717212f2896.jpg&quot; alt=&quot;12.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://www.820school.com/d/file/myxl/xldt/2014-12-22/bb02e9d19fa1b2a5054a0a915e97526d.jpg&quot; alt=&quot;10.jpg&quot; width=&quot;500&quot; height=&quot;333&quot; style=&quot;margin: 0px; padding: 0px; border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; font-size: 14px;&quot;&gt;　　如何抓住客户心理，有效的介绍自己的产品，如何进行销售团队建设是有科学规律可循，并需要进行落地性训练的。实现销售技能、团队建设的可执行、可复制、可追溯是820行为素质训练的重要特点。特别是针对一些产品价值高度隐性，对业务人员依赖性较强的行业，销售人员的培养与提高成为众多企业的瓶颈，820行为素质训练将为企业突破瓶颈做出强有力的指导。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(25, '最近赛事', 1, 52, '最近赛事', '', 0, 0, 1419819795, 1419819795, '', 1, '#555', '#555', '&lt;h2&gt;（一）学校初赛（5月20日—9月15日）&lt;/h2&gt;&lt;p style=&quot;TEXT-INDENT: 2em&quot;&gt;各院校自行组织在校学生参赛。所有参赛选手须在大赛官方网站（www.jsbys.com.cn/zygh）注册、报名并提交作品，由各院校根据大赛评选规则和评分标准，从计划、执行、展示等几方面综合评比。按照学校初赛参赛总人数2% \r\n评选优胜选手，由大赛组委会颁发优胜奖证书。&lt;/p&gt;&lt;p style=&quot;TEXT-INDENT: 2em&quot;&gt;每所参赛院校推荐不多于3名优秀选手参加全省复赛。推荐选手的书面作品由学校统一上传至大赛官方网站，并向组委会提交该选手的书面作品（一式六份，要求为普通A4纸打印稿，黑白色）和初赛影像资料光盘或U盘（要求视频播放流畅，画面清晰，文件格式为AVI或MP4，文件大小不超过300M）。选手提交书面作品含个人职业生涯规划书和生涯人物访谈报告，均须有扉页，扉页填写参赛者的真实姓名、性别、学校、院系、班级、学号以及指导教师的姓名、所在院系（部门）、联系电话。个人职业生涯规划书和生涯人物访谈报告内则不得出现涉及选手身份信息的内容，如必须出现时请以“*”代替。&lt;/p&gt;&lt;h2&gt;（二）全省复赛（10月10日-10月30日）&lt;/h2&gt;&lt;p style=&quot;TEXT-INDENT: 2em&quot;&gt;本次大赛复赛不设分赛区，不采用现场比赛的方式，评委只对选手初赛视频和书面作品进行评分。参赛选手分为本科院校组和专科院校组，由专家评审组按照评选规则，分别评出一、二、三等奖。其中获一等奖的选手参加全省总决赛。&lt;/p&gt;&lt;h2&gt;（三）总决赛（11月1日—11月25日）&lt;/h2&gt;&lt;p style=&quot;TEXT-INDENT: 2em&quot;&gt;总决赛为现场比赛，按照本科院校组和专科院校组分别评选职业规划之星各10名、年度总冠军各1名。现场比赛环节包括书面作品评审（30％）、现场陈述（40％）、专家提问（10％）、职业角色情境模拟（20％）。 &amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;!--赛程安排end --&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(26, '训练中心组织走进西岗社区关爱老人活动', 1, 50, '训练中心组织走进西岗社区关爱老人活动', '', 0, 0, 1419819844, 1419819844, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 43px;&quot;&gt;&lt;span style=&quot;font-size: 21px; font-family: 仿宋_GB2312;&quot;&gt;近日，中心党委职能部门积极与所在社区联系，让在职党员参与社区建设和服务。根据社区需要、群众需求，结合中心各支部的特点，并根据党员意愿和特长，办公室精心设计活动载体，为中心在职党员搭建为民服务平台。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 43px;&quot;&gt;&lt;span style=&quot;font-size: 21px; font-family: 仿宋_GB2312;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;font-size: 21px; font-family: 仿宋_GB2312;&quot;&gt;月25日，正值圣诞节来临之际，中心组织部分机关党员，乒乓、武术项目中心的党员和运动员一起来到西岗社区摄山星城“星之缘老年服务中心”和当地的孤寡老人互动联谊，为这些老人送去关爱和欢笑。为此，武术、乒乓两支部还特意调整了训练时间，积极配合这次活动。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 43px;&quot;&gt;&lt;span style=&quot;font-size: 21px; font-family: 仿宋_GB2312;&quot;&gt;武术套路队的运动员们为老人们表演了一套太极拳组合，看的老人们直呼精彩，拍手叫绝，紧接着，乒乓队的王德胜教练在没有伴奏带的情况下，清唱了两首歌，浑厚的嗓音，优美的旋律听得老人们如痴如醉，赞不绝口。看到我们的表演，老人们也不甘落后，按捺不住，集体演唱了《东方红》，一位老者表演完对我们说：“我们已是落日，而你们就像那早上初升的太阳，生机勃勃，你们要为南京人民争光、为省多做贡献，未来是属于你们的。”最后我们和老人们一起做起了游戏，小小的活动室充满了欢声笑语。外面虽然寒风凛冽，却挡不住屋内暖暖的爱意。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 43px;&quot;&gt;&lt;span style=&quot;font-size: 21px; font-family: 仿宋_GB2312;&quot;&gt;通过活动的开展，我们将建立长效服务机制，纳入常态化工作，为我们邻里社区的和谐发展做出贡献。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/upload/image/20141226/1419575533408887.jpg&quot; title=&quot;1419575533408887.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/upload/image/20141226/1419575533417494.jpg&quot; title=&quot;1419575533417494.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/upload/image/20141226/1419575534337971.jpg&quot; title=&quot;1419575534337971.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/upload/image/20141226/1419575534101124.jpg&quot; title=&quot;1419575534101124.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(27, '勿忘国耻 振兴中华 ——合作办学中心“首个国家公祭日”主题教育活动二', 1, 50, '勿忘国耻 振兴中华 ——合作办学中心“首个国家公祭日”主题教育活动二', '', 0, 0, 1419819875, 1419819875, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;首个南京大屠杀死难者国家公祭日刚刚过去，但我们的心情依旧难以平复。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;2014&lt;/span&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;年12月13日&lt;/span&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;合作办学中心开展了“首个南京大屠杀死难者国家公祭日”主题教育系列活动，为了让运动员学生加深了解那段不堪回首的历史，明白“落后就要挨打，发展才能自强”的道理，进而激发了全体运动员学生努力上进，将来报效祖国，圆梦中华的信心和决心，12月17日合作办学中心组织全体师生集体参观了南京大屠杀遇难同胞纪念馆。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;2014&lt;/span&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;年12月17日&lt;/span&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;，这是晴朗的一天，但我们却带着一颗沉重的心情……&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;清早，我们便乘车来到了位于南京城西江东门&amp;quot;万人坑&amp;quot;遗址纪念馆。馆外屹立着一排塑像，栩栩如生，向人们倾诉着日军的暴行。塑像上那些小孩子们，凄凉而无辜，恐惧而无助，让我们的心情不由自主的沉重起来。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;纪念馆保持原来的地形地貌，建筑似一座墓冢。学生排成长队进入纪念馆内，秩序井然，庄严而肃静。通过正门宽阔的广场，是兀然驻立的残缺的纪念碑，挣扎扭曲的一颗青铜头颅和一条胳膊半陷在鹅卵石中，300000的数字，令人触目惊心。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;我们怀着沉重的心情来到广场进行了简短的悼念活动，悼念活动由合作办学中心主任、栖霞中学副校长陆国平主持，首先，他简明扼要的介绍了南京大屠杀的这段历史。然后，敬献花圈，集体默哀，并向南京大屠杀死难同胞三鞠躬……&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;进入主馆，首先看到遇难的30万同胞的相片在一个花圈内，每12秒换一次。遍布洞眼的墙上密密麻麻写满死难者的名姓，此时的心情已有刚才的沉重变为沉痛。继续参观，看到一个令人发指的画面：心在痛，为这些无辜的先人；心还在痛，为古城南京所受的凌辱；心不停的在痛，为人性的脆弱，为人性的丧失。丧失人性的人……&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;进入下个展室里，重叠安息着两百多具死难者的骨殖。墙壁上有句约翰·拉贝先生的话：“可以宽恕，但不可以忘却。”是的！12月13日习总书记的讲话萦绕于耳“忘记历史就意味着背叛 否认罪责就意味着重犯” 哀悼逝者、警醒生者，在苦涩与悲哀中体味生命的重量，这既是对战争的反思，更是对和平的渴望。历史不会忘记，历史告诉未来！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;font-size: 16px; font-family: 宋体; color: rgb(68, 68, 68);&quot;&gt;今天，我们踏着这累累白骨穿过那不散的冤魂，历史让不曾凝固的血和没有回音的泣声在民族的记忆中永不磨灭。死者长已矣，生者以胜利告慰三十万同胞——中华民族已在世界的东方崛起！让我们牢记历史，振兴中华！！！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white; text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb627aa83.png&quot; title=&quot;1418889877117093.jpg&quot; alt=&quot;4.jpg&quot; style=&quot;border: 0px; color: rgb(68, 68, 68); font-family: 宋体;&quot;/&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: 宋体;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; white-space: normal; text-indent: 32px; line-height: 25px; background-color: white;&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: 宋体; text-align: center;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb62bdfa1.png&quot; title=&quot;1418889659988913.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb632a8ae.png&quot; title=&quot;1418889660624821.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(28, '训练中心开展纪念国家公祭日系列活动', 1, 50, '训练中心开展纪念国家公祭日系列活动', '', 0, 0, 1419819914, 1419819914, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; 今年的12月13日，是首个国家公祭日，是为了哀悼在1937年那场惨绝人寰的南京大屠杀中不幸遇难的30余万同胞。从12月8日起，训练中心围绕国家公祭日开展了多项活动，让运动员能了解历史、走近历史、铭记历史。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 12月8日，由中心党委副书记陈小航带队，中心陈玘等20余名党、团员代表来到中山码头南京大屠杀丛葬地进行哀悼活动；12月9日，中心多功能厅内济济一堂，运动员们在这里集体观看反映南京大屠杀史实的电影《南京南京》；12月13日公祭日活动当天，范瑛等20名运动员和社会各界人士一起，在中山码头参加江苏卫视的“国之祭”直播节目。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 正如运动员们在接受采访时候所说的，“铭记历史、珍爱和平是为了更好地感知当下的幸福生活，我们会将爱国之心表现在竞技赛场上，以实际行动报效祖国、建设祖国，为实现幸福中国梦而奋发图强。”&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb8919f3e.png&quot; title=&quot;1418698456127946.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;12月8日活动&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb8998204.png&quot; title=&quot;1418698456112403.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;12月9日活动&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0bb8a22a78.png&quot; title=&quot;1418698456365339.jpg&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;12月13日活动&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(29, '江苏省体育局训练中心贯彻落实党风廉政建设责任制实施办法', 1, 63, '江苏省体育局训练中心贯彻落实党风廉政建设责任制实施办法', '', 0, 0, 1419820049, 1419820049, '', 1, '#555', '#555', '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;第一章&amp;nbsp;指导思想和基本原则&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第一条&lt;/strong&gt;&amp;nbsp;为加强党风廉政建设，明确省体育局训练中心领导班子和领导干部对党风廉政建设应负的责任，保证中央、省委、省政府和省体育局关于党风廉政建设决策部署的贯彻落实，根据中共中央、国务院《关于实行党风廉政建设责任制的规定》及省委、省政府《贯彻中共中央、国务院&amp;lt;关于实行党风廉政建设责任制的规定&amp;gt;实施办法》和《省体育局贯彻落实党风廉政建设责任制实施办法》，结合我中心的实际，制定本实施办法。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二条&lt;/strong&gt;&amp;nbsp;落实党风廉政建设责任制，要以邓小平理论为指导，认真贯彻执行江泽民和胡锦涛同志关于新时期党风廉政建设的重要讲话精神，坚持“两手抓，两手都要硬”的方针，坚持中心党委统—领导、党政齐抓共管、办公室组织协调、部门各负其责、依靠群众支持和参与的领导体制和工作机制，把党风廉政建设作为党建工作的重要内容，纳入领导干部目标管理，与业务工作、精神文明建设和其他工作紧密结合，一起部署，一起落实，—起检查，一起考核。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第三条&lt;/strong&gt;&amp;nbsp;落实党风廉政建设责任制，要坚持从严治党、从严治政；立足教育，着眼防范；集体领导和个人分工负责相结合；谁主管，谁负责；一级抓一级，层层抓落实的原则。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;第二章&amp;nbsp;责任范围和内容&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第四条&amp;nbsp;&lt;/strong&gt;中心党政领导班子正职对中心党风廉政建设负总责，对中心党政领导班子成员的党风廉政建设负主要领导责任，同时要抓好各部门、各项目中心的党风廉政建设工作。各部门、各项目中心主要负责人对本单位的党风廉政建设负全面领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;领导班子其他成员根据分工，对职责范围内的党风廉政建设负直接领导责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第五条&lt;/strong&gt;&amp;nbsp;中心办公室牵头负责中心党风廉政建设的日常事务工作。办公室要充分发挥协调沟通、监督检查等职能，在中心各部门、各项目中心的配合下，定期交流信息，分析形势，研究工作，明确任务，不断推进党风廉政建设工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第六条&lt;/strong&gt;&amp;nbsp;中心党政领导班子正职在党风廉政建设中承担以下领导责任：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（一）切实管好职责范围内的领导干部，认真检查、监督其廉洁从政情况。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（二）认真执行民主集中制原则，凡重大事项、干部任用等重要问题，按照工作规则，应经集体讨论决定。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（三）每年召开领导班子民主生活会，认真检查执行党风廉政建设责任制情况，开展批评与自我批评，及时解决领导班子中存在的问题。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（四）模范遵守党纪国法，带头执行领导干部廉洁自律、廉洁从政的各项制度规定，接受组织和群众的监督。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（五）教育、管理好家庭成员和身边工作人员。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第七条&lt;/strong&gt;&amp;nbsp;中心党政领导班子其他成员在党风廉政建设中承担以下领导责任：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（一）协助正职领导干部抓好党风廉政建设，负责分管范围内的党风廉政建设，具体指导、督促和检查分管部门、项目中心党风廉政建设工作措施的制定和落实。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（二）深入调查研究，及时发现和解决职责范围内党风廉政建设存在的苗头性、倾向性问题并提出防范措施；参加分管部门、项目中心党内民主生活会帮助解决存在的问题。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（三）监督、检查和考核职责范围内的党风廉政建设责任制落实情况，对应当追究责任的，及时提出处理意见。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（四）对职责范围内发生的违法违纪案件和明令禁止的不正之风问题应及时制止、报告，并组织或配合有关部门进行查处。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（五）严格遵守党纪国法，带头执行廉洁自律、廉洁从政的各项制度，教育、管理好家庭成员和身边工作人员。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第八条&lt;/strong&gt;&amp;nbsp;各部门、各项目中心主要负责人在党风廉政建设中承担以下领导责任：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（一）根据中心党风廉政建设工作意见，对本部门党风廉政建设工作进行具体研究和安排。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（二）检查督促党风廉政建设各项任务和规章制度的落实。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（三）切实抓好党风廉政建设教育，管好职责范围内的干部；针对本部门党员、干部廉洁自律情况，执行谈话提醒制度，发现违纪苗头或群众意见较大的问题，及时给予提醒和纠正。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（四）严格遵守各项党风廉政建设法规制度，以身作则，自觉接受组织和群众监督。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（五）对职责范围内发生的违法违纪行为和明令禁止的不正之风问题应及时制止、报告，并配合有关部门进行查处。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;各部门、各项目中心副职协助正职领导抓好党风廉政建设工作，负责职责范围内党风廉政建设。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第九条&lt;/strong&gt;&amp;nbsp;中心办公室和人事教育部应认真履行职能，协助中心党委抓好党风廉政建设工作，积极主动搞好组织协调，对贯彻执行党风廉政建设责任制的情况进行监督、检查、考核，并针对存在的问题提出意见和建议。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;第三章&amp;nbsp;责任考核&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十条&lt;/strong&gt;&amp;nbsp;建立和完善党风廉政建设责任制执行情况考核制度。中心党委负责领导、组织对中心各部门、各项目中心主要负责人执行党风廉政建设责任制情况的考核工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十一条&lt;/strong&gt;&amp;nbsp;考核方式主要有年度考核和专项考核。考核结果作为人事教育部对领导干部业绩评定、奖励惩处、选拔任用的重要依据。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十二条&lt;/strong&gt;&amp;nbsp;年度考核可与年终干部考核工作结合进行，具体工作由人事教育部和办公室负责。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十三条&lt;/strong&gt;&amp;nbsp;专项考核工作由人事教育部会同有关部门进行。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十四条&lt;/strong&gt;&amp;nbsp;中心各部门、各项目中心每年应将落实党风廉政建设责任制的情况列入年度总结或工作报告，并报中心党委。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十五条&lt;/strong&gt;&amp;nbsp;中心领导干部每年召开一次专题民主生活会，将落实党风廉政建设责任制的情况作为民主生活会的一项重要内容；会前要做好充分准备、会上要如实报告个人落实党风廉政建设责任制情况和勤政廉政情况，认真自查自律，积极开展批评与自我批评。办公室和人事教育部派人参加民主生活会。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;第四章&amp;nbsp;责任追究&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十六条&lt;/strong&gt;&amp;nbsp;中心领导干部不履行或不正确履行党风廉政建设责任制规定职责的，应当对其实施责任追究。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十七条&lt;/strong&gt;&amp;nbsp;领导干部违反本办法，有下列情形之一的，给予批评教育，责令作出检查，情节较重的，给予相应的组织处理：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（一）对所分管部门、项目中心的党风廉政建设和对所属部门、项目中心干部廉洁自律、廉洁从政情况未实施有效监督、检查，对违反党风廉政建设有关规定的行为不纠正或纠正不力的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（二）不按规定召开、参加领导班子民主生活会，或者不主动检查执行党风廉政建设责任制情况，不开展批评与自我批评，不及时解决领导班子和自身存在的问题的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（三）对职责范围内发生的违法违纪案件和明令禁止的不正之风问题不及时报告，或者不组织和配合有关部门进行查处的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（四）直接管辖范围内发生重大案件，致使国家、集体资财和人民生命财产遭受重大损失或者造成恶劣影响的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（五）违反领导干部廉洁自律、廉洁从政有关规定，对配偶、子女、身边工作人员利用该领导干部职权和职务上的影响获取非法利益，造成恶劣影响，或者对配偶、子女、身边工作人员严重违纪知情不管的。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（六）其他违反《实施办法》的行为。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十八条&lt;/strong&gt;&amp;nbsp;领导干部在党风廉政建设任制年度检查考核中，经民主测评不称职票超过三分之一，或者连续两年未完成年度工作目标，工作实绩差、经组织考核认定为不称职的，应免去现任职务。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第十九条&lt;/strong&gt;&amp;nbsp;领导干部违反本办法，有下列情形之一的，给予党纪处分：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（一）对直接管辖范围内发生的明令禁止的不正之风不制止、不查处，或者查处不力，致使不正之风严重、群众反映强烈、长期得不到治理的，给予负直接领导责任的主要负责人警告、严重警告处分，情节严重的，给予撤销党内职务处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（二）对上级领导机关交办的党风廉政责任范围内的事项拒不办理的，或者对严重违法违纪问题隐瞒不报、压制不查的，给予负直接领导责任的主要负责人警告、严重警告处分，情节严重的，给予撤销党内职务处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（三）直接管辖范围内由于失职发生重大事故、恶性事件，致使国家、集体资财和人民群众生命财产遭受重大损失或者造成恶劣影响的，给予负直接领导责任的主要负责人严重警告、撤销党内职务或者留党察看处分。造成巨大损失或者特别恶劣影响的，加重处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（四）违反《党政领导干部选拔任用工作条例》规定选拔任用干部，用人失察失误，造成严重后果的，给予负直接领导责任的主要负责人警告、严重警告处分；情节严重的，给予撤销党内职务处分；提拔任用明显有违纪违法行为的人的，给予严重警告、撤销党内职务或者留党察看处分。情节严重的，给予开除党籍处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（五）授意、指使、强令下属人员违反财政、金融、税务、审计、统计法规，弄虚作假的，给予负直接领导责任的主要负责人警告、严重警告处分；情节较重的，给予撤销党内职务处分；情节严重的，给予留党察看或者开除党籍处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（六）授意、指使、纵容下属人员阻挠、干扰、对抗监督检查或者案件查处，或者对办案人员、检举控告人、证明人打击报复的，给予负直接领导责任的主要负责人严重警告或撤销党内职务处分，情节严重的，给予留党察看或者开除党籍处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;（七）对配偶、子女、身边工作人员严重违法违纪包庇、纵容的，给予撤销党内职务处分，情节严重的，给予留党察看或者开除党籍处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;其他违反中央和省有关党风廉政建设责任制规定的行为，凡是法律、法规、规章已有规定的，依照其规定处理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;具有上述情形之一，需要追究政纪责任的，比照所给予的党纪处分给予相应的行政处分；对担任党政双重领导职务的责任追究对象，情节严重的，应当同时给予党纪、政纪处分；涉嫌犯罪的，移交司法机关追究刑事责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二十条&lt;/strong&gt;&amp;nbsp;领导干部违反《实施办法》的，由其所在部门领导或者中心有关部门负责查清情况，按照干部管理权限、处分审批权限及有关程序，追究有关人员的责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;需要作出批评教育，责令作出检查处理的，按谁主管、谁负责的原则办理；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;需要作出组织处理的，由人事教育部提出意见，提请任免机关研究决定；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;需要追究纪律责任的，由办公室调查处理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二十一条&lt;/strong&gt;&amp;nbsp;实施责任追究应分清集体责任与个人责任、主要领导责任与重要领导责任，不得以集体责任代替个人责任。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;领导干部对职责范围内发生的问题，敢于揭露，主动查处，挽回损失，认真整改的，可以酌情从轻、减轻或者免予处理。对职责范围内发生的问题进行掩盖、袒护、不查不究，造成严重后果的，应从重或加重处理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;实施责任追究应注意听取本人意见和申辩。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二十二条&lt;/strong&gt;&amp;nbsp;实施责任追究不受领导干部的职务变化和任职期限的限制。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二十三条&lt;/strong&gt;&amp;nbsp;办公室和人事教育部负责对本办法的执行情况进行监督检查，对应该追究责任故意不追究的，依照有关规定给予负直接领导责任的主管人员纪律处分。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;第二十四条&lt;/strong&gt;&amp;nbsp;各级党组织和行政职能部门应将实施责任追究的情况及时向中心党委作出书面报告，同时送人事教育部备案。对领导干部实施责任追究的有关材料，按规定归入干部档案。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(30, '江苏省体育局训练中心对外宣传工作管理规定', 1, 64, '江苏省体育局训练中心对外宣传工作管理规定', '', 0, 0, 1419820081, 1419820081, '', 1, '#555', '#555', '&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;为规范对外宣传工作，树立中心的良好形象，更好地服务于中心工作大局，结合中心实际，制定本规定。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第一条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;中心的对外宣传工作要坚持以&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;“三个代表”&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;重要思想和科学发展观为指导，围绕中心重点工作，按照客观、及时、全面、适度的原则，通过报纸、电视、网络等媒介，向社会发布中心所取得的工作业绩、重大活动的进展情况和为广大公众关心的其他信息，不断扩大中心的知名度、美誉度和影响力。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第二条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;中心对外宣传实行归口管理，中心办公室负责日常具体工作。中心办公室要按照&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;“统一渠道、统一口径、统一规范、统筹安排”&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;的原则，认真细致地做好宣传计划制定、新闻单位人员接待、稿件把关等工作。未经同意，任何部门、任何人不得擅自接待、接受新闻单位的采访、报道。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第三条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;各部门、各项目中心每个季度初期制定本部门的宣传计划，经中心办公室汇总后，报中心主要领导审批实施。未列入计划的中心重大活动或其他相关宣传事项，由办公室制定宣传方案，报中心主要领导同意后实施。对于新闻单位的即席、随机采访，凡涉及到中心工作的，要事先报告，谨慎措词，不留漏洞。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第四条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;各部门、各项目中心需要进行对外宣传报道，或应邀接受新闻单位采访时，需将宣传报道、接受采访的时间、地点、内容等提前上报中心办公室。对中心统一安排的宣传报道和采访活动，有关部门、项目中心和人员要根据宣传要求，积极提供资料，按时接受采访，主动做好配合工作。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第五条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;新闻单位来我中心采访，由中心办公室进行协调。一般情况下，应认真查验来人相关采访证件，并及时与被采访部门或个人取得联系。新闻单位在征得中心主要领导、被采访部门或个人同意后，方可进行采访。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第六条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;中心实行新闻稿件把关制度。中心邀请采访或新闻单位主动采写的稿件，由中心办公室负责审核。中心各部门、各项目中心接受新闻单位采访后形成的稿件，由部门、项目中心负责人审核后，报中心办公室复审。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第七条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;各项目中心所有对外宣传报道的内容必须客观、公正、真实、准确。遇到重大问题、敏感问题、突发事件以及容易引发矛盾和各类负面影响的事项，任何部门、任何人不得擅自对外发布消息。未经批准接受采访，并给中心造成不良影响的，将视情节轻重追究相关人员的责任。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第八条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;各部门、各项目中心要增强对外宣传意识，加强队伍建设，积极推动对外宣传工作。中心鼓励各部门、各单位在符合本规定的情况下，通过多种形式开展对外宣传工作，并对在宣传工作中取得显著成绩的部门和个人，给予一定的表彰奖励。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 43px;line-height: 39px&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;第九条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-family:Times New Roman&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_GB2312&quot;&gt;本规定由办公室负责解释。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(31, '江苏省体育局训练中心优秀运动队联合办队经费管理暂行规定（试行）', 1, 66, '江苏省体育局训练中心优秀运动队联合办队经费管理暂行规定（试行）', '', 0, 0, 1419820381, 1419820381, '', 1, '#555', '#555', '&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 29px;line-height: 43px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;江苏省体育局训练中心优秀运动队&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 29px;line-height: 43px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;联合办队经费管理暂行规定（试行）&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第一章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;总&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;则&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第一条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;随着我国竞技体育改革的不断深化和发展，优秀运动队面临的社会环境、经济环境发生了根本性的变化。多年以来，许多运动项目充分利用优秀运动队的声誉与各类工商企业、文体产业、高等院校等合作，采用多种形式联合办队，得到了外部的经费资助，从而拓宽了办队资金的来源渠道，增强了办队能力，为体育事业发展提供了资金保证。为了进一步加强财务管理，充分利用各运动项目无形资产的优势，更好地发挥联合办队经费的使用效益，促进运动队伍的建设和发展，健全民主理财机制，制定本规定。本规定中所指中心是指训练中心，各项目管理中心简称项目中心。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第二条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费管理原则&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（一）联合办队经费的分配及使用，必须有利于运动队伍的训练和比赛，有利于促进竞技水平的提高和运动队伍的管理和建设。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（二）联合办队经费分配及使用，必须兼顾国家、集体、个人的三者利益。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（三）&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;对性质不同的联合办队经费实行分类管理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第三条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;优秀运动队与各类工商企业、文体产业、高等院校等联合办队，必须签订合同。合同由经办单位留存，交中心办公室、训练竞赛部备案，同时将合同副本（或复印件）交财务科备查。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第四条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费必须由中心财务科收取，并出具合法票据。财务帐目由中心财务科统一管理，并建立明细帐进行分户核算。&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第二章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队的类型&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第五条&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;随着我国竞技体育改革的不断深化，联合办队的形式越来越多，从目前的情况看，中心联合办队主要有下列几种类型：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（一）赞助式联合办队&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;这一种联办形式的主要特征是：资（赞）助单位定期对运动队投入一定数额的资金，用于改善运动队的训练、比赛、生活等基本条件；运动队以资（赞）助单位名义冠名，并以此名称参加国家体育总局允许的国内各类比赛，帮助资（赞）助单位提高其知名度和社会影响，使资（赞）助单位的有形资产、无形资产与优秀运动队、杰出运动员的声誉珠联璧合，从而达到互惠互利、共同发展的目的。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;二）非职业俱乐部&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;这一种联办形式的主要特征是：资（赞）助单位对运动队投入较大数额的资金，帮助运动队成立以资（赞）助单位名义冠名的俱乐部，并以此名称参加全国俱乐部联赛，借此提高资（赞）助单位的知名度并扩大其社会影响。运动队按照俱乐部章程和中心有关规定，使用资（赞）助单位提供的资金参加全国俱乐部联赛，并改善运动队的训练、比赛、待遇等条件，促进运动技术水平的提高。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（三）体育人才交流&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;这一种形式的主要特征是：经过有关审批程序，兄弟省市运动队(或体育协会)&amp;nbsp;投入一定数额的代训、代管资金，和我中心运动队进行运动员人才交流，并确定比赛任务指标，运动员注册在其他省市运动队(或体育协会)名下，并代表其他省市运动队(或体育协会)参加全国各类比赛；运动员仍由我中心运动队负责训练、比赛和日常管理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（四）体育人才转会&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;这一种形式的主要特征是：经过有关审批程序，兄弟省市运动队(或体育协会)&amp;nbsp;投入一定数额的资金，和我中心运动队进行运动员人才交流，运动员注册在其他省市运动队(或体育协会)名下，代表其他省市运动队(或体育协会)参加全国各类比赛，运动员由其他省市运动队(或体育协会)负责训练、比赛和日常管理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第三章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费的分配及使用&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第六条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费（净收入）的分配比例&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（一）赞助式联合办队经费的分配比例&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;万元以下，中心不提取，全部由班队留用。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;万元以上部分，中心提取10%，班队留用90%。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（二）非职业俱乐部联赛经费的分配比例&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;中心提取10%，班队留用90%。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（三）体育人才交流经费的分配比例&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;中心提取20%，班队留用80%。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（四）体育人才转会费的分配比例&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;中心提取70%，班队留用30%。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第七条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费的使用比例&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（一）按合同规定的金额，中心税后金额提取部分,进入中心事业基金，由中心领导统筹安排。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（二）班队留用的部分，按以下比例使用：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;、40%作为事业发展基金，以弥补事业经费的不足。其中30%做为后备人才发展基金，用于后备人才培养费、二、三线教练员训练补贴等方面。20%用于攻关经费，特殊人员的奖励、津贴等。50%部分用于购置训练设备、运动器材以及办公用品、计划外比赛旅费、弥补承办比赛经费不足等。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;、50%作为奖励福利基金，用于运动队个人的服装、伙食营养补贴、训练补贴及比赛奖励等等。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;、10%作为业务接待基金，用于联系业务中的活动经费和赞助联系费以及答谢资（赞）助单位费用等。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 42px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第四章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费的审批权限及审批程序&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第八条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;为了加强对联合办队经费的管理，健全民主理财机制，各班队应成立由项目中心负责人、项目负责人（领队或总教练）、教练员、运动员等人员参加的班队财务管理小组（组成人员不得少于3人），加强联合办队经费的管理和使用。项目中心负责人为班队财务管理小组的负责人。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第九条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;各班队财务管理小组根据联合办队经费分配和使用比例，结合实际需要，提出经费使用方案，经中心财务科审核，报分管领导审批。经费使用方案未经审核、审批，不得执行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十条&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;填写“费用报销单”报销的各项开支，必须符合财会制度的规定、取得合法的票据，并注明报销内容及用途，开据的票据必须真实反映使用情况，不得套取现金。由两名经办人员签字，各项目中心负责人审批签字后，在中心财务科办理结算手续。使用过程中，中心财务科有权对不明事项票据提出质疑，班队需做出合理解释，如未能合理解释，财务科将拒绝报销。报销金额在2000元以上的，同时报中心分管领导审批。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十一条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;填写“报销表”发放的津贴、奖金、非职业俱乐部人员薪金、攻关咨询费等，按以下办法执行：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（一）在事先上报的经费使用方案中，如有按月发放、相对固定的津贴、薪金计划表（人员姓名、发放标准或浮动标准），可以由两名经办人造表，经主教练审核，项目中心负责人审批签字后，在中心财务科办理结算手续。造表与原计划出入较大的，需附情况说明。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;（二）奖金、攻关咨询费等，由各队项目负责人造表签字，经项目中心负责人审核签字，同时报中心分管领导审批。审批手续完备后，在中心财务科办理结算手续。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十二条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费的分配比例，原则上不作调整。如遇特殊情况，需要变更经费分配比例，班队财务管理小组应提出书面申请陈述原由，经训练竞赛部、财务科审核后提出建议，报中心领导审批。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十三条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;班队留用经费的使用比例和使用范围，不得随意突破。若要改变经费开支项目的用途，或调整经费的使用比例，班队财务管理小组应提出书面申请、经训练竞赛部、财务科审核后，报中心分管领导审批后执行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第五章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队经费的检查和监督&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十四条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;财务科定期向各项目管理中心、各班队公布联合办队经费的收、支、结存情况。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十五条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;各班队财务管理小组应指定专人负责联合办队经费的登记、报销工作，并定期向全队教练员、运动员公布经费使用情况和结余情况。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十六条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;班队借用公款要及时结帐，严禁超额使用。联合办队经费不得超支。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十七条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;联合办队等经费必须纳入中心财务科统一管理，严禁借用帐户或以个人名义设置帐外帐、私设小金库。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十八条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;各班队必须真实、准确、完整地反映联合办队经费的收、支、结存情况，切实加强经费的管理和使用，严格执行《会计法》和有关财经纪律，并保持联合办队经费的收支平衡，同时必须接受训练竞赛部、财务科的指导和监督。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第十九条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;每一会计年度终了之后，训练竞赛部、财务科将对各班队联合办队经费使用情况进行审计。对于违反《会计法》和有关财经纪律的班队和个人,视情况轻重给予警告、限期整改、冻结资金等处罚。情节特别严重的，将按有关纪检规定和程序进行严肃处理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px;text-align: center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第六章&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;附&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px&quot;&gt;&lt;span style=&quot;font-family:宋体&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;则&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第二十条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;其他未尽事宜，经讨论协商后，再作补充规定。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第二十一条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;本规定由中心训练竞赛部、财务科在各自范围内负责解释。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;第二十二条&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;本规定2007年1月1日起执行。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;;padding: 0px;vertical-align: middle;font-family: Arial, ����;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 40px;line-height: 21px&quot;&gt;&lt;span style=&quot;font-size: 21px;line-height: 31px;font-family: 仿宋_GB2312&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(32, '训练中心雪灾天气应急预案', 1, 67, '训练中心雪灾天气应急预案', '', 0, 2, 1419820423, 1419820423, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;为加强极端天气灾后的应急处置能力，迅速恢复中心内部基本通行，满足运动队训练需要，结合训练中心实际情况制订本预案。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;一、&lt;strong&gt;应急领导小组成员&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;组&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;长：中心负责人&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;副组长：中心各副主任&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;成&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;员：各项目中心、各部门负责人&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;二、应急领导小组职责&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;组长：统筹调动应急处置资源，指挥、组织和协调小组成员清扫积雪，部署排除因雪灾造成的安全隐患等工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;副组长：协调分管各部门的除雪和排险工作，完成组长交办的其他工作任务。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;中心办公室主任：发布扫雪通知，传达上级对处置灾情的各项指令，向上级部门报告或通报有关灾情的发展，组织相关部门对灾情损失进行统计和评估。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;后勤保障部部长：协助指挥各小组成员扫雪、排障工作，适时备齐扫雪工具，组织开展灾前预防和灾后恢复工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;其他成员：组织所在部门和科室人员清除道路及道路两侧树木积雪，统计并向中心办公室上报所负责区域损失情况。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;三、应急小组工作部署&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（一）应急工作保障标准：中心锦绣大道和前程大道主干道清扫路面积雪宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米，撒放除雪盐防止路面结冰，保障&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;17&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;座以上大客车单向行使；各场馆周边消防通道积雪清扫宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米，撒放除雪盐防止路面结冰，保障&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;17&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;座以下小型客车单项行驶；办公、训练、生活等设施间连接的人行通道清扫宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米并铺设防滑草；道路两侧树梢的积雪用除雪竹竿打落。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（二）物资储备及发放：除雪物资由后勤保障部职能科室统一保管和补充，根据气象预报情况提前分配至除雪物资的分发点。各分发点按照&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;应急保障区域划分表&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;发放临近地点的除雪物资并负责领用和回收工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（三）应急保障区域划分：参照&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;应急保障区域划分表&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;执行。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;四、其他&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（一）参加扫雪工作的内协作单位，由后勤保障部协调。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（二）本预案自颁布日起施行。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;text-indent: 21pt; line-height: 1.5;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;858&quot; interlaced=&quot;disabled&quot; style=&quot;width: 742px;&quot;&gt;&lt;colgroup&gt;&lt;col width=&quot;39&quot; style=&quot;width: 39px;&quot;/&gt;&lt;col width=&quot;91&quot; style=&quot;width: 91px;&quot;/&gt;&lt;col width=&quot;366&quot; style=&quot;width: 367px;&quot;/&gt;&lt;col width=&quot;79&quot; style=&quot;width: 79px;&quot;/&gt;&lt;col width=&quot;193&quot; style=&quot;width: 193px;&quot;/&gt;&lt;col width=&quot;90&quot; style=&quot;width: 91px;&quot;/&gt;&lt;col width=&quot;114&quot; style=&quot;width: 115px;&quot;/&gt;&lt;/colgroup&gt;&lt;tbody&gt;&lt;tr height=&quot;27&quot; class=&quot;firstRow&quot; style=&quot;height: 27px;&quot;&gt;&lt;td height=&quot;27&quot; width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td colspan=&quot;6&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;应急保障区域划分表&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;序号&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;部门/科室&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;保障区域&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;联系人&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;联系电话&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;现场协调&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;物资交接点&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;4&quot; height=&quot;77&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;1&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;中心办公室&lt;/td&gt;&lt;td rowspan=&quot;4&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自中心南大门起沿前程大道至中心广场入口，及田径馆南门至田径辅房沿线消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;汪&amp;nbsp; 泳&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913988200 &amp;nbsp; （660099）&lt;/td&gt;&lt;td rowspan=&quot;5&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;汪&amp;nbsp; 泳&lt;/td&gt;&lt;td rowspan=&quot;5&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;南门，铁锹12把，雪铲8把&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;田管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;邹尔莉&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13515119903&amp;nbsp; (660188)&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;保卫科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;谢&amp;nbsp; 旺&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13584069977 &amp;nbsp; （669977）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;20&quot; style=&quot;height: 20px;&quot;&gt;&lt;td height=&quot;20&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;供应科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;张恒运&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13805160700 &amp;nbsp; （666336）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;2&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;仙林体校&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;中心广场入口至少仙林体校东口和多功能厅门前&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;孙&amp;nbsp; 霞&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851721902 &amp;nbsp; （666303）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;4&quot; height=&quot;76&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;3&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;人教部&lt;/td&gt;&lt;td rowspan=&quot;4&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自中心广场入口起沿锦绣大道至聚仙楼和登山道叉路口&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;魏兆欣&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851811903 &amp;nbsp; （668505）&lt;/td&gt;&lt;td rowspan=&quot;8&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;魏兆欣&lt;/td&gt;&lt;td rowspan=&quot;15&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;南门，铁锹8把，雪铲12把，编织袋&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;篮管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;胡竹青&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913833430 &amp;nbsp; （662233）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;乒管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;吴九桂&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851967909 &amp;nbsp; （666302）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;排管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;戎金文&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13601406789 &amp;nbsp; （666198）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;4&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;设备科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自聚仙楼和登山道叉路口起沿锦绣大道至中心西大门&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王久文&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951622139&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;5&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;医务科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自医务科、聚仙楼入口至登山道叉路口&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王&amp;nbsp; 富&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13611507975（ &amp;nbsp; 607975）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;2&quot; height=&quot;38&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;6&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;车队&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自行车赛场车队门前区域至中心西大门&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;蔡全龙&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13770507779 &amp;nbsp; （667779）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;基建工程&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;陈小雷&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;18914769509&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;3&quot; height=&quot;57&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;7&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;武管中心&lt;/td&gt;&lt;td rowspan=&quot;3&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自聚仙楼和登山道叉路起沿A、B馆西侧消防通道至综合训练馆入口及A、B馆南侧消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;殷建伟&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951899640 &amp;nbsp; （666445）&lt;/td&gt;&lt;td rowspan=&quot;7&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;殷建伟&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;举重中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;李顺柱&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13584010077 &amp;nbsp; （600077）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;场馆科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;朱啟林&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;18914769518 &amp;nbsp; （666311）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;8&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;产业科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;综合训练馆入口至转训中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;曲宏英&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913978677 （600222）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;3&quot; height=&quot;57&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;9&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;综合科&lt;/td&gt;&lt;td rowspan=&quot;3&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;沿锦绣大道自中心广场入口起至行政楼东侧消防通道，及行政楼入口两侧通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;陈东晓&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;15951600888 &amp;nbsp; （668888）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;资产科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;周建华&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;15996230185&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;财务科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王&amp;nbsp; 蓓&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913948850&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;40&quot; style=&quot;height: 40px;&quot;&gt;&lt;td height=&quot;40&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;10&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;训竞部&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自运动员公寓西出口沿公寓平台、台阶至公寓辅楼的消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;刘东峰&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851905201 &amp;nbsp; （668105）&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;刘东峰&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;东门，铁锹8把，雪铲6把，编织袋&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;32&quot; style=&quot;height: 32px;&quot;&gt;&lt;td height=&quot;32&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;11&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;膳食科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;沿锦绣大道自行政楼东侧消防通道起至运动员公寓西出口，含运动员公寓与食堂间通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;杨洪波&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951891140 &amp;nbsp; （606606）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;注：工业盐由保卫科派专人统一使用&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;undefined&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;undefined&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;text-indent: 21pt; line-height: 1.5;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/uploads/image/20140208/20140208094126_90620.jpg&quot; width=&quot;800&quot; height=&quot;547&quot; alt=&quot;&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/uploads/image/20140208/20140208094142_10126.jpg&quot; width=&quot;800&quot; height=&quot;574&quot; alt=&quot;&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;img src=&quot;http://www.jstx.org/uploads/image/20140208/20140208094111_14350.jpg&quot; width=&quot;800&quot; height=&quot;530&quot; alt=&quot;&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(33, '在局训练中心教育实践活动动员大会上的发言', 1, 69, '在局训练中心教育实践活动动员大会上的发言', '', 0, 0, 1419820569, 1419820569, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;各位领导，各位同志：&lt;span p=&quot;&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot; span=&quot;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;一是要用习总书记重要讲话精神统一思想、提高认识。&lt;/strong&gt;充分认识开展党的群众路线教育实践活动，是实现党的十八大确定的奋斗目标的重要举措，是保持党的先进性和纯洁性、巩固党的执政基础和执政地位的必然要求，也是解决群众反映强烈的突出问题的必然要求。开展大规模的学习教育活动是我们党的优良传统，回顾近些年的教育活动，我们印象比较深的主要有：&lt;span span=&quot;&quot;&gt;”&lt;/span&gt;教育活动、&lt;span span=&quot;&quot;&gt;”&lt;/span&gt;重要思想学习教育活动、保持共产党员先进性教育活动、学习贯彻科学发展观活动，这些教育活动先后都对开展思想理论武装、统一党员干部的思想，解决当时党内国内存在的种种问题，团结带领全党全国人民完成阶段性目标任务起到了无可替代的推动作用。现在以习近平同志为总书记的党中央确定在全党开展群众路线教育实践活动，就是为了克服党内存在的&lt;span span=&quot;&quot;&gt;”&lt;/span&gt;问题，团结带领全党全国人民完成十八大确定的目标任务。所以，我们党员干部要以强烈的政治意识和大局意识投入到教育实践活动中来，要切实增强开展教育实践活动的紧迫感、使命感和责任感，要清醒认识到在领导作风、党群关系等方面存在问题的严重性和危害性，既要看到各级党组织、党员干部主流是好的，党群关系是好的，同时也要清醒地看到一些地方领导作风、党群关系存在的突出问题，必须采取切实可行的措施加以解决。&lt;span p=&quot;&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot; span=&quot;&quot;&gt;“&lt;/span&gt;照镜子、正衣冠、洗洗澡、治治病&lt;span span=&quot;&quot;&gt;“&lt;/span&gt;查表现、论危害、挖根源、抓整改&lt;span span=&quot;&quot;&gt;,&lt;/span&gt;带头开展好活动。各级领导班子成员要作示范、作表率&lt;span span=&quot;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;三是要以整风精神开好民主生活会。&lt;/strong&gt;开展好批评与自我批评，要在精心准备的基础上召开一次高质量的专题民主生活会，做到开展自我批评不避重就轻、避实就虚，开展批评不讲空话、套话、官话和废话，开门搞活动&lt;span span=&quot;&quot;&gt;“&lt;/span&gt;四风&lt;span span=&quot;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;四是要注意统筹兼顾，努力推动工作。&lt;/strong&gt;把开展教育实践活动作为解放思想、改进作风、推进工作的好机会，既要把活动抓出成效、抓出特色、抓出影响，又要把党员干部在活动中激发出来的工作热情、进取精神转化为做好工作的动力，以教育实践活动推动十二届全运会任务的完成，切实做到参加决赛、夺取金牌，学习教育、精神文明双丰收，出色完成省体育局下达给局训练中心的全运会任务，向省委省政府和全省人民交上一份满意的答卷，为局训练中心的旗帜上争光添彩。&amp;lt;span &amp;quot;=&amp;quot;&amp;quot;&amp;gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;五是加强组织领导，切实抓好落实。&lt;/strong&gt;各单位主要负责人是教育实践活动的第一责任人，要切实担负起第一责任人的责任，对教育实践活动要亲自过问、亲自组织、亲自落实、亲自督促、亲自检查，不能随大流甩大手。要把教育实践活动与本单位的工作一同筹划、一同推进。要处理好学习与工作的关系，统筹计划和落实，防止出现抓工作挤掉学习，也防止抓学习耽误工作，要做到两手抓、两手硬，做到教育实践活动和训练比赛两手抓、两不误、两促进。要加强教育学习的管理和督促，建立必要的考勤、登记和学习笔记，对因公出差人员，要及时组织补课学习，做到学习内容、时间、人员、效果四落实。要通过这次教育实践活动使每个党员干部的理论素养得到明显提升，精神状态得到明显提振，干群关系得到明显密切，工作作风得到明显改观，党员干部的作用得到明显发挥，工作成效得到明显飞跃。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(34, '省体育局训练中心关于进一步加强廉政建设的通知', 1, 70, '省体育局训练中心关于进一步加强廉政建设的通知', '', 0, 1, 1419820601, 1419820601, '', 1, '#555', '#555', '&lt;p&gt;&lt;strong&gt;省体育局训练中心关于进一步加强廉政建设的通知&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;各项目中心，各运动队，各部门：&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 为进一步加强省体育局训练中心（以下简称“中心”）廉政建设，根据省体育局文件精神（苏体办[2009]33号）和相关规定，结合我中心实际，现提出如下要求：&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;一、切实加强因公出国（境）管理&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（一）严格加强因公出国（境）管理。&lt;/strong&gt;根据省体育局文件要求，严格控制出访批次、出访时间、团组人数和活动日程，认真执行出访邀请的相关规定，严格核报出访费用。因公出国（境）经费支出要在近2年平均数的基础上降低20％。加强对出访活动的核查工作，配合省体育局做好出访人员证件管理工作。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;二、严格规范公务接待活动&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（二）严肃公务接待纪律。&lt;/strong&gt;严格执行中央、省委、省政府和省体育局关于厉行节约、反对奢侈浪费的有关通知精神，牢固树立过紧日子的思想，从严控制各种公务活动支出特别是公务接待支出。严禁用公款大吃大喝，做到不讲排场、不摆阔气，杜绝浪费，严禁用公款支付高消费娱乐活动。中心范围内，禁止上下级之间，部门、项目中心和运动队之间借各种名义用公款相互吃请。不得报销应由个人支付的餐费。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（三）严格控制公务接待范围和接待标准。&lt;/strong&gt;坚持热情礼貌、廉洁节约、对口接待原则，合理安排接送、食宿、交通等各个环节，严格控制公务接待规模、范围和陪同人数，严禁超标准、超范围接待。接待用餐和住宿原则上安排在中心内部。工作日午餐接待原则上安排工作餐，并严格执行工作日午餐禁止饮酒的规定。会议（培训）接待用餐实行自助餐，住宿安排标准间。公务接待费总额在2008年基础上下浮10%。各项目中心需控制各运动队赞助费中接待费用的比例。财务科每月通报各项目中心、各部门的接待费用。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（四）建立公务接待报批制度。&lt;/strong&gt;各部门、各项目中心接待外事活动、大型会议（活动）、团队来访、国内外重要来宾，或从事其他与中心有直接关系的公务接待活动，应事先报中心办公室。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（五）严格签报程序。&lt;/strong&gt;履行项目中心、部门负责人签报制度，超过接待标准的要经中心分管领导批准同意。严格报账制度，凭食堂、接待中心提供的手续齐全的餐单、住宿单办理报账。会议接待支出，应在会后一周内结清，并据实出具食宿费、会场费等分项开支单据，实行一会一结，不得累计结算。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;三、进一步细化公务用车管理规定&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（六）降低公务用车支出。&lt;/strong&gt;按照“总量控制、超支不补”的原则，实行定额管理，中心车辆购置及车辆运行费要在近2年平均数的基础上降低15%。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（七）规范公务车辆购置管理。&lt;/strong&gt;按照勤俭节约和保障公务活动需要的原则，核定公务用车编制，规范配备标准，不准超编制、超标准配备公务用车。购置公务车辆须列入当年预算，未列入当年预算的一律不予购置。新购车辆须按规定办理固定资产登记手续，报废车辆须严格履行规定的审批手续。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（八）加强公务车辆使用管理。&lt;/strong&gt;严格执行《江苏省体育局训练中心车辆使用规定》，从严控制公务用车使用范围，规范用车程序。严禁公车私用，不准用公车进行旅游、接送子女上学等活动。中心车辆需由车队指派专职驾驶员驾驶，未经中心领导批准，任何人不得私自驾驶公车。严格控制长途用车，长途用车须经中心领导签字同意。用车须提前预约，小车一天，大车三天，用车前须事先填写派车单，经项目中心或部门负责人签字后方可派车。车队凭填写完整、手续齐全的派车单结算费用。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（九）加强公务车辆运行管理。&lt;/strong&gt;后勤保障部车队统一负责车辆的使用、管理、调度、检修等有关事宜。建立、完善车辆管理台帐，每月定期公布单车行驶里程、维修费和油料费支出情况，及时对车辆进行检修和维护保养，使车辆始终保持良好状态。实行定点维修和一车一卡定点定车加油制度，采用逐车逐月核定行驶里程和用油额度的方式，严格控制维修费和油料费。选择经济的行车路线，根据实际人数合理安排车辆。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;四、深入推进作风行风建设&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十）进一步改进工作作风。&lt;/strong&gt;建立健全中心领导班子成员联系项目中心制度，帮助运动队发现问题、研究问题、解决问题。深入基层和群众开展调查研究，察实情、出实招、办实事、求实效，引导广大干部职工凝心聚力干事创业。建立重点工作“一名领导挂帅，一套工作班子，一抓到底”的推进模式，明确责任分解，倒排工作计划，强化推进措施，严格绩效考核，真正形成人人有责任、层层抓落实的长效机制。进一步完善重大事项决策的规则和程序，坚持民主决策制度，重大问题集体研究决定，依靠集体智慧实行科学民主决策，提高决策的透明度和公信度。采取多种方式对重点工作和事项的进展与完成情况进行动态督查，定期通报，跟踪问效，确保不留死角，不留空档。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十一）扎实推进学习型单位建设。&lt;/strong&gt;进一步巩固和发展学习实践科学发展观活动成果，深化对科学发展观的科学内涵、精神实质和根本要求的理解，增强贯彻落实科学发展观的自觉性和坚定性。在学习新知识上下功夫，加强干部职工对现代金融、国际经济、危机管理、社会管理等方面知识的学习研究，使干部职工努力适应新形势、新任务的需要。在学用结合上下功夫，引导干部职工干一行、爱一行、学一行、钻一行，不断增强做好本职工作的本领。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十二）深入开展文明创建活动。&lt;/strong&gt;建立符合岗位实际的工作人员行为准则，执行道德规范，保持文明形象。广泛开展丰富多彩、积极向上的文体活动，继续组织“最佳党日”活动，提升活动品牌质量。深入开展学习型、创新型、节约型、服务型、和谐型文明单位创建达标活动，努力营造文明、和谐的体育行业文化。确保在各级各类比赛中获得体育道德风尚奖，创建精神文明运动班队。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十三）进一步严肃赛风赛纪。&lt;/strong&gt;严格执行赛风赛纪和反兴奋剂工作的各项规定，对参赛运动员、教练员加强监督，树立靠自身实力和稳定发挥取胜的理念，杜绝比赛中不服裁判、无理取闹、拒绝领奖等问题的发生。加大反兴奋剂宣传教育工作力度。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;五、不断提高行政管理水平&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十四）大力推动权力公开运行。&lt;/strong&gt;进一步加强组织领导，落实工作职责，创新工作方法，确保行政权力公开透明运行。对每项行政权力运行规程进行优化规范，从行使依据、内容、程序、节点、时限等方面，进一步优化权力路径，简化办理程序。不断完善责任追究、监督审查等制度建设，规范行政行为，基本建立权责明晰、程序严密、运行公开、制约有效的行政权力公开透明运行机制。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十五）切实提高行政效能。&lt;/strong&gt;根据工作职责、岗位要求和承担任务，进一步完善岗位职责、工作标准、工作流程、限时办结、服务承诺和问责追究等制度。认真贯彻落实省政府《关于进一步改进会风文风的规定》，按照《省体育局关于改进会风文风的实施意见》要求，精简会议和文件，提高会议效率和发文质量。进一步规范办理请示、报告等工作程序，提高公文运转、批件办理的工作速度。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;六、不断加大反腐败教育防范力度&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十六）继续加大廉政建设和反腐败教育力度。&lt;/strong&gt;通过专家学者报告会、理论研讨、观看录像、参观考察等多种形式，教育广大党员特别是处以上领导干部，牢固树立正确的世界观、人生观、价值观，提高党性修养，正确对待手中权力，筑牢反腐败思想道德防线，做到警钟长鸣。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十七）着力推进反腐倡廉制度建设。&lt;/strong&gt;以学习《建立健全惩治和预防腐败体系2008-2012年工作规划》为抓手，按照“从源头上预防和治理腐败”的指导思想，在各项制度的制定、修改过程中始终坚持反腐倡廉的原则不动摇，积极从制度设计上防止腐败现象的发生。严格执行《江苏省体育局训练中心贯彻落实党风廉政建设责任制实施办法》，认真落实责任追究，对违反制度造成严重后果和不良影响的，对照相关规定进行追究，坚决维护制度的严肃性。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十八）不断加强反腐倡廉监督检查。&lt;/strong&gt;对工程招标、物品采购、运动员招收等事关人权、财权、物权的重点部位和领域进行密切监管，做到严格程序、集体决策、规范审批，主动接受群众监督，杜绝“暗箱操作”，努力铲除不正之风和腐败行为滋生的土壤。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;七、大力推动节能降耗工作&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（十九）大力落实节电节水措施。&lt;/strong&gt;根据运动队训练的时间、人数、室温等实际情况开关场馆的空调、暖气、灯光等设施设备，每天训练结束后要切断电源和水源。清洗场馆玻璃外墙改用节水的冲洗水泵。加强对管道的巡检，发现问题及时报修，杜绝跑、冒、滴、漏现象。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 加强办公室节能管理。空调夏季温度设置不低于26摄氏度，冬季不高于20摄氏度，严禁取暖器与空调同时同室双开。张贴“节约能源”的提示标语，要求及时关闭电脑、打印机等办公设备的电源。严禁在办公室使用微波炉、电饭煲等大功率电器。倡导徒步上楼，减少电梯运行频率。根据需要开启电热水炉，每天上午7:30开，17:30关。加强巡检，杜绝长明灯、长流水现象。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;（二十）严格控制成本节支降耗。&lt;/strong&gt;复印机、打印机旁设置废纸回收箱，纸类双面影印，提倡无纸化办公，加大网上报送和网上信息传递力度，提高信息化综合应用能力和水平。工程上使用节能降耗的原材料，修旧利废，最大程度地减少维修耗材的使用，开源节流。优先采购节能、经济型产品，合理安排货物的进出库，避免货物堆积。食堂菜肴的口味多征求运动队意见，杜绝食物浪费。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(35, '关于开展救助雅安地震灾区捐款活动的通知', 1, 71, '关于开展救助雅安地震灾区捐款活动的通知', '', 0, 0, 1419820648, 1419820648, '', 1, '#555', '#555', '&lt;p&gt;&lt;img src=&quot;http://192.168.0.106/tyj/Public/vendor/ueditor/themes/default/images/spacer.gif&quot; word_img=&quot;file:///c:/users/administrator/appdata/roaming/360se6/User Data/temp/20130502111131_73998.jpg&quot; style=&quot;background:url(http://192.168.0.106/tyj/Public/vendor/ueditor/lang/zh-cn/images/localimage.png) no-repeat center center;border:1px solid #ddd&quot;/&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0be65ab3d4.jpg&quot; title=&quot;54a0be65ab3d4.jpg&quot; alt=&quot;20130502111131_73998.jpg&quot;/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(36, '训练中心雪灾天气应急预案', 1, 74, '训练中心雪灾天气应急预案', '', 0, 0, 1419820697, 1419820697, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;为加强极端天气灾后的应急处置能力，迅速恢复中心内部基本通行，满足运动队训练需要，结合训练中心实际情况制订本预案。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;一、&lt;strong&gt;应急领导小组成员&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;组&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;长：中心负责人&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;副组长：中心各副主任&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;成&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;员：各项目中心、各部门负责人&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;二、应急领导小组职责&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;组长：统筹调动应急处置资源，指挥、组织和协调小组成员清扫积雪，部署排除因雪灾造成的安全隐患等工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;副组长：协调分管各部门的除雪和排险工作，完成组长交办的其他工作任务。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;中心办公室主任：发布扫雪通知，传达上级对处置灾情的各项指令，向上级部门报告或通报有关灾情的发展，组织相关部门对灾情损失进行统计和评估。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;后勤保障部部长：协助指挥各小组成员扫雪、排障工作，适时备齐扫雪工具，组织开展灾前预防和灾后恢复工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;其他成员：组织所在部门和科室人员清除道路及道路两侧树木积雪，统计并向中心办公室上报所负责区域损失情况。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;三、应急小组工作部署&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（一）应急工作保障标准：中心锦绣大道和前程大道主干道清扫路面积雪宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米，撒放除雪盐防止路面结冰，保障&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;17&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;座以上大客车单向行使；各场馆周边消防通道积雪清扫宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米，撒放除雪盐防止路面结冰，保障&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;17&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;座以下小型客车单项行驶；办公、训练、生活等设施间连接的人行通道清扫宽度不少于&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;米并铺设防滑草；道路两侧树梢的积雪用除雪竹竿打落。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（二）物资储备及发放：除雪物资由后勤保障部职能科室统一保管和补充，根据气象预报情况提前分配至除雪物资的分发点。各分发点按照&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;应急保障区域划分表&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;发放临近地点的除雪物资并负责领用和回收工作。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（三）应急保障区域划分：参照&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;应急保障区域划分表&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;执行。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21.1pt;&quot;&gt;&lt;strong&gt;四、其他&lt;/strong&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（一）参加扫雪工作的内协作单位，由后勤保障部协调。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;（二）本预案自颁布日起施行。&lt;/span&gt;&lt;span style=&quot;font-size: 10.5pt;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;text-indent: 21pt; line-height: 1.5;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;858&quot; interlaced=&quot;disabled&quot; style=&quot;width: 742px;&quot;&gt;&lt;colgroup&gt;&lt;col width=&quot;39&quot; style=&quot;width: 39px;&quot;/&gt;&lt;col width=&quot;91&quot; style=&quot;width: 91px;&quot;/&gt;&lt;col width=&quot;366&quot; style=&quot;width: 367px;&quot;/&gt;&lt;col width=&quot;79&quot; style=&quot;width: 79px;&quot;/&gt;&lt;col width=&quot;193&quot; style=&quot;width: 193px;&quot;/&gt;&lt;col width=&quot;90&quot; style=&quot;width: 91px;&quot;/&gt;&lt;col width=&quot;114&quot; style=&quot;width: 115px;&quot;/&gt;&lt;/colgroup&gt;&lt;tbody&gt;&lt;tr height=&quot;27&quot; class=&quot;firstRow&quot; style=&quot;height: 27px;&quot;&gt;&lt;td height=&quot;27&quot; width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td colspan=&quot;6&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;应急保障区域划分表&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;序号&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;部门/科室&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;保障区域&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;联系人&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;联系电话&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;现场协调&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;物资交接点&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;4&quot; height=&quot;77&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;1&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;中心办公室&lt;/td&gt;&lt;td rowspan=&quot;4&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自中心南大门起沿前程大道至中心广场入口，及田径馆南门至田径辅房沿线消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;汪&amp;nbsp; 泳&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913988200 &amp;nbsp; （660099）&lt;/td&gt;&lt;td rowspan=&quot;5&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;汪&amp;nbsp; 泳&lt;/td&gt;&lt;td rowspan=&quot;5&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;南门，铁锹12把，雪铲8把&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;田管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;邹尔莉&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13515119903&amp;nbsp; (660188)&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;保卫科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;谢&amp;nbsp; 旺&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13584069977 &amp;nbsp; （669977）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;20&quot; style=&quot;height: 20px;&quot;&gt;&lt;td height=&quot;20&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;供应科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;张恒运&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13805160700 &amp;nbsp; （666336）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;2&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;仙林体校&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;中心广场入口至少仙林体校东口和多功能厅门前&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;孙&amp;nbsp; 霞&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851721902 &amp;nbsp; （666303）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;4&quot; height=&quot;76&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;3&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;人教部&lt;/td&gt;&lt;td rowspan=&quot;4&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自中心广场入口起沿锦绣大道至聚仙楼和登山道叉路口&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;魏兆欣&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851811903 &amp;nbsp; （668505）&lt;/td&gt;&lt;td rowspan=&quot;8&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;魏兆欣&lt;/td&gt;&lt;td rowspan=&quot;15&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;南门，铁锹8把，雪铲12把，编织袋&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;篮管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;胡竹青&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913833430 &amp;nbsp; （662233）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;乒管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;吴九桂&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851967909 &amp;nbsp; （666302）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;排管中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;戎金文&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13601406789 &amp;nbsp; （666198）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;4&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;设备科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自聚仙楼和登山道叉路口起沿锦绣大道至中心西大门&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王久文&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951622139&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;5&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;医务科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自医务科、聚仙楼入口至登山道叉路口&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王&amp;nbsp; 富&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13611507975（ &amp;nbsp; 607975）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;2&quot; height=&quot;38&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;6&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;车队&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自行车赛场车队门前区域至中心西大门&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;蔡全龙&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13770507779 &amp;nbsp; （667779）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;基建工程&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;陈小雷&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;18914769509&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;3&quot; height=&quot;57&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;7&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;武管中心&lt;/td&gt;&lt;td rowspan=&quot;3&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自聚仙楼和登山道叉路起沿A、B馆西侧消防通道至综合训练馆入口及A、B馆南侧消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;殷建伟&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951899640 &amp;nbsp; （666445）&lt;/td&gt;&lt;td rowspan=&quot;7&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;殷建伟&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;举重中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;李顺柱&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13584010077 &amp;nbsp; （600077）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;场馆科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;朱啟林&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;18914769518 &amp;nbsp; （666311）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;8&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;产业科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;综合训练馆入口至转训中心&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;曲宏英&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913978677 （600222）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td rowspan=&quot;3&quot; height=&quot;57&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;9&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;综合科&lt;/td&gt;&lt;td rowspan=&quot;3&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;沿锦绣大道自中心广场入口起至行政楼东侧消防通道，及行政楼入口两侧通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;陈东晓&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;15951600888 &amp;nbsp; （668888）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;资产科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;周建华&lt;/td&gt;&lt;td width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;15996230185&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;财务科&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;王&amp;nbsp; 蓓&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13913948850&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;40&quot; style=&quot;height: 40px;&quot;&gt;&lt;td height=&quot;40&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;10&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;训竞部&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;自运动员公寓西出口沿公寓平台、台阶至公寓辅楼的消防通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;刘东峰&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13851905201 &amp;nbsp; （668105）&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;刘东峰&lt;/td&gt;&lt;td rowspan=&quot;2&quot; width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;东门，铁锹8把，雪铲6把，编织袋&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;32&quot; style=&quot;height: 32px;&quot;&gt;&lt;td height=&quot;32&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;11&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;膳食科&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;沿锦绣大道自行政楼东侧消防通道起至运动员公寓西出口，含运动员公寓与食堂间通道&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;杨洪波&lt;/td&gt;&lt;td width=&quot;38&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0); text-align: center;&quot;&gt;13951891140 &amp;nbsp; （606606）&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; width=&quot;82&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;302&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;180&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;71&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr height=&quot;19&quot; style=&quot;height: 19px;&quot;&gt;&lt;td height=&quot;19&quot; colspan=&quot;3&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; text-align: center; border-color: rgb(0, 0, 0);&quot;&gt;注：工业盐由保卫科派专人统一使用&lt;/td&gt;&lt;td width=&quot;81&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;103&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;undefined&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;td width=&quot;undefined&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border-color: rgb(0, 0, 0);&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;&quot;&gt;&lt;span style=&quot;text-indent: 21pt; line-height: 1.5;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0be98bbac7.png&quot; width=&quot;800&quot; height=&quot;547&quot; alt=&quot;&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 21pt;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;img src=&quot;/tyj/Uploads/editor/image/20141229/54a0be991e52c.png&quot; width=&quot;800&quot; height=&quot;574&quot; alt=&quot;&quot; style=&quot;border: 0px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; vertical-align: middle; font-family: Arial, ����; font-size: 14px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; text-indent: 21pt;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, ''),
(37, '医务科做好夏训医疗保障工作几点做法', 1, 76, '医务科做好夏训医疗保障工作几点做法', '', 0, 0, 1419820737, 1419820737, '', 1, '#555', '#555', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;一、思想上要高度重视，充分认识今年虽然是全运会周期第一年，仍要思想上高度重视。不能有任何松懈的思想，十二届我们中心任务重，新老交替之年，因此要打好基础就必须切切实实从第一年开始抓好各项工作夯实基础，决不能掉以轻心，同时我们医务科新队医多，对大多数新队医来说都是第一次做夏训医疗保障工作，对他们来说更为重要，既要做好夏训医疗保障工作，又要在夏训工作中加强学习，提高服务质量，干中学、学中十，医务科领导要加强监督、检查，加强指导和引导，使夏训医疗保障工作落到实处。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 二、在夏训医疗保障工作中做到四加强：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 加强服务意识：服务是永恒的，这个意识不能变。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 加强服务义务职责的认识：做好服务是每个医务人员的义务和职责。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 加强服务态度的改善：用心、精心、耐心、细心、热心&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 加强服务技术水平的提高：加强学习、干中学、学中干、互相学&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 三、抓重点&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 抓重点伤病：1、中暑的防治;2、消化道传染的防治，肝炎、痢疾、肠炎等;3、除正常运动创作的防治外，另外夏天烫伤、意外伤害的预防也不可忽视.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 抓重点项目：1、田径队;2、沙滩排球;3、流动队伍.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 抓重点人群：1、重点队员;2、外出训练、比赛的队伍;3、体弱、多病、年龄小队员、内向的队员。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 抓重点天气：1、高温、高湿天气;2、异常天气、雷电、水灾。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 四、做物质保障：药品、器材、器械的保障工作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 五、做好突发情况的，自己要注意身体、自己不能倒下。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1、&amp;nbsp;加强值班.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2、&amp;nbsp;急救器械药品进一步检查、操作确保完好。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3、&amp;nbsp;加强与有关部门的联系、汇报，如车队、120、项目中心，做到及时救治和转送。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;医务科&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;#39;Times New Roman&amp;#39;;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体;&quot;&gt;二○一○年七月二十二日&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');
INSERT INTO `xj_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`) VALUES
(38, '名将', 1, 77, '名将风采', '', 0, 0, 1419820783, 1419820783, '', 1, '#555', '#555', '&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=96&amp;id=115&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;沈光美&quot; src=&quot;http://www.jstx.org/uploads/1383708429.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;沈光美&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=96&amp;id=114&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;蒋全&quot; src=&quot;http://www.jstx.org/uploads/1383274843.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;蒋全&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=113&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;魏雨欣&quot; src=&quot;http://www.jstx.org/uploads/1383274556.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;魏雨欣&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=112&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;龚翔宇&quot; src=&quot;http://www.jstx.org/uploads/1383278428.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;龚翔宇&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=111&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;关鸠&quot; src=&quot;http://www.jstx.org/uploads/1383274922.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;关鸠&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=110&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;戎万千百&quot; src=&quot;http://www.jstx.org/uploads/1383273045.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;戎万千百&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=109&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;刘沛宜&quot; src=&quot;http://www.jstx.org/uploads/1383275056.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;刘沛宜&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=108&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;张常宁&quot; src=&quot;http://www.jstx.org/uploads/1383276479.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;张常宁&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=107&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;胡宇璇&quot; src=&quot;http://www.jstx.org/uploads/1383274192.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;胡宇璇&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=106&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;褚悦明&quot; src=&quot;http://www.jstx.org/uploads/1383212015.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;褚悦明&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=105&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;王辰玥&quot; src=&quot;http://www.jstx.org/uploads/1383208943.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;王辰玥&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=104&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;卢静雯&quot; src=&quot;http://www.jstx.org/uploads/1383218285.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;卢静雯&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=103&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;许若亚&quot; src=&quot;http://www.jstx.org/uploads/1383216354.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;许若亚&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=95&amp;id=102&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;唐宁雅&quot; src=&quot;http://www.jstx.org/uploads/1383211833.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;唐宁雅&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=101&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;张晓妮&quot; src=&quot;http://www.jstx.org/uploads/1383212811.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;张晓妮&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=100&quot; style=&quot;color: rgb(253, 31, 0);&quot;&gt;&lt;img alt=&quot;陈丽莎&quot; src=&quot;http://www.jstx.org/uploads/1383217066.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;陈丽莎&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=99&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;郇欢&quot; src=&quot;http://www.jstx.org/uploads/1383214251.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;郇欢&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=98&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;许诺&quot; src=&quot;http://www.jstx.org/uploads/1383209023.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;许诺&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=97&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;许歌&quot; src=&quot;http://www.jstx.org/uploads/1383212676.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;许歌&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.jstx.org/sporter.php?cid=93&amp;id=96&quot; style=&quot;color: rgb(0, 0, 0); text-decoration: none;&quot;&gt;&lt;img alt=&quot;强逸&quot; src=&quot;http://www.jstx.org/uploads/1383214614.jpg&quot; style=&quot;border: 0px; width: 120px; height: 160px; clear: both; display: block;&quot;/&gt;强逸&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div class=&quot;page_nav&quot; style=&quot;margin: 0px auto; padding: 0px; clear: both; height: 60px; text-align: center; width: 350px; font-family: Arial, ����; font-size: 12px; line-height: 22px; white-space: normal;&quot;&gt;&lt;/div&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `xj_athlete`
--

CREATE TABLE `xj_athlete` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户标示',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `birthday` int(10) NOT NULL COMMENT '出生日期',
  `nativePlace` char(255) NOT NULL COMMENT '籍贯',
  `gender` char(10) NOT NULL COMMENT '性别',
  `homeAddress` varchar(255) NOT NULL COMMENT '家庭住址',
  `nation` char(50) NOT NULL COMMENT '民族',
  `phone` varchar(255) NOT NULL COMMENT '联系方式',
  `technicalGrade` char(50) NOT NULL COMMENT '技术等级',
  `political` char(50) NOT NULL COMMENT '政治面貌',
  `enqueueTime` int(10) NOT NULL COMMENT '入队时间',
  `team` char(50) NOT NULL COMMENT '所属运动队',
  `sports` char(50) NOT NULL COMMENT '运动项目',
  `picture` int(10) unsigned NOT NULL COMMENT '头像'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=16 ;

--
-- Dumping data for table `xj_athlete`
--

INSERT INTO `xj_athlete` (`id`, `uid`, `name`, `birthday`, `nativePlace`, `gender`, `homeAddress`, `nation`, `phone`, `technicalGrade`, `political`, `enqueueTime`, `team`, `sports`, `picture`) VALUES
(14, 34, '领导', 1267632000, '河北省,邯郸市,复兴区', '1', '地球大气121', '4', '1212313123', '2', '0', 1418054400, '16', '114', 26),
(15, 35, 'y3', 1417449600, '天津市,和平区', '0', 'qdwdewdqw', '1', '123123213', '1', '0', 1275926400, '17', '95', 26),
(13, 29, 'dadasd', 1417536000, '天津市,河东区', '1', 'dasdasd', '3', '123', '0', '0', 1417536000, '16', '43', 25);

-- --------------------------------------------------------

--
-- Table structure for table `xj_attribute`
--

CREATE TABLE `xj_attribute` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  `validate_condition` tinyint(1) NOT NULL DEFAULT '0' COMMENT '验证条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=217 ;

--
-- Dumping data for table `xj_attribute`
--

INSERT INTO `xj_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`, `validate_condition`) VALUES
(82, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(83, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(84, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(85, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 18, 0, 1, 1418966250, 1418802392, '0,255', 3, '', 'length', '', 3, 'function', 2),
(86, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(87, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写则代表永久有效', 1, '', 18, 0, 1, 1418890382, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(88, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 18, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(89, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 18, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(90, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(91, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 18, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(92, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 18, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(93, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 20, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(94, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(95, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(96, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 20, 0, 1, 1418958271, 1418802392, '0,255', 3, '长度不能超过255个字符', 'length', '', 3, 'function', 2),
(97, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 20, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(98, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写或者显示1970-01-01则代表永久有效', 1, '', 20, 0, 1, 1418979835, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(99, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 20, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(100, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 20, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(101, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(102, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 20, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(103, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 20, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(104, 'title_color', '内容页标题颜色', 'char(10)  NOT NULL', 'color', '''#555''', '默认值代表不设置', 1, '', 20, 0, 1, 1419255883, 1418954725, '', 3, '', 'regex', '', 3, 'function', 0),
(105, 'list_color', '列表页标题颜色', 'char(10)  NOT NULL', 'color', '''#555''', '默认值代表不设置', 1, '', 20, 0, 1, 1419255901, 1418954751, '', 3, '', 'regex', '', 3, 'function', 0),
(106, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 20, 1, 1, 1418954824, 1418954824, '', 3, '', 'regex', '', 3, 'function', 0),
(107, 'is_up', '是否置顶', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:否\r\n1:是', 20, 0, 1, 1418956979, 1418955083, '', 3, '', 'regex', '', 3, 'function', 0),
(108, 'position', '推荐位', 'varchar(100) NOT NULL', 'checkbox', '0', '', 1, '[DOCUMENT_POSITION]', 20, 0, 1, 1419138707, 1418955236, '', 3, '', 'regex', 'position_parse', 3, 'function', 0),
(131, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 22, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(130, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(128, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 22, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(127, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写则代表永久有效', 1, '', 22, 0, 1, 1418890382, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(126, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 22, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(125, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 22, 0, 1, 1418966250, 1418802392, '0,255', 3, '', 'length', '', 3, 'function', 2),
(124, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(123, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(122, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 22, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(129, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 22, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(169, 'political', '政治面貌', 'char(50) NOT NULL', 'select', '', '', 1, '[POLITICAL]', 25, 1, 1, 1419513487, 1419511943, '', 3, '', 'regex', '', 3, 'function', 0),
(132, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 22, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(133, 'file', '文件', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 22, 1, 1, 1418979125, 1418978785, '', 3, '', 'regex', '', 3, 'function', 0),
(134, 'cover', '封面', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 20, 0, 1, 1418979727, 1418979727, '', 3, '', 'regex', '', 3, 'function', 0),
(135, 'extend', '扩展统计字段', 'text NOT NULL', 'textarea', '', '', 0, '', 20, 0, 1, 1418986871, 1418986871, '', 3, '', 'regex', '', 3, 'function', 0),
(168, 'technicalGrade', '技术等级', 'char(50) NOT NULL', 'select', '', '', 1, '[TECHNICALGRADE]', 25, 1, 1, 1419514459, 1419511864, '', 3, '', 'regex', '', 3, 'function', 0),
(167, 'phone', '联系方式', 'varchar(255) NOT NULL', 'string', '', '请填写您的常用联系方式', 1, '', 25, 1, 1, 1419511784, 1419511784, '', 3, '', 'regex', '', 3, 'function', 0),
(166, 'nation', '民族', 'char(50) NOT NULL', 'select', '', '', 1, '[NATION]', 25, 1, 1, 1419513497, 1419511729, '', 3, '', 'regex', '', 3, 'function', 0),
(165, 'homeAddress', '家庭住址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 25, 1, 1, 1419511649, 1419511649, '5,255', 3, '家庭住址要在5到255个字符之间', 'length', '', 3, 'function', 0),
(163, 'nativePlace', '籍贯', 'char(255)  NOT NULL', 'place', '', '', 1, '', 25, 1, 1, 1419515915, 1419511493, '', 3, '', 'regex', '', 3, 'function', 0),
(164, 'gender', '性别', 'char(10) NOT NULL', 'select', '', '', 1, '0:女\r\n1:男', 25, 1, 1, 1419577291, 1419511574, '', 3, '', 'regex', '', 3, 'function', 0),
(162, 'birthday', '出生日期', 'int(10) NOT NULL', 'date', '', '', 1, '', 25, 0, 1, 1419511437, 1419511437, '', 3, '', 'regex', '', 3, 'function', 0),
(161, 'name', '姓名', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 25, 1, 1, 1419511237, 1419511237, '2,40', 3, '姓名要在2到40个字符之间', 'length', '', 3, 'function', 0),
(160, 'uid', '用户标示', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 25, 1, 1, 1419511146, 1419511146, '', 3, '', 'regex', '', 3, 'function', 0),
(159, 'type', '计划类型', 'tinyint(1) UNSIGNED NOT NULL', 'num', '', '计划类型(0是日计划,1是周计划,2是月计划)', 0, '', 24, 1, 1, 1419493456, 1419434667, '', 3, '', 'regex', '', 3, 'function', 0),
(158, 'arrange', '训练安排', 'text NOT NULL', 'simpleEditor', '', '', 1, '', 24, 1, 1, 1419417539, 1419414428, '', 3, '', 'regex', '', 3, 'function', 0),
(154, 'uid', '发布用户', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 24, 1, 1, 1419413990, 1419413990, '', 3, '', 'regex', '', 3, 'function', 0),
(155, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 24, 0, 1, 1419414046, 1419414046, '', 3, '', 'regex', 'time', 1, 'function', 0),
(156, 'target', '训练目标', 'text NOT NULL', 'textarea', '', '训练目标,此次训练要达到的目的', 1, '训练目标', 24, 1, 1, 1419414275, 1419414275, '', 3, '', 'regex', '', 3, 'function', 0),
(157, 'task', '训练任务', 'text NOT NULL', 'simpleEditor', '', '', 1, '', 24, 1, 1, 1419417550, 1419414369, '', 3, '', 'regex', '', 3, 'function', 0),
(170, 'enqueueTime', '入队时间', 'int(10) NOT NULL', 'date', '', '', 1, '', 25, 1, 1, 1419512005, 1419512005, '', 3, '', 'regex', '', 3, 'function', 0),
(171, 'team', '所属运动队', 'char(50) NOT NULL', 'select', '', '', 1, '{get_team}', 25, 1, 1, 1419513473, 1419512041, '', 3, '', 'regex', '', 3, 'function', 0),
(172, 'sports', '运动项目', 'char(50) NOT NULL', 'select', '', '', 1, '{get_sports}', 25, 1, 1, 1419513455, 1419512114, '', 3, '', 'regex', '', 3, 'function', 0),
(173, 'picture', '头像', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 25, 0, 1, 1419517870, 1419517870, '', 3, '', 'regex', '', 3, 'function', 0),
(174, 'political', '政治面貌', 'char(50) NOT NULL', 'select', '', '', 1, '[POLITICAL]', 26, 1, 1, 1419513487, 1419511943, '', 3, '', 'regex', '', 3, 'function', 0),
(175, 'technicalGrade', '教练等级', 'char(50) NOT NULL', 'select', '', '', 1, '[COACH_TECHNICALGRADE]', 26, 1, 1, 1419558610, 1419511864, '', 3, '', 'regex', '', 3, 'function', 0),
(176, 'phone', '联系方式', 'varchar(255) NOT NULL', 'string', '', '请填写您的常用联系方式', 1, '', 26, 1, 1, 1419511784, 1419511784, '', 3, '', 'regex', '', 3, 'function', 0),
(177, 'nation', '民族', 'char(50) NOT NULL', 'select', '', '', 1, '[NATION]', 26, 1, 1, 1419513497, 1419511729, '', 3, '', 'regex', '', 3, 'function', 0),
(178, 'homeAddress', '家庭住址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 26, 1, 1, 1419511649, 1419511649, '5,255', 3, '家庭住址要在5到255个字符之间', 'length', '', 3, 'function', 0),
(179, 'nativePlace', '籍贯', 'char(255)  NOT NULL', 'place', '', '', 1, '', 26, 1, 1, 1419515915, 1419511493, '', 3, '', 'regex', '', 3, 'function', 0),
(180, 'gender', '性别', 'char(10) NOT NULL', 'select', '', '', 1, '0:女\r\n1:男', 26, 1, 1, 1419577270, 1419511574, '', 3, '', 'regex', '', 3, 'function', 0),
(181, 'birthday', '出生日期', 'int(10) NOT NULL', 'date', '', '', 1, '', 26, 0, 1, 1419511437, 1419511437, '', 3, '', 'regex', '', 3, 'function', 0),
(182, 'name', '姓名', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 26, 1, 1, 1419511237, 1419511237, '2,40', 3, '姓名要在2到40个字符之间', 'length', '', 3, 'function', 0),
(183, 'uid', '用户标示', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 26, 1, 1, 1419511146, 1419511146, '', 3, '', 'regex', '', 3, 'function', 0),
(184, 'enqueueTime', '入队时间', 'int(10) NOT NULL', 'date', '', '', 1, '', 26, 1, 1, 1419512005, 1419512005, '', 3, '', 'regex', '', 3, 'function', 0),
(185, 'team', '所属运动队', 'char(50) NOT NULL', 'select', '', '', 1, '{get_team}', 26, 1, 1, 1419513473, 1419512041, '', 3, '', 'regex', '', 3, 'function', 0),
(186, 'sports', '运动项目', 'char(50) NOT NULL', 'select', '', '', 1, '{get_sports}', 26, 1, 1, 1419513455, 1419512114, '', 3, '', 'regex', '', 3, 'function', 0),
(187, 'picture', '头像', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 26, 0, 1, 1419517870, 1419517870, '', 3, '', 'regex', '', 3, 'function', 0),
(188, 'job', '队内职务', 'char(50) NOT NULL', 'select', '', '', 1, '[COACH_JOB]', 26, 1, 1, 1419558683, 1419558683, '', 3, '', 'regex', '', 3, 'function', 0),
(189, 'name', '运动队名称', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 27, 1, 1, 1419559146, 1419559146, '', 3, '名称已经存在', 'unique', '', 3, 'function', 0),
(190, 'political', '政治面貌', 'char(50) NOT NULL', 'select', '', '', 1, '[POLITICAL]', 28, 1, 1, 1419513487, 1419511943, '', 3, '', 'regex', '', 3, 'function', 0),
(191, 'technicalGrade', '裁判等级', 'char(50) NOT NULL', 'select', '', '', 1, '[REFEREE_TECHNICALGRADE]', 28, 1, 1, 1419669513, 1419511864, '', 3, '', 'regex', '', 3, 'function', 0),
(192, 'phone', '联系方式', 'varchar(255) NOT NULL', 'string', '', '请填写您的常用联系方式', 1, '', 28, 1, 1, 1419511784, 1419511784, '', 3, '', 'regex', '', 3, 'function', 0),
(193, 'nation', '民族', 'char(50) NOT NULL', 'select', '', '', 1, '[NATION]', 28, 1, 1, 1419513497, 1419511729, '', 3, '', 'regex', '', 3, 'function', 0),
(194, 'homeAddress', '家庭住址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 28, 1, 1, 1419511649, 1419511649, '5,255', 3, '家庭住址要在5到255个字符之间', 'length', '', 3, 'function', 0),
(195, 'nativePlace', '籍贯', 'char(255)  NOT NULL', 'place', '', '', 1, '', 28, 1, 1, 1419515915, 1419511493, '', 3, '', 'regex', '', 3, 'function', 0),
(196, 'gender', '性别', 'char(10) NOT NULL', 'select', '', '', 1, '0:女\r\n1:男', 28, 1, 1, 1419577270, 1419511574, '', 3, '', 'regex', '', 3, 'function', 0),
(197, 'birthday', '出生日期', 'int(10) NOT NULL', 'date', '', '', 1, '', 28, 0, 1, 1419511437, 1419511437, '', 3, '', 'regex', '', 3, 'function', 0),
(198, 'name', '姓名', 'varchar(40) NOT NULL', 'string', '', '', 1, '', 28, 1, 1, 1419511237, 1419511237, '2,40', 3, '姓名要在2到40个字符之间', 'length', '', 3, 'function', 0),
(199, 'uid', '用户标示', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 28, 1, 1, 1419511146, 1419511146, '', 3, '', 'regex', '', 3, 'function', 0),
(205, 'uid', '发表用户', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 29, 1, 1, 1419746057, 1419746057, '', 3, '', 'regex', '', 3, 'function', 0),
(206, 'content', '总结内容', 'text NOT NULL', 'simpleEditor', '', '', 1, '', 29, 1, 1, 1419746086, 1419746086, '', 3, '', 'regex', '', 3, 'function', 0),
(202, 'sports', '运动项目', 'char(50) NOT NULL', 'select', '', '', 1, '{get_sports}', 28, 1, 1, 1419513455, 1419512114, '', 3, '', 'regex', '', 3, 'function', 0),
(203, 'picture', '头像', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 28, 0, 1, 1419517870, 1419517870, '', 3, '', 'regex', '', 3, 'function', 0),
(207, 'type', '总结类型(0是日总结,1是周总结,2是月总结,3是年底总结)', 'tinyint(1) UNSIGNED NOT NULL', 'num', '', '', 0, '', 29, 1, 1, 1419746175, 1419746175, '', 3, '', 'regex', '', 3, 'function', 0),
(208, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 29, 0, 1, 1419746531, 1419746505, '', 3, '', 'regex', 'time', 1, 'function', 0),
(209, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 29, 0, 1, 1419821946, 1419821946, '', 3, '', 'regex', 'time', 3, 'function', 0),
(210, 'update_time', '更新日期', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 24, 0, 1, 1419821982, 1419821982, '', 3, '', 'regex', 'time', 3, 'function', 0),
(211, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '2', '', 0, '', 29, 0, 1, 1419822305, 1419822305, '', 3, '', 'regex', '', 3, 'function', 0),
(212, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '2', '', 0, '', 24, 0, 1, 1419822331, 1419822331, '', 3, '', 'regex', '', 3, 'function', 0),
(213, 'verify_uid', '审核人', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 29, 0, 1, 1419823089, 1419823089, '', 3, '', 'regex', '', 3, 'function', 0),
(214, 'verify_uid', '审核用户', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 24, 0, 1, 1419823147, 1419823147, '', 3, '', 'regex', '', 3, 'function', 0),
(215, 'status', '状态', 'tinyint(1) NOT NULL', 'num', '', '', 0, '', 27, 0, 1, 1419995404, 1419994493, '', 3, '', 'regex', '', 3, 'function', 0),
(216, 'pid', '上级', 'int(10) NOT NULL', 'select', '', '', 1, '{get_parent_team}', 27, 1, 1, 1419994571, 1419994571, '', 3, '', 'regex', '', 3, 'function', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_auth_extend`
--

CREATE TABLE `xj_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- Dumping data for table `xj_auth_extend`
--

INSERT INTO `xj_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(8, 49, 1),
(8, 50, 1),
(8, 51, 1),
(8, 52, 1),
(8, 53, 1),
(8, 54, 1),
(8, 55, 1),
(8, 56, 1),
(8, 58, 1),
(8, 59, 1),
(8, 60, 1),
(8, 61, 1),
(8, 62, 1),
(8, 63, 1),
(8, 64, 1),
(8, 65, 1),
(8, 66, 1),
(8, 67, 1),
(8, 68, 1),
(8, 69, 1),
(8, 70, 1),
(8, 71, 1),
(8, 72, 1),
(8, 73, 1),
(8, 74, 1),
(8, 75, 1),
(8, 76, 1),
(8, 77, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xj_auth_group`
--

CREATE TABLE `xj_auth_group` (
`id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `xj_auth_group`
--

INSERT INTO `xj_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(8, 'admin', 1, '前台管理', '', 1, '372,383,386,388,390,391,392,393,394,395,396,397,398,399,400'),
(5, 'admin', 1, '运动员', '', 1, '386,387,388,413,414,423'),
(6, 'admin', 1, '教练员', '', 1, '386,387,388,409,410,412,413,414,419,421,423,427,428'),
(7, 'admin', 1, '裁判员', '', 1, '386,387,388'),
(9, 'admin', 1, '科训管理', '', 1, '386,388,412,417,419,427,428'),
(10, 'admin', 1, '超级管理员', '', 1, '358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,417,419,421,423,424,425,426');

-- --------------------------------------------------------

--
-- Table structure for table `xj_auth_group_access`
--

CREATE TABLE `xj_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xj_auth_group_access`
--

INSERT INTO `xj_auth_group_access` (`uid`, `group_id`) VALUES
(29, 5),
(30, 6),
(31, 7),
(32, 9),
(33, 8),
(34, 5),
(35, 5);

-- --------------------------------------------------------

--
-- Table structure for table `xj_auth_rule`
--

CREATE TABLE `xj_auth_rule` (
`id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=429 ;

--
-- Dumping data for table `xj_auth_rule`
--

INSERT INTO `xj_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(424, 'admin', 1, 'Admin/menu/index', '菜单管理', 1, ''),
(423, 'admin', 1, 'Admin/science/sum', '训练总结', 1, ''),
(420, 'admin', 1, 'Admin/judge/index', '裁判员管理', 1, ''),
(421, 'admin', 1, 'Admin/science/plan', '训练计划', 1, ''),
(422, 'admin', 1, 'Admin/equipe/index', '运动队管理', 1, ''),
(419, 'admin', 1, 'Admin/science/sumManager', '训练总结管理', 1, ''),
(418, 'admin', 1, 'Admin/coach/index', '教练员管理', 1, ''),
(417, 'admin', 1, 'Admin/science/planManager', '训练计划管理', 1, ''),
(415, 'admin', 2, 'Admin/Index/index', '主页', 1, ''),
(416, 'admin', 1, 'Admin/athlete/index', '运动员管理', 1, ''),
(414, 'admin', 1, 'Admin/science/addSum', '添加总结', 1, ''),
(413, 'admin', 1, 'Admin/science/editSum', '编辑总结', 1, ''),
(412, 'admin', 1, 'Admin/science/printData', '打印运动员信息', 1, ''),
(405, 'admin', 1, 'Admin/category/sort\r', '排序', 1, ''),
(411, 'admin', 1, 'Admin/science/verify', '审核训练总结', -1, ''),
(410, 'admin', 1, 'Admin/science/addPlan', '添加计划', 1, ''),
(409, 'admin', 1, 'Admin/science/editPlan', '编辑计划', 1, ''),
(408, 'admin', 1, 'Admin/science/info', '查看运动员信息', -1, ''),
(407, 'admin', 1, 'Admin/category/import', '导入', 1, ''),
(406, 'admin', 1, 'Admin/category/clearCache\r', '清除缓存', 1, ''),
(404, 'admin', 1, 'Admin/category/delete\r', '删除', 1, ''),
(403, 'admin', 1, 'Admin/category/changeStatus\r', '禁用', 1, ''),
(402, 'admin', 1, 'Admin/category/edit\r', '编辑', 1, ''),
(401, 'admin', 1, 'Admin/category/add\r', '添加', 1, ''),
(400, 'admin', 1, 'Admin/content/del', '删除', 1, ''),
(399, 'admin', 1, 'Admin/content/up', '置顶', 1, ''),
(398, 'admin', 1, 'Admin/content/changeStatus', '改变状态', 1, ''),
(397, 'admin', 1, 'Admin/content/edit', '编辑', 1, ''),
(396, 'admin', 1, 'Admin/content/add', '添加', 1, ''),
(395, 'admin', 1, 'Admin/content/news', '查看', 1, ''),
(394, 'admin', 1, 'Admin/link/sort', '排序', 1, ''),
(393, 'admin', 1, 'Admin/link/del\r', '删除', 1, ''),
(392, 'admin', 1, 'Admin/link/changeStatus\r', '禁用', 1, ''),
(391, 'admin', 1, 'Admin/link/edit', '编辑', 1, ''),
(390, 'admin', 1, 'Admin/link/add', '添加', 1, ''),
(389, 'admin', 1, 'Admin/person/add', '添加人员', 1, ''),
(388, 'admin', 1, 'Admin/mySpace/updatePassword', '修改密码', 1, ''),
(387, 'admin', 1, 'Admin/mySpace/baseInfo', '个人资料', 1, ''),
(386, 'admin', 2, 'Admin/Public/index', '系统', 1, ''),
(385, 'admin', 1, 'Admin/mail/inbox', '收件箱', 1, ''),
(384, 'admin', 1, 'Admin/service/index', '人员服务', 1, ''),
(383, 'admin', 1, 'Admin/link/index', '链接管理', 1, ''),
(382, 'admin', 1, 'Admin/competition/achievement', '成绩录入', 1, ''),
(381, 'admin', 1, 'Admin/competition/notice', '赛事公告', 1, ''),
(380, 'admin', 1, 'Admin/competition/plan', '赛事计划', 1, ''),
(379, 'admin', 1, 'Admin/indicators/index', '项目指标管理', 1, ''),
(378, 'admin', 1, 'Admin/sportsteam/index', '运动队管理', 1, ''),
(377, 'admin', 1, 'Admin/person/referee', '裁判员管理', 1, ''),
(376, 'admin', 1, 'Admin/person/coach', '教练员管理', 1, ''),
(375, 'admin', 1, 'Admin/person/athlete', '运动员管理', 1, ''),
(374, 'admin', 1, 'Admin/userVerify/index', '审核用户', 1, ''),
(373, 'admin', 1, 'Admin/sports/index', '运动项目管理', 1, ''),
(372, 'admin', 1, 'Admin/content/index', '内容管理', 1, ''),
(371, 'admin', 1, 'Admin/model/index', '模型管理', 1, ''),
(370, 'admin', 1, 'Admin/category/index', '分类管理', 1, ''),
(369, 'admin', 1, 'Admin/config/index', '配置管理', 1, ''),
(368, 'admin', 1, 'Admin/config/group', '网站设置', 1, ''),
(367, 'admin', 1, 'Admin/user/updateNickname', '修改昵称', 1, ''),
(366, 'admin', 1, 'Admin/user/updatePassword', '修改密码', 1, ''),
(365, 'admin', 1, 'Admin/action/actionlog', '行为日志', 1, ''),
(364, 'admin', 1, 'Admin/authManager/index', '权限管理', 1, ''),
(363, 'admin', 1, 'Admin/user/action', '用户行为', 1, ''),
(362, 'admin', 1, 'Admin/user/index', '用户信息', 1, ''),
(361, 'admin', 1, 'Admin/menu/edit', '编辑', 1, ''),
(360, 'admin', 1, 'Admin/menu/import', '导入', 1, ''),
(359, 'admin', 1, 'Admin/menu/del', '删除', 1, ''),
(358, 'admin', 1, 'Admin/menu/add', '新增', 1, ''),
(425, 'admin', 1, 'Admin/database/exportIndex', '备份数据库', 1, ''),
(426, 'admin', 1, 'Admin/database/importIndex', '还原数据库', 1, ''),
(427, 'admin', 1, 'Admin/science/sumVerify', '审核训练总结', 1, ''),
(428, 'admin', 1, 'Admin/science/personInfo', '查看运动员信息', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `xj_base_article`
--

CREATE TABLE `xj_base_article` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `xj_coach`
--

CREATE TABLE `xj_coach` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户标示',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `birthday` int(10) NOT NULL COMMENT '出生日期',
  `nativePlace` char(255) NOT NULL COMMENT '籍贯',
  `gender` char(10) NOT NULL COMMENT '性别',
  `homeAddress` varchar(255) NOT NULL COMMENT '家庭住址',
  `nation` char(50) NOT NULL COMMENT '民族',
  `phone` varchar(255) NOT NULL COMMENT '联系方式',
  `technicalGrade` char(50) NOT NULL COMMENT '教练等级',
  `political` char(50) NOT NULL COMMENT '政治面貌',
  `enqueueTime` int(10) NOT NULL COMMENT '入队时间',
  `team` char(50) NOT NULL COMMENT '所属运动队',
  `sports` char(50) NOT NULL COMMENT '运动项目',
  `picture` int(10) unsigned NOT NULL COMMENT '头像',
  `job` char(50) NOT NULL COMMENT '队内职务'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- Dumping data for table `xj_coach`
--

INSERT INTO `xj_coach` (`id`, `uid`, `name`, `birthday`, `nativePlace`, `gender`, `homeAddress`, `nation`, `phone`, `technicalGrade`, `political`, `enqueueTime`, `team`, `sports`, `picture`, `job`) VALUES
(5, 30, 'dasdasd', 1417449600, '河北省,石家庄市,桥东区', '1', 'dasdsadas', '4', '1231231', '0', '0', 1418140800, '16', '43', 25, '2');

-- --------------------------------------------------------

--
-- Table structure for table `xj_config`
--

CREATE TABLE `xj_config` (
`id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `xj_config`
--

INSERT INTO `xj_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '天津市体育局训竞服务网络平台', 1),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '', 2),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '', 9),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 6),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 14),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 15),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位', 1379053380, 1419111436, 1, '1:列表页推荐\r\n2:频道页推荐\r\n3:网站首页推荐', 5),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 7),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 16),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 10),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 11),
(40, 'TEMP_PATH', 2, '前台模版路径', 2, '', '内容显示的模版路径', 1418650622, 1418651066, 1, './Application/Home/View/Template', 0),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 20),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 21),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 4),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 17),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 8),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 18),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 22),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 24),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1418916067, 1, '1:index/index\r\n2:Index/verify\r\n3:file/upload\r\n4:file/download\r\n5:user/updatePassword\r\n6:user/updateNickname\r\n7:user/submitPassword\r\n8:user/submitNickname\r\n9:file/uploadpicture', 3),
(41, 'SYSTEM_COLOR', 3, '颜色配置', 0, '', '通用颜色', 1418973661, 1418976664, 1, '#555\r\n#ac725e\r\n#d06b64\r\n#f83a22\r\n#fa573c\r\n#ff7537\r\n#ffad46\r\n#42d692\r\n#16a765\r\n#7bd148\r\n#b3dc6c\r\n#fbe983\r\n#fad165\r\n#92e1c0\r\n#9fe1e7\r\n#9fc6e7\r\n#4986e7\r\n#9a9cff\r\n#b99aff\r\n#c2c2c2\r\n#cabdbf\r\n#cca6ac\r\n#f691b2\r\n#cd74e6\r\n#a47ae2\r\n\r\n', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 12),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 23),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 25),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 13),
(42, 'SPORT_GROUP', 3, '项目层级的组别名称', 0, '', '', 1419003723, 1419003723, 1, '0:项目\r\n1:分项\r\n2:组别\r\n3:小项', 0),
(43, 'LINK_GROUP', 3, '配置分组', 2, '', '链接分组,t开头的分组代表只能是纯文本链接,\r\np开头的分组代表必须有图片,a开头的分组代表都行', 1419298534, 1419300063, 1, 't-1:外部链接\r\np-2:快速通道\r\na-3:服务台', 0),
(44, 'TECHNICALGRADE', 3, '运动员技术等级', 3, '', '', 1419512465, 1419669391, 1, '0:国际级运动健将\r\n1:运动健将\r\n2:一级运动员\r\n3:二级运动员', 0),
(45, 'NATION', 3, '民族', 3, '', '', 1419513049, 1419513049, 1, '1:汉族 \r\n2:蒙古族\r\n3:回族\r\n4:藏族 \r\n5:维吾尔族\r\n6:苗族 \r\n7:彝族 \r\n8:壮族 \r\n9:布依族 \r\n10:朝鲜族 \r\n11:满族 \r\n12:侗族 \r\n13:瑶族 \r\n14:白族 \r\n15:土家族\r\n16:哈尼族 \r\n17:哈萨克族 \r\n18:傣族 \r\n19:黎族 \r\n20:傈僳族 \r\n21:佤族 \r\n22:畲族 \r\n23:高山族 \r\n24:拉祜族 \r\n25:水族 \r\n26:东乡族 \r\n27:纳西族 \r\n28:景颇族 \r\n29:柯尔克孜族 \r\n30:土族 \r\n31:达斡尔族  \r\n32:仫佬族 \r\n33:羌族 \r\n34:布朗族 \r\n35:撒拉族 \r\n36:毛南族 \r\n37:仡佬族 \r\n38:锡伯族\r\n39:阿昌族 \r\n40:普米族 \r\n41:塔吉克族 \r\n42:怒族 \r\n43:乌孜别克族\r\n44:俄罗斯族 \r\n45:鄂温克族 \r\n46:德昂族 \r\n47:保安族\r\n48:裕固族 \r\n49:京族 \r\n50:塔塔尔族 \r\n51:独龙族 \r\n52:鄂伦春族 \r\n53:赫哲族 \r\n54:门巴族 \r\n55:珞巴族 \r\n56:基诺族 \r\n57:其他 \r\n58:外国血统 ', 0),
(46, 'POLITICAL', 3, '政治面貌', 3, '', '', 1419513164, 1419513164, 1, '0:中国党员\r\n1:共青团员\r\n2:群众', 0),
(47, 'COACH_JOB', 3, '教练员职务', 3, '', '', 1419558801, 1419558902, 1, '0:主教练\r\n1:助理教练\r\n2:体能教练', 0),
(48, 'COACH_TECHNICALGRADE', 3, '教练员等级', 3, '', '', 1419558891, 1419558891, 1, '0:国家级教练\r\n1:高级教练\r\n2:一级教练\r\n3:二级教练\r\n4:三级教练', 0),
(49, 'REFEREE_TECHNICALGRADE', 3, '裁判员等级', 3, '', '', 1419669453, 1419669453, 1, '0:国家级裁判员\r\n1:一级裁判员\r\n2:二级裁判员\r\n3:三级裁判员', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_download`
--

CREATE TABLE `xj_download` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `file` int(10) unsigned NOT NULL COMMENT '文件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xj_download`
--

INSERT INTO `xj_download` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `file`) VALUES
(1, '运动员信息', 1, 18, '2014年运动员的信息', '', 0, 2, 1418979431, 1418979431, '', 1, 13),
(2, '第二条新闻', 1, 18, '呵呵', '', 0, 7, 1418979534, 1418979534, '', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `xj_file`
--

CREATE TABLE `xj_file` (
`id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `xj_file`
--

INSERT INTO `xj_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `create_time`) VALUES
(12, '屏幕快照 2014-12-17 下午8.03.50.png', '5493b68e35017.png', '2014-12-19/', 'png', 'image/png', 237017, '4cacbb3d8c186b4092c625b6337b83b1', '0c4383749ef8ae4fa4c68374939c14efb707e525', 0, 1418966670),
(11, 'article.model', '548ee0cd838ad.model', '2014-12-15/', 'model', 'text/plain', 208, '08a4b8435d1412147c870104a8e34bf8', '118b6e9b4572c145e7bc51866a307669539eafde', 0, 1418649805),
(10, '546972193c65c.model', '548eddb58b4ee.model', '2014-12-15/', 'model', 'text/plain', 221, '38b086ec6301e686b9124c736c60df7b', 'f0c04950ab0bf45998051f97b3974a0892ab051e', 0, 1418649013),
(13, '性能测试.doxc.doc', '5493b69fd56e8.doc', '2014-12-19/', 'doc', 'application/msword', 134144, '9e73d31b4fad35ecada6bda4ca87ef41', 'ba68d260f496c95fdbe402e73ee9457c6210ee01', 0, 1418966687);

-- --------------------------------------------------------

--
-- Table structure for table `xj_link`
--

CREATE TABLE `xj_link` (
`id` int(11) NOT NULL,
  `picture_id` int(10) NOT NULL COMMENT '图片外键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL COMMENT 'url链接',
  `sort` int(11) NOT NULL COMMENT '排序',
  `group` varchar(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `xj_link`
--

INSERT INTO `xj_link` (`id`, `picture_id`, `name`, `url`, `sort`, `group`, `status`) VALUES
(1, 11, '百度', 'http://www.baidu.com', 1, 'p-2', 1),
(4, 0, 'eqeq', 'qe', 0, 'p-2', 1),
(3, 0, '其他', 'www.weibo.com', 0, 't-1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xj_member`
--

CREATE TABLE `xj_member` (
`id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态,-1代表删除,0代表禁用,1代表正常,2代表未审核,3代表审核未通过',
  `login_times` int(11) DEFAULT '0',
  `nickname` char(40) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代表管理员,1代表运动员,2代表教练,3代表裁判'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `xj_member`
--

INSERT INTO `xj_member` (`id`, `username`, `password`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`, `login_times`, `nickname`, `type`) VALUES
(1, 'admin', '0fdcd401563560514b51347603c8929761a87973', '', 1419563970, 0, 1420003164, 0, 1419563970, 1, 210, '李浩', 0),
(35, 'yundongyuan3', '0fdcd401563560514b51347603c8929761a87973', '', 1420002974, 0, 1420002987, 0, 1420002974, 1, 3, 'y3', 1),
(34, 'yundongyuan1', '0fdcd401563560514b51347603c8929761a87973', '', 1420002661, 0, 1420003125, 0, 1420002661, 1, 5, 'yundongyuan1', 1),
(33, 'qiantai', '0fdcd401563560514b51347603c8929761a87973', '', 1419848144, 0, 0, 0, 1419848144, 1, 0, 'qiantai', 0),
(32, 'kexun', '0fdcd401563560514b51347603c8929761a87973', '', 1419848133, 0, 1419853559, 0, 1419848133, 1, 13, 'kexun', 0),
(31, 'caipan', '0fdcd401563560514b51347603c8929761a87973', '', 1419848101, 0, 0, 0, 1419848101, 1, 0, 'caipan', 3),
(30, 'jiaolian', '0fdcd401563560514b51347603c8929761a87973', '', 1419848088, 0, 1420003058, 0, 1419848088, 1, 10, 'jiaolian', 2),
(29, 'yundongyuan', '0fdcd401563560514b51347603c8929761a87973', '', 1419848072, 0, 1419998741, 0, 1419848072, 1, 20, 'yundongyuan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xj_menu`
--

CREATE TABLE `xj_menu` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `xj_menu`
--

INSERT INTO `xj_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(134, '新增', 128, 0, 'menu/add', 0, '新增菜单dasdasd', '', 0),
(135, '删除', 128, 0, 'menu/del', 0, '', '', 0),
(136, '导入', 128, 0, 'menu/import', 0, '', '', 0),
(137, '编辑', 128, 0, 'menu/edit', 0, '', '', 0),
(138, '主页', 0, 1, 'Index/index', 0, '这个是主页', '', 0),
(141, '用户信息', 140, 0, 'user/index', 0, '', '用户管理', 0),
(140, '用户', 0, 6, 'Public/index', 0, '', '', 0),
(142, '用户行为', 140, 0, 'user/action', 0, '', '行为管理', 0),
(143, '权限管理', 140, 0, 'authManager/index', 0, '', '用户管理', 0),
(144, '行为日志', 140, 0, 'action/actionlog', 0, '', '行为管理', 0),
(145, '修改密码', 140, 0, 'user/updatePassword', 1, '', '', 0),
(146, '修改昵称', 140, 0, 'user/updateNickname', 1, '', '', 0),
(7, '运动员管理', 2, 1, 'athlete/index', 0, '', '人员组织管理', 0),
(4, '人员', 0, 4, 'Public/index', 0, '', '', 0),
(125, '教练员管理', 2, 2, 'coach/index', 0, '', '人员组织管理', 0),
(126, '裁判员管理', 2, 3, 'judge/index', 0, '', '人员组织管理', 0),
(127, '运动队管理', 2, 4, 'equipe/index', 0, '', '人员组织管理', 0),
(128, '菜单管理', 6, 6, 'menu/index', 0, '', '系统设置', 0),
(129, '备份数据库', 6, 6, 'database/exportIndex', 0, '', '数据备份', 0),
(130, '还原数据库', 6, 6, 'database/importIndex', 0, '', '数据备份', 0),
(6, '系统', 0, 9, 'Public/index', 0, '', '', 0),
(148, '网站设置', 6, 0, 'config/group', 0, '', '系统设置', 0),
(149, '配置管理', 6, 0, 'config/index', 0, '', '系统设置', 0),
(150, '前台', 0, 2, 'Public/index', 0, '', '', 0),
(151, '分类管理', 150, 0, 'category/index', 0, '', '', 0),
(152, '模型管理', 6, 0, 'model/index', 0, '', '系统设置', 0),
(153, '内容管理', 150, 0, 'content/index', 0, '', '', 0),
(154, '运动项目管理', 162, 5, 'sports/index', 0, '', '运动项目', 0),
(156, '审核用户', 140, 0, 'userVerify/index', 1, '', '用户管理', 0),
(157, '运动员管理', 4, 0, 'person/athlete', 0, '', '人员管理', 0),
(158, '教练员管理', 4, 0, 'person/coach', 0, '', '人员管理', 0),
(159, '裁判员管理', 4, 0, 'person/referee', 0, '', '人员管理', 0),
(160, '运动队管理', 4, 0, 'sportsteam/index', 0, '', '', 0),
(161, '项目指标管理', 162, 4, 'indicators/index', 0, '', '运动项目', 0),
(162, '竞赛', 0, 3, 'Public/index', 0, '', '', 0),
(163, '赛事计划', 162, 1, 'competition/plan', 0, '', '竞赛管理', 0),
(164, '赛事公告', 162, 2, 'competition/notice', 0, '', '竞赛管理', 0),
(165, '成绩录入', 162, 3, 'competition/achievement', 0, '', '竞赛管理', 0),
(166, '链接管理', 150, 0, 'link/index', 0, '', '', 0),
(167, '科训', 0, 7, 'Public/index', 0, '', '', 0),
(169, '服务', 0, 5, 'Public/index', 0, '', '', 0),
(170, '人员服务', 169, 0, 'service/index', 0, '', '', 0),
(171, '邮件', 0, 8, 'Public/index', 0, '', '', 0),
(172, '收件箱', 171, 0, 'mail/inbox', 0, '', '', 0),
(184, '个人中心', 0, 0, 'Public/index', 1, '', '', 0),
(179, '训练计划管理', 167, 1, 'science/planManager', 0, '', '科训管理', 0),
(180, '训练总结管理', 167, 2, 'science/sumManager', 0, '', '科训管理', 0),
(185, '个人资料', 184, 0, 'mySpace/baseInfo', 0, '', '个人信息', 0),
(186, '修改密码', 184, 0, 'mySpace/updatePassword', 0, '', '设置', 0),
(187, '添加人员', 4, 0, 'person/add', 0, '', '人员管理', 0),
(188, '添加', 166, 0, 'link/add', 0, '', '', 0),
(189, '编辑', 166, 0, 'link/edit', 0, '', '', 0),
(190, '禁用', 166, 0, 'link/changeStatus\r', 0, '', '', 0),
(191, '删除', 166, 0, 'link/del\r', 0, '', '', 0),
(192, '排序', 166, 0, 'link/sort', 0, '', '', 0),
(193, '查看', 153, 0, 'content/news', 0, '', '', 0),
(194, '添加', 153, 0, 'content/add', 0, '', '', 0),
(195, '编辑', 153, 0, 'content/edit', 0, '', '', 0),
(196, '改变状态', 153, 0, 'content/changeStatus', 0, '', '', 0),
(197, '置顶', 153, 0, 'content/up', 0, '', '', 0),
(198, '删除', 153, 0, 'content/del', 0, '', '', 0),
(199, '添加', 151, 0, 'category/add\r', 0, '', '', 0),
(200, '编辑', 151, 0, 'category/edit\r', 0, '', '', 0),
(201, '禁用', 151, 0, 'category/changeStatus\r', 0, '', '', 0),
(202, '删除', 151, 0, 'category/delete\r', 0, '', '', 0),
(203, '排序', 151, 0, 'category/sort\r', 0, '', '', 0),
(204, '清除缓存', 151, 0, 'category/clearCache\r', 0, '', '', 0),
(205, '导入', 151, 0, 'category/import', 0, '', '', 0),
(238, '查看运动员信息', 167, 0, 'science/personInfo', 1, '', '', 0),
(235, '编辑计划', 232, 0, 'science/editPlan', 0, '', '', 0),
(234, '添加计划', 232, 0, 'science/addPlan', 0, '', '', 0),
(233, '训练总结', 167, 4, 'science/sum', 0, '', '', 0),
(232, '训练计划', 167, 3, 'science/plan', 0, '', '', 0),
(230, '审核训练总结', 180, 0, 'science/sumVerify', 0, '', '', 0),
(231, '审核训练总结', 179, 0, 'science/sumVerify', 0, '', '', 0),
(239, '打印运动员信息', 167, 0, 'science/printData', 1, '', '', 0),
(237, '编辑总结', 233, 0, 'science/editSum', 0, '', '', 0),
(236, '添加总结', 233, 0, 'science/addSum', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_model`
--

CREATE TABLE `xj_model` (
`id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(3) unsigned NOT NULL,
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `pid` int(10) NOT NULL COMMENT '父id'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `xj_model`
--

INSERT INTO `xj_model` (`id`, `name`, `title`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `type`, `engine_type`, `pid`) VALUES
(25, 'athlete', '运动员基本信息', '{"1":["173","161","164","163","166","169","162","165","167"],"2":["171","170","172","168"]}', '1:基本信息;2:职业信息', NULL, '', '', '', '', '1:姓名', 2, '', '', 1419511086, 1419680802, 1, 1, 'MyISAM', 0),
(22, 'download', '下载', '{"1":["122","125","133"],"2":["129","127","126","128"]}', '1:基础;2:扩展', NULL, 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418978727, 1418979339, 1, 0, 'MyISAM', 0),
(26, 'coach', '教练员基本信息', '{"1":["187","182","180","179","177","174","181","178","176"],"2":["185","184","188","175","186"]}', '1:基本信息;2:职业信息', NULL, '', '', '', '', '1:姓名', 10, '', '', 1419558335, 1419668980, 1, 1, 'MyISAM', 0),
(18, 'base_article', '基础文档', '{"1":["82","85","86"],"2":["88","87"]}', '1:基础;2:扩展', NULL, 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418802016, 1418889357, 1, 0, 'MyISAM', 0),
(20, 'article', '文章', '{"1":["93","96","106"],"2":["108","107","100","98","104","105","97","99"]}', '1:基础;2:扩展', NULL, 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418954565, 1418965496, 1, 0, 'MyISAM', 0),
(24, 'train_plan', '训练计划', '{"1":["156","157","158"]}', '1:基础', NULL, '', '', '', '', 'task:训练任务', 10, '', '', 1419413952, 1419417486, 1, 3, 'MyISAM', 0),
(27, 'sport_team', '运动队', '', '1:基础', NULL, '', '', '', '', NULL, 10, '', '', 1419559041, 1419559041, 1, 1, 'MyISAM', 0),
(28, 'referee', '裁判员基本信息', '{"1":["203","198","196","195","193","190","197","194","192"],"2":["202","191"]}', '1:基本信息;2:职业信息', NULL, '', '', '', '', '1:姓名', 10, '', '', 1419668778, 1419669609, 1, 1, 'MyISAM', 0),
(29, 'train_sum', '训练总结', '', '1:基础', NULL, '', '', '', '', NULL, 10, '', '', 1419745995, 1419745995, 1, 3, 'MyISAM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_node`
--

CREATE TABLE `xj_node` (
`id` int(11) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL COMMENT '1是栏目,2是单页面,3是外部链接',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `symbol` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目英文名称',
  `pid` int(11) NOT NULL COMMENT '父级栏目',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `model_id` int(11) NOT NULL DEFAULT '0' COMMENT '模型',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `temp_category` char(40) NOT NULL DEFAULT '' COMMENT '栏目页模版',
  `temp_list` char(40) NOT NULL DEFAULT '' COMMENT '列表页模版',
  `temp_content` char(40) NOT NULL DEFAULT '' COMMENT '内容页模版',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '要跳转的url',
  `list_num` int(11) NOT NULL COMMENT '每页显示的记录数量',
  `index_show` tinyint(1) DEFAULT '1' COMMENT '是否在主页显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '-1代表以删除,0代表禁用,1代表正常',
  `verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `xj_node`
--

INSERT INTO `xj_node` (`id`, `type`, `name`, `symbol`, `pid`, `sort`, `model_id`, `create_time`, `update_time`, `create_user`, `temp_category`, `temp_list`, `temp_content`, `url`, `list_num`, `index_show`, `status`, `verify`) VALUES
(59, 1, '规章制度', 'gzzd', 56, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, -1, 0),
(58, 1, '机构职能', 'jgzn', 56, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(79, 1, '帆船', 'fc', 77, 0, 25, 1419833482, 1419833482, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(56, 1, '人事之窗', 'rszc', 0, 3, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(55, 1, '运动项目', 'ydxm', 51, 0, 20, 1419221934, 1419262559, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(54, 1, '赛事信息', 'shxx', 51, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(53, 1, '训练动态', 'xldt', 51, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(52, 1, '赛事安排', 'shap', 51, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(51, 1, '竞技体育', 'jjtj', 0, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(50, 1, '要闻动态', 'ywdt', 0, 1, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(49, 2, '中心简介', 'ptgs', 0, -1, 20, 1419221934, 1419833228, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(60, 1, '职称评估', 'zcpg', 56, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(61, 1, '网上办事', 'wsbs', 56, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(62, 1, '管理制度', 'glzd', 0, 4, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(63, 1, '党务工作', 'dwgz', 62, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(64, 1, '行政制度', 'xzzd', 62, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(65, 1, '训练制度', 'xlzd', 62, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(66, 1, '财务制度', 'cwzd', 62, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(67, 1, '后勤制度', 'hqzd', 62, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(68, 1, '党群园地', 'dqyd', 0, 3, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(69, 1, '党员活动', 'ddjs', 68, 0, 20, 1419221934, 1419833329, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(70, 1, '廉政建设', 'lzjs', 68, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, -1, 0),
(71, 1, '学习园地', 'rszc', 68, 0, 20, 1419221934, 1419833366, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(72, 1, '综合保障', 'zhbz', 0, 5, 20, 1419221934, 1419343307, 0, 'category.html', 'list.html', 'content.html', '', 10, 0, 1, 0),
(73, 1, '训练保障', 'xlbz', 72, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(74, 1, '生活保障', 'shbz', 72, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(75, 1, '安全保障', 'aqbz', 72, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(76, 1, '医疗保障', 'ylbz', 72, 0, 20, 1419221934, 1419221934, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(77, 1, '名将风采', 'mjfc', 0, 6, 20, 1419221934, 1419833589, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(78, 1, '射箭', 'sj', 77, 0, 25, 1419833457, 1419833457, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(80, 1, '田径', 'tj', 77, 0, 25, 1419833510, 1419833510, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(81, 1, '女子橄榄球', 'glq', 77, 0, 25, 1419833539, 1419833539, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(82, 1, '公告管理', 'gggl', 0, 0, 25, 1419833709, 1419833722, 0, 'category.html', 'list.html', 'content.html', '', 10, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_picture`
--

CREATE TABLE `xj_picture` (
`id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `xj_picture`
--

INSERT INTO `xj_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2014-11-13/54642c43484a9.jpg', '', '71dc21797cfb7dca66515adcc4abe93b', 'f96f72d919ce79498f8608a647e5ab534c12c9ab', 1, 1415851075),
(2, '/Uploads/Picture/2014-11-20/546dc0c7c7ef4.png', '', 'd8438e506d466ed38ee6b9dc4a232b40', 'b1191b0a06d36f92bb9fb21bc94daaab80265f03', 1, 1416478919),
(3, '/Uploads/Picture/2014-11-21/546ec9e8d24ec.png', '', '5d1d5d4195258797a0b6fcffadcd8511', '5e6d0c581d800dd0622a76f091b2701456f8e351', 1, 1416546792),
(4, '/Uploads/Picture/2014-11-21/546ed0ddc3cba.png', '', '3c838b9f71bc517a3b8028415bb59cb1', '09ac100f01411da86664b69250aba8f0b83d1491', 1, 1416548573),
(5, '/Uploads/Picture/2014-11-21/546edffc7d2a6.png', '', '2f2493b43169047408921c245572d250', 'b108c0a832627b36e047a473231221e9d58619a2', 1, 1416552444),
(6, '/Uploads/Picture/2014-11-21/546ee04d260c2.png', '', '333e3d1dd2ca98d7e989131b7d9a338f', '45e103b823372a5a033d9d317008c7ed218752f9', 1, 1416552525),
(7, '/Uploads/Picture/2014-11-21/546ee16ca61b1.png', '', '2791e727022d2d863e17a02e57c8237f', 'eb067c0e3dbe17297247c7307b956daab3ea0bad', 1, 1416552812),
(8, '/Uploads/Picture/2014-11-21/546ee1c64539c.png', '', 'f9d7f9a78cc852a599bc301cda134145', 'ef2502b45938da6de9c7321b428737eb4d9a3884', 1, 1416552902),
(9, '/Uploads/picture/2014-12-19/5493ea16ba73f.png', '', '1f990d9695bf79fe5fdcd0f0840f01b7', '18abc3278d6bc1bee0af5ba2272d99b19f5554f5', 1, 1418979862),
(10, '/Uploads/picture/2014-12-19/5493ea229e330.png', '', 'f321e4d05f11c423b4c76fa0730d90bc', '7d8471d49aae560c4c90986f3cef78719f1c5e59', 1, 1418979874),
(11, '/Uploads/picture/2014-12-20/549550c3cf9fc.png', '', '780281674310278a3d6a3956aa3beb2f', 'e04954ee182439a53d4b751577abdc1749463d72', 1, 1419071683),
(12, '/Uploads/picture/2014-12-21/5495eb082a0b8.png', '', '4cacbb3d8c186b4092c625b6337b83b1', '0c4383749ef8ae4fa4c68374939c14efb707e525', 1, 1419111176),
(13, '/Uploads/picture/2014-12-22/5497ef6776144.jpg', '', 'cc26a9e19822e00bf5dade2423f98a1f', '98d8c84d6c849632d2e678eed3c9c1a857ed52f9', 1, 1419243367),
(14, '/Uploads/picture/2014-12-25/549c20281f270.jpg', '', '84672df6d0e467a72564cfd0a4d2e32b', '9683a7d74dc9bd74c40c6d86890cccb83822c3d9', 1, 1419517992),
(15, '/Uploads/picture/2014-12-27/549e71dcc1c01.jpg', '', '907e4a686127af79a7833d2dee568118', '704d6be61ee914e2a01fb91d694a95b4ffdf63c1', 1, 1419669980),
(16, '/Uploads/picture/2014-12-27/549e71e46d603.jpg', '', 'f87e138aec148c5b260d38705dcd1f5a', 'bbeeb497bd5c0f8a490cd7f55a3ab1019a71cb34', 1, 1419669988),
(17, '/Uploads/picture/2014-12-27/549e74799ef25.jpg', '', '0fb4348fd1b792903cfa9b9e7c5706ab', '58acb5a6adae9c0e208da697de6d268802cb1a33', 1, 1419670649),
(18, '/Uploads/picture/2014-12-27/549e77c53d74c.jpg', '', '8721fc6c1a94e5c33aad61983e03847d', 'b8e9d43000caddd41b9400d9190ebdd7cdc0f720', 1, 1419671493),
(19, '/Uploads/picture/2014-12-27/549e78c9df6d5.jpg', '', '500c06dcc1ec4b4be08edea35f1b185b', 'f2b07bbd919763aca6c99031684342a5934d5890', 1, 1419671753),
(20, '/Uploads/picture/2014-12-27/549e799756fbe.jpg', '', '17735a9573e7f839c35bf187972cbf04', 'e1cfc45e5d314d7c5093273aa56e8bc9239c45e7', 1, 1419671959),
(21, '/Uploads/picture/2014-12-27/549e7ada2b54d.jpg', '', 'bbc99dc973eb6631f269858d1929ca69', '0008d143a47164eb1e72997434ea3106cb6cb824', 1, 1419672276),
(22, '/Uploads/picture/2014-12-27/549e7bf07ce95.jpg', '', '0145cee52cbda8b3b756669358872c37', 'f7c434b1786b2baec5be33d1aa19c141ce0cffa1', 1, 1419672560),
(23, '/Uploads/picture/2014-12-29/54a0b7038c685.jpg', '', 'ed9d57f48a5f9e8d3ec4a67746c3e8bf', '40c70a77c4e42a28443bf057df2c8ee8ced23bb1', 1, 1419818755),
(24, '/Uploads/picture/2014-12-29/54a0ba0fc3f61.jpg', '', 'be6192e2556ad8eac853feb88cfcd12b', '996e59c3dfdf511568dc76e88d8851fe95d98912', 1, 1419819535),
(25, '/Uploads/picture/2014-12-31/54a36f62c9af6.jpg', '', 'a55d63bf2084090fbc1a944f835d3bca', 'c492f20815d7b66832f9166225e33288a662d65c', 1, 1419997026),
(26, '/Uploads/picture/2014-12-31/54a3858f1db10.jpg', '', 'da1b29b1c904da4d009b4bcb8f8d30ac', '070050538b0daa96f59af7d5b0434940fab1ced4', 1, 1420002703);

-- --------------------------------------------------------

--
-- Table structure for table `xj_referee`
--

CREATE TABLE `xj_referee` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户标示',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `birthday` int(10) NOT NULL COMMENT '出生日期',
  `nativePlace` char(255) NOT NULL COMMENT '籍贯',
  `gender` char(10) NOT NULL COMMENT '性别',
  `homeAddress` varchar(255) NOT NULL COMMENT '家庭住址',
  `nation` char(50) NOT NULL COMMENT '民族',
  `phone` varchar(255) NOT NULL COMMENT '联系方式',
  `technicalGrade` char(50) NOT NULL COMMENT '裁判等级',
  `political` char(50) NOT NULL COMMENT '政治面貌',
  `sports` char(50) NOT NULL COMMENT '运动项目',
  `picture` int(10) unsigned NOT NULL COMMENT '头像'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xj_rel_position`
--

CREATE TABLE `xj_rel_position` (
`id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `model_name` char(40) NOT NULL,
  `news_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xj_sports`
--

CREATE TABLE `xj_sports` (
`id` mediumint(10) NOT NULL,
  `pid` mediumint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(100) NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=521 ;

--
-- Dumping data for table `xj_sports`
--

INSERT INTO `xj_sports` (`id`, `pid`, `status`, `name`, `sort`, `level`) VALUES
(42, 0, 1, '游泳', 0, 0),
(43, 42, 1, '游泳', 0, 1),
(44, 43, 1, '男子', 0, 2),
(45, 44, 1, '自由泳50米', 0, 3),
(46, 44, 1, '自由泳100米', 0, 3),
(47, 44, 1, '自由泳200米', 0, 3),
(48, 44, 1, '自由泳400米', 0, 3),
(49, 44, 1, '自由泳1500米', 0, 3),
(50, 44, 1, '仰泳100米', 0, 3),
(51, 44, 1, '仰泳200米', 0, 3),
(52, 44, 1, '蛙泳100米', 0, 3),
(53, 44, 1, '蛙泳200米', 0, 3),
(54, 44, 1, '蝶泳100米', 0, 3),
(55, 44, 1, '蝶泳200米', 0, 3),
(56, 44, 1, '个人混合200米', 0, 3),
(57, 44, 1, '个人混合400米', 0, 3),
(58, 44, 1, '自由泳接力4×100米', 0, 3),
(59, 44, 1, '自由泳接力4×200米', 0, 3),
(60, 44, 1, '混合泳接力4×100米', 0, 3),
(61, 44, 1, '10公里马拉松游泳', 0, 3),
(62, 43, 1, '女子', 0, 2),
(63, 62, 1, '自由泳50米', 0, 3),
(64, 62, 1, '自由泳100米', 0, 3),
(65, 62, 1, '自由泳200米', 0, 3),
(66, 62, 1, '自由泳400米', 0, 3),
(67, 62, 1, '自由泳800米', 0, 3),
(68, 62, 1, '仰泳100米', 0, 3),
(69, 62, 1, '仰泳200米', 0, 3),
(70, 62, 1, '蛙泳100米', 0, 3),
(71, 62, 1, '蛙泳200米', 0, 3),
(72, 62, 1, '蝶泳100米', 0, 3),
(73, 62, 1, '蝶泳200米', 0, 3),
(74, 62, 1, '个人混合200米', 0, 3),
(75, 62, 1, '个人混合400米', 0, 3),
(76, 62, 1, '自由泳接力4×100米', 0, 3),
(77, 62, 1, '自由泳接力4×200米', 0, 3),
(78, 62, 1, '混合泳接力4×100米', 0, 3),
(79, 62, 1, '10公里马拉松游泳', 0, 3),
(80, 42, 1, '跳水', 0, 1),
(81, 80, 1, '男子', 0, 2),
(82, 81, 1, '团体', 0, 3),
(83, 81, 1, '个人全能', 0, 3),
(84, 81, 1, '3米跳板', 0, 3),
(85, 81, 1, '10米跳台', 0, 3),
(86, 81, 1, '双人3米跳板', 0, 3),
(87, 81, 1, '双人10米跳台', 0, 3),
(88, 80, 1, '女子', 0, 2),
(89, 88, 1, '团体', 0, 3),
(90, 88, 1, '个人全能', 0, 3),
(91, 88, 1, '3米跳板', 0, 3),
(92, 88, 1, '10米跳台', 0, 3),
(93, 88, 1, '双人3米跳板', 0, 3),
(94, 88, 1, '双人10米跳台', 0, 3),
(95, 42, 1, '水球', 0, 1),
(96, 95, 1, '男子', 0, 2),
(97, 96, 1, '男子水球', 0, 3),
(98, 95, 1, '女子', 0, 2),
(99, 98, 1, '女子水球', 0, 3),
(100, 42, 1, '花样游泳', 0, 1),
(101, 100, 1, '女子', 0, 2),
(102, 101, 1, '双人', 0, 3),
(103, 101, 1, '集体', 0, 3),
(104, 101, 1, '自由组合', 0, 3),
(105, 0, 1, '射箭', 0, 0),
(106, 105, 1, '射箭', 0, 1),
(107, 106, 1, '男子', 0, 2),
(108, 107, 1, '个人奥林匹克淘汰赛', 0, 3),
(109, 107, 1, '团体奥林匹克淘汰赛', 0, 3),
(110, 106, 1, '女子', 0, 2),
(111, 110, 1, '个人奥林匹克淘汰赛', 0, 3),
(112, 110, 1, '团体奥林匹克淘汰赛', 0, 3),
(113, 0, 1, '田径', 0, 0),
(114, 113, 1, '田径', 0, 1),
(115, 114, 1, '男子', 0, 2),
(116, 115, 1, '100米', 0, 3),
(117, 115, 1, '200米', 0, 3),
(118, 115, 1, '400米', 0, 3),
(119, 115, 1, '1500米', 0, 3),
(120, 115, 1, '10000米', 0, 3),
(121, 115, 1, '110米栏', 0, 3),
(122, 115, 1, '400米栏', 0, 3),
(123, 115, 1, '20公里竞走个人', 0, 3),
(124, 115, 1, '20公里竞走团体', 0, 3),
(125, 115, 1, '50公里竞走个人', 0, 3),
(126, 115, 1, '马拉松', 0, 3),
(127, 115, 1, '4×100米接力', 0, 3),
(128, 115, 1, '4×400米接力', 0, 3),
(129, 115, 1, '跳高', 0, 3),
(130, 115, 1, '撑杆跳高', 0, 3),
(131, 115, 1, '跳远', 0, 3),
(132, 115, 1, '三级跳远', 0, 3),
(133, 115, 1, '铅球', 0, 3),
(134, 115, 1, '铁饼', 0, 3),
(135, 115, 1, '链球', 0, 3),
(136, 115, 1, '标枪', 0, 3),
(137, 115, 1, '十项全能', 0, 3),
(138, 114, 1, '女子', 0, 2),
(139, 138, 1, '100米', 0, 3),
(140, 138, 1, '200米', 0, 3),
(141, 138, 1, '400米', 0, 3),
(142, 138, 1, '800米', 0, 3),
(143, 138, 1, '1500米', 0, 3),
(144, 138, 1, '5000米', 0, 3),
(145, 138, 1, '10000米', 0, 3),
(146, 138, 1, '100米栏', 0, 3),
(147, 138, 1, '400米栏', 0, 3),
(148, 138, 1, '20公里竞走个人', 0, 3),
(149, 138, 1, '20公里竞走团体', 0, 3),
(150, 138, 1, '马拉松个人', 0, 3),
(151, 138, 1, '马拉松团体', 0, 3),
(152, 138, 1, '4×100米接力', 0, 3),
(153, 138, 1, '4×400米接力', 0, 3),
(154, 138, 1, '跳高', 0, 3),
(155, 138, 1, '撑杆跳高', 0, 3),
(156, 138, 1, '跳远', 0, 3),
(157, 138, 1, '三级跳远', 0, 3),
(158, 138, 1, '铅球', 0, 3),
(159, 138, 1, '铁饼', 0, 3),
(160, 138, 1, '链球', 0, 3),
(161, 138, 1, '标枪', 0, 3),
(162, 138, 1, '七项全能', 0, 3),
(163, 0, 1, '羽毛球', 0, 0),
(164, 163, 1, '羽毛球', 0, 1),
(165, 164, 1, '男子', 0, 2),
(166, 165, 1, '单打', 0, 3),
(167, 165, 1, '双打', 0, 3),
(168, 165, 1, '团体', 0, 3),
(169, 164, 1, '女子', 0, 2),
(170, 169, 1, '单打', 0, 3),
(171, 169, 1, '双打', 0, 3),
(172, 169, 1, '团体', 0, 3),
(173, 164, 1, '混合', 0, 2),
(174, 173, 1, '混合双打', 0, 3),
(175, 0, 1, '棒球', 0, 0),
(176, 175, 1, '棒球', 0, 1),
(177, 176, 1, '男子', 0, 2),
(178, 177, 1, '棒球', 0, 3),
(179, 0, 1, '篮球', 0, 0),
(180, 179, 1, '篮球', 0, 1),
(181, 180, 1, '男子', 0, 2),
(182, 181, 1, '成年组', 0, 3),
(183, 181, 1, '18岁以下组', 0, 3),
(184, 180, 1, '女子', 0, 2),
(185, 184, 1, '成年组', 0, 3),
(186, 184, 1, '18岁以下组', 0, 3),
(187, 0, 1, '拳击', 0, 0),
(188, 187, 1, '拳击', 0, 1),
(189, 188, 1, '男子', 0, 2),
(190, 189, 1, '46－49公斤级', 0, 3),
(191, 189, 1, '52公斤级', 0, 3),
(192, 189, 1, '56公斤级', 0, 3),
(193, 189, 1, '60公斤级', 0, 3),
(194, 189, 1, '64公斤级', 0, 3),
(195, 189, 1, '69公斤级', 0, 3),
(196, 189, 1, '75公斤级', 0, 3),
(197, 189, 1, '81公斤级', 0, 3),
(198, 189, 1, '91公斤级', 0, 3),
(199, 189, 1, '+91公斤级', 0, 3),
(200, 188, 1, '女子', 0, 2),
(201, 200, 1, '48－51公斤级', 0, 3),
(202, 200, 1, '57－60公斤级', 0, 3),
(203, 200, 1, '69－75公斤级', 0, 3),
(204, 0, 1, '皮划艇', 0, 0),
(205, 204, 1, '皮划艇静水', 0, 1),
(206, 205, 1, '男子', 0, 2),
(207, 206, 1, '200米单人皮艇', 0, 3),
(208, 206, 1, '200米双人皮艇', 0, 3),
(209, 206, 1, '200米单人划艇', 0, 3),
(210, 206, 1, '1000米单人皮艇', 0, 3),
(211, 206, 1, '1000米双人皮艇', 0, 3),
(212, 206, 1, '1000米四人皮艇', 0, 3),
(213, 206, 1, '1000米单人划艇', 0, 3),
(214, 206, 1, '1000米双人划艇', 0, 3),
(215, 205, 1, '女子', 0, 2),
(216, 215, 1, '200米单人皮艇', 0, 3),
(217, 215, 1, '500米单人皮艇', 0, 3),
(218, 215, 1, '500米双人皮艇', 0, 3),
(219, 215, 1, '500米四人皮艇', 0, 3),
(220, 204, 1, '激流回旋', 0, 1),
(221, 220, 1, '男子', 0, 2),
(222, 221, 1, '单人皮艇', 0, 3),
(223, 221, 1, '单人划艇', 0, 3),
(224, 221, 1, '双人划艇', 0, 3),
(225, 220, 1, '女子', 0, 2),
(226, 225, 1, '单人皮艇', 0, 3),
(227, 0, 1, '自行车', 0, 0),
(228, 227, 1, '自行车', 0, 1),
(229, 228, 1, '男子', 0, 2),
(230, 229, 1, '场地赛5项：争先赛', 0, 3),
(231, 229, 1, '场地赛5项：团体竞速赛', 0, 3),
(232, 229, 1, '场地赛5项：凯林赛', 0, 3),
(233, 229, 1, '场地赛5项：团体追逐赛', 0, 3),
(234, 229, 1, '场地赛5项：全能赛', 0, 3),
(235, 229, 1, '公路赛2项：个人计时赛', 0, 3),
(236, 229, 1, '公路赛2项：个人赛', 0, 3),
(237, 229, 1, '山地车赛1项：越野赛', 0, 3),
(238, 229, 1, 'BMX小轮车赛1项：越野赛', 0, 3),
(239, 0, 1, '马术', 0, 0),
(240, 239, 1, '马术', 0, 1),
(241, 240, 1, '马术', 0, 2),
(242, 241, 1, '场地障碍个人赛', 0, 3),
(243, 241, 1, '场地障碍团体赛', 0, 3),
(244, 241, 1, '盛装舞步个人赛', 0, 3),
(245, 241, 1, '盛装舞步团体赛', 0, 3),
(246, 241, 1, '三项赛个人赛', 0, 3),
(247, 241, 1, '三项赛团体赛', 0, 3),
(248, 0, 1, '击剑', 0, 0),
(249, 248, 1, '击剑', 0, 1),
(250, 249, 1, '男子', 0, 2),
(251, 250, 1, '花剑个人赛', 0, 3),
(252, 250, 1, '重剑个人赛', 0, 3),
(253, 250, 1, '佩剑个人赛', 0, 3),
(254, 250, 1, '花剑团体赛', 0, 3),
(255, 250, 1, '重剑团体赛', 0, 3),
(256, 250, 1, '佩剑团体赛', 0, 3),
(257, 249, 1, '女子', 0, 2),
(258, 257, 1, '花剑个人赛', 0, 3),
(259, 257, 1, '重剑个人赛', 0, 3),
(260, 257, 1, '佩剑个人赛', 0, 3),
(261, 257, 1, '花剑团体赛', 0, 3),
(262, 257, 1, '重剑团体赛', 0, 3),
(263, 257, 1, '佩剑团体赛', 0, 3),
(264, 0, 1, '足球', 0, 0),
(265, 264, 1, '足球', 0, 1),
(266, 265, 1, '男子', 0, 2),
(267, 266, 1, '20岁以下组', 0, 3),
(268, 266, 1, '18岁以下组', 0, 3),
(269, 265, 1, '女子', 0, 2),
(270, 269, 1, '成年组', 0, 3),
(271, 269, 1, '18岁以下组', 0, 3),
(272, 0, 1, '高尔夫球', 0, 0),
(273, 272, 1, '高尔夫球', 0, 1),
(274, 273, 1, '男子', 0, 2),
(275, 274, 1, '男子团体', 0, 3),
(276, 273, 1, '女子', 0, 2),
(277, 276, 1, '女子团体', 0, 3),
(278, 0, 1, '体操', 0, 0),
(279, 278, 1, '体操', 0, 1),
(280, 279, 1, '男子', 0, 2),
(281, 280, 1, '团体', 0, 3),
(282, 280, 1, '全能', 0, 3),
(283, 280, 1, '自由体操', 0, 3),
(284, 280, 1, '鞍马', 0, 3),
(285, 280, 1, '吊环', 0, 3),
(286, 280, 1, '跳马', 0, 3),
(287, 280, 1, '双杠', 0, 3),
(288, 280, 1, '单杠', 0, 3),
(289, 279, 1, '女子', 0, 2),
(290, 289, 1, '团体', 0, 3),
(291, 289, 1, '全能', 0, 3),
(292, 289, 1, '跳马', 0, 3),
(293, 289, 1, '高低杠', 0, 3),
(294, 289, 1, '平衡木', 0, 3),
(295, 289, 1, '自由体操', 0, 3),
(296, 278, 1, '艺术体操', 0, 1),
(297, 296, 1, '女子', 0, 2),
(298, 297, 1, '个人全能	', 0, 3),
(299, 297, 1, '集体全能', 0, 3),
(300, 278, 1, '蹦床', 0, 1),
(301, 300, 1, '男子', 0, 2),
(302, 301, 1, '个人', 0, 3),
(303, 301, 1, '团体', 0, 3),
(304, 300, 1, '女子', 0, 2),
(305, 304, 1, '个人', 0, 3),
(306, 304, 1, '团体', 0, 3),
(307, 0, 1, '手球', 0, 0),
(308, 307, 1, '手球', 0, 1),
(309, 308, 1, '男子', 0, 2),
(310, 309, 1, '男子手球', 0, 3),
(311, 308, 1, '女子', 0, 2),
(312, 311, 1, '女子手球', 0, 3),
(313, 0, 1, '曲棍球', 0, 0),
(314, 313, 1, '曲棍球', 0, 1),
(315, 314, 1, '男子', 0, 2),
(316, 315, 1, '男子曲棍球', 0, 3),
(317, 314, 1, '女子', 0, 2),
(318, 317, 1, '女子曲棍球', 0, 3),
(319, 0, 1, '柔道', 0, 0),
(320, 319, 1, '柔道', 0, 1),
(321, 320, 1, '男子', 0, 2),
(322, 321, 1, '-60公斤级', 0, 3),
(323, 321, 1, '-66公斤级', 0, 3),
(324, 321, 1, '-73公斤级', 0, 3),
(325, 321, 1, '-81公斤级', 0, 3),
(326, 321, 1, '-90公斤级', 0, 3),
(327, 321, 1, '-100公斤级', 0, 3),
(328, 321, 1, '+100公斤级', 0, 3),
(329, 320, 1, '女子', 0, 2),
(330, 329, 1, '-48公斤级', 0, 3),
(331, 329, 1, '-52公斤级', 0, 3),
(332, 329, 1, '-57公斤级', 0, 3),
(333, 329, 1, '-63公斤级', 0, 3),
(334, 329, 1, '-70公斤级', 0, 3),
(335, 329, 1, '-78公斤级', 0, 3),
(336, 329, 1, '+78公斤级', 0, 3),
(337, 0, 1, '现代五项', 0, 0),
(338, 337, 1, '现代五项', 0, 1),
(339, 338, 1, '男子', 0, 2),
(340, 339, 1, '个人赛', 0, 3),
(341, 338, 1, '女子', 0, 2),
(342, 341, 1, '个人赛', 0, 3),
(343, 338, 1, '混合', 0, 2),
(344, 343, 1, '男女混合团体接力赛', 0, 3),
(345, 0, 1, '赛艇', 0, 0),
(346, 345, 1, '赛艇', 0, 1),
(347, 346, 1, '男子', 0, 2),
(348, 347, 1, '双人双桨', 0, 3),
(349, 347, 1, '四人双桨', 0, 3),
(350, 347, 1, '双人单桨无舵手', 0, 3),
(351, 347, 1, '四人单桨无舵手', 0, 3),
(352, 347, 1, '八人单桨有舵手', 0, 3),
(353, 347, 1, '轻量级：双人双桨', 0, 3),
(354, 347, 1, '轻量级：四人单桨无舵手', 0, 3),
(355, 346, 1, '女子', 0, 2),
(356, 355, 1, '单人双桨', 0, 3),
(357, 355, 1, '双人双桨', 0, 3),
(358, 355, 1, '四人双桨', 0, 3),
(359, 355, 1, '双人单桨无舵手', 0, 3),
(360, 355, 1, '八人单桨有舵手', 0, 3),
(361, 355, 1, '轻量级：双人双桨', 0, 3),
(362, 355, 1, '轻量级：四人双桨', 0, 3),
(363, 0, 1, '橄榄球', 0, 0),
(364, 363, 1, '橄榄球', 0, 1),
(365, 364, 1, '男子', 0, 2),
(366, 365, 1, '男子七人制', 0, 3),
(367, 364, 1, '女子', 0, 2),
(368, 367, 1, '女子七人制', 0, 3),
(369, 0, 1, '帆船帆板', 0, 0),
(370, 369, 1, '帆船帆板', 0, 1),
(371, 370, 1, '男子', 0, 2),
(372, 371, 1, '激光级奥林匹克航线赛', 0, 3),
(373, 371, 1, '470级奥林匹克航线赛', 0, 3),
(374, 371, 1, '芬兰人级奥林匹克航线赛', 0, 3),
(375, 371, 1, 'RS：X级奥林匹克航线赛', 0, 3),
(376, 370, 1, '女子', 0, 2),
(377, 376, 1, '激光雷迪尔级奥林匹克航线赛', 0, 3),
(378, 376, 1, '470级奥林匹克航线赛', 0, 3),
(379, 376, 1, 'RS：X级奥林匹克航线赛', 0, 3),
(380, 370, 1, '混合', 0, 2),
(381, 380, 1, 'OP级队赛', 0, 3),
(382, 0, 1, '射击', 0, 0),
(383, 382, 1, '射击', 0, 1),
(384, 383, 1, '男子', 0, 2),
(385, 384, 1, '10米气手枪个人', 0, 3),
(386, 384, 1, '10米气手枪团体', 0, 3),
(387, 384, 1, '25米手枪速射', 0, 3),
(388, 384, 1, '50米手枪', 0, 3),
(389, 384, 1, '10米气步枪个人', 0, 3),
(390, 384, 1, '10米气步枪团体', 0, 3),
(391, 384, 1, '50米步枪3种姿势', 0, 3),
(392, 384, 1, '50米步枪卧射', 0, 3),
(393, 384, 1, '飞碟双多向', 0, 3),
(394, 384, 1, '飞碟双向', 0, 3),
(395, 384, 1, '飞碟多向', 0, 3),
(396, 383, 1, '女子（7项）', 0, 2),
(397, 396, 1, '10米气手枪', 0, 3),
(398, 396, 1, '25米运动手枪', 0, 3),
(399, 396, 1, '10米气步枪个人', 0, 3),
(400, 396, 1, '10米气步枪团体', 0, 3),
(401, 396, 1, '50米步枪3种姿势', 0, 3),
(402, 396, 1, '飞碟多向', 0, 3),
(403, 396, 1, '飞碟双向', 0, 3),
(404, 0, 1, '垒球', 0, 0),
(405, 404, 1, '垒球', 0, 1),
(406, 405, 1, '女子', 0, 2),
(407, 406, 1, '垒球', 0, 3),
(408, 0, 1, '乒乓球', 0, 0),
(409, 408, 1, '乒乓球', 0, 1),
(410, 409, 1, '男子', 0, 2),
(411, 410, 1, '单打', 0, 3),
(412, 410, 1, '双打', 0, 3),
(413, 410, 1, '团体', 0, 3),
(414, 409, 1, '女子', 0, 2),
(415, 414, 1, '单打', 0, 3),
(416, 414, 1, '双打', 0, 3),
(417, 414, 1, '团体', 0, 3),
(418, 409, 1, '混合', 0, 2),
(419, 418, 1, '混合双打', 0, 3),
(420, 0, 1, '跆拳道', 0, 0),
(421, 420, 1, '跆拳道', 0, 1),
(422, 421, 1, '男子', 0, 2),
(423, 422, 1, '58公斤级', 0, 3),
(424, 422, 1, '68公斤级', 0, 3),
(425, 422, 1, '-80公斤级', 0, 3),
(426, 422, 1, '+80公斤级', 0, 3),
(427, 421, 1, '女子', 0, 2),
(428, 427, 1, '49公斤级', 0, 3),
(429, 427, 1, '57公斤级', 0, 3),
(430, 427, 1, '-67公斤级', 0, 3),
(431, 427, 1, '+67公斤级', 0, 3),
(432, 0, 1, '网球', 0, 0),
(433, 432, 1, '网球', 0, 1),
(434, 433, 1, '男子', 0, 2),
(435, 434, 1, '单打', 0, 3),
(436, 434, 1, '双打', 0, 3),
(437, 434, 1, '团体', 0, 3),
(438, 433, 1, '女子', 0, 2),
(439, 438, 1, '单打', 0, 3),
(440, 438, 1, '双打', 0, 3),
(441, 438, 1, '团体', 0, 3),
(442, 0, 1, '铁人三项', 0, 0),
(443, 442, 1, '铁人三项', 0, 1),
(444, 443, 1, '男子', 0, 2),
(445, 444, 1, '个人赛', 0, 3),
(446, 443, 1, '女子', 0, 2),
(447, 446, 1, '个人赛', 0, 3),
(448, 0, 1, '排球', 0, 0),
(449, 448, 1, '排球', 0, 1),
(450, 449, 1, '男子', 0, 2),
(451, 450, 1, '21岁以下组', 0, 3),
(452, 450, 1, '成年组', 0, 3),
(453, 449, 1, '女子', 0, 2),
(454, 453, 1, '21岁以下组', 0, 3),
(455, 449, 1, '成年组', 0, 2),
(456, 448, 1, '沙滩排球', 0, 1),
(457, 456, 1, '男子', 0, 2),
(458, 457, 1, '男子', 0, 3),
(459, 456, 1, '女子', 0, 2),
(460, 459, 1, '女子', 0, 3),
(461, 0, 1, '举重', 0, 0),
(462, 461, 1, '举重', 0, 1),
(463, 462, 1, '男子', 0, 2),
(464, 463, 1, '56公斤级', 0, 3),
(465, 463, 1, '62公斤级', 0, 3),
(466, 463, 1, '69公斤级', 0, 3),
(467, 463, 1, '77公斤级', 0, 3),
(468, 463, 1, '85公斤级', 0, 3),
(469, 463, 1, '94公斤级', 0, 3),
(470, 463, 1, '105公斤级', 0, 3),
(471, 463, 1, '+105公斤级', 0, 3),
(472, 462, 1, '女子', 0, 2),
(473, 472, 1, '48公斤级', 0, 3),
(474, 472, 1, '53公斤级', 0, 3),
(475, 472, 1, '58公斤级', 0, 3),
(476, 472, 1, '63公斤级', 0, 3),
(477, 472, 1, '69公斤级', 0, 3),
(478, 472, 1, '75公斤级', 0, 3),
(479, 472, 1, '+75公斤级', 0, 3),
(480, 0, 1, '国际式摔跤', 0, 0),
(481, 480, 1, '摔跤', 0, 1),
(482, 481, 1, '男子', 0, 2),
(483, 482, 1, '古典式6项：59公斤级', 0, 3),
(484, 482, 1, '古典式6项：66公斤级', 0, 3),
(485, 482, 1, '古典式6项：75公斤级', 0, 3),
(486, 482, 1, '古典式6项：85公斤级', 0, 3),
(487, 482, 1, '古典式6项：98公斤级', 0, 3),
(488, 482, 1, '古典式6项：130公斤级', 0, 3),
(489, 482, 1, '自由式5项：65公斤级', 0, 3),
(490, 482, 1, '自由式5项：74公斤级', 0, 3),
(491, 482, 1, '自由式5项：86公斤级', 0, 3),
(492, 482, 1, '自由式5项：97公斤级', 0, 3),
(493, 482, 1, '自由式5项：125公斤级', 0, 3),
(494, 481, 1, '女子', 0, 2),
(495, 494, 1, '自由式6项：48公斤级', 0, 3),
(496, 494, 1, '自由式6项：53公斤级', 0, 3),
(497, 494, 1, '自由式6项：58公斤级', 0, 3),
(498, 494, 1, '自由式6项：63公斤级', 0, 3),
(499, 494, 1, '自由式6项：69公斤级', 0, 3),
(500, 494, 1, '自由式6项：75公斤级', 0, 3),
(501, 0, 1, '武术', 0, 0),
(502, 501, 1, '武术套路', 0, 1),
(503, 502, 1, '男子', 0, 2),
(504, 503, 1, '长拳刀术棍术全能', 0, 3),
(505, 503, 1, '南拳南刀南棍全能', 0, 3),
(506, 503, 1, '太极拳太极剑全能', 0, 3),
(507, 502, 1, '女子', 0, 2),
(508, 507, 1, '长拳剑术枪术全能', 0, 3),
(509, 507, 1, '南拳南刀南棍全能', 0, 3),
(510, 507, 1, '太极拳太极剑全能', 0, 3),
(511, 502, 1, '混合', 0, 2),
(512, 511, 1, '团体（男子枪术、男子剑术、男子对练、女子刀术、女子棍术、女子对练）', 0, 3),
(513, 501, 1, '武术散打', 0, 1),
(514, 513, 1, '男子', 0, 2),
(515, 514, 1, '60公斤级', 0, 3),
(516, 514, 1, '75公斤级', 0, 3),
(517, 514, 1, '90公斤级', 0, 3),
(518, 514, 1, '团体（56公斤级、65公斤级、70公斤级、80公斤级、90公斤以上级）', 0, 3),
(519, 513, 1, '女子', 0, 2),
(520, 519, 1, '团体（52公斤级、60公斤级、70公斤级）', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `xj_sport_team`
--

CREATE TABLE `xj_sport_team` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '运动队名称',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `pid` int(10) NOT NULL COMMENT '上级'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=18 ;

--
-- Dumping data for table `xj_sport_team`
--

INSERT INTO `xj_sport_team` (`id`, `name`, `status`, `pid`) VALUES
(1, '天津市田径运动管理中心', 0, 0),
(2, '天津市游泳运动管理中心', 0, 0),
(3, '天津市篮球运动管理中心', 0, 0),
(4, '天津市排球运动管理中心', 0, 0),
(5, '天津市体操运动管理中心', 0, 0),
(6, '天津市网球运动管理中心', 0, 0),
(7, '天津市乒乓球羽毛球小球运动管理中心', 0, 0),
(8, '天津市武术射击射箭运动管理中心', 0, 0),
(9, '天津市自行车击剑运动管理中心', 0, 0),
(10, '天津市举重摔跤柔道拳击跆拳道运动管理中心', 0, 0),
(11, '天津市手球曲棍球棒球垒球运动管理中心', 0, 0),
(12, '天津市棋牌运动管理中心', 0, 0),
(14, '天津市足球运动管理中心', 0, 0),
(15, '短跑运动队', -1, 1),
(16, '短跑运动队', 0, 1),
(17, '游泳运动队', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `xj_train_plan`
--

CREATE TABLE `xj_train_plan` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `target` text NOT NULL COMMENT '训练目标',
  `task` text NOT NULL COMMENT '训练任务',
  `arrange` text NOT NULL COMMENT '训练安排',
  `type` tinyint(1) unsigned NOT NULL COMMENT '计划类型',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新日期',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=20 ;

--
-- Dumping data for table `xj_train_plan`
--

INSERT INTO `xj_train_plan` (`id`, `uid`, `create_time`, `target`, `task`, `arrange`, `type`, `update_time`, `status`) VALUES
(19, 30, 1419848295, '我的计划', '我的任务', '我的安排', 0, 1419848295, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xj_train_sum`
--

CREATE TABLE `xj_train_sum` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '发表用户',
  `content` text NOT NULL COMMENT '总结内容',
  `type` tinyint(1) unsigned NOT NULL COMMENT '总结类型(0是日总结,1是周总结,2是月总结,3是年底总结)',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态',
  `verify_uid` int(10) unsigned NOT NULL COMMENT '审核人'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=16 ;

--
-- Dumping data for table `xj_train_sum`
--

INSERT INTO `xj_train_sum` (`id`, `uid`, `content`, `type`, `create_time`, `update_time`, `status`, `verify_uid`) VALUES
(12, 29, '本周总结', 1, 1419848246, 1419848246, 1, 0),
(13, 34, '运动员2的总结', 0, 1420002774, 1420002774, 2, 0),
(14, 34, '运动员2的周总结', 1, 1420002793, 1420002793, 1, 0),
(15, 35, 'y3的日总结', 0, 1420003042, 1420003042, 2, 0),
(11, 29, '今日总结', 0, 1419848236, 1419848236, 2, 0),
(10, 7, '我的总结', 0, 1419846007, 1419846007, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xj_verify`
--

CREATE TABLE `xj_verify` (
`id` int(11) NOT NULL,
  `topic_table` char(40) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `xj_verify`
--

INSERT INTO `xj_verify` (`id`, `topic_table`, `topic_id`, `content`, `result`, `create_time`, `update_time`, `uid`) VALUES
(5, 'train_plan', 19, '我要审核你', 0, 1419849699, 1419849699, 32),
(6, 'train_sum', 12, 'das', 0, 1419853245, 1419853245, 32),
(7, 'train_sum', 14, '很好', 0, 1420003114, 1420003114, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xj_action`
--
ALTER TABLE `xj_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_action_log`
--
ALTER TABLE `xj_action_log`
 ADD PRIMARY KEY (`id`), ADD KEY `action_ip_ix` (`action_ip`), ADD KEY `action_id_ix` (`action_id`), ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `xj_article`
--
ALTER TABLE `xj_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_athlete`
--
ALTER TABLE `xj_athlete`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_attribute`
--
ALTER TABLE `xj_attribute`
 ADD PRIMARY KEY (`id`), ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `xj_auth_extend`
--
ALTER TABLE `xj_auth_extend`
 ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`), ADD KEY `uid` (`group_id`), ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `xj_auth_group`
--
ALTER TABLE `xj_auth_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_auth_group_access`
--
ALTER TABLE `xj_auth_group_access`
 ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`), ADD KEY `uid` (`uid`), ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `xj_auth_rule`
--
ALTER TABLE `xj_auth_rule`
 ADD PRIMARY KEY (`id`), ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `xj_base_article`
--
ALTER TABLE `xj_base_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_coach`
--
ALTER TABLE `xj_coach`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_config`
--
ALTER TABLE `xj_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`), ADD KEY `type` (`type`), ADD KEY `group` (`group`);

--
-- Indexes for table `xj_download`
--
ALTER TABLE `xj_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_file`
--
ALTER TABLE `xj_file`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `xj_link`
--
ALTER TABLE `xj_link`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_member`
--
ALTER TABLE `xj_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD KEY `status` (`status`);

--
-- Indexes for table `xj_menu`
--
ALTER TABLE `xj_menu`
 ADD PRIMARY KEY (`id`), ADD KEY `pid` (`pid`);

--
-- Indexes for table `xj_model`
--
ALTER TABLE `xj_model`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_node`
--
ALTER TABLE `xj_node`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_picture`
--
ALTER TABLE `xj_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_referee`
--
ALTER TABLE `xj_referee`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_rel_position`
--
ALTER TABLE `xj_rel_position`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_sports`
--
ALTER TABLE `xj_sports`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_sport_team`
--
ALTER TABLE `xj_sport_team`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_train_plan`
--
ALTER TABLE `xj_train_plan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_train_sum`
--
ALTER TABLE `xj_train_sum`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xj_verify`
--
ALTER TABLE `xj_verify`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xj_action`
--
ALTER TABLE `xj_action`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `xj_action_log`
--
ALTER TABLE `xj_action_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=528;
--
-- AUTO_INCREMENT for table `xj_article`
--
ALTER TABLE `xj_article`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `xj_athlete`
--
ALTER TABLE `xj_athlete`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `xj_attribute`
--
ALTER TABLE `xj_attribute`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT for table `xj_auth_group`
--
ALTER TABLE `xj_auth_group`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `xj_auth_rule`
--
ALTER TABLE `xj_auth_rule`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=429;
--
-- AUTO_INCREMENT for table `xj_base_article`
--
ALTER TABLE `xj_base_article`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xj_coach`
--
ALTER TABLE `xj_coach`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xj_config`
--
ALTER TABLE `xj_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `xj_download`
--
ALTER TABLE `xj_download`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xj_file`
--
ALTER TABLE `xj_file`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `xj_link`
--
ALTER TABLE `xj_link`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `xj_member`
--
ALTER TABLE `xj_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `xj_menu`
--
ALTER TABLE `xj_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `xj_model`
--
ALTER TABLE `xj_model`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `xj_node`
--
ALTER TABLE `xj_node`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `xj_picture`
--
ALTER TABLE `xj_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `xj_referee`
--
ALTER TABLE `xj_referee`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `xj_rel_position`
--
ALTER TABLE `xj_rel_position`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xj_sports`
--
ALTER TABLE `xj_sports`
MODIFY `id` mediumint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=521;
--
-- AUTO_INCREMENT for table `xj_sport_team`
--
ALTER TABLE `xj_sport_team`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `xj_train_plan`
--
ALTER TABLE `xj_train_plan`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `xj_train_sum`
--
ALTER TABLE `xj_train_sum`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `xj_verify`
--
ALTER TABLE `xj_verify`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
