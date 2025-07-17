# Framework Bridge for FiveM

A **modular, object-oriented bridge** for FiveM frameworks.

This bridge provides a unified and extensible API layer for both **server-side** and **client-side** scripts, abstracting interactions across popular frameworks like:

- ✅ ESX  
- ✅ QBCore  
- 🔜 vRP *(planned)*  

It allows your scripts to interact with players, jobs, items, accounts, loadouts, etc., using a **consistent interface**, regardless of the underlying framework.

---

## 📦 Installation

1. **Place the bridge** (e.g. `k13_bridge`) in your `resources` folder.

2. You **do not need to start** the bridge in `server.cfg`.  
   It is **not a standalone resource**, but a shared module.

3. In your **own resource's `fxmanifest.lua`**, include:

   ```lua
   shared_scripts {
       "@ox_lib/init.lua",
       "@k13_bridge/imports.lua"
   }
   ```

4. Make sure [`ox_lib`](https://github.com/overextended/ox_lib) is installed — it's a **required dependency**.

---

## 🚀 Usage

After including `@k13_bridge/imports.lua`, the `Bridge` global is automatically available in your script:

```lua
local Framework = Bridge.FrameworkFactory("esx")

local xPlayer = Framework:getPlayerFromId(source)
print(xPlayer:getName())
```

> ⚠️ All methods throw `not implemented` errors by default unless implemented for the specific framework.

---

## 🧠 Developer Tip: Type Annotations

For full type support in your **Lua Language Server**, it's **highly recommended** to mark the bridge resource as a library in your workspace settings (e.g. `settings.json`):

```json
"Lua.workspace.library": [
    "resourcesPath\\k13_bridge"
]
```

This enables autocompletion and type checking for all framework interfaces.

---

## 🧩 Interface Overview

### `IServerFramework`

```lua
---@class IServerFramework : OxClass
---@field getPlayerFromId fun(self, src: number): IServerFrameworkPlayer?
---@field registerUsableItem fun(self, itemName: string, cb: fun(src: number))
-- ...
```

### `IServerFrameworkPlayer`

```lua
---@class IServerFrameworkPlayer : OxClass
---@field getJob fun(self): IPlayerJob
---@field addInventoryItem fun(self, itemName: string, amount: number)
-- ...
```

### `IClientFramework`

```lua
---@class IClientFramework : OxClass
---@field isPlayerLoaded fun(self): boolean
---@field getPlayerInventory fun(self): IPlayerInventory
-- ...
```

---

## 🗃️ Shared Data Structures

```lua
---@class IItem
---@field name string
---@field label string
---@field weight number

---@class IInventoryItem : IItem
---@field count number

---@class IPlayerJob
---@field name string
---@field label string
---@field Grade { id: number, name: string, label: string, salary: number }

---@class ILoadoutItem
---@field name string
---@field label string
---@field ammo number
---@field tintIndex number

---@alias IPlayerLoadout ILoadoutItem[]
---@alias IPlayerInventory IInventoryItem[]
---@alias PlayerSex "male" | "female"
```

---

## 🔌 Framework Support Status

- ✅ **ESX** — implemented
- ✅ **QBCore** — implemented
- 🔜 **vRP** — in progress

---

## ⚖️ License

This project is licensed under the **GNU General Public License v3.0**  
See [`LICENSE`](./LICENSE) for full terms.
