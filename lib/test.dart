import 'package:milyoner/sorular.dart';

class Test {
  int _soruIndex = 0;
  List<Sorular> _SoruListesi = [
    Sorular(
      soruMetni:
          '"Tosun Paşa" adlı filminde, Leylanın babası ve İskenderiye Beyi olan karakter Daver Beydir.',
      yanit: true,
    ),
    Sorular(
      soruMetni:
          'Günümüzde kullanılan miladi takvime göre, M.Ö. 1 Ocak 1 tarihinde doğan birinin, M.S. 1 Ocak 1 tarihi 2.doğum yıl dönümüdür',
      yanit: false,
    ),
    Sorular(
      soruMetni: 'Sancho Panza hangi romandaki yan karakter Moby Dicktir.',
      yanit: false,
    ),
    Sorular(
      soruMetni: 'Türkiyede Gelibolu adında bir yarımada vardır',
      yanit: true,
    ),
    Sorular(
      soruMetni:
          'Halil İnalcıkın "Devlet-i Aliyye" adlı kitaplarında anlattığı, kitaplara adını da veren devlet Osmanlı Devletidir.',
      yanit: true,
    ),
    Sorular(
      soruMetni:
          'Avustralya Oğlak Dönencesi üzerinde toprağı bulunan ülkelerden biridir.',
      yanit: false,
    ),
    Sorular(
      soruMetni: 'Enstrüman onaran veya yapıp satan kişiye "lutiye" denir.',
      yanit: true,
    ),
    Sorular(
      soruMetni:
          'Gırnata Emirliğinden kalma tarihi yapıları yerinde inceleyen biri Sina Yarımadasındadır.',
      yanit: false,
    ),
    Sorular(
      soruMetni:
          'Orta oyununda sahnedeki iki ana karakterden biri Kavuklu iken diğeri Külhanbeyidir.',
      yanit: false,
    ),
    Sorular(
      soruMetni:
          '"Meyve suyu ile şekerli su karıştırılarak yapılan içecek" Şerbettir',
      yanit: true,
    ),
    Sorular(
        soruMetni:
            "Sherlock Holmes'un birçok macerasında yanında olan yakın dostu ve yardımcısı Dr.Watson'dır.",
        yanit: true)
  ];

  String getSoruMetni() {
    return _SoruListesi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti_1() {
    return _SoruListesi[_soruIndex].yanit;
  }

  void soruArttir() {
    if (_soruIndex + 1 < _SoruListesi.length) {
      _soruIndex++;
    }
  }

  bool soruBitir() {
    if (_soruIndex + 1 >= _SoruListesi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}
