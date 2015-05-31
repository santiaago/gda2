import 'dart:html';
import 'package:angular2/angular2.dart';
import 'dart:convert';

// These imports will go away soon:
import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;

@Component(
  selector: 'my-app'
)
@View(
  template: '<h1>"{{hello.message}}"</h1>'
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
  // Temporarily needed.
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  
  bootstrap(AppComponent);
}