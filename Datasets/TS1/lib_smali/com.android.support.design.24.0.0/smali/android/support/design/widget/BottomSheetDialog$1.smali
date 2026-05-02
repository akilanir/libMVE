.class Landroid/support/design/widget/BottomSheetDialog$1;
.super Ljava/lang/Object;
.source "BottomSheetDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/BottomSheetDialog;->wrapInBottomSheet(ILandroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/BottomSheetDialog;


# direct methods
.method constructor <init>(Landroid/support/design/widget/BottomSheetDialog;)V
    .registers 2
    .param p1, "this$0"    # Landroid/support/design/widget/BottomSheetDialog;

    .prologue
    .line 93
    iput-object p1, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 96
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    invoke-virtual {v0}, Landroid/support/design/widget/BottomSheetDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 97
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    invoke-virtual {v0}, Landroid/support/design/widget/BottomSheetDialog;->cancel()V

    .line 99
    :cond_d
    return-void
.end method
