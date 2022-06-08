import 'package:astrotak/model/Location.dart';
import 'package:astrotak/model/Question.dart';
import 'package:astrotak/utils/httpClient.dart';
import 'package:dio/dio.dart';

class AppRepository {
  static final AppRepository _singleton = AppRepository._();

  static AppRepository get instance => _singleton;
  AppRepository._();

  AppRepository() {}
  Future<Map<String, dynamic>> _getHeader() async {
    return {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiODZhYTlhODItYjlhOS00NGFiLTkyYzQtODY4YjIyYzA4ZTY0IiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijg4MDk3NjUxOTEiLCJlbWFpbCI6ImFiaGlzaGVrLnNhaEBhYWp0YWsuY29tIiwibWFza2VkRW1haWwiOiJhYmgqKioqKioqKiphYWp0YWsuY29tIiwiZXhpc3RpbmdVc2VyIjpmYWxzZSwiaWF0IjoxNjQ3OTQ1MjY3LCJleHAiOjE2Njc5NDUyNjd9.whYbyeeBt91qni3zzp5eaitD2eKVnPI5scjiG49J_ks"
    };
  }

  Future<dynamic> sendPost(String path, dynamic body,
      {ProgressCallback? sendProgress, int? sendTimeout}) async {
    return (await HttpClient.instance.post(path, body, await _getHeader(),
        sendProgress: sendProgress, sendTimeout: sendTimeout)); //.data
  }

  /// Sends a GET request to the given Api path
  Future<dynamic> sendGet(String path) async {
    return (await HttpClient.instance
        .getRequest(path, await _getHeader())); //.data
  }

  Future<dynamic> getRelativeList() async {
    try {
      return "";
      final response = await sendGet("relative/all");
      print(response);
      if (response != null) {
        return response.data;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Question>> getAllQuestion() async {
    try {
      final response = await sendGet("question/category/all");
      if (response != null) {
        List<Question> ques = [];
        response.data["data"]
            .forEach((e) => {print(e), ques.add(Question.fromJson(e))});
        return ques;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> addRelativce(data) async {
    print(data);
    try {
      final response = await sendPost("relative", data);
      print(response);
      if (response != null) {
        return response.data;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> updateRelative(String uuid) async {
    try {
      final response = await sendPost('relative/update/${uuid}', {
        "uuid": "4f6869c0-f4ef-43c5-b726-4e4a00d3b278",
        "relation": "Brother",
        "relationId": 3,
        "firstName": "Mohit",
        "middleName": null,
        "lastName": "Singh",
        "fullName": "Mohit Kumar",
        "gender": "MALE",
        "dateAndTimeOfBirth": "1996-09-18 01:39",
        "birthDetails": {
          "dobYear": 1996,
          "dobMonth": 9,
          "dobDay": 18,
          "tobHour": 1,
          "tobMin": 39,
          "meridiem": "AM"
        },
        "birthPlace": {
          "placeName": "Kulharia, Bihar, India",
          "placeId": "ChIJSQWWoQ48kDkRg_d1ANRdMlo"
        }
      });
      print(response);
      if (response != null) {
        return response.data;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> deleteRelative(String uuid) async {
    try {
      final response = await sendPost('relative/delete/${uuid}', {});
      print(response);
      if (response != null) {
        return response.data;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Location>> getAllLocation(String place) async {
    print(place);
    try {
      final response = await sendGet("location/place?inputPlace=${place}");
      print(response);
      if (response != null) {
        List<Location> locations = [];
        response.data["data"]
            .forEach((e) => {print(e), locations.add(Location.fromJson(e))});
        return locations;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
