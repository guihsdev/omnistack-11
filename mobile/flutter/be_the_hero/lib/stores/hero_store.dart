import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'hero_store.g.dart';

class HeroStore = _HeroStoreBase with _$HeroStore;
const url_api = "192.168.0.103:3000";

abstract class _HeroStoreBase with Store {
  @observable
  int _totalIncidents;
  @computed
  int get totalIncidents => _totalIncidents;

  @observable
  int _page;
  @computed
  int get page => _page;
  @action
  setPage(int page) {
    _page = page;
    if (page == 1) {
      _allIncidents = null;
    }
    fetchAllIncidents();
  }

  @observable
  List<dynamic> _allIncidents;
  @computed
  List<dynamic> get allIncidentsD => _allIncidents;
  @action
  fetchAllIncidents() {
    getAllIncidentsD().then((res) {
      List<dynamic> list = [];
      var decodeJson = jsonDecode(res.body);
      if (decodeJson.isNotEmpty) {
        list = decodeJson.map((c) => c).toList();
        if (_allIncidents == null) {
          _allIncidents = list;
        } else {
          if (!listEquals(_allIncidents, list)) {
            _allIncidents = [..._allIncidents, ...list];
          }
        }
      }
      if (res.headers.isNotEmpty) {
        _totalIncidents = int.parse(res.headers['x-total-count']);
      }
    });
  }

  Future<dynamic> getAllIncidentsD() async {
    try {
      var uri = Uri.http(url_api, '/incidents',
          {'page': (_page != null ? _page.toString() : '1')});
      final res = await http.get(uri);
      print(res);
      return res;
    } catch (error, stacktrace) {
      print("Erro ao carregar os casos: $error + ${stacktrace.toString()}");
      return null;
    }
  }
}
