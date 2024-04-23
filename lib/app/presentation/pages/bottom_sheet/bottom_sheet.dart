// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/core/constants/app_colors.dart';
import 'package:neo_tour/core/constants/app_svg.dart';

class CustomBottomSheet extends StatefulWidget {
  final int tourId;
  const CustomBottomSheet({
    Key? key,
    required this.tourId,
  }) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();
  int _counter = 1;
  bool _isButtonEnabled = false;
  String _selectedValue = AppSvg.kgFlag;

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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
            TextFormField(
              onChanged: (_) => _updateButtonState(),
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _decoration(),
            ),
            const SizedBox(height: 23),
            _buildText('Commentaries to trip'),
            TextFieldStyle(
              onChanged: (_) => _updateButtonState(),
              commentController: _commentController,
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
                        child: CounterStyle(
                            icon: const Icon(
                              Icons.minimize_rounded,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(bottom: 16),
                            onPressed: _decrementCounter,
                            background: AppColors.purple2),
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
                        child: CounterStyle(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: _incrementCounter,
                          background: AppColors.purple2,
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
                onPressed: () {
                  BlocProvider.of<CategoryBloc>(context).add(
                    TourBook(
                      PostRequest(
                          tour: 1,
                          phoneNumber: '+996${_phoneController.text}',
                          commentary: _commentController.text,
                          numberOfPeople: _counter),
                    ),
                  );
                  _buildShowDialog(context);
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
    );
  }

  Future _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const SizedBox(
          child: AlertDialogStyle(
            title: 'Your trip has been booked!',
            buttonText: 'Ok',
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

  InputDecoration _decoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      hintText: '_ _ _ _ _ _  _ _ _',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      prefixIcon: _prefixIcon(),
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            _getCountryCode(_selectedValue),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  String _getCountryCode(String? value) {
    if (value == AppSvg.kgFlag) {
      return '+996';
    } else {
      return '';
    }
  }

  void _onChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedValue = newValue;
      });
    }
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }
}

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required TextEditingController commentController,
    required this.hint,
    this.validator,
    this.onChanged,
  }) : _commentController = commentController;

  final TextEditingController _commentController;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: _commentController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class CounterStyle extends StatelessWidget {
  const CounterStyle({
    super.key,
    required this.icon,
    required this.padding,
    required this.onPressed,
    required this.background,
  });

  final Widget icon;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Padding(
        padding: padding,
        child: icon,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.5),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          background,
        ),
      ),
    );
  }
}

class AlertDialogStyle extends StatelessWidget {
  const AlertDialogStyle({
    super.key,
    required this.title,
    required this.buttonText,
  });

  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.zero,
      actions: [
        Container(
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(28))),
          child: Column(
            children: [
              const Text(
                'Your trip has been booked!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ok',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
