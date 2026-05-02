.class public Lcom/google/tts/TextToSpeechBeta;
.super Landroid/speech/tts/TextToSpeech;
.source "TextToSpeechBeta.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/tts/TextToSpeechBeta$Engine;,
        Lcom/google/tts/TextToSpeechBeta$OnInitListener;,
        Lcom/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener;
    }
.end annotation


# static fields
.field public static final ACTION_TTS_QUEUE_PROCESSING_COMPLETED:Ljava/lang/String; = "android.speech.tts.TTS_QUEUE_PROCESSING_COMPLETED"

.field public static final ERROR:I = -0x1

.field public static final LANG_AVAILABLE:I = 0x0

.field public static final LANG_COUNTRY_AVAILABLE:I = 0x1

.field public static final LANG_COUNTRY_VAR_AVAILABLE:I = 0x2

.field public static final LANG_MISSING_DATA:I = -0x1

.field public static final LANG_NOT_SUPPORTED:I = -0x2

.field public static final NOT_ON_PLATFORM_TTS:Ljava/lang/String; = "TextToSpeechBeta not installed - basic platform TextToSpeech does not support "

.field public static final QUEUE_ADD:I = 0x1

.field public static final QUEUE_FLUSH:I = 0x0

.field public static final SUCCESS:I = 0x0

.field public static final USING_PLATFORM_TTS:Ljava/lang/String; = "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for "

.field private static mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;

.field static platformOnInitListener:Landroid/speech/tts/TextToSpeech$OnInitListener;

.field static ttsBetaInstalled:Z


