import 'package:flutter/material.dart';
import 'package:store_app/app/constants.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final double sizeHeight;
  const ReadMoreText({
    Key? key,
    required this.text,
    required this.sizeHeight,
  }) : super(key: key);

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  late double textHeight = widget.sizeHeight / 2.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: const TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                height: 1.2,
              ),
            )
          : Column(
              children: [
                Text(
                  hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                    height: 1.2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? "Read more" : "Hiding",
                        style: const TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 12,
                          height: 1.2,
                        ),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: kPrimaryTextColor,
                        size: 25,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
