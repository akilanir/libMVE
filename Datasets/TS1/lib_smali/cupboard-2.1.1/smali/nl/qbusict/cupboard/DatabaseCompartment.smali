.class public Lnl/qbusict/cupboard/DatabaseCompartment;
.super Lnl/qbusict/cupboard/BaseCompartment;
.source "DatabaseCompartment.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DefaultLocale"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    }
.end annotation


# static fields
.field private static final QUERY_BY_ID:Ljava/lang/String; = "_id = ?"


# instance fields
.field private final mDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .param p2, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/BaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    .line 58
    iput-object p2, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lnl/qbusict/cupboard/DatabaseCompartment;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 11
    .param p0, "x0"    # Lnl/qbusict/cupboard/DatabaseCompartment;
    .param p1, "x1"    # Ljava/lang/Class;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # [Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;
    .param p7, "x7"    # Ljava/lang/String;
    .param p8, "x8"    # Ljava/lang/String;
    .param p9, "x9"    # Z

    .prologue
    .line 51
    invoke-direct/range {p0 .. p9}, Lnl/qbusict/cupboard/DatabaseCompartment;->query(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    return-object v0
.end method

.method private diffAndUpdateIndexes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z
    .registers 25
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 325
    .local p3, "cols":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    const/16 v18, 0x0

    .line 326
    .local v18, "updated":Z
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "select name, sql from sqlite_master where type = \'index\' and tbl_name = \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x27

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 327
    .local v8, "indexesInDbCursor":Landroid/database/Cursor;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 328
    .local v7, "indexesInDb":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_30
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v19

    if-eqz v19, :cond_4e

    .line 329
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v7, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_30

    .line 331
    :cond_4e
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 333
    new-instance v3, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;

    invoke-direct {v3}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;-><init>()V

    .line 334
    .local v3, "builder":Lnl/qbusict/cupboard/internal/IndexStatement$Builder;
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_5a
    :goto_5a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_82

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    .line 335
    .local v4, "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    iget-object v0, v4, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    move-object/from16 v19, v0

    sget-object v20, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_5a

    .line 338
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->index:Lnl/qbusict/cupboard/annotation/Index;

    .line 339
    .local v6, "index":Lnl/qbusict/cupboard/annotation/Index;
    if-eqz v6, :cond_5a

    .line 340
    iget-object v0, v4, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v3, v0, v1, v6}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addIndexedColumn(Ljava/lang/String;Ljava/lang/String;Lnl/qbusict/cupboard/annotation/Index;)V

    goto :goto_5a

    .line 343
    .end local v4    # "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    .end local v6    # "index":Lnl/qbusict/cupboard/annotation/Index;
    :cond_82
    invoke-virtual {v3}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->buildAsMap()Ljava/util/Map;

    move-result-object v9

    .line 345
    .local v9, "indexesOfEntity":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/qbusict/cupboard/internal/IndexStatement;>;"
    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    .line 346
    .local v13, "oldSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v11

    .line 348
    .local v11, "newSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v17, Ljava/util/HashSet;

    move-object/from16 v0, v17

    invoke-direct {v0, v13}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 349
    .local v17, "toRemove":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 350
    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_c9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 351
    .local v10, "name":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "drop index if exists "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 352
    or-int/lit8 v18, v18, 0x1

    .line 353
    goto :goto_9e

    .line 355
    .end local v10    # "name":Ljava/lang/String;
    :cond_c9
    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15, v11}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 356
    .local v15, "toAdd":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v15, v13}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 357
    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_f9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 358
    .restart local v10    # "name":Ljava/lang/String;
    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lnl/qbusict/cupboard/internal/IndexStatement;

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/internal/IndexStatement;->getCreationSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 359
    or-int/lit8 v18, v18, 0x1

    .line 360
    goto :goto_d5

    .line 362
    .end local v10    # "name":Ljava/lang/String;
    :cond_f9
    new-instance v16, Ljava/util/HashSet;

    move-object/from16 v0, v16

    invoke-direct {v0, v11}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 363
    .local v16, "toPossiblyKeep":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, v16

    invoke-interface {v0, v13}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 364
    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_109
    :goto_109
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_157

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 365
    .restart local v10    # "name":Ljava/lang/String;
    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 366
    .local v14, "oldSql":Ljava/lang/String;
    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lnl/qbusict/cupboard/internal/IndexStatement;

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lnl/qbusict/cupboard/internal/IndexStatement;->getCreationSql(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v12

    .line 368
    .local v12, "newSql":Ljava/lang/String;
    invoke-virtual {v14, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_109

    .line 369
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "drop index if exists "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 370
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 371
    or-int/lit8 v18, v18, 0x1

    goto :goto_109

    .line 375
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "newSql":Ljava/lang/String;
    .end local v14    # "oldSql":Ljava/lang/String;
    :cond_157
    return v18
.end method

.method private query(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 22
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "groupBy"    # Ljava/lang/String;
    .param p6, "having"    # Ljava/lang/String;
    .param p7, "orderBy"    # Ljava/lang/String;
    .param p8, "limit"    # Ljava/lang/String;
    .param p9, "distinct"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lnl/qbusict/cupboard/QueryResultIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 406
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v11

    .line 407
    .local v11, "translator":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v11}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move/from16 v1, p9

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 408
    .local v10, "cursor":Landroid/database/Cursor;
    new-instance v0, Lnl/qbusict/cupboard/QueryResultIterable;

    invoke-direct {v0, v10, v11}, Lnl/qbusict/cupboard/QueryResultIterable;-><init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V

    return-object v0
.end method

.method private quoteTable(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "table"    # Ljava/lang/String;

    .prologue
    .line 412
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method createNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z
    .registers 13
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 379
    .local p3, "cols":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "create table \'"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' (_id integer primary key autoincrement"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 381
    .local v5, "sql":Ljava/lang/StringBuilder;
    new-instance v0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;

    invoke-direct {v0}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;-><init>()V

    .line 382
    .local v0, "builder":Lnl/qbusict/cupboard/internal/IndexStatement$Builder;
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1a
    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    .line 383
    .local v1, "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    iget-object v7, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    sget-object v8, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    if-eq v7, v8, :cond_1a

    .line 386
    iget-object v4, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    .line 387
    .local v4, "name":Ljava/lang/String;
    const-string v7, "_id"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_54

    .line 388
    const-string v7, ", \'"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    invoke-virtual {v8}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    :cond_54
    iget-object v3, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->index:Lnl/qbusict/cupboard/annotation/Index;

    .line 392
    .local v3, "index":Lnl/qbusict/cupboard/annotation/Index;
    if-eqz v3, :cond_1a

    .line 393
    invoke-virtual {v0, p2, v4, v3}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addIndexedColumn(Ljava/lang/String;Ljava/lang/String;Lnl/qbusict/cupboard/annotation/Index;)V

    goto :goto_1a

    .line 396
    .end local v1    # "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    .end local v3    # "index":Lnl/qbusict/cupboard/annotation/Index;
    .end local v4    # "name":Ljava/lang/String;
    :cond_5c
    const-string v7, ");"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 399
    invoke-virtual {v0}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->build()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_70
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_84

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnl/qbusict/cupboard/internal/IndexStatement;

    .line 400
    .local v6, "stmt":Lnl/qbusict/cupboard/internal/IndexStatement;
    invoke-virtual {v6, p2}, Lnl/qbusict/cupboard/internal/IndexStatement;->getCreationSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_70

    .line 402
    .end local v6    # "stmt":Lnl/qbusict/cupboard/internal/IndexStatement;
    :cond_84
    const/4 v7, 0x1

    return v7
.end method

.method public createTables()V
    .registers 7

    .prologue
    .line 66
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3}, Lnl/qbusict/cupboard/Cupboard;->getRegisteredEntities()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 67
    .local v1, "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3, v1}, Lnl/qbusict/cupboard/Cupboard;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 68
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lnl/qbusict/cupboard/DatabaseCompartment;->createNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z

    goto :goto_a

    .line 70
    .end local v0    # "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    .end local v1    # "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2a
    return-void
.end method

.method public varargs delete(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 7
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 281
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v1, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public delete(Ljava/lang/Class;J)Z
    .registers 12
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;J)Z"
        }
    .end annotation

    .prologue
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 267
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 268
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "_id = ?"

    new-array v6, v1, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v3, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_21

    :goto_20
    return v1

    :cond_21
    move v1, v2

    goto :goto_20
.end method

.method public delete(Ljava/lang/Object;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)Z"
        }
    .end annotation

    .prologue
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 250
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 251
    .local v0, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, v0}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v1

    .line 252
    .local v1, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    invoke-interface {v1, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v2

    .line 253
    .local v2, "id":Ljava/lang/Long;
    if-eqz v2, :cond_23

    .line 254
    const-string v5, "_id = ?"

    new-array v6, v3, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-virtual {p0, v0, v5, v6}, Lnl/qbusict/cupboard/DatabaseCompartment;->delete(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_21

    .line 256
    :goto_20
    return v3

    :cond_21
    move v3, v4

    .line 254
    goto :goto_20

    :cond_23
    move v3, v4

    .line 256
    goto :goto_20
.end method

.method public dropAllTables()V
    .registers 7

    .prologue
    .line 87
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3}, Lnl/qbusict/cupboard/Cupboard;->getRegisteredEntities()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 88
    .local v1, "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3, v1}, Lnl/qbusict/cupboard/Cupboard;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 89
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DROP TABLE IF EXISTS "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_a

    .line 91
    .end local v0    # "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    .end local v1    # "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3d
    return-void
.end method

.method public get(Ljava/lang/Class;J)Ljava/lang/Object;
    .registers 5
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;J)TT;"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->query(Ljava/lang/Class;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->byId(J)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 113
    .local p1, "object":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 114
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    invoke-interface {v0, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 115
    .local v1, "id":Ljava/lang/Long;
    if-eqz v1, :cond_1f

    .line 116
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v0, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p0, v2, v3, v4}, Lnl/qbusict/cupboard/DatabaseCompartment;->get(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 118
    :cond_1f
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "id of entity "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not set"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public put(Ljava/lang/Class;Landroid/content/ContentValues;)J
    .registers 8
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/content/ContentValues;",
            ")J"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 202
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    const-string v2, "_id"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    .line 203
    .local v1, "id":Ljava/lang/Long;
    if-eqz v1, :cond_20

    .line 204
    iget-object v2, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "_id"

    invoke-virtual {v2, v3, v4, p2}, Landroid/database/sqlite/SQLiteDatabase;->replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 205
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 208
    :goto_1f
    return-wide v2

    .line 207
    :cond_20
    iget-object v2, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "_id"

    invoke-virtual {v2, v3, v4, p2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 208
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_1f
.end method

.method public put(Ljava/lang/Object;)J
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)J"
        }
    .end annotation

    .prologue
    .line 181
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 182
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 183
    .local v4, "values":Landroid/content/ContentValues;
    invoke-interface {v0, p1, v4}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 184
    const-string v5, "_id"

    invoke-virtual {v4, v5}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    .line 185
    .local v1, "id":Ljava/lang/Long;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v4}, Lnl/qbusict/cupboard/DatabaseCompartment;->put(Ljava/lang/Class;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 186
    .local v2, "insertedId":J
    if-nez v1, :cond_27

    .line 187
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v0, v5, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->setId(Ljava/lang/Long;Ljava/lang/Object;)V

    .line 189
    :cond_27
    if-nez v1, :cond_2a

    .end local v2    # "insertedId":J
    :goto_29
    return-wide v2

    .restart local v2    # "insertedId":J
    :cond_2a
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_29
.end method

.method public put(Ljava/util/Collection;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "entities":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    .line 159
    .local v2, "mNestedTransaction":Z
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 161
    :try_start_b
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 162
    .local v0, "entity":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lnl/qbusict/cupboard/DatabaseCompartment;->put(Ljava/lang/Object;)J

    .line 163
    if-nez v2, :cond_f

    .line 164
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely()Z
    :try_end_23
    .catchall {:try_start_b .. :try_end_23} :catchall_24

    goto :goto_f

    .line 169
    .end local v0    # "entity":Ljava/lang/Object;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_24
    move-exception v3

    iget-object v4, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3

    .line 167
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2b
    :try_start_2b
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_30
    .catchall {:try_start_2b .. :try_end_30} :catchall_24

    .line 169
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 171
    return-void
.end method

.method public varargs put([Ljava/lang/Object;)V
    .registers 9
    .param p1, "entities"    # [Ljava/lang/Object;

    .prologue
    .line 137
    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v4

    .line 138
    .local v4, "mNestedTransaction":Z
    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 140
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    :try_start_c
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_1f

    aget-object v1, v0, v2

    .line 141
    .local v1, "entity":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lnl/qbusict/cupboard/DatabaseCompartment;->put(Ljava/lang/Object;)J

    .line 142
    if-nez v4, :cond_1c

    .line 143
    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely()Z

    .line 140
    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 146
    .end local v1    # "entity":Ljava/lang/Object;
    :cond_1f
    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_2a

    .line 148
    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 150
    return-void

    .line 148
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_2a
    move-exception v5

    iget-object v6, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v5
.end method

.method public query(Ljava/lang/Class;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;

    invoke-direct {v0, p1, p0}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;-><init>(Ljava/lang/Class;Lnl/qbusict/cupboard/DatabaseCompartment;)V

    return-object v0
.end method

.method public update(Ljava/lang/Class;Landroid/content/ContentValues;)I
    .registers 10
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/content/ContentValues;",
            ")I"
        }
    .end annotation

    .prologue
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 220
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 221
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    const-string v1, "_id"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 222
    iget-object v1, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "_id = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, p2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 224
    :goto_29
    return v1

    :cond_2a
    iget-object v1, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p2, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_29
.end method

.method public varargs update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 8
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/content/ContentValues;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 238
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 239
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v1, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnl/qbusict/cupboard/DatabaseCompartment;->quoteTable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method updateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/database/Cursor;Ljava/util/List;)Z
    .registers 14
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "tableInfo"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Landroid/database/Cursor;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 299
    .local p4, "cols":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 300
    .local v5, "locale":Ljava/util/Locale;
    new-instance v2, Ljava/util/HashMap;

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v2, v7}, Ljava/util/HashMap;-><init>(I)V

    .line 301
    .local v2, "columns":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    .line 302
    .local v0, "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    iget-object v7, v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    sget-object v8, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    if-eq v7, v8, :cond_f

    .line 305
    iget-object v7, v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    .line 308
    .end local v0    # "col":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    :cond_2b
    const-string v7, "name"

    invoke-interface {p3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 309
    .local v4, "index":I
    :goto_31
    invoke-interface {p3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_43

    .line 310
    invoke-interface {p3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_31

    .line 313
    :cond_43
    const/4 v6, 0x0

    .line 314
    .local v6, "updated":Z
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_92

    .line 315
    const/4 v6, 0x1

    .line 316
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_53
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_92

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    .line 317
    .local v1, "column":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "alter table \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' add column \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    invoke-virtual {v8}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_53

    .line 320
    .end local v1    # "column":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    :cond_92
    invoke-direct {p0, p1, p2, p4}, Lnl/qbusict/cupboard/DatabaseCompartment;->diffAndUpdateIndexes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z

    move-result v7

    or-int/2addr v6, v7

    .line 321
    return v6
.end method

.method updateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z
    .registers 7
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 285
    .local p3, "cols":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pragma table_info(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 287
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_1e
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-nez v1, :cond_2c

    .line 288
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/DatabaseCompartment;->createNewTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z
    :try_end_27
    .catchall {:try_start_1e .. :try_end_27} :catchall_34

    move-result v1

    .line 293
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :goto_2b
    return v1

    .line 290
    :cond_2c
    :try_start_2c
    invoke-virtual {p0, p1, p2, v0, p3}, Lnl/qbusict/cupboard/DatabaseCompartment;->updateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/database/Cursor;Ljava/util/List;)Z
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_34

    move-result v1

    .line 293
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2b

    :catchall_34
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public upgradeTables()V
    .registers 7

    .prologue
    .line 77
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3}, Lnl/qbusict/cupboard/Cupboard;->getRegisteredEntities()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 78
    .local v1, "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v3, v1}, Lnl/qbusict/cupboard/Cupboard;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 79
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lnl/qbusict/cupboard/DatabaseCompartment;->updateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/util/List;)Z

    goto :goto_a

    .line 81
    .end local v0    # "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    .end local v1    # "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2a
    return-void
.end method
