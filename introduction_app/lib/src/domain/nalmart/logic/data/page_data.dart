import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

const String headerAvatarImage = 'https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png';
const String headerGreetings = 'Hi, Mike';
const String headerLogoImage = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg';
const String headerCartAmount = r'$499.60';
const String headerItemsInCart = '7';

const String iconsCart = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg';
const String iconsSearch = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg';
const String iconsBarcode = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/barcode.svg';
const String iconsHome = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg';
const String iconsGeo = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg';
const String iconsChevronRight = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/circle_chevron_right.svg';
const String iconsLocation = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/location_dark.svg';
const String iconsPlus = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg';
const String iconsStarEmpty = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_empty.svg';
const String iconsStarHalf = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_half.svg';
const String iconsStarFull = 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_filled.svg';

const String searchHint = 'Search everything at Nalmart';
const String addressShopName = 'Carrollton Supercenter';
const String addressShopAddress = 'Dallas 75220';

const List<Json> ads = [
  {
    'title': 'Best water',
    'description': 'Very tasty and healthy',
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_1.jpeg',
    'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
    'action': 'snackbar:Hello!'
  },
  {
    'title': 'Delicious coffe',
    'description': 'Made by our hands',
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_2.jpeg',
    'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
    'action': 'snackbar:Hello!'
  },
  {
    'title': 'Great power',
    'description': 'Best gym in the history',
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_3.jpeg',
    'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
    'action': 'snackbar:Hello!'
  }
];

const String orderTitle = 'Your order is on the way';
const String orderArrivalTime = 'Arrives today, 3pm – 4pm';
const String buttonsTrack = 'Track';
const String buttonsAdd = 'Add';

const Map<String, Json> orderStatuses = {
  'placed': {
    'title': 'Placed',
    'is_active': true,
    'is_current': false,
  },
  'preparing': {
    'title': 'Preparing',
    'is_active': true,
    'is_current': false,
  },
  'on_the_way': {
    'title': 'On the way',
    'is_active': true,
    'is_current': true,
  },
  'delivered': {
    'title': 'Delivered',
    'is_active': false,
    'is_current': false,
  }
};

const List<Json> filterButtons = [
  {
    'prefix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg',
    'title': 'Sort & Filter',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Sort & Filter!'
  },
  {
    'prefix_icon': null,
    'title': 'In store',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: In store!'
  },
  {
    'prefix_icon': null,
    'title': 'Price',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Price!'
  },
  {
    'prefix_icon': null,
    'title': 'Brand',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Brand!'
  },
  {
    'prefix_icon': null,
    'title': 'Size',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Size!'
  },
  {
    'prefix_icon': null,
    'title': 'Color',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Color!'
  },
  {
    'prefix_icon': null,
    'title': 'Weight',
    'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'action': 'snackbar: Weight!'
  },
];

const String groceriesHeaderTitle = 'Groceries';
const String groceriesHeaderAmount = ' (12.3k)';

const List<Json> groceries = [
  {
    'title': 'Gala Apples, 3lb Bag',
    'subtitle': 'Final cost by weight',
    'price': r'$4.62',
    'price_per_unit': r'$2.27/lb',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/apple.png',
    'color': Color(0x1FCF011F),
  },
  {
    'title': 'Wonder Bread Classic',
    'subtitle': 'Wonder',
    'price': r'$2.39',
    'price_per_unit': '11.9 ¢/oz',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/bread.png',
    'color': Color(0x1FD38B4E),
  },
  {
    'title': 'Ultra-Filtered Milk',
    'subtitle': 'Fairlife 2%',
    'price': r'$3.98',
    'price_per_unit': '7.7 ¢/fl oz',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/milk.png',
    'color': Color(0x1F66BEEC),
  },
  {
    'title': 'Bananas, Each',
    'subtitle': 'Fresh Produce',
    'price': r'$0.21',
    'price_per_unit': 'each',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/bananas.png',
    'color': Color(0x1FF5E673),
  },
  {
    'title': 'Creamy Peanut Butter',
    'subtitle': '18 oz, Great Value',
    'price': r'$1.72',
    'price_per_unit': '9.6 ¢/oz',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/peanut_cream.png',
    'color': Color(0x1F35221F),
  },
  {
    'title': 'Ben & Jerry\'s',
    'subtitle': 'Strawberry Cheesecake',
    'price': r'$4.62',
    'price_per_unit': '28.0 ¢/oz',
    'is_in_stock': false,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/ice_cream.png',
    'color': Color(0x1F2A388F),
  },
  {
    'title': 'Hass Avocados',
    'subtitle': 'Fresh Produce',
    'price': r'$3.78',
    'price_per_unit': r'$2.27/lb',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/avocados.png',
    'color': Color(0x1F5D7428),
  },
  {
    'title': 'Fresh Spinach, 10 oz',
    'subtitle': 'Marketside',
    'price': r'$2.18',
    'price_per_unit': '21.8 ¢/oz',
    'is_in_stock': true,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/spinach.png',
    'color': Color(0x1F2E4006),
  },
];

