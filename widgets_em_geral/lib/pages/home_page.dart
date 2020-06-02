import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacidade = 1.0;
  double _largura = 300.0;
  double _altura = 300.0;
  double _vermelho = 0.0;
  double _verde = 0.0;
  double _azul = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets em geral'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Vermelho/red(R do RGBO): '),
              Slider(
                label: 'R: $_vermelho',
                min: 0.0,
                max: 255.0,
                divisions: 255,
                value: _vermelho,
                onChanged: (value) {
                  setState(() {
                    _vermelho = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Verde/green(G do RGBO): '),
              Slider(
                label: 'G: $_verde',
                min: 0.0,
                max: 255.0,
                divisions: 255,
                value: _verde,
                onChanged: (value) {
                  setState(() {
                    _verde = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Azul/blue(B do RGBO): '),
              Slider(
                label: 'B: $_azul',
                min: 0.0,
                max: 255.0,
                divisions: 255,
                value: _azul,
                onChanged: (value) {
                  setState(() {
                    _azul = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Opaciade pelo widget:',
              ),
              Slider(
                label: 'Opacidade: $_opacidade',
                divisions: 3,
                value: _opacidade,
                max: 1.0,
                min: 0.0,
                onChanged: (value) {
                  setState(() {
                    _opacidade = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Largura:'),
              Slider(
                label: 'Largura: $_largura',
                value: _largura,
                divisions: 5,
                min: 0.0,
                max: 300.0,
                onChanged: (value) {
                  setState(() {
                    _largura = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Altura:'),
              Slider(
                min: 0.0,
                max: 300.0,
                value: _altura,
                onChanged: (value) {
                  setState(() {
                    _altura = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                opacity: _opacidade,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                child: AnimatedContainer(
                  height: _altura,
                  width: _largura,
                  color: Color.fromRGBO(
                      _vermelho.round(), _verde.round(), _azul.round(), 1),
                  duration: Duration(milliseconds: 500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
