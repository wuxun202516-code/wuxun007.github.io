# 豆包工作

## 适用方式

豆包工作使用同一个 `offer-campus-recruit-skill-v0.1.zip`。客户端可先导入完整 Skill 作为指令与知识；是否能直接请求校招 API，取决于当前版本是否提供外部 HTTP/cURL 和私密凭据能力。

## 安装与配置

1. 在豆包工作的技能管理中导入 `offer-campus-recruit-skill-v0.1.zip`；若当前版本要求通过对话创建技能，将安装包作为附件并要求保留完整目录。
2. 在产品提供的私密凭据中配置 `OFFER_CAMPUS_API_KEY`，不放入提示词或知识文件。
3. 若客户端允许本地命令，使用 `sh scripts/offer-campus.sh recent 1` 验证。
4. 若只允许 HTTP 工具，按 `references/api-contract.md` 配置三项只读请求。
5. 验证截止窗口仅使用 1/3/7 天，且搜索请求不含 `recruitmentStatus`。

## 发布前检查

如当前客户端不支持外部 HTTP 或不提供私密凭据，Skill 可用于理解查询和整理响应，但不能直接查真实数据；需先部署企业受控 `offer-campus` 连接器。

官方参考：[豆包工作](https://www.doubao.com/work)、[飞书 Aily 第三方与企业自定义 Agent](https://aily.feishu.cn/hc/1u7kleqg/4q7o7as7)。
