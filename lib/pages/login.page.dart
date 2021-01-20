import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:doglife/pages/reset-password.page.dart';
import 'package:doglife/pages/home.page.dart';
import 'package:doglife/pages/signup.page.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'home.page.dart';

class LoginPage extends StatelessWidget {
  var _senha = new TextEditingController();
  var _cpf = new TextEditingController();
  var podeAcessar;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100, 
              height: 100,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "CPF/CNPJ",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              controller: _cpf,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
              controller: _senha,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1],
                  colors: [
                    Color(0XFF17abd2),
                    Color(0xFF59C4EF),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/favicon.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    getDataLogin(context,_senha.text,_cpf.text);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   height: 60,
            //   alignment: Alignment.centerLeft,
            //   decoration: BoxDecoration(
            //     color: Color(0xFF3C5A99),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(5),
            //     ),
            //   ),
            //   child: SizedBox.expand(
            //     child: FlatButton(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Text(
            //             "Login com Facebook",
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white,
            //               fontSize: 20,
            //             ),
            //             textAlign: TextAlign.left,
            //           ),
            //           Container(
            //             child: SizedBox(
            //               child: Image.asset("assets/fb-icon.png"),
            //               height: 28,
            //               width: 28,
            //             ),
            //           )
            //         ],
            //       ),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Future getDataLogin(BuildContext context, senha, cpf)  async {
    if(_cpf.text.isEmpty){
      erroLogin(context);
    }else 
      if ((_cpf.text.length < 11) && (_cpf.text.length > 14)){
        erroLogin(context);
    }else{
      var url = "http://redefretefacil1.hospedagemdesites.ws/mobilePHP/verificaLogin.php?cpf="+cpf+"&senha="+senha;
          //print(url);
      http.Response response = await http.get(Uri.encodeFull(url));
      var data = jsonDecode(response.body);
      //print(data.toString());
      //print(response);
      podeAcessar = data;
      validaLogin(context);
    }
  }

  validaLogin(BuildContext context){
    if (podeAcessar == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else if (podeAcessar == 0) {
      erroLogin(context);
    }
  }

  validaCampos(){

  }

  erroLogin(BuildContext context) {
   Widget cancelaButton = FlatButton(
    child: Text("Recuperar senha"),
    onPressed:  () {},
  );
  Widget continuaButton = FlatButton(
    child: Text("Retornar"),
    onPressed:  () {},
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Desculpe mas temos um problema"),
    content: Text("CPF ou senha inválidos."),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  }
}
