import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_wheelz_user/features/domain/entity/address.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_bloc.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_event.dart';

class AddressFormDialog extends StatelessWidget {
  final Address? address;
  AddressFormDialog({super.key, this.address});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _name = TextEditingController(text: address?.name ?? '');
    final _house = TextEditingController(text: address?.houseName ?? '');
    final _town = TextEditingController(text: address?.town ?? '');
    final _district = TextEditingController(text: address?.district ?? '');
    final _state = TextEditingController(text: address?.state ?? '');
    final _country = TextEditingController(text: address?.country ?? '');
    final _pin = TextEditingController(text: address?.pincode ?? '');
    final _phone = TextEditingController(text: address?.phone ?? '');
    final _note = TextEditingController(text: address?.instructions ?? '');

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
<<<<<<< HEAD
            colors: [Colors.white, Colors.grey.shade50],
=======
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surface.withOpacity(0.95),
            ],
>>>>>>> aa94e28 (revenue section UI updates)
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
<<<<<<< HEAD
            // Header
=======
            // Header with gradient
>>>>>>> aa94e28 (revenue section UI updates)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
<<<<<<< HEAD
                  colors: [Colors.blue.shade600, Colors.blue.shade800],
=======
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withOpacity(0.8),
                  ],
>>>>>>> aa94e28 (revenue section UI updates)
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
<<<<<<< HEAD
                    padding: const EdgeInsets.all(10),
=======
                    padding: const EdgeInsets.all(12),
>>>>>>> aa94e28 (revenue section UI updates)
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      address == null
                          ? Icons.add_location_alt
                          : Icons.edit_location_alt,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address == null ? 'Add New Address' : 'Edit Address',
                          style: const TextStyle(
<<<<<<< HEAD
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
=======
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
>>>>>>> aa94e28 (revenue section UI updates)
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
<<<<<<< HEAD
                          address == null
                              ? 'Fill in your delivery details'
                              : 'Update your address information',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13,
=======
                          'Fill in your delivery details',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
>>>>>>> aa94e28 (revenue section UI updates)
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                    tooltip: 'Close',
                  ),
                ],
              ),
            ),

<<<<<<< HEAD
            // Form Content
=======
            // Form content
>>>>>>> aa94e28 (revenue section UI updates)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionHeader(
                        'Personal Information',
                        Icons.person_outline,
                      ),
                      const SizedBox(height: 12),
                      _field(
                        "Full Name",
                        _name,
<<<<<<< HEAD
                        Icons.badge_outlined,
                        patternValidation: _nameValidator,
                      ),
                      _field(
                        "Phone",
                        _phone,
                        Icons.phone_outlined,
=======
                        Icons.person,
                        patternValidation: _nameValidator,
                      ),
                      const SizedBox(height: 16),
                      _field(
                        "Phone Number",
                        _phone,
                        Icons.phone,
>>>>>>> aa94e28 (revenue section UI updates)
                        number: true,
                        patternValidation: _phoneValidator,
                      ),

                      const SizedBox(height: 24),
                      _sectionHeader('Address Details', Icons.home_outlined),
                      const SizedBox(height: 12),
<<<<<<< HEAD
                      _field(
                        "House/Building",
                        _house,
                        Icons.apartment_outlined,
                      ),
                      _field(
                        "Town",
                        _town,
                        Icons.location_city_outlined,
                        patternValidation: _nameValidator,
                      ),
=======
                      _field("House/Building Name", _house, Icons.business),
                      const SizedBox(height: 16),
                      _field(
                        "Town/City",
                        _town,
                        Icons.location_city,
                        patternValidation: _nameValidator,
                      ),
                      const SizedBox(height: 16),
