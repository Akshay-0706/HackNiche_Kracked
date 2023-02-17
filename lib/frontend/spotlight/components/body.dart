import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../backend/database/spotlight.dart';
import '../../../size.dart';

class SpotLightBody extends StatefulWidget {
  const SpotLightBody({super.key, required this.spots});
  final Spots spots;

  @override
  State<SpotLightBody> createState() => _SpotLightBodyState();
}

class _SpotLightBodyState extends State<SpotLightBody> {
  late Spotlight spotlight = Spotlight([widget.spots]);
  bool isReady = false;

  @override
  void initState() {
    setState(() {
      isReady = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => isReady
              ? ReelCard(
                  pallete: pallete,
                  spots: spotlight.spots[index],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ReelCard extends StatelessWidget {
  const ReelCard({
    Key? key,
    required this.pallete,
    required this.spots,
  }) : super(key: key);

  final Pallete pallete;
  final Spots spots;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          child: Image.network(
            spots.img,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],
              stops: const [
                0.0,
                0.2,
                0.3,
                0.4,
                0.9,
                1.0,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spots.title,
                style: TextStyle(
                  color: pallete.background(),
                  fontSize: getWidth(34),
                ),
              ),
              SizedBox(height: getWidth(20)),
              Text(
                DateFormat.jm().format(spots.time).toLowerCase(),
                style: TextStyle(
                  color: pallete.background().withOpacity(0.6),
                  fontSize: getWidth(16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
