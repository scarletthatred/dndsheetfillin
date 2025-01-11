import 'package:dndsheetfillin/parts/timeLineItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimelineWidget extends StatefulWidget {
  final List<TimelineItem> items;

  TimelineWidget({Key? key, required this.items}) : super(key: key);

  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: widget.items.map((item) => _buildDraggableItem(item)).toList(),
        ),
      ),
    );
  }

  Widget _buildDraggableItem(TimelineItem item) {
    return Draggable(
      feedback: Material(
        elevation: 4.0,
        child: _buildItemDisplay(item),
      ),
      child: _buildItemDisplay(item),
      onDragEnd: (details) {
        setState(() {
          // item.position = int.parse(details.offset.dx);
        });
      },
    );
  }

  Widget _buildItemDisplay(TimelineItem item) {
    return GestureDetector(
      onTap: () => _showItemDetails(item),
      child: Container(
        width: 200,
        height: 50,
        color: _getColorForCategory(item.category),
        alignment: Alignment.center,
        child: Text(item.title, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _showItemDetails(TimelineItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.title),
          content: Text(item.noteText),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'personal':
        return Colors.blue;
      case 'work':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}


// class TimelineWidget extends StatefulWidget {
//   final List<TimelineItem> items;
//   TimelineWidget({Key? key, required this.items}) : super(key: key);
//
//   @override
//   _TimelineWidgetState createState() => _TimelineWidgetState();
// }
//
// class _TimelineWidgetState extends State<TimelineWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: widget.items.map((item) => _buildDraggableItem(item)).toList(),
//       ),
//     );
//   }
//
//   Widget _buildDraggableItem(TimelineItem item) {
//     return Positioned(
//       left: item.position, // Horizontal position on the timeline
//       child: Draggable(
//         feedback: Material(
//           elevation: 4.0,
//           child: _buildItemDisplay(item),
//         ),
//         child: _buildItemDisplay(item),
//         onDragEnd: (details) {
//           setState(() {
//             item.position = details.offset.dx; // Update position based on drag
//           });
//         },
//       ),
//     );
//   }
//
//   Widget _buildItemDisplay(TimelineItem item) {
//     return GestureDetector(
//       onTap: () => _showItemDetails(item),
//       child: Container(
//         width: 100,
//         height: 50,
//         color: _getColorForCategory(item.category),
//         alignment: Alignment.center,
//         child: Text(item.title, style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
//
//   void _showItemDetails(TimelineItem item) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(item.title),
//           content: Text(item.noteText),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Close'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Color _getColorForCategory(String category) {
//     // Add more colors as needed
//     switch (category.toLowerCase()) {
//       case 'personal':
//         return Colors.blue;
//       case 'work':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
// }
