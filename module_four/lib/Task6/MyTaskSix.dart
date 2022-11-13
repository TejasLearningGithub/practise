import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module_four/Task6/MyEditPage.dart';

class TaskSix extends StatefulWidget {
  const TaskSix({Key? key}) : super(key: key);

  @override
  State<TaskSix> createState() => _TaskSixState();
}

class _TaskSixState extends State<TaskSix> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _taskSixController = TextEditingController();
  List<String> myTaskSixList = [
    'Task-1',
    'Task-2',
    'Task-3',
    'Task-4',
    'Task-5',
    'Task-6',
    'Task-7',
    'Task-8',
  ];
  @override
  Widget build(BuildContext context) {
//    Offset _tapPosition = Offset.zero;
//    void _getTapPosition(TapDownDetails details) {
//      final RenderBox referenceBox = context.findRenderObject() as RenderBox;
//      setState(() {
//        _tapPosition = referenceBox.globalToLocal(details.globalPosition);
//      });
//    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Task 6'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _taskSixController,
                decoration: InputDecoration(
                  labelText: 'Enter String Value',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myTaskSixList.insert(0, _taskSixController.text);
                });
              },
              child: Text(
                'Add Item To ListView',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myTaskSixList.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   title: Text(myTaskSixList[index]),
                  // );
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showAlertDialog(
                          context,
                          index,
                          myTaskSixList[index],
                        );
                      },
                      title: Text(myTaskSixList[index]),
                      //trailing: button(index),
                      onLongPress: () => _showContextMenu(
                          context, index, myTaskSixList, myTaskSixList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContextMenu(
    BuildContext context,
    index,
    List<String> myTaskList,
    String name,
  ) async {
    //final RenderObject? overlay =
    //    Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
      context: context,

      //Show the context menu at the tap location
      position: RelativeRect.fromRect(
          //Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(1, 1, 1, 1),
          Rect.fromLTWH(230, 230, 230, 230)),

      //set a list of choices for the context menu

      items: [
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
        const PopupMenuItem(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem(
          value: 'exit',
          child: Text('Exit'),
        ),
      ],
    ).then((value) => {
          if (value == 'delete')
            {
              print('delete pressed for $index'),
              // setState(() {
              //   myTaskList.removeAt(index);
              // })
              showDeleteDialog(index, myTaskList, myTaskList[index])
            }
          else if (value == 'edit')
            {
              print('edit pressed for $index'),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyEdit(
                    myName: name,
                    myList: myTaskList,
                    indexOfEditPage: index,
                  ),
                ),
              ).then((value) => {
                    if (value != null)
                      {
                        myTaskSixList.forEach((element) {
                          setState(() {});
                        })
                      }
                  })
            }
          else if (value == 'exit')
            {
              print('exit pressed for $index'),
              // Navigator.pop(context),
              //SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop')
              SystemNavigator.pop()
            }
        });

    // Implement the logic for each choice here
    // switch (result) {
    //   case 'favorites':
    //     debugPrint('Add To Favorites');
    //     break;
    //   case 'comment':
    //     debugPrint('Write Comment');
    //     break;
    //   case 'hide':
    //     debugPrint('Hide');
    //     break;
    // }
  }

  showDeleteDialog(index, myTaskList, myTaskName) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Are you sure want to delete\n$myTaskName?',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            myTaskList.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Delete'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Don\'t Delete',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  button(int index) => PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          PopupMenuItem(
            value: 'view',
            child: Text('View'),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text(
              'Delete',
            ),
          ),
        ],
        onSelected: (String value) => actionPopItemSelected(
            value, index, myTaskSixList, myTaskSixList[index]),
      );

  actionPopItemSelected(
      String value, int index, myTaskSixList, String taskname) {
    if (value == 'delete') {
      return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 120,
                height: 120,
                child: Text(taskname),
              ),
            ),
          );
        },
      );
    }
  }
}

showAlertDialog(BuildContext context, int index, String myTaskSixList) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(myTaskSixList)),
              ],
            ),
          ),
        ),
      );
    },
  );
}
