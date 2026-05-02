.class public Lorg/apache/http/protocol/BasicHttpContext;
.super Ljava/lang/Object;
.source "BasicHttpContext.java"

# interfaces
.implements Lorg/apache/http/protocol/HttpContext;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final parentContext:Lorg/apache/http/protocol/HttpContext;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .registers 3
    .param p1, "parentContext"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    .line 55
    iput-object p1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    .line 56
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_9

    .line 98
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 100
    :cond_9
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 59
    if-nez p1, :cond_a

    .line 60
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Id may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_a
    const/4 v0, 0x0

    .line 63
    .local v0, "obj":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v1, :cond_15

    .line 64
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 66
    .end local v0    # "obj":Ljava/lang/Object;
    :cond_15
    if-nez v0, :cond_21

    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    if-eqz v1, :cond_21

    .line 67
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v1, p1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 69
    :cond_21
    return-object v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 83
    if-nez p1, :cond_a

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Id may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_a
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_15

    .line 87
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 89
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 73
    if-nez p1, :cond_a

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Id may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_a
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-nez v0, :cond_15

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    .line 79
    :cond_15
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_b

    .line 105
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 107
    :goto_a
    return-object v0

    :cond_b
    const-string v0, "{}"

    goto :goto_a
.end method
