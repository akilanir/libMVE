.class public Lcom/mikepenz/materialize/Materialize;
.super Ljava/lang/Object;
.source "Materialize.java"


# instance fields
.field private final mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

.field private mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;


# direct methods
.method protected constructor <init>(Lcom/mikepenz/materialize/MaterializeBuilder;)V
    .registers 3
    .param p1, "materializeBuilder"    # Lcom/mikepenz/materialize/MaterializeBuilder;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    .line 22
    iput-object p1, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    .line 23
    return-void
.end method


# virtual methods
.method public getContent()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mContentRoot:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getScrimInsetsFrameLayout()Lcom/mikepenz/materialize/view/IScrimInsetsLayout;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    return-object v0
.end method

.method public keyboardSupportEnabled(Landroid/app/Activity;Z)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "enable"    # Z

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/mikepenz/materialize/Materialize;->getContent()Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_30

    invoke-virtual {p0}, Lcom/mikepenz/materialize/Materialize;->getContent()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_30

    .line 101
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    if-nez v0, :cond_29

    .line 102
    new-instance v0, Lcom/mikepenz/materialize/util/KeyboardUtil;

    invoke-virtual {p0}, Lcom/mikepenz/materialize/Materialize;->getContent()Landroid/view/ViewGroup;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/materialize/util/KeyboardUtil;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    iput-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    .line 103
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialize/util/KeyboardUtil;->disable()V

    .line 106
    :cond_29
    if-eqz p2, :cond_31

    .line 107
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialize/util/KeyboardUtil;->enable()V

    .line 112
    :cond_30
    :goto_30
    return-void

    .line 109
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mKeyboardUtil:Lcom/mikepenz/materialize/util/KeyboardUtil;

    invoke-virtual {v0}, Lcom/mikepenz/materialize/util/KeyboardUtil;->disable()V

    goto :goto_30
.end method

.method public setFullscreen(Z)V
    .registers 6
    .param p1, "fullscreen"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 32
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-eqz v0, :cond_1b

    .line 33
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v3, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-nez p1, :cond_1c

    move v0, v1

    :goto_f
    invoke-interface {v3, v0}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintStatusBar(Z)V

    .line 34
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-nez p1, :cond_1e

    :goto_18
    invoke-interface {v0, v1}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintNavigationBar(Z)V

    .line 36
    :cond_1b
    return-void

    :cond_1c
    move v0, v2

    .line 33
    goto :goto_f

    :cond_1e
    move v1, v2

    .line 34
    goto :goto_18
.end method

.method public setStatusBarColor(I)V
    .registers 3
    .param p1, "statusBarColor"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-eqz v0, :cond_18

    .line 67
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setInsetForeground(I)V

    .line 68
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v0}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->getView()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 70
    :cond_18
    return-void
.end method

.method public setTintNavigationBar(Z)V
    .registers 3
    .param p1, "tintNavigationBar"    # Z

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-eqz v0, :cond_d

    .line 56
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintNavigationBar(Z)V

    .line 58
    :cond_d
    return-void
.end method

.method public setTintStatusBar(Z)V
    .registers 3
    .param p1, "tintStatusBar"    # Z

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    if-eqz v0, :cond_d

    .line 45
    iget-object v0, p0, Lcom/mikepenz/materialize/Materialize;->mBuilder:Lcom/mikepenz/materialize/MaterializeBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialize/MaterializeBuilder;->mScrimInsetsLayout:Lcom/mikepenz/materialize/view/IScrimInsetsLayout;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialize/view/IScrimInsetsLayout;->setTintStatusBar(Z)V

    .line 47
    :cond_d
    return-void
.end method
