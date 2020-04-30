import 'package:flutter/material.dart';
import 'package:professors/builders/dialog.builder.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/screens/authenticated/settings/profile/settings_edit_profile_select_language.screen.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/styles/sizes.dart';
import 'package:professors/widgets/avatar/professor_avatar.widget.dart';
import 'package:professors/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ProfileScreen extends StatelessWidget {

  ClassConstants screenConstants = ClassConstants();

  bool showEditButton;
  bool showShareButton;

  ProfileScreen(this.showEditButton, this.showShareButton);

  @override
  Widget build(BuildContext context) {

    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                ( showEditButton ) ?
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileSelectLanguageScreen()),
                      );
                    },
                      child: Icon(Icons.edit, color: AppColors.bgGreyColor, size: AppSizes.iconRegular(context),),),
                ) : Text(''),
                ( showShareButton ) ?
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                  child: GestureDetector(
                    onTap: () {
                      DialogsBuilder(context).unavailableOperation();
                    },
                    child: Icon(Icons.share, color: AppColors.bgGreyColor, size: AppSizes.iconRegular(context)),
                  ),
                ) : Text(''),
              ],
              floating: false,
              pinned: false,
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

                          ProfessorAvatarWidget(
                            'João Rodrigues',
                            'https://i.ya-webdesign.com/images/circle-avatar-png.png'
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          /// ABOUT
                          Container(
                            padding: AppPaddings.regularPadding(context),
                            margin: EdgeInsets.only(top: sectionTopMargin / 4),
                            child: TextsBuilder.h3Bold('About'.toUpperCase(), color: AppColors.textDarkRegularColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: sectionTopMargin / 2),
                            padding: AppPaddings.regularPadding(context),
                            child: TextsBuilder.regularText('fsdfsd fsd fdsf dsfs df sdf dsf ds fsd f dsf  fdsfsd f dsfs df dsd'
                                ' fsd ffdsfdsfdf fsdf sdfsdfdsfsd fsdfsdfdf sdfdffdsfsdfs fsdfdsfdsf fsd'
                                'fsd fdsfsdfsdfsd fsd fs dfdsdfsdf fds dfsdf sdfsdfsdf sfds fds', color: AppColors.textDarkRegularColor),
                          ),

                          /// QUOTE
                          Container(
                            padding: AppPaddings.regularPadding(context),
                            margin: EdgeInsets.only(top: sectionTopMargin),
                            child: TextsBuilder.h3Bold('Quote'.toUpperCase(), color: AppColors.textDarkRegularColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: sectionTopMargin / 2),
                            padding: AppPaddings.regularPadding(context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.format_quote, color: AppColors.textDarkRegularColor,),
                                ),

                                Expanded(
                                  flex: 10,
                                  child: TextsBuilder.regularText('fsdfsd fsd fdsf dsfs df sdf dsf ds fsd f dsf  fdsfsd f dsfs df dsd'
                                      ' fsd ffdsfdsfdf fsdf sdfsdfdsfsd fsdfsdfdf sdfdffdsfsdfs fsdfdsfdsf fsd'
                                      'fsd fdsfsdfsdfsd fsd fs dfdsdfsdf fds dfsdf sdfsdfsdf sfds fds', color: AppColors.textDarkRegularColor),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.format_quote, color: AppColors.textDarkRegularColor,),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// TEACHES
                  SliverToBoxAdapter(
                    child: Container(
                        padding: AppPaddings.regularPadding(context),
                        color: AppColors.bgGreyColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            /// TITLE
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin),
                              child: TextsBuilder.h2Bold('Teaches', color: AppColors.bgMainColor),
                            ),

                            /// CLASSES CATEGORY LIST
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin / 2, bottom: sectionTopMargin),
                              height: 50,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  
                                  Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: TextsBuilder.h4Bold('HIIT', color: AppColors.bgMainColor),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: TextsBuilder.h4Bold('YOGA', color: AppColors.bgMainColor),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: TextsBuilder.h4Bold('ZUMBA', color: AppColors.bgMainColor),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),

                  /// COMMENTS
                  SliverToBoxAdapter(
                    child: Container(
                        padding: AppPaddings.regularPadding(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            /// TITLE COMMENTS
                            Container(
                              margin: EdgeInsets.only(top: sectionTopMargin),
                              child: TextsBuilder.h1Bold('Comments'),
                            ),

                            /// COMMENTS LIST
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50, top: MediaQuery.of(context).size.height / 50),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.dividerMainColor,
                                              width: 2.0
                                          )
                                      )
                                  ),
                                  child: NotificationDetailsUserDetailsWidget(
                                    1,
                                    'Rebeka',
                                    'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1498884203000/photosp/5ca84b21-4bd5-4484-a125-4f22db2ddd70/stock-photo-portrait-light-women-competition-face-natural-person-woman-strong-5ca84b21-4bd5-4484-a125-4f22db2ddd70.jpg',
                                    'tfd gdf gfgf gfdg df gfd g fdg dfg fdg df gdf g dfg df gdf gfd gfd ',
                                    date: DateTime.now(),
                                    score: 5
                                  ),
                                );
                              },
                            ),

                          ],
                        )
                    ),
                  ),

                  /// LOAD MORE COMMENTS BUTTON
                  SliverToBoxAdapter(
                    child: Container(
                      color: AppColors.bgMainColor,
                      child: Center(
                        child: ButtonsBuilder.createFlatButton('Load more', () { }, Colors.transparent, AppColors.linksColor),
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
