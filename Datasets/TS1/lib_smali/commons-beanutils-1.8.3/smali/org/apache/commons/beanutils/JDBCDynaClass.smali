.class abstract Lorg/apache/commons/beanutils/JDBCDynaClass;
.super Ljava/lang/Object;
.source "JDBCDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaClass;
.implements Ljava/io/Serializable;


# static fields
.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$sql$Date:Ljava/lang/Class;

.field static class$java$sql$Time:Ljava/lang/Class;

.field static class$java$sql$Timestamp:Ljava/lang/Class;


# instance fields
.field private columnNameXref:Ljava/util/Map;

.field protected lowerCase:Z

.field protected properties:[Lorg/apache/commons/beanutils/DynaProperty;

.field protected propertiesMap:Ljava/util/Map;

.field private useColumnLabel:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->lowerCase:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->propertiesMap:Ljava/util/Map;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 204
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected createDynaProperty(Ljava/sql/ResultSetMetaData;I)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 10
    .param p1, "metadata"    # Ljava/sql/ResultSetMetaData;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 185
    const/4 v2, 0x0

    .line 186
    .local v2, "columnName":Ljava/lang/String;
    iget-boolean v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->useColumnLabel:Z

    if-eqz v5, :cond_9

    .line 187
    invoke-interface {p1, p2}, Ljava/sql/ResultSetMetaData;->getColumnLabel(I)Ljava/lang/String;

    move-result-object v2

    .line 189
    :cond_9
    if-eqz v2, :cond_15

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_19

    .line 190
    :cond_15
    invoke-interface {p1, p2}, Ljava/sql/ResultSetMetaData;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    .line 192
    :cond_19
    iget-boolean v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->lowerCase:Z

    if-eqz v5, :cond_5b

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 193
    .local v3, "name":Ljava/lang/String;
    :goto_21
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_37

    .line 194
    iget-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    if-nez v5, :cond_32

    .line 195
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    .line 197
    :cond_32
    iget-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    invoke-interface {v5, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_37
    const/4 v0, 0x0

    .line 201
    .local v0, "className":Ljava/lang/String;
    :try_start_38
    invoke-interface {p1, p2}, Ljava/sql/ResultSetMetaData;->getColumnType(I)I

    move-result v4

    .line 202
    .local v4, "sqlType":I
    packed-switch v4, :pswitch_data_a2

    .line 210
    invoke-interface {p1, p2}, Ljava/sql/ResultSetMetaData;->getColumnClassName(I)Ljava/lang/String;
    :try_end_42
    .catch Ljava/sql/SQLException; {:try_start_38 .. :try_end_42} :catch_6f

    move-result-object v0

    .line 219
    .end local v4    # "sqlType":I
    :goto_43
    sget-object v5, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v5, :cond_9e

    const-string v5, "java.lang.Object"

    invoke-static {v5}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$lang$Object:Ljava/lang/Class;

    .line 220
    .local v1, "clazz":Ljava/lang/Class;
    :goto_4f
    if-eqz v0, :cond_55

    .line 221
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/JDBCDynaClass;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 223
    :cond_55
    new-instance v5, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {v5, v3, v1}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .end local v1    # "clazz":Ljava/lang/Class;
    :goto_5a
    return-object v5

    .end local v0    # "className":Ljava/lang/String;
    .end local v3    # "name":Ljava/lang/String;
    :cond_5b
    move-object v3, v2

    .line 192
    goto :goto_21

    .line 204
    .restart local v0    # "className":Ljava/lang/String;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "sqlType":I
    :pswitch_5d
    :try_start_5d
    new-instance v5, Lorg/apache/commons/beanutils/DynaProperty;

    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v6, :cond_71

    const-string v6, "java.sql.Date"

    invoke-static {v6}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    :goto_6b
    invoke-direct {v5, v3, v6}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_5a

    .line 212
    .end local v4    # "sqlType":I
    :catch_6f
    move-exception v5

    goto :goto_43

    .line 204
    .restart local v4    # "sqlType":I
    :cond_71
    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    goto :goto_6b

    .line 206
    :pswitch_74
    new-instance v5, Lorg/apache/commons/beanutils/DynaProperty;

    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v6, :cond_86

    const-string v6, "java.sql.Timestamp"

    invoke-static {v6}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_82
    invoke-direct {v5, v3, v6}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_5a

    :cond_86
    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_82

    .line 208
    :pswitch_89
    new-instance v5, Lorg/apache/commons/beanutils/DynaProperty;

    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v6, :cond_9b

    const-string v6, "java.sql.Time"

    invoke-static {v6}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;

    :goto_97
    invoke-direct {v5, v3, v6}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_5a

    :cond_9b
    sget-object v6, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;
    :try_end_9d
    .catch Ljava/sql/SQLException; {:try_start_5d .. :try_end_9d} :catch_6f

    goto :goto_97

    .line 219
    .end local v4    # "sqlType":I
    :cond_9e
    sget-object v1, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_4f

    .line 202
    nop

    :pswitch_data_a2
    .packed-switch 0x5b
        :pswitch_5d
        :pswitch_89
        :pswitch_74
    .end packed-switch
.end method

.method protected getColumnName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 303
    iget-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 304
    iget-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->columnNameXref:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 306
    :goto_14
    return-object v0

    :cond_15
    move-object v0, p1

    goto :goto_14
.end method

.method public getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 99
    if-nez p1, :cond_a

    .line 100
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No property name specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->propertiesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getObject(Ljava/sql/ResultSet;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 270
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/JDBCDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 271
    .local v1, "property":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v1, :cond_25

    .line 272
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid name \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 274
    :cond_25
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/JDBCDynaClass;->getColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "columnName":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v2

    .line 278
    .local v2, "type":Ljava/lang/Class;
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v3, :cond_44

    const-string v3, "java.sql.Date"

    invoke-static {v3}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    :goto_39
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 279
    invoke-interface {p1, v0}, Ljava/sql/ResultSet;->getDate(Ljava/lang/String;)Ljava/sql/Date;

    move-result-object v3

    .line 292
    :goto_43
    return-object v3

    .line 278
    :cond_44
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Date:Ljava/lang/Class;

    goto :goto_39

    .line 283
    :cond_47
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v3, :cond_5e

    const-string v3, "java.sql.Timestamp"

    invoke-static {v3}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_53
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_61

    .line 284
    invoke-interface {p1, v0}, Ljava/sql/ResultSet;->getTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;

    move-result-object v3

    goto :goto_43

    .line 283
    :cond_5e
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_53

    .line 288
    :cond_61
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v3, :cond_78

    const-string v3, "java.sql.Time"

    invoke-static {v3}, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;

    :goto_6d
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 289
    invoke-interface {p1, v0}, Ljava/sql/ResultSet;->getTime(Ljava/lang/String;)Ljava/sql/Time;

    move-result-object v3

    goto :goto_43

    .line 288
    :cond_78
    sget-object v3, Lorg/apache/commons/beanutils/JDBCDynaClass;->class$java$sql$Time:Ljava/lang/Class;

    goto :goto_6d

    .line 292
    :cond_7b
    invoke-interface {p1, v0}, Ljava/sql/ResultSet;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_43
.end method

.method protected introspect(Ljava/sql/ResultSet;)V
    .registers 10
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 241
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .local v2, "list":Ljava/util/ArrayList;
    invoke-interface {p1}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v3

    .line 243
    .local v3, "metadata":Ljava/sql/ResultSetMetaData;
    invoke-interface {v3}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v4

    .line 244
    .local v4, "n":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_e
    if-gt v1, v4, :cond_1c

    .line 245
    invoke-virtual {p0, v3, v1}, Lorg/apache/commons/beanutils/JDBCDynaClass;->createDynaProperty(Ljava/sql/ResultSetMetaData;I)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 246
    .local v0, "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    if-eqz v0, :cond_19

    .line 247
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 252
    .end local v0    # "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_1c
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Lorg/apache/commons/beanutils/DynaProperty;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/apache/commons/beanutils/DynaProperty;

    check-cast v5, [Lorg/apache/commons/beanutils/DynaProperty;

    iput-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 254
    const/4 v1, 0x0

    :goto_2d
    iget-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    array-length v5, v5

    if-ge v1, v5, :cond_46

    .line 255
    iget-object v5, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->propertiesMap:Ljava/util/Map;

    iget-object v6, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v6, v6, v1

    invoke-virtual {v6}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v7, v7, v1

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 258
    :cond_46
    return-void
.end method

.method protected loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 7
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 158
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 159
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_12

    .line 160
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 163
    :cond_12
    const/4 v2, 0x0

    invoke-static {p1, v2, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_18

    move-result-object v2

    return-object v2

    .line 164
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    :catch_18
    move-exception v1

    .line 165
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/sql/SQLException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Cannot load column class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\': "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public newInstance()Lorg/apache/commons/beanutils/DynaBean;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "newInstance() not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUseColumnLabel(Z)V
    .registers 2
    .param p1, "useColumnLabel"    # Z

    .prologue
    .line 141
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/JDBCDynaClass;->useColumnLabel:Z

    .line 142
    return-void
.end method
