import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TextField(
              controller: _controller,
            ),
            SizedBox(
              height: 23,
            ),
            ElevatedButton(
                onPressed: () {
                  final yourText = 'Hello World';
                  final text = _controller.text;
                  final selection = _controller.selection;
                  final newText = text.replaceRange(
                      selection.start, selection.end, yourText);
                  _controller.value = TextEditingValue(
                    text: newText,
                    selection: TextSelection.collapsed(
                        offset: selection.baseOffset + yourText.length),
                  );
                },
                child: Text("Click me")),
            Container(
              child: WebView(
                zoomEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
                
                initialUrl: _controller.text,
              ),
            )
          ],
        ),
      ),
    );
  }
}
