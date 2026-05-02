.class Lcom/afollestad/materialdialogs/DialogBase;
.super Landroid/app/Dialog;
.source "DialogBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field private mShowListener:Landroid/content/DialogInterface$OnShowListener;

.field protected view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 21
    return-void
.end method


# virtual methods
.method public findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 25
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DialogBase;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DialogBase;->mShowListener:Landroid/content/DialogInterface$OnShowListener;

    if-eqz v0, :cond_9

    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DialogBase;->mShowListener:Landroid/content/DialogInterface$OnShowListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 45
    :cond_9
    return-void
.end method

.method public setContentView(I)V
    .registers 4
    .param p1, "layoutResID"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 50
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v1, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 56
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v1, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v1, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnShowListener;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/afollestad/materialdialogs/DialogBase;->mShowListener:Landroid/content/DialogInterface$OnShowListener;

    .line 31
    return-void
.end method

.method protected final setOnShowListenerInternal()V
    .registers 1

    .prologue
    .line 34
    invoke-super {p0, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 35
    return-void
.end method

.method protected final setViewInternal(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 39
    return-void
.end method
