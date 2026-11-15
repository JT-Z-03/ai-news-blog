---
title: "AI 热点日报 | 2026年11月14日"
date: 2026-11-14T00:00:00+08:00
publishDate: 2026-11-14T08:05:19+08:00
lastmod: 2026-11-15T08:09:32+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-14
description: 2026年11月14日 AI HOT 滚动精选，关注 NVIDIA 冒名公开信澄清、Claude Duet 邀请进展与 Cursor 安全调查。
aihot_ids: ["z4wsrxr1xmhg3lq3y0ouq5rmr", "vot1htumxjgnb0i88rbq3zsuq", "ypeap2t8w4fqqfuvt7mw3wg79", "h0obmlpmc44dqk1da164ca1z7", "e9o5h2c1o5f0xuh2bgqtc2w7k", "q92ir58jcjtp3g9fn11jlb6ei", "xzt8t0xkgj3mm17k11s2yo3d4", "ajfypca37l5knyrnij49v5ofz", "kei20gkia8a0vhknc859jsfqr"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 9 条；本次取材截止北京时间 11 月 15 日 08:03。

---

## 安全动态

### 进展：Cursor 公布扩展安全事件调查结果

**11月14日 14:10 补充。** Cursor 于 11 月 13 日公布[此前扩展被篡改事件](/posts/ai-hot-2026-10-30/)的调查进展。公司称，攻击者利用在 Fireworks 侧暴露的访问密钥，复制了共享存储中的部分编码智能体轨迹；其中少量未脱敏凭据使不到 0.01% 的客户 API 凭据暴露。受影响轨迹来自未启用隐私模式的会话，主要产生于 2025 年。

Cursor 表示已通知受影响客户并协助撤销、轮换相关凭据；在暴露时段安装或更新了指定被篡改扩展版本的用户，应按官方安全通知排查，单独卸载扩展可能不足。原文发布于 11 月 13 日，本站依据次日收录补充。

🔗 [Cursor 官方调查进展](https://cursor.com/blog/security-incident-update)

---

## 模型与产品

### 进展：Claude Duet 邀请已有候补用户

**11月14日 22:09 补充。** Anthropic 产品负责人 11 月 13 日表示，截至其帖文前一天已登记候补的美国 Pro、Max 和 Ultra 用户均已获邀使用 Claude Duet，新登记用户仍需排队。Duet 仍处于研究预览阶段。这是[此前开启研究预览](/posts/ai-hot-2026-10-22/)后的开放进展。

🔗 [Anthropic 员工帖文](https://x.com/adocomplete/status/2121338030967697908) · [产品负责人帖文](https://x.com/ahuja_karan/status/2121332990836163033)

### Poppy 1.0 发布，Shopify 商店开始支持

**11月14日 08:05 补充。** Sierra 在 11 月 13 日宣布 Personal Agent Protocol（Poppy）1.0 发布。官方称，每个 Shopify 商店会自动发布 Poppy 文件，Meta 的 Muse 也会优先查找该文件；设计伙伴总数增至 100 多家。

Poppy 定义个人智能体与企业连接的方式，商家可以分阶段增加能力。这是本站此前[报道协议草案](/posts/ai-hot-2026-10-10/)后的进展；原文发布于 11 月 13 日，本站依据次日收录补充。

🔗 [Sierra 官方介绍](https://sierra.ai/blog/releasing-poppy)

### ChatGPT 介绍 Wallet 购买流程

**11月14日 08:05 补充。** ChatGPT 官方于 11 月 13 日介绍 Wallet，称其首先向美国 Pro 用户的 dot 开放。智能体无法访问真实卡号，每次购买须经过安全检查并得到用户批准。

原文发布于 11 月 13 日，本站依据次日收录补充。

🔗 [ChatGPT 官方帖文](https://x.com/ChatGPT/status/2121283151729496235)

---

## 研究与实践

### 补充：研究通过模型权重分析芯片指纹

**11月14日 14:11 补充。** Unemployment Labs 于 11 月 12 日发布研究，称四家中国企业的六个模型权重中存在与 NVIDIA Blackwell 芯片相符的初始化模式。研究通过公开权重寻找初始数值留下的痕迹，并在部分模型上使用实体芯片验证。

研究者强调，初始化指纹支持但不能证明整个训练过程使用相同芯片；权重也无法确定芯片位置、获取方式或是否违反出口管制。原研究发布于 11 月 12 日，本站依据 11 月 14 日收录的媒体报道补充。

🔗 [Unemployment Labs 原始研究](https://unemploymentlabs.com/checkpoint-forensics) · [TechCrunch 报道](https://techcrunch.com/2026/11/13/export-banned-nvidia-chips-are-behind-chinas-most-powerful-ai-models-uh-oh-jensen/)


### Claude 分享常驻智能体构建方法

**11月14日 08:05 补充。** Claude 于 11 月 13 日发布常驻智能体实践文章，讨论如何结合事件收件箱、定时器、记忆、权限和发件箱等机制，构建持续响应事件的智能体。这是一篇架构实践指南。

原文发布于 11 月 13 日，本站依据次日收录补充。

🔗 [Claude 官方文章](https://claude.com/blog/building-always-on-agents)

### Google 介绍 Antigravity Teamwork 科研协作

**11月14日 08:05 补充。** Google Research 于 11 月 13 日介绍 Antigravity Teamwork 与人类专家协作的研究及工程案例。官方表示，多数功能已可用，其余功能将在未来数周逐步开放。

原文发布于 11 月 13 日，本站依据次日收录补充。

🔗 [Google Research 官方文章](https://research.google/blog/advancing-science-engineering-with-antigravitys-teamwork-feature/)

---

## 行业动态

### 补充：NVIDIA 副总裁否认签署流传公开信

**11月15日 08:09 补充。** NVIDIA 应用深度学习研究副总裁 Bryan Catanzaro 表示，一份在网上流传、要求董事会让黄仁勋复职并列有他名字的公开信是伪造的，他并未签署。他同时表示支持董事会及临时 CEO Colette Kress。该信与另一份网上复职请愿应区分，不能将这一澄清推及所有请愿。相关报道发表于 11 月 13 日（美国时间），本站依据 11 月 14 日收录补充。

🔗 [Wccftech 报道及原帖](https://wccftech.com/letter-seeking-ex-ceo-jensen-huangs-return-is-obviously-fake-says-nvidia-vp-after-he-is-made-a-named-signatory-alongside-top-leadership-at-firm/amp/) · [SBS 报道](https://news.sbs.co.kr/english/article.do?cooper=SBSNEWSMAIN&news_id=N1008845854&plink=NEW)


### 补充：美联储报告呈现市场联系人对 AI 风险的关注

**11月14日 14:11 补充。** 美联储 11 月 13 日发布的金融稳定报告显示，纽约联储在 9 至 10 月调查的 23 名市场联系人中，多数提及 AI 相关风险。报告说明，这些是受访者的观点，不代表美联储理事会或纽约联储的立场。

报告还指出，2026 年截至 10 月，先进计算相关债务发行超过 6800 亿美元；这一数字是发行额，并非债务余额。原报告发布于 11 月 13 日，本站依据次日收录补充。

🔗 [美联储金融稳定报告](https://www.federalreserve.gov/publications/files/financial-stability-report-20261113.pdf)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
