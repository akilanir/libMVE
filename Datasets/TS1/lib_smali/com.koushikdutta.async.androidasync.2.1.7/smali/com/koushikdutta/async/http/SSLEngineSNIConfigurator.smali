.class public Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;
.super Ljava/lang/Object;
.source "SSLEngineSNIConfigurator.java"

# interfaces
.implements Lcom/koushikdutta/async/http/AsyncSSLEngineConfigurator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;
    }
.end annotation


# instance fields
.field holders:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;->holders:Ljava/util/Hashtable;

    return-void
.end method


# virtual methods
.method public configureEngine(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    .registers 8
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;->holders:Ljava/util/Hashtable;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;

    .line 57
    .local v0, "holder":Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;
    if-nez v0, :cond_20

    .line 58
    new-instance v0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;

    .end local v0    # "holder":Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;-><init>(Ljava/lang/Class;)V

    .line 59
    .restart local v0    # "holder":Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;
    iget-object v2, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;->holders:Ljava/util/Hashtable;

    invoke-virtual {v2, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_20
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->configureEngine(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V

    .line 63
    return-void
.end method
