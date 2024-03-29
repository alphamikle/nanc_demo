import 'package:config/config.dart';
import 'package:nanc/model.dart';

class MockModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {}

  @override
  Future<void> deleteModel(Model model) async {}
}
