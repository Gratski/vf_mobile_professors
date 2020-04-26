import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ClassesScreen extends StatelessWidget {
  ClassConstants screenConstants = ClassConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              expandedHeight: MediaQuery.of(context).size.height / 2,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://thumbs.dreamstime.com/b/instrutor-yoga-class-no-gym-76292160.jpg",
                  fit: BoxFit.cover,
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
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                      padding: PaddingsBuilder.regularPadding(context),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextsBuilder.regularText('Mind, Yoga'.toUpperCase(), color: Colors.white),
                                TextsBuilder.h2Bold('Yoga Relax', color: Colors.white),
                              ],
                            ),
                          ),

                          /// SHARE BUTTON
                          Expanded(
                            flex: 4,
                            child: Icon(Icons.share, color: Colors.white, size: MediaQuery.of(context).size.width * 0.08,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: PaddingsBuilder.regularPadding(context),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          TextsBuilder.textSmallBold('CLASS DESCRIPTION'.toUpperCase(), color: Colors.white),
                          TextsBuilder.regularText('gfgfd gdf gfd gfdgdf gdf gfdgdfg fdg fdg '
                              'fdgfdg fdg fd gfd g dfg fd gdf gdf g dfg fd gfd gfd g df gdf gfd g '
                              'df gfd g fdg fdg fd gf dg fdfdsfdsfdsf fdsfds fsdfds fdsfssdf '
                              'dsfsdfsdf fdfdfd fdf d fdfdsfd', color: Colors.white),


                        ],
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
                    child: ButtonsBuilder.redFlatButton('Book'.toUpperCase(), () { }),
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
