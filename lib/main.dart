import 'package:dart_week/app/core/config/env/env.dart';
import 'package:dart_week/app/fwc_album_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await Env.i.load();
  runApp(FwcAlbumApp());
}