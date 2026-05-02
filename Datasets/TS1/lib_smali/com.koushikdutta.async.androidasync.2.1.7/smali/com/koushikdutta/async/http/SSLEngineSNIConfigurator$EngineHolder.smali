.class Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;
.super Ljava/lang/Object;
.source "SSLEngineSNIConfigurator.java"

# interfaces
.implements Lcom/koushikdutta/async/http/AsyncSSLEngineConfigurator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EngineHolder"
.end annotation


# instance fields
.field peerHost:Ljava/lang/reflect/Field;

.field peerPort:Ljava/lang/reflect/Field;

.field sslParameters:Ljava/lang/reflect/Field;

.field useSni:Ljava/lang/reflect/Field;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .param p1, "engineClass"    # Ljava/lang/Class;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "peerHost"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerHost:Ljava/lang/reflect/Field;

    .line 21
    iget-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerHost:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 23
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "peerPort"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerPort:Ljava/lang/reflect/Field;

    .line 24
    iget-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerPort:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 26
    const-string v0, "sslParameters"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->sslParameters:Ljava/lang/reflect/Field;

    .line 27
    iget-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->sslParameters:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 29
    iget-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "useSni"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->useSni:Ljava/lang/reflect/Field;

    .line 30
    iget-object v0, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->useSni:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_49
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_49} :catch_4a

    .line 34
    :goto_49
    return-void

    .line 32
    :catch_4a
    move-exception v0

    goto :goto_49
.end method


# virtual methods
.method public configureEngine(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    .registers 8
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    .line 38
    iget-object v1, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->useSni:Ljava/lang/reflect/Field;

    if-nez v1, :cond_5

    .line 48
    :goto_4
    return-void

    .line 41
    :cond_5
    :try_start_5
    iget-object v1, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerHost:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1, p3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    iget-object v1, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->peerPort:Ljava/lang/reflect/Field;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    iget-object v1, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 44
    .local v0, "sslp":Ljava/lang/Object;
    iget-object v1, p0, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder;->useSni:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_23
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_23} :catch_24

    goto :goto_4

    .line 46
    .end local v0    # "sslp":Ljava/lang/Object;
    :catch_24
    move-exception v1

    goto :goto_4
.end method
