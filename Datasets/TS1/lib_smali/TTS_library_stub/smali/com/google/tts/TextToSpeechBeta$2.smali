.class Lcom/google/tts/TextToSpeechBeta$2;
.super Ljava/lang/Object;
.source "TextToSpeechBeta.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/tts/TextToSpeechBeta;->initTts()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/tts/TextToSpeechBeta;


# direct methods
.method constructor <init>(Lcom/google/tts/TextToSpeechBeta;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 10
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 443
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    # getter for: Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/google/tts/TextToSpeechBeta;->access$1(Lcom/google/tts/TextToSpeechBeta;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 444
    :try_start_7
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    invoke-static {p2}, Lcom/google/tts/ITtsBeta$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/tts/ITtsBeta;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/google/tts/TextToSpeechBeta;->access$2(Lcom/google/tts/TextToSpeechBeta;Lcom/google/tts/ITtsBeta;)V

    .line 445
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcom/google/tts/TextToSpeechBeta;->access$3(Lcom/google/tts/TextToSpeechBeta;Z)V

    .line 446
    # getter for: Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;
    invoke-static {}, Lcom/google/tts/TextToSpeechBeta;->access$0()Lcom/google/tts/TextToSpeechBeta$OnInitListener;
    :try_end_19
    .catchall {:try_start_7 .. :try_end_19} :catchall_3e

    move-result-object v3

    if-eqz v3, :cond_37

    .line 448
    :try_start_1c
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    # getter for: Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/google/tts/TextToSpeechBeta;->access$4(Lcom/google/tts/TextToSpeechBeta;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 449
    .local v2, "pm":Landroid/content/pm/PackageManager;
    const-string v3, "com.google.tts"

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 450
    .local v1, "info":Landroid/content/pm/PackageInfo;
    # getter for: Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;
    invoke-static {}, Lcom/google/tts/TextToSpeechBeta;->access$0()Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    move-result-object v3

    const/4 v5, 0x0

    iget v6, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-interface {v3, v5, v6}, Lcom/google/tts/TextToSpeechBeta$OnInitListener;->onInit(II)V
    :try_end_37
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1c .. :try_end_37} :catch_39
    .catchall {:try_start_1c .. :try_end_37} :catchall_3e

    .line 443
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :cond_37
    :goto_37
    :try_start_37
    monitor-exit v4

    .line 456
    return-void

    .line 451
    :catch_39
    move-exception v0

    .line 452
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_37

    .line 443
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catchall_3e
    move-exception v3

    monitor-exit v4
    :try_end_40
    .catchall {:try_start_37 .. :try_end_40} :catchall_3e

    throw v3
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 5
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 459
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    # getter for: Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/tts/TextToSpeechBeta;->access$1(Lcom/google/tts/TextToSpeechBeta;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 460
    :try_start_7
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/tts/TextToSpeechBeta;->access$2(Lcom/google/tts/TextToSpeechBeta;Lcom/google/tts/ITtsBeta;)V

    .line 461
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/google/tts/TextToSpeechBeta;->access$5(Lcom/google/tts/TextToSpeechBeta$OnInitListener;)V

    .line 462
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta$2;->this$0:Lcom/google/tts/TextToSpeechBeta;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/tts/TextToSpeechBeta;->access$3(Lcom/google/tts/TextToSpeechBeta;Z)V

    .line 459
    monitor-exit v1

    .line 464
    return-void

    .line 459
    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_19

    throw v0
.end method
