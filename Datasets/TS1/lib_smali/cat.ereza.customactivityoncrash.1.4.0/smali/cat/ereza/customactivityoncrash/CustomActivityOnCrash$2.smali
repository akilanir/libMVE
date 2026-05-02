.class final Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;
.super Ljava/lang/Object;
.source "CustomActivityOnCrash.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->install(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field currentlyStartedActivities:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 165
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$000()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_12

    .line 170
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$1102(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 172
    :cond_12
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 206
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 189
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 184
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 201
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 176
    iget v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    .line 177
    iget v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_b
    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z
    invoke-static {v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$502(Z)Z

    .line 179
    return-void

    .line 177
    :cond_f
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 194
    iget v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    .line 195
    iget v0, p0, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$2;->currentlyStartedActivities:I

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_b
    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z
    invoke-static {v0}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$502(Z)Z

    .line 196
    return-void

    .line 195
    :cond_f
    const/4 v0, 0x0

    goto :goto_b
.end method
