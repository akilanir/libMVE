.class Lcom/rey/material/app/SimpleDialog$InternalScrollView;
.super Landroid/widget/ScrollView;
.source "SimpleDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/SimpleDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalScrollView"
.end annotation


# instance fields
.field private mIsRtl:Z

.field final synthetic this$0:Lcom/rey/material/app/SimpleDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/SimpleDialog;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 374
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->this$0:Lcom/rey/material/app/SimpleDialog;

    .line 375
    invoke-direct {p0, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 372
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->mIsRtl:Z

    .line 376
    return-void
.end method


# virtual methods
.method public isLayoutRtl()Z
    .registers 2

    .prologue
    .line 392
    iget-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->mIsRtl:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v1, 0x0

    .line 397
    invoke-super/range {p0 .. p5}, Landroid/widget/ScrollView;->onLayout(ZIIII)V

    .line 399
    invoke-virtual {p0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 400
    .local v0, "child":Landroid/view/View;
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->this$0:Lcom/rey/material/app/SimpleDialog;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    if-le v3, v4, :cond_21

    const/4 v1, 0x1

    :cond_21
    invoke-virtual {v2, v1}, Lcom/rey/material/app/SimpleDialog;->showDivider(Z)Lcom/rey/material/app/Dialog;

    .line 401
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 7
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 379
    if-ne p1, v0, :cond_30

    .line 380
    .local v0, "rtl":Z
    :goto_4
    iget-boolean v3, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->mIsRtl:Z

    if-eq v3, v0, :cond_2f

    .line 381
    iput-boolean v0, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->mIsRtl:Z

    .line 382
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_2c

    .line 383
    invoke-virtual {p0, v2}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 384
    .local v1, "v":Landroid/view/View;
    if-eqz v1, :cond_2c

    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$100(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/widget/TextView;

    move-result-object v2

    if-ne v1, v2, :cond_2c

    .line 385
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$100(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/widget/TextView;

    move-result-object v3

    iget-boolean v2, p0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->mIsRtl:Z

    if-eqz v2, :cond_32

    const/4 v2, 0x4

    :goto_29
    invoke-virtual {v3, v2}, Lcom/rey/material/widget/TextView;->setTextDirection(I)V

    .line 387
    .end local v1    # "v":Landroid/view/View;
    :cond_2c
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->requestLayout()V

    .line 389
    :cond_2f
    return-void

    .end local v0    # "rtl":Z
    :cond_30
    move v0, v2

    .line 379
    goto :goto_4

    .line 385
    .restart local v0    # "rtl":Z
    .restart local v1    # "v":Landroid/view/View;
    :cond_32
    const/4 v2, 0x3

    goto :goto_29
.end method
