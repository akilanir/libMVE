.class public Lorg/apache/commons/beanutils/RowSetDynaClass;
.super Lorg/apache/commons/beanutils/JDBCDynaClass;
.source "RowSetDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaClass;
.implements Ljava/io/Serializable;


# instance fields
.field protected limit:I

.field protected rows:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/sql/ResultSet;)V
    .registers 4
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 105
    const/4 v0, 0x1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/beanutils/RowSetDynaClass;-><init>(Ljava/sql/ResultSet;ZI)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/sql/ResultSet;I)V
    .registers 4
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 127
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/RowSetDynaClass;-><init>(Ljava/sql/ResultSet;ZI)V

    .line 129
    return-void
.end method

.method public constructor <init>(Ljava/sql/ResultSet;Z)V
    .registers 4
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "lowerCase"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/RowSetDynaClass;-><init>(Ljava/sql/ResultSet;ZI)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/sql/ResultSet;ZI)V
    .registers 5
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "lowerCase"    # Z
    .param p3, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 181
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/RowSetDynaClass;-><init>(Ljava/sql/ResultSet;ZIZ)V

    .line 183
    return-void
.end method

.method public constructor <init>(Ljava/sql/ResultSet;ZIZ)V
    .registers 6
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "lowerCase"    # Z
    .param p3, "limit"    # I
    .param p4, "useColumnLabel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 239
    invoke-direct {p0}, Lorg/apache/commons/beanutils/JDBCDynaClass;-><init>()V

    .line 79
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->limit:I

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->rows:Ljava/util/List;

    .line 241
    if-nez p1, :cond_15

    .line 242
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 244
    :cond_15
    iput-boolean p2, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->lowerCase:Z

    .line 245
    iput p3, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->limit:I

    .line 246
    invoke-virtual {p0, p4}, Lorg/apache/commons/beanutils/RowSetDynaClass;->setUseColumnLabel(Z)V

    .line 247
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/RowSetDynaClass;->introspect(Ljava/sql/ResultSet;)V

    .line 248
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/RowSetDynaClass;->copy(Ljava/sql/ResultSet;)V

    .line 250
    return-void
.end method

.method public constructor <init>(Ljava/sql/ResultSet;ZZ)V
    .registers 5
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .param p2, "lowerCase"    # Z
    .param p3, "useColumnLabel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/RowSetDynaClass;-><init>(Ljava/sql/ResultSet;ZIZ)V

    .line 212
    return-void
.end method


# virtual methods
.method protected copy(Ljava/sql/ResultSet;)V
    .registers 9
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 288
    const/4 v1, 0x0

    .line 289
    .local v1, "cnt":I
    :goto_1
    invoke-interface {p1}, Ljava/sql/ResultSet;->next()Z

    move-result v6

    if-eqz v6, :cond_35

    iget v6, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->limit:I

    if-ltz v6, :cond_12

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "cnt":I
    .local v2, "cnt":I
    iget v6, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->limit:I

    if-ge v1, v6, :cond_34

    move v1, v2

    .line 290
    .end local v2    # "cnt":I
    .restart local v1    # "cnt":I
    :cond_12
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/RowSetDynaClass;->createDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 291
    .local v0, "bean":Lorg/apache/commons/beanutils/DynaBean;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_17
    iget-object v6, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    array-length v6, v6

    if-ge v3, v6, :cond_2e

    .line 292
    iget-object v6, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v6, v6, v3

    invoke-virtual {v6}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v4

    .line 293
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v4}, Lorg/apache/commons/beanutils/RowSetDynaClass;->getObject(Ljava/sql/ResultSet;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 294
    .local v5, "value":Ljava/lang/Object;
    invoke-interface {v0, v4, v5}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 291
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 296
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_2e
    iget-object v6, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->rows:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .end local v0    # "bean":Lorg/apache/commons/beanutils/DynaBean;
    .end local v1    # "cnt":I
    .end local v3    # "i":I
    .restart local v2    # "cnt":I
    :cond_34
    move v1, v2

    .line 299
    .end local v2    # "cnt":I
    .restart local v1    # "cnt":I
    :cond_35
    return-void
.end method

.method protected createDynaBean()Lorg/apache/commons/beanutils/DynaBean;
    .registers 2

    .prologue
    .line 310
    new-instance v0, Lorg/apache/commons/beanutils/BasicDynaBean;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/BasicDynaBean;-><init>(Lorg/apache/commons/beanutils/DynaClass;)V

    return-object v0
.end method

.method public getRows()Ljava/util/List;
    .registers 2

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/commons/beanutils/RowSetDynaClass;->rows:Ljava/util/List;

    return-object v0
.end method
