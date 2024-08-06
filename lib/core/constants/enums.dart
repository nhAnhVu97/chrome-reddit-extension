enum LoadState {
  initial,
  loading,
  loadingMore,
  success,
  silent,
  error;

  const LoadState();

  bool get isInitial => this == LoadState.initial;
  bool get isLoading => this == LoadState.loading;
  bool get isLoadingMore => this == LoadState.loadingMore;
  bool get isSuccess => this == LoadState.success;
  bool get isError => this == LoadState.error;
}
