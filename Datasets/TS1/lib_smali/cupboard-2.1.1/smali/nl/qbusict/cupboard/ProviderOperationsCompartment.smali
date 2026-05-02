.class public Lnl/qbusict/cupboard/ProviderOperationsCompartment;
.super Lnl/qbusict/cupboard/BaseCompartment;
.source "ProviderOperationsCompartment.java"


# instance fields
.field private final mOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;Ljava/util/ArrayList;)V
    .registers 3
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/BaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    .line 34
    iput-object p2, p0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->mOperations:Ljava/util/ArrayList;

    .line 35
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/Object;)Lnl/qbusict/cupboard/ProviderOperationsCompartment;
    .registers 8
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "TT;)",
            "Lnl/qbusict/cupboard/ProviderOperationsCompartment;"
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 88
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    invoke-interface {v0, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 89
    .local v1, "id":Ljava/lang/Long;
    if-nez v1, :cond_f

    .line 93
    :goto_e
    return-object p0

    .line 92
    :cond_f
    iget-object v2, p0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {p1, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e
.end method

.method public getOperations()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->mOperations:Ljava/util/ArrayList;

    return-object v0
.end method

.method public varargs put(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/Object;)Lnl/qbusict/cupboard/ProviderOperationsCompartment;
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;[TT;)",
            "Lnl/qbusict/cupboard/ProviderOperationsCompartment;"
        }
    .end annotation

    .prologue
    .line 66
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0, p2}, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 67
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    array-length v4, p3

    new-array v3, v4, [Landroid/content/ContentValues;

    .line 68
    .local v3, "values":[Landroid/content/ContentValues;
    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 69
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    array-length v4, p3

    if-ge v1, v4, :cond_24

    .line 70
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    aput-object v4, v3, v1

    .line 71
    aget-object v4, p3, v1

    aget-object v5, v3, v1

    invoke-interface {v0, v4, v5}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 69
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 73
    :cond_24
    const/4 v1, 0x0

    :goto_25
    array-length v4, p3

    if-ge v1, v4, :cond_30

    .line 74
    aget-object v4, p3, v1

    invoke-virtual {p0, p1, v4}, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->put(Landroid/net/Uri;Ljava/lang/Object;)Lnl/qbusict/cupboard/ProviderOperationsCompartment;

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 76
    :cond_30
    return-object p0
.end method

.method public put(Landroid/net/Uri;Ljava/lang/Object;)Lnl/qbusict/cupboard/ProviderOperationsCompartment;
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/net/Uri;",
            "TT;)",
            "Lnl/qbusict/cupboard/ProviderOperationsCompartment;"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 46
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    new-instance v2, Landroid/content/ContentValues;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 47
    .local v2, "values":Landroid/content/ContentValues;
    invoke-interface {v0, p2, v2}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 48
    invoke-interface {v0, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 49
    .local v1, "id":Ljava/lang/Long;
    if-nez v1, :cond_30

    .line 50
    iget-object v3, p0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->mOperations:Ljava/util/ArrayList;

    invoke-static {p1}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :goto_2f
    return-object p0

    .line 52
    :cond_30
    iget-object v3, p0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f
.end method
