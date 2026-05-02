.class public Lcom/koushikdutta/async/FilteredDataEmitter;
.super Lcom/koushikdutta/async/DataEmitterBase;
.source "FilteredDataEmitter.java"

# interfaces
.implements Lcom/koushikdutta/async/DataEmitter;
.implements Lcom/koushikdutta/async/callback/DataCallback;
.implements Lcom/koushikdutta/async/wrapper/DataEmitterWrapper;
.implements Lcom/koushikdutta/async/DataTrackingEmitter;


# instance fields
.field closed:Z

.field private mEmitter:Lcom/koushikdutta/async/DataEmitter;

.field private totalRead:I

.field private tracker:Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/koushikdutta/async/DataEmitterBase;-><init>()V

    return-void
.end method


# virtual methods
.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    if-nez v0, :cond_6

    .line 101
    const/4 v0, 0x0

    .line 102
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->charset()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public close()V
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->closed:Z

    .line 94
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    if-eqz v0, :cond_c

    .line 95
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->close()V

    .line 96
    :cond_c
    return-void
.end method

.method public getBytesRead()I
    .registers 2

    .prologue
    .line 31
    iget v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    return v0
.end method

.method public getDataEmitter()Lcom/koushikdutta/async/DataEmitter;
    .registers 2

    .prologue
    .line 11
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    return-object v0
.end method

.method public getDataTracker()Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->tracker:Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->isChunked()Z

    move-result v0

    return v0
.end method

.method public isPaused()Z
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->isPaused()Z

    move-result v0

    return v0
.end method

.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 5
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->closed:Z

    if-eqz v0, :cond_8

    .line 51
    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 63
    :cond_7
    :goto_7
    return-void

    .line 54
    :cond_8
    if-eqz p2, :cond_13

    .line 55
    iget v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    .line 56
    :cond_13
    invoke-static {p0, p2}, Lcom/koushikdutta/async/Util;->emitAllData(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 57
    if-eqz p2, :cond_21

    .line 58
    iget v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    .line 59
    :cond_21
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->tracker:Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;

    if-eqz v0, :cond_7

    if-eqz p2, :cond_7

    .line 60
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->tracker:Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;

    iget v1, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->totalRead:I

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;->onData(I)V

    goto :goto_7
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->pause()V

    .line 73
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataEmitter;->resume()V

    .line 78
    return-void
.end method

.method public setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V
    .registers 4
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    if-eqz v0, :cond_a

    .line 17
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 19
    :cond_a
    iput-object p1, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 20
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0, p0}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 21
    iget-object v0, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->mEmitter:Lcom/koushikdutta/async/DataEmitter;

    new-instance v1, Lcom/koushikdutta/async/FilteredDataEmitter$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/FilteredDataEmitter$1;-><init>(Lcom/koushikdutta/async/FilteredDataEmitter;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataEmitter;->setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 27
    return-void
.end method

.method public setDataTracker(Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;)V
    .registers 2
    .param p1, "tracker"    # Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/koushikdutta/async/FilteredDataEmitter;->tracker:Lcom/koushikdutta/async/DataTrackingEmitter$DataTracker;

    .line 42
    return-void
.end method
