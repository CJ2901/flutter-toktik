import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({
    super.key, 
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botones de interacción
        _CustomIconButton(value: video.likes, iconData: Icons.favorite, color: Colors.red),
        const SizedBox(height: 10),
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_rounded),
        const SizedBox(height: 10),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 4),
          child: const Stack(
            children: [
              _CustomIconButton(value: 0, iconData: Icons.play_circle_outline)
            ])
        )
      ], 
    );
  }

  
}

class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value, 
    required this.iconData, 
    color, 
    
  }): color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        IconButton(
          onPressed: () {
            
          },
          icon: Icon( iconData , color: color, size: 30),
        ),
        //condicional si value es 0 no se muestra
        if(value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()), style: const TextStyle(color: Colors.white, fontSize: 12))


        
      ],
    );
  }
}