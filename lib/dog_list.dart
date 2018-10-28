import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_card.dart';
import 'package:we_rate_dogs/dog_model.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;
  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int) {
        return DogCard(doggos[int]);
      },
    );
  }
}
