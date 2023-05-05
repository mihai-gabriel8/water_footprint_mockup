import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: double.infinity,
      child: CupertinoTextField(
        keyboardType: TextInputType.text,
        placeholder: 'Search for a initiative',
        placeholderStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14.0,
        ),
        prefix: const Padding(
          padding: EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
          child: Icon(
            Icons.search,
            color: Colors.black87,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      ),
    );
  }
}
