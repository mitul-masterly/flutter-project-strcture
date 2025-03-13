import 'package:flutter_bloc/flutter_bloc.dart';

class TabNavigationCubit extends Cubit<int> {
  TabNavigationCubit() : super(0); // Default index (Home)

  void updateTab(final int index) => emit(index);
}
