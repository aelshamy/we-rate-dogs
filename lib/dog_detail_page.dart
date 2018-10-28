// This page needs some dog data, so the class expects a dog.
import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  double dogAvatarSize = 200.0;

  Widget get dogImage {
    return Hero(
      tag: widget.dog,
      child: Container(
        height: dogAvatarSize,
        width: dogAvatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(offset: const Offset(1.0, 2.0), blurRadius: 2.0, spreadRadius: -1.0, color: const Color(0x33000000)),
            const BoxShadow(offset: const Offset(2.0, 1.0), blurRadius: 3.0, spreadRadius: 0.0, color: const Color(0x24000000)),
            const BoxShadow(offset: const Offset(3.0, 1.0), blurRadius: 4.0, spreadRadius: 2.0, color: const Color(0x1F000000)),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.dog.imageUrl),
          ),
        ),
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(' ${widget.dog.rating} / 15', style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  double _sliderValue = 10.0;

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.blueAccent,
                  min: 0.0,
                  max: 15.0,
                  value: _sliderValue,
                  onChanged: (double newRating) {
                    setState(() => _sliderValue = newRating);
                  },
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text(
                  '${_sliderValue.toInt()}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
        // This widget is built below:
        submitRatingButton,
      ],
    );
  }

  //
  Widget get submitRatingButton {
    return RaisedButton(
      onPressed: () {
        if (_sliderValue < 10) {
          _ratingErrorDialog();
        } else {
          setState(() => widget.dog.rating = _sliderValue.toInt());
        }
      },
      child: Text('Submit'),
      color: Colors.blueAccent,
    );
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Error!'),
        content: new Text("They're good dogs, Brant."),
        actions: [
          new FlatButton(
            child: new Text('Try Again'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.amber[800],
            Colors.amber[700],
            Colors.amber[600],
            Colors.amber[400],
          ],
        ),
      ),
      // The Dog Profile information
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.dog.name + '  🎾',
              style: TextStyle(fontSize: 32.0),
            ),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          rating,
          addYourRating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.amber,
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}
