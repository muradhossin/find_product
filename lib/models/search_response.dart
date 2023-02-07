class SearchResponse {
  SearchResponse({
      this.status, 
      this.data,});

  SearchResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;
SearchResponse copyWith({  String? status,
  Data? data,
}) => SearchResponse(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.categories, 
      this.products,});

  Data.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(json.fromJson(v));
      });
    }
    products = json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  List<dynamic>? categories;
  Products? products;
Data copyWith({  List<dynamic>? categories,
  Products? products,
}) => Data(  categories: categories ?? this.categories,
  products: products ?? this.products,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      map['products'] = products?.toJson();
    }
    return map;
  }

}

class Products {
  Products({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  num? count;
  String? next;
  dynamic previous;
  List<Results>? results;
Products copyWith({  num? count,
  String? next,
  dynamic previous,
  List<Results>? results,
}) => Products(  count: count ?? this.count,
  next: next ?? this.next,
  previous: previous ?? this.previous,
  results: results ?? this.results,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.id, 
      this.brand, 
      this.image, 
      this.charge, 
      this.images, 
      this.slug, 
      this.productName, 
      this.model, 
      this.commissionType, 
      this.amount, 
      this.tag, 
      this.description, 
      this.note, 
      this.embaddedVideoLink, 
      this.maximumOrder, 
      this.stock, 
      this.isBackOrder, 
      this.specification, 
      this.warranty, 
      this.preOrder, 
      this.productReview, 
      this.isSeller, 
      this.isPhone, 
      this.willShowEmi, 
      this.badge, 
      this.isActive, 
      this.sackEquivalent, 
      this.createdAt, 
      this.updatedAt, 
      this.language, 
      this.seller, 
      this.combo, 
      this.createdBy, 
      this.updatedBy, 
      this.category, 
      this.relatedProduct, 
      this.filterValue, 
      this.distributors,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    badge = json['badge'];
    isActive = json['is_active'];
    sackEquivalent = json['sack_equivalent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    seller = json['seller'];
    combo = json['combo'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    category = json['category'] != null ? json['category'].cast<num>() : [];
    if (json['related_product'] != null) {
      relatedProduct = [];
      json['related_product'].forEach((v) {
        relatedProduct?.add(json.fromJson(v));
      });
    }
    if (json['filter_value'] != null) {
      filterValue = [];
      json['filter_value'].forEach((v) {
        filterValue?.add(json.fromJson(v));
      });
    }
    if (json['distributors'] != null) {
      distributors = [];
      json['distributors'].forEach((v) {
        distributors?.add(json.fromJson(v));
      });
    }
  }
  num? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  num? maximumOrder;
  num? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  num? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  dynamic badge;
  bool? isActive;
  String? sackEquivalent;
  String? createdAt;
  String? updatedAt;
  dynamic language;
  String? seller;
  dynamic combo;
  String? createdBy;
  dynamic updatedBy;
  List<num>? category;
  List<dynamic>? relatedProduct;
  List<dynamic>? filterValue;
  List<dynamic>? distributors;
Results copyWith({  num? id,
  Brand? brand,
  String? image,
  Charge? charge,
  List<Images>? images,
  String? slug,
  String? productName,
  String? model,
  String? commissionType,
  String? amount,
  String? tag,
  String? description,
  String? note,
  String? embaddedVideoLink,
  num? maximumOrder,
  num? stock,
  bool? isBackOrder,
  String? specification,
  String? warranty,
  bool? preOrder,
  num? productReview,
  bool? isSeller,
  bool? isPhone,
  bool? willShowEmi,
  dynamic badge,
  bool? isActive,
  String? sackEquivalent,
  String? createdAt,
  String? updatedAt,
  dynamic language,
  String? seller,
  dynamic combo,
  String? createdBy,
  dynamic updatedBy,
  List<num>? category,
  List<dynamic>? relatedProduct,
  List<dynamic>? filterValue,
  List<dynamic>? distributors,
}) => Results(  id: id ?? this.id,
  brand: brand ?? this.brand,
  image: image ?? this.image,
  charge: charge ?? this.charge,
  images: images ?? this.images,
  slug: slug ?? this.slug,
  productName: productName ?? this.productName,
  model: model ?? this.model,
  commissionType: commissionType ?? this.commissionType,
  amount: amount ?? this.amount,
  tag: tag ?? this.tag,
  description: description ?? this.description,
  note: note ?? this.note,
  embaddedVideoLink: embaddedVideoLink ?? this.embaddedVideoLink,
  maximumOrder: maximumOrder ?? this.maximumOrder,
  stock: stock ?? this.stock,
  isBackOrder: isBackOrder ?? this.isBackOrder,
  specification: specification ?? this.specification,
  warranty: warranty ?? this.warranty,
  preOrder: preOrder ?? this.preOrder,
  productReview: productReview ?? this.productReview,
  isSeller: isSeller ?? this.isSeller,
  isPhone: isPhone ?? this.isPhone,
  willShowEmi: willShowEmi ?? this.willShowEmi,
  badge: badge ?? this.badge,
  isActive: isActive ?? this.isActive,
  sackEquivalent: sackEquivalent ?? this.sackEquivalent,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  language: language ?? this.language,
  seller: seller ?? this.seller,
  combo: combo ?? this.combo,
  createdBy: createdBy ?? this.createdBy,
  updatedBy: updatedBy ?? this.updatedBy,
  category: category ?? this.category,
  relatedProduct: relatedProduct ?? this.relatedProduct,
  filterValue: filterValue ?? this.filterValue,
  distributors: distributors ?? this.distributors,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['image'] = image;
    if (charge != null) {
      map['charge'] = charge?.toJson();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['slug'] = slug;
    map['product_name'] = productName;
    map['model'] = model;
    map['commission_type'] = commissionType;
    map['amount'] = amount;
    map['tag'] = tag;
    map['description'] = description;
    map['note'] = note;
    map['embadded_video_link'] = embaddedVideoLink;
    map['maximum_order'] = maximumOrder;
    map['stock'] = stock;
    map['is_back_order'] = isBackOrder;
    map['specification'] = specification;
    map['warranty'] = warranty;
    map['pre_order'] = preOrder;
    map['product_review'] = productReview;
    map['is_seller'] = isSeller;
    map['is_phone'] = isPhone;
    map['will_show_emi'] = willShowEmi;
    map['badge'] = badge;
    map['is_active'] = isActive;
    map['sack_equivalent'] = sackEquivalent;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['language'] = language;
    map['seller'] = seller;
    map['combo'] = combo;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['category'] = category;
    if (relatedProduct != null) {
      map['related_product'] = relatedProduct?.map((v) => v.toJson()).toList();
    }
    if (filterValue != null) {
      map['filter_value'] = filterValue?.map((v) => v.toJson()).toList();
    }
    if (distributors != null) {
      map['distributors'] = distributors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Images {
  Images({
      this.id, 
      this.image, 
      this.isPrimary, 
      this.product,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }
  num? id;
  String? image;
  bool? isPrimary;
  num? product;
Images copyWith({  num? id,
  String? image,
  bool? isPrimary,
  num? product,
}) => Images(  id: id ?? this.id,
  image: image ?? this.image,
  isPrimary: isPrimary ?? this.isPrimary,
  product: product ?? this.product,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['is_primary'] = isPrimary;
    map['product'] = product;
    return map;
  }

}

class Charge {
  Charge({
      this.bookingPrice, 
      this.currentCharge, 
      this.discountCharge, 
      this.sellingPrice, 
      this.profit, 
      this.isEvent, 
      this.eventId, 
      this.highlight, 
      this.highlightId, 
      this.groupping, 
      this.grouppingId, 
      this.campaignSectionId, 
      this.campaignSection, 
      this.message,});

  Charge.fromJson(dynamic json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = json['discount_charge'];
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
  }
  num? bookingPrice;
  num? currentCharge;
  dynamic discountCharge;
  num? sellingPrice;
  num? profit;
  bool? isEvent;
  dynamic eventId;
  bool? highlight;
  dynamic highlightId;
  bool? groupping;
  dynamic grouppingId;
  dynamic campaignSectionId;
  bool? campaignSection;
  dynamic message;
Charge copyWith({  num? bookingPrice,
  num? currentCharge,
  dynamic discountCharge,
  num? sellingPrice,
  num? profit,
  bool? isEvent,
  dynamic eventId,
  bool? highlight,
  dynamic highlightId,
  bool? groupping,
  dynamic grouppingId,
  dynamic campaignSectionId,
  bool? campaignSection,
  dynamic message,
}) => Charge(  bookingPrice: bookingPrice ?? this.bookingPrice,
  currentCharge: currentCharge ?? this.currentCharge,
  discountCharge: discountCharge ?? this.discountCharge,
  sellingPrice: sellingPrice ?? this.sellingPrice,
  profit: profit ?? this.profit,
  isEvent: isEvent ?? this.isEvent,
  eventId: eventId ?? this.eventId,
  highlight: highlight ?? this.highlight,
  highlightId: highlightId ?? this.highlightId,
  groupping: groupping ?? this.groupping,
  grouppingId: grouppingId ?? this.grouppingId,
  campaignSectionId: campaignSectionId ?? this.campaignSectionId,
  campaignSection: campaignSection ?? this.campaignSection,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booking_price'] = bookingPrice;
    map['current_charge'] = currentCharge;
    map['discount_charge'] = discountCharge;
    map['selling_price'] = sellingPrice;
    map['profit'] = profit;
    map['is_event'] = isEvent;
    map['event_id'] = eventId;
    map['highlight'] = highlight;
    map['highlight_id'] = highlightId;
    map['groupping'] = groupping;
    map['groupping_id'] = grouppingId;
    map['campaign_section_id'] = campaignSectionId;
    map['campaign_section'] = campaignSection;
    map['message'] = message;
    return map;
  }

}

class Brand {
  Brand({
      this.name, 
      this.image, 
      this.headerImage, 
      this.slug,});

  Brand.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }
  String? name;
  String? image;
  dynamic headerImage;
  String? slug;
Brand copyWith({  String? name,
  String? image,
  dynamic headerImage,
  String? slug,
}) => Brand(  name: name ?? this.name,
  image: image ?? this.image,
  headerImage: headerImage ?? this.headerImage,
  slug: slug ?? this.slug,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['header_image'] = headerImage;
    map['slug'] = slug;
    return map;
  }

}