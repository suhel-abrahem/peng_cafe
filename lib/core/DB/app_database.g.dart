// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserRule, int> role =
      GeneratedColumn<int>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(UserRule.cashier.index),
      ).withConverter<UserRule>($UsersTableTable.$converterrole);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, email, name, role, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: $UsersTableTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}role'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRule, int, int> $converterrole =
      const EnumIndexConverter<UserRule>(UserRule.values);
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int id;
  final String email;
  final String name;
  final UserRule role;
  final DateTime createdAt;
  const UsersTableData({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['name'] = Variable<String>(name);
    {
      map['role'] = Variable<int>($UsersTableTable.$converterrole.toSql(role));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      email: Value(email),
      name: Value(name),
      role: Value(role),
      createdAt: Value(createdAt),
    );
  }

  factory UsersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      role: $UsersTableTable.$converterrole.fromJson(
        serializer.fromJson<int>(json['role']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<int>(
        $UsersTableTable.$converterrole.toJson(role),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UsersTableData copyWith({
    int? id,
    String? email,
    String? name,
    UserRule? role,
    DateTime? createdAt,
  }) => UsersTableData(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    role: role ?? this.role,
    createdAt: createdAt ?? this.createdAt,
  );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, name, role, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.email == this.email &&
          other.name == this.name &&
          other.role == this.role &&
          other.createdAt == this.createdAt);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> name;
  final Value<UserRule> role;
  final Value<DateTime> createdAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String name,
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : email = Value(email),
       name = Value(name);
  static Insertable<UsersTableData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? name,
    Expression<int>? role,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersTableCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String>? name,
    Value<UserRule>? role,
    Value<DateTime>? createdAt,
  }) {
    return UsersTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(
        $UsersTableTable.$converterrole.toSql(role.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  @override
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameKuMeta = const VerificationMeta('nameKu');
  @override
  late final GeneratedColumn<String> nameKu = GeneratedColumn<String>(
    'name_ku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionArMeta = const VerificationMeta(
    'descriptionAr',
  );
  @override
  late final GeneratedColumn<String> descriptionAr = GeneratedColumn<String>(
    'description_ar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionEnMeta = const VerificationMeta(
    'descriptionEn',
  );
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
    'description_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionKuMeta = const VerificationMeta(
    'descriptionKu',
  );
  @override
  late final GeneratedColumn<String> descriptionKu = GeneratedColumn<String>(
    'description_ku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costPriceMeta = const VerificationMeta(
    'costPrice',
  );
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
    'cost_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ProductTypeEnum, int>
  productType = GeneratedColumn<int>(
    'product_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(ProductTypeEnum.foodAndBeverage.index),
  ).withConverter<ProductTypeEnum>($ProductsTableTable.$converterproductType);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nameAr,
    nameEn,
    nameKu,
    descriptionAr,
    descriptionEn,
    descriptionKu,
    imagePath,
    costPrice,
    price,
    discount,
    quantity,
    productType,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('name_ku')) {
      context.handle(
        _nameKuMeta,
        nameKu.isAcceptableOrUnknown(data['name_ku']!, _nameKuMeta),
      );
    }
    if (data.containsKey('description_ar')) {
      context.handle(
        _descriptionArMeta,
        descriptionAr.isAcceptableOrUnknown(
          data['description_ar']!,
          _descriptionArMeta,
        ),
      );
    }
    if (data.containsKey('description_en')) {
      context.handle(
        _descriptionEnMeta,
        descriptionEn.isAcceptableOrUnknown(
          data['description_en']!,
          _descriptionEnMeta,
        ),
      );
    }
    if (data.containsKey('description_ku')) {
      context.handle(
        _descriptionKuMeta,
        descriptionKu.isAcceptableOrUnknown(
          data['description_ku']!,
          _descriptionKuMeta,
        ),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('cost_price')) {
      context.handle(
        _costPriceMeta,
        costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      nameKu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ku'],
      ),
      descriptionAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_ar'],
      ),
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
      ),
      descriptionKu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_ku'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      costPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      ),
      productType: $ProductsTableTable.$converterproductType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}product_type'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProductTypeEnum, int, int> $converterproductType =
      const EnumIndexConverter<ProductTypeEnum>(ProductTypeEnum.values);
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  final int id;
  final String nameAr;
  final String? nameEn;
  final String? nameKu;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? descriptionKu;
  final String? imagePath;
  final double? costPrice;
  final double price;
  final double? discount;
  final double? quantity;
  final ProductTypeEnum productType;
  final DateTime createdAt;
  const ProductsTableData({
    required this.id,
    required this.nameAr,
    this.nameEn,
    this.nameKu,
    this.descriptionAr,
    this.descriptionEn,
    this.descriptionKu,
    this.imagePath,
    this.costPrice,
    required this.price,
    this.discount,
    this.quantity,
    required this.productType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ar'] = Variable<String>(nameAr);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || nameKu != null) {
      map['name_ku'] = Variable<String>(nameKu);
    }
    if (!nullToAbsent || descriptionAr != null) {
      map['description_ar'] = Variable<String>(descriptionAr);
    }
    if (!nullToAbsent || descriptionEn != null) {
      map['description_en'] = Variable<String>(descriptionEn);
    }
    if (!nullToAbsent || descriptionKu != null) {
      map['description_ku'] = Variable<String>(descriptionKu);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    {
      map['product_type'] = Variable<int>(
        $ProductsTableTable.$converterproductType.toSql(productType),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      nameAr: Value(nameAr),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      nameKu: nameKu == null && nullToAbsent
          ? const Value.absent()
          : Value(nameKu),
      descriptionAr: descriptionAr == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionAr),
      descriptionEn: descriptionEn == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionEn),
      descriptionKu: descriptionKu == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionKu),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      price: Value(price),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      productType: Value(productType),
      createdAt: Value(createdAt),
    );
  }

  factory ProductsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      nameAr: serializer.fromJson<String>(json['nameAr']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      nameKu: serializer.fromJson<String?>(json['nameKu']),
      descriptionAr: serializer.fromJson<String?>(json['descriptionAr']),
      descriptionEn: serializer.fromJson<String?>(json['descriptionEn']),
      descriptionKu: serializer.fromJson<String?>(json['descriptionKu']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      costPrice: serializer.fromJson<double?>(json['costPrice']),
      price: serializer.fromJson<double>(json['price']),
      discount: serializer.fromJson<double?>(json['discount']),
      quantity: serializer.fromJson<double?>(json['quantity']),
      productType: $ProductsTableTable.$converterproductType.fromJson(
        serializer.fromJson<int>(json['productType']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameAr': serializer.toJson<String>(nameAr),
      'nameEn': serializer.toJson<String?>(nameEn),
      'nameKu': serializer.toJson<String?>(nameKu),
      'descriptionAr': serializer.toJson<String?>(descriptionAr),
      'descriptionEn': serializer.toJson<String?>(descriptionEn),
      'descriptionKu': serializer.toJson<String?>(descriptionKu),
      'imagePath': serializer.toJson<String?>(imagePath),
      'costPrice': serializer.toJson<double?>(costPrice),
      'price': serializer.toJson<double>(price),
      'discount': serializer.toJson<double?>(discount),
      'quantity': serializer.toJson<double?>(quantity),
      'productType': serializer.toJson<int>(
        $ProductsTableTable.$converterproductType.toJson(productType),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProductsTableData copyWith({
    int? id,
    String? nameAr,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> nameKu = const Value.absent(),
    Value<String?> descriptionAr = const Value.absent(),
    Value<String?> descriptionEn = const Value.absent(),
    Value<String?> descriptionKu = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<double?> costPrice = const Value.absent(),
    double? price,
    Value<double?> discount = const Value.absent(),
    Value<double?> quantity = const Value.absent(),
    ProductTypeEnum? productType,
    DateTime? createdAt,
  }) => ProductsTableData(
    id: id ?? this.id,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    nameKu: nameKu.present ? nameKu.value : this.nameKu,
    descriptionAr: descriptionAr.present
        ? descriptionAr.value
        : this.descriptionAr,
    descriptionEn: descriptionEn.present
        ? descriptionEn.value
        : this.descriptionEn,
    descriptionKu: descriptionKu.present
        ? descriptionKu.value
        : this.descriptionKu,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    costPrice: costPrice.present ? costPrice.value : this.costPrice,
    price: price ?? this.price,
    discount: discount.present ? discount.value : this.discount,
    quantity: quantity.present ? quantity.value : this.quantity,
    productType: productType ?? this.productType,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameKu: data.nameKu.present ? data.nameKu.value : this.nameKu,
      descriptionAr: data.descriptionAr.present
          ? data.descriptionAr.value
          : this.descriptionAr,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      descriptionKu: data.descriptionKu.present
          ? data.descriptionKu.value
          : this.descriptionKu,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      price: data.price.present ? data.price.value : this.price,
      discount: data.discount.present ? data.discount.value : this.discount,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      productType: data.productType.present
          ? data.productType.value
          : this.productType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameKu: $nameKu, ')
          ..write('descriptionAr: $descriptionAr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('descriptionKu: $descriptionKu, ')
          ..write('imagePath: $imagePath, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('quantity: $quantity, ')
          ..write('productType: $productType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nameAr,
    nameEn,
    nameKu,
    descriptionAr,
    descriptionEn,
    descriptionKu,
    imagePath,
    costPrice,
    price,
    discount,
    quantity,
    productType,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.id == this.id &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.nameKu == this.nameKu &&
          other.descriptionAr == this.descriptionAr &&
          other.descriptionEn == this.descriptionEn &&
          other.descriptionKu == this.descriptionKu &&
          other.imagePath == this.imagePath &&
          other.costPrice == this.costPrice &&
          other.price == this.price &&
          other.discount == this.discount &&
          other.quantity == this.quantity &&
          other.productType == this.productType &&
          other.createdAt == this.createdAt);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<int> id;
  final Value<String> nameAr;
  final Value<String?> nameEn;
  final Value<String?> nameKu;
  final Value<String?> descriptionAr;
  final Value<String?> descriptionEn;
  final Value<String?> descriptionKu;
  final Value<String?> imagePath;
  final Value<double?> costPrice;
  final Value<double> price;
  final Value<double?> discount;
  final Value<double?> quantity;
  final Value<ProductTypeEnum> productType;
  final Value<DateTime> createdAt;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameKu = const Value.absent(),
    this.descriptionAr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.descriptionKu = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.quantity = const Value.absent(),
    this.productType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required String nameAr,
    this.nameEn = const Value.absent(),
    this.nameKu = const Value.absent(),
    this.descriptionAr = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.descriptionKu = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.costPrice = const Value.absent(),
    required double price,
    this.discount = const Value.absent(),
    this.quantity = const Value.absent(),
    this.productType = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : nameAr = Value(nameAr),
       price = Value(price);
  static Insertable<ProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? nameKu,
    Expression<String>? descriptionAr,
    Expression<String>? descriptionEn,
    Expression<String>? descriptionKu,
    Expression<String>? imagePath,
    Expression<double>? costPrice,
    Expression<double>? price,
    Expression<double>? discount,
    Expression<double>? quantity,
    Expression<int>? productType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (nameKu != null) 'name_ku': nameKu,
      if (descriptionAr != null) 'description_ar': descriptionAr,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (descriptionKu != null) 'description_ku': descriptionKu,
      if (imagePath != null) 'image_path': imagePath,
      if (costPrice != null) 'cost_price': costPrice,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (quantity != null) 'quantity': quantity,
      if (productType != null) 'product_type': productType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nameAr,
    Value<String?>? nameEn,
    Value<String?>? nameKu,
    Value<String?>? descriptionAr,
    Value<String?>? descriptionEn,
    Value<String?>? descriptionKu,
    Value<String?>? imagePath,
    Value<double?>? costPrice,
    Value<double>? price,
    Value<double?>? discount,
    Value<double?>? quantity,
    Value<ProductTypeEnum>? productType,
    Value<DateTime>? createdAt,
  }) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      nameKu: nameKu ?? this.nameKu,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionKu: descriptionKu ?? this.descriptionKu,
      imagePath: imagePath ?? this.imagePath,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      quantity: quantity ?? this.quantity,
      productType: productType ?? this.productType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameKu.present) {
      map['name_ku'] = Variable<String>(nameKu.value);
    }
    if (descriptionAr.present) {
      map['description_ar'] = Variable<String>(descriptionAr.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (descriptionKu.present) {
      map['description_ku'] = Variable<String>(descriptionKu.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (productType.present) {
      map['product_type'] = Variable<int>(
        $ProductsTableTable.$converterproductType.toSql(productType.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameKu: $nameKu, ')
          ..write('descriptionAr: $descriptionAr, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('descriptionKu: $descriptionKu, ')
          ..write('imagePath: $imagePath, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('quantity: $quantity, ')
          ..write('productType: $productType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTableTable extends OrderItemsTable
    with TableInfo<$OrderItemsTableTable, OrderItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES products(id)',
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TableTypeEnum, int> tableType =
      GeneratedColumn<int>(
        'table_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(TableTypeEnum.cafe.index),
      ).withConverter<TableTypeEnum>($OrderItemsTableTable.$convertertableType);
  static const VerificationMeta _tableNumberMeta = const VerificationMeta(
    'tableNumber',
  );
  @override
  late final GeneratedColumn<int> tableNumber = GeneratedColumn<int>(
    'table_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<OrderTypeEnum, int> orderType =
      GeneratedColumn<int>(
        'order_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(OrderTypeEnum.dineIn.index),
      ).withConverter<OrderTypeEnum>($OrderItemsTableTable.$converterorderType);
  @override
  late final GeneratedColumnWithTypeConverter<ProductTypeEnum, int>
  productType = GeneratedColumn<int>(
    'product_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(ProductTypeEnum.foodAndBeverage.index),
  ).withConverter<ProductTypeEnum>($OrderItemsTableTable.$converterproductType);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    productId,
    quantity,
    tableType,
    tableNumber,
    price,
    discount,
    total,
    orderType,
    productType,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('table_number')) {
      context.handle(
        _tableNumberMeta,
        tableNumber.isAcceptableOrUnknown(
          data['table_number']!,
          _tableNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tableNumberMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      tableType: $OrderItemsTableTable.$convertertableType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}table_type'],
        )!,
      ),
      tableNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}table_number'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      ),
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
      orderType: $OrderItemsTableTable.$converterorderType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}order_type'],
        )!,
      ),
      productType: $OrderItemsTableTable.$converterproductType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}product_type'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $OrderItemsTableTable createAlias(String alias) {
    return $OrderItemsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TableTypeEnum, int, int> $convertertableType =
      const EnumIndexConverter<TableTypeEnum>(TableTypeEnum.values);
  static JsonTypeConverter2<OrderTypeEnum, int, int> $converterorderType =
      const EnumIndexConverter<OrderTypeEnum>(OrderTypeEnum.values);
  static JsonTypeConverter2<ProductTypeEnum, int, int> $converterproductType =
      const EnumIndexConverter<ProductTypeEnum>(ProductTypeEnum.values);
}

class OrderItemsTableData extends DataClass
    implements Insertable<OrderItemsTableData> {
  final int id;
  final int orderId;
  final int productId;
  final double quantity;
  final TableTypeEnum tableType;
  final int tableNumber;
  final double price;
  final double? discount;
  final double total;
  final OrderTypeEnum orderType;
  final ProductTypeEnum productType;
  final DateTime createdAt;
  const OrderItemsTableData({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.tableType,
    required this.tableNumber,
    required this.price,
    this.discount,
    required this.total,
    required this.orderType,
    required this.productType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    {
      map['table_type'] = Variable<int>(
        $OrderItemsTableTable.$convertertableType.toSql(tableType),
      );
    }
    map['table_number'] = Variable<int>(tableNumber);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    map['total'] = Variable<double>(total);
    {
      map['order_type'] = Variable<int>(
        $OrderItemsTableTable.$converterorderType.toSql(orderType),
      );
    }
    {
      map['product_type'] = Variable<int>(
        $OrderItemsTableTable.$converterproductType.toSql(productType),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrderItemsTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsTableCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      quantity: Value(quantity),
      tableType: Value(tableType),
      tableNumber: Value(tableNumber),
      price: Value(price),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      total: Value(total),
      orderType: Value(orderType),
      productType: Value(productType),
      createdAt: Value(createdAt),
    );
  }

  factory OrderItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      tableType: $OrderItemsTableTable.$convertertableType.fromJson(
        serializer.fromJson<int>(json['tableType']),
      ),
      tableNumber: serializer.fromJson<int>(json['tableNumber']),
      price: serializer.fromJson<double>(json['price']),
      discount: serializer.fromJson<double?>(json['discount']),
      total: serializer.fromJson<double>(json['total']),
      orderType: $OrderItemsTableTable.$converterorderType.fromJson(
        serializer.fromJson<int>(json['orderType']),
      ),
      productType: $OrderItemsTableTable.$converterproductType.fromJson(
        serializer.fromJson<int>(json['productType']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'tableType': serializer.toJson<int>(
        $OrderItemsTableTable.$convertertableType.toJson(tableType),
      ),
      'tableNumber': serializer.toJson<int>(tableNumber),
      'price': serializer.toJson<double>(price),
      'discount': serializer.toJson<double?>(discount),
      'total': serializer.toJson<double>(total),
      'orderType': serializer.toJson<int>(
        $OrderItemsTableTable.$converterorderType.toJson(orderType),
      ),
      'productType': serializer.toJson<int>(
        $OrderItemsTableTable.$converterproductType.toJson(productType),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OrderItemsTableData copyWith({
    int? id,
    int? orderId,
    int? productId,
    double? quantity,
    TableTypeEnum? tableType,
    int? tableNumber,
    double? price,
    Value<double?> discount = const Value.absent(),
    double? total,
    OrderTypeEnum? orderType,
    ProductTypeEnum? productType,
    DateTime? createdAt,
  }) => OrderItemsTableData(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
    tableType: tableType ?? this.tableType,
    tableNumber: tableNumber ?? this.tableNumber,
    price: price ?? this.price,
    discount: discount.present ? discount.value : this.discount,
    total: total ?? this.total,
    orderType: orderType ?? this.orderType,
    productType: productType ?? this.productType,
    createdAt: createdAt ?? this.createdAt,
  );
  OrderItemsTableData copyWithCompanion(OrderItemsTableCompanion data) {
    return OrderItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      tableType: data.tableType.present ? data.tableType.value : this.tableType,
      tableNumber: data.tableNumber.present
          ? data.tableNumber.value
          : this.tableNumber,
      price: data.price.present ? data.price.value : this.price,
      discount: data.discount.present ? data.discount.value : this.discount,
      total: data.total.present ? data.total.value : this.total,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      productType: data.productType.present
          ? data.productType.value
          : this.productType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableData(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('tableType: $tableType, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('orderType: $orderType, ')
          ..write('productType: $productType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    productId,
    quantity,
    tableType,
    tableNumber,
    price,
    discount,
    total,
    orderType,
    productType,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemsTableData &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.tableType == this.tableType &&
          other.tableNumber == this.tableNumber &&
          other.price == this.price &&
          other.discount == this.discount &&
          other.total == this.total &&
          other.orderType == this.orderType &&
          other.productType == this.productType &&
          other.createdAt == this.createdAt);
}

class OrderItemsTableCompanion extends UpdateCompanion<OrderItemsTableData> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<TableTypeEnum> tableType;
  final Value<int> tableNumber;
  final Value<double> price;
  final Value<double?> discount;
  final Value<double> total;
  final Value<OrderTypeEnum> orderType;
  final Value<ProductTypeEnum> productType;
  final Value<DateTime> createdAt;
  const OrderItemsTableCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.tableType = const Value.absent(),
    this.tableNumber = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.total = const Value.absent(),
    this.orderType = const Value.absent(),
    this.productType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrderItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required int productId,
    this.quantity = const Value.absent(),
    this.tableType = const Value.absent(),
    required int tableNumber,
    required double price,
    this.discount = const Value.absent(),
    required double total,
    this.orderType = const Value.absent(),
    this.productType = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : orderId = Value(orderId),
       productId = Value(productId),
       tableNumber = Value(tableNumber),
       price = Value(price),
       total = Value(total);
  static Insertable<OrderItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<int>? tableType,
    Expression<int>? tableNumber,
    Expression<double>? price,
    Expression<double>? discount,
    Expression<double>? total,
    Expression<int>? orderType,
    Expression<int>? productType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (tableType != null) 'table_type': tableType,
      if (tableNumber != null) 'table_number': tableNumber,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (total != null) 'total': total,
      if (orderType != null) 'order_type': orderType,
      if (productType != null) 'product_type': productType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrderItemsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<int>? productId,
    Value<double>? quantity,
    Value<TableTypeEnum>? tableType,
    Value<int>? tableNumber,
    Value<double>? price,
    Value<double?>? discount,
    Value<double>? total,
    Value<OrderTypeEnum>? orderType,
    Value<ProductTypeEnum>? productType,
    Value<DateTime>? createdAt,
  }) {
    return OrderItemsTableCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      tableType: tableType ?? this.tableType,
      tableNumber: tableNumber ?? this.tableNumber,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      orderType: orderType ?? this.orderType,
      productType: productType ?? this.productType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (tableType.present) {
      map['table_type'] = Variable<int>(
        $OrderItemsTableTable.$convertertableType.toSql(tableType.value),
      );
    }
    if (tableNumber.present) {
      map['table_number'] = Variable<int>(tableNumber.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<int>(
        $OrderItemsTableTable.$converterorderType.toSql(orderType.value),
      );
    }
    if (productType.present) {
      map['product_type'] = Variable<int>(
        $OrderItemsTableTable.$converterproductType.toSql(productType.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('tableType: $tableType, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('orderType: $orderType, ')
          ..write('productType: $productType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OrdersTableTable extends OrdersTable
    with TableInfo<$OrdersTableTable, OrdersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderNumberMeta = const VerificationMeta(
    'orderNumber',
  );
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
    'order_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _tableNumberMeta = const VerificationMeta(
    'tableNumber',
  );
  @override
  late final GeneratedColumn<int> tableNumber = GeneratedColumn<int>(
    'table_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TableTypeEnum, int> tableType =
      GeneratedColumn<int>(
        'table_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TableTypeEnum>($OrdersTableTable.$convertertableType);
  @override
  late final GeneratedColumnWithTypeConverter<OrderTypeEnum, int> orderType =
      GeneratedColumn<int>(
        'order_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(OrderTypeEnum.dineIn.index),
      ).withConverter<OrderTypeEnum>($OrdersTableTable.$converterorderType);
  @override
  late final GeneratedColumnWithTypeConverter<OrderStatusEnum, int>
  orderStatus = GeneratedColumn<int>(
    'order_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(OrderStatusEnum.inProgress.index),
  ).withConverter<OrderStatusEnum>($OrdersTableTable.$converterorderStatus);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES users(id)',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderNumber,
    tableNumber,
    price,
    discount,
    total,
    tableType,
    orderType,
    orderStatus,
    userId,
    createdAt,
    endAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrdersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_number')) {
      context.handle(
        _orderNumberMeta,
        orderNumber.isAcceptableOrUnknown(
          data['order_number']!,
          _orderNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('table_number')) {
      context.handle(
        _tableNumberMeta,
        tableNumber.isAcceptableOrUnknown(
          data['table_number']!,
          _tableNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tableNumberMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrdersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_number'],
      )!,
      tableNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}table_number'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      ),
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
      tableType: $OrdersTableTable.$convertertableType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}table_type'],
        )!,
      ),
      orderType: $OrdersTableTable.$converterorderType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}order_type'],
        )!,
      ),
      orderStatus: $OrdersTableTable.$converterorderStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}order_status'],
        )!,
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      ),
    );
  }

  @override
  $OrdersTableTable createAlias(String alias) {
    return $OrdersTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TableTypeEnum, int, int> $convertertableType =
      const EnumIndexConverter<TableTypeEnum>(TableTypeEnum.values);
  static JsonTypeConverter2<OrderTypeEnum, int, int> $converterorderType =
      const EnumIndexConverter<OrderTypeEnum>(OrderTypeEnum.values);
  static JsonTypeConverter2<OrderStatusEnum, int, int> $converterorderStatus =
      const EnumIndexConverter<OrderStatusEnum>(OrderStatusEnum.values);
}

class OrdersTableData extends DataClass implements Insertable<OrdersTableData> {
  final int id;
  final String orderNumber;
  final int tableNumber;
  final double price;
  final double? discount;
  final double total;
  final TableTypeEnum tableType;
  final OrderTypeEnum orderType;
  final OrderStatusEnum orderStatus;
  final int userId;
  final DateTime createdAt;
  final DateTime? endAt;
  const OrdersTableData({
    required this.id,
    required this.orderNumber,
    required this.tableNumber,
    required this.price,
    this.discount,
    required this.total,
    required this.tableType,
    required this.orderType,
    required this.orderStatus,
    required this.userId,
    required this.createdAt,
    this.endAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_number'] = Variable<String>(orderNumber);
    map['table_number'] = Variable<int>(tableNumber);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    map['total'] = Variable<double>(total);
    {
      map['table_type'] = Variable<int>(
        $OrdersTableTable.$convertertableType.toSql(tableType),
      );
    }
    {
      map['order_type'] = Variable<int>(
        $OrdersTableTable.$converterorderType.toSql(orderType),
      );
    }
    {
      map['order_status'] = Variable<int>(
        $OrdersTableTable.$converterorderStatus.toSql(orderStatus),
      );
    }
    map['user_id'] = Variable<int>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  OrdersTableCompanion toCompanion(bool nullToAbsent) {
    return OrdersTableCompanion(
      id: Value(id),
      orderNumber: Value(orderNumber),
      tableNumber: Value(tableNumber),
      price: Value(price),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      total: Value(total),
      tableType: Value(tableType),
      orderType: Value(orderType),
      orderStatus: Value(orderStatus),
      userId: Value(userId),
      createdAt: Value(createdAt),
      endAt: endAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endAt),
    );
  }

  factory OrdersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdersTableData(
      id: serializer.fromJson<int>(json['id']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      tableNumber: serializer.fromJson<int>(json['tableNumber']),
      price: serializer.fromJson<double>(json['price']),
      discount: serializer.fromJson<double?>(json['discount']),
      total: serializer.fromJson<double>(json['total']),
      tableType: $OrdersTableTable.$convertertableType.fromJson(
        serializer.fromJson<int>(json['tableType']),
      ),
      orderType: $OrdersTableTable.$converterorderType.fromJson(
        serializer.fromJson<int>(json['orderType']),
      ),
      orderStatus: $OrdersTableTable.$converterorderStatus.fromJson(
        serializer.fromJson<int>(json['orderStatus']),
      ),
      userId: serializer.fromJson<int>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'tableNumber': serializer.toJson<int>(tableNumber),
      'price': serializer.toJson<double>(price),
      'discount': serializer.toJson<double?>(discount),
      'total': serializer.toJson<double>(total),
      'tableType': serializer.toJson<int>(
        $OrdersTableTable.$convertertableType.toJson(tableType),
      ),
      'orderType': serializer.toJson<int>(
        $OrdersTableTable.$converterorderType.toJson(orderType),
      ),
      'orderStatus': serializer.toJson<int>(
        $OrdersTableTable.$converterorderStatus.toJson(orderStatus),
      ),
      'userId': serializer.toJson<int>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  OrdersTableData copyWith({
    int? id,
    String? orderNumber,
    int? tableNumber,
    double? price,
    Value<double?> discount = const Value.absent(),
    double? total,
    TableTypeEnum? tableType,
    OrderTypeEnum? orderType,
    OrderStatusEnum? orderStatus,
    int? userId,
    DateTime? createdAt,
    Value<DateTime?> endAt = const Value.absent(),
  }) => OrdersTableData(
    id: id ?? this.id,
    orderNumber: orderNumber ?? this.orderNumber,
    tableNumber: tableNumber ?? this.tableNumber,
    price: price ?? this.price,
    discount: discount.present ? discount.value : this.discount,
    total: total ?? this.total,
    tableType: tableType ?? this.tableType,
    orderType: orderType ?? this.orderType,
    orderStatus: orderStatus ?? this.orderStatus,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    endAt: endAt.present ? endAt.value : this.endAt,
  );
  OrdersTableData copyWithCompanion(OrdersTableCompanion data) {
    return OrdersTableData(
      id: data.id.present ? data.id.value : this.id,
      orderNumber: data.orderNumber.present
          ? data.orderNumber.value
          : this.orderNumber,
      tableNumber: data.tableNumber.present
          ? data.tableNumber.value
          : this.tableNumber,
      price: data.price.present ? data.price.value : this.price,
      discount: data.discount.present ? data.discount.value : this.discount,
      total: data.total.present ? data.total.value : this.total,
      tableType: data.tableType.present ? data.tableType.value : this.tableType,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      orderStatus: data.orderStatus.present
          ? data.orderStatus.value
          : this.orderStatus,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableData(')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('tableType: $tableType, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderNumber,
    tableNumber,
    price,
    discount,
    total,
    tableType,
    orderType,
    orderStatus,
    userId,
    createdAt,
    endAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdersTableData &&
          other.id == this.id &&
          other.orderNumber == this.orderNumber &&
          other.tableNumber == this.tableNumber &&
          other.price == this.price &&
          other.discount == this.discount &&
          other.total == this.total &&
          other.tableType == this.tableType &&
          other.orderType == this.orderType &&
          other.orderStatus == this.orderStatus &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.endAt == this.endAt);
}

class OrdersTableCompanion extends UpdateCompanion<OrdersTableData> {
  final Value<int> id;
  final Value<String> orderNumber;
  final Value<int> tableNumber;
  final Value<double> price;
  final Value<double?> discount;
  final Value<double> total;
  final Value<TableTypeEnum> tableType;
  final Value<OrderTypeEnum> orderType;
  final Value<OrderStatusEnum> orderStatus;
  final Value<int> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> endAt;
  const OrdersTableCompanion({
    this.id = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.tableNumber = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.total = const Value.absent(),
    this.tableType = const Value.absent(),
    this.orderType = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.endAt = const Value.absent(),
  });
  OrdersTableCompanion.insert({
    this.id = const Value.absent(),
    required String orderNumber,
    required int tableNumber,
    required double price,
    this.discount = const Value.absent(),
    required double total,
    required TableTypeEnum tableType,
    this.orderType = const Value.absent(),
    this.orderStatus = const Value.absent(),
    required int userId,
    this.createdAt = const Value.absent(),
    this.endAt = const Value.absent(),
  }) : orderNumber = Value(orderNumber),
       tableNumber = Value(tableNumber),
       price = Value(price),
       total = Value(total),
       tableType = Value(tableType),
       userId = Value(userId);
  static Insertable<OrdersTableData> custom({
    Expression<int>? id,
    Expression<String>? orderNumber,
    Expression<int>? tableNumber,
    Expression<double>? price,
    Expression<double>? discount,
    Expression<double>? total,
    Expression<int>? tableType,
    Expression<int>? orderType,
    Expression<int>? orderStatus,
    Expression<int>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? endAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderNumber != null) 'order_number': orderNumber,
      if (tableNumber != null) 'table_number': tableNumber,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (total != null) 'total': total,
      if (tableType != null) 'table_type': tableType,
      if (orderType != null) 'order_type': orderType,
      if (orderStatus != null) 'order_status': orderStatus,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (endAt != null) 'end_at': endAt,
    });
  }

  OrdersTableCompanion copyWith({
    Value<int>? id,
    Value<String>? orderNumber,
    Value<int>? tableNumber,
    Value<double>? price,
    Value<double?>? discount,
    Value<double>? total,
    Value<TableTypeEnum>? tableType,
    Value<OrderTypeEnum>? orderType,
    Value<OrderStatusEnum>? orderStatus,
    Value<int>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime?>? endAt,
  }) {
    return OrdersTableCompanion(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      tableNumber: tableNumber ?? this.tableNumber,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      tableType: tableType ?? this.tableType,
      orderType: orderType ?? this.orderType,
      orderStatus: orderStatus ?? this.orderStatus,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (tableNumber.present) {
      map['table_number'] = Variable<int>(tableNumber.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (tableType.present) {
      map['table_type'] = Variable<int>(
        $OrdersTableTable.$convertertableType.toSql(tableType.value),
      );
    }
    if (orderType.present) {
      map['order_type'] = Variable<int>(
        $OrdersTableTable.$converterorderType.toSql(orderType.value),
      );
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<int>(
        $OrdersTableTable.$converterorderStatus.toSql(orderStatus.value),
      );
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('total: $total, ')
          ..write('tableType: $tableType, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $OrderItemsTableTable orderItemsTable = $OrderItemsTableTable(
    this,
  );
  late final $OrdersTableTable ordersTable = $OrdersTableTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final OrderItemsDao orderItemsDao = OrderItemsDao(this as AppDatabase);
  late final OrdersDao ordersDao = OrdersDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersTable,
    productsTable,
    orderItemsTable,
    ordersTable,
  ];
}

typedef $$UsersTableTableCreateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      required String email,
      required String name,
      Value<UserRule> role,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableTableUpdateCompanionBuilder =
    UsersTableCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String> name,
      Value<UserRule> role,
      Value<DateTime> createdAt,
    });

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserRule, UserRule, int> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserRule, int> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTableTable,
          UsersTableData,
          $$UsersTableTableFilterComposer,
          $$UsersTableTableOrderingComposer,
          $$UsersTableTableAnnotationComposer,
          $$UsersTableTableCreateCompanionBuilder,
          $$UsersTableTableUpdateCompanionBuilder,
          (
            UsersTableData,
            BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>,
          ),
          UsersTableData,
          PrefetchHooks Function()
        > {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<UserRule> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersTableCompanion(
                id: id,
                email: email,
                name: name,
                role: role,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                required String name,
                Value<UserRule> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersTableCompanion.insert(
                id: id,
                email: email,
                name: name,
                role: role,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTableTable,
      UsersTableData,
      $$UsersTableTableFilterComposer,
      $$UsersTableTableOrderingComposer,
      $$UsersTableTableAnnotationComposer,
      $$UsersTableTableCreateCompanionBuilder,
      $$UsersTableTableUpdateCompanionBuilder,
      (
        UsersTableData,
        BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>,
      ),
      UsersTableData,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableTableCreateCompanionBuilder =
    ProductsTableCompanion Function({
      Value<int> id,
      required String nameAr,
      Value<String?> nameEn,
      Value<String?> nameKu,
      Value<String?> descriptionAr,
      Value<String?> descriptionEn,
      Value<String?> descriptionKu,
      Value<String?> imagePath,
      Value<double?> costPrice,
      required double price,
      Value<double?> discount,
      Value<double?> quantity,
      Value<ProductTypeEnum> productType,
      Value<DateTime> createdAt,
    });
typedef $$ProductsTableTableUpdateCompanionBuilder =
    ProductsTableCompanion Function({
      Value<int> id,
      Value<String> nameAr,
      Value<String?> nameEn,
      Value<String?> nameKu,
      Value<String?> descriptionAr,
      Value<String?> descriptionEn,
      Value<String?> descriptionKu,
      Value<String?> imagePath,
      Value<double?> costPrice,
      Value<double> price,
      Value<double?> discount,
      Value<double?> quantity,
      Value<ProductTypeEnum> productType,
      Value<DateTime> createdAt,
    });

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKu => $composableBuilder(
    column: $table.nameKu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionAr => $composableBuilder(
    column: $table.descriptionAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionKu => $composableBuilder(
    column: $table.descriptionKu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ProductTypeEnum, ProductTypeEnum, int>
  get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKu => $composableBuilder(
    column: $table.nameKu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionAr => $composableBuilder(
    column: $table.descriptionAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionKu => $composableBuilder(
    column: $table.descriptionKu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameKu =>
      $composableBuilder(column: $table.nameKu, builder: (column) => column);

  GeneratedColumn<String> get descriptionAr => $composableBuilder(
    column: $table.descriptionAr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionKu => $composableBuilder(
    column: $table.descriptionKu,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductTypeEnum, int> get productType =>
      $composableBuilder(
        column: $table.productType,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTableTable,
          ProductsTableData,
          $$ProductsTableTableFilterComposer,
          $$ProductsTableTableOrderingComposer,
          $$ProductsTableTableAnnotationComposer,
          $$ProductsTableTableCreateCompanionBuilder,
          $$ProductsTableTableUpdateCompanionBuilder,
          (
            ProductsTableData,
            BaseReferences<
              _$AppDatabase,
              $ProductsTableTable,
              ProductsTableData
            >,
          ),
          ProductsTableData,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> nameKu = const Value.absent(),
                Value<String?> descriptionAr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> descriptionKu = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<double?> costPrice = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> discount = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<ProductTypeEnum> productType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductsTableCompanion(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                nameKu: nameKu,
                descriptionAr: descriptionAr,
                descriptionEn: descriptionEn,
                descriptionKu: descriptionKu,
                imagePath: imagePath,
                costPrice: costPrice,
                price: price,
                discount: discount,
                quantity: quantity,
                productType: productType,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameAr,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> nameKu = const Value.absent(),
                Value<String?> descriptionAr = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<String?> descriptionKu = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<double?> costPrice = const Value.absent(),
                required double price,
                Value<double?> discount = const Value.absent(),
                Value<double?> quantity = const Value.absent(),
                Value<ProductTypeEnum> productType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductsTableCompanion.insert(
                id: id,
                nameAr: nameAr,
                nameEn: nameEn,
                nameKu: nameKu,
                descriptionAr: descriptionAr,
                descriptionEn: descriptionEn,
                descriptionKu: descriptionKu,
                imagePath: imagePath,
                costPrice: costPrice,
                price: price,
                discount: discount,
                quantity: quantity,
                productType: productType,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTableTable,
      ProductsTableData,
      $$ProductsTableTableFilterComposer,
      $$ProductsTableTableOrderingComposer,
      $$ProductsTableTableAnnotationComposer,
      $$ProductsTableTableCreateCompanionBuilder,
      $$ProductsTableTableUpdateCompanionBuilder,
      (
        ProductsTableData,
        BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>,
      ),
      ProductsTableData,
      PrefetchHooks Function()
    >;
typedef $$OrderItemsTableTableCreateCompanionBuilder =
    OrderItemsTableCompanion Function({
      Value<int> id,
      required int orderId,
      required int productId,
      Value<double> quantity,
      Value<TableTypeEnum> tableType,
      required int tableNumber,
      required double price,
      Value<double?> discount,
      required double total,
      Value<OrderTypeEnum> orderType,
      Value<ProductTypeEnum> productType,
      Value<DateTime> createdAt,
    });
typedef $$OrderItemsTableTableUpdateCompanionBuilder =
    OrderItemsTableCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<int> productId,
      Value<double> quantity,
      Value<TableTypeEnum> tableType,
      Value<int> tableNumber,
      Value<double> price,
      Value<double?> discount,
      Value<double> total,
      Value<OrderTypeEnum> orderType,
      Value<ProductTypeEnum> productType,
      Value<DateTime> createdAt,
    });

class $$OrderItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TableTypeEnum, TableTypeEnum, int>
  get tableType => $composableBuilder(
    column: $table.tableType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderTypeEnum, OrderTypeEnum, int>
  get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<ProductTypeEnum, ProductTypeEnum, int>
  get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tableType => $composableBuilder(
    column: $table.tableType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemsTableTable> {
  $$OrderItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TableTypeEnum, int> get tableType =>
      $composableBuilder(column: $table.tableType, builder: (column) => column);

  GeneratedColumn<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderTypeEnum, int> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductTypeEnum, int> get productType =>
      $composableBuilder(
        column: $table.productType,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OrderItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderItemsTableTable,
          OrderItemsTableData,
          $$OrderItemsTableTableFilterComposer,
          $$OrderItemsTableTableOrderingComposer,
          $$OrderItemsTableTableAnnotationComposer,
          $$OrderItemsTableTableCreateCompanionBuilder,
          $$OrderItemsTableTableUpdateCompanionBuilder,
          (
            OrderItemsTableData,
            BaseReferences<
              _$AppDatabase,
              $OrderItemsTableTable,
              OrderItemsTableData
            >,
          ),
          OrderItemsTableData,
          PrefetchHooks Function()
        > {
  $$OrderItemsTableTableTableManager(
    _$AppDatabase db,
    $OrderItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<TableTypeEnum> tableType = const Value.absent(),
                Value<int> tableNumber = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> discount = const Value.absent(),
                Value<double> total = const Value.absent(),
                Value<OrderTypeEnum> orderType = const Value.absent(),
                Value<ProductTypeEnum> productType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => OrderItemsTableCompanion(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                tableType: tableType,
                tableNumber: tableNumber,
                price: price,
                discount: discount,
                total: total,
                orderType: orderType,
                productType: productType,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required int productId,
                Value<double> quantity = const Value.absent(),
                Value<TableTypeEnum> tableType = const Value.absent(),
                required int tableNumber,
                required double price,
                Value<double?> discount = const Value.absent(),
                required double total,
                Value<OrderTypeEnum> orderType = const Value.absent(),
                Value<ProductTypeEnum> productType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => OrderItemsTableCompanion.insert(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                tableType: tableType,
                tableNumber: tableNumber,
                price: price,
                discount: discount,
                total: total,
                orderType: orderType,
                productType: productType,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderItemsTableTable,
      OrderItemsTableData,
      $$OrderItemsTableTableFilterComposer,
      $$OrderItemsTableTableOrderingComposer,
      $$OrderItemsTableTableAnnotationComposer,
      $$OrderItemsTableTableCreateCompanionBuilder,
      $$OrderItemsTableTableUpdateCompanionBuilder,
      (
        OrderItemsTableData,
        BaseReferences<
          _$AppDatabase,
          $OrderItemsTableTable,
          OrderItemsTableData
        >,
      ),
      OrderItemsTableData,
      PrefetchHooks Function()
    >;
typedef $$OrdersTableTableCreateCompanionBuilder =
    OrdersTableCompanion Function({
      Value<int> id,
      required String orderNumber,
      required int tableNumber,
      required double price,
      Value<double?> discount,
      required double total,
      required TableTypeEnum tableType,
      Value<OrderTypeEnum> orderType,
      Value<OrderStatusEnum> orderStatus,
      required int userId,
      Value<DateTime> createdAt,
      Value<DateTime?> endAt,
    });
typedef $$OrdersTableTableUpdateCompanionBuilder =
    OrdersTableCompanion Function({
      Value<int> id,
      Value<String> orderNumber,
      Value<int> tableNumber,
      Value<double> price,
      Value<double?> discount,
      Value<double> total,
      Value<TableTypeEnum> tableType,
      Value<OrderTypeEnum> orderType,
      Value<OrderStatusEnum> orderStatus,
      Value<int> userId,
      Value<DateTime> createdAt,
      Value<DateTime?> endAt,
    });

class $$OrdersTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TableTypeEnum, TableTypeEnum, int>
  get tableType => $composableBuilder(
    column: $table.tableType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderTypeEnum, OrderTypeEnum, int>
  get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderStatusEnum, OrderStatusEnum, int>
  get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrdersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tableType => $composableBuilder(
    column: $table.tableType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrdersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TableTypeEnum, int> get tableType =>
      $composableBuilder(column: $table.tableType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderTypeEnum, int> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderStatusEnum, int> get orderStatus =>
      $composableBuilder(
        column: $table.orderStatus,
        builder: (column) => column,
      );

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);
}

class $$OrdersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdersTableTable,
          OrdersTableData,
          $$OrdersTableTableFilterComposer,
          $$OrdersTableTableOrderingComposer,
          $$OrdersTableTableAnnotationComposer,
          $$OrdersTableTableCreateCompanionBuilder,
          $$OrdersTableTableUpdateCompanionBuilder,
          (
            OrdersTableData,
            BaseReferences<_$AppDatabase, $OrdersTableTable, OrdersTableData>,
          ),
          OrdersTableData,
          PrefetchHooks Function()
        > {
  $$OrdersTableTableTableManager(_$AppDatabase db, $OrdersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> orderNumber = const Value.absent(),
                Value<int> tableNumber = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> discount = const Value.absent(),
                Value<double> total = const Value.absent(),
                Value<TableTypeEnum> tableType = const Value.absent(),
                Value<OrderTypeEnum> orderType = const Value.absent(),
                Value<OrderStatusEnum> orderStatus = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
              }) => OrdersTableCompanion(
                id: id,
                orderNumber: orderNumber,
                tableNumber: tableNumber,
                price: price,
                discount: discount,
                total: total,
                tableType: tableType,
                orderType: orderType,
                orderStatus: orderStatus,
                userId: userId,
                createdAt: createdAt,
                endAt: endAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String orderNumber,
                required int tableNumber,
                required double price,
                Value<double?> discount = const Value.absent(),
                required double total,
                required TableTypeEnum tableType,
                Value<OrderTypeEnum> orderType = const Value.absent(),
                Value<OrderStatusEnum> orderStatus = const Value.absent(),
                required int userId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
              }) => OrdersTableCompanion.insert(
                id: id,
                orderNumber: orderNumber,
                tableNumber: tableNumber,
                price: price,
                discount: discount,
                total: total,
                tableType: tableType,
                orderType: orderType,
                orderStatus: orderStatus,
                userId: userId,
                createdAt: createdAt,
                endAt: endAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrdersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdersTableTable,
      OrdersTableData,
      $$OrdersTableTableFilterComposer,
      $$OrdersTableTableOrderingComposer,
      $$OrdersTableTableAnnotationComposer,
      $$OrdersTableTableCreateCompanionBuilder,
      $$OrdersTableTableUpdateCompanionBuilder,
      (
        OrdersTableData,
        BaseReferences<_$AppDatabase, $OrdersTableTable, OrdersTableData>,
      ),
      OrdersTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$OrderItemsTableTableTableManager get orderItemsTable =>
      $$OrderItemsTableTableTableManager(_db, _db.orderItemsTable);
  $$OrdersTableTableTableManager get ordersTable =>
      $$OrdersTableTableTableManager(_db, _db.ordersTable);
}
