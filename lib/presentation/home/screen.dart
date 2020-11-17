import 'package:dev_chulwoo/presentation/route/model.dart';
import 'package:dev_chulwoo/presentation/widget/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources.dart';
import '../extensions.dart';

class HomeRoute extends AppRoute {
  const HomeRoute();

  @override
  String get location => '/';

  @override
  Widget get child => HomeScreen();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🚧',
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
            // ProfileImage(),
            SizedBox(height: 32.0),
            Wrap(
              spacing: 12.0,
              children: [
                BrandIcon(
                  FontAwesomeIcons.github,
                  tooltip: 'github',
                  onPressed: () {
                    // TODO: manage resource
                    launch('https://github.com/chulwoo-park');
                  },
                ),
                BrandIcon(
                  FontAwesomeIcons.linkedinIn,
                  tooltip: 'linkedIn',
                  onPressed: () {
                    // TODO: manage resource
                    launch('https://www.linkedin.com/in/chulwoo-park');
                  },
                ),
                Builder(
                  builder: (context) => BrandIcon(
                    FontAwesomeIcons.envelope,
                    tooltip: 'email',
                    onPressed: () async {
                      // TODO: manage resource
                      final email = 'contact@chulwoo.dev';
                      final mailTo = Uri(
                        scheme: 'mailto',
                        path: email,
                      );
                      if (await canLaunch(mailTo.toString())) {
                        await launch(mailTo.toString());
                      } else {
                        // TODO: dialog, refactoring
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSimpleSnackBar(
                          '(TODO) 메일 앱을 열 수 없습니다.\n$email로 연락 바랍니다.',
                          actionLabel: '복사하기',
                          onActionPressed: () {
                            Clipboard.setData(ClipboardData(text: email)).then((_) {
                              Scaffold.of(context).showSimpleSnackBar('$email 복사 완료');
                            });
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(color: Colors.black.withOpacity(0.005)),
        image: DecorationImage(
          image: AssetImage(
            R.images.img_chulwoo,
          ),
        ),
      ),
    );
  }
}