# instance fields
.field private mCachedParams:[Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mITts:Lcom/google/tts/ITtsBeta;

.field private mITtscallback:Lcom/google/tts/ITtsCallbackBeta;

.field private mPackageName:Ljava/lang/String;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private final mStartLock:Ljava/lang/Object;

.field private mStarted:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 374
    const/4 v0, 0x0

    sput-object v0, Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    .line 384
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    .line 385
    new-instance v0, Lcom/google/tts/TextToSpeechBeta$1;

    invoke-direct {v0}, Lcom/google/tts/TextToSpeechBeta$1;-><init>()V

    sput-object v0, Lcom/google/tts/TextToSpeechBeta;->platformOnInitListener:Landroid/speech/tts/TextToSpeech$OnInitListener;

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/tts/TextToSpeechBeta$OnInitListener;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 405
    sget-object v1, Lcom/google/tts/TextToSpeechBeta;->platformOnInitListener:Landroid/speech/tts/TextToSpeech$OnInitListener;

    invoke-direct {p0, p1, v1}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    .line 370
    iput-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    .line 371
    iput-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITtscallback:Lcom/google/tts/ITtsCallbackBeta;

    .line 372
    iput-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    .line 373
    const-string v1, ""

    iput-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    .line 375
    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 376
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    .line 406
    invoke-static {p1}, Lcom/google/tts/TextToSpeechBeta;->isInstalled(Landroid/content/Context;)Z

    move-result v1

    sput-boolean v1, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    .line 407
    sput-object p2, Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    .line 408
    sget-boolean v1, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-eqz v1, :cond_a3

    .line 409
    invoke-super {p0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 410
    iput-object p1, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    .line 411
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    .line 413
    const/16 v1, 0xc

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    .line 415
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const-string v2, "rate"

    aput-object v2, v1, v3

    .line 416
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x2

    const-string v3, "language"

    aput-object v3, v1, v2

    .line 417
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x4

    const-string v3, "country"

    aput-object v3, v1, v2

    .line 418
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x6

    const-string v3, "variant"

    aput-object v3, v1, v2

    .line 419
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v2, 0x8

    const-string v3, "streamType"

    aput-object v3, v1, v2

    .line 420
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v2, 0xa

    const-string v3, "utteranceId"

    aput-object v3, v1, v2

    .line 422
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x1

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 424
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 425
    .local v0, "defaultLoc":Ljava/util/Locale;
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 426
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x5

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 427
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v2, 0x7

    invoke-virtual {v0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 429
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v2, 0x9

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 430
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v2, 0xb

    const-string v3, ""

    aput-object v3, v1, v2

    .line 432
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 434
    .end local v0    # "defaultLoc":Ljava/util/Locale;
    :cond_a3
    return-void
.end method

.method static synthetic access$0()Lcom/google/tts/TextToSpeechBeta$OnInitListener;
    .registers 1

    .prologue
    .line 374
    sget-object v0, Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/google/tts/TextToSpeechBeta;)Ljava/lang/Object;
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2(Lcom/google/tts/TextToSpeechBeta;Lcom/google/tts/ITtsBeta;)V
    .registers 2

    .prologue
    .line 370
    iput-object p1, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    return-void
.end method

.method static synthetic access$3(Lcom/google/tts/TextToSpeechBeta;Z)V
    .registers 2

    .prologue
    .line 375
    iput-boolean p1, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    return-void
.end method

.method static synthetic access$4(Lcom/google/tts/TextToSpeechBeta;)Landroid/content/Context;
    .registers 2

    .prologue
    .line 372
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5(Lcom/google/tts/TextToSpeechBeta$OnInitListener;)V
    .registers 1

    .prologue
    .line 374
    sput-object p0, Lcom/google/tts/TextToSpeechBeta;->mInitListener:Lcom/google/tts/TextToSpeechBeta$OnInitListener;

    return-void
.end method

.method private initTts()V
    .registers 5

    .prologue
    .line 438
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 441
    new-instance v1, Lcom/google/tts/TextToSpeechBeta$2;

    invoke-direct {v1, p0}, Lcom/google/tts/TextToSpeechBeta$2;-><init>(Lcom/google/tts/TextToSpeechBeta;)V

    iput-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 468
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.intent.action.START_TTS_SERVICE_BETA"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 469
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.google.intent.category.TTS_BETA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 470
    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 473
    return-void
.end method

.method public static isInstalled(Landroid/content/Context;)Z
    .registers 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 1388
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1389
    .local v2, "pm":Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.google.intent.action.START_TTS_SERVICE_BETA"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1390
    .local v1, "intent":Landroid/content/Intent;
    const-string v4, "com.google.intent.category.TTS_BETA"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1391
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 1392
    .local v0, "info":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_18

    .line 1395
    :goto_17
    return v3

    :cond_18
    const/4 v3, 0x1

    goto :goto_17
.end method

.method private resetCachedParams()V
    .registers 4

    .prologue
    .line 1311
    sget-boolean v0, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v0, :cond_c

    .line 1312
    const-string v0, "TextToSpeechBeta"

    const-string v1, "TextToSpeechBeta not installed - basic platform TextToSpeech does not support resetCachedParams"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    :goto_b
    return-void

    .line 1315
    :cond_c
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v1, 0x9

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 1316
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v1, 0xb

    const-string v2, ""

    aput-object v2, v0, v1

    goto :goto_b
.end method


# virtual methods
.method public addEarcon(Ljava/lang/String;Ljava/lang/String;)I
    .registers 9
    .param p1, "earcon"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 680
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_12

    .line 681
    const-string v1, "TextToSpeechBeta"

    const-string v2, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addEarcon"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    invoke-super {p0, p1, p2}, Landroid/speech/tts/TextToSpeech;->addEarcon(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 710
    :goto_11
    return v1

    .line 684
    :cond_12
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 685
    :try_start_15
    iget-boolean v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v4, :cond_1e

    .line 686
    monitor-exit v3

    goto :goto_11

    .line 684
    :catchall_1b
    move-exception v1

    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v1

    .line 689
    :cond_1e
    :try_start_1e
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    invoke-interface {v4, v5, p1, p2}, Lcom/google/tts/ITtsBeta;->addEarconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_25
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_25} :catch_28
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_3b
    .catch Ljava/lang/IllegalStateException; {:try_start_1e .. :try_end_25} :catch_4d
    .catchall {:try_start_1e .. :try_end_25} :catchall_1b

    .line 690
    :try_start_25
    monitor-exit v3

    move v1, v2

    goto :goto_11

    .line 691
    :catch_28
    move-exception v0

    .line 693
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 694
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 695
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 696
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 710
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_39
    monitor-exit v3

    goto :goto_11

    .line 697
    :catch_3b
    move-exception v0

    .line 699
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 700
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 701
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 702
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_39

    .line 703
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4d
    move-exception v0

    .line 705
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 707
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 708
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5e
    .catchall {:try_start_25 .. :try_end_5e} :catchall_1b

    goto :goto_39
.end method

.method public addEarcon(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 10
    .param p1, "earcon"    # Ljava/lang/String;
    .param p2, "packagename"    # Ljava/lang/String;
    .param p3, "resourceId"    # I

    .prologue
    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 631
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_12

    .line 632
    const-string v1, "TextToSpeechBeta"

    const-string v2, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addEarcon"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    invoke-super {p0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->addEarcon(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 661
    :goto_11
    return v1

    .line 635
    :cond_12
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 636
    :try_start_15
    iget-boolean v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v4, :cond_1e

    .line 637
    monitor-exit v3

    goto :goto_11

    .line 635
    :catchall_1b
    move-exception v1

    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v1

    .line 640
    :cond_1e
    :try_start_1e
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    invoke-interface {v4, v5, p1, p2, p3}, Lcom/google/tts/ITtsBeta;->addEarcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_25
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_25} :catch_28
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_3b
    .catch Ljava/lang/IllegalStateException; {:try_start_1e .. :try_end_25} :catch_4d
    .catchall {:try_start_1e .. :try_end_25} :catchall_1b

    .line 641
    :try_start_25
    monitor-exit v3

    move v1, v2

    goto :goto_11

    .line 642
    :catch_28
    move-exception v0

    .line 644
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 646
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 647
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 661
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_39
    monitor-exit v3

    goto :goto_11

    .line 648
    :catch_3b
    move-exception v0

    .line 650
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 652
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 653
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_39

    .line 654
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4d
    move-exception v0

    .line 656
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - addEarcon"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 658
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 659
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5e
    .catchall {:try_start_25 .. :try_end_5e} :catchall_1b

    goto :goto_39
.end method

.method public addSpeech(Ljava/lang/String;Ljava/lang/String;)I
    .registers 9
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 572
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_12

    .line 573
    const-string v1, "TextToSpeechBeta"

    const-string v2, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addSpeech"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    invoke-super {p0, p1, p2}, Landroid/speech/tts/TextToSpeech;->addSpeech(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 602
    :goto_11
    return v1

    .line 576
    :cond_12
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 577
    :try_start_15
    iget-boolean v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v4, :cond_1e

    .line 578
    monitor-exit v3

    goto :goto_11

    .line 576
    :catchall_1b
    move-exception v1

    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v1

    .line 581
    :cond_1e
    :try_start_1e
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    invoke-interface {v4, v5, p1, p2}, Lcom/google/tts/ITtsBeta;->addSpeechFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_25
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_25} :catch_28
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_3b
    .catch Ljava/lang/IllegalStateException; {:try_start_1e .. :try_end_25} :catch_4d
    .catchall {:try_start_1e .. :try_end_25} :catchall_1b

    .line 582
    :try_start_25
    monitor-exit v3

    move v1, v2

    goto :goto_11

    .line 583
    :catch_28
    move-exception v0

    .line 585
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 587
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 588
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 602
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_39
    monitor-exit v3

    goto :goto_11

    .line 589
    :catch_3b
    move-exception v0

    .line 591
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 593
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 594
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_39

    .line 595
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4d
    move-exception v0

    .line 597
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 599
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 600
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5e
    .catchall {:try_start_25 .. :try_end_5e} :catchall_1b

    goto :goto_39
