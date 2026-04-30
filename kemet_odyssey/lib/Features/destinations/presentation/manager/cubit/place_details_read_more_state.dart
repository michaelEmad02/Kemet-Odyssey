class PlaceDetailsReadMoreState {
  final bool isDescriptionExpanded;
  final bool isHistoryExpanded;

  const PlaceDetailsReadMoreState({
    this.isDescriptionExpanded = false,
    this.isHistoryExpanded = false,
  });

  PlaceDetailsReadMoreState copyWith({
    bool? isDescriptionExpanded,
    bool? isHistoryExpanded,
  }) {
    return PlaceDetailsReadMoreState(
      isDescriptionExpanded:
          isDescriptionExpanded ?? this.isDescriptionExpanded,
      isHistoryExpanded: isHistoryExpanded ?? this.isHistoryExpanded,
    );
  }
}
