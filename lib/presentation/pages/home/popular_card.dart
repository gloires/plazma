import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularCard extends StatelessWidget {
  MovieEntity movie;

  PopularCard({Key? key, required this.movie}) : super(key: key);

  //TODO: size for padding | genres

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        color: const Color(0x00000000),
        child: Row(
          children: [
            DropShadowImage(
              borderRadius: 7,
              blurRadius: 5,
              offset: const Offset(0, 0),
              scale: 1,
              image: Image.network(
                "https://image.tmdb.org/t/p/w300//${movie.posterPath}",
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: FixedColumnWidth(30),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Text(
                              movie.title,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 17.0.sp),
                              overflow: TextOverflow.clip,
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(PhosphorIcons.bookmarkSimple),
                              onPressed: () {}, //TODO
                            ),
                          ],
                        ),
                      ]),

                  const SizedBox(height: 20),
                  Expanded(
                      child: Text(movie.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Kyiv*Type',
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15.0.sp))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
