.class Lcom/rey/material/app/SimpleDialog$InternalListView;
.super Lcom/rey/material/widget/ListView;
.source "SimpleDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/SimpleDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalListView"
.end annotation


# instance fields
.field private mIsRtl:Z

.field final synthetic this$0:Lcom/rey/material/app/SimpleDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/SimpleDialog;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->this$0:Lcom/rey/material/app/SimpleDialog;

    .line 409
    invoke-direct {p0, p2}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 406
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->mIsRtl:Z

    .line 410
    return-void
.end method


# virtual methods
.method public isLayoutRtl()Z
    .registers 2

    .prologue
    .line 421
    iget-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->mIsRtl:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 11
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 437
    invoke-super/range {p0 .. p5}, Lcom/rey/material/widget/ListView;->onLayout(ZIIII)V

    .line 439
    const/4 v2, 0x0

    .line 440
    .local v2, "totalHeight":I
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getChildCount()I

    move-result v0

    .line 442
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_17

    .line 443
    invoke-virtual {p0, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v2, v3

    .line 442
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 445
    :cond_17
    iget-object v4, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->this$0:Lcom/rey/material/app/SimpleDialog;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getMeasuredHeight()I

    move-result v3

    if-gt v2, v3, :cond_2f

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getMeasuredHeight()I

    move-result v3

    if-ne v2, v3, :cond_34

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-le v3, v0, :cond_34

    :cond_2f
    const/4 v3, 0x1

    :goto_30
    invoke-virtual {v4, v3}, Lcom/rey/material/app/SimpleDialog;->showDivider(Z)Lcom/rey/material/app/Dialog;

    .line 446
    return-void

    .line 445
    :cond_34
    const/4 v3, 0x0

    goto :goto_30
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 426
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 427
    .local v0, "heightMode":I
    if-nez v0, :cond_2e

    .line 428
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mItemHeight:I
    invoke-static {v1}, Lcom/rey/material/app/SimpleDialog;->access$200(Lcom/rey/material/app/SimpleDialog;)I

    move-result v1

    const/4 v2, -0x2

    if-eq v1, v2, :cond_2e

    .line 429
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mItemHeight:I
    invoke-static {v1}, Lcom/rey/material/app/SimpleDialog;->access$200(Lcom/rey/material/app/SimpleDialog;)I

    move-result v1

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 432
    :cond_2e
    invoke-super {p0, p1, p2}, Lcom/rey/material/widget/ListView;->onMeasure(II)V

    .line 433
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 4
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    .line 413
    if-ne p1, v0, :cond_d

    .line 414
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->mIsRtl:Z

    if-eq v1, v0, :cond_c

    .line 415
    iput-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalListView;->mIsRtl:Z

    .line 416
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalListView;->requestLayout()V

    .line 418
    :cond_c
    return-void

    .line 413
    .end local v0    # "rtl":Z
    :cond_d
    const/4 v0, 0x0

    goto :goto_3
.end method
