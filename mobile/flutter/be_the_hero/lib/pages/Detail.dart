import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Detail extends StatelessWidget {
  final dynamic incident;

  const Detail({Key key, this.incident}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rs =
        NumberFormat.currency(locale: "pt_BR", symbol: "R\$", name: "Real");

    Future<void> sendMail() async {
      print(incident['email']);
      final Email email = Email(
        body:
            'Olá ${incident['name']}, estou entrando em contato pois gostaria de ajudar no caso "${incident['title']}" com o valor de ${rs.format(incident['value'])}',
        subject: 'Caso ${incident['title']}',
        recipients: [incident['email']],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }

    Future<void> sendWhatsapp() async {
      print(incident['whatsapp']);
      FlutterOpenWhatsapp.sendSingleMessage("${incident['whatsapp']}",
          'Olá ${incident['name']}, estou entrando em contato pois gostaria de ajudar no caso *${incident['title']}* com o valor de *${rs.format(incident['value'])}*');
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                          child: IconButton(
                            tooltip: "Voltar",
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: Color.fromARGB(255, 224, 32, 64),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 24,
                            ),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
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
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "ONG:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "${incident['name']} de ${incident['city']}/${incident['uf']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(204, 115, 115, 128)),
                                ),
                              ),
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
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "${incident['description']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(204, 115, 115, 128)),
                                ),
                              ),
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
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Text(
                                  "${rs.format(incident['value'])}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(204, 115, 115, 128)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
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
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    "Salve o dia",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Seja o herói desse caso.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text("Entre em contato:"),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 224, 32, 64))),
                                        onPressed: sendWhatsapp,
                                        color: Color.fromARGB(255, 224, 32, 64),
                                        textColor: Colors.white,
                                        child: Text("WhatsApp",
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 224, 32, 64))),
                                        onPressed: sendMail,
                                        color: Color.fromARGB(255, 224, 32, 64),
                                        textColor: Colors.white,
                                        child: Text("E-mail",
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
