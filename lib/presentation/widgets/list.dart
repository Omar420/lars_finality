import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lars/domain/Models/news.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.commentData,
    required this.width,
    required this.height,
  });

  final News commentData;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromARGB(255, 43, 127, 223),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              child: Text(
                'Title: ${commentData.name}' ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              child: Row(
                children: [
                  Text(
                    'Autor: ${commentData.author}' ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
