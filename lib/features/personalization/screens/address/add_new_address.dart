import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      floatingLabelStyle:
                      TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: 16,),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: "Phone Number",
                  floatingLabelStyle:
                  TextStyle(color: Colors.white),
                  prefixIcon: Icon(Iconsax.call)),
            ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "Street",
                            floatingLabelStyle:
                            TextStyle(color: Colors.white),
                            prefixIcon: Icon(Iconsax.building_3)),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "Postal Code",
                            floatingLabelStyle:
                            TextStyle(color: Colors.white),
                            prefixIcon: Icon(Iconsax.code_1_copy)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "City",
                            floatingLabelStyle:
                            TextStyle(color: Colors.white),
                            prefixIcon: Icon(Iconsax.building)),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "State",
                            floatingLabelStyle:
                            TextStyle(color: Colors.white),
                            prefixIcon: Icon(Iconsax.activity_copy)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Country",
                      floatingLabelStyle:
                      TextStyle(color: Colors.white),
                      prefixIcon: Icon(Iconsax.global)),
                ),
                const SizedBox(height: 24,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Save'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
