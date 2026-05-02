.class Lcom/rey/material/app/DialogFragment$1;
.super Ljava/lang/Object;
.source "DialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/DialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/DialogFragment;


# direct methods
.method constructor <init>(Lcom/rey/material/app/DialogFragment;)V
    .registers 2

    .prologue
    .line 58
    iput-object p1, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    iget-object v0, v0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    if-nez v0, :cond_7

    .line 70
    :cond_6
    :goto_6
    return-void

    .line 64
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_POSITIVE:I

    if-ne v0, v1, :cond_19

    .line 65
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    iget-object v0, v0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    iget-object v1, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    invoke-interface {v0, v1}, Lcom/rey/material/app/DialogFragment$Builder;->onPositiveActionClicked(Lcom/rey/material/app/DialogFragment;)V

    goto :goto_6

    .line 66
    :cond_19
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_NEGATIVE:I

    if-ne v0, v1, :cond_2b

    .line 67
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    iget-object v0, v0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    iget-object v1, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    invoke-interface {v0, v1}, Lcom/rey/material/app/DialogFragment$Builder;->onNegativeActionClicked(Lcom/rey/material/app/DialogFragment;)V

    goto :goto_6

    .line 68
    :cond_2b
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_NEUTRAL:I

    if-ne v0, v1, :cond_6

    .line 69
    iget-object v0, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    iget-object v0, v0, Lcom/rey/material/app/DialogFragment;->mBuilder:Lcom/rey/material/app/DialogFragment$Builder;

    iget-object v1, p0, Lcom/rey/material/app/DialogFragment$1;->this$0:Lcom/rey/material/app/DialogFragment;

    invoke-interface {v0, v1}, Lcom/rey/material/app/DialogFragment$Builder;->onNeutralActionClicked(Lcom/rey/material/app/DialogFragment;)V

    goto :goto_6
.end method
