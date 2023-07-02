import 'package:flutter/material.dart';
import 'package:flutterfrontend/constats.dart';
import 'package:flutterfrontend/globalwidget/popups/login_popup.dart';
import 'package:flutterfrontend/globalwidget/popups/registration_popup.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  IconButton(
          icon: Icon(Icons.person),
          color: schemeColorGreen,
          onPressed: () {
            showLoginRegistrationMenu(context);
          },
    );
  }

  void showLoginRegistrationMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(0, 50), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items:
        [
          PopupMenuItem(value: 'signIn', child: Text('Anmelden')),
          PopupMenuItem(value: 'register', child: Text('Registrieren'))
        ]
    ).then((value) =>
              {
                choiceAction(value!, context)
              }
          );
  }

  void choiceAction(String choice, BuildContext context) {
    if (choice == "signIn") {
      loginDialog(context);
    }
    if (choice == "register") {
      registrationDialog(context);
    }
  }
}