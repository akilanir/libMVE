.class public Lcom/koushikdutta/async/FilteredDataSink;
.super Lcom/koushikdutta/async/BufferedDataSink;
.source "FilteredDataSink.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 3
    const-class v0, Lcom/koushikdutta/async/FilteredDataSink;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/FilteredDataSink;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/async/DataSink;)V
    .registers 3
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;

    .prologue
    .line 5
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/BufferedDataSink;-><init>(Lcom/koushikdutta/async/DataSink;)V

    .line 6
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/FilteredDataSink;->setMaxBuffer(I)V

    .line 7
    return-void
.end method


# virtual methods
.method public filter(Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 2
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 10
    return-object p1
.end method

.method public final write(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 5
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 17
    invoke-virtual {p0}, Lcom/koushikdutta/async/FilteredDataSink;->isBuffering()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {p0}, Lcom/koushikdutta/async/FilteredDataSink;->getMaxBuffer()I

    move-result v1

    const v2, 0x7fffffff

    if-eq v1, v2, :cond_10

    .line 24
    :cond_f
    :goto_f
    return-void

    .line 19
    :cond_10
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/FilteredDataSink;->filter(Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;

    move-result-object v0

    .line 20
    .local v0, "filtered":Lcom/koushikdutta/async/ByteBufferList;
    sget-boolean v1, Lcom/koushikdutta/async/FilteredDataSink;->$assertionsDisabled:Z

    if-nez v1, :cond_28

    if-eqz p1, :cond_28

    if-eq v0, p1, :cond_28

    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_28

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 21
    :cond_28
    const/4 v1, 0x1

    invoke-super {p0, v0, v1}, Lcom/koushikdutta/async/BufferedDataSink;->write(Lcom/koushikdutta/async/ByteBufferList;Z)V

    .line 22
    if-eqz p1, :cond_f

    .line 23
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    goto :goto_f
.end method
