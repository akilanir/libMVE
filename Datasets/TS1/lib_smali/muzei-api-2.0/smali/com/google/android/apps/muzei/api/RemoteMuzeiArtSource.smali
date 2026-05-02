.class public abstract Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;
.super Lcom/google/android/apps/muzei/api/MuzeiArtSource;
.source "RemoteMuzeiArtSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;
    }
.end annotation


# static fields
.field private static final FETCH_WAKELOCK_TIMEOUT_MILLIS:I = 0x7530

.field private static final INITIAL_RETRY_DELAY_MILLIS:I = 0x2710

.field private static final PREF_RETRY_ATTEMPT:Ljava/lang/String; = "retry_attempt"

.field private static final TAG:Ljava/lang/String; = "MuzeiArtSource"


# instance fields
.field private mName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;-><init>(Ljava/lang/String;)V

    .line 69
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->mName:Ljava/lang/String;

    .line 70
    return-void
.end method


# virtual methods
.method protected onDisabled()V
    .registers 3

    .prologue
    .line 126
    invoke-super {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onDisabled()V

    .line 127
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "retry_attempt"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 128
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->setWantsNetworkAvailable(Z)V

    .line 129
    return-void
.end method

.method protected onNetworkAvailable()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 133
    invoke-super {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onNetworkAvailable()V

    .line 134
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "retry_attempt"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-lez v0, :cond_13

    .line 136
    invoke-virtual {p0, v2}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->onUpdate(I)V

    .line 138
    :cond_13
    return-void
.end method

.method protected abstract onTryUpdate(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;
        }
    .end annotation
.end method

.method protected onUpdate(I)V
    .registers 12
    .param p1, "reason"    # I

    .prologue
    const/4 v7, 0x1

    .line 85
    const-string v6, "power"

    invoke-virtual {p0, v6}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 86
    .local v3, "pwm":Landroid/os/PowerManager;
    iget-object v6, p0, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v3, v7, v6}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    .line 87
    .local v1, "lock":Landroid/os/PowerManager$WakeLock;
    const-wide/16 v6, 0x7530

    invoke-virtual {v1, v6, v7}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 89
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    .line 92
    .local v5, "sp":Landroid/content/SharedPreferences;
    :try_start_18
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 94
    .local v2, "ni":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_2c

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-nez v6, :cond_97

    .line 95
    :cond_2c
    const-string v6, "MuzeiArtSource"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No network connection; not attempting to fetch update, id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    new-instance v6, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;

    invoke-direct {v6}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;-><init>()V

    throw v6
    :try_end_4c
    .catch Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException; {:try_start_18 .. :try_end_4c} :catch_4c
    .catchall {:try_start_18 .. :try_end_4c} :catchall_b5

    .line 107
    .end local v2    # "ni":Landroid/net/NetworkInfo;
    :catch_4c
    move-exception v0

    .line 108
    .local v0, "e":Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;
    :try_start_4d
    const-string v6, "MuzeiArtSource"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error fetching, scheduling retry, id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const-string v6, "retry_attempt"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 112
    .local v4, "retryAttempt":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/16 v8, 0x2710

    shl-int/2addr v8, v4

    int-to-long v8, v8

    add-long/2addr v6, v8

    invoke-virtual {p0, v6, v7}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->scheduleUpdate(J)V

    .line 114
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string v7, "retry_attempt"

    add-int/lit8 v8, v4, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 115
    const/4 v6, 0x1

    invoke-virtual {p0, v6}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->setWantsNetworkAvailable(Z)V
    :try_end_8d
    .catchall {:try_start_4d .. :try_end_8d} :catchall_b5

    .line 118
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_96

    .line 119
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 122
    .end local v0    # "e":Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;
    .end local v4    # "retryAttempt":I
    :cond_96
    :goto_96
    return-void

    .line 101
    .restart local v2    # "ni":Landroid/net/NetworkInfo;
    :cond_97
    :try_start_97
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string v7, "retry_attempt"

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 102
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->setWantsNetworkAvailable(Z)V

    .line 105
    invoke-virtual {p0, p1}, Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;->onTryUpdate(I)V
    :try_end_ab
    .catch Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException; {:try_start_97 .. :try_end_ab} :catch_4c
    .catchall {:try_start_97 .. :try_end_ab} :catchall_b5

    .line 118
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_96

    .line 119
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_96

    .line 118
    .end local v2    # "ni":Landroid/net/NetworkInfo;
    :catchall_b5
    move-exception v6

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v7

    if-eqz v7, :cond_bf

    .line 119
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_bf
    throw v6
.end method
