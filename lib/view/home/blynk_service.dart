import 'dart:convert';
import 'package:http/http.dart' as http;

class VitalService {
  final String blynkAuthToken = 'omM0Qlal7l_W4LvLY-DcWgIiPYf5pAP4';

  Future<int?> _getBlynkData(String pin) async {
    final url = Uri.parse('https://blr1.blynk.cloud/external/api/get?token=$blynkAuthToken&v$pin');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return int.tryParse(response.body.trim());
      } else {
        print('Failed to get data for pin V$pin: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data from Blynk for pin V$pin: $e');
    }
    return null;
  }

  /// Fetch real-time vitals from Blynk cloud
  Future<Map<String, String>> getLatestVitals() async {
    final temperature = await _getBlynkData('0'); // V0
    final humidity = await _getBlynkData('1');    // V1
    final heartBeat = await _getBlynkData('2');   // V2
    final spo2 = await _getBlynkData('3');        // V3

    return {
      'temperature': temperature?.toString() ?? '0',
      'humidity': humidity?.toString() ?? '0',
      'heartbeat': heartBeat?.toString() ?? '0',
      'spo2': spo2?.toString() ?? '0',
    };
  }
}
