.class public interface abstract Lcom/rey/material/app/DialogFragment$Builder;
.super Ljava/lang/Object;
.source "DialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/DialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Builder"
.end annotation


# virtual methods
.method public abstract build(Landroid/content/Context;)Lcom/rey/material/app/Dialog;
.end method

.method public abstract onCancel(Landroid/content/DialogInterface;)V
.end method

.method public abstract onDismiss(Landroid/content/DialogInterface;)V
.end method

.method public abstract onNegativeActionClicked(Lcom/rey/material/app/DialogFragment;)V
.end method

.method public abstract onNeutralActionClicked(Lcom/rey/material/app/DialogFragment;)V
.end method

.method public abstract onPositiveActionClicked(Lcom/rey/material/app/DialogFragment;)V
.end method
