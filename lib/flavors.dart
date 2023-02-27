import 'package:flutter_core/ana_core.dart';

enum FlavorTypeEnum { dev, stg, prod }

class Flavors {
  Flavors._instance();

  static late FlavorTypeEnum flavorType;

  static String get flavorMessage => flavorType.name;

  static APIUrls get apiUrls {
    switch (flavorType) {
      case FlavorTypeEnum.dev:
        return const APIUrls(rhUrl: urlRhDev, nasajonUrl: urlNasajonDev, authUrl: urlAuthDev, pcpUrl: urlPcpDev);
      case FlavorTypeEnum.stg:
        return const APIUrls(rhUrl: urlRhStg, nasajonUrl: urlNasajonStg, authUrl: urlAuthStg, pcpUrl: urlPcpStg);
      case FlavorTypeEnum.prod:
        return const APIUrls(rhUrl: urlNasajonProd, nasajonUrl: urlNasajonProd, authUrl: urlAuthProd, pcpUrl: urlAuthProd);
    }
  }

  static FirebaseOptions get firebaseAndroid {
    switch (flavorType) {
      case FlavorTypeEnum.dev:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBDb1u3Jt9H7mnUJoLp1bYJAIPNwikjph0',
          appId: '1:560100887790:android:cdf748c7a3ce42f671b7ff',
          messagingSenderId: '560100887790',
          projectId: 'ana-rh-dev',
          storageBucket: 'ana-rh-dev.appspot.com',
        );
      case FlavorTypeEnum.stg:
        return const FirebaseOptions(
          apiKey: 'AIzaSyABz5UfaUAFKJo-_3GGpv_B1f8Fjlk8Lr4',
          appId: '1:591116968681:android:61c54d976323ac1db40678',
          messagingSenderId: '591116968681',
          projectId: 'ana-rh-qa',
          storageBucket: 'ana-rh-qa.appspot.com',
        );
      case FlavorTypeEnum.prod:
        return const FirebaseOptions(
          apiKey: 'AIzaSyDIgeTTmtey19loiSJcT3GlwWmr26xHkQk',
          appId: '1:159165907154:android:0b688f7cf8c6614a616d0b',
          messagingSenderId: '159165907154',
          projectId: 'ana-dp',
          storageBucket: 'ana-dp.appspot.com',
        );
    }
  }

  static FirebaseOptions get firebaseIos {
    switch (flavorType) {
      case FlavorTypeEnum.dev:
        return const FirebaseOptions(
          apiKey: 'AIzaSyC98w5ja08xGPZJTJ7BNHIiA3zMoqasSbk',
          appId: '1:560100887790:ios:758a3ae48ac33f0671b7ff',
          messagingSenderId: '560100887790',
          projectId: 'ana-dp',
          storageBucket: 'ana-rh-dev.appspot.com',
          iosClientId: '560100887790-738b6ki28p3d34qegckknup40vnhml9s.apps.googleusercontent.com',
          iosBundleId: 'com.nasajon.ana.dev',
        );
      case FlavorTypeEnum.stg:
        return const FirebaseOptions(
          apiKey: 'AIzaSyAw2Lgy-JmecEr1RUb9UAjEysn1Et7ECW8',
          appId: '1:591116968681:ios:bfc9ee4cf43f05b5b40678',
          messagingSenderId: '591116968681',
          projectId: 'ana-rh-qa',
          storageBucket: 'ana-rh-qa.appspot.com',
          iosClientId: '591116968681-gbr2c6rflb3jja967ksr7adkcmjlcn6l.apps.googleusercontent.com',
          iosBundleId: 'com.nasajon.ana.stg',
        );
      case FlavorTypeEnum.prod:
        return const FirebaseOptions(
          apiKey: 'AIzaSyCCmUbYchq06EQVUgQd-EpbBPT0hmv28hw',
          appId: '1:159165907154:ios:66a79118916da53d616d0b',
          messagingSenderId: '159165907154',
          projectId: 'ana-dp',
          storageBucket: 'ana-dp.appspot.com',
          iosClientId: '159165907154-arjb5sftj8rbopfclg4t7uuiq8f2ru0o.apps.googleusercontent.com',
          iosBundleId: 'com.nasajon.ana',
        );
    }
  }
}
