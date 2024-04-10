import 'package:chakre_pdf_viewer/chakre_pdf_viewer.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  PDFDocument? document;
  bool _usePDFListView = false;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  void dispose() {
    document?.clearImageCache();
    document = null;
    super.dispose();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');
    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/sample2.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
          "https://www.africau.edu/images/default/sample.pdf");
    } else {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 36),
            ListTile(
              title: Text('Load from Assets'),
              onTap: () {
                changePDF(1);
              },
            ),
            ListTile(
              title: Text('Load from URL'),
              onTap: () {
                changePDF(2);
              },
            ),
            ListTile(
              title: Text('Restore default'),
              onTap: () {
                changePDF(3);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('FlutterPluginPDFViewer'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _usePDFListView = !_usePDFListView;
              setState(() {});
            },
            child: Icon(Icons.cached),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          !_usePDFListView
              ? Expanded(
                  child: Center(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : PDFViewer(
                            document: document!,
                            maxScale: 3,
                            zoomSteps: 1,
                            showIndicator: true,
                            panLimit: 13,
                            // pagePickerColor: Colors.red,
                            //uncomment below line to preload all pages
                            // lazyLoad: false,
                            // uncomment below line to scroll vertically
                            // scrollDirection: Axis.vertical,

                            // enableSwipeNavigation: false,
                            showPicker: true,
                            showNavigation: true,
                            showDialogForPagePicker: true,
                            //uncomment below code to replace bottom navigation with your own
                            /* navigationBuilder:
                            (context, page, totalPages, jumpToPage, animateToPage) {
                          return ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.first_page),
                                onPressed: () {
                                  jumpToPage()(page: 0);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  animateToPage(page: page - 2);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  animateToPage(page: page);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.last_page),
                                onPressed: () {
                                  jumpToPage(page: totalPages - 1);
                                },
                              ),
                            ],
                          );
                        }, */
                          ),
                  ),
                )
              : Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : PDFListViewer(
                          document: document!,
                          preload: true,
                        ),
                ),
        ],
      ),
    );
  }
}
