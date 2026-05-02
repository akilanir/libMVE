.class public Lcom/rey/material/app/DialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "DialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/DialogFragment$Builder;
    }
.end annotation


# static fields
.field protected static final ARG_BUILDER:Ljava/lang/String; = "arg_builder"


# instance fields
.field private mActionListener:Landroid/view/View$OnClickListener;

.field protected mBuilder:Lcom/rey/material/app/DialogFragment$Builder;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 58
    new-instance v0, Lcom/rey/material/app/DialogFragment$1;

    invoke-direct {v0, p0}, Lcom/rey/material/app/DialogFragment$1;-><init>(Lcom/rey/material/app/DialogFragment;)V

    iput-object v0, p0, Lcom/rey/material/app/DialogFragment;->mActionListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static newInstance(Lcom/rey/material/app/DialogFragment$Builder;)Lcom/rey/material/app/DialogFragment;
    .registers 2
    .param p0, "builder"    # Lcom/rey/material/app/DialogFragment$Builder;

    .prologue
    .line 74
    new-instance v0, Lcom/rey/material/app/DialogFragment;

    invoke-direct {v0}, Lcom/rey/material/app/DialogFragment;-><init>()V

    .line 75
    .local v0, "fragment":Lcom/rey/material/app/DialogFragment;
    iput-object p0, v0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    .line 76
    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 116
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 117
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    invoke-interface {v0, p1}, Lcom/rey/material/app/DialogFragment$Builder;->onCancel(Landroid/content/DialogInterface;)V

    .line 118
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 92
    if-eqz p1, :cond_13

    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    if-nez v0, :cond_13

    .line 93
    const-string v0, "arg_builder"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/rey/material/app/DialogFragment$Builder;

    iput-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    .line 94
    :cond_13
    return-void
.end method

.method public bridge synthetic onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 3
    .param p1, "x0"    # Landroid/os/Bundle;

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/rey/material/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Lcom/rey/material/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 82
    iget-object v1, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    if-nez v1, :cond_1f

    new-instance v0, Lcom/rey/material/app/Dialog;

    invoke-virtual {p0}, Lcom/rey/material/app/DialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 83
    .local v0, "dialog":Lcom/rey/material/app/Dialog;
    :goto_d
    iget-object v1, p0, Lcom/rey/material/app/DialogFragment;->mActionListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/app/DialogFragment;->mActionListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/rey/material/app/Dialog;->negativeActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/app/DialogFragment;->mActionListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/rey/material/app/Dialog;->neutralActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    .line 86
    return-object v0

    .line 82
    .end local v0    # "dialog":Lcom/rey/material/app/Dialog;
    :cond_1f
    iget-object v1, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    invoke-virtual {p0}, Lcom/rey/material/app/DialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/rey/material/app/DialogFragment$Builder;->build(Landroid/content/Context;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    goto :goto_d
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/rey/material/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 108
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_f

    instance-of v1, v0, Lcom/rey/material/app/Dialog;

    if-eqz v1, :cond_f

    .line 109
    check-cast v0, Lcom/rey/material/app/Dialog;

    .end local v0    # "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Lcom/rey/material/app/Dialog;->dismissImmediately()V

    .line 111
    :cond_f
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 112
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 122
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 123
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    invoke-interface {v0, p1}, Lcom/rey/material/app/DialogFragment$Builder;->onDismiss(Landroid/content/DialogInterface;)V

    .line 124
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 98
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 100
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    instance-of v0, v0, Landroid/os/Parcelable;

    if-eqz v0, :cond_16

    .line 101
    const-string v1, "arg_builder"

    iget-object v0, p0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 102
    :cond_16
    return-void
.end method
