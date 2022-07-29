import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  const BackgroundImageWidget({
    super.key,
    required this.image,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildBackground(image: image),
        child,
      ],
    );
  }
}

class BuildBackground extends StatelessWidget {
  final ImageProvider<Object> image;

  const BuildBackground({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.black12.withOpacity(0.2),
          Colors.black26.withOpacity(0.3),
        ],
        begin: Alignment.center,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blue.withOpacity(0.25),
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}
