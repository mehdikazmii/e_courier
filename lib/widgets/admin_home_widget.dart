import 'package:flutter/material.dart';
import 'package:untitled5/models/admin_home_model.dart';
import 'package:untitled5/theme/constant.dart';

Widget buildAdminHomeWidget(BuildContext context, int index) {
  final data = AdminHomeModelList.list[index];
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Name:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data.name,
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Phone:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data.phone,
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'City:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${data.cityFrom} to ${data.cityTo}',
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Weight:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data.weight,
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Price:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data.price,
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Address:',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data.address,
                    style: style2.copyWith(
                        fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: const Text('Delete request'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Accept request'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
