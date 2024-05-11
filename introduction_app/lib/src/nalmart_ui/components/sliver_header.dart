import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../page_data.dart';
import 'sliver_header_delegate.dart';

class NalmartHeader extends StatelessWidget {
  const NalmartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final simpleBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
      borderSide: const BorderSide(
        color: Color(0x00FFFFFF),
        width: 0,
      ),
    );

    return SliverPersistentHeader(
      floating: true,
      delegate: SliverHeaderDelegate(
        maxExtent: height,
        minExtent: height,
        child: Container(
          height: height,
          color: ColorsData.primary,
          child: Column(
            children: [
              const SizedBox(height: 44),
              Padding(
                padding: const EdgeInsets.only(
                  left: Gap.x3,
                  top: Gap.x2,
                  right: Gap.x3,
                  bottom: Gap.x2,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox.square(
                            dimension: 32,
                            child: Image.network(headerAvatarImage),
                          ),
                          const SizedBox(width: Gap.x2),
                          const Text(
                            headerGreetings,
                            style: TextStyle(
                              color: ColorsData.secondary,
                              fontSize: 14,
                              fontFamily: mainFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox.square(
                        dimension: 39,
                        child: SvgPicture.network(headerLogoImage),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            headerCartAmount,
                            style: TextStyle(
                              color: ColorsData.secondaryDarken,
                            ),
                          ),
                          const SizedBox(width: Gap.x2),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4, right: 4),
                                child: SizedBox.square(
                                  dimension: 24,
                                  child: SvgPicture.network(iconsCart),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    color: ColorsData.tertiary,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Center(
                                    /// ? <dataBuilder>, which is equal to Bloc with BlocBuilder is omitted for simplicity
                                    child: Text(
                                      headerItemsInCart,
                                      style: TextStyle(fontSize: 9),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Gap.x3),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorsData.secondary,
                    hintText: searchHint,
                    border: simpleBorder,
                    disabledBorder: simpleBorder,
                    enabledBorder: simpleBorder,
                    errorBorder: simpleBorder,
                    focusedBorder: simpleBorder,
                    focusedErrorBorder: simpleBorder,
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintStyle: const TextStyle(
                      color: ColorsData.quaternary,
                      fontSize: 14,
                      fontFamily: mainFont,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 3),
                      child: SizedBox.square(
                        dimension: 21,
                        child: Center(
                          child: SvgPicture.network(
                            iconsSearch,
                            height: 21,
                            width: 21,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox.square(
                        dimension: 21,
                        child: Center(
                          child: Material(
                            type: MaterialType.transparency,
                            borderRadius: BorderRadius.circular(3),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(3),
                              child: SvgPicture.network(
                                iconsBarcode,
                                width: 21,
                                height: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 36,
                      color: ColorsData.primaryDarken,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: Gap.x3, right: Gap.x1),
                            child: SizedBox.square(
                              dimension: 20,
                              child: SvgPicture.network(iconsHome),
                            ),
                          ),
                          const Text(
                            addressShopName,
                            style: TextStyle(
                              color: ColorsData.secondary,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontFamily: mainFont,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 36,
                      color: ColorsData.primaryDarkest,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: Gap.x3,
                              right: Gap.x1,
                            ),
                            child: SizedBox.square(
                              dimension: 20,
                              child: SvgPicture.network(iconsGeo),
                            ),
                          ),
                          const Text(
                            addressShopAddress,
                            style: TextStyle(
                              color: ColorsData.secondary,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontFamily: mainFont,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
