import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as date;

// ignore: must_be_immutable
class NewsItemWidget extends StatefulWidget {
  String? newsTitle, newsContent, imageUrl, newsAuthor, newsPostingTime;

  NewsItemWidget(
      {Key? key,
      this.imageUrl,
      this.newsTitle,
      this.newsContent,
      this.newsAuthor,
      this.newsPostingTime})
      : super(key: key);

  @override
  State<NewsItemWidget> createState() => _NewsItemWidgetState();
}

class _NewsItemWidgetState extends State<NewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    widget.imageUrl!,
                    width: 150,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Text(widget.newsAuthor!),
                  Text(date.DateFormat.yMMMEd()
                      .add_jm()
                      .format(DateTime.parse(widget.newsPostingTime!))
                      .toString())
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Text(
                      widget.newsTitle!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.newsContent!,
                      maxLines: 5,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                    )
                  ]))
            ],
          ),
        ));
  }
}
