# AI 产品安装与配置总览

本目录覆盖 11 个产品。先判断运行形态，再选择安装方式：本地编码 Agent 可以由用户自行保存 `OFFER_CAMPUS_API_KEY`；面向多人公开发布的云端 Agent 必须通过受控连接器保存用户凭据或完成 OAuth，不能把共享 API Key 写进 Skill、提示词、插件包或前端代码。

用户把统一安装指令和下载地址发送给 AI Agent 时，先执行 [AI Agent 自动安装与检查](../installation.md) 中的公共流程，再读取本目录对应产品指南。公共流程负责下载、完整性检查、密钥状态检查和测试查询；产品指南只补充安装目录、上传入口与产品限制，不重复定义业务口径。

## 统一准备

1. 获取仅用于校招数据查询的 API Key，并保存在产品的密钥库、系统钥匙串或本机私有环境变量中。
2. 在运行 Skill 的环境中设置 `OFFER_CAMPUS_API_KEY`；如需切换测试环境，可额外设置 `OFFER_CAMPUS_BASE_URL`。
3. 下载 `offer-campus-recruit-skill-v0.1.zip` 并保留解压后的完整 `offer-campus-recruit/` 目录；不能只拷贝 `SKILL.md`，`references/`、`scripts/` 和 `agents/` 都是安装包的一部分。
4. 不要将 `.env`、终端历史、密钥文件或 API Key 提交到代码仓库；不能把完整 Key 发到对话或日志中。
5. 首次运行使用包内 `scripts/offer-campus.sh recent 1` 发起验证；该脚本仅依赖 `curl`，只从环境变量读取 Key。

```bash
sh offer-campus-recruit/scripts/offer-campus.sh recent 1
```

## 选择接入方式

| 产品 | 推荐方式 | 可立即用于个人本地查询 | 公开给多人使用前 |
|---|---|---:|---|
| WorkBuddy | 导入统一 Skill 包 | 是（需允许 cURL/外部 HTTP） | 用租户密钥库或 OAuth 连接器 |
| 豆包工作 | 导入统一 Skill 包 | 视客户端外部 HTTP 能力而定 | 用企业密钥库或受控连接器 |
| ChatGPT | Skills 从电脑上传 | 是（受工作区权限影响） | 由管理员开启 Skill 上传与外部请求权限 |
| Claude Code | 本地 Agent Skill | 是 | 云端 Claude 另需托管连接器 |
| Codex | 本地 Agent Skill | 是 | 云端/团队分发建议封装插件与连接器 |
| Cursor | 本地 Agent Skill | 是 | 团队共享时使用私有密钥注入方案 |
| TRAE | IDE Skill；TraeWork 可上传 Skill | IDE：是 | TraeWork 云端调用另需安全连接器 |
| Qwen Code | 本地 Agent Skill | 是 | 团队分发时保持密钥私有 |
| Kimi Code | 本地 Agent Skill | 是 | 团队分发时保持密钥私有 |
| Gemini CLI | 本地 Agent Skill | 是 | 团队分发时保持密钥私有 |
| 扣子 | 上传统一 Skill 包／创建技能 | 视工作区 HTTP 能力而定 | 用工作区密钥库或受控连接器 |

“可立即”仅表示可在用户自己的本机或受控开发环境查询，并不等于可把同一个 Key 公开共享。

## 云端连接器的最低要求

不能执行本地 Shell，也不提供私密 HTTP 凭据的云端工作台，必须使用受控 `offer-campus` 连接器。连接器只暴露以下只读能力：`recent`、`upcoming-deadline`、`search`；使用每用户授权或受控密钥库；服务端代管密钥；屏蔽日志中的 Authorization；透传 API 的分页与业务错误。不得加入 API Key 管理、调用日志、官网登录或任何写入操作。

各产品具体步骤见本目录对应文件。

| 产品 | 指南 |
|---|---|
| WorkBuddy | [workbuddy.md](workbuddy.md) |
| 豆包工作 | [doubao-work.md](doubao-work.md) |
| ChatGPT | [chatgpt.md](chatgpt.md) |
| Claude | [claude.md](claude.md) |
| Codex | [codex.md](codex.md) |
| Cursor | [cursor.md](cursor.md) |
| TRAE | [trae.md](trae.md) |
| Qwen Code | [qwen-code.md](qwen-code.md) |
| Kimi Code | [kimi-code.md](kimi-code.md) |
| Gemini CLI | [gemini-cli.md](gemini-cli.md) |
| 扣子 | [coze.md](coze.md) |
