.class Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;
.super Landroid/support/v7/widget/ListPopupWindow;
.source "AppCompatSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropdownPopup"
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mHintText:Ljava/lang/CharSequence;

.field private final mVisibleRect:Landroid/graphics/Rect;

.field final synthetic this$0:Landroid/support/v7/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/AppCompatSpinner;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .prologue
    .line 695
    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    .line 696
    invoke-direct {p0, p2, p3, p4}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 693
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mVisibleRect:Landroid/graphics/Rect;

    .line 698
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setAnchorView(Landroid/view/View;)V

    .line 699
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setModal(Z)V

    .line 700
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setPromptPosition(I)V

    .line 702
    new-instance v0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$1;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;Landroid/support/v7/widget/AppCompatSpinner;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 713
    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)Landroid/widget/ListAdapter;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    .prologue
    .line 690
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method static synthetic access$600(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;Landroid/view/View;)Z
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 690
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->isVisibleToUser(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$701(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    .prologue
    .line 690
    invoke-super {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    return-void
.end method

.method private isVisibleToUser(Landroid/view/View;)Z
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 821
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mVisibleRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method


# virtual methods
.method computeContentWidth()V
    .registers 11

    .prologue
    .line 731
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 732
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    .line 733
    .local v3, "hOffset":I
    if-eqz v0, :cond_97

    .line 734
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 735
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-static {v7}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_8d

    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget v3, v7, Landroid/graphics/Rect;->right:I

    .line 741
    :goto_20
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v7}, Landroid/support/v7/widget/AppCompatSpinner;->getPaddingLeft()I

    move-result v4

    .line 742
    .local v4, "spinnerPaddingLeft":I
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v7}, Landroid/support/v7/widget/AppCompatSpinner;->getPaddingRight()I

    move-result v5

    .line 743
    .local v5, "spinnerPaddingRight":I
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v7}, Landroid/support/v7/widget/AppCompatSpinner;->getWidth()I

    move-result v6

    .line 744
    .local v6, "spinnerWidth":I
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$400(Landroid/support/v7/widget/AppCompatSpinner;)I

    move-result v7

    const/4 v8, -0x2

    if-ne v7, v8, :cond_aa

    .line 745
    iget-object v8, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    check-cast v7, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    # invokes: Landroid/support/v7/widget/AppCompatSpinner;->compatMeasureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    invoke-static {v8, v7, v9}, Landroid/support/v7/widget/AppCompatSpinner;->access$500(Landroid/support/v7/widget/AppCompatSpinner;Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v1

    .line 747
    .local v1, "contentWidth":I
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v7}, Landroid/support/v7/widget/AppCompatSpinner;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v8

    iget-object v8, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->right:I

    sub-int v2, v7, v8

    .line 749
    .local v2, "contentWidthLimit":I
    if-le v1, v2, :cond_6f

    .line 750
    move v1, v2

    .line 752
    :cond_6f
    sub-int v7, v6, v4

    sub-int/2addr v7, v5

    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    .line 759
    .end local v1    # "contentWidth":I
    .end local v2    # "contentWidthLimit":I
    :goto_79
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-static {v7}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_c4

    .line 760
    sub-int v7, v6, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getWidth()I

    move-result v8

    sub-int/2addr v7, v8

    add-int/2addr v3, v7

    .line 764
    :goto_89
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setHorizontalOffset(I)V

    .line 765
    return-void

    .line 735
    .end local v4    # "spinnerPaddingLeft":I
    .end local v5    # "spinnerPaddingRight":I
    .end local v6    # "spinnerWidth":I
    :cond_8d
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->left:I

    neg-int v3, v7

    goto :goto_20

    .line 738
    :cond_97
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget-object v8, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Landroid/support/v7/widget/AppCompatSpinner;->access$300(Landroid/support/v7/widget/AppCompatSpinner;)Landroid/graphics/Rect;

    move-result-object v8

    const/4 v9, 0x0

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v7, Landroid/graphics/Rect;->left:I

    goto/16 :goto_20

    .line 754
    .restart local v4    # "spinnerPaddingLeft":I
    .restart local v5    # "spinnerPaddingRight":I
    .restart local v6    # "spinnerWidth":I
    :cond_aa
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$400(Landroid/support/v7/widget/AppCompatSpinner;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_ba

    .line 755
    sub-int v7, v6, v4

    sub-int/2addr v7, v5

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_79

    .line 757
    :cond_ba
    iget-object v7, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    # getter for: Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I
    invoke-static {v7}, Landroid/support/v7/widget/AppCompatSpinner;->access$400(Landroid/support/v7/widget/AppCompatSpinner;)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_79

    .line 762
    :cond_c4
    add-int/2addr v3, v4

    goto :goto_89
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 722
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 2
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 717
    invoke-super {p0, p1}, Landroid/support/v7/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 718
    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    .line 719
    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "hintText"    # Ljava/lang/CharSequence;

    .prologue
    .line 727
    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    .line 728
    return-void
.end method

.method public show()V
    .registers 6

    .prologue
    .line 768
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->isShowing()Z

    move-result v3

    .line 770
    .local v3, "wasShowing":Z
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->computeContentWidth()V

    .line 772
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setInputMethodMode(I)V

    .line 773
    invoke-super {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    .line 774
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getListView()Landroid/widget/ListView;

    move-result-object v1

    .line 775
    .local v1, "listView":Landroid/widget/ListView;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 776
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v4}, Landroid/support/v7/widget/AppCompatSpinner;->getSelectedItemPosition()I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setSelection(I)V

    .line 778
    if-eqz v3, :cond_22

    .line 815
    :cond_21
    :goto_21
    return-void

    .line 787
    :cond_22
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v4}, Landroid/support/v7/widget/AppCompatSpinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 788
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    if-eqz v2, :cond_21

    .line 789
    new-instance v0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$2;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$2;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V

    .line 804
    .local v0, "layoutListener":Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    invoke-virtual {v2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 805
    new-instance v4, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$3;

    invoke-direct {v4, p0, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$3;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    goto :goto_21
.end method
