.class public final Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;
.super Ljava/lang/Object;
.source "CustomActivityOnCrash.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# static fields
.field private static final CAOC_HANDLER_PACKAGE_NAME:Ljava/lang/String; = "cat.ereza.customactivityoncrash"

.field private static final DEFAULT_HANDLER_PACKAGE_NAME:Ljava/lang/String; = "com.android.internal.os"

.field private static final EXTRA_IMAGE_DRAWABLE_ID:Ljava/lang/String; = "cat.ereza.customactivityoncrash.EXTRA_IMAGE_DRAWABLE_ID"

.field private static final EXTRA_RESTART_ACTIVITY_CLASS:Ljava/lang/String; = "cat.ereza.customactivityoncrash.EXTRA_RESTART_ACTIVITY_CLASS"

.field private static final EXTRA_SHOW_ERROR_DETAILS:Ljava/lang/String; = "cat.ereza.customactivityoncrash.EXTRA_SHOW_ERROR_DETAILS"

.field private static final EXTRA_STACK_TRACE:Ljava/lang/String; = "cat.ereza.customactivityoncrash.EXTRA_STACK_TRACE"

.field private static final INTENT_ACTION_ERROR_ACTIVITY:Ljava/lang/String; = "cat.ereza.customactivityoncrash.ERROR"

.field private static final INTENT_ACTION_RESTART_ACTIVITY:Ljava/lang/String; = "cat.ereza.customactivityoncrash.RESTART"

.field private static final MAX_STACK_TRACE_SIZE:I = 0x1ffff

.field private static final TAG:Ljava/lang/String; = "CustomActivityOnCrash"

.field private static application:Landroid/app/Application;

.field private static defaultErrorActivityDrawableId:I

.field private static enableAppRestart:Z

.field private static errorActivityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static isInBackground:Z

.field private static lastActivityCreated:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static launchErrorActivityWhenInBackground:Z

.field private static restartActivityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static showErrorDetails:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 65
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    .line 66
    const/4 v0, 0x0

    sput-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z

    .line 69
    sput-boolean v1, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->launchErrorActivityWhenInBackground:Z

    .line 70
    sput-boolean v1, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->showErrorDetails:Z

    .line 71
    sput-boolean v1, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z

    .line 72
    sget v0, Lcat/ereza/customactivityoncrash/R$drawable;->customactivityoncrash_error_image:I

    sput v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->defaultErrorActivityDrawableId:I

    .line 73
    sput-object v2, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;

    .line 74
    sput-object v2, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/Class;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 1
    .param p0, "x0"    # Ljava/lang/Class;

    .prologue
    .line 47
    sput-object p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$100()Landroid/app/Application;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;

    return-object v0
.end method

.method static synthetic access$1000()I
    .registers 1

    .prologue
    .line 47
    sget v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->defaultErrorActivityDrawableId:I

    return v0
.end method

.method static synthetic access$1100()Ljava/lang/ref/WeakReference;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$1102(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .registers 1
    .param p0, "x0"    # Ljava/lang/ref/WeakReference;

    .prologue
    .line 47
    sput-object p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$1200()V
    .registers 0

    .prologue
    .line 47
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->killCurrentProcess()V

    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;)Ljava/lang/Class;
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->guessErrorActivityClass(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/Throwable;Ljava/lang/Class;)Z
    .registers 3
    .param p0, "x0"    # Ljava/lang/Throwable;
    .param p1, "x1"    # Ljava/lang/Class;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isStackTraceLikelyConflictive(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400()Z
    .registers 1

    .prologue
    .line 47
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->launchErrorActivityWhenInBackground:Z

    return v0
.end method

.method static synthetic access$500()Z
    .registers 1

    .prologue
    .line 47
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z

    return v0
.end method

.method static synthetic access$502(Z)Z
    .registers 1
    .param p0, "x0"    # Z

    .prologue
    .line 47
    sput-boolean p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z

    return p0
.end method

.method static synthetic access$600()Z
    .registers 1

    .prologue
    .line 47
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z

    return v0
.end method

