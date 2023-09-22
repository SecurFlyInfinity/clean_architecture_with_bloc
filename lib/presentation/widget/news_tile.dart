import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:architecture/presentation/widget/shared_widget.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String date;

  const NewsTile({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
              errorBuilder: (ctx, result, progress) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.info),
                ));
              },
            ),
          ),
          SharedWidget.height(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ThemeConfig.styles.style14.copyWith(
                    fontWeight: FontWeight.w700, fontFamily: "Arial")),
          ),
          SharedWidget.height(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    ThemeConfig.styles.style12.copyWith(fontFamily: "Arial")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(date,
                  overflow: TextOverflow.ellipsis,
                  style:
                  ThemeConfig.styles.style12.copyWith(fontFamily: "Arial",color: Colors.grey)),
            ),
          ),
          SharedWidget.height(10),
        ],
      ),
    );
  }
}