.end method

.method public addSpeech(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 10
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "packagename"    # Ljava/lang/String;
    .param p3, "resourceId"    # I

    .prologue
    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 522
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_12

    .line 523
    const-string v1, "TextToSpeechBeta"

    const-string v2, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addSpeech"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    invoke-super {p0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->addSpeech(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 552
    :goto_11
    return v1

    .line 526
    :cond_12
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 527
    :try_start_15
    iget-boolean v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v4, :cond_1e

    .line 528
    monitor-exit v3

    goto :goto_11

    .line 526
    :catchall_1b
    move-exception v1

    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v1

    .line 531
    :cond_1e
    :try_start_1e
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    invoke-interface {v4, v5, p1, p2, p3}, Lcom/google/tts/ITtsBeta;->addSpeech(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_25
    .catch Landroid/os/RemoteException; {:try_start_1e .. :try_end_25} :catch_28
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_3b
    .catch Ljava/lang/IllegalStateException; {:try_start_1e .. :try_end_25} :catch_4d
    .catchall {:try_start_1e .. :try_end_25} :catchall_1b

    .line 532
    :try_start_25
    monitor-exit v3

    move v1, v2

    goto :goto_11

    .line 533
    :catch_28
    move-exception v0

    .line 535
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 537
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 538
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 552
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_39
    monitor-exit v3

    goto :goto_11

    .line 539
    :catch_3b
    move-exception v0

    .line 541
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 543
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 544
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_39

    .line 545
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4d
    move-exception v0

    .line 547
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - addSpeech"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 549
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 550
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5e
    .catchall {:try_start_25 .. :try_end_5e} :catchall_1b

    goto :goto_39
.end method

.method public getLanguage()Ljava/util/Locale;
    .registers 9

    .prologue
    const/4 v2, 0x0

    .line 1158
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_11

    .line 1159
    const-string v2, "TextToSpeechBeta"

    const-string v3, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for getLanguage"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1160
    invoke-super {p0}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v2

    .line 1192
    :goto_10
    return-object v2

    .line 1162
    :cond_11
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1163
    :try_start_14
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_1d

    .line 1164
    monitor-exit v4

    goto :goto_10

    .line 1162
    :catchall_1a
    move-exception v2

    monitor-exit v4
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v2

    .line 1167
    :cond_1d
    :try_start_1d
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    invoke-interface {v3}, Lcom/google/tts/ITtsBeta;->getLanguage()[Ljava/lang/String;

    move-result-object v1

    .line 1168
    .local v1, "locStrings":[Ljava/lang/String;
    if-eqz v1, :cond_3a

    array-length v3, v1

    const/4 v5, 0x3

    if-ne v3, v5, :cond_3a

    .line 1169
    new-instance v3, Ljava/util/Locale;

    const/4 v5, 0x0

    aget-object v5, v1, v5

    const/4 v6, 0x1

    aget-object v6, v1, v6

    const/4 v7, 0x2

    aget-object v7, v1, v7

    invoke-direct {v3, v5, v6, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_37
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_37} :catch_3c
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_37} :catch_4f
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_37} :catch_61
    .catchall {:try_start_1d .. :try_end_37} :catchall_1a

    :try_start_37
    monitor-exit v4

    move-object v2, v3

    goto :goto_10

    .line 1171
    :cond_3a
    monitor-exit v4

    goto :goto_10

    .line 1173
    .end local v1    # "locStrings":[Ljava/lang/String;
    :catch_3c
    move-exception v0

    .line 1175
    .local v0, "e":Landroid/os/RemoteException;
    const-string v3, "TextToSpeech.java - getLanguage"

    const-string v5, "RemoteException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1176
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1177
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1178
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 1192
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_4d
    monitor-exit v4

    goto :goto_10

    .line 1179
    :catch_4f
    move-exception v0

    .line 1181
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - getLanguage"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1183
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1184
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_4d

    .line 1185
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_61
    move-exception v0

    .line 1187
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - getLanguage"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1188
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1189
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1190
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_72
    .catchall {:try_start_37 .. :try_end_72} :catchall_1a

    goto :goto_4d
.end method

.method public isLanguageAvailable(Ljava/util/Locale;)I
    .registers 9
    .param p1, "loc"    # Ljava/util/Locale;

    .prologue
    .line 1208
    sget-boolean v2, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v2, :cond_10

    .line 1209
    const-string v2, "TextToSpeechBeta"

    const-string v3, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for isLanguageAvailable"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1210
    invoke-super {p0, p1}, Landroid/speech/tts/TextToSpeech;->isLanguageAvailable(Ljava/util/Locale;)I

    move-result v1

    .line 1240
    :goto_f
    return v1

    .line 1212
    :cond_10
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1213
    const/4 v1, -0x2

    .line 1214
    .local v1, "result":I
    :try_start_14
    iget-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v2, :cond_1d

    .line 1215
    monitor-exit v3

    goto :goto_f

    .line 1212
    :catchall_1a
    move-exception v2

    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v2

    .line 1219
    :cond_1d
    :try_start_1d
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    .line 1220
    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v5, v6}, Lcom/google/tts/ITtsBeta;->isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2e
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_2e} :catch_31
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_2e} :catch_45
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_2e} :catch_57
    .catchall {:try_start_1d .. :try_end_2e} :catchall_43

    move-result v1

    .line 1240
    :goto_2f
    :try_start_2f
    monitor-exit v3
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_1a

    goto :goto_f

    .line 1221
    :catch_31
    move-exception v0

    .line 1223
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_32
    const-string v2, "TextToSpeech.java - isLanguageAvailable"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1224
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1225
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1226
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_2f

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_43
    move-exception v2

    goto :goto_2f

    .line 1227
    :catch_45
    move-exception v0

    .line 1229
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - isLanguageAvailable"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1230
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1231
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1232
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_2f

    .line 1233
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_57
    move-exception v0

    .line 1235
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - isLanguageAvailable"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1236
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1237
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1238
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_68
    .catchall {:try_start_32 .. :try_end_68} :catchall_43

    goto :goto_2f