.method static synthetic access$700()Ljava/lang/Class;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 1
    .param p0, "x0"    # Ljava/lang/Class;

    .prologue
    .line 47
    sput-object p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$800(Landroid/content/Context;)Ljava/lang/Class;
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->guessRestartActivityClass(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900()Z
    .registers 1

    .prologue
    .line 47
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->showErrorDetails:Z

    return v0
.end method

.method private static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 522
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_b

    .line 523
    :cond_8
    const-string p0, ""

    .line 529
    .end local p0    # "s":Ljava/lang/String;
    .local v0, "first":C
    :cond_a
    :goto_a
    return-object p0

    .line 525
    .end local v0    # "first":C
    .restart local p0    # "s":Ljava/lang/String;
    :cond_b
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 526
    .restart local v0    # "first":C
    invoke-static {v0}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_a

    .line 529
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_a
.end method

.method public static closeApplication(Landroid/app/Activity;)V
    .registers 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 317
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 318
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->killCurrentProcess()V

    .line 319
    return-void
.end method

.method public static getAllErrorDetailsFromIntent(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 258
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 259
    .local v1, "currentDate":Ljava/util/Date;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd HH:mm:ss"

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 262
    .local v2, "dateFormat":Ljava/text/DateFormat;
    invoke-static {p0, v2}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getBuildDateAsString(Landroid/content/Context;Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "buildDateAsString":Ljava/lang/String;
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 267
    .local v4, "versionName":Ljava/lang/String;
    const-string v3, ""

    .line 269
    .local v3, "errorDetails":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Build version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 270
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Build date: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Current date: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 272
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getDeviceModelName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \n\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 273
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Stack trace:  \n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 274
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getStackTraceFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 275
    return-object v3
.end method

.method private static getBuildDateAsString(Landroid/content/Context;Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 472
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 473
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    new-instance v6, Ljava/util/zip/ZipFile;

    iget-object v7, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 474
    .local v6, "zf":Ljava/util/zip/ZipFile;
    const-string v7, "classes.dex"

    invoke-virtual {v6, v7}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v5

    .line 475
    .local v5, "ze":Ljava/util/zip/ZipEntry;
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v3

    .line 476
    .local v3, "time":J
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 477
    .local v1, "buildDate":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    .line 481
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "time":J
    .end local v5    # "ze":Ljava/util/zip/ZipEntry;
    .end local v6    # "zf":Ljava/util/zip/ZipFile;
    :goto_2a
    return-object v1

    .line 478
    .end local v1    # "buildDate":Ljava/lang/String;
    :catch_2b
    move-exception v2

    .line 479
    .local v2, "e":Ljava/lang/Exception;
    const-string v1, "Unknown"

    .restart local v1    # "buildDate":Ljava/lang/String;
    goto :goto_2a
.end method

.method public static getDefaultErrorActivityDrawable()I
    .registers 1

    .prologue
    .line 369
    sget v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->defaultErrorActivityDrawableId:I

    return v0
.end method

.method public static getDefaultErrorActivityDrawableIdFromIntent(Landroid/content/Intent;)I
    .registers 3
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 235
    const-string v0, "cat.ereza.customactivityoncrash.EXTRA_IMAGE_DRAWABLE_ID"

    sget v1, Lcat/ereza/customactivityoncrash/R$drawable;->customactivityoncrash_error_image:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private static getDeviceModelName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 506
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 507
    .local v0, "manufacturer":Ljava/lang/String;
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 508
    .local v1, "model":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 509
    invoke-static {v1}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 511
    :goto_e
    return-object v2

    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_e
.end method

.method public static getErrorActivityClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 410
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method private static getErrorActivityClassWithIntentFilter(Landroid/content/Context;)Ljava/lang/Class;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 635
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const-string v5, "cat.ereza.customactivityoncrash.ERROR"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const/16 v5, 0x40

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 639
    .local v2, "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v2, :cond_35

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_35

    .line 640
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 642
    .local v1, "resolveInfo":Landroid/content/pm/ResolveInfo;
    :try_start_24
    iget-object v3, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_24 .. :try_end_2b} :catch_2d

    move-result-object v3

    .line 649
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :goto_2c
    return-object v3

    .line 643
    .restart local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :catch_2d
    move-exception v0

    .line 645
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const-string v3, "CustomActivityOnCrash"

    const-string v4, "Failed when resolving the error activity class via intent filter, stack trace follows!"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 649
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_35
    const/4 v3, 0x0

    goto :goto_2c
.end method

.method private static getLauncherActivity(Landroid/content/Context;)Ljava/lang/Class;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 591
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 592
    .local v1, "intent":Landroid/content/Intent;
    if-eqz v1, :cond_23

    .line 594
    :try_start_e
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_19
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_19} :catch_1b

    move-result-object v2

    .line 601
    :goto_1a
    return-object v2

    .line 595
    :catch_1b
    move-exception v0

    .line 597
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "Failed when resolving the restart activity class via getLaunchIntentForPackage, stack trace follows!"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 601
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_23
    const/4 v2, 0x0

    goto :goto_1a
.end method

.method public static getRestartActivityClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 427
    sget-object v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method public static getRestartActivityClassFromIntent(Landroid/content/Intent;)Ljava/lang/Class;
    .registers 3
    .param p0, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 286
    const-string v1, "cat.ereza.customactivityoncrash.EXTRA_RESTART_ACTIVITY_CLASS"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    .line 288
    .local v0, "serializedClass":Ljava/io/Serializable;
    if-eqz v0, :cond_f

    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_f

    .line 289
    check-cast v0, Ljava/lang/Class;

    .line 291
    .end local v0    # "serializedClass":Ljava/io/Serializable;
    :goto_e
    return-object v0

    .restart local v0    # "serializedClass":Ljava/io/Serializable;
    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private static getRestartActivityClassWithIntentFilter(Landroid/content/Context;)Ljava/lang/Class;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 565
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const-string v5, "cat.ereza.customactivityoncrash.RESTART"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const/16 v5, 0x40

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 569
    .local v2, "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v2, :cond_35

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_35

    .line 570
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 572
    .local v1, "resolveInfo":Landroid/content/pm/ResolveInfo;
    :try_start_24
    iget-object v3, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_24 .. :try_end_2b} :catch_2d

    move-result-object v3

    .line 579
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :goto_2c
    return-object v3

    .line 573
    .restart local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :catch_2d
    move-exception v0

    .line 575
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const-string v3, "CustomActivityOnCrash"

    const-string v4, "Failed when resolving the restart activity class via intent filter, stack trace follows!"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 579
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_35
    const/4 v3, 0x0

    goto :goto_2c
.end method

.method public static getStackTraceFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .registers 2
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 245
    const-string v0, "cat.ereza.customactivityoncrash.EXTRA_STACK_TRACE"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 492
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 493
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    .line 495
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_f
    return-object v2

    .line 494
    :catch_10
    move-exception v0

    .line 495
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "Unknown"

    goto :goto_f
.end method

.method private static guessErrorActivityClass(Landroid/content/Context;)Ljava/lang/Class;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 616
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getErrorActivityClassWithIntentFilter(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    .line 619
    .local v0, "resolvedActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    if-nez v0, :cond_8

    .line 620
    const-class v0, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    .line 623
    :cond_8
    return-object v0
.end method

.method private static guessRestartActivityClass(Landroid/content/Context;)Ljava/lang/Class;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 546
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getRestartActivityClassWithIntentFilter(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    .line 549
    .local v0, "resolvedActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    if-nez v0, :cond_a

    .line 550
    invoke-static {p0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getLauncherActivity(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    .line 553
    :cond_a
    return-object v0
.end method

.method public static install(Landroid/content/Context;)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v4, 0xe

    .line 83
    if-nez p0, :cond_c

    .line 84
    :try_start_4
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "Install failed: context is null!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    :goto_b
    return-void

    .line 86
    :cond_c
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v2, v4, :cond_17

    .line 87
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "CustomActivityOnCrash will be installed, but may not be reliable in API lower than 14"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_17
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 93
    .local v0, "oldHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    if-eqz v0, :cond_3e

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cat.ereza.customactivityoncrash"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 94
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "You have already installed CustomActivityOnCrash, doing nothing!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_34} :catch_35

    goto :goto_b

    .line 213
    .end local v0    # "oldHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    :catch_35
    move-exception v1

    .line 214
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "An unknown error occurred while installing CustomActivityOnCrash, it may not have been properly initialized. Please report this as a bug if needed."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b

    .line 96
    .end local v1    # "t":Ljava/lang/Throwable;
    .restart local v0    # "oldHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    :cond_3e
    if-eqz v0, :cond_57

    :try_start_40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.android.internal.os"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_57

    .line 97
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "IMPORTANT WARNING! You already have an UncaughtExceptionHandler, are you sure this is correct? If you use ACRA, Crashlytics or similar libraries, you must initialize them AFTER CustomActivityOnCrash! Installing anyway, but your original handler will not be called."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_57
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    sput-object v2, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;

    .line 103
    new-instance v2, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$1;

    invoke-direct {v2}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$1;-><init>()V

    invoke-static {v2}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 159
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v4, :cond_75

    .line 160
    sget-object v2, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;

    new-instance v3, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;

    invoke-direct {v3}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;-><init>()V

    invoke-virtual {v2, v3}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 210
    :cond_75
    const-string v2, "CustomActivityOnCrash"

    const-string v3, "CustomActivityOnCrash has been installed."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7c
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_7c} :catch_35

    goto :goto_b
.end method

.method public static isEnableAppRestart()Z
    .registers 1

    .prologue
    .line 389
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z

    return v0
.end method

.method public static isLaunchErrorActivityWhenInBackground()Z
    .registers 1

    .prologue
    .line 330
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->launchErrorActivityWhenInBackground:Z

    return v0
.end method

.method public static isShowErrorDetails()Z
    .registers 1

    .prologue
    .line 350
    sget-boolean v0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->showErrorDetails:Z

    return v0
.end method

.method public static isShowErrorDetailsFromIntent(Landroid/content/Intent;)Z
    .registers 3
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 225
    const-string v0, "cat.ereza.customactivityoncrash.EXTRA_SHOW_ERROR_DETAILS"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static isStackTraceLikelyConflictive(Ljava/lang/Throwable;Ljava/lang/Class;)Z
    .registers 9
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 452
    .local p1, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    .line 453
    .local v4, "stackTrace":[Ljava/lang/StackTraceElement;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_7
    if-ge v2, v3, :cond_36

    aget-object v1, v0, v2

    .line 454
    .local v1, "element":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "android.app.ActivityThread"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "handleBindApplication"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_31

    :cond_23
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 455
    :cond_31
    const/4 v5, 0x1

    .line 459
    .end local v1    # "element":Ljava/lang/StackTraceElement;
    :goto_32
    return v5

    .line 453
    .restart local v1    # "element":Ljava/lang/StackTraceElement;
    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 458
    .end local v1    # "element":Ljava/lang/StackTraceElement;
    :cond_36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_0

    .line 459
    const/4 v5, 0x0

    goto :goto_32
.end method

.method private static killCurrentProcess()V
    .registers 1

    .prologue
    .line 657
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 658
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 659
    return-void
.end method

.method public static restartApplicationWithIntent(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 305
    const v0, 0x10008000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 306
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 307
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 308
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->killCurrentProcess()V

    .line 309
    return-void
.end method

.method public static setDefaultErrorActivityDrawable(I)V
    .registers 1
    .param p0, "defaultErrorActivityDrawableId"    # I

    .prologue
    .line 378
    sput p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->defaultErrorActivityDrawableId:I

    .line 379
    return-void
.end method

.method public static setEnableAppRestart(Z)V
    .registers 1
    .param p0, "enableAppRestart"    # Z

    .prologue
    .line 401
    sput-boolean p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z

    .line 402
    return-void
.end method

.method public static setErrorActivityClass(Ljava/lang/Class;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 418
    .local p0, "errorActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    sput-object p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;

    .line 419
    return-void
.end method

.method public static setLaunchErrorActivityWhenInBackground(Z)V
    .registers 1
    .param p0, "launchErrorActivityWhenInBackground"    # Z

    .prologue
    .line 341
    sput-boolean p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->launchErrorActivityWhenInBackground:Z

    .line 342
    return-void
.end method

.method public static setRestartActivityClass(Ljava/lang/Class;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 435
    .local p0, "restartActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    sput-object p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;

    .line 436
    return-void
.end method

.method public static setShowErrorDetails(Z)V
    .registers 1
    .param p0, "showErrorDetails"    # Z

    .prologue
    .line 360
    sput-boolean p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->showErrorDetails:Z

    .line 361
    return-void
.end method
