import 'package:flutter/material.dart';
import 'package:opticash/utils/color.dart';

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 80.0, // Set the desired height
        color: AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: 40, // Set a fixed width for the image container
              height: 40, // Set a fixed height for the image container
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/icons/opticash-logo.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello James',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '@james',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(), // Create spacing to the right
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add your search functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add your notifications functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
