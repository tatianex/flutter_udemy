import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/error_dialog.dart';
import 'package:expense_tracker/widgets/expenses_list/amount_input.dart';
import 'package:expense_tracker/widgets/expenses_list/buttons.dart';
import 'package:expense_tracker/widgets/expenses_list/category_dropdown.dart';
import 'package:expense_tracker/widgets/expenses_list/date_picker.dart';
import 'package:expense_tracker/widgets/expenses_list/title_input.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    // this line will only be executed once the pickedDate receive its value
    // because it is literally waiting for it

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
    // USING THEN
    // showDatePicker(
    //   context: context,
    //   firstDate: firstDate,
    //   lastDate: now,
    // ).then(
    //   (value) {},
    // );
  }

  void _submitExpenseData() {
    final titleIsInvalid = _titleController.text.trim().isEmpty;
    final inputAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = inputAmount == null || inputAmount <= 0;
    final dateIsInvalid = _selectedDate == null;

    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      ErrorDialog(context: context).show();
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: inputAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  // when using TextEditingController we have to call the dispose method
  // otherwise it will still be consuming memory
  // even if the widget is not visible anymore
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, bottom + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: TitleInput(controller: _titleController)),
                      const SizedBox(width: 24),
                      Expanded(
                          child: AmountInput(controller: _amountController)),
                    ],
                  )
                else
                  TitleInput(controller: _titleController),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(
                    children: [
                      CategoryDropdown(
                        selectedCategory: _selectedCategory,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: DatePicker(
                          selectedDate: _selectedDate,
                          presentDatePicker: _presentDatePicker,
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                          child: AmountInput(controller: _amountController)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: DatePicker(
                          selectedDate: _selectedDate,
                          presentDatePicker: _presentDatePicker,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                Buttons(
                  // Removes the overlay from the screen
                  onCancel: () => Navigator.pop(context),
                  onSave: _submitExpenseData,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
