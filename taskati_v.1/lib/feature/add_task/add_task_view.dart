import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/core/widgets/custom_button.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => AddTaskViewState();
}

class AddTaskViewState extends State<AddTaskView> {
  int colorIndex = 0;
  String taskDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(hours: 1)));

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void showTaskFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: getTitleTextStyle(fontSize: 14)),
                const Gap(8),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Ex: Go to School',
                  ),
                ),
                const Gap(10),
                Text('Note', style: getTitleTextStyle(fontSize: 14)),
                const Gap(8),
                TextField(
                  controller: noteController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Ex: Go to School',
                  ),
                ),
                const Gap(10),
                Text('Date', style: getTitleTextStyle(fontSize: 14)),
                const Gap(8),
                TextField(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2040))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          taskDate = DateFormat.yMd().format(value);
                        });
                      }
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: taskDate,
                    hintStyle: getBodyTextStyle(),
                    suffixIcon: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: Text('Start Time', style: getTitleTextStyle(fontSize: 14)),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Text('End Time', style: getTitleTextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                startTime = value.format(context);
                              });
                            }
                          });
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: startTime,
                          hintStyle: getBodyTextStyle(),
                          suffixIcon: const Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: TextField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                endTime = value.format(context);
                              });
                            }
                          });
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: endTime,
                          hintStyle: getBodyTextStyle(),
                          suffixIcon: const Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(3, (int index) {
                          return Padding(
                            padding: const EdgeInsets.all(3),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  colorIndex = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: index == 0
                                    ? AppColors.primaryColor
                                    : index == 1
                                        ? AppColors.orangeColor
                                        : AppColors.redColor,
                                child: colorIndex == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    CustomButton(
                      width: 150,
                      text: 'Create Task',
                      onPressed: () {
                        // Implement your task creation logic here
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Task Created')),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showTaskFormModal(context);
          },
          child: const Text('Add Task'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
