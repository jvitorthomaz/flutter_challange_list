import 'package:flutter/material.dart';
import '../models/motel_model.dart';
import '../services/api_service.dart';

class MotelViewModel with ChangeNotifier {
  ApiMotelModel? _motelData;
  bool _isLoading = false;
  String? _error;

  ApiMotelModel? get motelData => _motelData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ApiService _apiService = ApiService();

  Future<void> fetchMoteis() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _apiService.fetchMoteis(); 
      if (data != null) {
        _motelData = ApiMotelModel.fromJson(data); 
        _error = null;
      } else {
        _error = "Nenhum dado encontrado";
      }
    } catch (e) {
      _error = "Erro ao carregar os dados: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
