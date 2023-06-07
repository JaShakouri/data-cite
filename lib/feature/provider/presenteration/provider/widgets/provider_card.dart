import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatefulWidget {
  const ProviderCard({
    Key? key,
    required this.entity,
    required this.onClick,
  }) : super(key: key);

  final ProviderData entity;
  final Function(ProviderData value) onClick;

  @override
  State<ProviderCard> createState() => _ProviderCardState();
}

class _ProviderCardState extends State<ProviderCard> {
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
                "${widget.entity.attributes?.name}",
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              Text(
                "Symbol: ${widget.entity.attributes?.symbol}",
              ),
              Text(
                "Created at: ${widget.entity.attributes?.created?.split("T")[0]}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
