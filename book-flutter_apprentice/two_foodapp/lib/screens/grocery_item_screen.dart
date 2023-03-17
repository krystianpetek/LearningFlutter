import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/app_state_manager.dart';
import 'package:two_foodapp/models/grocery_item_model.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget {
  const GroceryItemScreen(
      {super.key,
      required this.onCreate,
      required this.onUpdate,
      this.originalItem})
      : isUpdating = (originalItem != null);

  final Function(GroceryItemModel) onCreate;
  final Function(GroceryItemModel) onUpdate;
  final GroceryItemModel? originalItem;
  final bool isUpdating;

  @override
  State<StatefulWidget> createState() {
    return GroceryItemScreenState();
  }
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  ImportanceEnum _importance = ImportanceEnum.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();

    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final groceryItem = GroceryItemModel(
                  id: widget.originalItem?.id ?? const Uuid().v1(),
                  name: _nameController.text,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                      _timeOfDay.hour, _timeOfDay.minute));

              if (widget.isUpdating) {
                widget.onUpdate(groceryItem);
              } else {
                widget.onCreate(groceryItem);
              }

              context.goNamed(
                'home',
                params: {'tab': '${FoodAppTab.toBuy}'},
              );
            },
          ),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(height: 10.0),
            buildImportanceField(),
            const SizedBox(height: 10.0),
            buildDateField(context),
            const SizedBox(height: 10.0),
            buildTimeField(context),
            const SizedBox(height: 10.0),
            buildColorPicker(context),
            const SizedBox(height: 10.0),
            buildQuantityField(),
            const SizedBox(height: 10.0),
            GroceryTile(
              item: GroceryItemModel(
                id: 'previewMode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day,
                    _timeOfDay.hour, _timeOfDay.minute),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
          ),
        ),
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              label: Text('low', style: Theme.of(context).textTheme.bodySmall),
              selectedColor: Colors.grey,
              selected: _importance == ImportanceEnum.low,
              onSelected: (selected) {
                setState(() {
                  _importance = ImportanceEnum.low;
                });
              },
            ),
            ChoiceChip(
              label:
                  Text('medium', style: Theme.of(context).textTheme.bodySmall),
              selectedColor: Colors.grey,
              selected: _importance == ImportanceEnum.medium,
              onSelected: (selected) {
                setState(() {
                  _importance = ImportanceEnum.medium;
                });
              },
            ),
            ChoiceChip(
              label: Text('high', style: Theme.of(context).textTheme.bodySmall),
              selectedColor: Colors.grey,
              selected: _importance == ImportanceEnum.high,
              onSelected: (selected) {
                setState(() {
                  _importance = ImportanceEnum.high;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            )
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_dueDate))
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of day',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
          ],
        ),
        Text(_timeOfDay.format(context)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28),
            ),
          ],
        ),
        TextButton(
          child: const Text('Select'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) => setState(() {
                        _currentColor = color;
                      }),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
        ),
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            const SizedBox(width: 16),
            Text(
              '${_currentSliderValue.toInt()}',
              style: GoogleFonts.lato(fontSize: 18),
            )
          ],
        ),
        Slider(
            value: _currentSliderValue.toDouble(),
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: '${_currentSliderValue.toInt()}',
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            }),
      ],
    );
  }
}
