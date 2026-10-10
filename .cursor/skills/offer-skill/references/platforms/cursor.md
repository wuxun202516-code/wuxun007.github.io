# Cursor

## 本地安装

Cursor 支持标准 `.agents/skills` 目录，也支持 Cursor 专用 `.cursor/skills` 目录。下载并解压 `offer-campus-recruit-skill-v0.1.zip`；建议优先使用 `.agents/skills`，便于与 Codex、Kimi Code、Gemini CLI 复用。

1. 将整个目录复制到项目的 `.agents/skills/offer-campus-recruit/`；也可使用 `.cursor/skills/offer-campus-recruit/`。
2. 将 `OFFER_CAMPUS_API_KEY` 保存为本机私密环境变量或被忽略的本地配置；禁止提交到 Git。
3. 重新打开项目或创建新 Agent 会话，让 Cursor 重新扫描 Skills。
4. 在 Agent 中提出校招问题，并允许其读取 `references/`、执行 `curl`。
5. 先执行 `sh scripts/offer-campus.sh recent 1`，确认无密钥回显后再真实查询。

## 团队配置

团队仓库只提交不含秘密的 Skill 内容。每位使用者在自己的环境配置 Key；不要用仓库变量、Rule 或提示词共享同一个生产 Key。

官方参考：[Cursor Skills](https://cursor.com/docs/skills)。