.end method

.method public isSpeaking()Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 901
    sget-boolean v2, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v2, :cond_11

    .line 902
    const-string v1, "TextToSpeechBeta"

    const-string v2, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for isSpeaking"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 903
    invoke-super {p0}, Landroid/speech/tts/TextToSpeech;->isSpeaking()Z

    move-result v1

    .line 930
    :goto_10
    return v1

    .line 905
    :cond_11
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v2

    .line 906
    :try_start_14
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_1d

    .line 907
    monitor-exit v2

    goto :goto_10

    .line 905
    :catchall_1a
    move-exception v1

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v1

    .line 910
    :cond_1d
    :try_start_1d
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    invoke-interface {v3}, Lcom/google/tts/ITtsBeta;->isSpeaking()Z
    :try_end_22
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_22} :catch_25
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_22} :catch_38
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_22} :catch_4a
    .catchall {:try_start_1d .. :try_end_22} :catchall_1a

    move-result v1

    :try_start_23
    monitor-exit v2

    goto :goto_10

    .line 911
    :catch_25
    move-exception v0

    .line 913
    .local v0, "e":Landroid/os/RemoteException;
    const-string v3, "TextToSpeech.java - isSpeaking"

    const-string v4, "RemoteException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 914
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 915
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 916
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    .line 930
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_36
    monitor-exit v2

    goto :goto_10

    .line 917
    :catch_38
    move-exception v0

    .line 919
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - isSpeaking"

    const-string v4, "NullPointerException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 921
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 922
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_36

    .line 923
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4a
    move-exception v0

    .line 925
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - isSpeaking"

    const-string v4, "IllegalStateException"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 927
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 928
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5b
    .catchall {:try_start_23 .. :try_end_5b} :catchall_1a

    goto :goto_36
.end method

.method public playEarcon(Ljava/lang/String;ILjava/util/HashMap;)I
    .registers 11
    .param p1, "earcon"    # Ljava/lang/String;
    .param p2, "queueMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 793
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_10

    .line 794
    const-string v3, "TextToSpeechBeta"

    const-string v4, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for playEarcon"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 795
    invoke-super {p0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->playEarcon(Ljava/lang/String;ILjava/util/HashMap;)I

    move-result v2

    .line 834
    :goto_f
    return v2

    .line 797
    :cond_10
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 798
    const/4 v2, -0x1

    .line 799
    .local v2, "result":I
    :try_start_14
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_1d

    .line 800
    monitor-exit v4

    goto :goto_f

    .line 797
    :catchall_1a
    move-exception v3

    monitor-exit v4
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v3

    .line 803
    :cond_1d
    if-eqz p3, :cond_45

    :try_start_1f
    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_45

    .line 804
    const-string v3, "streamType"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 805
    .local v1, "extra":Ljava/lang/String;
    if-eqz v1, :cond_35

    .line 806
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v5, 0x9

    aput-object v1, v3, v5

    .line 808
    :cond_35
    const-string v3, "utteranceId"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "extra":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 809
    .restart local v1    # "extra":Ljava/lang/String;
    if-eqz v1, :cond_45

    .line 810
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v5, 0xb

    aput-object v1, v3, v5

    .line 813
    .end local v1    # "extra":Ljava/lang/String;
    :cond_45
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-interface {v3, v5, p1, p2, v6}, Lcom/google/tts/ITtsBeta;->playEarcon(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I
    :try_end_4d
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_4d} :catch_53
    .catch Ljava/lang/NullPointerException; {:try_start_1f .. :try_end_4d} :catch_67
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_4d} :catch_79
    .catchall {:try_start_1f .. :try_end_4d} :catchall_65

    move-result v2

    .line 833
    :goto_4e
    :try_start_4e
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->resetCachedParams()V

    .line 834
    monitor-exit v4
    :try_end_52
    .catchall {:try_start_4e .. :try_end_52} :catchall_1a

    goto :goto_f

    .line 814
    :catch_53
    move-exception v0

    .line 816
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_54
    const-string v3, "TextToSpeech.java - playEarcon"

    const-string v5, "RemoteException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 817
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 818
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 819
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_4e

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_65
    move-exception v3

    goto :goto_4e

    .line 820
    :catch_67
    move-exception v0

    .line 822
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - playEarcon"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 823
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 824
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 825
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_4e

    .line 826
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_79
    move-exception v0

    .line 828
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - playEarcon"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 829
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 830
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 831
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_8a
    .catchall {:try_start_54 .. :try_end_8a} :catchall_65

    goto :goto_4e
