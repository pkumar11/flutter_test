// import 'package:eunimart/app_models.dart';
import 'package:flutter/material.dart';
// import 'package:eunimart/ui/orders/filterPage/FilterMarketplace/FilterMarketplace.dart';
// import 'package:eunimart/ui/orders/filterPage/FilterStatus/FilterStatus.dart';
// import 'package:eunimart/ui/orders/filterPage/FilterDate/FilterDate.dart';
import 'package:intl/intl.dart';
import 'package:eunimart/ui/orders/Orders.dart';
import 'package:eunimart/util/app_constants.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String _marketplaceValue = '2';
  String _dateValue = "1";
  bool checkboxValue = false;
  String statusUrl = " ";
  String marketPlaceurl = " ";
  String countryUrl = " ";

  DateTime _currentDate = DateTime.now();
  DateTime from;
  DateTime to;
  String dateUrl = " ";
  String finalUrl;

  List<MultiSelectDialogItem<int>> multiItem = List();

  final valuestopopulate = {
    1: "New",
    2: 'Shipped',
    3: 'Delivered',
    4: 'Cancelled',
    5: 'Ready to shipped',
    6: 'Returned'
  };

  final statusValue = {
    1: 'new',
    2: 'shipped',
    3: 'delivered',
    4: 'canceled',
    5: 'ready_to_ship',
    6: 'returned'
  };
  final statusPopulate = {
    1: "New",
    2: 'Shipped',
    3: 'Delivered',
    4: 'Cancelled',
    5: 'Ready to shipped',
    6: 'Returned'
  };
  final countryPopulate = {
    1: 'Afghanistan',
    2: 'Albania',
    3: 'Algeria',
    4: 'American Samoa',
    5: 'Andorra',
    6: 'Angola',
    7: 'Anguilla',
    8: 'Antarctica',
    9: 'Antigua and Barbuda',
    10: 'Argentina',
    11: 'Armenia',
    12: 'Aruba',
    13: 'Australia',
    14: 'Austria',
    15: 'Azerbaijan',
    16: 'Bahamas (the)',
    17: 'Bahrain',
    18: 'Bangladesh',
    19: 'Barbados',
    20: 'Belarus',
    21: 'Belgium',
    22: 'Belize',
    23: 'Benin',
    24: 'Bermuda',
    25: 'Bhutan',
    26: 'Bolivia (Plurinational State of)',
    27: 'Bonaire, Sint Eustatius and Saba',
    28: 'Bosnia and Herzegovina',
    29: 'Botswana',
    30: 'Bouvet Island',
    31: 'Brazil',
    32: 'British Indian Ocean Territory (the)',
    33: 'Brunei Darussalam',
    34: 'Bulgaria',
    35: 'Burkina Faso',
    36: 'Burundi',
    37: 'Cabo Verde',
    38: 'Cambodia',
    39: 'Cameroon',
    40: 'Canada',
    41: 'Cayman Islands (the)',
    42: 'Central African Republic (the)',
    43: 'Chad',
    44: 'Chile',
    45: 'China',
    46: 'Christmas Island',
    47: 'Cocos (Keeling) Islands (the)',
    48: 'Colombia',
    49: 'Comoros (the)',
    50: 'Congo (the Democratic Republic of the)',
    51: 'Congo (the)',
    52: 'Cook Islands (the)',
    53: 'Costa Rica',
    54: 'Croatia',
    55: 'Cuba',
    56: 'Cura\u00e7ao',
    57: 'Cyprus',
    58: 'Czechia',
    59: "C\u00f4te d'Ivoire",
    60: 'Denmark',
    61: 'Djibouti',
    62: 'Dominica',
    63: 'Dominican Republic (the)',
    64: 'Ecuador',
    65: 'Egypt',
    66: 'El Salvador',
    67: 'Equatorial Guinea',
    68: 'Eritrea',
    69: 'Estonia',
    70: "Eswatini",
    71: 'Ethiopia',
    72: 'Falkland Islands (the) [Malvinas]',
    73: 'Faroe Islands (the)',
    74: 'Fiji',
    75: 'Finland',
    76: 'France',
    77: 'French Guiana',
    78: 'French Polynesia',
    79: 'French Southern Territories (the)',
    80: 'Gabon',
    81: 'Gambia (the)',
    82: 'Georgia',
    83: 'Germany',
    84: 'Ghana',
    85: 'Gibraltar',
    86: 'Greece',
    87: 'Greenland',
    88: 'Grenada',
    89: 'Guadeloupe',
    90: 'Guam',
    91: 'Guatemala',
    92: 'Guernsey',
    93: 'Guinea',
    94: 'Guinea-Bissau',
    95: 'Guyana',
    96: 'Haiti',
    97: 'Heard Island and McDonald Islands',
    98: 'Holy See (the)',
    99: 'Honduras',
    100: 'Hong Kong',
    101: 'Hungary',
    102: 'Iceland',
    103: 'India',
    104: 'Indonesia',
    105: 'Iran (Islamic Republic of)',
    106: 'Iraq',
    107: 'Ireland',
    108: 'Isle of Man',
    109: 'Israel',
    110: 'Italy',
    111: 'Jamaica',
    112: 'Japan',
    113: 'Jersey',
    114: 'Jordan',
    115: 'Kazakhstan',
    116: 'Kenya',
    117: 'Kiribati',
    118: "Korea (the Democratic People's Republic of)",
    119: 'Korea (the Republic of)',
    120: 'Kuwait',
    121: 'Kyrgyzstan',
    122: "Lao People's Democratic Republic (the)",
    123: 'Latvia',
    124: 'Lebanon',
    125: 'Lesotho',
    126: 'Liberia',
    127: 'Libya',
    128: 'Liechtenstein',
    129: 'Lithuania',
    130: 'Luxembourg',
    131: 'Macao',
    132: 'Madagascar',
    133: 'Malawi',
    134: 'Malaysia',
    135: 'Maldives',
    136: 'Mali',
    137: 'Malta',
    138: 'Marshall Islands (the)',
    139: 'Martinique',
    140: 'Mauritania',
    141: 'Mauritius',
    142: 'Mayotte',
    143: 'Mexico',
    144: 'Micronesia (Federated States of)',
    145: 'Moldova (the Republic of)',
    146: 'Monaco',
    147: 'Mongolia',
    148: 'Montenegro',
    149: 'Montserrat',
    150: 'Morocco',
    151: 'Mozambique',
    152: 'Myanmar',
    153: 'Namibia',
    154: 'Nauru',
    155: 'Nepal',
    156: 'Netherlands (the)',
    157: 'New Caledonia',
    158: 'New Zealand',
    159: 'Nicaragua',
    160: 'Niger (the)',
    161: 'Nigeria',
    162: 'Niue',
    163: 'Norfolk Island',
    164: 'Northern Mariana Islands (the)',
    165: 'Norway',
    166: 'Oman',
    167: 'Pakistan',
    168: 'Palau',
    169: 'Palestine, State of',
    170: 'Panama',
    171: 'Papua New Guinea',
    172: 'Paraguay',
    173: 'Peru',
    174: 'Philippines (the)',
    175: 'Pitcairn',
    176: 'Poland',
    177: 'Portugal',
    178: 'Puerto Rico',
    179: 'Qatar',
    180: 'Republic of North Macedonia',
    181: 'Romania',
    182: 'Russian Federation (the)',
    183: 'Rwanda',
    184: 'R\u00e9union',
    185: 'Saint Barth\u00e9lemy',
    186: 'Saint Helena, Ascension and Tristan da Cunha',
    187: 'Saint Kitts and Nevis',
    188: 'Saint Lucia',
    189: 'Saint Martin (French part)',
    190: 'Saint Pierre and Miquelon',
    191: 'Saint Vincent and the Grenadines',
    192: 'Samoa',
    193: 'San Marino',
    194: 'Sao Tome and Principe',
    195: 'Saudi Arabia',
    196: 'Senegal',
    197: 'Serbia',
    198: 'Seychelles',
    199: 'Sierra Leone',
    200: 'Singapore',
    201: 'Sint Maarten (Dutch part)',
    202: 'Slovakia',
    203: 'Slovenia',
    204: 'Solomon Islands',
    205: 'Somalia',
    206: 'South Africa',
    207: 'South Georgia and the South Sandwich Islands',
    208: 'South Sudan',
    209: 'Spain',
    210: 'Sri Lanka',
    211: 'Sudan (the)',
    212: 'Suriname',
    213: 'Svalbard and Jan Mayen',
    214: 'Sweden',
    215: 'Switzerland',
    216: 'Syrian Arab Republic',
    217: 'Taiwan (Province of China)',
    218: 'Tajikistan',
    219: 'Tanzania, United Republic of',
    220: 'Thailand',
    221: 'Timor-Leste',
    222: 'Togo',
    223: 'Tokelau',
    224: 'Tonga',
    225: 'Trinidad and Tobago',
    226: 'Tunisia',
    227: 'Turkey',
    228: 'Turkmenistan',
    229: 'Turks and Caicos Islands (the)',
    230: 'Tuvalu',
    231: 'Uganda',
    232: 'Ukraine',
    233: 'United Arab Emirates (the)',
    234: 'United Kingdom of Great Britain and Northern Ireland (the)',
    235: 'United States Minor Outlying Islands (the)',
    236: 'United States of America (the)',
    237: 'Uruguay',
    238: 'Uzbekistan',
    239: 'Vanuatu',
    240: 'Venezuela (Bolivarian Republic of)',
    241: 'Viet Nam',
    242: 'Virgin Islands (British)',
    243: 'Virgin Islands (U.S.)',
    244: 'Wallis and Futuna',
    245: 'Western Sahara',
    246: 'Yemen',
    247: 'Zambia',
    248: 'Zimbabwe',
    249: '\u00c5land Islands',
  };
  final countryValues = {
    1: 'AF',
    2: 'AL',
    3: 'DZ',
    4: 'AS',
    5: 'AD',
    6: 'AO',
    7: 'AI',
    8: 'AQ',
    9: 'AG',
    10: 'AR',
    11: 'AM',
    12: 'AW',
    13: 'AU',
    14: 'AT',
    15: 'AZ',
    16: 'BS',
    17: 'BH',
    18: 'BD',
    19: 'BB',
    20: 'BY',
    21: 'BE',
    22: 'BZ',
    23: 'BJ',
    24: 'BM',
    25: 'BT',
    26: 'BO',
    27: 'BQ',
    28: 'BA',
    29: 'BW',
    30: 'BV',
    31: 'BR',
    32: 'IO',
    33: 'BN',
    34: 'BG',
    35: 'BF',
    36: 'BI',
    37: 'CV',
    38: 'KH',
    39: 'CM',
    40: 'CA',
    41: 'KY',
    42: 'CF',
    43: 'TD',
    44: 'CL',
    45: 'CN',
    46: 'CX',
    47: 'CC',
    48: 'CO',
    49: 'KM',
    50: 'CD',
    51: 'CG',
    52: 'CK',
    53: 'CR',
    54: 'HR',
    55: 'CU',
    56: 'CW',
    57: 'CY',
    58: 'CZ',
    59: 'CI',
    60: 'DK',
    61: 'DJ',
    62: 'DM',
    63: 'DO',
    64: 'EC',
    65: 'EG',
    66: 'SV',
    67: 'GQ',
    68: 'ER',
    69: 'EE',
    70: 'SZ',
    71: 'ET',
    72: 'FK',
    73: 'FO',
    74: 'FJ',
    75: 'FI',
    76: 'FR',
    77: 'GF',
    78: 'PF',
    79: 'TF',
    80: 'GA',
    81: 'GM',
    82: 'GE',
    83: 'DE',
    84: 'GH',
    85: 'GI',
    86: 'GR',
    87: 'GL',
    88: 'GD',
    89: 'GP',
    90: 'GU',
    91: 'GT',
    92: 'GG',
    93: 'GN',
    94: 'GW',
    95: 'GY',
    96: 'HT',
    97: 'HM',
    98: 'VA',
    99: 'HN',
    100: 'HK',
    101: 'HU',
    102: 'IS',
    103: 'IN',
    104: 'ID',
    105: 'IR',
    106: 'IQ',
    107: 'IE',
    108: 'IM',
    109: 'IL',
    110: 'IT',
    111: 'JM',
    112: 'JP',
    113: 'JE',
    114: 'JO',
    115: 'KE',
    116: 'KZ',
    117: 'KI',
    118: 'KP',
    119: 'KR',
    120: 'KW',
    121: 'KG',
    122: 'LA',
    123: 'LV',
    124: 'LB',
    125: 'LS',
    126: 'LR',
    127: 'LY',
    128: 'LI',
    129: 'LT',
    130: 'LU',
    131: 'MO',
    132: 'MG',
    133: 'MW',
    134: 'MY',
    135: 'MV',
    136: 'ML',
    137: 'MT',
    138: 'MH',
    139: 'MQ',
    140: 'MR',
    141: 'MU',
    142: 'YT',
    143: 'MX',
    144: 'FM',
    145: 'MD',
    146: 'MC',
    147: 'MN',
    148: 'ME',
    149: 'MS',
    150: 'MA',
    151: 'MZ',
    152: 'MM',
    153: 'NA',
    154: 'NR',
    155: 'NP',
    156: 'NL',
    157: 'NC',
    158: 'NZ',
    159: 'NI',
    160: 'NE',
    161: 'NG',
    162: 'NU',
    163: 'NF',
    164: 'MP',
    165: 'NO',
    166: 'OM',
    167: 'PK',
    168: 'PW',
    169: 'PS',
    170: 'PA',
    171: 'PG',
    172: 'PY',
    173: 'PE',
    174: 'PH',
    175: 'PN',
    176: 'PL',
    177: 'PT',
    178: 'PR',
    179: 'QA',
    180: 'MK',
    181: 'RO',
    182: 'RU',
    183: 'RW',
    184: 'RE',
    185: 'BL',
    186: 'SH',
    187: 'KN',
    188: 'LC',
    189: 'MF',
    190: 'PM',
    191: 'VC',
    192: 'WS',
    193: 'SM',
    194: 'ST',
    195: 'SA',
    196: 'SN',
    197: 'RS',
    198: 'SC',
    199: 'SL',
    200: 'SG',
    201: 'SX',
    202: 'Sk',
    203: 'SI',
    204: 'SB',
    205: 'SO',
    206: 'ZA',
    207: 'GS',
    208: 'SS',
    209: 'ES',
    210: 'LK',
    211: 'SD',
    212: 'SR',
    213: 'SJ',
    214: 'SE',
    215: 'CH',
    216: 'SY',
    217: 'TW',
    218: 'TJ',
    219: 'TZ',
    220: 'TH',
    221: 'TL',
    222: 'TG',
    223: 'TK',
    224: 'TO',
    225: 'TT',
    226: 'TN',
    227: 'TR',
    228: 'TM',
    229: 'TC',
    230: 'TV',
    231: 'UG',
    232: 'UA',
    233: 'AE',
    234: 'GB',
    235: 'UM',
    236: 'US',
    237: 'UY',
    238: 'UZ',
    239: 'VU',
    240: 'VE',
    241: 'VN',
    242: 'VG',
    243: 'VI',
    244: 'WF',
    245: 'EH',
    246: "YE",
    247: 'ZM',
    248: 'AW',
    249: 'AX'
  };

  void populateMultiselect() {
    for (int v in valuestopopulate.keys) {
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
    }
  }

  void shipMultiselect() {
    for (int v in statusPopulate.keys) {
      multiItem.add(MultiSelectDialogItem(v, statusPopulate[v]));
    }
  }

  void countryMultiselect() {
    for (int v in countryPopulate.keys) {
      multiItem.add(MultiSelectDialogItem(v, countryPopulate[v]));
    }
  }

  void _showStatusMultiSelect(BuildContext context) async {
    multiItem = [];
    shipMultiselect();
    final items = multiItem;

    final String title = 'Status';
    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          title: title,
          // initialSelectedValues: [].toSet(),
        );
      },
    );

    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  void _showCountryMultiSelect(BuildContext context) async {
    multiItem = [];
    countryMultiselect();
    final items = multiItem;

    final String title = 'Countries';
    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          title: title,
          // initialSelectedValues: [].toSet(),
        );
      },
    );

    print(selectedValues);
    getvalueCountryfromkey(selectedValues);
  }

  void _showMultiSelect(BuildContext context) async {
    // final items = <MultiSelectDialogItem<int>>[
    //   MultiSelectDialogItem(1, 'Dog'),
    //   MultiSelectDialogItem(2, 'Cat'),
    //   MultiSelectDialogItem(3, 'Mouse'),
    //   MultiSelectDialogItem(4, 'Mouse'),
    //   MultiSelectDialogItem(5, 'Mouse'),
    //   MultiSelectDialogItem(6, 'Mouse'),
    //   MultiSelectDialogItem(7, 'Mouse'),
    //   MultiSelectDialogItem(8, 'Mouse'),
    //   MultiSelectDialogItem(9, 'Mouse'),
    //   MultiSelectDialogItem(10, 'Mouse'),
    //   MultiSelectDialogItem(11, 'Mouse'),
    //   MultiSelectDialogItem(12, 'Mouse'),
    // ];
    multiItem = [];
    populateMultiselect();
    final items = multiItem;

    final String title = 'Marketplace';
    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          title: title,
          // initialSelectedValues: [1, 3].toSet(),
        );
      },
    );

    print(selectedValues);
    // getvaluefromkey(selectedValues);
  }