const String brandsHeaderTitle = 'Brands';

const List<Json> brands = [
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/gap_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/apple_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/tommy_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/boss_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/levis_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/nautica_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/boots_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/ikea_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/crocodile_logo.svg'},
  {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/nike_logo.svg'},
];

const String electronicsHeaderTitle = 'Electronics';
const String electronicsHeaderAmount = ' (3.5k)';

const List<Json> electronics = [
  {
    'title': 'Apple Watch SE GPS',
    'subtitle': 'Apple',
    'price': r'$279.00',
    'price_per_month': r'$26/mo',
    'rating': 4.5,
    'reviews_count': 135,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/watch.png',
    'color': Color(0x1FCABEB4),
  },
  {
    'title': 'Canon EOS Rebel T100',
    'subtitle': 'Canon',
    'price': r'$379.00',
    'price_per_month': r'$36/mo',
    'rating': 3.1,
    'reviews_count': 1400,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/camera.png',
    'color': Color(0x1F612E65),
  },
  {
    'title': 'OnePlus Nord N200',
    'subtitle': 'OnePlus',
    'price': r'$220.00',
    'price_per_month': r'$21/mo',
    'rating': 3.6,
    'reviews_count': 70,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/oneplus.png',
    'color': Color(0x1F0C2BBA),
  },
  {
    'title': 'Bomaker Projector',
    'subtitle': 'Bomaker',
    'price': r'$320.00',
    'price_per_month': r'$18/mo',
    'rating': 3.2,
    'reviews_count': 80,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/projector.png',
    'color': Color(0x1F30AFF3),
  },
  {
    'title': 'QuietComfort 45',
    'subtitle': 'Bose',
    'price': r'$279.00',
    'price_per_month': r'$24/mo',
    'rating': 4.15,
    'reviews_count': 250,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/headphones.png',
    'color': Color(0x1F363636),
  },
  {
    'title': 'Contixo F16 FPV',
    'subtitle': 'Contixo',
    'price': r'$180.00',
    'price_per_month': r'$10/mo',
    'rating': 5.0,
    'reviews_count': 49,
    'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/drone.png',
    'color': Color(0x1F4F565D),
  },
];

const Json pageContext = {
  'id': 'landing_page',
  'fonts': {'primary_font': 'Blazeface'},
  'colors': {'primary_color': '#FF2F4C98'},
  'icons': {
    'cart': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/cart.svg',
    'search': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/search.svg',
    'barcode': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/barcode.svg',
    'home': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/home.svg',
    'geo': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/location.svg',
    'sort': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg',
    'chevron_down': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
    'add': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/plus.svg',
    'star': {
      'empty': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_empty.svg',
      'half': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_half.svg',
      'full': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/star_filled.svg'
    }
  },
  'buttons': {
    'track': {'title': 'Track'},
    'add': {'title': 'Add'}
  },
  'header': {
    'avatar_image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/avatar.png',
    'greetings': 'Hi, Mike',
    'logo_image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/logo.svg',
    'cart_amount': r'$499.60',
    'items_in_cart': 7
  },
  'search': {'search_field_hint': 'Search everything at Nalmart'},
  'address': {'shop_name': 'Carrollton Supercenter', 'shop_address': 'Dallas 75220'},
  'ads': [
    {
      'title': 'Best water',
      'description': 'Very tasty and healthy',
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_1.jpeg',
      'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
      'action': 'snackbar:Hello!'
    },
    {
      'title': 'Delicious coffe',
      'description': 'Made by our hands',
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_2.jpeg',
      'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
      'action': 'snackbar:Hello!'
    },
    {
      'title': 'Great power',
      'description': 'Best gym in the history',
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/info_3.jpeg',
      'blur_hash': 'LQK^scRP%%%0pe%LnMSj.8W=Rkxt',
      'action': 'snackbar:Hello!'
    }
  ],
  'order': {
    'title': 'Your order is on the way',
    'arrival_time': 'Arrives today, 3pm – 4pm',
    'statuses': {
      'placed': {'title': 'Placed', 'is_active': true, 'is_current': false},
      'preparing': {'title': 'Preparing', 'is_active': true, 'is_current': false},
      'on_the_way': {'title': 'On the way', 'is_active': true, 'is_current': true},
      'delivered': {'title': 'Delivered', 'is_active': false, 'is_current': false}
    }
  },
  'filter_buttons': [
    {
      'prefix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/menu.svg',
      'title': 'Sort & Filter',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Sort & Filter!'
    },
    {
      'prefix_icon': null,
      'title': 'In store',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: In store!'
    },
    {
      'prefix_icon': null,
      'title': 'Price',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Price!'
    },
    {
      'prefix_icon': null,
      'title': 'Brand',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Brand!'
    },
    {
      'prefix_icon': null,
      'title': 'Size',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Size!'
    },
    {
      'prefix_icon': null,
      'title': 'Color',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Color!'
    },
    {
      'prefix_icon': null,
      'title': 'Weight',
      'postfix_icon': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/chevron_bottom.svg',
      'action': 'snackbar: Weight!'
    }
  ],
  'groceries_header': {'title': 'Groceries', 'amount': ' (12.3k)'},
  'groceries_list': [
    {
      'title': 'Gala Apples, 3lb Bag',
      'subtitle': 'Final cost by weight',
      'price': r'$4.62',
      'price_per_unit': r'$2.27/lb',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/apple.png',
      'color': '#1FCF011F'
    },
    {
      'title': 'Wonder Bread Classic',
      'subtitle': 'Wonder',
      'price': r'$2.39',
      'price_per_unit': '11.9 ¢/oz',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/bread.png',
      'color': '#1FD38B4E'
    },
    {
      'title': 'Ultra-Filtered Milk',
      'subtitle': 'Fairlife 2%',
      'price': r'$3.98',
      'price_per_unit': '7.7 ¢/fl oz',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/milk.png',
      'color': '#1F66BEEC'
    },
    {
      'title': 'Bananas, Each',
      'subtitle': 'Fresh Produce',
      'price': r'$0.21',
      'price_per_unit': 'each',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/bananas.png',
      'color': '#1FF5E673'
    },
    {
      'title': 'Creamy Peanut Butter',
      'subtitle': '18 oz, Great Value',
      'price': r'$1.72',
      'price_per_unit': '9.6 ¢/oz',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/peanut_cream.png',
      'color': '#1F35221F'
    },
    {
      'title': 'Ben & Jerry\'s',
      'subtitle': 'Strawberry Cheesecake',
      'price': r'$4.62',
      'price_per_unit': '28.0 ¢/oz',
      'is_in_stock': false,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/ice_cream.png',
      'color': '#1F2A388F'
    },
    {
      'title': 'Hass Avocados',
      'subtitle': 'Fresh Produce',
      'price': r'$3.78',
      'price_per_unit': r'$2.27/lb',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/avocados.png',
      'color': '#1F5D7428'
    },
    {
      'title': 'Fresh Spinach, 10 oz',
      'subtitle': 'Marketside',
      'price': r'$2.18',
      'price_per_unit': '21.8 ¢/oz',
      'is_in_stock': true,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/spinach.png',
      'color': '#1F2E4006'
    }
  ],
  'brands_header': {'title': 'Brands'},
  'brands_list': [
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/gap_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/apple_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/tommy_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/boss_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/levis_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/nautica_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/boots_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/ikea_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/crocodile_logo.svg'},
    {'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/svg/nike_logo.svg'}
  ],
  'electronics_header': {'title': 'Electronics', 'amount': ' (3.5k)'},
  'electronics_list': [
    {
      'title': 'Apple Watch SE GPS',
      'subtitle': 'Apple',
      'price': r'$279.00',
      'price_per_month': r'$26/mo',
      'rating': 4.5,
      'reviews_count': 135,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/watch.png',
      'color': '#1FCABEB4'
    },
    {
      'title': 'Canon EOS Rebel T100',
      'subtitle': 'Canon',
      'price': r'$379.00',
      'price_per_month': r'$36/mo',
      'rating': 3.1,
      'reviews_count': 1400,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/camera.png',
      'color': '#1F612E65'
    },
    {
      'title': 'OnePlus Nord N200',
      'subtitle': 'OnePlus',
      'price': r'$220.00',
      'price_per_month': r'$21/mo',
      'rating': 3.6,
      'reviews_count': 70,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/oneplus.png',
      'color': '#1F0C2BBA'
    },
    {
      'title': 'Bomaker Projector',
      'subtitle': 'Bomaker',
      'price': r'$320.00',
      'price_per_month': r'$18/mo',
      'rating': 3.2,
      'reviews_count': 80,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/projector.png',
      'color': '#1F30AFF3'
    },
    {
      'title': 'QuietComfort 45',
      'subtitle': 'Bose',
      'price': r'$279.00',
      'price_per_month': r'$24/mo',
      'rating': 4.15,
      'reviews_count': 250,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/headphones.png',
      'color': '#1F363636'
    },
    {
      'title': 'Contixo F16 FPV',
      'subtitle': 'Contixo',
      'price': r'$180.00',
      'price_per_month': r'$10/mo',
      'rating': 5.0,
      'reviews_count': 49,
      'image': 'https://raw.githubusercontent.com/alphamikle/assets/master/images/drone.png',
      'color': '#1F4F565D'
    }
  ]
};
