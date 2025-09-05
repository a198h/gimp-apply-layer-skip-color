# Apply Layer Skip Color - GIMP Script

*[Version française ci-dessous / French version below](#version-française)*

A Script-Fu script for GIMP 2.10 that applies a layer to all other layers in an image, with the ability to skip layers marked with a specific color tag.

## 🎯 Features

- **Batch application**: Apply a layer (logo, watermark, initials, signature, etc.) to all other layers
- **Color filtering**: Skip layers marked with a specific color tag
- **Simple interface**: Dropdown menu to choose which color to ignore
- **Error handling**: Undo group support for easy rollback
- **GIMP 2.10 compatible**: Tested and optimized for GIMP 2.10

## 📋 Requirements

- GIMP 2.10 or higher
- Script-Fu support enabled

## 🚀 Installation

1. **Download** the `apply-layer-skip-color.scm` file

2. **Copy it** to your GIMP scripts folder:
   - **Windows**: `C:\Users\[username]\AppData\Roaming\GIMP\2.10\scripts\`
   - **macOS**: `~/Library/Application Support/GIMP/2.10/scripts/`
   - **Linux**: `~/.config/GIMP/2.10/scripts/`

3. **Refresh scripts** in GIMP:
   - Go to `Filters > Script-Fu > Refresh Scripts`

4. **The script appears** in: `Filters > Mes scripts > Appliquer Calque (ignorer couleur)`

## 🎨 Usage

### Step 1: Prepare your layers
1. **Mark layers to skip** with a color tag:
   - Right-click on a layer → `Color Tag` → Choose a color (e.g., Red)
   - Repeat for all layers you want to exclude

### Step 2: Run the script
1. **Select the layer** you want to apply (logo, watermark, etc.)
2. **Launch the script**: `Filters > Mes scripts > Appliquer Calque (ignorer couleur)`
3. **Choose the color** to ignore from the dropdown menu
4. **Click OK**

### Step 3: Result
- The selected layer is applied to all other layers
- Layers marked with the chosen color are skipped
- A message confirms the completion of the process

## 🏷️ Available color tags

The script can skip layers marked with these colors:
- **None** (no tag)
- **Red**
- **Orange** 
- **Yellow**
- **Green**
- **Blue**
- **Violet**
- **Gray**
- **Black**

## 💡 Typical use cases

- **Watermark**: Apply a logo to all photos except those marked "work in progress"
- **Signature**: Add a signature to all layers except UI elements
- **Global effect**: Apply an effect layer to a selection of layers
- **Batch processing**: Automate the application of recurring elements

## ⚡ Practical example

```
Image with 10 layers:
├── Logo (layer to apply)
├── Photo1 (green tag)
├── Photo2 (no tag)
├── Photo3 (red tag) ← will be skipped
├── Background (no tag)
├── Texture (red tag) ← will be skipped
└── ...

Result with "Skip: Red":
→ Logo applied to Photo1, Photo2, Background
→ Photo3 and Texture skipped
```

## 🔧 Script parameters

| Parameter | Description | Type |
|-----------|-------------|------|
| Image | Active image in GIMP | Image |
| Layer | Layer to apply to others | Drawable |
| Skip | Color tag to ignore | Dropdown |

## 🐛 Troubleshooting

### Script doesn't appear in menu
- Check the `.scm` file location
- Refresh scripts: `Filters > Script-Fu > Refresh Scripts`
- Check for errors in `Filters > Script-Fu > Console`

### Script doesn't work as expected
- Make sure you've selected the correct source layer
- Verify that color tags are properly applied
- Use Ctrl+Z to undo if necessary

### Performance issues
- The script may be slow on images with many layers
- Test first on a copy of your image

## 📝 License

This script is distributed under GPL v3 license.

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs

## 📞 Support

For any questions or issues:
- Open an issue on this repository
- Consult the GIMP Script-Fu documentation

---

## Version française

Script Script-Fu pour GIMP 2.10 qui applique un calque sur tous les autres calques, avec possibilité d'ignorer les calques marqués d'une couleur spécifique.

### 🎯 Fonctionnalités
- **Application en masse** : Applique un calque (logo, filigrane, etc.) sur tous les autres calques
- **Filtrage par couleur** : Ignore les calques marqués avec une couleur d'étiquette spécifique  
- **Interface simple** : Menu déroulant pour choisir la couleur à ignorer
- **Gestion des erreurs** : Groupe d'annulation pour pouvoir revenir en arrière
- **Compatible GIMP 2.10** : Testé et optimisé pour GIMP 2.10

### Installation rapide
1. Téléchargez `apply-layer-skip-color.scm`
2. Copiez dans `~/.config/GIMP/2.10/scripts/` (Linux) ou équivalent
3. `Filtres > Script-Fu > Actualiser les scripts`
4. Utilisez via `Filtres > Mes scripts`

### Utilisation
1. Marquez les calques à ignorer avec une étiquette de couleur
2. Sélectionnez le calque à appliquer
3. Lancez le script et choisissez la couleur à ignorer
4. Le calque est appliqué partout sauf sur les calques marqués

### 💡 Cas d'usage typiques
- **Filigrane** : Appliquer un logo sur toutes les photos sauf celles marquées "en cours"
- **Signature** : Ajouter une signature sur tous les calques sauf les éléments d'interface
- **Effet global** : Appliquer un calque d'effet sur une sélection de calques
- **Traitement par lot** : Automatiser l'application d'éléments récurrents

---

**Note**: This script was developed and tested on GIMP 2.10. Compatibility with other versions is not guaranteed.
