import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/feed/card/feed_card.dart';
import '../../repos/feed/feed_card_repo.dart';
part 'feed_cards_provider.g.dart';

@riverpod
List<FeedCard> filteredFeedCards(FilteredFeedCardsRef ref, cards, kind) {
  final s = ref.watch(feedCardsRepoProvider);
  late final List<FeedCard> filteredList;
  filteredList = cards.where((i) => i.king == kind).toList();
  return filteredList;
}