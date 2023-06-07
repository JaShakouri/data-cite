import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseStatus extends Equatable {}

class LoadingState extends BaseStatus {
  @override
  List<Object?> get props => [];
}

class ErrorState extends BaseStatus {
  final String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
