.class public Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;
.super Ljava/lang/Object;
.source "ApplicationHelper.java"


# static fields
.field public static final PRE_ICS:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->PRE_ICS:Z

    return-void

    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static postIcsRegisterActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 3
    .param p0, "application"    # Landroid/app/Application;
    .param p1, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 65
    new-instance v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;

    invoke-direct {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;-><init>(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 66
    return-void
.end method

.method private static postIcsUnregisterActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 3
    .param p0, "application"    # Landroid/app/Application;
    .param p1, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 93
    new-instance v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;

    invoke-direct {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;-><init>(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    invoke-virtual {p0, v0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 94
    return-void
.end method

.method private static preIcsRegisterActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 2
    .param p0, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .prologue
    .line 60
    invoke-static {}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;->get()Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;->registerActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 61
    return-void
.end method

.method private static preIcsUnregisterActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 2
    .param p0, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .prologue
    .line 88
    invoke-static {}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;->get()Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/MainLifecycleDispatcher;->unregisterActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 89
    return-void
.end method

.method public static registerActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 3
    .param p0, "application"    # Landroid/app/Application;
    .param p1, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .prologue
    .line 52
    sget-boolean v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->PRE_ICS:Z

    if-eqz v0, :cond_8

    .line 53
    invoke-static {p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->preIcsRegisterActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 57
    :goto_7
    return-void

    .line 55
    :cond_8
    invoke-static {p0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->postIcsRegisterActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    goto :goto_7
.end method


# virtual methods
.method public unregisterActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .prologue
    .line 80
    sget-boolean v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->PRE_ICS:Z

    if-eqz v0, :cond_8

    .line 81
    invoke-static {p2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->preIcsUnregisterActivityLifecycleCallbacks(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 85
    :goto_7
    return-void

    .line 83
    :cond_8
    invoke-static {p1, p2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->postIcsUnregisterActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    goto :goto_7
.end method
