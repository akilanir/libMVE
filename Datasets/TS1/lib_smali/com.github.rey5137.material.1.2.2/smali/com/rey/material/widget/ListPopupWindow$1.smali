.class Lcom/rey/material/widget/ListPopupWindow$1;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/ListPopupWindow;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/ListPopupWindow;)V
    .registers 2

    .prologue
    .line 668
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 7

    .prologue
    .line 672
    iget-object v4, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;
    invoke-static {v4}, Lcom/rey/material/widget/ListPopupWindow;->access$500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/PopupWindow;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 673
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v4, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v4}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_1c
    if-ge v2, v1, :cond_49

    .line 674
    iget-object v4, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v4}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 676
    .local v3, "v":Landroid/view/View;
    iget-object v4, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/rey/material/widget/ListPopupWindow;->access$700(Lcom/rey/material/widget/ListPopupWindow;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationId:I
    invoke-static {v5}, Lcom/rey/material/widget/ListPopupWindow;->access$800(Lcom/rey/material/widget/ListPopupWindow;)I

    move-result v5

    invoke-static {v4, v5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 677
    .local v0, "anim":Landroid/view/animation/Animation;
    iget-object v4, p0, Lcom/rey/material/widget/ListPopupWindow$1;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationOffset:I
    invoke-static {v4}, Lcom/rey/material/widget/ListPopupWindow;->access$900(Lcom/rey/material/widget/ListPopupWindow;)I

    move-result v4

    mul-int/2addr v4, v2

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 678
    invoke-virtual {v3, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 673
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 680
    .end local v0    # "anim":Landroid/view/animation/Animation;
    .end local v3    # "v":Landroid/view/View;
    :cond_49
    const/4 v4, 0x0

    return v4
.end method
