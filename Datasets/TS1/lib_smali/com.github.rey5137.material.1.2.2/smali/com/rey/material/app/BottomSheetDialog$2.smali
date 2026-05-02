.class Lcom/rey/material/app/BottomSheetDialog$2;
.super Ljava/lang/Object;
.source "BottomSheetDialog.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/BottomSheetDialog;->init(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/BottomSheetDialog;


# direct methods
.method constructor <init>(Lcom/rey/material/app/BottomSheetDialog;)V
    .registers 2

    .prologue
    .line 89
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog$2;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 117
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$2;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mMinFlingVelocity:I
    invoke-static {v0}, Lcom/rey/material/app/BottomSheetDialog;->access$100(Lcom/rey/material/app/BottomSheetDialog;)I

    move-result v0

    int-to-float v0, v0

    cmpl-float v0, p4, v0

    if-lez v0, :cond_12

    .line 118
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$2;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog;->dismiss()V

    .line 119
    const/4 v0, 0x1

    .line 121
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 113
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 98
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method
