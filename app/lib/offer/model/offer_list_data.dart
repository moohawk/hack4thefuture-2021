class OfferListData {
  OfferListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.cost = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int cost;

  static List<OfferListData> offerList = <OfferListData>[
    OfferListData(
      // imagePath: '',
      titleTxt: 'При Боян',
      subTxt: 'Център, София',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      cost: 180,
    ),
    OfferListData(
      // imagePath: '',
      titleTxt: 'При Мери',
      subTxt: 'Лозенец, София',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      cost: 200,
    ),
    OfferListData(
      // imagePath: '',
      titleTxt: 'При Стефан',
      subTxt: ', London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      cost: 60,
    ),
    OfferListData(
      // imagePath: '',
      titleTxt: 'При Пепи',
      subTxt: 'Младост, София',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      cost: 170,
    ),
  ];
}
