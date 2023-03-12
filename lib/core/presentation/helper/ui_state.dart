import 'package:flutter/material.dart';

@immutable
abstract class UiState {}

class UiLoading extends UiState {}

class UiError extends UiState {
  final String? message;
  UiError([this.message]);
}
class UiSuccess extends UiState {}