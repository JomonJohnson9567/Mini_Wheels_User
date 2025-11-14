import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_wheelz_user/features/core/colors.dart';
import 'package:mini_wheelz_user/features/domain/entity/address.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_bloc.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_state.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_event.dart';
import 'package:mini_wheelz_user/features/presentation/screens/address_screen/widgets/address_form_dialog.dart';

class AddressSelectionWidget extends StatelessWidget {
  final Address? selectedAddress;
  final Function(Address?) onAddressSelected;

  const AddressSelectionWidget({
    super.key,
    required this.selectedAddress,
    required this.onAddressSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is AddressLoaded) {
          final addresses = state.addresses;

          if (addresses.isEmpty) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: primaryColor),
                        const SizedBox(width: 8),
                        Text(
                          'Delivery Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'No addresses found. Please add a delivery address.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () => _showAddressDialog(context),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Address'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () => _showAddressDialog(context),
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Add New'),
                        style: TextButton.styleFrom(
                          foregroundColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Address selection
                  if (selectedAddress != null) ...[
                    _buildSelectedAddressCard(selectedAddress!),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () =>
                          _showAddressSelectionDialog(context, addresses),
                      child: const Text('Change Address'),
                    ),
                  ] else ...[
                    const Text(
                      'Please select a delivery address:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            _showAddressSelectionDialog(context, addresses),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: whiteColor,
                        ),
                        child: const Text('Select Address'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        } else if (state is AddressError) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    'Error loading addresses: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<AddressBloc>().add(LoadAddresses()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSelectedAddressCard(Address address) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified, color: primaryColor, size: 16),
              const SizedBox(width: 4),
              Text(
                address.name.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(address.houseName, style: const TextStyle(fontSize: 13)),
          Text(
            '${address.town}, ${address.district}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            '${address.state} - ${address.pincode}',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Phone: ${address.phone}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          if (address.instructions.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Instructions: ${address.instructions}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddressDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => AddressFormDialog());
  }

  void _showAddressSelectionDialog(
    BuildContext context,
    List<Address> addresses,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Delivery Address'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              final isSelected = selectedAddress?.id == address.id;

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                color: isSelected ? primaryColor.withOpacity(0.1) : null,
                child: ListTile(
                  leading: Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: isSelected ? primaryColor : Colors.grey,
                  ),
                  title: Text(
                    address.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? primaryColor : null,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address.houseName),
                      Text('${address.town}, ${address.district}'),
                      Text('${address.state} - ${address.pincode}'),
                      Text('Phone: ${address.phone}'),
                    ],
                  ),
                  onTap: () {
                    onAddressSelected(address);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
