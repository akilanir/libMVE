.class public final Lde/greenrobot/dao/internal/DaoConfig;
.super Ljava/lang/Object;
.source "DaoConfig.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public final allColumns:[Ljava/lang/String;

.field public final db:Landroid/database/sqlite/SQLiteDatabase;

.field private identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/identityscope/IdentityScope",
            "<**>;"
        }
    .end annotation
.end field

.field public final keyIsNumeric:Z

.field public final nonPkColumns:[Ljava/lang/String;

.field public final pkColumns:[Ljava/lang/String;

.field public final pkProperty:Lde/greenrobot/dao/Property;

.field public final properties:[Lde/greenrobot/dao/Property;

.field public final statements:Lde/greenrobot/dao/internal/TableStatements;

.field public final tablename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V
    .registers 20
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class",
            "<+",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p2, "daoClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lde/greenrobot/dao/AbstractDao<**>;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 54
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lde/greenrobot/dao/internal/DaoConfig;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 56
    :try_start_9
    const-string v13, "TABLENAME"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    .line 57
    invoke-static/range {p2 .. p2}, Lde/greenrobot/dao/internal/DaoConfig;->reflectProperties(Ljava/lang/Class;)[Lde/greenrobot/dao/Property;

    move-result-object v10

    .line 58
    .local v10, "properties":[Lde/greenrobot/dao/Property;
    move-object/from16 v0, p0

    iput-object v10, v0, Lde/greenrobot/dao/internal/DaoConfig;->properties:[Lde/greenrobot/dao/Property;

    .line 60
    array-length v13, v10

    new-array v13, v13, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    .line 62
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v8, "pkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v6, "nonPkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 65
    .local v4, "lastPkProperty":Lde/greenrobot/dao/Property;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_37
    array-length v13, v10

    if-ge v3, v13, :cond_5c

    .line 66
    aget-object v11, v10, v3

    .line 67
    .local v11, "property":Lde/greenrobot/dao/Property;
    iget-object v5, v11, Lde/greenrobot/dao/Property;->columnName:Ljava/lang/String;

    .line 68
    .local v5, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    aput-object v5, v13, v3

    .line 69
    iget-boolean v13, v11, Lde/greenrobot/dao/Property;->primaryKey:Z

    if-eqz v13, :cond_4f

    .line 70
    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    move-object v4, v11

    .line 65
    :goto_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_37

    .line 73
    :cond_4f
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_52} :catch_53

    goto :goto_4c

    .line 93
    .end local v3    # "i":I
    .end local v4    # "lastPkProperty":Lde/greenrobot/dao/Property;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "nonPkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "pkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "properties":[Lde/greenrobot/dao/Property;
    .end local v11    # "property":Lde/greenrobot/dao/Property;
    :catch_53
    move-exception v2

    .line 94
    .local v2, "e":Ljava/lang/Exception;
    new-instance v13, Lde/greenrobot/dao/DaoException;

    const-string v14, "Could not init DAOConfig"

    invoke-direct {v13, v14, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 76
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "i":I
    .restart local v4    # "lastPkProperty":Lde/greenrobot/dao/Property;
    .restart local v6    # "nonPkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "pkColumnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "properties":[Lde/greenrobot/dao/Property;
    :cond_5c
    :try_start_5c
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v13

    new-array v7, v13, [Ljava/lang/String;

    .line 77
    .local v7, "nonPkColumnsArray":[Ljava/lang/String;
    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->nonPkColumns:[Ljava/lang/String;

    .line 78
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v13

    new-array v9, v13, [Ljava/lang/String;

    .line 79
    .local v9, "pkColumnsArray":[Ljava/lang/String;
    invoke-interface {v8, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    .line 81
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    array-length v13, v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_f5

    .end local v4    # "lastPkProperty":Lde/greenrobot/dao/Property;
    :goto_84
    move-object/from16 v0, p0

    iput-object v4, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    .line 82
    new-instance v13, Lde/greenrobot/dao/internal/TableStatements;

    move-object/from16 v0, p0

    iget-object v14, v0, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v15, v0, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-direct {v13, v0, v14, v15, v1}, Lde/greenrobot/dao/internal/TableStatements;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->statements:Lde/greenrobot/dao/internal/TableStatements;

    .line 84
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    if-eqz v13, :cond_f9

    .line 85
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    iget-object v12, v13, Lde/greenrobot/dao/Property;->type:Ljava/lang/Class;

    .line 86
    .local v12, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v13, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    const-class v13, Ljava/lang/Long;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    const-class v13, Ljava/lang/Integer;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    sget-object v13, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    const-class v13, Ljava/lang/Short;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    sget-object v13, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_ef

    const-class v13, Ljava/lang/Byte;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_f7

    :cond_ef
    const/4 v13, 0x1

    :goto_f0
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->keyIsNumeric:Z

    .line 96
    .end local v12    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_f4
    return-void

    .line 81
    .restart local v4    # "lastPkProperty":Lde/greenrobot/dao/Property;
    :cond_f5
    const/4 v4, 0x0

    goto :goto_84

    .line 86
    .end local v4    # "lastPkProperty":Lde/greenrobot/dao/Property;
    .restart local v12    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_f7
    const/4 v13, 0x0

    goto :goto_f0

    .line 90
    .end local v12    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_f9
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lde/greenrobot/dao/internal/DaoConfig;->keyIsNumeric:Z
    :try_end_fe
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_fe} :catch_53

    goto :goto_f4
.end method

.method public constructor <init>(Lde/greenrobot/dao/internal/DaoConfig;)V
    .registers 3
    .param p1, "source"    # Lde/greenrobot/dao/internal/DaoConfig;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->db:Landroid/database/sqlite/SQLiteDatabase;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 128
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    .line 129
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->properties:[Lde/greenrobot/dao/Property;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->properties:[Lde/greenrobot/dao/Property;

    .line 130
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    .line 131
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    .line 132
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->nonPkColumns:[Ljava/lang/String;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->nonPkColumns:[Ljava/lang/String;

    .line 133
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    .line 134
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->statements:Lde/greenrobot/dao/internal/TableStatements;

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->statements:Lde/greenrobot/dao/internal/TableStatements;

    .line 135
    iget-boolean v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->keyIsNumeric:Z

    iput-boolean v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->keyIsNumeric:Z

    .line 136
    return-void
.end method

.method private static reflectProperties(Ljava/lang/Class;)[Lde/greenrobot/dao/Property;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;>;)[",
            "Lde/greenrobot/dao/Property;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "daoClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lde/greenrobot/dao/AbstractDao<**>;>;"
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "$Properties"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 101
    .local v8, "propertiesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v8}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 103
    .local v3, "fields":[Ljava/lang/reflect/Field;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v10, "propertyList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/greenrobot/dao/Property;>;"
    const/16 v6, 0x9

    .line 105
    .local v6, "modifierMask":I
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_29
    if-ge v4, v5, :cond_48

    aget-object v1, v0, v4

    .line 107
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    and-int/lit8 v11, v11, 0x9

    const/16 v12, 0x9

    if-ne v11, v12, :cond_45

    .line 108
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 109
    .local v2, "fieldValue":Ljava/lang/Object;
    instance-of v11, v2, Lde/greenrobot/dao/Property;

    if-eqz v11, :cond_45

    .line 110
    check-cast v2, Lde/greenrobot/dao/Property;

    .end local v2    # "fieldValue":Ljava/lang/Object;
    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_45
    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    .line 115
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_48
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    new-array v7, v11, [Lde/greenrobot/dao/Property;

    .line 116
    .local v7, "properties":[Lde/greenrobot/dao/Property;
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_52
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_71

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lde/greenrobot/dao/Property;

    .line 117
    .local v9, "property":Lde/greenrobot/dao/Property;
    iget v11, v9, Lde/greenrobot/dao/Property;->ordinal:I

    aget-object v11, v7, v11

    if-eqz v11, :cond_6c

    .line 118
    new-instance v11, Lde/greenrobot/dao/DaoException;

    const-string v12, "Duplicate property ordinals"

    invoke-direct {v11, v12}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 120
    :cond_6c
    iget v11, v9, Lde/greenrobot/dao/Property;->ordinal:I

    aput-object v9, v7, v11

    goto :goto_52

    .line 122
    .end local v9    # "property":Lde/greenrobot/dao/Property;
    :cond_71
    return-object v7
.end method


# virtual methods
.method public clone()Lde/greenrobot/dao/internal/DaoConfig;
    .registers 2

    .prologue
    .line 141
    new-instance v0, Lde/greenrobot/dao/internal/DaoConfig;

    invoke-direct {v0, p0}, Lde/greenrobot/dao/internal/DaoConfig;-><init>(Lde/greenrobot/dao/internal/DaoConfig;)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0}, Lde/greenrobot/dao/internal/DaoConfig;->clone()Lde/greenrobot/dao/internal/DaoConfig;

    move-result-object v0

    return-object v0
.end method

.method public getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/identityscope/IdentityScope",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    return-object v0
.end method

.method public initIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScopeType;)V
    .registers 5
    .param p1, "type"    # Lde/greenrobot/dao/identityscope/IdentityScopeType;

    .prologue
    .line 154
    sget-object v0, Lde/greenrobot/dao/identityscope/IdentityScopeType;->None:Lde/greenrobot/dao/identityscope/IdentityScopeType;

    if-ne p1, v0, :cond_8

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    .line 165
    :goto_7
    return-void

    .line 156
    :cond_8
    sget-object v0, Lde/greenrobot/dao/identityscope/IdentityScopeType;->Session:Lde/greenrobot/dao/identityscope/IdentityScopeType;

    if-ne p1, v0, :cond_20

    .line 157
    iget-boolean v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->keyIsNumeric:Z

    if-eqz v0, :cond_18

    .line 158
    new-instance v0, Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    invoke-direct {v0}, Lde/greenrobot/dao/identityscope/IdentityScopeLong;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    goto :goto_7

    .line 160
    :cond_18
    new-instance v0, Lde/greenrobot/dao/identityscope/IdentityScopeObject;

    invoke-direct {v0}, Lde/greenrobot/dao/identityscope/IdentityScopeObject;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/internal/DaoConfig;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    goto :goto_7

    .line 163
    :cond_20
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setIdentityScope(Lde/greenrobot/dao/identityscope/IdentityScope;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/identityscope/IdentityScope",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "identityScope":Lde/greenrobot/dao/identityscope/IdentityScope;, "Lde/greenrobot/dao/identityscope/IdentityScope<**>;"
    iput-object p1, p0, Lde/greenrobot/dao/internal/DaoConfig;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    .line 150
    return-void
.end method
