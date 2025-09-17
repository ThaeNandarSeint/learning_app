import 'package:bloc/bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_app/bloc/font/font_event.dart';
import 'package:learning_app/bloc/font/font_state.dart';
import 'package:learning_app/services/font_service.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final GetStorage _storage = GetStorage();

  FontBloc()
    : super(
        FontState(
          fontScale: FontService.currentFontScale,
          fontFamily: FontService.currentFontFamily,
        ),
      ) {
    on<UpdateFontScale>(_onUpdateFontScale);
    on<UpdateFontFamily>(_onUpdateFontFamily);
  }

  void _onUpdateFontScale(
    UpdateFontScale event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontScale(event.fontScale);
    emit(state.copyWith(fontScale: event.fontScale));
  }

  void _onUpdateFontFamily(
    UpdateFontFamily event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontFamily(event.fontFamily);
    emit(state.copyWith(fontFamily: event.fontFamily));
  }
}
