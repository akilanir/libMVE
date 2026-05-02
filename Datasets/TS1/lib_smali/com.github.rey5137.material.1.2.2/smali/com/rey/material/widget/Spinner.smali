.class public Lcom/rey/material/widget/Spinner;
.super Lcom/rey/material/widget/FrameLayout;
.source "Spinner.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/Spinner$DropdownPopup;,
        Lcom/rey/material/widget/Spinner$DropDownAdapter;,
        Lcom/rey/material/widget/Spinner$RecycleBin;,
        Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;,
        Lcom/rey/material/widget/Spinner$SavedState;,
        Lcom/rey/material/widget/Spinner$OnItemSelectedListener;,
        Lcom/rey/material/widget/Spinner$OnItemClickListener;
    }
.end annotation


# static fields
.field private static final INVALID_POSITION:I = -0x1

.field private static final MAX_ITEMS_MEASURED:I = 0xf


# instance fields
.field private mAdapter:Landroid/widget/SpinnerAdapter;

.field private mArrowAnimSwitchMode:Z

.field private mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

.field private mArrowPadding:I

.field private mArrowSize:I

.field private mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

.field private mDisableChildrenWhenDisabled:Z

.field private mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

.field private mDividerHeight:I

.field private mDividerPadding:I

.field private mDropDownWidth:I

.field private mGravity:I

.field private mIsRtl:Z

.field private mLabelEnable:Z

.field private mLabelView:Lcom/rey/material/widget/TextView;

.field private mMinHeight:I

.field private mMinWidth:I

.field private mOnItemClickListener:Lcom/rey/material/widget/Spinner$OnItemClickListener;

.field private mOnItemSelectedListener:Lcom/rey/material/widget/Spinner$OnItemSelectedListener;

.field private mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

.field private mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

.field private mSelectedPosition:I

.field private mTempAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

.field private mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 109
    sget v0, Lcom/rey/material/R$attr;->listPopupWindowStyle:I

    invoke-direct {p0, p1, v1, v0}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    new-instance v0, Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$RecycleBin;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    .line 100
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    .line 104
    new-instance v0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 113
    sget v0, Lcom/rey/material/R$attr;->listPopupWindowStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    new-instance v0, Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$RecycleBin;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    .line 100
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    .line 104
    new-instance v0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 117
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    new-instance v0, Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$RecycleBin;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    .line 100
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    .line 104
    new-instance v0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    .line 118
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 121
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 98
    new-instance v0, Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$RecycleBin;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    .line 100
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    .line 104
    new-instance v0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    .line 122
    return-void
.end method

.method static synthetic access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/rey/material/widget/Spinner;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/rey/material/widget/Spinner;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mDropDownWidth:I

    return v0
.end method

