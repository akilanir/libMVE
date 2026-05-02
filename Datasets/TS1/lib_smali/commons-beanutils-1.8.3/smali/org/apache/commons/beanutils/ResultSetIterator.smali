.class public Lorg/apache/commons/beanutils/ResultSetIterator;
.super Ljava/lang/Object;
.source "ResultSetIterator.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaBean;
.implements Ljava/util/Iterator;


# instance fields
.field protected current:Z

.field protected dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

.field protected eof:Z


# direct methods
.method constructor <init>(Lorg/apache/commons/beanutils/ResultSetDynaClass;)V
    .registers 4
    .param p1, "dynaClass"    # Lorg/apache/commons/beanutils/ResultSetDynaClass;

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->current:Z

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    .line 78
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z

    .line 52
    iput-object p1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    .line 54
    return-void
.end method


# virtual methods
.method protected advance()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 343
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->current:Z

    if-nez v0, :cond_1a

    iget-boolean v0, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z

    if-nez v0, :cond_1a

    .line 344
    iget-object v0, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/sql/ResultSet;->next()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 345
    iput-boolean v2, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->current:Z

    .line 346
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z

    .line 353
    :cond_1a
    :goto_1a
    return-void

    .line 348
    :cond_1b
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->current:Z

    .line 349
    iput-boolean v2, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z

    goto :goto_1a
.end method

.method public contains(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - mapped properties not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 115
    iget-object v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    invoke-virtual {v1, p1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    if-nez v1, :cond_e

    .line 116
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 119
    :cond_e
    :try_start_e
    iget-object v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    invoke-virtual {v1, p1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getObjectFromResultSet(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/sql/SQLException; {:try_start_e .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 120
    :catch_15
    move-exception v0

    .line 121
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "get("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "): SQLException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 146
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - indexed properties not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 167
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - mapped properties not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDynaClass()Lorg/apache/commons/beanutils/DynaClass;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    return-object v0
.end method

.method public hasNext()Z
    .registers 5

    .prologue
    .line 291
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ResultSetIterator;->advance()V

    .line 292
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z
    :try_end_5
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_5} :catch_b

    if-nez v1, :cond_9

    const/4 v1, 0x1

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8

    .line 293
    :catch_b
    move-exception v0

    .line 294
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "hasNext():  SQLException:  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public next()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 308
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ResultSetIterator;->advance()V

    .line 309
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->eof:Z

    if-eqz v1, :cond_27

    .line 310
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
    :try_end_d
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_d} :catch_d

    .line 314
    :catch_d
    move-exception v0

    .line 315
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "next():  SQLException:  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 312
    .end local v0    # "e":Ljava/sql/SQLException;
    :cond_27
    const/4 v1, 0x0

    :try_start_28
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->current:Z
    :try_end_2a
    .catch Ljava/sql/SQLException; {:try_start_28 .. :try_end_2a} :catch_d

    .line 313
    return-object p0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 327
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "remove()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 199
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - mapped operations not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 251
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - indexed properties not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 220
    iget-object v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    invoke-virtual {v1, p1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    if-nez v1, :cond_e

    .line 221
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 224
    :cond_e
    :try_start_e
    iget-object v1, p0, Lorg/apache/commons/beanutils/ResultSetIterator;->dynaClass:Lorg/apache/commons/beanutils/ResultSetDynaClass;

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/ResultSetDynaClass;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljava/sql/ResultSet;->updateObject(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/sql/SQLException; {:try_start_e .. :try_end_17} :catch_18

    .line 230
    return-void

    .line 225
    :catch_18
    move-exception v0

    .line 226
    .local v0, "e":Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "set("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "): SQLException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 273
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "FIXME - mapped properties not currently supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
