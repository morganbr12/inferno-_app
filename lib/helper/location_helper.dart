const googleApiKey = 'AIzaSyCV9og41Ht3l1ntTbKqoapHz2mU0E_nID4';

class LocationHelper {
  static String generateLocationAddress([double? latitude, double? longitude]) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadma&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$googleApiKey&signature=YOUR_SIGNATURE';
  }
}
