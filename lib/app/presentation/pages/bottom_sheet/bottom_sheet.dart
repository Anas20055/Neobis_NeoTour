// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/app/presentation/pages/bottom_sheet/widgets/counter_button.dart';
import 'package:neo_tour/app/presentation/pages/bottom_sheet/widgets/my_diolog.dart';
import 'package:neo_tour/app/presentation/pages/bottom_sheet/widgets/my_textfield.dart';
import 'package:neo_tour/core/constants/app_colors.dart';
import 'package:neo_tour/core/constants/app_svg.dart';
import 'package:neo_tour/core/mixin/validator_mixin.dart';

class CustomBottomSheet extends StatefulWidget with CustomTextFieldValidator {
  final int tourId;
  const CustomBottomSheet({
    super.key,
    required this.tourId,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();
  int _counter = 1;
  bool _isButtonEnabled = false;
  String _selectedValue = AppSvg.kgFlag;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _phoneController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _phoneController.text.isNotEmpty &&
          _commentController.text.isNotEmpty;
    });
  }

  List<DropdownMenuItem<String>> dropdownItems = [
    AppSvg.kgFlag,
  ]
      .map(
        (String value) => DropdownMenuItem(
          value: value,
          child: SvgPicture.asset(value),
        ),
      )
      .toList();

  void _incrementCounter() {
    setState(() {
      if (_counter < 6) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 36,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(60, 60, 67, 0.3),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                _closeBottomSheet(context),
                const SizedBox(height: 20),
                const Text(
                  'To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 32),
                _buildText('Phone number'),
                MyTextField(
                  onChanged: (_) => _updateButtonState(),
                  controller: _phoneController,
                  hint: ' _ _ _   _ _ _   _ _ _',
                  validator: widget.validateNumber,
                  prefixIcon: _prefixIcon(),
                ),
                const SizedBox(height: 23),
                _buildText('Commentaries to trip'),
                MyTextField(
                  onChanged: (_) => _updateButtonState(),
                  controller: _commentController,
                  validator: widget.validateNotEmpty,
                  hint: 'Write your wishes to trip...',
                ),
                const SizedBox(height: 20),
                _buildText('Number of people'),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color.fromRGBO(243, 243, 243, 1),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 29,
                            height: 36,
                            child: CounterButton(
                                icon: const Icon(
                                  Icons.minimize_rounded,
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.only(bottom: 16),
                                onPressed: _decrementCounter,
                                background: _counter == 1
                                    ? AppColors.disabledColor
                                    : AppColors.purple2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '$_counter',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 29,
                            height: 36,
                            child: CounterButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: _incrementCounter,
                              background: _counter == 6
                                  ? AppColors.disabledColor
                                  : AppColors.purple2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(AppSvg.user),
                    const SizedBox(width: 8),
                    Text(
                      '$_counter People',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: !_isButtonEnabled
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() == true) {
                              BlocProvider.of<CategoryBloc>(context).add(
                                TourBook(
                                  PostRequest(
                                      tour: widget.tourId,
                                      phoneNumber:
                                          '+996${_phoneController.text}',
                                      commentary: _commentController.text,
                                      numberOfPeople: _counter),
                                ),
                              );
                              _buildShowDialog(
                                  context, 'Your trip has been booked!');
                            }
                          },
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _buildShowDialog(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          child: Diolog(
            title: text,
          ),
        );
      },
    );
  }

  Row _closeBottomSheet(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Info',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close_rounded,
            size: 28,
          ),
        ),
      ],
    );
  }

  Row _prefixIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          width: 75,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(enabled: false),
            elevation: 0,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            value: _selectedValue,
            onChanged: _onChanged,
            items: dropdownItems,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '+996',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void _onChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedValue = newValue;
      });
    }
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
