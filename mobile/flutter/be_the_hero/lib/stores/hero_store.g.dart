// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeroStore on _HeroStoreBase, Store {
  Computed<int> _$totalIncidentsComputed;

  @override
  int get totalIncidents =>
      (_$totalIncidentsComputed ??= Computed<int>(() => super.totalIncidents))
          .value;
  Computed<int> _$pageComputed;

  @override
  int get page => (_$pageComputed ??= Computed<int>(() => super.page)).value;
  Computed<List<dynamic>> _$allIncidentsDComputed;

  @override
  List<dynamic> get allIncidentsD => (_$allIncidentsDComputed ??=
          Computed<List<dynamic>>(() => super.allIncidentsD))
      .value;

  final _$_totalIncidentsAtom = Atom(name: '_HeroStoreBase._totalIncidents');

  @override
  int get _totalIncidents {
    _$_totalIncidentsAtom.context.enforceReadPolicy(_$_totalIncidentsAtom);
    _$_totalIncidentsAtom.reportObserved();
    return super._totalIncidents;
  }

  @override
  set _totalIncidents(int value) {
    _$_totalIncidentsAtom.context.conditionallyRunInAction(() {
      super._totalIncidents = value;
      _$_totalIncidentsAtom.reportChanged();
    }, _$_totalIncidentsAtom, name: '${_$_totalIncidentsAtom.name}_set');
  }

  final _$_pageAtom = Atom(name: '_HeroStoreBase._page');

  @override
  int get _page {
    _$_pageAtom.context.enforceReadPolicy(_$_pageAtom);
    _$_pageAtom.reportObserved();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.context.conditionallyRunInAction(() {
      super._page = value;
      _$_pageAtom.reportChanged();
    }, _$_pageAtom, name: '${_$_pageAtom.name}_set');
  }

  final _$_allIncidentsAtom = Atom(name: '_HeroStoreBase._allIncidents');

  @override
  List<dynamic> get _allIncidents {
    _$_allIncidentsAtom.context.enforceReadPolicy(_$_allIncidentsAtom);
    _$_allIncidentsAtom.reportObserved();
    return super._allIncidents;
  }

  @override
  set _allIncidents(List<dynamic> value) {
    _$_allIncidentsAtom.context.conditionallyRunInAction(() {
      super._allIncidents = value;
      _$_allIncidentsAtom.reportChanged();
    }, _$_allIncidentsAtom, name: '${_$_allIncidentsAtom.name}_set');
  }

  final _$_HeroStoreBaseActionController =
      ActionController(name: '_HeroStoreBase');

  @override
  dynamic setPage(int page) {
    final _$actionInfo = _$_HeroStoreBaseActionController.startAction();
    try {
      return super.setPage(page);
    } finally {
      _$_HeroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchAllIncidents() {
    final _$actionInfo = _$_HeroStoreBaseActionController.startAction();
    try {
      return super.fetchAllIncidents();
    } finally {
      _$_HeroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'totalIncidents: ${totalIncidents.toString()},page: ${page.toString()},allIncidentsD: ${allIncidentsD.toString()}';
    return '{$string}';
  }
}
