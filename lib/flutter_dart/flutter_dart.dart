import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

class TagSample extends StatefulWidget {
  @override
  _TagSampleState createState() => _TagSampleState();
}

class _TagSampleState extends State<TagSample> {
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();

  final TextEditingController _textController = new TextEditingController();

  List tags = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  onSubmitted: (string){
                    setState(() {
                       tags.add(Item(title:string));
                       // _textController.clear();
                    });
                  },
                ),
                Tags(
                  key: _globalKey,
                  itemCount: tags.length,
                  columns: 6,
                  // textField: TagsTextField(
                  //   textStyle: TextStyle(fontSize: 14),
                  //   onSubmitted: (string){
                  //     setState(() {
                  //       tags.add(Item(title:string));
                  //     });
                  //   }
                  // ),
                  itemBuilder: (index){
                    final Item currentItem = tags[index];
                    return ItemTags(
                      index: index,
                      title: currentItem.title,
                      customData: currentItem.customData,
                      textStyle: TextStyle(fontSize: 14),
                      combine: ItemTagsCombine.withTextBefore,
                      onPressed: (i) => print(i),
                      onLongPressed: (i) => print(i),
                      removeButton: ItemTagsRemoveButton(
                        onRemoved: (){
                          setState(() {
                            tags.removeAt(index);
                          });
                          return true;
                        }
                      ),
                    );
                  },
                ),
                RaisedButton(child: Text('Tag input'),),
              ],
            ),
          ),
        )
    );
  }
}