.method static synthetic access$1300(Lcom/rey/material/widget/Spinner;Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    .registers 4
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;
    .param p1, "x1"    # Landroid/widget/SpinnerAdapter;
    .param p2, "x2"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/Spinner;->measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/Spinner;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->showPopup()V

    return-void
.end method

.method static synthetic access$300(Lcom/rey/material/widget/Spinner;)Lcom/rey/material/drawable/ArrowDrawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/rey/material/widget/Spinner;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onDataChanged()V

    return-void
.end method

.method static synthetic access$500(Lcom/rey/material/widget/Spinner;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onDataInvalidated()V

    return-void
.end method

.method static synthetic access$800(Lcom/rey/material/widget/Spinner;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onPopupDismissed()V

    return-void
.end method

.method private getArrowDrawableWidth()I
    .registers 3

    .prologue
    .line 626
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/rey/material/widget/Spinner;->mArrowSize:I

    iget v1, p0, Lcom/rey/material/widget/Spinner;->mArrowPadding:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private getDividerDrawableHeight()I
    .registers 3

    .prologue
    .line 630
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    if-lez v0, :cond_a

    iget v0, p0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    iget v1, p0, Lcom/rey/material/widget/Spinner;->mDividerPadding:I

    add-int/2addr v0, v1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private getLabelView()Landroid/widget/TextView;
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 153
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    if-nez v0, :cond_2a

    .line 154
    new-instance v0, Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    .line 155
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_20

    .line 156
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    iget-boolean v0, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    if-eqz v0, :cond_2d

    const/4 v0, 0x4

    :goto_1d
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/TextView;->setTextDirection(I)V

    .line 157
    :cond_20
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/TextView;->setSingleLine(Z)V

    .line 158
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/TextView;->setDuplicateParentStateEnabled(Z)V

    .line 161
    :cond_2a
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    return-object v0

    .line 156
    :cond_2d
    const/4 v0, 0x3

    goto :goto_1d
.end method

.method private measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    .registers 16
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;
    .param p2, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 914
    if-nez p1, :cond_4

    .line 915
    const/4 v8, 0x0

    .line 950
    :cond_3
    :goto_3
    return v8

    .line 917
    :cond_4
    const/4 v8, 0x0

    .line 918
    .local v8, "width":I
    const/4 v5, 0x0

    .line 919
    .local v5, "itemView":Landroid/view/View;
    const/4 v4, 0x0

    .line 921
    .local v4, "itemType":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 922
    .local v9, "widthMeasureSpec":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 926
    .local v2, "heightMeasureSpec":I
    const/4 v10, 0x0

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getSelectedItemPosition()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 927
    .local v7, "start":I
    invoke-interface {p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v10

    add-int/lit8 v11, v7, 0xf

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 928
    .local v1, "end":I
    sub-int v0, v1, v7

    .line 929
    .local v0, "count":I
    const/4 v10, 0x0

    rsub-int/lit8 v11, v0, 0xf

    sub-int v11, v7, v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 930
    move v3, v7

    .local v3, "i":I
    :goto_32
    if-ge v3, v1, :cond_5f

    .line 931
    invoke-interface {p1, v3}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v6

    .line 932
    .local v6, "positionType":I
    if-eq v6, v4, :cond_3c

    .line 933
    move v4, v6

    .line 934
    const/4 v5, 0x0

    .line 936
    :cond_3c
    const/4 v10, 0x0

    invoke-interface {p1, v3, v5, v10}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 937
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    if-nez v10, :cond_51

    .line 938
    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x2

    const/4 v12, -0x2

    invoke-direct {v10, v11, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 940
    :cond_51
    invoke-virtual {v5, v9, v2}, Landroid/view/View;->measure(II)V

    .line 941
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    invoke-static {v8, v10}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 930
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 945
    .end local v6    # "positionType":I
    :cond_5f
    if-eqz p2, :cond_3

    .line 946
    iget-object v10, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p2, v10}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 947
    iget-object v10, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    iget-object v11, p0, Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->right:I

    add-int/2addr v10, v11

    add-int/2addr v8, v10

    goto :goto_3
.end method

.method private onDataChanged()V
    .registers 3

    .prologue
    .line 855
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 856
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->setSelection(I)V

    .line 861
    :goto_9
    return-void

    .line 857
    :cond_a
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 858
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onDataInvalidated()V

    goto :goto_9

    .line 860
    :cond_18
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->setSelection(I)V

    goto :goto_9
.end method

.method private onDataInvalidated()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 864
    iget-object v3, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v3, :cond_6

    .line 884
    :goto_5
    return-void

    .line 867
    :cond_6
    iget-object v3, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    if-nez v3, :cond_41

    .line 868
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->removeAllViews()V

    .line 873
    :cond_d
    iget-object v3, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget v4, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    invoke-interface {v3, v4}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v1

    .line 874
    .local v1, "type":I
    iget-object v3, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget v4, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    iget-object v5, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-virtual {v5, v1}, Lcom/rey/material/widget/Spinner$RecycleBin;->get(I)Landroid/view/View;

    move-result-object v5

    invoke-interface {v3, v4, v5, p0}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 875
    .local v2, "v":Landroid/view/View;
    invoke-virtual {v2, v6}, Landroid/view/View;->setFocusable(Z)V

    .line 876
    invoke-virtual {v2, v6}, Landroid/view/View;->setClickable(Z)V

    .line 878
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_38

    .line 879
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 881
    :cond_38
    invoke-super {p0, v2}, Lcom/rey/material/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 883
    iget-object v3, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-virtual {v3, v1, v2}, Lcom/rey/material/widget/Spinner$RecycleBin;->put(ILandroid/view/View;)V

    goto :goto_5

    .line 870
    .end local v1    # "type":I
    .end local v2    # "v":Landroid/view/View;
    :cond_41
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getChildCount()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_47
    if-lez v0, :cond_d

    .line 871
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->removeViewAt(I)V

    .line 870
    add-int/lit8 v0, v0, -0x1

    goto :goto_47
.end method

.method private onPopupDismissed()V
    .registers 4

    .prologue
    .line 909
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v0, :cond_c

    .line 910
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    sget v1, Lcom/rey/material/drawable/ArrowDrawable;->MODE_DOWN:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/drawable/ArrowDrawable;->setMode(IZ)V

    .line 911
    :cond_c
    return-void
.end method

.method private showPopup()V
    .registers 4

    .prologue
    .line 887
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->isShowing()Z

    move-result v1

    if-nez v1, :cond_3a

    .line 888
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->show()V

    .line 889
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getListView()Lcom/rey/material/widget/ListView;

    move-result-object v0

    .line 890
    .local v0, "lv":Lcom/rey/material/widget/ListView;
    if-eqz v0, :cond_3a

    .line 891
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_1f

    .line 892
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/ListView;->setChoiceMode(I)V

    .line 893
    :cond_1f
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/ListView;->setSelection(I)V

    .line 894
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v1, :cond_3a

    iget-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mArrowAnimSwitchMode:Z

    if-eqz v1, :cond_3a

    .line 895
    invoke-virtual {v0}, Lcom/rey/material/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/rey/material/widget/Spinner$2;

    invoke-direct {v2, p0, v0}, Lcom/rey/material/widget/Spinner$2;-><init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/ListView;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 906
    .end local v0    # "lv":Lcom/rey/material/widget/ListView;
    :cond_3a
    return-void
.end method


# virtual methods
.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 31
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 166
    invoke-super/range {p0 .. p4}, Lcom/rey/material/widget/FrameLayout;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->removeAllViews()V

    .line 170
    sget-object v4, Lcom/rey/material/R$styleable;->Spinner:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v11

    .line 172
    .local v11, "a":Landroid/content/res/TypedArray;
    const/4 v8, -0x1

    .line 173
    .local v8, "arrowAnimDuration":I
    const/4 v7, 0x0

    .line 174
    .local v7, "arrowColor":Landroid/content/res/ColorStateList;
    const/4 v9, 0x0

    .line 175
    .local v9, "arrowInterpolator":Landroid/view/animation/Interpolator;
    const/4 v10, 0x1

    .line 176
    .local v10, "arrowClockwise":Z
    const/4 v15, -0x1

    .line 177
    .local v15, "dividerAnimDuration":I
    const/16 v16, 0x0

    .line 178
    .local v16, "dividerColor":Landroid/content/res/ColorStateList;
    const/16 v19, 0x0

    .line 179
    .local v19, "labelTextColor":Landroid/content/res/ColorStateList;
    const/16 v20, -0x1

    .line 181
    .local v20, "labelTextSize":I
    const/16 v17, 0x0

    .local v17, "i":I
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v14

    .local v14, "count":I
    :goto_25
    move/from16 v0, v17

    if-ge v0, v14, :cond_1f7

    .line 182
    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v12

    .line 184
    .local v12, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelEnable:I

    if-ne v12, v4, :cond_3f

    .line 185
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/Spinner;->mLabelEnable:Z

    .line 181
    :cond_3c
    :goto_3c
    add-int/lit8 v17, v17, 0x1

    goto :goto_25

    .line 186
    :cond_3f
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelPadding:I

    if-ne v12, v4, :cond_5b

    .line 187
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-virtual {v11, v12, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v5, v6, v0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_3c

    .line 188
    :cond_5b
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelTextSize:I

    if-ne v12, v4, :cond_65

    .line 189
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v20

    goto :goto_3c

    .line 190
    :cond_65
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelTextColor:I

    if-ne v12, v4, :cond_6e

    .line 191
    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v19

    goto :goto_3c

    .line 192
    :cond_6e
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelTextAppearance:I

    if-ne v12, v4, :cond_81

    .line 193
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v11, v12, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v5}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_3c

    .line 194
    :cond_81
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_labelEllipsize:I

    if-ne v12, v4, :cond_c0

    .line 195
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v18

    .line 196
    .local v18, "labelEllipsize":I
    packed-switch v18, :pswitch_data_38e

    .line 210
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_3c

    .line 198
    :pswitch_97
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_3c

    .line 201
    :pswitch_a1
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_3c

    .line 204
    :pswitch_ab
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_3c

    .line 207
    :pswitch_b5
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_3c

    .line 214
    .end local v18    # "labelEllipsize":I
    :cond_c0
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_label:I

    if-ne v12, v4, :cond_d1

    .line 215
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3c

    .line 216
    :cond_d1
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_gravity:I

    if-ne v12, v4, :cond_e0

    .line 217
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mGravity:I

    goto/16 :goto_3c

    .line 218
    :cond_e0
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_minWidth:I

    if-ne v12, v4, :cond_f0

    .line 219
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/Spinner;->setMinimumWidth(I)V

    goto/16 :goto_3c

    .line 220
    :cond_f0
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_minHeight:I

    if-ne v12, v4, :cond_100

    .line 221
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/Spinner;->setMinimumHeight(I)V

    goto/16 :goto_3c

    .line 222
    :cond_100
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_dropDownWidth:I

    if-ne v12, v4, :cond_10f

    .line 223
    const/4 v4, -0x2

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mDropDownWidth:I

    goto/16 :goto_3c

    .line 224
    :cond_10f
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_popupBackground:I

    if-ne v12, v4, :cond_120

    .line 225
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3c

    .line 226
    :cond_120
    sget v4, Lcom/rey/material/R$styleable;->Spinner_android_prompt:I

    if-ne v12, v4, :cond_131

    .line 227
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setPromptText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3c

    .line 228
    :cond_131
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_popupItemAnimation:I

    if-ne v12, v4, :cond_143

    .line 229
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    const/4 v5, 0x0

    invoke-virtual {v11, v12, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setItemAnimation(I)V

    goto/16 :goto_3c

    .line 230
    :cond_143
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_popupItemAnimOffset:I

    if-ne v12, v4, :cond_155

    .line 231
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    const/4 v5, 0x0

    invoke-virtual {v11, v12, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setItemAnimationOffset(I)V

    goto/16 :goto_3c

    .line 232
    :cond_155
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_disableChildrenWhenDisabled:I

    if-ne v12, v4, :cond_164

    .line 233
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/Spinner;->mDisableChildrenWhenDisabled:Z

    goto/16 :goto_3c

    .line 234
    :cond_164
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowSwitchMode:I

    if-ne v12, v4, :cond_173

    .line 235
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/Spinner;->mArrowAnimSwitchMode:Z

    goto/16 :goto_3c

    .line 236
    :cond_173
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowAnimDuration:I

    if-ne v12, v4, :cond_17e

    .line 237
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v8

    goto/16 :goto_3c

    .line 238
    :cond_17e
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowSize:I

    if-ne v12, v4, :cond_18d

    .line 239
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mArrowSize:I

    goto/16 :goto_3c

    .line 240
    :cond_18d
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowPadding:I

    if-ne v12, v4, :cond_19c

    .line 241
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mArrowPadding:I

    goto/16 :goto_3c

    .line 242
    :cond_19c
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowColor:I

    if-ne v12, v4, :cond_1a6

    .line 243
    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    goto/16 :goto_3c

    .line 244
    :cond_1a6
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowInterpolator:I

    if-ne v12, v4, :cond_1b9

    .line 245
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v21

    .line 246
    .local v21, "resId":I
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v9

    .line 247
    goto/16 :goto_3c

    .line 248
    .end local v21    # "resId":I
    :cond_1b9
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_arrowAnimClockwise:I

    if-ne v12, v4, :cond_1c4

    .line 249
    const/4 v4, 0x1

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v10

    goto/16 :goto_3c

    .line 250
    :cond_1c4
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_dividerHeight:I

    if-ne v12, v4, :cond_1d3

    .line 251
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    goto/16 :goto_3c

    .line 252
    :cond_1d3
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_dividerPadding:I

    if-ne v12, v4, :cond_1e2

    .line 253
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Spinner;->mDividerPadding:I

    goto/16 :goto_3c

    .line 254
    :cond_1e2
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_dividerAnimDuration:I

    if-ne v12, v4, :cond_1ed

    .line 255
    const/4 v4, 0x0

    invoke-virtual {v11, v12, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v15

    goto/16 :goto_3c

    .line 256
    :cond_1ed
    sget v4, Lcom/rey/material/R$styleable;->Spinner_spn_dividerColor:I

    if-ne v12, v4, :cond_3c

    .line 257
    invoke-virtual {v11, v12}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v16

    goto/16 :goto_3c

    .line 260
    .end local v12    # "attr":I
    :cond_1f7
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 262
    if-eqz v19, :cond_205

    .line 263
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 265
    :cond_205
    if-ltz v20, :cond_212

    .line 266
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    const/4 v5, 0x0

    move/from16 v0, v20

    int-to-float v6, v0

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 268
    :cond_212
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/rey/material/widget/Spinner;->mLabelEnable:Z

    if-eqz v4, :cond_22f

    .line 269
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getLabelView()Landroid/widget/TextView;

    move-result-object v4

    const/4 v5, 0x0

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/16 v24, -0x2

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v6, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6}, Lcom/rey/material/widget/Spinner;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 271
    :cond_22f
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Spinner;->mArrowSize:I

    if-lez v4, :cond_342

    .line 272
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-nez v4, :cond_313

    .line 273
    if-nez v7, :cond_249

    .line 274
    const/high16 v4, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    .line 276
    :cond_249
    if-gez v8, :cond_24c

    .line 277
    const/4 v8, 0x0

    .line 279
    :cond_24c
    new-instance v4, Lcom/rey/material/drawable/ArrowDrawable;

    sget v5, Lcom/rey/material/drawable/ArrowDrawable;->MODE_DOWN:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/widget/Spinner;->mArrowSize:I

    invoke-direct/range {v4 .. v10}, Lcom/rey/material/drawable/ArrowDrawable;-><init>(IILandroid/content/res/ColorStateList;ILandroid/view/animation/Interpolator;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    .line 280
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/rey/material/drawable/ArrowDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 301
    :cond_264
    :goto_264
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    if-lez v4, :cond_378

    .line 302
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    if-nez v4, :cond_357

    .line 303
    if-gez v15, :cond_273

    .line 304
    const/4 v15, 0x0

    .line 306
    :cond_273
    if-nez v16, :cond_2b1

    .line 307
    const/4 v4, 0x2

    new-array v0, v4, [[I

    move-object/from16 v22, v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v24, -0x10100a7

    aput v24, v5, v6

    aput-object v5, v22, v4

    const/4 v4, 0x1

    const/4 v5, 0x2

    new-array v5, v5, [I

    fill-array-data v5, :array_39a

    aput-object v5, v22, v4

    .line 311
    .local v22, "states":[[I
    const/4 v4, 0x2

    new-array v13, v4, [I

    const/4 v4, 0x0

    const/high16 v5, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v5

    aput v5, v13, v4

    const/4 v4, 0x1

    const/high16 v5, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v5

    aput v5, v13, v4

    .line 316
    .local v13, "colors":[I
    new-instance v16, Landroid/content/res/ColorStateList;

    .end local v16    # "dividerColor":Landroid/content/res/ColorStateList;
    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v13}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 319
    .end local v13    # "colors":[I
    .end local v22    # "states":[[I
    .restart local v16    # "dividerColor":Landroid/content/res/ColorStateList;
    :cond_2b1
    new-instance v4, Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    move-object/from16 v0, v16

    invoke-direct {v4, v5, v0, v15}, Lcom/rey/material/drawable/DividerDrawable;-><init>(ILandroid/content/res/ColorStateList;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    .line 320
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/rey/material/drawable/DividerDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 337
    :cond_2c9
    :goto_2c9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mTempAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    if-eqz v4, :cond_2df

    .line 338
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/rey/material/widget/Spinner;->mTempAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    invoke-virtual {v4, v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 339
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Spinner;->mTempAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    .line 342
    :cond_2df
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v4, :cond_2ee

    .line 343
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 345
    :cond_2ee
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->isInEditMode()Z

    move-result v4

    if-eqz v4, :cond_30f

    .line 346
    new-instance v23, Lcom/rey/material/widget/TextView;

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 347
    .local v23, "tv":Lcom/rey/material/widget/TextView;
    const-string v4, "Item 1"

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-super {v0, v1}, Lcom/rey/material/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 351
    .end local v23    # "tv":Lcom/rey/material/widget/TextView;
    :cond_30f
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->requestLayout()V

    .line 352
    return-void

    .line 283
    :cond_313
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/widget/Spinner;->mArrowSize:I

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/ArrowDrawable;->setArrowSize(I)V

    .line 284
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {v4, v10}, Lcom/rey/material/drawable/ArrowDrawable;->setClockwise(Z)V

    .line 286
    if-eqz v7, :cond_32e

    .line 287
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {v4, v7}, Lcom/rey/material/drawable/ArrowDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 289
    :cond_32e
    if-ltz v8, :cond_337

    .line 290
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {v4, v8}, Lcom/rey/material/drawable/ArrowDrawable;->setAnimationDuration(I)V

    .line 292
    :cond_337
    if-eqz v9, :cond_264

    .line 293
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {v4, v9}, Lcom/rey/material/drawable/ArrowDrawable;->setInterpolator(Landroid/view/animation/Interpolator;)V

    goto/16 :goto_264

    .line 296
    :cond_342
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v4, :cond_264

    .line 297
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/ArrowDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 298
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    goto/16 :goto_264

    .line 323
    :cond_357
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/DividerDrawable;->setDividerHeight(I)V

    .line 325
    if-eqz v16, :cond_36d

    .line 326
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 328
    :cond_36d
    if-ltz v15, :cond_2c9

    .line 329
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v4, v15}, Lcom/rey/material/drawable/DividerDrawable;->setAnimationDuration(I)V

    goto/16 :goto_2c9

    .line 332
    :cond_378
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    if-eqz v4, :cond_2c9

    .line 333
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/DividerDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 334
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    goto/16 :goto_2c9

    .line 196
    nop

    :pswitch_data_38e
    .packed-switch 0x1
        :pswitch_97
        :pswitch_a1
        :pswitch_ab
        :pswitch_b5
    .end packed-switch

    .line 307
    :array_39a
    .array-data 4
        0x10100a7
        0x101009e
    .end array-data
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 821
    invoke-super {p0, p1}, Lcom/rey/material/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 822
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    if-eqz v0, :cond_c

    .line 823
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/DividerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 824
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v0, :cond_15

    .line 825
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ArrowDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 826
    :cond_15
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 830
    invoke-super {p0}, Lcom/rey/material/widget/FrameLayout;->drawableStateChanged()V

    .line 831
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eqz v0, :cond_10

    .line 832
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/ArrowDrawable;->setState([I)Z

    .line 833
    :cond_10
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    if-eqz v0, :cond_1d

    .line 834
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/DividerDrawable;->setState([I)Z

    .line 835
    :cond_1d
    return-void
.end method

.method public getAdapter()Landroid/widget/SpinnerAdapter;
    .registers 2

    .prologue
    .line 412
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    return-object v0
.end method

.method public getBaseline()I
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 582
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getSelectedView()Landroid/view/View;

    move-result-object v0

    .line 584
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_12

    .line 585
    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v1

    .line 586
    .local v1, "childBaseline":I
    if-ltz v1, :cond_12

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    add-int/2addr v2, v1

    .line 589
    .end local v1    # "childBaseline":I
    :cond_12
    return v2
.end method

.method public getDropDownHorizontalOffset()I
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getHorizontalOffset()I

    move-result v0

    return v0
.end method

.method public getDropDownVerticalOffset()I
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getVerticalOffset()I

    move-result v0

    return v0
.end method

.method public getDropDownWidth()I
    .registers 2

    .prologue
    .line 539
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mDropDownWidth:I

    return v0
.end method

.method public getPopupBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 465
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedItem()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 405
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget v1, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    invoke-interface {v0, v1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public getSelectedItemPosition()I
    .registers 2

    .prologue
    .line 398
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .registers 3

    .prologue
    .line 372
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Spinner;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 373
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    if-ne v0, v1, :cond_f

    const/4 v0, 0x0

    .end local v0    # "v":Landroid/view/View;
    :cond_f
    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 126
    iput-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mLabelEnable:Z

    .line 127
    const/4 v0, -0x2

    iput v0, p0, Lcom/rey/material/widget/Spinner;->mDropDownWidth:I

    .line 128
    iput-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mArrowAnimSwitchMode:Z

    .line 129
    const/16 v0, 0x11

    iput v0, p0, Lcom/rey/material/widget/Spinner;->mGravity:I

    .line 130
    iput-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mDisableChildrenWhenDisabled:Z

    .line 131
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    .line 132
    iput-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    .line 134
    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Spinner;->setWillNotDraw(Z)V

    .line 136
    new-instance v0, Lcom/rey/material/widget/Spinner$DropdownPopup;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/rey/material/widget/Spinner$DropdownPopup;-><init>(Lcom/rey/material/widget/Spinner;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    .line 137
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setModal(Z)V

    .line 139
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 140
    sget v0, Lcom/rey/material/R$style;->Material_Widget_Spinner:I

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->applyStyle(I)V

    .line 142
    :cond_33
    new-instance v0, Lcom/rey/material/widget/Spinner$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Spinner$1;-><init>(Lcom/rey/material/widget/Spinner;)V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 150
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 594
    invoke-super {p0}, Lcom/rey/material/widget/FrameLayout;->onDetachedFromWindow()V

    .line 595
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 596
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->dismiss()V

    .line 597
    :cond_14
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 617
    const/4 v0, 0x1

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 28
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 744
    sub-int v14, p4, p2

    .line 745
    .local v14, "w":I
    sub-int v9, p5, p3

    .line 746
    .local v9, "h":I
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getArrowDrawableWidth()I

    move-result v3

    .line 748
    .local v3, "arrowWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    move-object/from16 v17, v0

    if-eqz v17, :cond_4d

    .line 749
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingTop()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    if-nez v17, :cond_13f

    const/16 v17, 0x0

    :goto_1e
    add-int v11, v18, v17

    .line 750
    .local v11, "top":I
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getDividerDrawableHeight()I

    move-result v17

    sub-int v17, v9, v17

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingBottom()I

    move-result v18

    sub-int v4, v17, v18

    .line 751
    .local v4, "bottom":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_14b

    .line 752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v19

    add-int v19, v19, v3

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v11, v2, v4}, Lcom/rey/material/drawable/ArrowDrawable;->setBounds(IIII)V

    .line 757
    .end local v4    # "bottom":I
    .end local v11    # "top":I
    :cond_4d
    :goto_4d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v17, v0

    if-eqz v17, :cond_7c

    .line 758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/Spinner;->mDividerHeight:I

    move/from16 v19, v0

    sub-int v19, v9, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingBottom()I

    move-result v20

    sub-int v19, v19, v20

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v20

    sub-int v20, v14, v20

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingBottom()I

    move-result v21

    sub-int v21, v9, v21

    invoke-virtual/range {v17 .. v21}, Lcom/rey/material/drawable/DividerDrawable;->setBounds(IIII)V

    .line 760
    :cond_7c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_172

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v17

    add-int v6, v17, v3

    .line 761
    .local v6, "childLeft":I
    :goto_8a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_178

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v17

    sub-int v7, v14, v17

    .line 762
    .local v7, "childRight":I
    :goto_98
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingTop()I

    move-result v8

    .line 763
    .local v8, "childTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingBottom()I

    move-result v17

    sub-int v5, v9, v17

    .line 765
    .local v5, "childBottom":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    if-eqz v17, :cond_e5

    .line 766
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_182

    .line 767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v18

    sub-int v18, v7, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v19

    add-int v19, v19, v8

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v8, v7, v2}, Lcom/rey/material/widget/TextView;->layout(IIII)V

    .line 770
    :goto_d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v17

    add-int v8, v8, v17

    .line 773
    :cond_e5
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getSelectedView()Landroid/view/View;

    move-result-object v12

    .line 774
    .local v12, "v":Landroid/view/View;
    if-eqz v12, :cond_13e

    .line 777
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/Spinner;->mGravity:I

    move/from16 v17, v0

    and-int/lit8 v10, v17, 0x7

    .line 778
    .local v10, "horizontalGravity":I
    const v17, 0x800003

    move/from16 v0, v17

    if-ne v10, v0, :cond_1ae

    .line 779
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1ab

    const/4 v10, 0x5

    .line 783
    :cond_103
    :goto_103
    packed-switch v10, :pswitch_data_1f6

    .line 794
    :pswitch_106
    sub-int v17, v7, v6

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    sub-int v17, v17, v18

    div-int/lit8 v17, v17, 0x2

    add-int v15, v17, v6

    .line 798
    .local v15, "x":I
    :goto_112
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/Spinner;->mGravity:I

    move/from16 v17, v0

    and-int/lit8 v13, v17, 0x70

    .line 800
    .local v13, "verticalGravity":I
    sparse-switch v13, :sswitch_data_204

    .line 811
    sub-int v17, v5, v8

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v17, v17, v18

    div-int/lit8 v17, v17, 0x2

    add-int v16, v17, v8

    .line 815
    .local v16, "y":I
    :goto_129
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    add-int v17, v17, v15

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    add-int v18, v18, v16

    move/from16 v0, v16

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v12, v15, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 817
    .end local v10    # "horizontalGravity":I
    .end local v13    # "verticalGravity":I
    .end local v15    # "x":I
    .end local v16    # "y":I
    :cond_13e
    return-void

    .line 749
    .end local v5    # "childBottom":I
    .end local v6    # "childLeft":I
    .end local v7    # "childRight":I
    .end local v8    # "childTop":I
    .end local v12    # "v":Landroid/view/View;
    :cond_13f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v17

    goto/16 :goto_1e

    .line 754
    .restart local v4    # "bottom":I
    .restart local v11    # "top":I
    :cond_14b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getWidth()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v19

    sub-int v18, v18, v19

    sub-int v18, v18, v3

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getWidth()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v20

    sub-int v19, v19, v20

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v11, v2, v4}, Lcom/rey/material/drawable/ArrowDrawable;->setBounds(IIII)V

    goto/16 :goto_4d

    .line 760
    .end local v4    # "bottom":I
    .end local v11    # "top":I
    :cond_172
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v6

    goto/16 :goto_8a

    .line 761
    .restart local v6    # "childLeft":I
    :cond_178
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v17

    sub-int v17, v14, v17

    sub-int v7, v17, v3

    goto/16 :goto_98

    .line 769
    .restart local v5    # "childBottom":I
    .restart local v7    # "childRight":I
    .restart local v8    # "childTop":I
    :cond_182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v18

    add-int v18, v18, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v19

    add-int v19, v19, v8

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v6, v8, v1, v2}, Lcom/rey/material/widget/TextView;->layout(IIII)V

    goto/16 :goto_d9

    .line 779
    .restart local v10    # "horizontalGravity":I
    .restart local v12    # "v":Landroid/view/View;
    :cond_1ab
    const/4 v10, 0x3

    goto/16 :goto_103

    .line 780
    :cond_1ae
    const v17, 0x800005

    move/from16 v0, v17

    if-ne v10, v0, :cond_103

    .line 781
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1c0

    const/4 v10, 0x3

    :goto_1be
    goto/16 :goto_103

    :cond_1c0
    const/4 v10, 0x5

    goto :goto_1be

    .line 785
    :pswitch_1c2
    move v15, v6

    .line 786
    .restart local v15    # "x":I
    goto/16 :goto_112

    .line 788
    .end local v15    # "x":I
    :pswitch_1c5
    sub-int v17, v7, v6

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    sub-int v17, v17, v18

    div-int/lit8 v17, v17, 0x2

    add-int v15, v17, v6

    .line 789
    .restart local v15    # "x":I
    goto/16 :goto_112

    .line 791
    .end local v15    # "x":I
    :pswitch_1d3
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    sub-int v15, v7, v17

    .line 792
    .restart local v15    # "x":I
    goto/16 :goto_112

    .line 802
    .restart local v13    # "verticalGravity":I
    :sswitch_1db
    move/from16 v16, v8

    .line 803
    .restart local v16    # "y":I
    goto/16 :goto_129

    .line 805
    .end local v16    # "y":I
    :sswitch_1df
    sub-int v17, v5, v8

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v17, v17, v18

    div-int/lit8 v17, v17, 0x2

    add-int v16, v17, v8

    .line 806
    .restart local v16    # "y":I
    goto/16 :goto_129

    .line 808
    .end local v16    # "y":I
    :sswitch_1ed
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v17

    sub-int v16, v5, v17

    .line 809
    .restart local v16    # "y":I
    goto/16 :goto_129

    .line 783
    nop

    :pswitch_data_1f6
    .packed-switch 0x1
        :pswitch_1c5
        :pswitch_106
        :pswitch_1c2
        :pswitch_106
        :pswitch_1d3
    .end packed-switch

    .line 800
    :sswitch_data_204
    .sparse-switch
        0x10 -> :sswitch_1df
        0x30 -> :sswitch_1db
        0x50 -> :sswitch_1ed
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .registers 25
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 635
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v15

    .line 636
    .local v15, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v16

    .line 637
    .local v16, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 638
    .local v3, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 640
    .local v4, "heightSize":I
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v19

    add-int v18, v18, v19

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getArrowDrawableWidth()I

    move-result v19

    add-int v8, v18, v19

    .line 641
    .local v8, "paddingHorizontal":I
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingTop()I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getPaddingBottom()I

    move-result v19

    add-int v18, v18, v19

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getDividerDrawableHeight()I

    move-result v19

    add-int v9, v18, v19

    .line 643
    .local v9, "paddingVertical":I
    const/4 v7, 0x0

    .line 644
    .local v7, "labelWidth":I
    const/4 v6, 0x0

    .line 645
    .local v6, "labelHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    if-eqz v18, :cond_73

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    if-eqz v18, :cond_73

    .line 646
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    sub-int v19, v16, v8

    move/from16 v0, v19

    invoke-static {v0, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v20

    invoke-virtual/range {v18 .. v20}, Lcom/rey/material/widget/TextView;->measure(II)V

    .line 647
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v7

    .line 648
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v6

    .line 651
    :cond_73
    const/4 v14, 0x0

    .line 652
    .local v14, "width":I
    const/4 v2, 0x0

    .line 654
    .local v2, "height":I
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Spinner;->getSelectedView()Landroid/view/View;

    move-result-object v11

    .line 655
    .local v11, "v":Landroid/view/View;
    if-eqz v11, :cond_ae

    .line 658
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 659
    .local v10, "params":Landroid/view/ViewGroup$LayoutParams;
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_164

    .line 667
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v17

    .line 670
    .local v17, "ws":I
    :goto_90
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_16c

    .line 678
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 682
    .local v5, "hs":I
    :goto_a1
    move/from16 v0, v17

    invoke-virtual {v11, v0, v5}, Landroid/view/View;->measure(II)V

    .line 683
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    .line 684
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    .line 687
    .end local v5    # "hs":I
    .end local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v17    # "ws":I
    :cond_ae
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/Spinner;->mMinWidth:I

    move/from16 v18, v0

    invoke-static {v7, v14}, Ljava/lang/Math;->max(II)I

    move-result v19

    add-int v19, v19, v8

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 688
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/Spinner;->mMinHeight:I

    move/from16 v18, v0

    add-int v19, v2, v6

    add-int v19, v19, v9

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 690
    sparse-switch v15, :sswitch_data_174

    .line 699
    :goto_cf
    sparse-switch v3, :sswitch_data_17e

    .line 708
    :goto_d2
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v2}, Lcom/rey/material/widget/Spinner;->setMeasuredDimension(II)V

    .line 710
    if-eqz v11, :cond_116

    .line 711
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 714
    .restart local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_188

    .line 722
    iget v13, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 725
    .local v13, "viewWidth":I
    :goto_e6
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_190

    .line 733
    iget v12, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 737
    .local v12, "viewHeight":I
    :goto_ef
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    move/from16 v0, v18

    if-ne v0, v13, :cond_ff

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v12, :cond_116

    .line 738
    :cond_ff
    const/high16 v18, 0x40000000    # 2.0f

    move/from16 v0, v18

    invoke-static {v13, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v18

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v0, v19

    invoke-static {v12, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Landroid/view/View;->measure(II)V

    .line 740
    .end local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v12    # "viewHeight":I
    .end local v13    # "viewWidth":I
    :cond_116
    return-void

    .line 661
    .restart local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    :pswitch_117
    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v17

    .line 662
    .restart local v17    # "ws":I
    goto/16 :goto_90

    .line 664
    .end local v17    # "ws":I
    :pswitch_121
    sub-int v18, v16, v8

    move/from16 v0, v18

    invoke-static {v0, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v17

    .line 665
    .restart local v17    # "ws":I
    goto/16 :goto_90

    .line 672
    :pswitch_12b
    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 673
    .restart local v5    # "hs":I
    goto/16 :goto_a1

    .line 675
    .end local v5    # "hs":I
    :pswitch_135
    sub-int v18, v4, v9

    sub-int v18, v18, v6

    move/from16 v0, v18

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 676
    .restart local v5    # "hs":I
    goto/16 :goto_a1

    .line 692
    .end local v5    # "hs":I
    .end local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v17    # "ws":I
    :sswitch_141
    move/from16 v0, v16

    invoke-static {v0, v14}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 693
    goto :goto_cf

    .line 695
    :sswitch_148
    move/from16 v14, v16

    goto :goto_cf

    .line 701
    :sswitch_14b
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 702
    goto :goto_d2

    .line 704
    :sswitch_150
    move v2, v4

    goto :goto_d2

    .line 716
    .restart local v10    # "params":Landroid/view/ViewGroup$LayoutParams;
    :pswitch_152
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    .line 717
    .restart local v13    # "viewWidth":I
    goto :goto_e6

    .line 719
    .end local v13    # "viewWidth":I
    :pswitch_157
    sub-int v13, v14, v8

    .line 720
    .restart local v13    # "viewWidth":I
    goto :goto_e6

    .line 727
    :pswitch_15a
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    .line 728
    .restart local v12    # "viewHeight":I
    goto :goto_ef

    .line 730
    .end local v12    # "viewHeight":I
    :pswitch_15f
    sub-int v18, v2, v6

    sub-int v12, v18, v9

    .line 731
    .restart local v12    # "viewHeight":I
    goto :goto_ef

    .line 659
    :pswitch_data_164
    .packed-switch -0x2
        :pswitch_117
        :pswitch_121
    .end packed-switch

    .line 670
    :pswitch_data_16c
    .packed-switch -0x2
        :pswitch_12b
        :pswitch_135
    .end packed-switch

    .line 690
    :sswitch_data_174
    .sparse-switch
        -0x80000000 -> :sswitch_141
        0x40000000 -> :sswitch_148
    .end sparse-switch

    .line 699
    :sswitch_data_17e
    .sparse-switch
        -0x80000000 -> :sswitch_14b
        0x40000000 -> :sswitch_150
    .end sparse-switch

    .line 714
    :pswitch_data_188
    .packed-switch -0x2
        :pswitch_152
        :pswitch_157
    .end packed-switch

    .line 725
    :pswitch_data_190
    .packed-switch -0x2
        :pswitch_15a
        :pswitch_15f
    .end packed-switch
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1009
    move-object v1, p1

    check-cast v1, Lcom/rey/material/widget/Spinner$SavedState;

    .line 1011
    .local v1, "ss":Lcom/rey/material/widget/Spinner$SavedState;
    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v3

    invoke-super {p0, v3}, Lcom/rey/material/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1013
    iget v3, v1, Lcom/rey/material/widget/Spinner$SavedState;->position:I

    invoke-virtual {p0, v3}, Lcom/rey/material/widget/Spinner;->setSelection(I)V

    .line 1015
    iget-boolean v3, v1, Lcom/rey/material/widget/Spinner$SavedState;->showDropdown:Z

    if-eqz v3, :cond_21

    .line 1016
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 1017
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    if-eqz v2, :cond_21

    .line 1018
    new-instance v0, Lcom/rey/material/widget/Spinner$3;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Spinner$3;-><init>(Lcom/rey/material/widget/Spinner;)V

    .line 1027
    .local v0, "listener":Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    invoke-virtual {v2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1030
    .end local v0    # "listener":Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .end local v2    # "vto":Landroid/view/ViewTreeObserver;
    :cond_21
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 5
    .param p1, "layoutDirection"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 357
    if-ne p1, v0, :cond_21

    .line 358
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    if-eq v1, v0, :cond_20

    .line 359
    iput-boolean v0, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    .line 361
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    if-eqz v1, :cond_1d

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_1d

    .line 362
    iget-object v2, p0, Lcom/rey/material/widget/Spinner;->mLabelView:Lcom/rey/material/widget/TextView;

    iget-boolean v1, p0, Lcom/rey/material/widget/Spinner;->mIsRtl:Z

    if-eqz v1, :cond_23

    const/4 v1, 0x4

    :goto_1a
    invoke-virtual {v2, v1}, Lcom/rey/material/widget/TextView;->setTextDirection(I)V

    .line 364
    :cond_1d
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->requestLayout()V

    .line 366
    :cond_20
    return-void

    .line 357
    .end local v0    # "rtl":Z
    :cond_21
    const/4 v0, 0x0

    goto :goto_3

    .line 362
    .restart local v0    # "rtl":Z
    :cond_23
    const/4 v1, 0x3

    goto :goto_1a
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 1000
    invoke-super {p0}, Lcom/rey/material/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 1001
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/Spinner$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/Spinner$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1002
    .local v0, "ss":Lcom/rey/material/widget/Spinner$SavedState;
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/Spinner$SavedState;->position:I

    .line 1003
    iget-object v2, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    if-eqz v2, :cond_1f

    iget-object v2, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v2}, Lcom/rey/material/widget/Spinner$DropdownPopup;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v2, 0x1

    :goto_1c
    iput-boolean v2, v0, Lcom/rey/material/widget/Spinner$SavedState;->showDropdown:Z

    .line 1004
    return-object v0

    .line 1003
    :cond_1f
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method public performItemClick(Landroid/view/View;IJ)Z
    .registers 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "id"    # J

    .prologue
    .line 838
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mOnItemClickListener:Lcom/rey/material/widget/Spinner$OnItemClickListener;

    if-eqz v0, :cond_15

    .line 843
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mOnItemClickListener:Lcom/rey/material/widget/Spinner$OnItemClickListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/rey/material/widget/Spinner$OnItemClickListener;->onItemClick(Lcom/rey/material/widget/Spinner;Landroid/view/View;IJ)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 844
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/Spinner;->setSelection(I)V

    .line 846
    :cond_13
    const/4 v0, 0x1

    .line 851
    :goto_14
    return v0

    .line 849
    :cond_15
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/Spinner;->setSelection(I)V

    .line 851
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .registers 4
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;

    .prologue
    .line 420
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_b

    .line 421
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/SpinnerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 423
    :cond_b
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mRecycler:Lcom/rey/material/widget/Spinner$RecycleBin;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$RecycleBin;->clear()V

    .line 425
    iput-object p1, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    .line 426
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mDataSetObserver:Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/SpinnerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 427
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onDataChanged()V

    .line 429
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    if-eqz v0, :cond_2b

    .line 430
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    new-instance v1, Lcom/rey/material/widget/Spinner$DropDownAdapter;

    invoke-direct {v1, p1}, Lcom/rey/material/widget/Spinner$DropDownAdapter;-><init>(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 433
    :goto_2a
    return-void

    .line 432
    :cond_2b
    new-instance v0, Lcom/rey/material/widget/Spinner$DropDownAdapter;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/Spinner$DropDownAdapter;-><init>(Landroid/widget/SpinnerAdapter;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner;->mTempAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    goto :goto_2a
.end method

.method public setDropDownHorizontalOffset(I)V
    .registers 3
    .param p1, "pixels"    # I

    .prologue
    .line 498
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setHorizontalOffset(I)V

    .line 499
    return-void
.end method

.method public setDropDownVerticalOffset(I)V
    .registers 3
    .param p1, "pixels"    # I

    .prologue
    .line 476
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setVerticalOffset(I)V

    .line 477
    return-void
.end method

.method public setDropDownWidth(I)V
    .registers 2
    .param p1, "pixels"    # I

    .prologue
    .line 524
    iput p1, p0, Lcom/rey/material/widget/Spinner;->mDropDownWidth:I

    .line 525
    return-void
.end method

.method public setEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 544
    invoke-super {p0, p1}, Lcom/rey/material/widget/FrameLayout;->setEnabled(Z)V

    .line 545
    iget-boolean v2, p0, Lcom/rey/material/widget/Spinner;->mDisableChildrenWhenDisabled:Z

    if-eqz v2, :cond_18

    .line 546
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getChildCount()I

    move-result v0

    .line 547
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v0, :cond_18

    .line 548
    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Spinner;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 547
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 550
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_18
    return-void
.end method

.method public setGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 572
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mGravity:I

    if-eq v0, p1, :cond_11

    .line 573
    and-int/lit8 v0, p1, 0x7

    if-nez v0, :cond_c

    .line 574
    const v0, 0x800003

    or-int/2addr p1, v0

    .line 575
    :cond_c
    iput p1, p0, Lcom/rey/material/widget/Spinner;->mGravity:I

    .line 576
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->requestLayout()V

    .line 578
    :cond_11
    return-void
.end method

.method public setMinimumHeight(I)V
    .registers 2
    .param p1, "minHeight"    # I

    .prologue
    .line 554
    iput p1, p0, Lcom/rey/material/widget/Spinner;->mMinHeight:I

    .line 555
    invoke-super {p0, p1}, Lcom/rey/material/widget/FrameLayout;->setMinimumHeight(I)V

    .line 556
    return-void
.end method

.method public setMinimumWidth(I)V
    .registers 2
    .param p1, "minWidth"    # I

    .prologue
    .line 560
    iput p1, p0, Lcom/rey/material/widget/Spinner;->mMinWidth:I

    .line 561
    invoke-super {p0, p1}, Lcom/rey/material/widget/FrameLayout;->setMinimumWidth(I)V

    .line 562
    return-void
.end method

.method public setOnItemClickListener(Lcom/rey/material/widget/Spinner$OnItemClickListener;)V
    .registers 2
    .param p1, "l"    # Lcom/rey/material/widget/Spinner$OnItemClickListener;

    .prologue
    .line 604
    iput-object p1, p0, Lcom/rey/material/widget/Spinner;->mOnItemClickListener:Lcom/rey/material/widget/Spinner$OnItemClickListener;

    .line 605
    return-void
.end method

.method public setOnItemSelectedListener(Lcom/rey/material/widget/Spinner$OnItemSelectedListener;)V
    .registers 2
    .param p1, "l"    # Lcom/rey/material/widget/Spinner$OnItemSelectedListener;

    .prologue
    .line 612
    iput-object p1, p0, Lcom/rey/material/widget/Spinner;->mOnItemSelectedListener:Lcom/rey/material/widget/Spinner$OnItemSelectedListener;

    .line 613
    return-void
.end method

.method public setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 443
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mPopup:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 444
    return-void
.end method

.method public setPopupBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 454
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 455
    return-void
.end method

.method public setSelection(I)V
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v0, :cond_15

    .line 382
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 384
    :cond_15
    iget v0, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    if-eq v0, p1, :cond_33

    .line 385
    iput p1, p0, Lcom/rey/material/widget/Spinner;->mSelectedPosition:I

    .line 387
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mOnItemSelectedListener:Lcom/rey/material/widget/Spinner$OnItemSelectedListener;

    if-eqz v0, :cond_30

    .line 388
    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mOnItemSelectedListener:Lcom/rey/material/widget/Spinner$OnItemSelectedListener;

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner;->getSelectedView()Landroid/view/View;

    move-result-object v2

    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-nez v1, :cond_34

    const-wide/16 v4, -0x1

    :goto_2b
    move-object v1, p0

    move v3, p1

    invoke-interface/range {v0 .. v5}, Lcom/rey/material/widget/Spinner$OnItemSelectedListener;->onItemSelected(Lcom/rey/material/widget/Spinner;Landroid/view/View;IJ)V

    .line 390
    :cond_30
    invoke-direct {p0}, Lcom/rey/material/widget/Spinner;->onDataInvalidated()V

    .line 392
    :cond_33
    return-void

    .line 388
    :cond_34
    iget-object v1, p0, Lcom/rey/material/widget/Spinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1, p1}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v4

    goto :goto_2b
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 622
    invoke-super {p0, p1}, Lcom/rey/material/widget/FrameLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;

    if-eq v0, p1, :cond_e

    iget-object v0, p0, Lcom/rey/material/widget/Spinner;->mDividerDrawable:Lcom/rey/material/drawable/DividerDrawable;

    if-ne v0, p1, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
