.class public abstract Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;
.super Ljava/lang/Object;
.source "ModalMultiSelectorCallback.java"

# interfaces
.implements Landroid/support/v7/view/ActionMode$Callback;


# static fields
.field private static final TAG:Ljava/lang/String; = "modalMultiSelectorCallback"


# instance fields
.field private mClearOnPrepare:Z

.field private mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;


# direct methods
.method public constructor <init>(Lcom/bignerdranch/android/multiselector/MultiSelector;)V
    .registers 3
    .param p1, "multiSelector"    # Lcom/bignerdranch/android/multiselector/MultiSelector;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mClearOnPrepare:Z

    .line 20
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    .line 21
    return-void
.end method


# virtual methods
.method public getMultiSelector()Lcom/bignerdranch/android/multiselector/MultiSelector;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    return-object v0
.end method

.method public onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    .registers 5
    .param p1, "actionMode"    # Landroid/support/v7/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mClearOnPrepare:Z

    if-eqz v0, :cond_9

    .line 69
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    invoke-virtual {v0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->clearSelections()V

    .line 71
    :cond_9
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelectable(Z)V

    .line 72
    const/4 v0, 0x0

    return v0
.end method

.method public onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V
    .registers 4
    .param p1, "actionMode"    # Landroid/support/v7/view/ActionMode;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelectable(Z)V

    .line 78
    return-void
.end method

.method public onPrepareActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    .registers 4
    .param p1, "actionMode"    # Landroid/support/v7/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public setClearOnPrepare(Z)V
    .registers 2
    .param p1, "clearOnPrepare"    # Z

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mClearOnPrepare:Z

    .line 41
    return-void
.end method

.method public setMultiSelector(Lcom/bignerdranch/android/multiselector/MultiSelector;)V
    .registers 2
    .param p1, "multiSelector"    # Lcom/bignerdranch/android/multiselector/MultiSelector;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    .line 59
    return-void
.end method

.method public shouldClearOnPrepare()Z
    .registers 2

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/ModalMultiSelectorCallback;->mClearOnPrepare:Z

    return v0
.end method
