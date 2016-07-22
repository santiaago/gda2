import 'dart:html';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'dart:convert';

@Component(
  selector: 'my-app'
)
@View(
  template: '<h1>{{hello.message}}</h1>'
)

class AppComponent {
  Hello hello = new Hello();
}

class Hello{

  String message;

  Hello(){
        HttpRequest.getString('/api/hello')
            .then((String content) {
              Map parsedMap = JSON.decode(content);
              message = parsedMap["Message"];
            })
            .catchError((Error error) {
              print(error.toString());
            });
  }
}

main() { 
  bootstrap(AppComponent);
}