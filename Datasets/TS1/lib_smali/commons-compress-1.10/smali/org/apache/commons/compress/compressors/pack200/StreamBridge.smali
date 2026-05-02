.class abstract Lorg/apache/commons/compress/compressors/pack200/StreamBridge;
.super Ljava/io/FilterOutputStream;
.source "StreamBridge.java"


# instance fields
.field private final INPUT_LOCK:Ljava/lang/Object;

.field private input:Ljava/io/InputStream;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;-><init>(Ljava/io/OutputStream;)V

    .line 44
    return-void
.end method

.method protected constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->INPUT_LOCK:Ljava/lang/Object;

    .line 40
    return-void
.end method


# virtual methods
.method getInput()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->INPUT_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 51
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    if-nez v0, :cond_d

    .line 52
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInputView()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    .line 54
    :cond_d
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_11

    .line 55
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    return-object v0

    .line 54
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method abstract getInputView()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method stop()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->close()V

    .line 68
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->INPUT_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 69
    :try_start_6
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    if-eqz v0, :cond_12

    .line 70
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->input:Ljava/io/InputStream;

    .line 73
    :cond_12
    monitor-exit v1

    .line 74
    return-void

    .line 73
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_6 .. :try_end_16} :catchall_14

    throw v0
.end method
