import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dava Takip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DavaTakipPage(),
    );
  }
}

class DavaTakipPage extends StatefulWidget {
  const DavaTakipPage({Key? key}) : super(key: key);

  @override
  _DavaTakipPageState createState() => _DavaTakipPageState();
}

class _DavaTakipPageState extends State<DavaTakipPage> {
  final _formKey = GlobalKey<FormState>();
  final _dosyaNoController = TextEditingController();
  final _davaciAdiController = TextEditingController();
  final _davaciAdresController = TextEditingController();
  final _davaciIletisimController = TextEditingController();
  final _davaciMeslegiController = TextEditingController();
  final _davaliAdiController = TextEditingController();
  final _davaliAdresController = TextEditingController();
  final _davaliIletisimController = TextEditingController();
  final _davaliMeslegiController = TextEditingController();
  final _davaninKonusuController = TextEditingController();
  final _davaBaslamaTarihiController = TextEditingController();
  String? _yetkiliMahkeme;
  String? _gorevliMahkeme;
  String? _mahkemeSirasi;
  DateTime? _davaBaslamaTarihi;
  String? _davaninAsamasi;

  List<String> _iller = ['İstanbul', 'Ankara', 'İzmir', 'Bursa', 'Antalya'];
  List<String> _davaninAsamasiList = ['Açık', 'Kapalı', 'Beklemede'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dava Takip'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              //child: Image.asset('assets/logo.png', width: 30, height: 30),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
              children: [
          TabBar(
          tabs: [
          Tab(text: 'Davacı/Davalı Bilgileri'),
          Tab(text: 'Dava Bilgileri'),
          ],
        ),
        Expanded(
        child: TabBarView(
        children: [
        Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    children: [
    TextFormField(
    decoration: InputDecoration(labelText: 'Dosya No'),
    controller: _dosyaNoController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Dosya No boş bırakılamaz';
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Davacı Adı'),
    controller: _davaciAdiController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Davacı Adı boş bırakılamaz';
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Davacı Adresi'),
    controller: _davaciAdresController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Davacı Adresi boş bırakılamaz';
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Davacı İletişim Bilgileri'),
    controller: _davaciIletisimController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Davacı İletişim Bilgileri boş bırakılamaz';
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Davacı Mesleği'),
    controller: _davaciMeslegiController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Davacı Mesleği boş bırakılamaz';
    }
    return null;
    },
    ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Davalı Adı'),
        controller: _davaliAdiController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Davalı Adı boş bırakılamaz';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Davalı Adresi'),
        controller: _davaliAdresController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Davalı Adresi boş bırakılamaz';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Davalı İletişim Bilgileri'),
        controller: _davaliIletisimController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Davalı İletişim Bilgileri boş bırakılamaz';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Davalı Mesleği'),
        controller: _davaliMeslegiController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Davalı Mesleği boş bırakılamaz';
          }
          return null;
        },
      ),
    ],
    ),
    ),
        ),
        Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    child: Column(
    children: [
    TextFormField(
    decoration: InputDecoration(labelText: 'Davanın Konusu'),
    controller: _davaninKonusuController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Davanın Konusu boş bırakılamaz';
    }
    return null;
    },
    ),
    DropdownButtonFormField(
    decoration: InputDecoration(labelText: 'Yetkili Mahkeme'),
    items: _iller.map((il) {
    return DropdownMenuItem(
    child: Text(il),
    value: il,
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    _yetkiliMahkeme = value;
    });
    },
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Yetkili Mahkeme boş bırakılamaz';
    }
    return null;
    },
    ),
    DropdownButtonFormField(
    decoration: InputDecoration(labelText: 'Görevli Mahkeme'),
    items: _iller.map((il) {
    return DropdownMenuItem(
    child: Text(il),
    value: il,
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    _gorevliMahkeme = value;
    });
    },
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Görevli Mahkeme boş bırakılamaz';
    }
    return null;
    },
    ),
    DropdownButtonFormField(
    decoration: InputDecoration(labelText: 'Mahkeme Sırası'),
    items: _iller.map((il) {
    return DropdownMenuItem(
    child: Text(il),
    value: il,
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    _mahkemeSirasi = value;
    });
    },
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Mahkeme Sırası boş bırakılamaz';
    }
    return null;
    },
    ),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'Dava Başlama Tarihi',
    ),
    controller: _davaBaslamaTarihiController,
    readOnly: true,
    onTap: () async {
    final selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000), // Adjust as needed (e.g., 1990)
    lastDate: DateTime.now(), // Allow selection of today's date
    );
    if (selectedDate != null) {
    setState(() {
    _davaBaslamaTarihi = selectedDate;
    _davaBaslamaTarihiController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    });
    }
    },
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Lütfen Dava Başlama Tarihini Seçin'; // More user-friendly message
    }
    return null;
    },
    ),
    DropdownButtonFormField(
    decoration: InputDecoration(labelText: 'Davanın Aşaması'),
    items: _davaninAsamasiList.map((asama) {
    return DropdownMenuItem(
    child: Text(asama),
    value: asama,
    );
    }).toList(),
      onChanged: (value) {
        setState(() {
          _davaninAsamasi = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Davanın Aşaması boş bırakılamaz';
        }
        return null;
      },
    ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('Dosya No: ${_dosyaNoController.text}');
            print('Davacı Adı: ${_davaciAdiController.text}');
            print('Davacı Adresi: ${_davaciAdresController.text}');
            print('Davacı Mesleği: ${_davaciMeslegiController.text}');
            print('Davalı Adı: ${_davaliAdiController.text}');
            print('Davalı Adresi: ${_davaliAdresController.text}');
            print('Davalı İletişim Bilgileri: ${_davaliIletisimController.text}');
            print('Davalı Mesleği: ${_davaliMeslegiController.text}');
            print('Davanın Konusu: ${_davaninKonusuController.text}');
            print('Yetkili Mahkeme: $_yetkiliMahkeme');
            print('Görevli Mahkeme: $_gorevliMahkeme');
            print('Mahkeme Sırası: $_mahkemeSirasi');
            print('Dava Başlama Tarihi: ${_davaBaslamaTarihiController.text}');
            print('Davanın Aşaması: $_davaninAsamasi');
          }
        },
        child: Text('Kaydet'),
      ),
    ],
    ),
    ),
        ),
        ],
        ),
        ),
              ],
          ),
        ),
    );
  }
}
