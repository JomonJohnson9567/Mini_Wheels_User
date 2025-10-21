import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_wheelz_user/features/core/colors.dart';
import 'package:mini_wheelz_user/features/domain/entity/address.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_bloc.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_event.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/address_state.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/cubit/search_cubit.dart';
import 'package:mini_wheelz_user/features/presentation/screens/address_screen/widgets/address_card.dart';
import 'package:mini_wheelz_user/features/presentation/screens/address_screen/widgets/address_form_dialog.dart';
import 'package:mini_wheelz_user/features/presentation/screens/search_screen/widgets/search_field.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  List<Address> _filterAddresses(List<Address> addresses, String query) {
    final lowerQuery = query.toLowerCase();
    return query.isEmpty
        ? addresses
        : addresses.where((address) {
            return address.name.toLowerCase().contains(lowerQuery) ||
                address.town.toLowerCase().contains(lowerQuery) ||
                address.houseName.toLowerCase().contains(lowerQuery) ||
                address.phone.contains(query);
          }).toList();
  }

  void _showAddressDialog(BuildContext context, {Address? address}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) => AddressFormDialog(address: address),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Addresses",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: blackColor,
              letterSpacing: 0.5,
            ),
          ),
          backgroundColor: whiteColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: brownColr, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () => _showAddressDialog(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, primaryColor.withOpacity(0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.add_rounded, size: 20, color: Colors.white),
                        SizedBox(width: 6),
                        Text(
                          "New",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // Search Field with beautiful styling
              BlocBuilder<SearchCubit, String>(
                builder: (context, query) {
                  return Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SearchField(
                      controller: TextEditingController(text: query)
                        ..selection = TextSelection.fromPosition(
                          TextPosition(offset: query.length),
                        ),
                      onChanged: (value) =>
                          context.read<SearchCubit>().updateQuery(value),
                      onClear: () => context.read<SearchCubit>().clearQuery(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Address count indicator
              BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  if (state is AddressLoaded) {
                    return BlocBuilder<SearchCubit, String>(
                      builder: (context, query) {
                        final allAddresses = [...state.addresses]
                          ..sort((a, b) => b.isSelected ? 1 : -1);
                        final filtered = _filterAddresses(allAddresses, query);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${filtered.length} ${filtered.length == 1 ? 'Address' : 'Addresses'}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              // Address List
              Expanded(
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state is AddressLoading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                primaryColor,
                              ),
                              strokeWidth: 3,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Loading addresses...",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is AddressLoaded) {
                      return BlocBuilder<SearchCubit, String>(
                        builder: (context, query) {
                          final allAddresses = [...state.addresses]
                            ..sort((a, b) => b.isSelected ? 1 : -1);
                          final filtered = _filterAddresses(
                            allAddresses,
                            query,
                          );

                          if (filtered.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.location_off_outlined,
                                      size: 64,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    query.isEmpty
                                        ? "No addresses yet"
                                        : "No addresses found",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    query.isEmpty
                                        ? "Add your first address to get started"
                                        : "Try a different search term",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  if (query.isEmpty) ...[
                                    const SizedBox(height: 24),
                                    ElevatedButton.icon(
                                      onPressed: () =>
                                          _showAddressDialog(context),
                                      icon: const Icon(Icons.add_rounded),
                                      label: const Text("Add Address"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 2,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }

                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: filtered.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (_, i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              child: AddressCard(
                                address: filtered[i],
                                onEdit: () => _showAddressDialog(
                                  context,
                                  address: filtered[i],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is AddressError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.red[50],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red[400],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Oops! Something went wrong",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            OutlinedButton.icon(
                              onPressed: () {
                                context.read<AddressBloc>().add(
                                  LoadAddresses(),
                                );
                              },
                              icon: const Icon(Icons.refresh_rounded),
                              label: const Text("Retry"),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                                side: BorderSide(color: primaryColor),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
