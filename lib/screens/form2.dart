import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/model/user.dart';

class Form2 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _user = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First name'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter first name';
                      }
                    },
                    onSaved: (val) => setState(()=>_user.firstName = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last name'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter last name';
                      }
                    },
                    onSaved: (val) => setState(()=>_user.lastName = val),
                  ),
                  
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text('Subscribe'),
                  ),
                  
                  SwitchListTile(
                    title: Text('Monthly Newsletter'),
                    value: _user.newsletter,
                    onChanged: (bool val) {
                      setState(() {
                        _user.newsletter = val;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text('Intrest'),
                  ),
                  CheckboxListTile(
                    title: Text('Cooking'),
                    value: _user.passions[UserData.PassionCooking],
                    onChanged: (val) {
                      setState(() {
                        _user.passions[UserData.PassionCooking] = val;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Trvelling'),
                    value: _user.passions[UserData.PassionTraveling],
                    onChanged: (val) {
                      setState(() {
                        _user.passions[UserData.PassionTraveling] = val;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Hiking'),
                    value: _user.passions[UserData.PassionHiking],
                    onChanged: (val) {
                      setState(() {
                        _user.passions[UserData.PassionHiking] = val;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,horizontal: 16.0
                    ),
                    child: RaisedButton(
                      child: Text('Save'),
                      onPressed: (){
                        final form = _formKey.currentState;
                        if(form.validate()){
                          form.save();
                          _user.save();
                          _showDialog(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    Scaffold.of(context)
    .showSnackBar(SnackBar(content: Text('Submitting form'),));
  }
}
