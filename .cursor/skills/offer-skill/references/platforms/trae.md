# TRAE 与 TraeWork

## TRAE IDE：本地安装

1. 下载 `offer-campus-recruit-skill-v0.1.zip`，将其中完整 `offer-campus-recruit` 目录复制到项目的 `.trae/skills/offer-campus-recruit/`。
2. 在本机私有环境配置 `OFFER_CAMPUS_API_KEY`，不将密钥放入项目文件。
3. 重新打开项目或新建 Agent 对话，确认 Skill 已被发现。
4. 请求“最近更新的校招”进行验证；需要时先执行 `sh scripts/offer-campus.sh recent 1`。

## TraeWork：上传或工作台接入

TraeWork 支持上传本地 Skill 或从 Skill 市场安装。上传前保留完整目录结构；若 Skill 需要访问真实 API，使用工作台提供的安全密钥/连接器能力配置，而非把 Key 打包进上传文件。

若当前 TraeWork 工作台不支持每用户私密密钥或外部 HTTP 连接，先只发布查询说明，真实调用待 `offer-campus` 连接器和授权策略完成后开放。

官方参考：[TRAE IDE Skills](https://docs.trae.ai/ide/skills)、[TraeWork Skills](https://docs.trae.ai/solo/skills)。
