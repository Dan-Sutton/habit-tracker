import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'app_expansion_panel.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              // settings option
              SlidableAction(
                onPressed: widget.settingsTapped,
                backgroundColor: Color.fromARGB(255, 69, 149, 69),
                icon: Icons.settings,
                borderRadius: BorderRadius.circular(12),
              ),

              // delete option
              SlidableAction(
                onPressed: widget.deleteTapped,
                backgroundColor: Color.fromARGB(255, 246, 93, 90),
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppExpansionPanelList(
              children: [
                ExpansionPanel(
                    backgroundColor: Colors.grey[100],
                    canTapOnHeader: true,
                    isExpanded: _isOpen,
                    headerBuilder: ((context, isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // checkbox
                            Row(
                              children: [
                                Checkbox(
                                  value: widget.habitCompleted,
                                  onChanged: widget.onChanged,
                                ),

                                // habit name
                                Text(widget.habitName),
                              ],
                            ),

                            Icon(Icons.arrow_back)
                          ],
                        ),
                      );
                    }),
                    body: GestureDetector(
                      onTap: (() {
                        setState(() {
                          _isOpen = !_isOpen;
                        });
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Notes: This is a feature to be added!',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ))
              ],
              expansionCallback: (i, isOpen) {
                setState(() {
                  _isOpen = !_isOpen;
                });
              },
            ),
          )),
    );
  }
}
