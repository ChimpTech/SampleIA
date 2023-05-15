import 'package:flutter/cupertino.dart';

enum TabType { home, explore, accounts, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.home:
        return const Icon(CupertinoIcons.home, size: 25);
      case TabType.explore:
        return const Icon(CupertinoIcons.search, size: 25);
      case TabType.accounts:
        return const Icon(CupertinoIcons.heart, size: 25);
      case TabType.profile:
        return const Icon(CupertinoIcons.person, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.home:
        return "Home";
      case TabType.explore:
        return "Explore";
      case TabType.accounts:
        return "Accounts";
      case TabType.profile:
        return "Profile";
    }
  }
}
