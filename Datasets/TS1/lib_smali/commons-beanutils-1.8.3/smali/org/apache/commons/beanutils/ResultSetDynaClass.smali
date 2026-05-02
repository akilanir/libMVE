.class public Lorg/apache/commons/beanutils/ResultSetDynaClass;
.super Lorg/apache/commons/beanutils/JDBCDynaClass;
.source "ResultSetDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaClass;


# instance fields
.field protected resultSet:Ljava/sql/ResultSet;


# direct methods
.method public constructor <init>(Ljava/sql/ResultSet;)V
    .registers 3
    .param p1, "resultSet"    # Ljava/sql/ResultSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 104
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/ResultSetDynaClass;-><init>(Ljava/sql/ResultSet;Z)V

    .line 106
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
    .line 133
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/ResultSetDynaClass;-><init>(Ljava/sql/ResultSet;ZZ)V

    .line 135
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
    .line 162
    invoke-direct {p0}, Lorg/apache/commons/beanutils/JDBCDynaClass;-><init>()V

    .line 181
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ResultSetDynaClass;->resultSet:Ljava/sql/ResultSet;

    .line 164
    if-nez p1, :cond_e

    .line 165
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 167
    :cond_e
    iput-object p1, p0, Lorg/apache/commons/beanutils/ResultSetDynaClass;->resultSet:Ljava/sql/ResultSet;

    .line 168
    iput-boolean p2, p0, Lorg/apache/commons/beanutils/ResultSetDynaClass;->lowerCase:Z

    .line 169
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->setUseColumnLabel(Z)V

    .line 170
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->introspect(Ljava/sql/ResultSet;)V

    .line 172
    return-void
.end method


# virtual methods
.method public getObjectFromResultSet(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 211
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getObject(Ljava/sql/ResultSet;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getResultSet()Ljava/sql/ResultSet;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/commons/beanutils/ResultSetDynaClass;->resultSet:Ljava/sql/ResultSet;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 196
    new-instance v0, Lorg/apache/commons/beanutils/ResultSetIterator;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/ResultSetIterator;-><init>(Lorg/apache/commons/beanutils/ResultSetDynaClass;)V

    return-object v0
.end method

.method protected loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 6
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 242
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 244
    :catch_d
    move-exception v0

    .line 245
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/sql/SQLException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot load column class \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\': "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
