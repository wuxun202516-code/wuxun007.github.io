# Qwen Code

## 本地安装

Qwen Code 支持个人级和项目级 Agent Skills。下载并解压 `offer-campus-recruit-skill-v0.1.zip`。

1. 项目级：复制整个目录到 `.qwen/skills/offer-campus-recruit/`。
2. 个人级：复制到 `~/.qwen/skills/offer-campus-recruit/`。
3. 在本机私有环境设置 `OFFER_CAMPUS_API_KEY`。
4. 启动 Qwen Code，使用 `/skills` 确认已发现 Skill。
5. 使用 `/offer-campus-recruit` 或自然语言发起查询；先执行 `sh scripts/offer-campus.sh recent 1`。

## 分发规则

可将不含密钥的目录纳入团队模板或扩展包。真实 API 调用仍应由每位用户在本机配置凭据；不要把 Key 写入扩展清单、文档或示例命令。

官方参考：[Qwen Code Agent Skills](https://qwenlm.github.io/qwen-code-docs/en/users/features/skills/)。
