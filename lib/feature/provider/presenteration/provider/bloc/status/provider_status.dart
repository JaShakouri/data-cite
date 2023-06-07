import 'package:de_dtcite/core/base/base_status.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProviderStatus extends BaseStatus {}

class LoadMoreProviderState extends ProviderStatus {
  @override
  List<Object?> get props => throw UnimplementedError();
}
