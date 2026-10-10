# 扣子（Coze）

## 适用方式

扣子使用同一个 `offer-campus-recruit-skill-v0.1.zip`。可以在工作空间导入或基于安装包制作技能；若运行环境不允许直接执行 cURL，则通过受控 HTTP/OpenAPI 工具执行请求。

## 安装与配置

1. 在扣子工作空间的技能/资源管理中上传 `offer-campus-recruit-skill-v0.1.zip`；若当前入口仅支持对话制作技能，将包作为附件并要求按其内容创建。
2. 在工作空间私密凭据中配置 `OFFER_CAMPUS_API_KEY`，不写入 Bot 指令、卡片或公开插件配置。
3. 使用工作空间的 HTTP/OpenAPI 工具映射 `recent`、`upcoming-deadline`、`search` 三项只读请求。
4. 若扣子编程环境允许 Shell，可直接调用 `sh scripts/offer-campus.sh recent 1` 验证。
5. 测试外部链接、分页、超时与业务错误，确认不回显 Key 后再发布。

## 发布前检查

不支持私密凭据的工作空间只能安装查询规则，不能访问真实数据；需先完成受控 HTTP/MCP 连接器。

官方参考：[扣子开放平台架构](https://www.coze.cn/open/docs/guide/architecture)。
