import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/views/search_bar/search_bar_screen.dart';
import 'package:flutter_challange_motel_list/views/suite_details_screen/suite_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challange_motel_list/viewmodels/motel_viewmodel.dart';

class MotelWidget extends StatefulWidget {
  final int index;

  const MotelWidget({Key? key, required this.index}) : super(key: key);

  @override
  _MotelWidgetState createState() => _MotelWidgetState();
}

class _MotelWidgetState extends State<MotelWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = Provider.of<MotelViewModel>(context, listen: false);
      if (viewModel.motelData == null && !viewModel.isLoading) {
        viewModel.fetchMoteis();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MotelViewModel>(
      builder: (context, motelViewModel, child) {
        if (motelViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (motelViewModel.error != null) {
          return Center(child: Text(motelViewModel.error!));
        }

        final motelData = motelViewModel.motelData;
        if (motelData == null || motelData.moteis.isEmpty) {
          return const Center(child: Text("Nenhum dado disponível"));
        }

        final motel = motelData.moteis[widget.index];

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          //child: SingleChildScrollView9
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: Card(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              motel.logo,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image, size: 50);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                motel.fantasia,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(motel.bairro),
                              Text('${motel.distancia} km de distância'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      
                    },
                  ),
                ),
              ),

              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height, 
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                ),
                items: motel.suites.map((suite) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          if (motel.suites.isNotEmpty)
              
                            Card(
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            suite.fotos.first,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                width: MediaQuery.of(context).size.width,
                                                color: Colors.grey[300],
                                                child: const Icon(Icons.image, size: 50, color: Colors.grey),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        suite.nome,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text("🚨", style: TextStyle(fontSize: 12)),
                                          Text(
                                            'Só mais ${suite.qtd} pelo app ',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  
                                },
                              ),
                            ),

                          if (suite.itens.isNotEmpty)
                            Card(
                              child: SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 8, 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          runAlignment: WrapAlignment.center,
                                          spacing: 5,
                                          runSpacing: 5,
                                          direction: Axis.vertical,
                                          children: motel.suites.expand((suite) => suite.itens).take(4).map((item) {
                                            return Chip(
                                              avatar: const Icon(Icons.check_circle, color: Colors.green, size: 12,),
                                              label: Text(item.nome, style: const TextStyle( fontSize: 12) ,),
                                            );
                                          }).toList(),
                                          
                                        ),
                                        const Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => SuiteDetailsScreen()
                                      )
                                    );
                                  },
                                ),
                              ),
                            ),

                          if (suite.periodos.isNotEmpty)
                            Wrap(
                              spacing: 10,
                              children: motel.suites.expand((suite) => suite.periodos).take(3).map((periodo) {
                                return Card(
                                  child: InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      height: 80,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        //color: Colors.white54,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${periodo.tempo} horas",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "R\$ ${periodo.valor.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.keyboard_arrow_right),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                  },
                                  ),
                                );
                              }).toList(),
                            ),
                        ]);
                      },
                    );
                  }
                ).toList(),
              ),
            ],
          ),
          //),
        );
      },
    );
  }
}
