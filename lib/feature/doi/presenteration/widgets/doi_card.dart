import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:flutter/material.dart';

class DoiCard extends StatefulWidget {
  const DoiCard({
    Key? key,
    required this.entity,
    required this.onClick,
  }) : super(key: key);

  final DoiData entity;
  final Function(DoiData value) onClick;

  @override
  State<DoiCard> createState() => _DoiCardState();
}

class _DoiCardState extends State<DoiCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick.call(widget.entity);
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.entity.attributes?.publisher}",
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              Text(
                "Doi: ${widget.entity.attributes?.doi}",
              ),
              Text(
                "Registered at: ${widget.entity.attributes?.registered?.split("T")[0]}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
