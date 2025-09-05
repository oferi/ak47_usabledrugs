# ak47_usabledrugs - ox_inventory Version

A FiveM resource for usable drugs with ox_inventory integration.

## Features

- **8 Different Drug Types**: Weed, Cocaine, Spice, Lean, Double Cup, X Pills, Heroin, and Meth
- **Realistic Effects**: Screen effects, time cycle modifiers, screen shake, and armor bonuses
- **ox_inventory Integration**: Seamlessly works with ox_inventory system
- **Customizable Configuration**: Easy to modify drug effects and durations
- **Multi-language Support**: Built-in localization system

## Requirements

- FiveM Server
- ox_inventory resource
- ESX Legacy (optional, for additional features)

## Installation

### 1. Download and Extract
Download this resource and extract it to your server's resources folder.

### 2. Add Items to ox_inventory
Copy the contents of `items.lua` and add them to your `ox_inventory/data/items.lua` file.

### 3. Add Images
Place the drug images from the `images/` folder into your `ox_inventory/web/images/` directory.

### 4. Configure Server
Add the resource to your `server.cfg`:
```
ensure ox_inventory
ensure ak47_usabledrugs
```

### 5. Restart Server
Restart your FiveM server for the changes to take effect.

## Configuration

### Drug Effects
Edit `config.lua` to customize:
- Drug duration times
- Armor bonuses
- Run speed multipliers
- Screen effects
- Time cycle modifiers

### Item Names
Modify the `Config.Items` table in `config.lua` to match your ox_inventory item names.

## Usage

### For Players
1. Obtain drug items through your server's economy system
2. Use items from inventory (right-click → Use)
3. Experience drug effects based on configuration

### For Developers
- Add custom effects by modifying the client-side event handlers
- Extend the notification system
- Add new drug types by following the existing pattern

## Item List

| Item | Effect | Duration | Bonus |
|------|--------|----------|-------|
| Weed Pooch | High effect | 120s | +10 Armor |
| Coke Pooch | Stamina boost | 60s | +20 Armor |
| Spice Pooch | High effect | 120s | +15 Armor |
| Lean Bottle | Drunk effect | 120s | None |
| Double Cup | Drunk effect | 60s | +10 Armor |
| X Pills | Stamina boost | 300s | +100 Armor, +1.49x Speed |
| Heroin Shot | Stamina boost | 120s | +10 Armor, +1.2x Speed |
| Meth Pooch | Stamina boost | 60s | +50 Armor, Night vision |

## Support

For support, please refer to:
- ox_inventory documentation
- FiveM documentation
- Create an issue on this repository

## License

This resource is provided as-is. Modify and distribute as needed.

## Credits

- **Original Author**: MenanAk47 (MenanAk47#3129)
- **ox_inventory Adaptation**: Community contribution
- **FiveM Community**: For ongoing support and improvements
