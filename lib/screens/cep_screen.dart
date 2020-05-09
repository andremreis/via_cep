import 'package:flutter/material.dart';
import 'package:viacep/domain/endereco.dart';

import 'package:viacep/domain/endereco_controller.dart';

class CepScreen extends StatefulWidget {
  @override
  _CepScreenState createState() => _CepScreenState();
}

class _CepScreenState extends State<CepScreen> {

  final _cepController = TextEditingController();
  Future<Endereco> enderecoFuturo;

  Endereco endereco = Endereco();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca Cep"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(38),
        child: Column(
          children: <Widget>[
            Text("Informe o CEP"),
            TextField(
              controller: _cepController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 8,
            ),
            RaisedButton(
              child: Text("Consultar"),
              onPressed: () async{
                setState(() {});
              }
            ),
            SizedBox(height: 5,),
            Expanded(
              child: FutureBuilder<Endereco>(
                future: BuscarDados('https://viacep.com.br/ws/'+_cepController.text+'/json/'),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView(
                      padding: EdgeInsets.only(top: 5),
                      children: <Widget>[
                        Text("Cep: " + snapshot.data.cep),
                        Text("Logradouro: " + snapshot.data.logradouro),
                        Text("Complemento: " + snapshot.data.complemento),
                        Text("Bairro: " + snapshot.data.bairro),
                        Text("Localidade: " + snapshot.data.localidade),
                        Text("Uf: "),
                      ],
                    );
                  }else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  // Enquanto espera
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
