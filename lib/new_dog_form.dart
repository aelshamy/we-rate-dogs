import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  void submitPup(context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        new SnackBar(
          backgroundColor: Colors.redAccent,
          content: new Text('Pups neeed names!'),
        ),
      );
    } else {
      var newDog = new Dog(nameController.text, locationController.text, descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Add a Dog'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.amber.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: nameController,
                  onChanged: (v) => nameController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: locationController,
                  onChanged: (v) => locationController.text = v,
                  decoration: InputDecoration(
                    labelText: "Pups location",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (v) => descriptionController.text = v,
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitPup(context),
                      color: Colors.blueAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
