.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;
.super Landroid/widget/BaseAdapter;
.source "ColorChooserDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColorGridAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;


# direct methods
.method public constructor <init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V
    .registers 2

    .prologue
    .line 511
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 512
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    .line 516
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[[I

    move-result-object v0

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v1

    aget-object v0, v0, v1

    array-length v0, v0

    .line 517
    :goto_17
    return v0

    :cond_18
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[I

    move-result-object v0

    array-length v0, v0

    goto :goto_17
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 522
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[[I

    move-result-object v0

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v1

    aget-object v0, v0, v1

    aget v0, v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 523
    :goto_1c
    return-object v0

    :cond_1d
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[I

    move-result-object v0

    aget v0, v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_1c
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 528
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 533
    if-nez p2, :cond_23

    .line 534
    new-instance p2, Lcom/afollestad/materialdialogs/color/CircleView;

    .end local p2    # "convertView":Landroid/view/View;
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-virtual {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p2, v2}, Lcom/afollestad/materialdialogs/color/CircleView;-><init>(Landroid/content/Context;)V

    .line 535
    .restart local p2    # "convertView":Landroid/view/View;
    new-instance v2, Landroid/widget/AbsListView$LayoutParams;

    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCircleSize:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCircleSize:I
    invoke-static {v6}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v6

    invoke-direct {v2, v5, v6}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_23
    move-object v0, p2

    .line 537
    check-cast v0, Lcom/afollestad/materialdialogs/color/CircleView;

    .line 538
    .local v0, "child":Lcom/afollestad/materialdialogs/color/CircleView;
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z

    move-result v2

    if-eqz v2, :cond_78

    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[[I

    move-result-object v2

    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    aget-object v2, v2, v5

    aget v1, v2, p1

    .line 539
    .local v1, "color":I
    :goto_3e
    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/color/CircleView;->setBackgroundColor(I)V

    .line 540
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z

    move-result v2

    if-eqz v2, :cond_83

    .line 541
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex()I
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v2

    if-ne v2, p1, :cond_81

    move v2, v3

    :goto_52
    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setSelected(Z)V

    .line 543
    :goto_55
    const-string v2, "%d:%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v5, v3

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setTag(Ljava/lang/Object;)V

    .line 544
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 545
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 546
    return-object p2

    .line 538
    .end local v1    # "color":I
    :cond_78
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[I

    move-result-object v2

    aget v1, v2, p1

    goto :goto_3e

    .restart local v1    # "color":I
    :cond_81
    move v2, v4

    .line 541
    goto :goto_52

    .line 542
    :cond_83
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v2

    if-ne v2, p1, :cond_90

    move v2, v3

    :goto_8c
    invoke-virtual {v0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setSelected(Z)V

    goto :goto_55

    :cond_90
    move v2, v4

    goto :goto_8c
.end method
