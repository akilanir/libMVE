.class public Lorg/piwik/sdk/QuickTrack;
.super Ljava/lang/Object;
.source "QuickTrack.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindToApp(Landroid/app/Application;Lorg/piwik/sdk/Tracker;)Landroid/app/Application$ActivityLifecycleCallbacks;
    .registers 3
    .param p0, "app"    # Landroid/app/Application;
    .param p1, "tracker"    # Lorg/piwik/sdk/Tracker;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 56
    new-instance v0, Lorg/piwik/sdk/QuickTrack$1;

    invoke-direct {v0, p1}, Lorg/piwik/sdk/QuickTrack$1;-><init>(Lorg/piwik/sdk/Tracker;)V

    .line 94
    .local v0, "callback":Landroid/app/Application$ActivityLifecycleCallbacks;
    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 95
    return-object v0
.end method

.method private static breadcrumbsToPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "breadcrumbs"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string v0, "\\s"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getBreadcrumbs(Landroid/app/Activity;)Ljava/lang/String;
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 124
    move-object v1, p0

    .line 125
    .local v1, "currentActivity":Landroid/app/Activity;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v0, "breadcrumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_6
    if-eqz v1, :cond_18

    .line 128
    invoke-virtual {v1}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    invoke-virtual {v1}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v1

    goto :goto_6

    .line 131
    :cond_18
    invoke-static {v0}, Lorg/piwik/sdk/QuickTrack;->joinSlash(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static joinSlash(Ljava/util/List;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "sequence":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p0, :cond_f

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_f

    .line 136
    const-string v0, "/"

    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    .line 138
    :goto_e
    return-object v0

    :cond_f
    const-string v0, ""

    goto :goto_e
.end method

.method public static track(Lorg/piwik/sdk/PiwikApplication;Landroid/app/Activity;)V
    .registers 3
    .param p0, "piwikApplication"    # Lorg/piwik/sdk/PiwikApplication;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikApplication;->getTracker()Lorg/piwik/sdk/Tracker;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/piwik/sdk/QuickTrack;->track(Lorg/piwik/sdk/Tracker;Landroid/app/Activity;)V

    .line 107
    return-void
.end method

.method public static track(Lorg/piwik/sdk/Tracker;Landroid/app/Activity;)V
    .registers 4
    .param p0, "tracker"    # Lorg/piwik/sdk/Tracker;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 117
    if-eqz p1, :cond_d

    .line 118
    invoke-static {p1}, Lorg/piwik/sdk/QuickTrack;->getBreadcrumbs(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "breadcrumbs":Ljava/lang/String;
    invoke-static {v0}, Lorg/piwik/sdk/QuickTrack;->breadcrumbsToPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/piwik/sdk/Tracker;->trackScreenView(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;

    .line 121
    .end local v0    # "breadcrumbs":Ljava/lang/String;
    :cond_d
    return-void
.end method

.method public static trackUncaughtExceptions(Lorg/piwik/sdk/Tracker;)Ljava/lang/Thread$UncaughtExceptionHandler;
    .registers 4
    .param p0, "tracker"    # Lorg/piwik/sdk/Tracker;

    .prologue
    .line 38
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    instance-of v1, v1, Lorg/piwik/sdk/PiwikExceptionHandler;

    if-eqz v1, :cond_10

    .line 39
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Trying to wrap an existing PiwikExceptionHandler."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 41
    :cond_10
    new-instance v0, Lorg/piwik/sdk/PiwikExceptionHandler;

    invoke-direct {v0, p0}, Lorg/piwik/sdk/PiwikExceptionHandler;-><init>(Lorg/piwik/sdk/Tracker;)V

    .line 42
    .local v0, "handler":Ljava/lang/Thread$UncaughtExceptionHandler;
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 43
    return-object v0
.end method
