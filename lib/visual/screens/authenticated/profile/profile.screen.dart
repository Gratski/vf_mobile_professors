import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/profile_screen.constants.dart';
import 'package:professors/store/professor_profile_state.dart';
import 'package:professors/visual/builders/dialog.builder.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/avatar/professor_avatar.widget.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ProfileScreen extends StatefulWidget {
  GeneralConstants generalConstants = GeneralConstants();
  ProfileScreenConstants screenConstants = ProfileScreenConstants();
  ProfessorProfileState store = ProfessorProfileState();

  int languageId;
  String languageCode;
  int professorId;
  bool hideLanguageChange;

  ProfileScreen(this.languageId, this.languageCode, this.professorId, {this.hideLanguageChange = false});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AfterInitMixin<ProfileScreen> {
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
                  color: AppColors.bgMainColor,
                ),
              ),
              floating: false,
              pinned: false,
              actions: [
                Observer(
                  builder: (_) {
                    if (!widget.hideLanguageChange) {
                      return ButtonsBuilder.transparentCustomButton(
                          TextsBuilder.h4Bold(
                              widget.store.languageCode.toUpperCase()), () {
                        DialogsBuilder(context).selectLanguageDialog(
                            AppLocalizations.of(context).translate(
                                widget.generalConstants.languagesLabel),
                            generalStore.existingLanguages,
                            widget.languageId, (selected) {
                          widget.languageId = selected.id;
                          widget.languageCode = selected.code;
                          widget.store.setLanguageCode(selected.code);
                          didInitState();
                        });
                      });
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            ////////////////////////////////////////////////
            // Loader
            ////////////////////////////////////////////////
            Observer(
              builder: (_) {
                if (widget.store.isLoading) {
                  return DefaultLoaderWidget();
                } else {
                  return Container();
                }
              },
            ),

            ////////////////////////////////////////////////
            // Screen Details
            ////////////////////////////////////////////////
            Observer(
              builder: (_) {
                if (widget.store.isLoading) {
                  return Container();
                } else {
                  return Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        /// INSTRUCTOR
                        SliverToBoxAdapter(
                          child: Container(
                            padding: AppPaddings.regularPadding(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Observer(
                                  builder: (_) {
                                    return ProfessorAvatarWidget(
                                        '${widget.store.firstName} ${widget.store.lastName}',
                                        widget.store.pictureUrl);
                                  },
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
                                  margin: EdgeInsets.only(
                                      top: sectionTopMargin / 4),
                                  child: TextsBuilder.textSmallBold(
                                      AppLocalizations.of(context)
                                          .translate(widget.screenConstants
                                              .aboutLabel(widget.languageCode))
                                          .toUpperCase(),
                                      color: AppColors.bgMainColor),
                                ),

                                Observer(
                                  builder: (_) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: sectionTopMargin / 2),
                                      padding:
                                          AppPaddings.regularPadding(context),
                                      child: TextsBuilder.regularText(
                                          '${widget.store.about}',
                                          color:
                                              AppColors.fontColor),
                                    );
                                  },
                                ),

                                /// QUOTE
                                Container(
                                  padding: AppPaddings.regularPadding(context),
                                  margin:
                                      EdgeInsets.only(top: sectionTopMargin),
                                  child: TextsBuilder.textSmallBold(
                                      AppLocalizations.of(context)
                                          .translate(widget.screenConstants
                                              .quoteLabel(widget.languageCode))
                                          .toUpperCase(),
                                      color: AppColors.fontColor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: sectionTopMargin / 2),
                                  padding: AppPaddings.regularPadding(context),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.format_quote,
                                          color: AppColors.fontColor,
                                        ),
                                      ),
                                      Observer(builder: (_) {
                                        return Expanded(
                                          flex: 10,
                                          child: TextsBuilder.regularText(
                                              '${widget.store.quote}',
                                              color: AppColors.fontColor),
                                        );
                                      }),
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.format_quote,
                                          color: AppColors.bgMainColor,
                                        ),
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
                                    margin:
                                        EdgeInsets.only(top: sectionTopMargin),
                                    child: TextsBuilder.h2Bold(
                                        AppLocalizations.of(context).translate(
                                            widget.screenConstants.teachesLabel(
                                                widget.languageCode)),
                                        color: AppColors.bgMainColor),
                                  ),

                                  /// CLASSES CATEGORY LIST
                                  Observer(
                                    builder: (_) {
                                      return Container(
                                          margin: EdgeInsets.only(
                                              top: sectionTopMargin / 2,
                                              bottom: sectionTopMargin),
                                          height: 50,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                widget.store.teaches.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                padding: EdgeInsets.all(10),
                                                child: TextsBuilder.h4Bold(
                                                    '${widget.store.teaches[index].designation}',
                                                    color:
                                                        AppColors.bgMainColor),
                                              );
                                            },
                                          ));
                                    },
                                  ),
                                ],
                              )),
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
                                  margin:
                                      EdgeInsets.only(top: sectionTopMargin),
                                  child: TextsBuilder.h1Bold(
                                      AppLocalizations.of(context).translate(
                                          widget.screenConstants.commentsLabel(
                                              widget.languageCode))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: sectionTopMargin,
                                      bottom: sectionTopMargin),
                                  child: Center(
                                    child: TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            widget.screenConstants
                                                .noCommentsLabel(
                                                    widget.languageCode))),
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
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didInitState() {
    widget.store.setLanguageCode(widget.languageCode);
    widget.store.setIsLoading(true);
    restServices
        .getProfileDetailsService()
        .getProfileDetails(context, widget.professorId, widget.languageId)
        .then((resp) {
      widget.store.setId(resp.id);
      widget.store.setPictureUrl(resp.pictureUrl);
      widget.store.setFirstName(resp.firstName);
      widget.store.setLastName(resp.lastName);
      widget.store.setAbout(resp.about);
      widget.store.setQuote(resp.quote);
      widget.store.setTeaches(resp.teaches);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => widget.store.setIsLoading(false));
  }
}
