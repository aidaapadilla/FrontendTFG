import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class StorageTFG extends ChangeNotifier {
  final LocalStorage storage = LocalStorage();

  void addItemsToLocalStorage(String token, String id, String password) {
    storage.setItem('token', token);
    storage.setItem('id', id);
    storage.setItem('password', password);
  }
}
