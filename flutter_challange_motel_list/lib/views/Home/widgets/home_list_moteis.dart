import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challange_motel_list/viewmodels/motel_viewmodel.dart';

class MotelWidget extends StatefulWidget {
  final int index;

  const MotelWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

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
        if (motelData == null || motelData.moteis!.isEmpty) {
          return const Center(child: Text("Nenhum dado disponível"));
        }

        final motel = motelData.moteis[widget.index];
        final suiteInfo = motelData.moteis[widget.index].suites[widget.index];


        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      Text('${motel.qtdFavoritos} favoritos'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              if (motel.suites.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: motel.suites.map((suite) {


                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                suite.imagem,
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
                            const SizedBox(height: 5),
                            Text(
                              suite.nome,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${suite.qtd} disponíveis',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              const SizedBox(height: 10),

              if (motel.suites.isNotEmpty) ...[
                Card(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 10,
                          children: motel.suites.expand((suite) => suite.itens).take(4).map((item) {
                            return Chip(
                              avatar: const Icon(Icons.check_circle, color: Colors.green),
                              label: Text(item.nome),
                            );
                          }).toList(),
                        )
                      
                    ),
                    onTap: () {
                     // Direciona para a página com todos os itens
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // const Text(
                //   "Períodos disponíveis",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: motel.suites.expand((suite) => suite.periodos).take(3).map((periodo) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${periodo.tempo} horas",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.colorRed,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "R\$ ${periodo.valor.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.colorRed,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
