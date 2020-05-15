import 'package:flutter/material.dart';

class AddToDb extends StatefulWidget {
  String appBarTitle;
  Color appBarColor;
  String authorOrProducer;
  AddToDb({this.appBarTitle, this.appBarColor, this.authorOrProducer});

  @override
  _AddToDbState createState() => _AddToDbState();
}

class _AddToDbState extends State<AddToDb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text("${widget.appBarTitle}"),
      ),
      body: Container(
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: widget.appBarColor),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: TextFormField(
                    cursorColor: widget.appBarColor,
                    style: TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                        hoverColor: widget.appBarColor,
                        focusColor: widget.appBarColor,
                        fillColor: widget.appBarColor,
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: "Tytuł",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: TextFormField(
                    style: TextStyle(fontSize: 17 ),
                    decoration: InputDecoration(
                        hoverColor: widget.appBarColor,
                        focusColor: widget.appBarColor,
                        fillColor: widget.appBarColor,
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: "${widget.authorOrProducer}",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: widget.appBarColor,)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide()
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: TextFormField(
                    cursorColor: widget.appBarColor,
                    style: TextStyle(fontSize: 17 ),
                    decoration: InputDecoration(
                        hoverColor: widget.appBarColor,
                        focusColor: widget.appBarColor,
                        fillColor: widget.appBarColor,
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: "Rok wydania",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: widget.appBarColor,)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide()
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SizedBox(

                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {Navigator.of(context).pop(true);},
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Center(child:
                          Text("Cofnij")),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(child:
                          Text("Dodaj")),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            color: widget.appBarColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
