.class public final Lorg/apache/james/mime4j/stream/RawBody;
.super Ljava/lang/Object;
.source "RawBody.java"


# instance fields
.field private final params:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/james/mime4j/stream/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private final value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/james/mime4j/stream/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p2, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/james/mime4j/stream/NameValuePair;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    if-nez p1, :cond_d

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field value not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_d
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/RawBody;->value:Ljava/lang/String;

    .line 42
    if-eqz p2, :cond_14

    .end local p2    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/james/mime4j/stream/NameValuePair;>;"
    :goto_11
    iput-object p2, p0, Lorg/apache/james/mime4j/stream/RawBody;->params:Ljava/util/List;

    .line 43
    return-void

    .line 42
    .restart local p2    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/james/mime4j/stream/NameValuePair;>;"
    :cond_14
    new-instance p2, Ljava/util/ArrayList;

    .end local p2    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/james/mime4j/stream/NameValuePair;>;"
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    goto :goto_11
.end method


# virtual methods
.method public getParams()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/james/mime4j/stream/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/james/mime4j/stream/RawBody;->params:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/RawBody;->value:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/james/mime4j/stream/RawBody;->value:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    iget-object v3, p0, Lorg/apache/james/mime4j/stream/RawBody;->params:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/james/mime4j/stream/NameValuePair;

    .line 59
    .local v2, "param":Lorg/apache/james/mime4j/stream/NameValuePair;
    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_15

    .line 62
    .end local v2    # "param":Lorg/apache/james/mime4j/stream/NameValuePair;
    :cond_2a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
