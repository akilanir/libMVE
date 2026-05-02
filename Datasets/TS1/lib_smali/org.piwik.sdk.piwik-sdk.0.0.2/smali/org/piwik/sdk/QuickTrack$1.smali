.class final Lorg/piwik/sdk/QuickTrack$1;
.super Ljava/lang/Object;
.source "QuickTrack.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/piwik/sdk/QuickTrack;->bindToApp(Landroid/app/Application;Lorg/piwik/sdk/Tracker;)Landroid/app/Application$ActivityLifecycleCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$tracker:Lorg/piwik/sdk/Tracker;


# direct methods
.method constructor <init>(Lorg/piwik/sdk/Tracker;)V
    .registers 2

    .prologue
    .line 56
    iput-object p1, p0, Lorg/piwik/sdk/QuickTrack$1;->val$tracker:Lorg/piwik/sdk/Tracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 60
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 92
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 75
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/piwik/sdk/QuickTrack$1;->val$tracker:Lorg/piwik/sdk/Tracker;

    invoke-static {v0, p1}, Lorg/piwik/sdk/QuickTrack;->track(Lorg/piwik/sdk/Tracker;Landroid/app/Activity;)V

    .line 70
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 87
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 65
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 79
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 80
    iget-object v0, p0, Lorg/piwik/sdk/QuickTrack$1;->val$tracker:Lorg/piwik/sdk/Tracker;

    invoke-virtual {v0}, Lorg/piwik/sdk/Tracker;->dispatch()Z

    .line 82
    :cond_d
    return-void
.end method