.end method

.method public playSilence(JILjava/util/HashMap;)I
    .registers 15
    .param p1, "durationInMs"    # J
    .param p3, "queueMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 853
    .local p4, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-boolean v0, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v0, :cond_10

    .line 854
    const-string v0, "TextToSpeechBeta"

    const-string v1, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for playSilence"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 855
    invoke-super {p0, p1, p2, p3, p4}, Landroid/speech/tts/TextToSpeech;->playSilence(JILjava/util/HashMap;)I

    move-result v8

    .line 889
    :goto_f
    return v8

    .line 857
    :cond_10
    iget-object v9, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v9

    .line 858
    const/4 v8, -0x1

    .line 859
    .local v8, "result":I
    :try_start_14
    iget-boolean v0, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v0, :cond_1d

    .line 860
    monitor-exit v9

    goto :goto_f

    .line 857
    :catchall_1a
    move-exception v0

    monitor-exit v9
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v0

    .line 863
    :cond_1d
    if-eqz p4, :cond_35

    :try_start_1f
    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    .line 864
    const-string v0, "utteranceId"

    invoke-virtual {p4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 865
    .local v7, "extra":Ljava/lang/String;
    if-eqz v7, :cond_35

    .line 866
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v1, 0xb

    aput-object v7, v0, v1

    .line 869
    .end local v7    # "extra":Ljava/lang/String;
    :cond_35
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    move-wide v2, p1

    move v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/google/tts/ITtsBeta;->playSilence(Ljava/lang/String;JI[Ljava/lang/String;)I
    :try_end_40
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_40} :catch_43
    .catch Ljava/lang/NullPointerException; {:try_start_1f .. :try_end_40} :catch_57
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_40} :catch_69
    .catchall {:try_start_1f .. :try_end_40} :catchall_55

    move-result v8

    .line 889
    :goto_41
    :try_start_41
    monitor-exit v9
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_1a

    goto :goto_f

    .line 870
    :catch_43
    move-exception v6

    .line 872
    .local v6, "e":Landroid/os/RemoteException;
    :try_start_44
    const-string v0, "TextToSpeech.java - playSilence"

    const-string v1, "RemoteException"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    .line 874
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 875
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_41

    .end local v6    # "e":Landroid/os/RemoteException;
    :catchall_55
    move-exception v0

    goto :goto_41

    .line 876
    :catch_57
    move-exception v6

    .line 878
    .local v6, "e":Ljava/lang/NullPointerException;
    const-string v0, "TextToSpeech.java - playSilence"

    const-string v1, "NullPointerException"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    invoke-virtual {v6}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 880
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 881
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_41

    .line 882
    .end local v6    # "e":Ljava/lang/NullPointerException;
    :catch_69
    move-exception v6

    .line 884
    .local v6, "e":Ljava/lang/IllegalStateException;
    const-string v0, "TextToSpeech.java - playSilence"

    const-string v1, "IllegalStateException"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    invoke-virtual {v6}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 886
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 887
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_7a
    .catchall {:try_start_44 .. :try_end_7a} :catchall_55

    goto :goto_41
.end method

.method public setLanguage(Ljava/util/Locale;)I
    .registers 10
    .param p1, "loc"    # Ljava/util/Locale;

    .prologue
    .line 1102
    sget-boolean v2, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v2, :cond_10

    .line 1103
    const-string v2, "TextToSpeechBeta"

    const-string v3, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for setLanguage"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1104
    invoke-super {p0, p1}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v1

    .line 1143
    :goto_f
    return v1

    .line 1106
    :cond_10
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1107
    const/4 v1, -0x2

    .line 1108
    .local v1, "result":I
    :try_start_14
    iget-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v2, :cond_1d

    .line 1109
    monitor-exit v3

    goto :goto_f

    .line 1106
    :catchall_1a
    move-exception v2

    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v2

    .line 1112
    :cond_1d
    :try_start_1d
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v4, 0x3

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 1113
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v4, 0x5

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 1114
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v4, 0x7

    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 1121
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    .line 1122
    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v6, 0x5

    aget-object v5, v5, v6

    .line 1123
    iget-object v6, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v7, 0x7

    aget-object v6, v6, v7

    .line 1121
    invoke-interface {v2, v4, v5, v6}, Lcom/google/tts/ITtsBeta;->isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_4c} :catch_4f
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_4c} :catch_63
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_4c} :catch_75
    .catchall {:try_start_1d .. :try_end_4c} :catchall_61

    move-result v1

    .line 1143
    :goto_4d
    :try_start_4d
    monitor-exit v3
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_1a

    goto :goto_f

    .line 1124
    :catch_4f
    move-exception v0

    .line 1126
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_50
    const-string v2, "TextToSpeech.java - setLanguage"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1127
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1128
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1129
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_4d

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_61
    move-exception v2

    goto :goto_4d

    .line 1130
    :catch_63
    move-exception v0

    .line 1132
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - setLanguage"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1133
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1134
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1135
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_4d

    .line 1136
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_75
    move-exception v0

    .line 1138
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - setLanguage"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1139
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1140
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1141
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_86
    .catchall {:try_start_50 .. :try_end_86} :catchall_61

    goto :goto_4d
.end method

