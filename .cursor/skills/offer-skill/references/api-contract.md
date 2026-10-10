# API 契约

## 基础信息

- Base URL：`https://openapi.offerxiansheng.com/backend-service`
- 鉴权：`Authorization: Bearer {API_KEY}`
- 请求与响应：JSON，UTF-8
- 分页：Cursor Pagination
- 成功响应业务码：`1000`

统一响应外层：

```json
{
  "code": 1000,
  "message": "success",
  "data": {}
}
```

列表 `data`：

```json
{
  "items": [],
  "nextCursor": "opaque_cursor",
  "hasMore": true
}
```

`nextCursor` 是不透明字符串。首页不传 `cursor`；继续查询时原样传回；`hasMore` 为 `false` 时停止。

## 1. 最近 24 小时校招

```http
GET /open/v1/campus-recruit/recent
```

获取最近 24 小时内更新的校招信息，按 `updateTime` 倒序排列。

| 参数 | 类型 | 必填 | 规则 |
|---|---|---|---|
| `cursor` | String | 否 | 首页不传，翻页传上一页的 `nextCursor` |
| `limit` | Integer | 否 | 默认 20，最大 100 |

## 2. 即将截止校招

```http
GET /open/v1/campus-recruit/upcoming-deadline
```

获取即将截止的校招信息，按 `endTime` 升序排列。

| 参数 | 类型 | 必填 | 规则 |
|---|---|---|---|
| `within_days` | Integer | 否 | 默认 1，只支持 1、3、7 |
| `cursor` | String | 否 | 游标 |
| `limit` | Integer | 否 | 默认 20，最大 100 |

## 3. 校招搜索

```http
POST /open/v1/campus-recruit/search
Content-Type: application/json
```

默认按 `updateTime` 倒序排列。

| JSON 参数 | 类型 | 必填 | 含义 |
|---|---|---|---|
| `keywords` | String | 否 | 多字段模糊关键词 |
| `companyName` | String | 否 | 公司名称 |
| `positionName` | String | 否 | 职位名称 |
| `functionName` | String | 否 | 职能 |
| `industry` | String | 否 | 行业 |
| `city` | String | 否 | 城市 |
| `graduationYear` | Integer | 否 | 毕业届次，如 2027 |
| `educationLevel` | String | 否 | 学历要求 |
| `companyNature` | String | 否 | 企业性质 |
| `recruitmentBatch` | String | 否 | 招聘批次，如秋招、春招 |
| `startTime` | String | 否 | 网申开始时间范围起，`yyyy-MM-dd` |
| `endTime` | String | 否 | 网申截止时间范围止，`yyyy-MM-dd` |
| `cursor` | String | 否 | 游标 |
| `limit` | Integer | 否 | 默认 20，最大 100 |

不得发送 `recruitmentStatus`；该参数已从公开搜索接口删除。

## 业务错误码

| code | 含义 | 对用户的处理 |
|---|---|---|
| `7001` | API Key 无效 | 提示检查是否配置了正确的 `sk_offer_live_` Key |
| `7002` | API Key 已撤销 | 提示在平台重新获取有效 Key |
| `7003` | 本月调用配额已用完 | 说明需等待重置或联系平台 |
| `7004` | 请求频率超限 | 建议稍后重试，当前任务停止自动连发 |

不要向用户展示 API Key 管理接口、调用日志接口或官网登录复用实现。
