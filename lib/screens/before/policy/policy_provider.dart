import 'package:flutter/cupertino.dart';

import '../../../utils/data/term_condition_data.dart';
import '/models/model/models.dart';
import '/screens/base/base_view_model.dart';
import '../../../resources/routes_manager.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
const List<KeyPair<String>> _termConditions = [
   KeyPair<String>(
      key: 'Intellectual Property',
      value:
          '''An Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.'''),
  KeyPair<String>(
      key: 'Termination',
      value:
          '''A Termination clause will inform users that any accounts on your website and mobile app, or users' access to your website and app, can be terminated in case of abuses or at your sole discretion'''),
  KeyPair<String>(
      key: 'Governing Law',
      value:
          'A Governing Law clause will inform users which laws govern the agreement. These laws should come from the country in which your company is headquartered or the country from which you operate your website and mobile app.'),
  KeyPair<String>(
      key: 'Links to Other Websites',
      value:
          'A Links to Other Websites clause will inform users that you are not responsible for any third party websites that you link to. This kind of clause will generally inform users that they are responsible for reading and agreeing (or disagreeing) with the Terms and Conditions or Privacy Policies of these third parties.'),
  KeyPair<String>(
      key: 'Limit What Users Can Do',
      value:
          '''A Limit What Users Can Do clause can inform users that by agreeing to use your service, they're also agreeing to not do certain things. This can be part of a very long and thorough list in your Terms and Conditions agreement so as to encompass the most amount of negative uses.'''),
  KeyPair<String>(
      key: 'DMCA notice clause',
      value:
          '''If your website or mobile app allows users to create content and make that content public to other users, a Content clause will inform users that they own the rights to the content they have created. This clause usually mentions that users must give you (the website or mobile app developer/owner) a license so that you can share this content on your website/mobile app and to make it available to other users.
Because the content created by users is public to other users, a DMCA notice clause (or Copyright Infringement ) section is helpful to inform users and copyright authors that, if any content is found to be a copyright infringement, you will respond to any DMCA takedown notices received and you will take down the content.
'''),
];

class PolicyProvider extends BaseViewModel {

  PolicyProvider(super.context, this._isFirst);
  final dom.Document _document = htmlparser.parse(termConditionData);


  dom.Document get document => _document;


  final List<KeyPair<String>> termConditions = _termConditions;
  final bool _isFirst;
  bool _termCondition = false;

  bool get termCondition => _termCondition;

  void proceed() {
    Navigator.of(context).pushReplacementNamed(Routes.deviceRegistrationScreen);
    if (_isFirst) {
    } else {
      Navigator.of(context).pop();
    }
  }



  set termCondition(bool value) {
    _termCondition = value;
    notifyListeners();
  }

  bool get isFirst => _isFirst;
}
