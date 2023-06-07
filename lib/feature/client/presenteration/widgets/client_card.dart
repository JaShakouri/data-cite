import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatefulWidget {
  const ClientCard({
    Key? key,
    required this.entity,
    required this.onClick,
  }) : super(key: key);

  final ClientData entity;
  final Function(ClientData value) onClick;

  @override
  State<ClientCard> createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
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
