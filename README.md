# Retro
A web application used to retroactively discuss topics of concern among friends. :)

[Application Link](https://dart-board.firebaseapp.com)

Built with [angular][angular], [firebase][firebase], [bulma][bulma], and [built_redux][built_redux].

## Contributing

### System dependencies

[Dart 1.24.0](https://www.dartlang.org/)

[node-sass](https://github.com/sass/node-sass)

### Running the application locally

Run the client locally. It's easy!
```bash
$ pub get
$ pub serve
```
Navigate to [http://localhost:8080](http://localhost:8080) to get started!

This will start up a local client that connects to the production database.

### Updating CSS Styles
```bash
$ ./generate_sass.sh
```

Running this script will compile the css for all the sass rules defined in web/sass.

[built_redux]: https://pub.dartlang.org/packages/built_redux
[angular]: https://pub.dartlang.org/packages/angular
[firebase]: https://pub.dartlang.org/packages/firebase
[bulma]: http://bulma.io/
