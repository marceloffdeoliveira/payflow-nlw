import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import 'barcode_status.dart';

class BarcodeScanerPage extends StatefulWidget {
  const BarcodeScanerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScanerPageState createState() => _BarcodeScanerPageState();
}

class _BarcodeScanerPageState extends State<BarcodeScanerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    super.initState();
  }

  Widget build(BuildContext context) {
    // return BottomSheetWidget(
    //   primaryLabel: "Escanear novamente",
    //   primaryOnPressed: () {},
    //   secondaryLabel: "Digitar o código",
    //   secondaryOnPressed: () {},
    //   title: "Não foi possível identificar o código de barras",
    //   subTitle: "Tente escanear novamente ou digite o código do seu boleto",
    // );
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: status.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.black,
                title: Text("Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground),
                leading: const BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ))
                ],
              ),
              bottomNavigationBar: SetLabelButtonsWidget(
                primaryLabel: "Inserir código do boleto",
                primaryOnPressed: () {},
                secondaryLabel: "Inserir da galeria do boleto",
                secondaryOnPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
