# Claude

## Claude Code：本地安装

Claude Code 支持目录形式的 Agent Skills。下载 `offer-campus-recruit-skill-v0.1.zip`，项目级适合随项目共享，个人级适合仅自己使用。

1. 将整个 `offer-campus-recruit` 目录复制到项目的 `.claude/skills/offer-campus-recruit/`，或个人目录 `~/.claude/skills/offer-campus-recruit/`。
2. 在本机私有环境设置 `OFFER_CAMPUS_API_KEY`；不要写入仓库。可使用系统钥匙串、终端私有配置或被忽略的本地环境文件。
3. 重启 Claude Code 或开启新会话，使其发现 Skill。
4. 以自然语言请求校招查询；Skill 会优先执行 `sh scripts/offer-campus.sh recent 20`。
5. 提交项目前确认 `.env` 和密钥文件未被版本控制。

## Claude Web / Cowork

Web 或云端会话不会读取本机的 `~/.claude/skills`。如需在云端供多人使用，需把 Skill 作为受管插件/同步内容，并部署 OAuth 或受控 MCP 连接器；不可把本机 API Key 随 Skill 上传。

官方参考：[Claude Code Skills](https://code.claude.com/docs/en/skills)。
