import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mikhuy/google_maps_builder.dart';
import 'package:mikhuy/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/mikhuy-logo.svg',
              width: 42,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mikhuy',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColors.orangeTango),
                ),
                Text(
                  'Dale una segunda oportunidad a los alimentos :)',
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(color: AppColors.orangeTango),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: GoogleMapsBuilder(),
        ),
      ),
    );
  }
}
