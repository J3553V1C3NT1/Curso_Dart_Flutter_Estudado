import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? valor;
  final double? percentual;
  ChartBar({
    required this.label,
    required this.valor,
    required this.percentual,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, contraints) {
        return Column(
          children: [
            Container(
              height: contraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(valor!.toStringAsFixed(2)),
              ),
            ),
            SizedBox(height: contraints.maxHeight * 0.05),
            Container(
              height: contraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 1.0,
                        ),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentual,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: contraints.maxHeight * 0.05),
            Container(
              height: contraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label!),
              ),
            )
          ],
        );
      },
    );
  }
}
