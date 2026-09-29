#!/usr/bin/env bash
# 一次性安装所有 skill 到 ~/.agents/skills（全局）
# -g 全局安装；-y 跳过交互确认

# ---- 技能发现 / 管理 ----
# find-skills：在 agent 会话里搜索、发现、安装 skills
npx skills add https://github.com/vercel-labs/skills --skill find-skills -g -y

# ---- 编码规范 ----
# karpathy-guidelines：减少常见 LLM 编码错误的行为准则（写/改代码时避免过度设计、做外科手术式修改）
npx skills add https://github.com/forrestchang/andrej-karpathy-skills -g -y

# ---- 规划 / 需求 ----
# grill-me：写代码前反复盘问你的方案，逼你想清楚需求和边界，防止过早动手，！！！问问题用
npx skills add https://github.com/mattpocock/skills --skill grill-me -g -y
npx skills add https://github.com/mattpocock/skills --skill grilling -g -y

# 结合领域驱动设计、能对着你的代码库盘问，！！！写代码用
npx skills add https://github.com/mattpocock/skills --skill grill-with-docs -g -y
npx skills add https://github.com/mattpocock/skills --skill domain-modeling -g -y

# ---- 前端 ----
# frontend-design：生成有设计感、拒绝「AI 味」的前端界面（排版/配色/动效）
npx skills add https://github.com/anthropics/skills --skill frontend-design -g -y

# ---- 测试 / 造 skill ----
# skill-creator：教你一步步编写、测试、迭代改进自己的 skill
npx skills add https://github.com/anthropics/skills --skill skill-creator -g -y

# ---- Obra Superpowers（只装核心 5 个，跳过 subagent/worktree 那批）----
# using-superpowers：Superpowers 的入口/引导 skill，串联整套工作流
npx skills add https://github.com/obra/superpowers --skill using-superpowers -g -y
# brainstorming：写代码前结构化对话，把模糊想法变成明确的设计和规格
npx skills add https://github.com/obra/superpowers --skill brainstorming -g -y
# writing-plans：把实现拆成小步、可评审的计划
npx skills add https://github.com/obra/superpowers --skill writing-plans -g -y
# test-driven-development：强制 TDD 红-绿-重构循环（先写测试，再看它失败）
npx skills add https://github.com/obra/superpowers --skill test-driven-development -g -y
# verification-before-completion：任务标记「完成」前必须验证，禁止想当然
npx skills add https://github.com/obra/superpowers --skill verification-before-completion -g -y

# 全套规范、但太大，现在不装
# npx skills add https://github.com/obra/superpowers -g -y

# webapp-testing：用 Playwright 自动化测试本地 Web 应用（含 server 生命周期管理脚本）!!! 太冗余了
# npx skills add https://github.com/anthropics/skills --skill webapp-testing -g -y

# vercel-react-best-practices：React/Next.js 性能最佳实践（约 70 条规则：bundle、重渲染、数据获取） !!! 可能下架了
# npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -g -y
