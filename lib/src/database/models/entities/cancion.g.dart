// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCancionCollection on Isar {
  IsarCollection<Cancion> get cancions => this.collection();
}

const CancionSchema = CollectionSchema(
  name: r'Cancion',
  id: -3336889616260932703,
  properties: {
    r'artista': PropertySchema(
      id: 0,
      name: r'artista',
      type: IsarType.string,
    ),
    r'filePath': PropertySchema(
      id: 1,
      name: r'filePath',
      type: IsarType.string,
    ),
    r'titulo': PropertySchema(
      id: 2,
      name: r'titulo',
      type: IsarType.string,
    )
  },
  estimateSize: _cancionEstimateSize,
  serialize: _cancionSerialize,
  deserialize: _cancionDeserialize,
  deserializeProp: _cancionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cancionGetId,
  getLinks: _cancionGetLinks,
  attach: _cancionAttach,
  version: '3.1.0+1',
);

int _cancionEstimateSize(
  Cancion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artista.length * 3;
  bytesCount += 3 + object.filePath.length * 3;
  bytesCount += 3 + object.titulo.length * 3;
  return bytesCount;
}

void _cancionSerialize(
  Cancion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artista);
  writer.writeString(offsets[1], object.filePath);
  writer.writeString(offsets[2], object.titulo);
}

Cancion _cancionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cancion(
    artista: reader.readString(offsets[0]),
    filePath: reader.readString(offsets[1]),
    titulo: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _cancionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cancionGetId(Cancion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cancionGetLinks(Cancion object) {
  return [];
}

void _cancionAttach(IsarCollection<dynamic> col, Id id, Cancion object) {
  object.id = id;
}

extension CancionQueryWhereSort on QueryBuilder<Cancion, Cancion, QWhere> {
  QueryBuilder<Cancion, Cancion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CancionQueryWhere on QueryBuilder<Cancion, Cancion, QWhereClause> {
  QueryBuilder<Cancion, Cancion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CancionQueryFilter
    on QueryBuilder<Cancion, Cancion, QFilterCondition> {
  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artista',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artista',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artista',
        value: '',
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> artistaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artista',
        value: '',
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> filePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterFilterCondition> tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }
}

extension CancionQueryObject
    on QueryBuilder<Cancion, Cancion, QFilterCondition> {}

extension CancionQueryLinks
    on QueryBuilder<Cancion, Cancion, QFilterCondition> {}

extension CancionQuerySortBy on QueryBuilder<Cancion, Cancion, QSortBy> {
  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByArtista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artista', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByArtistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artista', Sort.desc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension CancionQuerySortThenBy
    on QueryBuilder<Cancion, Cancion, QSortThenBy> {
  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByArtista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artista', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByArtistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artista', Sort.desc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Cancion, Cancion, QAfterSortBy> thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension CancionQueryWhereDistinct
    on QueryBuilder<Cancion, Cancion, QDistinct> {
  QueryBuilder<Cancion, Cancion, QDistinct> distinctByArtista(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artista', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cancion, Cancion, QDistinct> distinctByFilePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cancion, Cancion, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }
}

extension CancionQueryProperty
    on QueryBuilder<Cancion, Cancion, QQueryProperty> {
  QueryBuilder<Cancion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Cancion, String, QQueryOperations> artistaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artista');
    });
  }

  QueryBuilder<Cancion, String, QQueryOperations> filePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filePath');
    });
  }

  QueryBuilder<Cancion, String, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }
}
