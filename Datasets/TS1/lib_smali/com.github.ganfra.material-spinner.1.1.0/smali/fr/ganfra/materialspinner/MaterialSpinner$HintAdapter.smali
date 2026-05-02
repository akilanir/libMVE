.class Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;
.super Landroid/widget/BaseAdapter;
.source "MaterialSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfr/ganfra/materialspinner/MaterialSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HintAdapter"
.end annotation


# static fields
.field private static final HINT_TYPE:I = -0x1


# instance fields
.field private mContext:Landroid/content/Context;

.field private mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

.field final synthetic this$0:Lfr/ganfra/materialspinner/MaterialSpinner;


# direct methods
.method public constructor <init>(Lfr/ganfra/materialspinner/MaterialSpinner;Landroid/widget/SpinnerAdapter;Landroid/content/Context;)V
    .registers 4
    .param p2, "spinnerAdapter"    # Landroid/widget/SpinnerAdapter;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 679
    iput-object p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 680
    iput-object p2, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    .line 681
    iput-object p3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mContext:Landroid/content/Context;

    .line 682
    return-void
.end method

.method private buildView(ILandroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .param p4, "isDropDownView"    # Z

    .prologue
    const/4 v1, -0x1

    .line 729
    invoke-virtual {p0, p1}, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->getItemViewType(I)I

    move-result v0

    if-ne v0, v1, :cond_c

    .line 730
    invoke-direct {p0, p3, p4}, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->getHintView(Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 739
    :goto_b
    return-object v0

    .line 734
    :cond_c
    if-eqz p2, :cond_28

    .line 735
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3b

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_3b

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v1, :cond_3b

    .line 737
    :cond_28
    :goto_28
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_32

    add-int/lit8 p1, p1, -0x1

    .line 738
    :cond_32
    if-eqz p4, :cond_3d

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_b

    .line 735
    :cond_3b
    const/4 p2, 0x0

    goto :goto_28

    .line 738
    :cond_3d
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    .line 739
    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_b
.end method

.method private getHintView(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "isDropDownView"    # Z

    .prologue
    .line 746
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 747
    .local v0, "inflater":Landroid/view/LayoutInflater;
    if-eqz p2, :cond_35

    const v1, 0x1090009

    .line 748
    .local v1, "resid":I
    :goto_b
    const/4 v3, 0x0

    invoke-virtual {v0, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 750
    .local v2, "textView":Landroid/widget/TextView;
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v3}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 751
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    invoke-virtual {v3}, Lfr/ganfra/materialspinner/MaterialSpinner;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_39

    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I
    invoke-static {v3}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$700(Lfr/ganfra/materialspinner/MaterialSpinner;)I

    move-result v3

    :goto_29
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 752
    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 754
    return-object v2

    .line 747
    .end local v1    # "resid":I
    .end local v2    # "textView":Landroid/widget/TextView;
    :cond_35
    const v1, 0x1090008

    goto :goto_b

    .line 751
    .restart local v1    # "resid":I
    .restart local v2    # "textView":Landroid/widget/TextView;
    :cond_39
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I
    invoke-static {v3}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$800(Lfr/ganfra/materialspinner/MaterialSpinner;)I

    move-result v3

    goto :goto_29
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    .line 702
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    .line 703
    .local v0, "count":I
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v1}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_10

    add-int/lit8 v0, v0, 0x1

    .end local v0    # "count":I
    :cond_10
    return v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 725
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->buildView(ILandroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 708
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_a

    add-int/lit8 p1, p1, -0x1

    .line 709
    :cond_a
    const/4 v0, -0x1

    if-ne p1, v0, :cond_14

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    :goto_13
    return-object v0

    :cond_14
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_13
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 714
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_a

    add-int/lit8 p1, p1, -0x1

    .line 715
    :cond_a
    const/4 v0, -0x1

    if-ne p1, v0, :cond_10

    const-wide/16 v0, 0x0

    :goto_f
    return-wide v0

    :cond_10
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v0

    goto :goto_f
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    const/4 v0, -0x1

    .line 696
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v1}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_b

    add-int/lit8 p1, p1, -0x1

    .line 697
    :cond_b
    if-ne p1, v0, :cond_e

    :goto_d
    return v0

    :cond_e
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v0

    goto :goto_d
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 720
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->buildView(ILandroid/view/View;Landroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewTypeCount()I
    .registers 4

    .prologue
    .line 687
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_8

    .line 688
    const/4 v0, 0x1

    .line 691
    :goto_7
    return v0

    .line 690
    :cond_8
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;->mSpinnerAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getViewTypeCount()I

    move-result v0

    .line 691
    .local v0, "viewTypeCount":I
    goto :goto_7
.end method
