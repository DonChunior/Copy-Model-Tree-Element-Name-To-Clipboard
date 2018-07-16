# Copy Model Tree Element Name To Clipboard

This application enables to copy the name of a selected model tree element to the clipboard in [PTC](https://www.ptc.com/)'s CAD system [Creo Parametric](https://www.ptc.com/en/products/cad/creo/parametric) (formerly known as Pro/ENGINEER).

## Getting Started

### Download

The latest version of the UDL files can be downloaded from https://github.com/DonChunior/Copy-Model-Tree-Element-Name-To-Clipboard/releases/latest.

### Installing

1. Copy the file CopyModelTreeElementNameToClipboard.exe to a directory of your choice (e.g. C:\temp).
2. Create a new OS script mapkey: "%DirectoryOfYourChoice%\CopyModelTreeElementNameToClipboard.exe" "%DirectoryContainingTrailFiles%" (e.g. "C:\temp\CopyModelTreeElementNameToClipboard.exe" "C:\temp\TrailDir").

### Usage

1. Select a model tree element.
2. Execute the previously defined mapkey.
3. Now you have got the element name in the clipboard.

## Author

- Domenic Laritz, CAD system administrator at [Liebherr](https://www.liebherr.com/).

## License

This project is licensed under the terms of the Unlicense.
See the [LICENSE](./LICENSE) file for details.

## Acknowledgment
- Thanks to Christian Faderl, the developer of [ISN AutoIt Studio](https://www.isnetwork.at/isn-autoit-studio/), a development environment for the scripting language [AutoIt](https://www.autoitscript.com/), which has been used for this project.
