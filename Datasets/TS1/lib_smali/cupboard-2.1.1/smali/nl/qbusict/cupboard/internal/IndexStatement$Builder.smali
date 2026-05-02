.class public Lnl/qbusict/cupboard/internal/IndexStatement$Builder;
.super Ljava/lang/Object;
.source "IndexStatement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/IndexStatement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
    }
.end annotation


# static fields
.field public static final GENERATED_INDEX_NAME:Ljava/lang/String; = "%s_%s"


# instance fields
.field indexes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
            ">;>;"
        }
    .end annotation
.end field

.field uniqueIndexes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->indexes:Ljava/util/Map;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->uniqueIndexes:Ljava/util/Map;

    .line 135
    return-void
.end method

.method private addCompositeIndex(Ljava/lang/String;Ljava/util/Map;ZILjava/lang/String;)V
    .registers 12
    .param p1, "columnName"    # Ljava/lang/String;
    .param p3, "ascending"    # Z
    .param p4, "order"    # I
    .param p5, "indexName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
            ">;>;ZI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 83
    .local p2, "collectionToAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    invoke-interface {p2, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 84
    .local v1, "set":Ljava/util/Set;, "Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;"
    if-nez v1, :cond_10

    .line 85
    new-instance v1, Ljava/util/HashSet;

    .end local v1    # "set":Ljava/util/Set;, "Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;"
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 86
    .restart local v1    # "set":Ljava/util/Set;, "Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;"
    invoke-interface {p2, p5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    :cond_10
    new-instance v0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;

    invoke-direct {v0, p0, p1, p3, p4}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;-><init>(Lnl/qbusict/cupboard/internal/IndexStatement$Builder;Ljava/lang/String;ZI)V

    .line 89
    .local v0, "indexColumnMetadata":Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_30

    .line 90
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Column \'%s\' has two indexes with the same name %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object p5, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 92
    :cond_30
    return-void
.end method

.method private addCompositeIndexes(Ljava/lang/String;Ljava/util/Map;[Lnl/qbusict/cupboard/annotation/CompositeIndex;)V
    .registers 14
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "composites"    # [Lnl/qbusict/cupboard/annotation/CompositeIndex;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
            ">;>;[",
            "Lnl/qbusict/cupboard/annotation/CompositeIndex;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p2, "collectionToAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    move-object v6, p3

    .local v6, "arr$":[Lnl/qbusict/cupboard/annotation/CompositeIndex;
    array-length v9, v6

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_3
    if-ge v8, v9, :cond_1c

    aget-object v7, v6, v8

    .line 78
    .local v7, "ci":Lnl/qbusict/cupboard/annotation/CompositeIndex;
    invoke-interface {v7}, Lnl/qbusict/cupboard/annotation/CompositeIndex;->ascending()Z

    move-result v3

    invoke-interface {v7}, Lnl/qbusict/cupboard/annotation/CompositeIndex;->order()I

    move-result v4

    invoke-interface {v7}, Lnl/qbusict/cupboard/annotation/CompositeIndex;->indexName()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addCompositeIndex(Ljava/lang/String;Ljava/util/Map;ZILjava/lang/String;)V

    .line 77
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 80
    .end local v7    # "ci":Lnl/qbusict/cupboard/annotation/CompositeIndex;
    :cond_1c
    return-void
.end method


# virtual methods
.method public addIndexedColumn(Ljava/lang/String;Ljava/lang/String;Lnl/qbusict/cupboard/annotation/Index;)V
    .registers 12
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "index"    # Lnl/qbusict/cupboard/annotation/Index;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 61
    const/4 v6, 0x0

    .line 62
    .local v6, "added":Z
    invoke-interface {p3}, Lnl/qbusict/cupboard/annotation/Index;->indexNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    move-result-object v0

    array-length v0, v0

    if-eqz v0, :cond_14

    .line 63
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->indexes:Ljava/util/Map;

    invoke-interface {p3}, Lnl/qbusict/cupboard/annotation/Index;->indexNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    move-result-object v1

    invoke-direct {p0, p2, v0, v1}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addCompositeIndexes(Ljava/lang/String;Ljava/util/Map;[Lnl/qbusict/cupboard/annotation/CompositeIndex;)V

    .line 64
    const/4 v6, 0x1

    .line 66
    :cond_14
    invoke-interface {p3}, Lnl/qbusict/cupboard/annotation/Index;->uniqueNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    move-result-object v0

    array-length v0, v0

    if-eqz v0, :cond_25

    .line 67
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->uniqueIndexes:Ljava/util/Map;

    invoke-interface {p3}, Lnl/qbusict/cupboard/annotation/Index;->uniqueNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;

    move-result-object v1

    invoke-direct {p0, p2, v0, v1}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addCompositeIndexes(Ljava/lang/String;Ljava/util/Map;[Lnl/qbusict/cupboard/annotation/CompositeIndex;)V

    .line 68
    const/4 v6, 0x1

    .line 70
    :cond_25
    if-nez v6, :cond_41

    .line 71
    invoke-interface {p3}, Lnl/qbusict/cupboard/annotation/Index;->unique()Z

    move-result v7

    .line 72
    .local v7, "unique":Z
    if-eqz v7, :cond_42

    iget-object v2, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->uniqueIndexes:Ljava/util/Map;

    :goto_2f
    const-string v0, "%s_%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    aput-object p2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addCompositeIndex(Ljava/lang/String;Ljava/util/Map;ZILjava/lang/String;)V

    .line 74
    .end local v7    # "unique":Z
    :cond_41
    return-void

    .line 72
    .restart local v7    # "unique":Z
    :cond_42
    iget-object v2, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->indexes:Ljava/util/Map;

    goto :goto_2f
.end method

.method public addStatementToList(Ljava/lang/String;ZLjava/util/List;Ljava/util/Set;)V
    .registers 12
    .param p1, "indexName"    # Ljava/lang/String;
    .param p2, "unique"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p3, "indexStatements":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/internal/IndexStatement;>;"
    .local p4, "metadatas":Ljava/util/Set;, "Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 123
    .local v1, "columnMetadatas":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;"
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 124
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    .line 125
    .local v5, "size":I
    new-array v2, v5, [Ljava/lang/String;

    .line 126
    .local v2, "columnNames":[Ljava/lang/String;
    new-array v0, v5, [Z

    .line 127
    .local v0, "ascendingColumns":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    if-ge v3, v5, :cond_24

    .line 128
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;

    .line 129
    .local v4, "indexColumnMetadata":Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
    iget-object v6, v4, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    aput-object v6, v2, v3

    .line 130
    iget-boolean v6, v4, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mAscending:Z

    aput-boolean v6, v0, v3

    .line 127
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 132
    .end local v4    # "indexColumnMetadata":Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
    :cond_24
    new-instance v6, Lnl/qbusict/cupboard/internal/IndexStatement;

    invoke-direct {v6, p2, v2, v0, p1}, Lnl/qbusict/cupboard/internal/IndexStatement;-><init>(Z[Ljava/lang/String;[ZLjava/lang/String;)V

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    return-void
.end method

.method public build()Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/internal/IndexStatement;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 95
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v4, "indexStatements":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/internal/IndexStatement;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 97
    .local v3, "indexNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v5, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->indexes:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 98
    .local v1, "indexEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 99
    .local v2, "indexName":Ljava/lang/String;
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    invoke-virtual {p0, v2, v8, v4, v5}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addStatementToList(Ljava/lang/String;ZLjava/util/List;Ljava/util/Set;)V

    goto :goto_16

    .line 102
    .end local v1    # "indexEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    .end local v2    # "indexName":Ljava/lang/String;
    :cond_35
    iget-object v5, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->uniqueIndexes:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_71

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 103
    .restart local v1    # "indexEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 105
    .restart local v2    # "indexName":Ljava/lang/String;
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_67

    .line 106
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "There are both unique and non-unique indexes with the same name : %s"

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 108
    :cond_67
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    invoke-virtual {p0, v2, v7, v4, v5}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->addStatementToList(Ljava/lang/String;ZLjava/util/List;Ljava/util/Set;)V

    goto :goto_3f

    .line 110
    .end local v1    # "indexEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;>;>;"
    .end local v2    # "indexName":Ljava/lang/String;
    :cond_71
    return-object v4
.end method

.method public buildAsMap()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/qbusict/cupboard/internal/IndexStatement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 115
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lnl/qbusict/cupboard/internal/IndexStatement;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder;->build()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/qbusict/cupboard/internal/IndexStatement;

    .line 116
    .local v1, "is":Lnl/qbusict/cupboard/internal/IndexStatement;
    iget-object v3, v1, Lnl/qbusict/cupboard/internal/IndexStatement;->mIndexName:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 118
    .end local v1    # "is":Lnl/qbusict/cupboard/internal/IndexStatement;
    :cond_1f
    return-object v2
.end method
