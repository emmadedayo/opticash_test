import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opticash/models/transaction.dart';
import 'package:opticash/utils/color.dart';
import 'package:opticash/utils/helper_style.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transactionData;

  const TransactionCard({
    Key? key,
    required this.transactionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xffffbfbfb),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.50,
          color: const Color(0xFFF4F4F4),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/flag.png',
            width: 28,
            height: 28,
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionData.name,
                      style: HelperStyle.textStyle(
                        color: AppColors.transactionColor,
                        fontSize: 12,
                        weight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '-N${NumberFormat().format(transactionData.amount)}',
                      style: HelperStyle.textStyle(
                        color: _getStatusColor(transactionData.status),
                        fontSize: 12,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          transactionData.status,
                          style: HelperStyle.textStyle(
                            color: _getStatusColor(transactionData.status),
                            fontSize: 12,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      transactionData.date,
                      style: HelperStyle.textStyle(
                        color: AppColors.textFieldLabelColor,
                        fontSize: 10,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == "Pending") {
      return const Color(0xFFC98115);
    } else if (status == "Completed") {
      return Colors.green;
    } else if (status == "Failed") {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Widget _getStatusCircle(String status) {
    return CircleAvatar(
      radius: 4,
      backgroundColor: _getStatusColor(status),
    );
  }
}
