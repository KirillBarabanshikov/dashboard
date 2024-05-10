enum Routes {
  main(path: '/'),
  resetPassword(path: '/reset-password'),
  indicators(path: '/indicators'),
  storeRating(path: '/store-rating'),
  tasks(path: '/tasks'),
  messages(path: '/messages'),
  ;

  const Routes({
    required this.path,
  });

  final String path;
}
