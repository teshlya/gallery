
import 'package:gallery_app/domain/state/home/home_state.dart';
import 'package:gallery_app/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dayRepository(),
    );
  }
}