.method public setOnUtteranceCompletedListener(Lcom/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener;)I
    .registers 9
    .param p1, "listener"    # Lcom/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener;

    .prologue
    .line 1329
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_15

    .line 1330
    const-string v3, "TextToSpeechBeta"

    const-string v4, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for setOnUtteranceCompletedListener"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1332
    new-instance v1, Lcom/google/tts/TextToSpeechBeta$3;

    invoke-direct {v1, p0, p1}, Lcom/google/tts/TextToSpeechBeta$3;-><init>(Lcom/google/tts/TextToSpeechBeta;Lcom/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener;)V

    .line 1338
    .local v1, "platformUtteranceCompletedListener":Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;
    invoke-super {p0, v1}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceCompletedListener(Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;)I

    move-result v2

    .line 1373
    .end local v1    # "platformUtteranceCompletedListener":Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;
    :goto_14
    return v2

    .line 1340
    :cond_15
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1341
    const/4 v2, -0x1

    .line 1342
    .local v2, "result":I
    :try_start_19
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_22

    .line 1343
    monitor-exit v4

    goto :goto_14

    .line 1340
    :catchall_1f
    move-exception v3

    monitor-exit v4
    :try_end_21
    .catchall {:try_start_19 .. :try_end_21} :catchall_1f

    throw v3

    .line 1345
    :cond_22
    :try_start_22
    new-instance v3, Lcom/google/tts/TextToSpeechBeta$4;

    invoke-direct {v3, p0, p1}, Lcom/google/tts/TextToSpeechBeta$4;-><init>(Lcom/google/tts/TextToSpeechBeta;Lcom/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener;)V

    iput-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITtscallback:Lcom/google/tts/ITtsCallbackBeta;
    :try_end_29
    .catchall {:try_start_22 .. :try_end_29} :catchall_1f

    .line 1353
    :try_start_29
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/tts/TextToSpeechBeta;->mITtscallback:Lcom/google/tts/ITtsCallbackBeta;

    invoke-interface {v3, v5, v6}, Lcom/google/tts/ITtsBeta;->registerCallback(Ljava/lang/String;Lcom/google/tts/ITtsCallbackBeta;)I
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_29 .. :try_end_32} :catch_35
    .catch Ljava/lang/NullPointerException; {:try_start_29 .. :try_end_32} :catch_49
    .catch Ljava/lang/IllegalStateException; {:try_start_29 .. :try_end_32} :catch_5b
    .catchall {:try_start_29 .. :try_end_32} :catchall_47

    move-result v2

    .line 1373
    :goto_33
    :try_start_33
    monitor-exit v4
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_1f

    goto :goto_14

    .line 1354
    :catch_35
    move-exception v0

    .line 1356
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_36
    const-string v3, "TextToSpeech.java - registerCallback"

    const-string v5, "RemoteException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1357
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1358
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1359
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_33

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_47
    move-exception v3

    goto :goto_33

    .line 1360
    :catch_49
    move-exception v0

    .line 1362
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - registerCallback"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1363
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1364
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1365
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_33

    .line 1366
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_5b
    move-exception v0

    .line 1368
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - registerCallback"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1369
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1370
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1371
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_6c
    .catchall {:try_start_36 .. :try_end_6c} :catchall_47

    goto :goto_33
.end method

.method public setPitch(F)I
    .registers 8
    .param p1, "pitch"    # F

    .prologue
    .line 1048
    sget-boolean v2, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v2, :cond_10

    .line 1049
    const-string v2, "TextToSpeechBeta"

    .line 1050
    const-string v3, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech"

    .line 1049
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1051
    invoke-super {p0, p1}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    move-result v1

    .line 1081
    :goto_f
    return v1

    .line 1053
    :cond_10
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1054
    const/4 v1, -0x1

    .line 1055
    .local v1, "result":I
    :try_start_14
    iget-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v2, :cond_1d

    .line 1056
    monitor-exit v3

    goto :goto_f

    .line 1053
    :catchall_1a
    move-exception v2

    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v2

    .line 1059
    :cond_1d
    const/4 v2, 0x0

    cmpl-float v2, p1, v2

    if-lez v2, :cond_2e

    .line 1060
    :try_start_22
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v5, p1

    float-to-int v5, v5

    invoke-interface {v2, v4, v5}, Lcom/google/tts/ITtsBeta;->setPitch(Ljava/lang/String;I)I
    :try_end_2d
    .catch Landroid/os/RemoteException; {:try_start_22 .. :try_end_2d} :catch_30
    .catch Ljava/lang/NullPointerException; {:try_start_22 .. :try_end_2d} :catch_44
    .catch Ljava/lang/IllegalStateException; {:try_start_22 .. :try_end_2d} :catch_56
    .catchall {:try_start_22 .. :try_end_2d} :catchall_42

    move-result v1

    .line 1081
    :cond_2e
    :goto_2e
    :try_start_2e
    monitor-exit v3
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_1a

    goto :goto_f

    .line 1062
    :catch_30
    move-exception v0

    .line 1064
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_31
    const-string v2, "TextToSpeech.java - setPitch"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1065
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1066
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1067
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_2e

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_42
    move-exception v2

    goto :goto_2e

    .line 1068
    :catch_44
    move-exception v0

    .line 1070
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - setPitch"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1071
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1072
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1073
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_2e

    .line 1074
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_56
    move-exception v0

    .line 1076
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - setPitch"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1077
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1078
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1079
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_67
    .catchall {:try_start_31 .. :try_end_67} :catchall_42

    goto :goto_2e
.end method

