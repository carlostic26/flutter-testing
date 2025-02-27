import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/presentation/state/provider/appbar_detail_state.dart';

class AppBarDetailWidget extends ConsumerWidget {
  const AppBarDetailWidget({
    super.key,
    required this.widthScreen,
  });

  final double widthScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenemos la sección activa
    final activeSection = ref.watch(appBarSectionProvider);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: widthScreen * 0.05),
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.import_contacts,
                size: 15,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(appBarSectionProvider.notifier).state =
                    AppBarSection.definition;
              },
              child: Text(
                'Definición',
                style: TextStyle(
                  fontWeight: activeSection == AppBarSection.definition
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.code,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(appBarSectionProvider.notifier).state =
                          AppBarSection.code;
                    },
                    child: Text(
                      'Code',
                      style: TextStyle(
                        fontWeight: activeSection == AppBarSection.code
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Líneas de sección
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: widthScreen * 0.01),
              child: Container(
                height: activeSection == AppBarSection.definition ? 4 : 1,
                width: widthScreen * 0.35,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: widthScreen * 0.05),
                  child: Container(
                    height: activeSection == AppBarSection.code ? 4 : 1,
                    width: widthScreen * 0.35,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
