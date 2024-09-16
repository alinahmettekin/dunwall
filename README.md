# DUNWALL - The Places You Have To See

- **TR** Dunwall Google Places ve Google Autocomplete API'lerini kullanarak tasarlamış olduğum uygulamadır. Bu uygulamada kullanıcının yakınında bulunan çeşitli tiplere göre (Ör. Tarihi Yerler, Parklar, Müzeler vb.) yerleri bularak getirir. Ek olarak text ile yer arama yapmayı destekler. Yer bilgilerine, fotoğraflarına, haritada konumunu gösterme yeteneğine sahiptir.
- **EN** Dunwall is an application I designed using Google Places and Google Autocomplete APIs. In this application, the user can find places nearby based on various types (e.g., historical sites, parks, museums, etc.). Additionally, it supports searching for places by text. The app provides information about the places, displays photos, and shows their location on a map.

## Getting Started
### API KEY
- **TR** Uygulamayı kullanabilmek için Google Cloud Console aracılığı ile Places API (OLD) API'si aktif hale getirilmiş projeden API KEY alınmalı. Proje iskeletine göre lib/core/credentials/credentials.dart içerisinde Credentials sınıfında statik olarak tanımlanıp çağrılmalıdır.
- **EN** To use the application, the Places API (OLD) must be activated via Google Cloud Console, and an API key should be obtained from the project. According to the project structure, the API key should be statically defined and called within the Credentials class located in lib/core/credentials/credentials.dart.

### Run Project

- **TR** Tek yapmanız gereken projeyi **git clone** ile local'e çekip ardından **flutter pub get** ve **flutter run** ile çalıştırmak.
- **EN** All you need to do is **git clone** the project locally, then run **flutter pub get** and **flutter run** to start it.

