import 'package:ecommerce_flutter/common/widgets/text_widgets/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text(
          "Vithushan Personal",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text(
              "+94 76 560 7165",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBtwItems),
            Expanded(
              child: Text(
                "Neervely South, Neervely, Jaffna, Sri Lanka.",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
