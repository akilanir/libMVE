.class public Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;
.super Ljava/lang/Object;
.source "HapticFeedbackController.java"


# static fields
.field private static final VIBRATE_DELAY_MS:I = 0x7d

.field private static final VIBRATE_LENGTH_MS:I = 0x32


# instance fields
.field private final mContentObserver:Landroid/database/ContentObserver;

.field private final mContext:Landroid/content/Context;

.field private mIsGloballyEnabled:Z

.field private mLastVibrate:J

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    .line 33
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController$1;-><init>(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContentObserver:Landroid/database/ContentObserver;

    .line 39
    return-void
.end method

.method static synthetic access$002(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;
    .param p1, "x1"    # Z

    .prologue
    .line 15
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mIsGloballyEnabled:Z

    return p1
.end method

.method static synthetic access$100(Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Landroid/content/Context;)Z
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-static {p0}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->checkGlobalSetting(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private static checkGlobalSetting(Landroid/content/Context;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "haptic_feedback_enabled"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_f

    :goto_e
    return v0

    :cond_f
    move v0, v1

    goto :goto_e
.end method

.method private hasVibratePermission(Landroid/content/Context;)Z
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 63
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const-string v2, "android.permission.VIBRATE"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 64
    .local v0, "hasPerm":I
    if-nez v0, :cond_12

    const/4 v2, 0x1

    :goto_11
    return v2

    :cond_12
    const/4 v2, 0x0

    goto :goto_11
.end method


# virtual methods
.method public start()V
    .registers 5

    .prologue
    .line 45
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->hasVibratePermission(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 46
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mVibrator:Landroid/os/Vibrator;

    .line 50
    :cond_14
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->checkGlobalSetting(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mIsGloballyEnabled:Z

    .line 51
    const-string v1, "haptic_feedback_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 52
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 53
    return-void
.end method

.method public stop()V
    .registers 3

    .prologue
    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mVibrator:Landroid/os/Vibrator;

    .line 72
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 73
    return-void
.end method

.method public tryVibrate()V
    .registers 7

    .prologue
    .line 80
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mVibrator:Landroid/os/Vibrator;

    if-eqz v2, :cond_1f

    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mIsGloballyEnabled:Z

    if-eqz v2, :cond_1f

    .line 81
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 83
    .local v0, "now":J
    iget-wide v2, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mLastVibrate:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x7d

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1f

    .line 84
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mVibrator:Landroid/os/Vibrator;

    const-wide/16 v3, 0x32

    invoke-virtual {v2, v3, v4}, Landroid/os/Vibrator;->vibrate(J)V

    .line 85
    iput-wide v0, p0, Lcom/wdullaer/materialdatetimepicker/HapticFeedbackController;->mLastVibrate:J

    .line 88
    .end local v0    # "now":J
    :cond_1f
    return-void
.end method
