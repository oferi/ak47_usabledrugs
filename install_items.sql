-- ox_inventory items installation for ak47_usabledrugs
-- Run this SQL in your database to add the drug items

INSERT INTO `ox_inventory` (`name`, `label`, `weight`, `type`, `image`, `unique`, `useable`, `shouldClose`, `combinable`, `description`) VALUES
('weed_pooch', 'Weed Pooch', 10, 'item', 'weed_pooch.png', 0, 1, 1, NULL, 'A small bag of weed'),
('coke_pooch', 'Coke Pooch', 10, 'item', 'coke_pooch.png', 0, 1, 1, NULL, 'A small bag of cocaine'),
('spice_pooch', 'Spice Pooch', 10, 'item', 'spice_pooch.png', 0, 1, 1, NULL, 'A small bag of spice'),
('lean_bottle', 'Lean Bottle', 200, 'item', 'lean_bottle.png', 0, 1, 1, NULL, 'A bottle of lean'),
('double_cup', 'Double Cup', 100, 'item', 'double_cup.png', 0, 1, 1, NULL, 'A double cup drink'),
('xpills', 'X Pills', 5, 'item', 'xpills.png', 0, 1, 1, NULL, 'Ecstasy pills'),
('heroin_shot', 'Heroin Shot', 50, 'item', 'heroin_shot.png', 0, 1, 1, NULL, 'A heroin injection'),
('meth_pooch', 'Meth Pooch', 10, 'item', 'meth_pooch.png', 0, 1, 1, NULL, 'A small bag of methamphetamine');

-- Note: If you're using a different database structure, you may need to modify this SQL accordingly
-- Make sure to also copy the image files to your ox_inventory/web/images/ directory
