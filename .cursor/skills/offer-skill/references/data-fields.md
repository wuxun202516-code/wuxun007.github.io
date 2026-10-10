# 校招信息字段

三个公开接口的 `items` 使用同一个校招信息对象。

## 通用规则

- `id`：String，加密后的唯一标识；不可反解，也不能假设为数字或连续值。
- 日期：`yyyy-MM-dd`，北京时间（GMT+8）。
- 日期时间：`yyyy-MM-dd HH:mm:ss`，北京时间（GMT+8）。
- 多值字符串统一使用英文逗号 `,`，不会出现中文逗号，不包含重复值。
- 空值可能返回 `null` 或空字符串；两者都表示没有可用内容。
- 不根据字段名称推断接口未声明的枚举值。

## 字段表

| 字段 | 类型 | 格式／含义 |
|---|---|---|
| `id` | String | 加密后的唯一标识 |
| `recruitInfoName` | String | 校招信息名称 |
| `enterpriseName` | String | 企业全称 |
| `date` | Integer | 标签年份／届别 |
| `tag` | String | 标签内容，如春招专场 |
| `recruitBusinessName` | String | 行业 |
| `companyType` | String | 企业性质 |
| `beginTime` | String | 网申开始时间，`yyyy-MM-dd` |
| `endTime` | String | 网申截止时间，`yyyy-MM-dd` |
| `testTime` | String | 笔试／测试时间，`yyyy-MM-dd HH:mm:ss` |
| `publicityTime` | String | 空宣会时间，`yyyy-MM-dd HH:mm:ss` |
| `interviewTime` | String | 面试开始时间，`yyyy-MM-dd HH:mm:ss` |
| `interviewTimeEnd` | String | 面试截止时间，`yyyy-MM-dd HH:mm:ss` |
| `domesticGraduationDate` | String | 国内毕业年份 |
| `domesticGraduationTime` | String | 国内毕业时间 |
| `overseasGraduationDate` | String | 留学生毕业年份 |
| `overseasGraduationTime` | String | 留学生毕业时间 |
| `domesticEducation` | String | 国内学历要求 |
| `overseasEducation` | String | 留学生学历要求 |
| `recruitPosInfoNameList` | String | 职位／职能分类，多值按英文逗号分隔 |
| `content` | String | 职位详情／岗位描述 |
| `cityNameList` | String | 工作地点，多值按英文逗号分隔 |
| `url` | String | 网申地址 |
| `announcementUrl` | String | 公告链接 |
| `releaseSource` | String | 数据来源 |
| `richText` | String | 招聘详情富文本，按不可信外部 HTML 处理 |
| `updateTime` | String | 更新时间，`yyyy-MM-dd HH:mm:ss` |

## 展示优先级

普通列表优先展示 `recruitInfoName`、`enterpriseName`、`tag`、`date`、`endTime`、`recruitPosInfoNameList`、`cityNameList`、`url`、`releaseSource`、`updateTime`。只有用户询问详情时再展开毕业时间、学历、笔试、空宣和面试时间等字段。
