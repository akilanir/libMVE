.class abstract Landroid/support/v4/app/BaseFragmentActivityApi24;
.super Landroid/support/v4/app/BaseFragmentActivityJB;
.source "BaseFragmentActivityApi24.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/support/v4/app/BaseFragmentActivityJB;-><init>()V

    return-void
.end method


# virtual methods
.method abstract dispatchFragmentsOnMultiWindowModeChanged(Z)V
.end method

.method abstract dispatchFragmentsOnPictureInPictureModeChanged(Z)V
.end method

.method public onMultiWindowModeChanged(Z)V
    .registers 3
    .param p1, "isInMultiWindowMode"    # Z
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 30
    invoke-static {}, Landroid/support/v4/os/BuildCompat;->isAtLeastN()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 31
    invoke-super {p0, p1}, Landroid/support/v4/app/BaseFragmentActivityJB;->onMultiWindowModeChanged(Z)V

    .line 33
    :cond_9
    invoke-virtual {p0, p1}, Landroid/support/v4/app/BaseFragmentActivityApi24;->dispatchFragmentsOnMultiWindowModeChanged(Z)V

    .line 34
    return-void
.end method

.method public onPictureInPictureModeChanged(Z)V
    .registers 3
    .param p1, "isInPictureInPictureMode"    # Z
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Landroid/support/v4/os/BuildCompat;->isAtLeastN()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 40
    invoke-super {p0, p1}, Landroid/support/v4/app/BaseFragmentActivityJB;->onPictureInPictureModeChanged(Z)V

    .line 42
    :cond_9
    invoke-virtual {p0, p1}, Landroid/support/v4/app/BaseFragmentActivityApi24;->dispatchFragmentsOnPictureInPictureModeChanged(Z)V

    .line 43
    return-void
.end method
