.class Landroid/support/design/widget/BottomSheetDialog$1;
.super Ljava/lang/Object;
.source "BottomSheetDialog.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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

.field final synthetic val$coordinator:Landroid/support/design/widget/CoordinatorLayout;

.field final synthetic val$finalView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/support/design/widget/BottomSheetDialog;Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)V
    .registers 4

    .prologue
    .line 90
    iput-object p1, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    iput-object p2, p0, Landroid/support/design/widget/BottomSheetDialog$1;->val$coordinator:Landroid/support/design/widget/CoordinatorLayout;

    iput-object p3, p0, Landroid/support/design/widget/BottomSheetDialog$1;->val$finalView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 93
    iget-object v1, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    invoke-virtual {v1}, Landroid/support/design/widget/BottomSheetDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-static {p2}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v1

    if-ne v1, v0, :cond_29

    iget-object v1, p0, Landroid/support/design/widget/BottomSheetDialog$1;->val$coordinator:Landroid/support/design/widget/CoordinatorLayout;

    iget-object v2, p0, Landroid/support/design/widget/BottomSheetDialog$1;->val$finalView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/design/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    move-result v1

    if-nez v1, :cond_29

    .line 97
    iget-object v1, p0, Landroid/support/design/widget/BottomSheetDialog$1;->this$0:Landroid/support/design/widget/BottomSheetDialog;

    invoke-virtual {v1}, Landroid/support/design/widget/BottomSheetDialog;->cancel()V

    .line 100
    :goto_28
    return v0

    :cond_29
    const/4 v0, 0x0

    goto :goto_28
.end method
