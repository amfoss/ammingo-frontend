import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static const String baseUrl = "http://10.239.135.182:8000";

  Future<void> sendOtp(String email) async {
    await _dio.post(
      "/login/email",
      data: {
        "email": email,
      },
    );
  }

  Future<void> resendOtp(String email) async {
    await sendOtp(email);
  }

  Future<Response> verifyOtp(
      String email,
      String otp,
      ) async {
    return await _dio.post(
      "/login/verify-otp",
      data: {
        "email": email,
        "otp": otp,
      },
    );
  }

  Future<Response> joinGame(String code) async {
    return await _dio.post(
      "/games/join/$code",
      data: {},
    );
  }

  Future<Response> getLobby(String code) async {
    return await _dio.get("/games/$code/lobby");
  }

  Future<Response> getGameDetails(String code) async {
    return await _dio.get("/games/$code");
  }

  Future<String?> signInWithGoogle() async {
    final result = await FlutterWebAuth2.authenticate(
      url: "http://localhost:8000/api/login/oauth",
      callbackUrlScheme: "amingo",
      options: const FlutterWebAuth2Options(
        preferEphemeral: false,
      ),
    );
    return Uri.parse(result).queryParameters["token"];
  }
}