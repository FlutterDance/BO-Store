
import 'package:store/extensions/color_hex.dart';
import 'package:store/models/product.dart';

/// 由于时间关系，我事先创建好模型
/// 分类模型
class Category {

  /// 分类名称
  String name;

  /// 分类图标
  String image;

  /// 分类简介
  String intro;

  /// 该分类下有哪些产品
  List<Product> products;

  Category({
    required this.name,
    required this.image,
    required this.intro,
    required this.products
  });

  /// 扬声器分类
  static Category speak() {
    return Category(
        name: '扬声器',
        image: 'assets/images/icon_category_speaker.png',
        intro: '100+ 款产品',
        products: [
          Product(
            name: 'Beosound 1',
            price: 1900,
            image: 'assets/images/products/icon_beosound_1_natural_transparre'
                'nt_image_1.webp',
            styles: [
              ProductStyle(color: HexColor.fromHex('#DADADA'), image: 'assets'
                  '/images/products/icon_beosound_1_natural_transparrent_image_'
                  '1.webp'),
              ProductStyle(color: HexColor.fromHex('#A6976B'), image: 'assets/im'
                  'ages/products/icon_beosound_1_brass_transparrent_image_1'
                  '.webp'),
              ProductStyle(color: HexColor.fromHex('#7B644A'), image: 'assets/images/products/'
                  'icon_beosound_1_bronze_transparrent_image_1.webp')
            ],
            title: '音乐无处不在 – 将它放在任何地方',
            description: '把它放在任何地方。配对或单独播放。具有 360 度声音的便携式无线扬声器，专为灵活的音乐流媒体而设计。',
            category: '联动扬声器',
          ),
          Product(name: 'BEOLIT 20', price: 3799, image: 'assets/images/products/icon_BL20_ant_Hero_2.webp',
              styles:
              [
                ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/images/products/icon_BL20_ant_Hero_2.webp'),
                ProductStyle(color: HexColor.fromHex('#D0D0D2'), image: 'assets/images/products/icon_BL20_grey_hero2.webp',),
              ], title: 'Bang & Olufsen 标志性音效', description: 'Bang & Olufsen 工程师综合运用强大的功放和驱动单元，打造出 True360 音效，无论周围环境如何，都会为您带来自然真实的音效和优异频散效果。Beolit 20 呈现 37–20.000Hz 的频段，打造更加丰富、更令人满意的低音范围。',
              category: '强大的蓝牙扬声器'),

          Product(name: 'BEOSOUND EXPLORE', price: 1299, image: 'assets/images/products/icon_back_with_carabiner_black.webp',
              styles:
              [
                ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/imag'
                    'es/products/icon_back_with_carabiner_black.webp'),
                ProductStyle(color: HexColor.fromHex('#D0D0D2'), image: 'assets/images/products/icon_back_carabiner_white.webp',),
                ProductStyle(color: HexColor.fromHex('#517B6C'), image: 'assets/images/products/icon_back_with_carabiner_green.webp',),
              ], title: '全向声音，探险首选', description: '便于携带。坚固耐用。随时随地，伴您左右。无论去哪里探险，Beos'
                  'ound Explore 的无损音质都会带给您音乐的享受。借助坚硬、耐刮擦、完全防尘防水的外壳，长久佩戴也不会产生磨损。', category: '耐用的户外蓝牙扬声器'),
          Product(name: 'BEOSOUND A1 II', price: 1599, image: 'assets/images/pro'
              'ducts/icon_Beosound_A1_Natural__hero_1.webp', styles:
          [
            ProductStyle(color: HexColor.fromHex('#D0D0D2'), image: 'assets/images/products/icon_Beosound_A1_Natural__hero_1.webp',),
            ProductStyle(color: HexColor.fromHex('#D9CAAA'), image: 'assets/images/products/icon_A1_gold_1.webp',),
            ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/images/products/icon_Beosound_a1_black_hero.webp')
          ], title: '为此时此刻营造美感', description: '不论您到何处，与谁会面，或准备做什么事，都可为此时此刻营造美感'
              '。进阶版的 Beosound A1 是精致化的音乐性佳作。专为周遭好友们同乐设计，数小时不间断。', category: '扬声'
              '器'),

        ]
    );
  }

  /// 耳机分类
  static Category headphone() {
    return Category(
        name: '耳机',
        image: 'assets/images/products/icon_HX_black_Hero.webp',
        intro: '100+ 款产品',
        products: [
          Product(
            name: 'Beoplay HX',
            price: 3498,
            image: 'assets/images/products/icon_HX_Timber_Hero.webp',
            styles: [
              ProductStyle(color: HexColor.fromHex('#AC6E48'), image: 'assets/images/products/icon_HX_Timber_Hero.webp'),
              ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/images/products/icon_HX_black_Hero.webp'),
              ProductStyle(color: HexColor.fromHex('#E5DDD6'), image: 'assets/images/products/icon_HX_sand_Hero.webp')
            ],
            title: '打造专属空间，静享音效体验',
            description: 'Beoplay HX 采用最新一代的自适应主动降噪技术，可以有效补偿并消除背景噪音。该产品采用优质材料和贴合式设计，可确保有效隔绝外界声音，从而让您沉浸在自己的聆听体验中，是居家办公并免受家人干扰的理想选择。配有 4 个专用麦克风，可确保您的每一次通话都无比清晰。',
            category: '舒适的 ANC 头戴式耳机',
          ),
          Product(
            name: 'BEOPLAY PORTAL',
            price: 3799,
            image: 'assets/images/products/icon_Portal_Black_1.webp',
            styles: [
              ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/images/products/icon_Portal_Black_1.webp'),
              ProductStyle(color: HexColor.fromHex('#4E5764'), image: 'assets/images/products/icon_Portal_Navy_1.webp'),
              ProductStyle(color: HexColor.fromHex('#BAB9A9'), image: 'assets/images/products/icon_Portal_Grey_1.webp'),
            ],
            title: '为游戏而设计。设计改变生活',
            description: '通过自适应主动降噪提供强大而真实的声音体验、舒适、轻便的构造、令人印象深刻的通话质量和长达 35 小时的播放时间。',
            category: '无线游戏头戴式耳机',
          ),
          Product(
            name: 'BEOPLAY H95',
            price: 6099,
            image: 'assets/images/products/icon_H95_berluti_1.webp',
            styles: [
              ProductStyle(color: HexColor.fromHex('3F2A14'), image: 'assets/images/products/icon_H95_berluti_1.webp'),
              ProductStyle(color: HexColor.fromHex('DFCAA7'), image: 'assets/'
                  'images/products/icon_H95_gold_hero.webp'),
              ProductStyle(color: HexColor.fromHex('3A3A3A'), image: 'assets/images/products/icon_h95_black_hero.webp'),
              ProductStyle(color: HexColor.fromHex('BAB9A9'), image: 'assets/images/products/icon_H95_hero.webp')
            ],
            title: '无线 Bang & Olufsen 经典音效',
            description: '探索世界一流的无线 Bang & Olufsen Signature Sound with Earset, 由 20 世纪 90 年代原装耳机的著名 B&O 声音工程师调音。 人体工程学在退出耳塞的声音质量方面起着重要作用，耳机的可定制定位完美了舒适、环境和强大的声音的平衡。',
            category: '自适应 ANC 头戴式耳机',
          ),
          Product(
            name: 'BEOPLAY E8 SPORT',
            price: 2699,
            image: 'assets/images/products/E8_sport_green_1.webp',
            styles: [
              ProductStyle(color: HexColor.fromHex('9EDADF'), image: 'assets/images/products/E8_sport_green_1.webp'),
              ProductStyle(color: HexColor.fromHex('000000'), image: 'assets/images/products/E8_Sport_hero_black.webp'),
            ],
            title: '音乐伴您左右',
            description: '音乐总能触动我们的心弦。聆听澎湃的音乐，感受源源不竭的力量。Bang & Olufsen '
                '的音频工程师团队专业水准全球领先，致力于确保 Beoplay E8 Sport 呈现出高性能音频，助您行走千里。',
            category: '功能强大的蓝牙运动耳机',
          )
        ]
    );
  }

}

