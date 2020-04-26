import 'package:flutter/material.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/avatar/professor_avatar.widget.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class EditProfileInLanguageScreen extends StatelessWidget {
  final String languageCode;
  final bool isAdding; /// true when the user is adding a new language to his/her profile

  EditProfileInLanguageScreen(this.languageCode, this.isAdding);

  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(
              [
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20),
                  child: ButtonsBuilder.whiteFlatButton('SAVE', () { })
                ),
              ],
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  /// INSTRUCTOR
                  SliverToBoxAdapter(
                    child: Container(
                      padding: AppPaddings.regularPadding(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ProfessorAvatarWidget('João Rodrigues',
                              'https://i.ya-webdesign.com/images/circle-avatar-png.png', textColor: Colors.black,),
                        ],
                      ),
                    ),
                  ),

                  /// DETAILS
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(bottom: sectionTopMargin),
                      margin: EdgeInsets.only(
                        top: sectionTopMargin,
                      ),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /// ABOUT
                            Container(
                              padding: AppPaddings.regularPadding(context),
                              margin: EdgeInsets.only(top: sectionTopMargin / 4),
                              child: TextsBuilder.h3Bold('About'.toUpperCase(),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin / 2),
                              padding: AppPaddings.regularPadding(context),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.grey[300]
                                      )
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                maxLength: 255,
                              ),
                            ),

                            /// QUOTE
                            Container(
                              padding: AppPaddings.regularPadding(context),
                              margin: EdgeInsets.only(top: sectionTopMargin),
                              child: TextsBuilder.h3Bold('Quote'.toUpperCase(),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin / 2),
                              padding: AppPaddings.regularPadding(context),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.grey[300]
                                      )
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                maxLength: 255,
                              ),
                            ),

                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
