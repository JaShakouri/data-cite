import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatefulWidget {
  const ClientCard({
    Key? key,
    required this.entity,
    required this.onClick,
  }) : super(key: key);

  final ClientsTotals entity;
  final Function(String? clientId) onClick;

  @override
  State<ClientCard> createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick.call(widget.entity.id);
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
                widget.entity.title ?? 'Undefined',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              Text(
                "Doi Count: ${widget.entity.count ?? 0}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
