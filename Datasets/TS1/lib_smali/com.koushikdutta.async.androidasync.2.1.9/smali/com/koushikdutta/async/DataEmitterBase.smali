.class public abstract Lcom/koushikdutta/async/DataEmitterBase;
.super Ljava/lang/Object;
.source "DataEmitterBase.java"

# interfaces
.implements Lcom/koushikdutta/async/DataEmitter;


# instance fields
.field endCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

.field private ended:Z

.field mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataCallback()Lcom/koushikdutta/async/callback/DataCallback;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/koushikdutta/async/DataEmitterBase;->mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    return-object v0
.end method

.method public final getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/koushikdutta/async/DataEmitterBase;->endCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-object v0
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 12
    iget-boolean v0, p0, Lcom/koushikdutta/async/DataEmitterBase;->ended:Z

    if-eqz v0, :cond_5

    .line 17
    :cond_4
    :goto_4
    return-void

    .line 14
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/DataEmitterBase;->ended:Z

    .line 15
    invoke-virtual {p0}, Lcom/koushikdutta/async/DataEmitterBase;->getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 16
    invoke-virtual {p0}, Lcom/koushikdutta/async/DataEmitterBase;->getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_4
.end method

.method public setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/DataCallback;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/koushikdutta/async/DataEmitterBase;->mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    .line 35
    return-void
.end method

.method public final setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/koushikdutta/async/DataEmitterBase;->endCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 22
    return-void
.end method
