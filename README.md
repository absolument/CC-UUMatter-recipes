# CC-UUMatter-recipes
Test and record every possible crafting recipes with UU-Matter (IndustrialCraft)

## Usage
Setup a crafty turtle between 2 chest. Feed up chest with some stacks of UU-Matter (more or less 5 stacks). Down chest is output.

```
pastebin get x UUMatter

UUMatter
```

Every successful craft will be saved in a settings file.
```
UU.lua
```

## Example
```
    {
      i = 1,
      name = "minecraft:dirt",
      cost = 1,
      pattern = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
      },
      count = 16,
      damage = 0,
    },
```
  - i: iterator (1 = 000000001)
  - name, damage: item datas resulted bay turtle.getItemDetails()
  - count: nb of items resulted
  - cost: nb of UU-Matter items used
  - pattern: (table) Binary representation of the recipe, correspond with slots {1, 2, 3, 5, 6, 7, 9, 10, 11}

## Screenshots
![Setup](https://raw.githubusercontent.com/absolument/CC-UUMatter-recipes/master/screenshots/2019-07-22_23.43.19.png)

![Screenshot](https://raw.githubusercontent.com/absolument/CC-UUMatter-recipes/master/screenshots/2019-07-22_23.42.32.png)

![Result](https://raw.githubusercontent.com/absolument/CC-UUMatter-recipes/master/screenshots/2019-07-22_23.42.50.png)

## Credits
Integer to binary function: https://stackoverflow.com/a/26702880