.method public setSpeechRate(F)I
    .registers 10
    .param p1, "speechRate"    # F

    .prologue
    const/4 v7, 0x0

    .line 993
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_11

    .line 994
    const-string v3, "TextToSpeechBeta"

    .line 995
    const-string v4, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech"

    .line 994
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 996
    invoke-super {p0, p1}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    move-result v2

    .line 1029
    :goto_10
    return v2

    .line 998
    :cond_11
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 999
    const/4 v2, -0x1

    .line 1000
    .local v2, "result":I
    :try_start_15
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_1e

    .line 1001
    monitor-exit v4

    goto :goto_10

    .line 998
    :catchall_1b
    move-exception v3

    monitor-exit v4
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v3

    .line 1004
    :cond_1e
    cmpl-float v3, p1, v7

    if-lez v3, :cond_34

    .line 1005
    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v3, p1

    float-to-int v1, v3

    .line 1006
    .local v1, "rate":I
    :try_start_26
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/4 v5, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5
    :try_end_2f
    .catch Ljava/lang/NullPointerException; {:try_start_26 .. :try_end_2f} :catch_38
    .catch Ljava/lang/IllegalStateException; {:try_start_26 .. :try_end_2f} :catch_4c
    .catchall {:try_start_26 .. :try_end_2f} :catchall_4a

    .line 1010
    cmpl-float v3, p1, v7

    if-lez v3, :cond_36

    .line 1011
    const/4 v2, 0x0

    .line 1029
    .end local v1    # "rate":I
    :cond_34
    :goto_34
    :try_start_34
    monitor-exit v4
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_1b

    goto :goto_10

    .line 1013
    .restart local v1    # "rate":I
    :cond_36
    const/4 v2, -0x1

    goto :goto_34

    .line 1016
    :catch_38
    move-exception v0

    .line 1018
    .local v0, "e":Ljava/lang/NullPointerException;
    :try_start_39
    const-string v3, "TextToSpeech.java - setSpeechRate"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1020
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1021
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_34

    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catchall_4a
    move-exception v3

    goto :goto_34

    .line 1022
    :catch_4c
    move-exception v0

    .line 1024
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - setSpeechRate"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1025
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1026
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1027
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5d
    .catchall {:try_start_39 .. :try_end_5d} :catchall_4a

    goto :goto_34
.end method

.method public shutdown()V
    .registers 3

    .prologue
    .line 482
    sget-boolean v0, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v0, :cond_f

    .line 483
    const-string v0, "TextToSpeechBeta"

    const-string v1, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for shutdown"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    invoke-super {p0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 493
    :goto_e
    return-void

    .line 488
    :cond_f
    :try_start_f
    iget-object v0, p0, Lcom/google/tts/TextToSpeechBeta;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/tts/TextToSpeechBeta;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_16
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_16} :catch_17

    goto :goto_e

    .line 489
    :catch_17
    move-exception v0

    goto :goto_e
.end method

.method public speak(Ljava/lang/String;ILjava/util/HashMap;)I
    .registers 11
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "queueMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 731
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_10

    .line 732
    const-string v3, "TextToSpeechBeta"

    const-string v4, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for speak"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 733
    invoke-super {p0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    move-result v2

    .line 773
    :goto_f
    return v2

    .line 735
    :cond_10
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 736
    const/4 v2, -0x1

    .line 737
    .local v2, "result":I
    :try_start_14
    const-string v3, "TTS received: "

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_22

    .line 739
    monitor-exit v4

    goto :goto_f

    .line 735
    :catchall_1f
    move-exception v3

    monitor-exit v4
    :try_end_21
    .catchall {:try_start_14 .. :try_end_21} :catchall_1f

    throw v3

    .line 742
    :cond_22
    if-eqz p3, :cond_4a

    :try_start_24
    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4a

    .line 743
    const-string v3, "streamType"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 744
    .local v1, "extra":Ljava/lang/String;
    if-eqz v1, :cond_3a

    .line 745
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v5, 0x9

    aput-object v1, v3, v5

    .line 747
    :cond_3a
    const-string v3, "utteranceId"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "extra":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 748
    .restart local v1    # "extra":Ljava/lang/String;
    if-eqz v1, :cond_4a

    .line 749
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v5, 0xb

    aput-object v1, v3, v5

    .line 752
    .end local v1    # "extra":Ljava/lang/String;
    :cond_4a
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    invoke-interface {v3, v5, p1, p2, v6}, Lcom/google/tts/ITtsBeta;->speak(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I
    :try_end_53
    .catch Landroid/os/RemoteException; {:try_start_24 .. :try_end_53} :catch_59
    .catch Ljava/lang/NullPointerException; {:try_start_24 .. :try_end_53} :catch_6d
    .catch Ljava/lang/IllegalStateException; {:try_start_24 .. :try_end_53} :catch_7f
    .catchall {:try_start_24 .. :try_end_53} :catchall_6b

    move-result v2

    .line 772
    :goto_54
    :try_start_54
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->resetCachedParams()V

    .line 773
    monitor-exit v4
    :try_end_58
    .catchall {:try_start_54 .. :try_end_58} :catchall_1f

    goto :goto_f

    .line 753
    :catch_59
    move-exception v0

    .line 755
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_5a
    const-string v3, "TextToSpeech.java - speak"

    const-string v5, "RemoteException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 756
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 757
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 758
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_54

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_6b
    move-exception v3

    goto :goto_54

    .line 759
    :catch_6d
    move-exception v0

    .line 761
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - speak"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 762
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 763
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 764
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_54

    .line 765
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_7f
    move-exception v0

    .line 767
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - speak"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 768
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 769
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 770
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_90
    .catchall {:try_start_5a .. :try_end_90} :catchall_6b

    goto :goto_54
.end method

.method public stop()I
    .registers 6

    .prologue
    .line 943
    sget-boolean v2, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v2, :cond_10

    .line 944
    const-string v2, "TextToSpeechBeta"

    const-string v3, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for stop"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    invoke-super {p0}, Landroid/speech/tts/TextToSpeech;->stop()I

    move-result v1

    .line 973
    :goto_f
    return v1

    .line 947
    :cond_10
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v3

    .line 948
    const/4 v1, -0x1

    .line 949
    .local v1, "result":I
    :try_start_14
    iget-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v2, :cond_1d

    .line 950
    monitor-exit v3

    goto :goto_f

    .line 947
    :catchall_1a
    move-exception v2

    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v2

    .line 953
    :cond_1d
    :try_start_1d
    iget-object v2, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    invoke-interface {v2, v4}, Lcom/google/tts/ITtsBeta;->stop(Ljava/lang/String;)I
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1d .. :try_end_24} :catch_27
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_24} :catch_3b
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_24} :catch_4d
    .catchall {:try_start_1d .. :try_end_24} :catchall_39

    move-result v1

    .line 973
    :goto_25
    :try_start_25
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_1a

    goto :goto_f

    .line 954
    :catch_27
    move-exception v0

    .line 956
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_28
    const-string v2, "TextToSpeech.java - stop"

    const-string v4, "RemoteException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 957
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 958
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 959
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_25

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_39
    move-exception v2

    goto :goto_25

    .line 960
    :catch_3b
    move-exception v0

    .line 962
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v2, "TextToSpeech.java - stop"

    const-string v4, "NullPointerException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 963
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 964
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 965
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_25

    .line 966
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_4d
    move-exception v0

    .line 968
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v2, "TextToSpeech.java - stop"

    const-string v4, "IllegalStateException"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 969
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 970
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 971
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_5e
    .catchall {:try_start_28 .. :try_end_5e} :catchall_39

    goto :goto_25
