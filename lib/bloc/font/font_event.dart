import 'package:equatable/equatable.dart';

abstract class FontEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateFontScale extends FontEvent {
  final double fontScale;

  UpdateFontScale(this.fontScale);

  @override
  List<Object> get props => [fontScale];
}

class UpdateFontFamily extends FontEvent {
  final String fontFamily;

  UpdateFontFamily(this.fontFamily);

  @override
  List<Object> get props => [fontFamily];
}
