.class public Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;
.super Ljava/lang/Object;
.source "BasicAuthCache.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/AuthCache;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/auth/AuthScheme;",
            ">;"
        }
    .end annotation
.end field

.field private final schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;-><init>(Lcz/msebera/android/httpclient/conn/SchemePortResolver;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/conn/SchemePortResolver;)V
    .registers 3
    .param p1, "schemePortResolver"    # Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    .line 59
    if-eqz p1, :cond_f

    .end local p1    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :goto_c
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .line 61
    return-void

    .line 59
    .restart local p1    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :cond_f
    sget-object p1, Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;

    goto :goto_c
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 98
    return-void
.end method

.method public get(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/auth/AuthScheme;
    .registers 4
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;

    .prologue
    .line 87
    const-string v0, "HTTP host"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 88
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->getKey(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/auth/AuthScheme;

    return-object v0
.end method

.method protected getKey(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/HttpHost;
    .registers 7
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;

    .prologue
    .line 68
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v2

    if-gtz v2, :cond_1a

    .line 71
    :try_start_6
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    invoke-interface {v2, p1}, Lcz/msebera/android/httpclient/conn/SchemePortResolver;->resolve(Lcz/msebera/android/httpclient/HttpHost;)I
    :try_end_b
    .catch Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException; {:try_start_6 .. :try_end_b} :catch_1b

    move-result v1

    .line 75
    .local v1, "port":I
    new-instance v2, Lcz/msebera/android/httpclient/HttpHost;

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object p1, v2

    .line 77
    .end local v1    # "port":I
    .end local p1    # "host":Lcz/msebera/android/httpclient/HttpHost;
    :cond_1a
    :goto_1a
    return-object p1

    .line 72
    .restart local p1    # "host":Lcz/msebera/android/httpclient/HttpHost;
    :catch_1b
    move-exception v0

    .line 73
    .local v0, "ignore":Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;
    goto :goto_1a
.end method

.method public put(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/auth/AuthScheme;)V
    .registers 5
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "authScheme"    # Lcz/msebera/android/httpclient/auth/AuthScheme;

    .prologue
    .line 82
    const-string v0, "HTTP host"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->getKey(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public remove(Lcz/msebera/android/httpclient/HttpHost;)V
    .registers 4
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;

    .prologue
    .line 92
    const-string v0, "HTTP host"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->getKey(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/BasicAuthCache;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