.end method

.method public synthesizeToFile(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)I
    .registers 11
    .param p1, "text"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1260
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-boolean v3, Lcom/google/tts/TextToSpeechBeta;->ttsBetaInstalled:Z

    if-nez v3, :cond_10

    .line 1261
    const-string v3, "TextToSpeechBeta"

    const-string v4, "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for synthesizeToFile"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1262
    invoke-super {p0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->synthesizeToFile(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)I

    move-result v2

    .line 1300
    :goto_f
    return v2

    .line 1264
    :cond_10
    iget-object v4, p0, Lcom/google/tts/TextToSpeechBeta;->mStartLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1265
    const/4 v2, -0x1

    .line 1266
    .local v2, "result":I
    :try_start_14
    iget-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    if-nez v3, :cond_1d

    .line 1267
    monitor-exit v4

    goto :goto_f

    .line 1264
    :catchall_1a
    move-exception v3

    monitor-exit v4
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1a

    throw v3

    .line 1270
    :cond_1d
    if-eqz p2, :cond_35

    :try_start_1f
    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_35

    .line 1272
    const-string v3, "utteranceId"

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1273
    .local v1, "extra":Ljava/lang/String;
    if-eqz v1, :cond_35

    .line 1274
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    const/16 v5, 0xb

    aput-object v1, v3, v5

    .line 1277
    .end local v1    # "extra":Ljava/lang/String;
    :cond_35
    iget-object v3, p0, Lcom/google/tts/TextToSpeechBeta;->mITts:Lcom/google/tts/ITtsBeta;

    iget-object v5, p0, Lcom/google/tts/TextToSpeechBeta;->mPackageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/tts/TextToSpeechBeta;->mCachedParams:[Ljava/lang/String;

    invoke-interface {v3, v5, p1, v6, p3}, Lcom/google/tts/ITtsBeta;->synthesizeToFile(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_3e
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_3e} :catch_47
    .catch Ljava/lang/NullPointerException; {:try_start_1f .. :try_end_3e} :catch_5b
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_3e} :catch_6d
    .catchall {:try_start_1f .. :try_end_3e} :catchall_59

    move-result v3

    if-eqz v3, :cond_42

    .line 1278
    const/4 v2, 0x0

    .line 1299
    :cond_42
    :goto_42
    :try_start_42
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->resetCachedParams()V

    .line 1300
    monitor-exit v4
    :try_end_46
    .catchall {:try_start_42 .. :try_end_46} :catchall_1a

    goto :goto_f

    .line 1280
    :catch_47
    move-exception v0

    .line 1282
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_48
    const-string v3, "TextToSpeech.java - synthesizeToFile"

    const-string v5, "RemoteException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 1284
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1285
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_42

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_59
    move-exception v3

    goto :goto_42

    .line 1286
    :catch_5b
    move-exception v0

    .line 1288
    .local v0, "e":Ljava/lang/NullPointerException;
    const-string v3, "TextToSpeech.java - synthesizeToFile"

    const-string v5, "NullPointerException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1289
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    .line 1290
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1291
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V

    goto :goto_42

    .line 1292
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_6d
    move-exception v0

    .line 1294
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v3, "TextToSpeech.java - synthesizeToFile"

    const-string v5, "IllegalStateException"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1295
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1296
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/tts/TextToSpeechBeta;->mStarted:Z

    .line 1297
    invoke-direct {p0}, Lcom/google/tts/TextToSpeechBeta;->initTts()V
    :try_end_7e
    .catchall {:try_start_48 .. :try_end_7e} :catchall_59

    goto :goto_42
.end method
