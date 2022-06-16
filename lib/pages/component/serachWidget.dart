import 'package:flutter/material.dart';
import 'package:foodin/pages/component/template_form.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({Key? key}) : super(key: key);
  TextEditingController keyword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Container(
        margin: const EdgeInsets.only(top: 42),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: TemplateForm(
              controller: keyword,
              onChanged: (value)=> {},
              prefixIcon: const Icon(Icons.search_rounded),
              color: Colors.grey,
              fillColor: Colors.grey[200],
              borderColor: Colors.transparent,
              hintText: "Mau belanja makanan apa?",
              radius: 30,))
          ],
        ),
      ),
    );
  }
}
