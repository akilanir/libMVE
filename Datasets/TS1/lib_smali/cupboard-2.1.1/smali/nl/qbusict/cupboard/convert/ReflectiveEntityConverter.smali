.class public Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;
.super Ljava/lang/Object;
.source "ReflectiveEntityConverter.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/EntityConverter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$1;,
        Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/EntityConverter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mColumns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;"
        }
    .end annotation
.end field

.field protected final mCupboard:Lnl/qbusict/cupboard/Cupboard;

.field private mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

.field private final mProperties:[Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

.field private final mUseAnnotations:Z


# direct methods
.method public constructor <init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)V
    .registers 5
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;-><init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;Ljava/util/Collection;)V
    .registers 5
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "ignoredFieldsNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;-><init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;Ljava/util/Collection;Ljava/util/Collection;)V
    .registers 20
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "ignoredFieldNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p4, "additionalColumns":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    move-object/from16 v0, p1

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    .line 69
    invoke-virtual/range {p1 .. p1}, Lnl/qbusict/cupboard/Cupboard;->isUseAnnotations()Z

    move-result v11

    iput-boolean v11, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mUseAnnotations:Z

    .line 70
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->getAllFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;

    move-result-object v5

    .line 71
    .local v5, "fields":[Ljava/lang/reflect/Field;
    new-instance v2, Ljava/util/ArrayList;

    array-length v11, v5

    invoke-direct {v2, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 72
    .local v2, "columns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    move-object/from16 v0, p2

    iput-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mClass:Ljava/lang/Class;

    .line 73
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v9, "properties":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;>;"
    move-object v1, v5

    .local v1, "arr$":[Ljava/lang/reflect/Field;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_25
    if-ge v6, v7, :cond_ca

    aget-object v4, v1, v6

    .line 75
    .local v4, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3b

    invoke-virtual {p0, v4}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->isIgnored(Ljava/lang/reflect/Field;)Z

    move-result v11

    if-eqz v11, :cond_3e

    .line 74
    :cond_3b
    :goto_3b
    add-int/lit8 v6, v6, 0x1

    goto :goto_25

    .line 78
    :cond_3e
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v10

    .line 79
    .local v10, "type":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v4}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->getFieldConverter(Ljava/lang/reflect/Field;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v3

    .line 80
    .local v3, "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<*>;"
    if-nez v3, :cond_7d

    .line 81
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Do not know how to convert field "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " in entity "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " of type "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 83
    :cond_7d
    invoke-interface {v3}, Lnl/qbusict/cupboard/convert/FieldConverter;->getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    move-result-object v11

    if-eqz v11, :cond_3b

    .line 86
    new-instance v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    const/4 v11, 0x0

    invoke-direct {v8, v11}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;-><init>(Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$1;)V

    .line 87
    .local v8, "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    iput-object v4, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    .line 88
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v11

    if-nez v11, :cond_95

    .line 89
    const/4 v11, 0x1

    invoke-virtual {v4, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 91
    :cond_95
    invoke-virtual {p0, v4}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->getColumn(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    .line 92
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v11

    iput-object v11, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->type:Ljava/lang/Class;

    .line 93
    iput-object v3, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->fieldConverter:Lnl/qbusict/cupboard/convert/FieldConverter;

    .line 94
    invoke-interface {v3}, Lnl/qbusict/cupboard/convert/FieldConverter;->getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    move-result-object v11

    iput-object v11, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->columnType:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 95
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    const-string v11, "_id"

    iget-object v12, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b8

    .line 97
    iput-object v8, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    .line 99
    :cond_b8
    new-instance v11, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    iget-object v12, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    iget-object v13, v8, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->columnType:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    invoke-virtual {p0, v4}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->getIndexes(Ljava/lang/reflect/Field;)Lnl/qbusict/cupboard/annotation/Index;

    move-result-object v14

    invoke-direct {v11, v12, v13, v14}, Lnl/qbusict/cupboard/convert/EntityConverter$Column;-><init>(Ljava/lang/String;Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;Lnl/qbusict/cupboard/annotation/Index;)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3b

    .line 101
    .end local v3    # "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<*>;"
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v8    # "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    .end local v10    # "type":Ljava/lang/reflect/Type;
    :cond_ca
    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 102
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v11

    iput-object v11, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mColumns:Ljava/util/List;

    .line 103
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    invoke-interface {v9, v11}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    iput-object v11, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mProperties:[Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    .line 104
    return-void
.end method

.method private getAllFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    if-nez v4, :cond_b

    .line 132
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 142
    :goto_a
    return-object v4

    .line 134
    :cond_b
    new-instance v2, Ljava/util/ArrayList;

    const/16 v4, 0x100

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 135
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    move-object v0, p1

    .line 137
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 138
    .local v1, "f":[Ljava/lang/reflect/Field;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 139
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 140
    if-nez v0, :cond_13

    .line 141
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    new-array v3, v4, [Ljava/lang/reflect/Field;

    .line 142
    .local v3, "result":[Ljava/lang/reflect/Field;
    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/reflect/Field;

    goto :goto_a
.end method

.method private static getTable(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public fromCursor(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 10
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    :try_start_0
    iget-object v6, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 168
    .local v4, "result":Ljava/lang/Object;, "TT;"
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "cols":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_b
    array-length v6, v0

    if-ge v2, v6, :cond_43

    .line 170
    iget-object v6, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mProperties:[Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    aget-object v3, v6, v2

    .line 171
    .local v3, "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    iget-object v5, v3, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->type:Ljava/lang/Class;

    .line 172
    .local v5, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_29

    .line 173
    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_26

    .line 174
    iget-object v6, v3, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 169
    :cond_26
    :goto_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 177
    :cond_29
    iget-object v6, v3, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    iget-object v7, v3, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->fieldConverter:Lnl/qbusict/cupboard/convert/FieldConverter;

    invoke-interface {v7, p1, v2}, Lnl/qbusict/cupboard/convert/FieldConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_34
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_34} :catch_35
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_34} :catch_3c

    goto :goto_26

    .line 181
    .end local v0    # "cols":[Ljava/lang/String;
    .end local v2    # "index":I
    .end local v3    # "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    .end local v4    # "result":Ljava/lang/Object;, "TT;"
    .end local v5    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_35
    move-exception v1

    .line 182
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 183
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_3c
    move-exception v1

    .line 184
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 180
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .restart local v0    # "cols":[Ljava/lang/String;
    .restart local v2    # "index":I
    .restart local v4    # "result":Ljava/lang/Object;, "TT;"
    :cond_43
    return-object v4
.end method

.method protected getColumn(Ljava/lang/reflect/Field;)Ljava/lang/String;
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 252
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    iget-boolean v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mUseAnnotations:Z

    if-eqz v1, :cond_13

    .line 253
    const-class v1, Lnl/qbusict/cupboard/annotation/Column;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/annotation/Column;

    .line 255
    .local v0, "column":Lnl/qbusict/cupboard/annotation/Column;
    if-eqz v0, :cond_13

    .line 256
    invoke-interface {v0}, Lnl/qbusict/cupboard/annotation/Column;->value()Ljava/lang/String;

    move-result-object v1

    .line 259
    .end local v0    # "column":Lnl/qbusict/cupboard/annotation/Column;
    :goto_12
    return-object v1

    :cond_13
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_12
.end method

.method public getColumns()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mColumns:Ljava/util/List;

    return-object v0
.end method

.method protected getFieldConverter(Ljava/lang/reflect/Field;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/Cupboard;->getFieldConverter(Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v0

    return-object v0
.end method

.method public getId(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Long;"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p1, "instance":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    if-eqz v1, :cond_1d

    .line 231
    :try_start_4
    iget-object v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    iget-object v1, v1, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;
    :try_end_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_e} :catch_f
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_e} :catch_16

    .line 238
    :goto_e
    return-object v1

    .line 232
    :catch_f
    move-exception v0

    .line 233
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 234
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_16
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 238
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_1d
    const/4 v1, 0x0

    goto :goto_e
.end method

.method protected getIndexes(Ljava/lang/reflect/Field;)Lnl/qbusict/cupboard/annotation/Index;
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 263
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    iget-boolean v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mUseAnnotations:Z

    if-eqz v1, :cond_f

    .line 264
    const-class v1, Lnl/qbusict/cupboard/annotation/Index;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/annotation/Index;

    .line 266
    .local v0, "index":Lnl/qbusict/cupboard/annotation/Index;
    if-eqz v0, :cond_f

    .line 270
    .end local v0    # "index":Lnl/qbusict/cupboard/annotation/Index;
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getTable()Ljava/lang/String;
    .registers 2

    .prologue
    .line 275
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mClass:Ljava/lang/Class;

    invoke-static {v0}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->getTable(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isIgnored(Ljava/lang/reflect/Field;)Z
    .registers 7
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 156
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v1

    .line 157
    .local v1, "modifiers":I
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v4

    if-nez v4, :cond_18

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_18

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-eqz v4, :cond_29

    :cond_18
    move v0, v3

    .line 158
    .local v0, "ignored":Z
    :goto_19
    iget-boolean v4, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mUseAnnotations:Z

    if-eqz v4, :cond_28

    .line 159
    if-nez v0, :cond_27

    const-class v4, Lnl/qbusict/cupboard/annotation/Ignore;

    invoke-virtual {p1, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    if-eqz v4, :cond_2b

    :cond_27
    move v0, v3

    .line 161
    :cond_28
    :goto_28
    return v0

    .end local v0    # "ignored":Z
    :cond_29
    move v0, v2

    .line 157
    goto :goto_19

    .restart local v0    # "ignored":Z
    :cond_2b
    move v0, v2

    .line 159
    goto :goto_28
.end method

.method public setId(Ljava/lang/Long;Ljava/lang/Object;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p2, "instance":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    if-eqz v1, :cond_b

    .line 218
    :try_start_4
    iget-object v1, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mIdProperty:Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    iget-object v1, v1, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p2, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_b} :catch_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_b} :catch_13

    .line 225
    :cond_b
    return-void

    .line 219
    :catch_c
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 221
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_13
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .registers 11
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;, "Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;->mProperties:[Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;

    .local v0, "arr$":[Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_4
    if-ge v2, v3, :cond_38

    aget-object v4, v0, v2

    .line 191
    .local v4, "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->columnType:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    sget-object v7, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    if-ne v6, v7, :cond_11

    .line 190
    :cond_e
    :goto_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 195
    :cond_11
    :try_start_11
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v6, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 196
    .local v5, "value":Ljava/lang/Object;
    if-nez v5, :cond_30

    .line 197
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    const-string v7, "_id"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 198
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_28} :catch_29

    goto :goto_e

    .line 203
    .end local v5    # "value":Ljava/lang/Object;
    :catch_29
    move-exception v1

    .line 204
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 201
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_30
    :try_start_30
    iget-object v6, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->fieldConverter:Lnl/qbusict/cupboard/convert/FieldConverter;

    iget-object v7, v4, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;->name:Ljava/lang/String;

    invoke-interface {v6, v5, v7, p2}, Lnl/qbusict/cupboard/convert/FieldConverter;->toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    :try_end_37
    .catch Ljava/lang/IllegalAccessException; {:try_start_30 .. :try_end_37} :catch_29

    goto :goto_e

    .line 207
    .end local v4    # "prop":Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_38
    return-void
.end method
