import 'package:flutter/widgets.dart';
import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressSearchVeiwModel extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  final vworldRepository = VworldRepository();

  Future searchByName(String query) async {
    final result = await vworldRepository.findByName(query);
    state = result;
  }

  void searchByLocation(double lat, double lng) async {
    final result = await vworldRepository.findByLatLng(lat, lng);
    state = result;
  }
}

final addressSearchVeiwModel =
    NotifierProvider.autoDispose<AddressSearchVeiwModel, List<String>>(() {
  return AddressSearchVeiwModel();
});
