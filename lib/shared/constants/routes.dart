enum Routes {
  main(path: '/'),
  resetPassword(path: '/reset-password'),
  indicators(path: '/indicators'),
  storeRating(path: '/store-rating'),
  ;

  const Routes({
    required this.path,
  });

  final String path;
}
