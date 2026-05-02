.class Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "TabIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field iconView:Lcom/rey/material/widget/CheckedImageView;

.field padding:I

.field rippleStyle:I

.field singleLine:Z

.field textAppearance:I

.field textView:Lcom/rey/material/widget/CheckedTextView;

.field final synthetic this$0:Lcom/rey/material/widget/TabIndicatorView;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V
    .registers 5
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 693
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    .line 694
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 688
    iput v1, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->rippleStyle:I

    .line 689
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->singleLine:Z

    .line 690
    iput v1, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textAppearance:I

    .line 691
    iput v1, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->padding:I

    .line 695
    instance-of v0, p2, Lcom/rey/material/widget/CheckedImageView;

    if-eqz v0, :cond_18

    .line 696
    check-cast p2, Lcom/rey/material/widget/CheckedImageView;

    .end local p2    # "itemView":Landroid/view/View;
    iput-object p2, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->iconView:Lcom/rey/material/widget/CheckedImageView;

    .line 699
    :cond_17
    :goto_17
    return-void

    .line 697
    .restart local p2    # "itemView":Landroid/view/View;
    :cond_18
    instance-of v0, p2, Lcom/rey/material/widget/CheckedTextView;

    if-eqz v0, :cond_17

    .line 698
    check-cast p2, Lcom/rey/material/widget/CheckedTextView;

    .end local p2    # "itemView":Landroid/view/View;
    iput-object p2, p0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    goto :goto_17
.end method
