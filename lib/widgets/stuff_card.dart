import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memstuff_manha/helpers/phone_call.dart';
import 'package:memstuff_manha/helpers/service_call.dart';

import '../helpers/date_helper.dart';
import '../models/stuff_model.dart';

class StuffCard extends StatelessWidget {
  final StuffModel stuff;
  final Function onUpdate;
  final Function onDelete;

  const StuffCard({
    Key key,
    this.stuff,
    this.onUpdate,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: _buildCard(),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Excluir',
          color: Theme.of(context).accentColor,
          icon: Icons.delete,
          onTap: onDelete,
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Ligar',
          color: Colors.green,
          icon: Icons.call,
          onTap: () => _callPhoneCall(stuff.phone),
        ),
      ],
    );
  }

  _buildCard() {
    return InkWell(
      onTap: onUpdate,
      child: Container(
        child: ListTile(
          title: Text(stuff.description ?? ''),
          subtitle: Text(stuff.contactName ?? ''),
          trailing: Container(
            padding: const EdgeInsets.only(top: 8),
            height: double.infinity,
            child: Text(DateHelper.relative(stuff.date)),
          ),
          leading: CircleAvatar(
            backgroundImage:
                stuff.hasPhoto ? FileImage(File(stuff.photoPath)) : null,
            child: stuff.hasPhoto ? null : Text(stuff.description[0]),
          ),
        ),
      ),
    );
  }

  _callPhoneCall(String number) {
    final PhoneCall _services = locator<PhoneCall>();
    _services.call(number);
  }
}
