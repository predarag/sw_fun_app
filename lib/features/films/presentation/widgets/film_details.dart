import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/features/films/data/models/film_model.dart';
import 'package:sw_fun_app/core/widgets/info_row.dart';

class FilmDetail extends StatelessWidget {
  final FilmModel filmModel;
  const FilmDetail({required this.filmModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            filmModel.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10.h,
          ),
          InfoRow(
            name: 'episode id',
            value: filmModel.episodeId.toString(),
          ),
          InfoRow(
            name: 'directors',
            value: filmModel.director ?? 'n/a',
          ),
          InfoRow(
            name: 'producers',
            value: filmModel.producer ?? 'n/a',
          ),
          InfoRow(
            name: 'release date',
            value: filmModel.releaseDate ?? 'n/a',
          ),
          SizedBox(
            height: 5.h,
          ),
          const Divider(),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              'Opening crawl',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: Text(filmModel.openingCrawl ?? 'n/a',
                  style: Theme.of(context).textTheme.headline2))
        ],
      ),
    );
  }
}
