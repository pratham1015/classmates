import 'package:flutter/material.dart';

const TextStyle roboto18regular = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18,
);
TextStyle roboto18bold = roboto18regular.copyWith(
  fontWeight: FontWeight.w700,
);
TextStyle roboto18white = roboto18bold.copyWith(
  color: Colors.white,
);
TextStyle roboto20bold = roboto18bold.copyWith(
  fontSize: 20,
);
TextStyle roboto20white = roboto18white.copyWith(
  fontSize: 20,
);
TextStyle roboto36bold = roboto18bold.copyWith(
  fontSize: 36,
);
TextStyle roboto36white = roboto36bold.copyWith(
  color: Colors.white,
);

BorderRadius borderRadius10 = BorderRadius.circular(10.0);
