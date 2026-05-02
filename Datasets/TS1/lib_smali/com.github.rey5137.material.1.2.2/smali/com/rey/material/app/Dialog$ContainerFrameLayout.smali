.class Lcom/rey/material/app/Dialog$ContainerFrameLayout;
.super Landroid/widget/FrameLayout;
.source "Dialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContainerFrameLayout"
.end annotation


# instance fields
.field private mClickOutside:Z

.field final synthetic this$0:Lcom/rey/material/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/Dialog;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1076
    iput-object p1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    .line 1077
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1074
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    .line 1078
    return-void
.end method

.method private isOutsideDialog(FF)Z
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1100
    iget-object v0, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getLeft()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_68

    iget-object v0, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getRight()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_68

    iget-object v0, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getTop()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-ltz v0, :cond_68

    iget-object v0, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getBottom()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_6a

    :cond_68
    const/4 v0, 0x1

    :goto_69
    return v0

    :cond_6a
    const/4 v0, 0x0

    goto :goto_69
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 1091
    sub-int v4, p4, p2

    iget-object v5, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v5}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v5

    invoke-virtual {v5}, Lcom/rey/material/app/Dialog$DialogCardView;->getMeasuredWidth()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v1, v4, 0x2

    .line 1092
    .local v1, "childLeft":I
    sub-int v4, p5, p3

    iget-object v5, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v5}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v5

    invoke-virtual {v5}, Lcom/rey/material/app/Dialog$DialogCardView;->getMeasuredHeight()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v3, v4, 0x2

    .line 1093
    .local v3, "childTop":I
    iget-object v4, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v4}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/app/Dialog$DialogCardView;->getMeasuredWidth()I

    move-result v4

    add-int v2, v1, v4

    .line 1094
    .local v2, "childRight":I
    iget-object v4, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v4}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/app/Dialog$DialogCardView;->getMeasuredHeight()I

    move-result v4

    add-int v0, v3, v4

    .line 1096
    .local v0, "childBottom":I
    iget-object v4, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v4}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v4

    invoke-virtual {v4, v1, v3, v2, v0}, Lcom/rey/material/app/Dialog$DialogCardView;->layout(IIII)V

    .line 1097
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1082
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 1083
    .local v1, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 1085
    .local v0, "heightSize":I
    iget-object v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v2}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/rey/material/app/Dialog$DialogCardView;->measure(II)V

    .line 1086
    invoke-virtual {p0, v1, v0}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->setMeasuredDimension(II)V

    .line 1087
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1105
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 1107
    .local v0, "handled":Z
    if-eqz v0, :cond_9

    .line 1132
    :cond_8
    :goto_8
    return v1

    .line 1110
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_58

    move v1, v2

    .line 1132
    goto :goto_8

    .line 1112
    :pswitch_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->isOutsideDialog(FF)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 1113
    iput-boolean v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    goto :goto_8

    :cond_23
    move v1, v2

    .line 1116
    goto :goto_8

    .line 1118
    :pswitch_25
    iget-boolean v1, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    goto :goto_8

    .line 1120
    :pswitch_28
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    move v1, v2

    .line 1121
    goto :goto_8

    .line 1123
    :pswitch_2c
    iget-boolean v3, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    if-eqz v3, :cond_56

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->isOutsideDialog(FF)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 1124
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->mClickOutside:Z

    .line 1125
    iget-object v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCancelable:Z
    invoke-static {v2}, Lcom/rey/material/app/Dialog;->access$400(Lcom/rey/material/app/Dialog;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCanceledOnTouchOutside:Z
    invoke-static {v2}, Lcom/rey/material/app/Dialog;->access$500(Lcom/rey/material/app/Dialog;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1126
    iget-object v2, p0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/Dialog;

    invoke-virtual {v2}, Lcom/rey/material/app/Dialog;->dismiss()V

    goto :goto_8

    :cond_56
    move v1, v2

    .line 1129
    goto :goto_8

    .line 1110
    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_12
        :pswitch_2c
        :pswitch_25
        :pswitch_28
    .end packed-switch
.end method