// "https://idp-testing.vdezi.com/api/v2/orders_managment/orders/list
// ?status%5B0%5D=new&status%5B1%5D=shipped&status%5B2%5D=delivered&status%5B3%5D
// =canceled&status%5B4%5D=ready_to_ship&status%5B5%5D=r
// eturned&account_id=850c1707-439a-428e-b083-dad7178e24f1
// "
  void getvaluefromkey(Set selection) {
    if (selection != null) {
      statusUrl = " ";
      int i = 0;
      for (int x in selection.toList()) {
        print(statusValue[x]);
        print(i);

        statusUrl = statusUrl + 'status%5B${i}5D=' + statusValue[x] + '&';

        i++;
      }
      print('$statusUrl');
    }
  }

  void getvalueCountryfromkey(Set selection) {
    if (selection != null) {
      countryUrl = " ";
      int i = 0;
      for (int x in selection.toList()) {
        print(countryValues[x]);
        print(x);

        countryUrl =
            countryUrl + 'receiver_country%5B${i}5D=' + countryValues[x] + '&';

        i++;
      }
      print('$countryUrl');
    }
  }

  void _dateCalculated(String value) {
    var date =
        new DateTime(_currentDate.year, _currentDate.month, _currentDate.day);
    to = DateTime(date.year, date.month, date.day);

    // var prevMonth =  DateTime(date.year, date.month, date.day - 15);
    // print(prevMonth);
    switch (value) {
      case '1':
        from = DateTime(date.year, date.month, date.day);
        to = DateTime(date.year, date.month, date.day);
        break;
      case '2':
        from = DateTime(date.year, date.month, date.day - 1);
        to = DateTime(date.year, date.month, date.day);
        break;
      case '3':
        from = DateTime(date.year, date.month, date.day - 7);
        break;
      case '4':
        from = DateTime(date.year, date.month, date.day - 30);
        break;
      case '5':
        from = DateTime(date.year, _currentDate.month, 1);
        break;
      case '6':
        from = DateTime(date.year, date.month - 1, 1);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(_currentDate);
    // print(from);
    var date =
        new DateTime(_currentDate.year, _currentDate.month, _currentDate.day);
    to = DateTime(date.year, date.month, date.day);
    from = DateTime(date.year, date.month, date.day);

    DateFormat dateFormat = DateFormat("MM-dd-yyyy");
    // var formatter = DateFormat('yMMMEd');

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Text('Marketplace'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: DropdownButton<String>(
                      itemHeight: 70,

                      style: TextStyle(
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.white,
                      // iconEnabledColor: Colors.black,

                      items: [
                        DropdownMenuItem<String>(
                          child: Text('select'),
                          value: '2',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Ebay'),
                          value: '1',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          _marketplaceValue = value;
                          // checkboxValue = !checkboxValue;
                        });
                      },
                      hint: Text(
                        'Select Item',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: _marketplaceValue,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Text('Countries'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        _showCountryMultiSelect(context);
                      },
                      child: Text('Select'),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Text('Status'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        _showStatusMultiSelect(context);
                      },
                      child: Text('select'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Text('Date'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(':'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: DropdownButton<String>(
                      itemHeight: 70,

                      style: TextStyle(
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.white,
                      // iconEnabledColor: Colors.black,

                      items: [
                        DropdownMenuItem<String>(
                          child: Text('Today'),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Yesterday'),
                          value: '2',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Last 7 days'),
                          value: '3',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Last 30 days'),
                          value: '4',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('This Month'),
                          value: '5',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Last Month'),
                          value: '6',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          _dateValue = value;
                          // checkboxValue = !checkboxValue;
                        });
                        _dateCalculated(_dateValue);
                      },
                      hint: Text(
                        'Select Item',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: _dateValue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          finalUrl = " ";
                          _dateValue = "1";
                          dateUrl = " ";
                          statusUrl = " ";
                          _marketplaceValue = '2';
                          marketPlaceurl = " ";
                          countryUrl = " ";
                        });
                      },
                      child: Text('clear Filters'),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        if (_marketplaceValue == '1') {
                          marketPlaceurl = 'channel_id%5B0%5D=3&';
                        }

                        if (_dateValue.trim() != '1') {
                          String finalto = dateFormat.format(this.to);
                          String finalFrom = dateFormat.format(this.from);

                          print('inside');
                          dateUrl = "to_date=$finalto&from_date=$finalFrom&";
                          print('inside');
                        }
                        if (statusUrl.trim().isNotEmpty) {
                          statusUrl = statusUrl.trim();
                        }
                        if (countryUrl.trim().isNotEmpty) {
                          countryUrl = countryUrl.trim();
                        }

                        finalUrl = marketPlaceurl.trim() +
                            countryUrl.trim() +
                            statusUrl.trim() +
                            dateUrl.trim();
                        finalUrl.trim().length == 0
                            ? Navigator.pop(context)
                            : print(finalUrl);
                        print(countryUrl);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings: RouteSettings(name: ROUTE_ORDERSHIPMENT),
                            builder: (context) =>
                                Orders(filterValue: 1, url: finalUrl),
                          ),
                        );
                      },
                      child: Text('Filter'),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);
  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog(
      {Key key, this.items, this.initialSelectedValues, this.title})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;
  final String title;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.title}'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}
