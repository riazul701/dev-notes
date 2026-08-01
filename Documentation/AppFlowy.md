# AppFlowy.md

# Concept

> ChatGPT Question:
> 
> Appflowy's space vs workspace

In AppFlowy, **Workspace** and **Space** are different levels of organization.

```
Workspace
├── Space (Engineering)
│   ├── Page
│   ├── Database
│   └── Subpages
├── Space (Marketing)
│   ├── Page
│   └── Database
└── Space (Personal)
    ├── Notes
    └── Tasks
```

## Workspace

A **Workspace** is the top-level container for everything. It represents your organization, team, or major environment. It contains users, permissions, settings, and one or more Spaces. ([AppFlowy][1])

A workspace includes:

* Members
* Roles (Owner, Member, Guest, etc.)
* Billing (for cloud)
* Global settings
* Multiple Spaces

Think of it like:

* A **GitHub organization**
* A **Slack workspace**
* A **Notion workspace**

Example:

```
Acme Inc.
```

This is your workspace.

Inside it, you create spaces.

---

## Space

A **Space** is an organizational area within a workspace. It's used to group related pages, databases, and projects. Each space has its own visibility (such as Public or Private). ([AppFlowy][1])

Examples:

```
Workspace: Acme Inc.

Spaces
├── Engineering
├── Marketing
├── HR
├── Sales
└── Personal
```

Each space can contain:

* Documents
* Wikis
* Databases
* Kanban boards
* Calendars
* Tasks

---

## Permissions

Permissions are hierarchical:

```
Workspace
    ↓
Space
    ↓
Page
```

For example:

* Workspace: Everyone is a member.
* Space: "Engineering" is private.
* Page: A specific design document is shared with someone outside the Engineering space.

Page-level permissions can further restrict or grant access. ([AppFlowy][1])

---

## When should you create another Workspace?

Create another Workspace when you need a completely separate environment, such as:

* Different company
* Different client
* Personal vs. work
* Different billing or ownership
* Different member lists

Example:

```
Workspace A
Acme Corporation

Workspace B
Freelance Projects

Workspace C
Personal
```

---

## When should you create another Space?

Create another Space when you're organizing content **within the same organization**.

Example:

```
Workspace: Startup

Spaces:
• Engineering
• Product
• Design
• Finance
• HR
• Marketing
```

All these teams belong to the same workspace but have separate content and permissions.

---

## Workspace vs. Space

| Feature     | Workspace                                  | Space                                       |
| ----------- | ------------------------------------------ | ------------------------------------------- |
| Level       | Top-level container                        | Subdivision inside a workspace              |
| Contains    | Spaces, members, settings                  | Pages, databases, documents                 |
| Members     | Yes                                        | Uses workspace members; controls visibility |
| Permissions | Global roles                               | Space-level visibility and permissions      |
| Billing     | Yes (cloud)                                | No                                          |
| Best for    | Organizations, clients, major environments | Teams, departments, projects                |

### Simple analogy

Think of it like a company office:

```
Company Building
    = Workspace

Departments
    = Spaces

Filing Cabinets
    = Pages & Databases

Documents
    = Content
```

The **workspace** is the entire company building, while each **space** is a department (Engineering, Marketing, HR) that organizes its own documents and projects. This hierarchy lets you keep one shared organization while separating work by team or purpose.

[1]: https://appflowy-io-appflowy.mintlify.app/collaboration/permissions?utm_source=chatgpt.com "Permissions & Access Control - AppFlowy"


# References

## Websites

* [appflowy.com](https://appflowy.com/)
* [AppFlowy-IO/AppFlowy GitHub](https://github.com/AppFlowy-IO/appflowy)
