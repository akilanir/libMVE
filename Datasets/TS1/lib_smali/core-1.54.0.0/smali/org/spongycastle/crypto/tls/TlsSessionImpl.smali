.class Lorg/spongycastle/crypto/tls/TlsSessionImpl;
.super Ljava/lang/Object;
.source "TlsSessionImpl.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsSession;


# instance fields
.field final sessionID:[B

.field sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;


# direct methods
.method constructor <init>([BLorg/spongycastle/crypto/tls/SessionParameters;)V
    .registers 5
    .param p1, "sessionID"    # [B
    .param p2, "sessionParameters"    # Lorg/spongycastle/crypto/tls/SessionParameters;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    if-nez p1, :cond_d

    .line 14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'sessionID\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 16
    :cond_d
    array-length v0, p1

    const/4 v1, 0x1

    if-lt v0, v1, :cond_16

    array-length v0, p1

    const/16 v1, 0x20

    if-le v0, v1, :cond_1e

    .line 18
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'sessionID\' must have length between 1 and 32 bytes, inclusive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_1e
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionID:[B

    .line 22
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 23
    return-void
.end method


# virtual methods
.method public declared-synchronized exportSessionParameters()Lorg/spongycastle/crypto/tls/SessionParameters;
    .registers 2

    .prologue
    .line 27
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SessionParameters;->copy()Lorg/spongycastle/crypto/tls/SessionParameters;
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_f

    move-result-object v0

    goto :goto_6

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSessionID()[B
    .registers 2

    .prologue
    .line 32
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionID:[B
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized invalidate()V
    .registers 2

    .prologue
    .line 37
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    if-eqz v0, :cond_d

    .line 39
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SessionParameters;->clear()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 42
    :cond_d
    monitor-exit p0

    return-void

    .line 37
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isResumable()Z
    .registers 2

    .prologue
    .line 46
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
