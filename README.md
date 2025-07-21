# Framework Bridge for FiveM

A **modular, object-oriented bridge** for FiveM frameworks.

This bridge provides a unified and extensible API layer for both **server-side** and **client-side** scripts, abstracting interactions across popular frameworks like:

- ✅ ESX  
- ✅ QBCore  
- 🔜 Ox *(planned)*  

It allows your scripts to interact with players, jobs, items, accounts, loadouts, etc., using a **consistent interface**, regardless of the underlying framework.

---

## ⚠️ WARNING
This is **not a finished resource**. It currently serves as a **blueprint** and is subject to major changes.  
> - Many **framework functions are not fully/correctly implemented** yet.  
> - **Data structures may change significantly** to support broader compatibility across frameworks.  

Expect refactors, API adjustments, and structural evolution.

---

## 📦 Installation

1. **Place the bridge** in your `resources` folder.

2. You **do not need to start** the bridge in `server.cfg`.  
   It is **not a standalone resource**, but a shared module.

3. In your **own resource's `fxmanifest.lua`**, include:

   ```lua
   lua54 "yes"

   server_script "@oxmysql/lib/MySQL.lua"
   
   shared_scripts {
       "@ox_lib/init.lua",
       "@k13_bridge/imports.lua"
   }
   ```

4. Make sure [`ox_lib`](https://github.com/CommunityOx/ox_lib) and [`oxmysql`](https://github.com/CommunityOx/oxmysql) are installed — they are **required dependencies**.

---

## 🚀 Usage

After including `@k13_bridge/imports.lua`, the `Bridge` global is automatically available in your script:

```lua
local Framework = Bridge.FrameworkFactory("esx") --[[@as IServerFramework]]

local xPlayer = Framework:getPlayerFromId(source)
if (xPlayer) then
    print(xPlayer:getName())
end
```

> ⚠️ All methods throw `not implemented` errors by default unless implemented for the specific framework.

---

## 🧠 Developer Tip: Type Annotations

For full type support in your **Lua Language Server**, it's **highly recommended** to mark the bridge resource and ox_lib as a library in your workspace settings (e.g. `settings.json`):

```json
"Lua.workspace.library": [
    "resourcesPath\\k13_bridge",
    "resourcesPath\\ox_lib"
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

---@class IVehicle
---@field plate string
---@field type VehicleType
---@field VehicleProperties JSON<VehicleProperties>

---@class IOwnedVehicle : IVehicle
---@field owner string

---@alias IPlayerLoadout ILoadoutItem[]
---@alias IPlayerInventory IInventoryItem[]
---@alias PlayerSex "male"|"female"
---@alias VehicleType "car"|"boat"|"heli"|"plane"|"bike"
```

### 🔧 Generics
```lua
---@generic T
---@alias JSON<T> string
```
The JSON<T> generic represents a JSON-encoded string that conforms to the structure of T.
#### Example:
```lua
---@class VehicleProperties
---@field color string
---@field engineHealth number

---@type JSON<VehicleProperties>
local Data = '{"color":"black","engineHealth":950.0}'

local DecodedData = json.decode(Data) --[[@as VehicleProperties]]
print(DecodedData.color)
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
