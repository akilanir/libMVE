.class public final Lcom/google/zxing/client/android/BeepManager;
.super Ljava/lang/Object;
.source "BeepManager.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Ljava/io/Closeable;


# static fields
.field private static final BEEP_VOLUME:F = 0.1f

.field private static final TAG:Ljava/lang/String;

.field private static final VIBRATE_DURATION:J = 0xc8L


# instance fields
.field private final activity:Landroid/app/Activity;

.field private beepEnabled:Z

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private playBeep:Z

.field private vibrateEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/BeepManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->beepEnabled:Z

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->vibrateEnabled:Z

    .line 49
    iput-object p1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 51
    invoke-virtual {p0}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V

    .line 52
    return-void
.end method

.method private buildMediaPlayer(Landroid/content/Context;)Landroid/media/MediaPlayer;
    .registers 10
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 115
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 116
    .local v0, "mediaPlayer":Landroid/media/MediaPlayer;
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 117
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 118
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 120
    :try_start_f
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/google/zxing/client/android/R$raw;->zxing_beep:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_18} :catch_3d

    move-result-object v6

    .line 122
    .local v6, "file":Landroid/content/res/AssetFileDescriptor;
    :try_start_19
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_28
    .catchall {:try_start_19 .. :try_end_28} :catchall_38

    .line 124
    :try_start_28
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 126
    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3dcccccd    # 0.1f

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 127
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 132
    .end local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :goto_37
    return-object v0

    .line 124
    .restart local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    .restart local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :catchall_38
    move-exception v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    throw v1
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_3d} :catch_3d

    .line 129
    .end local v6    # "file":Landroid/content/res/AssetFileDescriptor;
    :catch_3d
    move-exception v7

    .line 130
    .local v7, "ioe":Ljava/io/IOException;
    sget-object v1, Lcom/google/zxing/client/android/BeepManager;->TAG:Ljava/lang/String;

    invoke-static {v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 132
    const/4 v0, 0x0

    goto :goto_37
.end method

.method private static shouldBeep(ZLandroid/content/Context;)Z
    .registers 6
    .param p0, "beep"    # Z
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 103
    move v1, p0

    .line 104
    .local v1, "shouldPlayBeep":Z
    if-eqz v1, :cond_13

    .line 106
    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 107
    .local v0, "audioService":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_13

    .line 108
    const/4 v1, 0x0

    .line 111
    .end local v0    # "audioService":Landroid/media/AudioManager;
    :cond_13
    return v1
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 2

    .prologue
    .line 158
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_d

    .line 159
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 160
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 162
    :cond_d
    monitor-exit p0

    return-void

    .line 158
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isBeepEnabled()Z
    .registers 2

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->beepEnabled:Z

    return v0
.end method

.method public isVibrateEnabled()Z
    .registers 2

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->vibrateEnabled:Z

    return v0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .registers 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 139
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 140
    return-void
.end method

.method public declared-synchronized onError(Landroid/media/MediaPlayer;II)Z
    .registers 5
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 144
    monitor-enter p0

    const/16 v0, 0x64

    if-ne p2, v0, :cond_d

    .line 146
    :try_start_5
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_17

    .line 153
    :goto_a
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 149
    :cond_d
    :try_start_d
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 151
    invoke-virtual {p0}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_17

    goto :goto_a

    .line 144
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized playBeepSoundAndVibrate()V
    .registers 4

    .prologue
    .line 93
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_e

    .line 94
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 96
    :cond_e
    iget-boolean v1, p0, Lcom/google/zxing/client/android/BeepManager;->vibrateEnabled:Z

    if-eqz v1, :cond_21

    .line 97
    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 98
    .local v0, "vibrator":Landroid/os/Vibrator;
    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_23

    .line 100
    .end local v0    # "vibrator":Landroid/os/Vibrator;
    :cond_21
    monitor-exit p0

    return-void

    .line 93
    :catchall_23
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setBeepEnabled(Z)V
    .registers 2
    .param p1, "beepEnabled"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Lcom/google/zxing/client/android/BeepManager;->beepEnabled:Z

    .line 67
    return-void
.end method

.method public setVibrateEnabled(Z)V
    .registers 2
    .param p1, "vibrateEnabled"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/google/zxing/client/android/BeepManager;->vibrateEnabled:Z

    .line 80
    return-void
.end method

.method public declared-synchronized updatePrefs()V
    .registers 3

    .prologue
    .line 83
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->beepEnabled:Z

    iget-object v1, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/google/zxing/client/android/BeepManager;->shouldBeep(ZLandroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    .line 84
    iget-boolean v0, p0, Lcom/google/zxing/client/android/BeepManager;->playBeep:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_21

    .line 87
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 88
    iget-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->activity:Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/BeepManager;->buildMediaPlayer(Landroid/content/Context;)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/BeepManager;->mediaPlayer:Landroid/media/MediaPlayer;
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_23

    .line 90
    :cond_21
    monitor-exit p0

    return-void

    .line 83
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method
