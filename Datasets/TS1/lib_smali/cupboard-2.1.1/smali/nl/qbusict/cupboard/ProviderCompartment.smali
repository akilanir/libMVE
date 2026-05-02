.class public Lnl/qbusict/cupboard/ProviderCompartment;
.super Lnl/qbusict/cupboard/BaseCompartment;
.source "ProviderCompartment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
    }
.end annotation


# static fields
.field private static final QUERY_BY_ID:Ljava/lang/String; = "_id = ?"


# instance fields
.field private final mResolver:Landroid/content/ContentResolver;


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;Landroid/content/Context;)V
    .registers 4
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/BaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    .line 109
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    .line 110
    return-void
.end method

.method static synthetic access$000(Lnl/qbusict/cupboard/ProviderCompartment;Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 8
    .param p0, "x0"    # Lnl/qbusict/cupboard/ProviderCompartment;
    .param p1, "x1"    # Landroid/net/Uri;
    .param p2, "x2"    # Ljava/lang/Class;
    .param p3, "x3"    # [Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # [Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct/range {p0 .. p6}, Lnl/qbusict/cupboard/ProviderCompartment;->query(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    return-object v0
.end method

.method private query(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 15
    .param p1, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .param p6, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/QueryResultIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 262
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p2}, Lnl/qbusict/cupboard/ProviderCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v6

    .line 263
    .local v6, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 264
    .local v7, "cursor":Landroid/database/Cursor;
    if-nez v7, :cond_1e

    .line 265
    new-instance v7, Landroid/database/MatrixCursor;

    .end local v7    # "cursor":Landroid/database/Cursor;
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    invoke-direct {v7, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 267
    .restart local v7    # "cursor":Landroid/database/Cursor;
    :cond_1e
    new-instance v0, Lnl/qbusict/cupboard/QueryResultIterable;

    invoke-direct {v0, v7, v6}, Lnl/qbusict/cupboard/QueryResultIterable;-><init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V

    return-object v0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/Object;)I
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "TT;)I"
        }
    .end annotation

    .prologue
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x0

    .line 181
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lnl/qbusict/cupboard/ProviderCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 182
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    invoke-interface {v0, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 183
    .local v1, "id":Ljava/lang/Long;
    if-nez v1, :cond_11

    .line 184
    const/4 v2, 0x0

    .line 186
    :goto_10
    return v2

    :cond_11
    iget-object v2, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {p1, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_10
.end method

.method public varargs delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public get(Landroid/net/Uri;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 120
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/ProviderCompartment;->query(Landroid/net/Uri;Ljava/lang/Class;)Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Landroid/net/Uri;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 253
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lnl/qbusict/cupboard/ProviderCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 254
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    invoke-interface {v0, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 255
    .local v1, "id":Ljava/lang/Long;
    if-nez v1, :cond_16

    .line 256
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "entity does not have it\'s id set"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 258
    :cond_16
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lnl/qbusict/cupboard/ProviderCompartment;->get(Landroid/net/Uri;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public put(Landroid/net/Uri;Ljava/lang/Class;Ljava/util/Collection;)I
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Collection",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 170
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "entities":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-interface {p3}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {p0, p1, p2, v0}, Lnl/qbusict/cupboard/ProviderCompartment;->put(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public varargs put(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/Object;)I
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;[TT;)I"
        }
    .end annotation

    .prologue
    .line 151
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0, p2}, Lnl/qbusict/cupboard/ProviderCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 152
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    array-length v4, p3

    new-array v3, v4, [Landroid/content/ContentValues;

    .line 153
    .local v3, "values":[Landroid/content/ContentValues;
    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 154
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    array-length v4, p3

    if-ge v1, v4, :cond_24

    .line 155
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    aput-object v4, v3, v1

    .line 156
    aget-object v4, p3, v1

    aget-object v5, v3, v1

    invoke-interface {v0, v4, v5}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 158
    :cond_24
    iget-object v4, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v4, p1, v3}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v4

    return v4
.end method

.method public put(Landroid/net/Uri;Ljava/lang/Object;)Landroid/net/Uri;
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "TT;)",
            "Landroid/net/Uri;"
        }
    .end annotation

    .prologue
    .line 131
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnl/qbusict/cupboard/ProviderCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 132
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    new-instance v2, Landroid/content/ContentValues;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 133
    .local v2, "values":Landroid/content/ContentValues;
    invoke-interface {v0, p2, v2}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 134
    invoke-interface {v0, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 135
    .local v1, "id":Ljava/lang/Long;
    if-nez v1, :cond_25

    .line 136
    iget-object v3, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v3, p1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    .line 138
    :goto_24
    return-object v3

    :cond_25
    iget-object v3, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    goto :goto_24
.end method

.method public query(Landroid/net/Uri;Ljava/lang/Class;)Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 239
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;

    invoke-direct {v0, p1, p2, p0}, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;-><init>(Landroid/net/Uri;Ljava/lang/Class;Lnl/qbusict/cupboard/ProviderCompartment;)V

    return-object v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;)I
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    const/4 v1, 0x0

    .line 211
    const-string v0, "_id"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 212
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    const-string v1, "_id"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {p1, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, p2, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 214
    :goto_2b
    return v0

    :cond_2c
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1, p2, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_2b
.end method

.method public varargs update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 228
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method
