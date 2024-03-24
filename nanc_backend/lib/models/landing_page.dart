import 'package:nanc_fields/nanc_fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model landingPage = Model(
  name: 'Landing page',

  /// ? id in format [toSnakeCase(name)] will be set automatically, if omitted
  // id: 'landing_page',
  isCollection: false,
  icon: IconPackNames.flu_document_page_break_regular,
  fields: [
    [
      IdField(),
    ],

    /// ? SCREEN
    [
      HeaderField(name: 'Screen Header', content: 'Page Interface', contentIcon: 'flu_phone_regular'),
    ],
    [
      ScreenField(name: 'Screen', screenContentType: ScreenContentType.scrollable),
    ],

    /// ? FONTS
    [
      HeaderField(name: 'Fonts Header', content: 'Fonts', contentIcon: 'mdi_format_font'),
    ],
    [
      StructuredField(
        name: 'Fonts',
        singleObject: true,
        structure: [
          FontField(name: 'Primary Font'),
        ],
      ),
    ],

    /// ? COLORS
    [
      HeaderField(name: 'Colors Header', content: 'Colors', contentIcon: 'flu_color_regular'),
    ],
    [
      StructuredField(
        name: 'Colors',
        singleObject: true,
        structure: [
          ColorField(name: 'Primary Color', isRequired: true),
        ],
      ),
    ],

    /// ? ICONS
    [
      HeaderField(name: 'Icons Header', content: 'Icons', contentIcon: 'flu_protocol_handler_filled'),
    ],
    [
      StructuredField(
        name: 'Icons',
        singleObject: true,
        structure: [
          StringField(name: 'Cart', maxLines: 1, isRequired: true),
          StringField(name: 'Search', maxLines: 1, isRequired: true),
          StringField(name: 'Barcode', maxLines: 1, isRequired: true),
          StringField(name: 'Home', maxLines: 1, isRequired: true),
          StringField(name: 'Geo', maxLines: 1, isRequired: true),
          StringField(name: 'Sort', maxLines: 1, isRequired: true),
          StringField(name: 'Chevron Down', maxLines: 1, isRequired: true),
          StringField(name: 'Add', maxLines: 1, isRequired: true),
          StructuredField(
            name: 'Star',
            singleObject: true,
            structure: [
              StringField(name: 'Empty', maxLines: 1, isRequired: true),
              StringField(name: 'Half', maxLines: 1, isRequired: true),
              StringField(name: 'Full', maxLines: 1, isRequired: true),
            ],
          ),
        ],
      ),
    ],

    /// ? BUTTONS
    [
      HeaderField(name: 'Buttons Header', content: 'Buttons', contentIcon: 'mdi_button_pointer'),
    ],
    [
      StructuredField(
        name: 'Buttons',
        singleObject: true,
        structure: [
          StructuredField(
            name: 'Track',
            singleObject: true,
            structure: [
              StringField(name: 'Title', maxLines: 1, isRequired: true),
            ],
          ),
          StructuredField(
            name: 'Add',
            singleObject: true,
            structure: [
              StringField(name: 'Title', maxLines: 1, isRequired: true),
            ],
          ),
        ],
      ),
    ],

    /// ? CONTENT
    [
      HeaderField(name: 'Content Header', content: 'Content', contentIcon: 'flu_book_database_filled'),
    ],

    /// ? SCREEN HEADER
    [
      StructuredField(
        name: 'Header',
        singleObject: true,
        structure: [
          StringField(name: 'Avatar Image', maxLines: 1),
          StringField(name: 'Greetings', maxLines: 1, isRequired: true),
          StringField(name: 'Logo Image', maxLines: 1, isRequired: true),
          StringField(name: 'Cart Amount', maxLines: 1),
          NumberField(name: 'Items in cart'),
        ],
      ),
    ],

    /// ? SEARCH BOX
    [
      StructuredField(
        name: 'Search',
        singleObject: true,
        structure: [
          StringField(name: 'Search Field Hint', maxLines: 1, isRequired: true),
        ],
      ),
    ],

    /// ? ADDRESS
    [
      StructuredField(
        name: 'Address',
        singleObject: true,
        structure: [
          StringField(name: 'Shop Name', maxLines: 1, isRequired: true),
          StringField(name: 'Shop Address', maxLines: 1, isRequired: true),
        ],
      ),
    ],

    /// ? ADS
    [
      StructuredField(
        name: 'Ads',
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Description', maxLines: 1, isRequired: true),
          StringField(name: 'Image', maxLines: 1, isRequired: true),
          StringField(name: 'Blur Hash', maxLines: 1),
          StringField(name: 'Action', maxLines: 1),
        ],
      ),
    ],

    /// ? ORDER
    [
      StructuredField(
        name: 'Order',
        singleObject: true,
        structure: [
          StringField(name: 'Title', maxLines: 1),
          StringField(name: 'Arrival time', maxLines: 1),
          StructuredField(
            name: 'Statuses',
            singleObject: true,
            structure: [
              StructuredField(
                name: 'Placed',
                singleObject: true,
                structure: [
                  StringField(name: 'Title', maxLines: 1, isRequired: true),
                  BoolField(name: 'Is Active', isRequired: true),
                  BoolField(name: 'Is Current', isRequired: true),
                ],
              ),
              StructuredField(
                name: 'Preparing',
                singleObject: true,
                structure: [
                  StringField(name: 'Title', maxLines: 1, isRequired: true),
                  BoolField(name: 'Is Active', isRequired: true),
                  BoolField(name: 'Is Current', isRequired: true),
                ],
              ),
              StructuredField(
                name: 'On The Way',
                singleObject: true,
                structure: [
                  StringField(name: 'Title', maxLines: 1, isRequired: true),
                  BoolField(name: 'Is Active', isRequired: true),
                  BoolField(name: 'Is Current', isRequired: true),
                ],
              ),
              StructuredField(
                name: 'Delivered',
                singleObject: true,
                structure: [
                  StringField(name: 'Title', maxLines: 1, isRequired: true),
                  BoolField(name: 'Is Active', isRequired: true),
                  BoolField(name: 'Is Current', isRequired: true),
                ],
              ),
            ],
          ),
        ],
      ),
    ],

    /// ? FILTERS
    [
      StructuredField(
        name: 'Filter Buttons',
        structure: [
          StringField(name: 'Prefix Icon', maxLines: 1),
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Postfix Icon', maxLines: 1),
          StringField(name: 'Action', maxLines: 1),
        ],
      ),
    ],

    /// ? GROCERIES
    [
      StructuredField(
        name: 'Groceries Header',
        singleObject: true,
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Amount', maxLines: 1, isRequired: true),
        ],
      ),
    ],
    [
      StructuredField(
        name: 'Groceries List',
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Subtitle', maxLines: 1, isRequired: true),
          StringField(name: 'Price', maxLines: 1, isRequired: true),
          StringField(name: 'Price Per Unit', maxLines: 1, isRequired: true),
          BoolField(name: 'Is in Stock', isRequired: true),
          StringField(name: 'Image', maxLines: 1, isRequired: true),
          ColorField(name: 'Color', isRequired: true),
        ],
      ),
    ],

    /// ? BRANDS
    [
      StructuredField(
        name: 'Brands Header',
        singleObject: true,
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
        ],
      ),
    ],
    [
      StructuredField(
        name: 'Brands List',
        structure: [
          StringField(name: 'Image', maxLines: 1, isRequired: true),
        ],
      ),
    ],

    /// ? ELECTRONICS
    [
      StructuredField(
        name: 'Electronics Header',
        singleObject: true,
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Amount', maxLines: 1, isRequired: true),
        ],
      ),
    ],
    [
      StructuredField(
        name: 'Electronics List',
        structure: [
          StringField(name: 'Title', maxLines: 1, isRequired: true),
          StringField(name: 'Subtitle', maxLines: 1, isRequired: true),
          StringField(name: 'Price', maxLines: 1, isRequired: true),
          StringField(name: 'Price Per Month', maxLines: 1, isRequired: true),
          NumberField(name: 'Rating', isRequired: true, signType: SignType.unsigned),
          NumberField(name: 'Reviews Count', isRequired: true, signType: SignType.unsigned, numberType: NumberType.integer),
          StringField(name: 'Image', maxLines: 1, isRequired: true),
          ColorField(name: 'Color', isRequired: true),
        ],
      ),
    ],
  ],
);
