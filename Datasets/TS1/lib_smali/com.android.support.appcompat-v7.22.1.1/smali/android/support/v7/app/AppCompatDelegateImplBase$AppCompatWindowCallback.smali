.class Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;
.super Landroid/support/v7/internal/view/WindowCallbackWrapper;
.source "AppCompatDelegateImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AppCompatDelegateImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppCompatWindowCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;


# direct methods
.method constructor <init>(Landroid/support/v7/app/AppCompatDelegateImplBase;Landroid/view/Window$Callback;)V
    .registers 3
    .param p2, "callback"    # Landroid/view/Window$Callback;

    .prologue
    .line 232
    iput-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    .line 233
    invoke-direct {p0, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;-><init>(Landroid/view/Window$Callback;)V

    .line 234
    return-void
.end method

.method private bypassPrepareOptionsPanelIfNeeded()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 314
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-ge v1, v2, :cond_10

    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v1, v1, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_10

    .line 322
    :cond_f
    :goto_f
    return v0

    .line 318
    :cond_10
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v1, v1, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    instance-of v1, v1, Landroid/app/Dialog;

    if-nez v1, :cond_f

    .line 322
    const/4 v0, 0x0

    goto :goto_f
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 238
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegateImplBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 239
    const/4 v0, 0x1

    .line 241
    :goto_9
    return v0

    :cond_a
    invoke-super {p0, p1}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_9
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 286
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 287
    const/4 v0, 0x1

    .line 289
    :goto_d
    return v0

    :cond_e
    invoke-super {p0, p1}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_d
.end method

.method public onContentChanged()V
    .registers 1

    .prologue
    .line 296
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 246
    if-nez p1, :cond_8

    instance-of v0, p2, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v0, :cond_8

    .line 249
    const/4 v0, 0x0

    .line 251
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_7
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 278
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 279
    const/4 v0, 0x1

    .line 281
    :goto_9
    return v0

    :cond_a
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_9
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 300
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onPanelClosed(ILandroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 304
    :goto_8
    return-void

    .line 303
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onPanelClosed(ILandroid/view/Menu;)V

    goto :goto_8
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 6
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v0, 0x0

    .line 256
    if-nez p1, :cond_8

    instance-of v1, p3, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v1, :cond_8

    .line 273
    :cond_7
    :goto_7
    return v0

    .line 262
    :cond_8
    if-nez p1, :cond_36

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->bypassPrepareOptionsPanelIfNeeded()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 264
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v1, v1, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_23

    .line 265
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v0, v0, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, p3}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    goto :goto_7

    .line 266
    :cond_23
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v1, v1, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    instance-of v1, v1, Landroid/app/Dialog;

    if-eqz v1, :cond_7

    .line 267
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallback;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    iget-object v0, v0, Landroid/support/v7/app/AppCompatDelegateImplBase;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0, p3}, Landroid/app/Dialog;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    goto :goto_7

    .line 273
    :cond_36
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    goto :goto_7
.end method
