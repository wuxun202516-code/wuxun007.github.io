# AI Agent 自动安装与检查

本流程供 WorkBuddy、豆包工作、ChatGPT、Claude、Codex、Cursor、TRAE、Qwen Code、Kimi Code、Gemini CLI 和扣子共用。安装包始终是 `offer-campus-recruit-skill-v0.1.zip`；产品之间只切换安装位置、上传入口和密钥配置方式。

## 收到统一安装指令后

用户通常会提供一条安装指令和一个 ZIP 下载地址。应按以下顺序处理：

1. 使用用户提供的下载地址获取 ZIP。命令行环境可使用 `curl -fL`；下载到临时目录，不要覆盖其他 Skill 或用户文件。
2. 检查压缩包中存在唯一顶层目录 `offer-campus-recruit/`，并至少包含 `SKILL.md`、`scripts/`、`references/` 和 `agents/`。
3. 根据当前产品选择下表中的安装位置。若目标目录已有同名 Skill，先说明当前状态并保留可恢复副本，再更新该 Skill 自身的文件。
4. 安装完整目录，不能只复制 `SKILL.md`。如当前产品只能上传 ZIP，则打开或指引到对应上传入口，不得声称已经自动写入。
5. 运行 `sh scripts/check-install.sh`；该步骤只检查目录、脚本和 `curl`，不会访问 API，也不会要求提前配置 Key。
6. 检查 `OFFER_CAMPUS_API_KEY` 是否存在，但绝不打印其值。未配置时，指导用户在产品的私密凭据或本机环境变量中配置；不要自动新建包含明文 Key 的项目文件。
7. Key 已配置且当前环境允许外部请求时，运行 `sh scripts/offer-campus.sh recent 1`。成功后才可以报告“安装并验证完成”。
8. 最终分别说明：安装位置、文件完整性、`curl` 状态、Key 是否已配置、测试查询是否成功，以及是否仍需要用户手动导入。

## 产品安装位置与状态

| 产品 | 推荐安装位置或入口 | Agent 应如何处理 |
|---|---|---|
| WorkBuddy | 技能中心 → 本地技能 → 导入本地 Skill | 有本地文件权限时安装；否则下载后引导导入 |
| 豆包工作 | 技能管理 → 导入本地技能文件 | 取决于客户端权限；不支持时引导上传 |
| ChatGPT | 桌面端／工作区 Skills → 从电脑上传 | 下载后引导上传；受工作区权限限制 |
| Claude Code | `.claude/skills/offer-campus-recruit/` | 可检测并写入本地目录 |
| Codex | `.agents/skills/offer-campus-recruit/` | 可检测并写入本地目录 |
| Cursor | `.cursor/skills/offer-campus-recruit/`，也可用 `.agents/skills/` | 可检测并写入项目目录 |
| TRAE IDE | `.trae/skills/offer-campus-recruit/` | 可检测并写入项目目录 |
| Qwen Code | `.qwen/skills/offer-campus-recruit/` | 可检测并写入本地目录 |
| Kimi Code | `.kimi-code/skills/offer-campus-recruit/`，也可用 `.agents/skills/` | 可检测并写入本地目录 |
| Gemini CLI | `.gemini/skills/offer-campus-recruit/` | 可检测并写入，或使用产品安装命令 |
| 扣子 | 工作空间 → 资源库 → 技能 → 上传本地 Skill | 取决于工作空间权限；不支持时引导上传 |

更详细的产品差异见 [platforms/index.md](platforms/index.md) 及其 11 个产品指南。

## 手动安装备用流程

自动写入失败、产品没有本地文件权限，或用户选择手动安装时：

1. 保留下载好的同一个 v0.1 ZIP，不生成产品专属安装包。
2. 按对应产品入口上传 ZIP，或将完整目录解压到上表指定位置。
3. 重新启动或新建 AI 会话，让产品重新发现 Skill。
4. 运行安装检查；配置 Key 后再执行 1 条测试查询。

## 安全与能力边界

- 自动安装不等于自动获取 API Key；手机号登录和 Key 创建仍由用户在开放平台完成。
- 不读取或调用 API Key 管理、调用日志、官网登录接口。
- 不把完整 Key 写入 Skill、压缩包、提示词、代码仓库、终端参数或日志。
- 产品缺少外部 HTTP、Shell 或私密凭据能力时，只能完成 Skill 导入和查询说明，不能伪造实时结果。
