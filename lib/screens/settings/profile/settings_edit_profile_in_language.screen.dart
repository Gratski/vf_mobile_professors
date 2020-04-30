import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/screens/profile/profile.screen.dart';
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
                  margin: EdgeInsets.only(),
                  child: ( !isAdding ) ? ButtonsBuilder.transparentButton('View Profile', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(false, false)),
                    );
                  }) : Text('')
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
                  /// Avatar
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
                      padding: AppPaddings.regularPadding(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return ProfessorAvatarWidget('${userStore.firstName} ${userStore.lastName}',
                                userStore.pictureUrl, textColor: AppColors.fontColor,);
                            }
                          ),
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
                              child: TextsBuilder.h4Bold('About',),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin / 2),
                              padding: AppPaddings.regularPadding(context),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: AppColors.bgInputColor,
                                  filled: true,
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
                              margin: EdgeInsets.only(top: sectionTopMargin / 4),
                              child: TextsBuilder.h4Bold('Quote',),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin / 2),
                              padding: AppPaddings.regularPadding(context),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: AppColors.bgInputColor,
                                  filled: true,
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

                            Container(
                              alignment: Alignment.center,
                              padding: AppPaddings.regularPadding(context),
                              margin: EdgeInsets.only(top: sectionTopMargin / 4),
                              child: ButtonsBuilder.redFlatButton('Save', () { })
                            ),
                          ],
                        ),
                      ),
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
