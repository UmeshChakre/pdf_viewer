# chakre_pdf_viewer

A flutter plugin for handling PDF files. Works on both Android & iOS. Originally forked from https://github.com/anychhoice/pdf_viewer that was Originally forked from https://github.com/lohanidamodar/pdf_viewer that originally forked from https://github.com/CrossPT/flutter_plugin_pdf_viewer.


[![Pub Package](https://img.shields.io/pub/v/chakre_pdf_viewer.svg?style=flat-square)](https://pub.dartlang.org/packages/chakre_pdf_viewer)


## Installation

Add  *chakre_pdf_viewer*  as a dependency in [your pubspec.yaml file](https://flutter.io/platform-plugins/).
```
chakre_pdf_viewer: any
```

---

## Android
No permissions required. Uses application cache directory.

## iOS
No permissions required.

## How-to:

#### Load PDF
```
// Load from assets
PDFDocument doc = await PDFDocument.fromAsset('assets/test.pdf');
 
// Load from URL
PDFDocument doc = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');

// Load from file
File file  = File('...');
PDFDocument doc = await PDFDocument.fromFile(file);
```

#### Load pages
```
// Load specific page
PDFPage pageOne = await doc.get(page: _number);
```

#### Pre-built viewer
Use the pre-built PDF Viewer
```
@override
  Widget build(BuildContext context) {
    Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: document)),
    );
  }
```

This code produces the following view:

<img height="500px" src="https://raw.githubusercontent.com/lohanidamodar/pdf_viewer/master/demo.png" alt="Demo Screenshot 1"/>



#### Fixes and changes from [advance_pdf_viewer_fork](https://pub.dev/packages/advance_pdf_viewer_fork) :
Fixed Page Picker 

<img height="500px" src="https://raw.githubusercontent.com/UmeshChakre/pdf_viewer/fix/run_example/demo.png" alt="Demo Screenshot 1"/>

Show Page Picker on dialog

```
@override
  Widget build(BuildContext context) {
    Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                            document: document!,
                            showNavigation: true,
                            showDialogForPagePicker: true,
                          ),
    );
  }
```
<img height="500px" src="https://raw.githubusercontent.com/UmeshChakre/pdf_viewer/fix/run_example/demo2.png" alt="Demo Screenshot 1"/>


---

## TODO

* Allow password-protected files

---

#### Third-party packages used

| Name | Description  |
|-|-|
| [path_provider](https://pub.dartlang.org/packages/path_provider)               | A Flutter plugin for finding commonly used locations on the filesystem. Supports iOS and Android.            |
| [flutter_cache_manager](https://pub.dartlang.org/packages/flutter_cache_manager)       | A CacheManager to download and cache files in the cache directory of the app. Various settings on how long to keep a file can be changed. |
| [numberpicker](https://pub.dartlang.org/packages/numberpicker)                | NumberPicker is a custom widget designed for choosing an integer or decimal number by scrolling spinners. |
