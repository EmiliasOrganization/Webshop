import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key, required this.itemScrollController}) : super(key: key);

  final ItemScrollController itemScrollController;

  @override
  State<StatefulWidget> createState() => _LandingScreenState();

  }

class _LandingScreenState extends State<LandingScreen>{


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.05;
    const maxFontSizeHeadline = 30.0;
    const maxFontSizeText = 20.0;
    final ItemScrollController itemScrollController;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth > 800) {
            return buildBigScreenLayout(theme, fontSize, maxFontSizeHeadline, maxFontSizeText, widget.itemScrollController);
          }
          else {
            return buildSmallScreenLayout(theme, fontSize, maxFontSizeHeadline, maxFontSizeText, widget.itemScrollController);
          }
        }
    );
    //  return NormalSizePage(theme: theme);
  }


}

  Widget buildSmallScreenLayout(final theme, final fontSize, final maxFontSizeHeadline, final maxFontSizeText, final ItemScrollController itemScrollController) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/StartScreen.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              'Oma\'s Webshop',
              style: TextStyle(
                fontSize: fontSize.clamp(0, maxFontSizeHeadline) * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Dieser Text befindet sich in arbeit: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore',
              style: TextStyle(
                fontSize: fontSize.clamp(0, maxFontSizeText) * 0.8,
              ),
            ),
        ElevatedButton(
          child: (Text('Zum Laden')),
          onPressed: () {
            itemScrollController.scrollTo(
                index: 1, duration: Duration(seconds: 1), curve: Curves.easeInOut);

          },
        ),
          ],
        ),
      ),
    );
  }

  Widget buildBigScreenLayout(final theme, final fontSize, final maxFontSizeHeadline, final maxFontSizeText, final ItemScrollController itemScrollController) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              '../assets/StartScreen.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Oma\'s Webshop',
                      style: TextStyle(
                        fontSize: fontSize.clamp(0, maxFontSizeHeadline),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Dieser Text befindet sich in arbeit: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore',
                    style: TextStyle(
                      fontSize: fontSize.clamp(0, maxFontSizeText),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: (Text('Zum Laden')),
                      onPressed: () {
                        itemScrollController.scrollTo(
                            index: 1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




