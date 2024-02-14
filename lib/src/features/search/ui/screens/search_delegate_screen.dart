import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/domain/entities/get_commits_response_entity.dart';
import '../../../home/ui/providers/home_provider.dart';
import '../../../home/ui/screens/widgets/grid_list_commits.dart';

class MySearchDelegateScreen extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(onPressed: () => close(context, ''));
  }

  @override
  Widget buildResults(BuildContext context) {
    final items = context.read<HomeProvider>().commits;
    final searchResults = items
        .where((item) =>
            item.commit.message.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GridListCommits(commits: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final items = context.read<HomeProvider>().commits;
    final suggestionList = query.isEmpty
        ? <GetCommitsResponse>[]
        : items
            .where((item) => item.commit.message
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();
    return GridListCommits(commits: suggestionList);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    );
  }
}
