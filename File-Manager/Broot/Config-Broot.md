# Config-Broot.md

## Websites

* Office File Preview
  * [LibreOffice](https://www.libreoffice.org/) <sup>{1}</sup>

* PDF File Preview
  * [mutool - all purpose tool for dealing with PDF files => Debian](https://manpages.debian.org/jessie/mupdf-tools/mutool.1) <sup>{2}</sup>

# Install Tools

## Debian Install

* Install LibreOffice for office file preview <sup>{1}</sup>
  * `sudo apt install libreoffice`

* Install "mutool" for PDF file preview <sup>{2}</sup>
  * `sudo apt install mupdf-tools`
  * `which mutool` : Check "mutool" installed path

# Configuration

## Office/PDF/JSON File Preview

* Config File Location: `~/.config/broot/conf.json`

```hjson
###############################################################
# transformations before preview
#
# It's possible to define transformations to apply to some files
# before calling one of the default preview renderers in broot.
# Below are two examples that you may uncomment and adapt:
#
preview_transformers: [
    // # Use mutool to render any PDF file as an image
    // # In this example we use placeholders for the input and output files
    // {
    //     input_extensions: [ "pdf" ] // case doesn't matter
    //     output_extension: png
    //     mode: image
    //     command: [ "mutool", "draw", "-w", "1000", "-o", "{output-path}", "{input-path}" ]
    // }

    // # Use LibreOffice to render Office files as images
    // # In this example, {output-dir} is used to specify where LibreOffice must write the result
    // {
    //     input_extensions: [ "xls", "xlsx", "doc", "docx", "ppt", "pptx", "ods", "odt", "odp" ]
    //     output_extension: png
    //     mode: image
    //     command: [
    //         "libreoffice", "--headless",
    //         "--convert-to", "png",
    //         "--outdir", "{output-dir}",
    //         "{input-path}"
    //     ]
    // }

    // # Use jq to beautify JSON
    // # In this example, the command refers to neither the input nor the output,
    // # so broot pipes them to the stdin and stdout of the jq process
    // {
    //     input_extensions: [ "json" ]
    //     output_extension: json
    //     mode: text
    //     command: [ "jq" ]
    // }
]
```

# References

## Websites

* Office File Preview
  * {1} [LibreOffice](https://www.libreoffice.org/)

* PDF File Preview
  * {2} [mutool - all purpose tool for dealing with PDF files => Debian](https://manpages.debian.org/jessie/mupdf-tools/mutool.1)
