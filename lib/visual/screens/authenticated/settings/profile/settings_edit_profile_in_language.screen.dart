import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/screens/authenticated/profile/profile.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/avatar/professor_avatar.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class EditProfileInLanguageScreen extends StatefulWidget {

  GeneralConstants generalConstants = GeneralConstants();

  int languageId;
  EditProfileInLanguageScreen(this.languageId);

  @override
  _EditProfileInLanguageScreenState createState() => _EditProfileInLanguageScreenState();
}

class _EditProfileInLanguageScreenState extends State<EditProfileInLanguageScreen> with AfterInitMixin<EditProfileInLanguageScreen> {

  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(
              [
                Observer(
                  builder: (_) {

                    if ( profileDetailsStore.id != null ) {
                      return Container(
                          margin: EdgeInsets.only(),
                          child: ButtonsBuilder.transparentButton(
                          AppLocalizations.of(context).translate(widget.generalConstants.buttonSaveLabel).toUpperCase(), () {
                            if (_isCreatingProfile()) {

                              restServices.getProfileDetailsService().createProfileDetails(
                                  context, widget.languageId,
                                  designationController.text,
                                  descriptionController.text,
                                  quoteController.text).then((_){
                                restServices.getProfileDetailsService().getProfileDetailsByLanguageId(
                                    context, widget.languageId);
                              });

                            } else {

                              restServices.getProfileDetailsService().updateProfileDetails(context,
                                  profileDetailsStore.id, designationController.text,
                                  descriptionController.text, quoteController.text)
                                  .then((_) {
                                restServices.getLanguageProfileService().getAvailableProfileLanguages(context);
                                restServices.getLanguageProfileService().getExistingProfileLanguages(context);
                                restServices.getProfileDetailsService().getProfileDetailsByLanguageId(
                                    context, widget.languageId).then((_) {
                                  _updateState();
                                });
                              });

                            }
                          })
                      );
                    } else {
                      return Text('');
                    }
                  },
                )
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
                                controller: descriptionController,
                                style: TextStyle(color: AppColors.fontColor),
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
                              margin: EdgeInsets.only(top: sectionTopMargin / 2, bottom: sectionTopMargin * 2),
                              padding: AppPaddings.regularWithBottomPadding(context),
                              child: TextFormField(
                                controller: quoteController,
                                style: TextStyle(color: AppColors.fontColor),
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

                            /*
                            Container(
                                alignment: Alignment.center,
                                padding: AppPaddings.regularPadding(context),
                                margin: EdgeInsets.only(top: sectionTopMargin / 4),
                                child: ButtonsBuilder.redFlatButton('Save', () {


                                },),
                            ),

                             */
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

  @override
  void didInitState() {
    if ( profileDetailsStore.id != null ) {
      restServices.getProfileDetailsService().getProfileDetailsByLanguageId(context, profileDetailsStore.id)
          .then((_) {
             setState(() {
               _updateState();
             });
      });
    } else {
      profileDetailsStore.setIsLoading(false);
    }
  }

  _updateState() {
    designationController.text = profileDetailsStore.designation;
    descriptionController.text = profileDetailsStore.description;
    quoteController.text = profileDetailsStore.quote;
  }

  _isCreatingProfile() {
    return profileDetailsStore.id == null;
  }
}