>>>>>>> aa94e28 (revenue section UI updates)

                      Row(
                        children: [
                          Expanded(
                            child: _field(
                              "District",
                              _district,
<<<<<<< HEAD
                              Icons.map_outlined,
=======
                              Icons.map,
>>>>>>> aa94e28 (revenue section UI updates)
                              patternValidation: _nameValidator,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _field(
                              "State",
                              _state,
<<<<<<< HEAD
                              Icons.flag_outlined,
=======
                              Icons.flag,
>>>>>>> aa94e28 (revenue section UI updates)
                              patternValidation: _nameValidator,
                            ),
                          ),
                        ],
                      ),

<<<<<<< HEAD
=======
                      const SizedBox(height: 16),
>>>>>>> aa94e28 (revenue section UI updates)
                      Row(
                        children: [
                          Expanded(
                            child: _field(
                              "Country",
                              _country,
<<<<<<< HEAD
                              Icons.public_outlined,
=======
                              Icons.public,
>>>>>>> aa94e28 (revenue section UI updates)
                              patternValidation: _nameValidator,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _field(
                              "Pincode",
                              _pin,
<<<<<<< HEAD
                              Icons.pin_drop_outlined,
=======
                              Icons.pin_drop,
>>>>>>> aa94e28 (revenue section UI updates)
                              number: true,
                              patternValidation: _pinValidator,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
<<<<<<< HEAD
                      _sectionHeader(
                        'Additional Information',
                        Icons.info_outline,
                      ),
=======
                      _sectionHeader('Additional Notes', Icons.note_outlined),
>>>>>>> aa94e28 (revenue section UI updates)
                      const SizedBox(height: 12),
                      _field(
                        "Delivery Instructions (optional)",
                        _note,
<<<<<<< HEAD
                        Icons.note_outlined,
=======
                        Icons.info_outline,
>>>>>>> aa94e28 (revenue section UI updates)
                        required: false,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),

<<<<<<< HEAD
            // Footer Actions
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
=======
            // Action buttons
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(
                  top: BorderSide(color: theme.dividerColor.withOpacity(0.1)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: theme.colorScheme.outline),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16),
>>>>>>> aa94e28 (revenue section UI updates)
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
<<<<<<< HEAD
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newAddress = Address(
                          id: address?.id ?? '',
                          name: _name.text.trim(),
                          houseName: _house.text.trim(),
                          town: _town.text.trim(),
                          district: _district.text.trim(),
                          state: _state.text.trim(),
                          country: _country.text.trim(),
                          pincode: _pin.text.trim(),
                          phone: _phone.text.trim(),
                          instructions: _note.text.trim(),
                          isSelected: address?.isSelected ?? false,
                        );

                        if (address == null) {
                          context.read<AddressBloc>().add(
                            AddAddress(newAddress),
                          );
                        } else {
                          context.read<AddressBloc>().add(
                            UpdateAddress(newAddress),
                          );
                        }

                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          address == null ? Icons.add : Icons.check,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          address == null ? "Add Address" : "Update Address",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
=======
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final newAddress = Address(
                            id: address?.id ?? '',
                            name: _name.text.trim(),
                            houseName: _house.text.trim(),
                            town: _town.text.trim(),
                            district: _district.text.trim(),
                            state: _state.text.trim(),
                            country: _country.text.trim(),
                            pincode: _pin.text.trim(),
                            phone: _phone.text.trim(),
                            instructions: _note.text.trim(),
                            isSelected: address?.isSelected ?? false,
                          );

                          if (address == null) {
                            context.read<AddressBloc>().add(
                              AddAddress(newAddress),
                            );
                          } else {
                            context.read<AddressBloc>().add(
                              UpdateAddress(newAddress),
                            );
                          }

                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(
                        address == null ? Icons.add : Icons.check,
                        size: 20,
                      ),
                      label: Text(
                        address == null ? "Add Address" : "Update Address",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
>>>>>>> aa94e28 (revenue section UI updates)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
<<<<<<< HEAD
        Icon(icon, size: 20, color: Colors.blue.shade700),
=======
        Icon(icon, size: 20, color: Colors.grey[700]),
>>>>>>> aa94e28 (revenue section UI updates)
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
<<<<<<< HEAD
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
=======
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
>>>>>>> aa94e28 (revenue section UI updates)
          ),
        ),
      ],
    );
  }

  Widget _field(
    String label,
    TextEditingController ctrl,
    IconData icon, {
    bool number = false,
    bool required = true,
    int maxLines = 1,
    String? Function(String?)? patternValidation,
  }) {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: ctrl,
        maxLines: maxLines,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue.shade600, size: 22),
          labelStyle: TextStyle(color: Colors.grey.shade600),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade600, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red.shade400, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
=======
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: number ? TextInputType.number : TextInputType.text,
      inputFormatters: number ? [FilteringTextInputFormatter.digitsOnly] : null,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
>>>>>>> aa94e28 (revenue section UI updates)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        errorMaxLines: 2,
      ),
      validator: (val) {
        if (required && (val == null || val.trim().isEmpty)) {
          return 'Please enter ${label.toLowerCase()}';
        }

        if (patternValidation != null) {
          return patternValidation(val);
        }

        return null;
      },
    );
  }

  String? _nameValidator(String? value) {
    final val = value?.trim() ?? '';
    if (val.length < 2) return 'Must be at least 2 characters';
    if (val.length > 50) return 'Must be less than 50 characters';

    final regex = RegExp(r"^[a-zA-Z\s.\-']+$");

    if (!regex.hasMatch(val)) {
      return 'Only alphabets, spaces, dots, hyphens and apostrophes allowed';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    final val = value?.trim() ?? '';
    if (val.isEmpty) return 'Phone number is required';

    final cleanPhone = val.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    final phoneRegex = RegExp(r'^(\+91|91)?[6-9]\d{9}$');
    if (!phoneRegex.hasMatch(cleanPhone)) {
      return 'Enter a valid 10-digit Indian mobile number';
    }
    return null;
  }

  String? _pinValidator(String? value) {
    final val = value?.trim() ?? '';
    if (val.isEmpty) return 'Pincode is required';

    final pinRegex = RegExp(r'^\d{6}$');
    if (!pinRegex.hasMatch(val)) {
      return 'Enter a valid 6-digit pincode';
    }

    final firstDigit = int.tryParse(val[0]);
    if (firstDigit == null || firstDigit < 1 || firstDigit > 9) {
      return 'Enter a valid Indian pincode';
    }

    return null;
  }
}
