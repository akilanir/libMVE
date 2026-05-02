.class public Landroid/support/design/widget/BottomSheetDialogFragment;
.super Landroid/support/v7/app/AppCompatDialogFragment;
.source "BottomSheetDialogFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    new-instance v0, Landroid/support/design/widget/BottomSheetDialog;

    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialogFragment;->getTheme()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/support/design/widget/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    return-object v0
.end method

.method public setupDialog(Landroid/app/Dialog;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/app/Dialog;
    .param p2, "style"    # I

    .prologue
    .line 40
    instance-of v0, p1, Landroid/support/design/widget/BottomSheetDialog;

    if-eqz v0, :cond_b

    .line 43
    check-cast p1, Landroid/support/design/widget/BottomSheetDialog;

    .end local p1    # "dialog":Landroid/app/Dialog;
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/support/design/widget/BottomSheetDialog;->supportRequestWindowFeature(I)Z

    .line 47
    :goto_a
    return-void

    .line 45
    .restart local p1    # "dialog":Landroid/app/Dialog;
    :cond_b
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/AppCompatDialogFragment;->setupDialog(Landroid/app/Dialog;I)V

    goto :goto_a
.end method
