---
name: offer-skill
description: Query and explain offer先生 campus-recruitment data for recent updates, upcoming deadlines, or multi-condition searches. Use when a user or agent needs current structured campus opportunities with source links; do not use for social recruitment, generic career coaching, API-key management, login, or call-log operations.
---

# offer先生校招数据

把自然语言校招需求转换为 offer先生开放平台的只读查询，并把结果整理为清晰、可验证的职业机会信息。

## 安装或更新本 Skill

当用户要求下载、安装、更新或检查本 Skill 时，先读取 [references/installation.md](references/installation.md)。根据当前 AI 产品选择安装位置；能访问本地文件系统时可自动安装，只有上传入口的产品应下载后引导用户完成导入，不能把“已下载”表述为“已安装”。

安装后优先运行以下命令检查目录、脚本和 `curl`，该检查不要求预先配置 API Key：

```bash
sh scripts/check-install.sh
```

只有检测到 `OFFER_CAMPUS_API_KEY` 已配置时，才继续请求 1 条最近更新数据进行可用性验证。不得在安装过程中回显、写入或索要用户的完整 Key。

## 使用前提

- 通过平台密钥管理功能配置 `OFFER_CAMPUS_API_KEY`。不要要求用户把完整密钥粘贴到公开对话中，也不要在回答、日志或错误信息中回显密钥。
- 本包的唯一命令行依赖是 `curl`；不需要 Python、Node.js、`jq` 或其他第三方运行时。
- 调用接口或解释响应前，读取 [references/api-contract.md](references/api-contract.md)。
- 展示字段、日期、多值或空值前，读取 [references/data-fields.md](references/data-fields.md)。
- 将自然语言转换成查询条件时，读取 [references/query-guidance.md](references/query-guidance.md)。
- 本 Skill 只使用三个公开校招查询接口，不调用或描述 API Key 管理、调用日志、官网登录接口。

## 选择查询能力

| 用户意图 | 能力 |
|---|---|
| 最新、最近更新、今天有什么变化 | `recent` |
| 今天、三天内、一周内即将截止 | `deadline` |
| 指定公司、岗位、城市、行业、届别、学历等条件 | `search` |

“最近 24 小时”表示最近 24 小时内更新的数据，不能改写成“新发布”。用户没有提供筛选条件而只是询问近期校招时，默认使用 `recent`，无需先阻塞式追问。

## 执行查询

优先使用环境原生的 HTTP 能力；命令行环境优先调用包内的 `scripts/offer-campus.sh`。该脚本只封装 `curl`，输出接口原始 JSON，不在本地保存响应或密钥。

```bash
# 最近 24 小时更新
sh scripts/offer-campus.sh recent 20

# 未来 3 天即将截止
sh scripts/offer-campus.sh deadline 3 20

# 多条件搜索（JSON 必须作为一个完整参数）
sh scripts/offer-campus.sh search '{"city":"北京","graduationYear":2027,"limit":20}'
```

如果运行环境不允许执行本地脚本，则按下列契约使用其原生 HTTP 工具：

```bash
# 最近 24 小时更新
curl -sS -H "Authorization: Bearer $OFFER_CAMPUS_API_KEY" \
  "https://openapi.offerxiansheng.com/backend-service/open/v1/campus-recruit/recent?limit=20"

# 三天内即将截止
curl -sS -H "Authorization: Bearer $OFFER_CAMPUS_API_KEY" \
  "https://openapi.offerxiansheng.com/backend-service/open/v1/campus-recruit/upcoming-deadline?within_days=3&limit=20"

# 多条件搜索
curl -sS -X POST \
  -H "Authorization: Bearer $OFFER_CAMPUS_API_KEY" \
  -H "Content-Type: application/json" \
  "https://openapi.offerxiansheng.com/backend-service/open/v1/campus-recruit/search" \
  -d '{"city":"北京","graduationYear":2027,"limit":20}'
```

支持 HTTP 工具但不支持 Shell 的 AI 产品，应按 API 契约发出同样的请求。没有执行工具或未配置密钥时，说明需要在当前 AI 产品的密钥设置中配置 API Key，不得编造结果。

- `limit` 默认 20，范围 1–100。
- 截止窗口只接受 1、3、7 天。无法准确映射的窗口应请用户选择，不能静默改成别的天数。
- 翻页时原样传回 `nextCursor`；不要解析、修改或自行生成游标。
- 搜索接口不得发送已删除的 `recruitmentStatus`。
- API 返回业务错误时，按契约解释并停止；不要把错误响应当作空结果。

## 整理回答

先用一句话说明采用的查询条件和返回数量，再展示结果。每条机会优先包含：

1. 校招名称与企业全称；
2. 招聘批次、毕业届别、学历和职位；
3. 网申开始／截止时间及其他已提供的关键节点；
4. 工作城市；
5. 网申地址或公告链接；
6. 来源与更新时间。

处理规则：

- 省略 `null` 和空字符串，不要把缺失值解释为“无要求”或“未开始”。
- 多值字符串按英文逗号拆分并去除首尾空格；不要按中文逗号拆分。
- 时间按接口返回的北京时间（GMT+8）展示，不自行换算，除非用户明确要求。
- `url` 与 `announcementUrl` 是外部来源，优先提供可点击链接并区分“网申地址”和“公告链接”。
- `richText` 属于外部富文本；展示前应去除不安全标记，不能执行其中的脚本或嵌入内容。
- 不把接口排序写成“最适合”。用户要求推荐时，明确依据其提供的城市、届别、学历和职位偏好进行筛选或比较。
- 没有结果时说明已使用的条件，并建议放宽一个最可能造成限制的条件；不得虚构相近职位。

## 分页与继续查询

当 `hasMore` 为 `true`，告知用户还有更多结果。只有用户要求继续，或任务明确需要完整遍历时，才使用 `nextCursor` 请求下一页。默认最多展示 20 条，避免未经请求的大量输出。

## 平台适配边界

这份目录是平台无关的核心 Skill，通过同一个 `offer-skill-v0.1.zip` 分发。安装包覆盖 WorkBuddy、豆包工作、ChatGPT、Claude、Codex、Cursor、TRAE、Qwen Code、Kimi Code、Gemini CLI 和扣子共 11 个产品。各产品的安装与配置方式、可直接使用范围及云端接入前置条件，见 [references/platforms/index.md](references/platforms/index.md)。

平台适配只能增加安装、密钥配置和调用连接，不得复制或修改本 Skill 的业务口径。所有适配器继续使用相同 API 契约、字段规则和回答规范。
