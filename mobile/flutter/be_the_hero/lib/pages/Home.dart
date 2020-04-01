import 'package:be_the_hero/pages/Detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/hero_store.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HeroStore _incidentsStore = GetIt.I.get<HeroStore>();

  final rs =
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$", name: "Real");
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var page = _incidentsStore.page != null ? _incidentsStore.page : 1;
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_incidentsStore.totalIncidents != null) {
          if ((_incidentsStore.totalIncidents - (page * 5)) > 0) {
            _incidentsStore.setPage(page + 1);
          }
        }
      }
    });
    if (_incidentsStore.allIncidentsD == null) {
      _incidentsStore.fetchAllIncidents();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image.asset(
                        'logo.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Total de ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color.fromARGB(204, 115, 115, 128)),
                          ),
                          Observer(
                            builder: (_) {
                              return Tooltip(
                                message: "Pressione para buscar novos casos",
                                child: GestureDetector(
                                  onTap: () {
                                    _incidentsStore.setPage(1);
                                  },
                                  child: Text(
                                    "${(_incidentsStore.totalIncidents == null ? 0 : _incidentsStore.totalIncidents)} casos",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text("Bem vindo!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Escolha um dos casos abaixo e salve o dia!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromARGB(204, 115, 115, 128))),
              ),
              Flexible(
                  child: Observer(
                name: 'Observer_list',
                builder: (_) {
                  Widget build;
                  if (_incidentsStore.allIncidentsD == null) {
                    _incidentsStore.getAllIncidentsD();
                  }
                  if (_incidentsStore.allIncidentsD == null) {
                    build = ListView.builder(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 25, bottom: 25),
                                    child: Text(
                                      "Nenhum caso cadastrado",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              204, 115, 115, 128)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    build = ListView.builder(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _incidentsStore.allIncidentsD.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "ONG:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 10),
                                      child: Text(
                                        "${_incidentsStore.allIncidentsD[index]['name']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                204, 115, 115, 128)),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Caso:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                        "${_incidentsStore.allIncidentsD[index]['description']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                204, 115, 115, 128)),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Valor:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "${rs.format(_incidentsStore.allIncidentsD[index]['value'])}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              204, 115, 115, 128)),
                                    ),
                                  ),
                                  FlatButton(
                                    splashColor: Colors.grey[100],
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Detail(
                                                    incident: _incidentsStore
                                                        .allIncidentsD[index],
                                                  )));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Ver mais detalhes",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 224, 32, 64),
                                              fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color:
                                              Color.fromARGB(255, 224, 32, 64),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return build;
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
