# Kimi Code

## 本地安装

Kimi Code 推荐以目录方式安装 Skill，也兼容标准 `.agents/skills` 路径。下载并解压 `offer-campus-recruit-skill-v0.1.zip`。

1. 项目级：复制到 `.kimi-code/skills/offer-campus-recruit/`，或 `.agents/skills/offer-campus-recruit/`。
2. 个人级：复制到 `~/.kimi-code/skills/offer-campus-recruit/`，或 `~/.agents/skills/offer-campus-recruit/`。
3. 在本机私有环境设置 `OFFER_CAMPUS_API_KEY`。
4. 重启 Kimi Code 会话后，使用 `/skill:offer-campus-recruit` 调用，或直接使用自然语言查询。
5. 先执行 `sh scripts/offer-campus.sh recent 1`，再执行真实请求。

## 分发规则

若以后封装为插件，可从本地目录、压缩包或仓库安装插件；插件包始终不包含生产 Key。共享/云端调用时应使用独立的受控连接器。

官方参考：[Kimi Code Skills](https://www.kimi.com/code/docs/en/kimi-code-cli/customization/skills.html)。
