import 'package:flutter/material.dart';
import 'package:professors/builders/dialog.builder.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/styles/sizes.dart';
import 'package:professors/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/dividers/dividers_builder.dart';
import 'package:professors/widgets/structural/icons/icons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ClassesDetailsScreen extends StatelessWidget {

  ClassConstants screenConstants = ClassConstants();

  @override
  Widget build(BuildContext context) {

    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      backgroundColor: Colors.black,
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
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                  child: Icon(Icons.edit, color: Colors.white, size: AppSizes.iconRegular(context)),
                ),
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                  child: GestureDetector(
                    onTap: () {
                      DialogsBuilder(context).unavailableOperation();
                    },
                    child: Icon(Icons.share, color: Colors.white, size: AppSizes.iconRegular(context)),
                  ),
                )
              ],
              expandedHeight: MediaQuery.of(context).size.height / 2,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent])),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading.gif',
                    image: 'https://thumbs.dreamstime.com/b/instrutor-yoga-class-no-gym-76292160.jpg',
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[

            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[

                  /// HEADER
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: sectionTopMargin),
                      padding: AppPaddings.regularPadding(context),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextsBuilder.regularText('Mind, Yoga'.toUpperCase(), color: Colors.white),
                                TextsBuilder.h2Bold('Yoga Relax', color: Colors.white),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextsBuilder.h4Bold('4.6', color: Colors.white),
                                Icon(Icons.star, color: AppColors.regularRed,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// DIFFICULTY
                  SliverToBoxAdapter(
                    child: Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(top: sectionTopMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(screenConstants.classDetailsLevelLabel).toUpperCase(), color: Colors.white),
                          TextsBuilder.regularText('Warrior Level', color: Colors.white),


                        ],
                      ),
                    ),
                  ),

                  /// DESCRIPTION
                  SliverToBoxAdapter(
                    child: Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(top: sectionTopMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(screenConstants.classDetailsDescriptionLabel).toUpperCase(), color: Colors.white),
                          TextsBuilder.regularText('gfgfd gdf gfd gfdgdf gdf gfdgdfg fdg fdg '
                              'fdgfdg fdg fd gfd g dfg fd gdf gdf g dfg fd gfd gfd g df gdf gfd g '
                              'df gfd g fdg fdg fd gf dg fdfdsfdsfdsf fdsfds fsdfds fdsfssdf '
                              'dsfsdfsdf fdfdfd fdf d fdfdsfd', color: Colors.white),


                        ],
                      ),
                    ),
                  ),

                  /// INSTRUCTOR
                  SliverToBoxAdapter(
                    child: Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(top: sectionTopMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          DividersBuilder.dividerWithCenteredText(null),

                          Container(
                            margin: EdgeInsets.only(bottom: 20, top: 40),
                            child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.classDetailsInstructorLabel).toUpperCase(), color: Colors.white),
                          ),

                          CircleAvatar(
                              maxRadius: MediaQuery.of(context).size.width * 0.20,
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(
                                'https://i.ya-webdesign.com/images/circle-avatar-png.png',
                              )
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextsBuilder.h4Bold('João Rodrigues', color: Colors.white),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: IconsBuilder.startListBasedOnScore(3.5),
                          )

                        ],
                      ),
                    ),
                  ),

                  /// CLASS DETAILS
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(bottom: sectionTopMargin),
                      margin: EdgeInsets.only(
                        top: sectionTopMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          /// EQUIPMENT
                          Container(
                            padding: AppPaddings.regularPadding(context),
                            margin: EdgeInsets.only(top: 20),
                            child: TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(screenConstants.classDetailsEquipmentLabel).toUpperCase()),
                          ),

                          Container(
                            padding: AppPaddings.regularPadding(context),
                            child: TextsBuilder.regularText('fsdfsd fsd fdsf dsfs df sdf dsf ds fsd f dsf  fdsfsd f dsfs df dsd'
                                ' fsd ffdsfdsfdf fsdf sdfsdfdsfsd fsdfsdfdf sdfdffdsfsdfs fsdfdsfdsf fsd'
                                'fsd fdsfsdfsdfsd fsd fs dfdsdfsdf fds dfsdf sdfsdfsdf sfds fds'),
                          ),

                          /// CLASS GOALS
                          Container(
                            padding: AppPaddings.regularPadding(context),
                            margin: EdgeInsets.only(top: sectionTopMargin),
                            child: TextsBuilder.textSmallBold('Class Objectives'.toUpperCase()),
                          ),

                          Container(
                            padding: AppPaddings.regularPadding(context),
                            child: TextsBuilder.regularText('fsdfsd fsd fdsf dsfs df sdf dsf ds fsd f dsf  fdsfsd f dsfs df dsd'
                                ' fsd ffdsfdsfdf fsdf sdfsdfdsfsd fsdfsdfdf sdfdffdsfsdfs fsdfdsfdsf fsd'
                                'fsd fdsfsdfsdfsd fsd fs dfdsdfsdf fds dfsdf sdfsdfsdf sfds fds'),
                          ),

                        ],
                      ),
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
                              child: TextsBuilder.h1Bold(AppLocalizations.of(context).translate(screenConstants.classDetailsCommentsLabel)),
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
                      color: Colors.white,
                      child: Center(
                        child: ButtonsBuilder.createFlatButton(AppLocalizations.of(context).translate(screenConstants.classDetailsLoadCommentsLabel), () { }, Colors.transparent, Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width / 20,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.regularText('Yoga Relax'.toUpperCase()),
                        TextsBuilder.textSmall('17th April'),
                        TextsBuilder.textSmall('13:30 - 14:00'),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 4,
                    child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.classDetailsBookButtonLabel).toUpperCase(), () { }),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
