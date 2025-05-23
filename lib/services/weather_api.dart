import 'dart:convert';
import 'package:http/http.dart' as http;


const weatherApiKey = 'b265c097ec0492b20385528ba5e9b985';
const currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';


Future<dynamic> getWeatherForCity({required String city}) async {

     try{  
    var uri = Uri.parse('$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey');
    
    var response =  await http.get(uri);
    
    if (response.statusCode != 200 ){
        throw Exception("There was a problem with the request: status ${response.statusCode} received.");
    } 
    return jsonDecode(response.body);

    } catch (e){
    throw Exception("there was a problem with the request: '$e'");
    }
}
