.class Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
.super Landroid/widget/BaseAdapter;
.source "SimpleSectionedGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$ViewHolder;,
        Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    }
.end annotation


# static fields
.field protected static final TYPE_FILLER:I = 0x0

.field protected static final TYPE_HEADER:I = 0x1

.field protected static final TYPE_HEADER_FILLER:I = 0x2


# instance fields
.field private mBaseAdapter:Landroid/widget/ListAdapter;

.field private mColumnWidth:I

.field private mContext:Landroid/content/Context;

.field private mGridView:Landroid/widget/GridView;

.field private mHeaderLayoutResId:I

.field private mHeaderTextViewResId:I

.field private mHeaderWidth:I

.field private mHorizontalSpacing:I

.field private mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

.field private mLastViewSeen:Landroid/view/View;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mNumColumns:I

.field private mSectionResourceId:I

.field mSections:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;",
            ">;"
        }
    .end annotation
.end field

.field private mStrechMode:I

.field private mValid:Z

.field private mWidth:I

.field private requestedColumnWidth:I

.field private requestedHorizontalSpacing:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/BaseAdapter;III)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "baseAdapter"    # Landroid/widget/BaseAdapter;
    .param p3, "sectionResourceId"    # I
    .param p4, "headerLayoutResId"    # I
    .param p5, "headerTextViewResId"    # I

    .prologue
    .line 61
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mValid:Z

    .line 28
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    .line 29
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iput-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .line 62
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 63
    iput p3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSectionResourceId:I

    .line 64
    iput p4, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderLayoutResId:I

    .line 65
    iput p5, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderTextViewResId:I

    .line 66
    iput-object p2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    .line 67
    iput-object p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mContext:Landroid/content/Context;

    .line 68
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    new-instance v1, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;

    invoke-direct {v1, p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;-><init>(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)V

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 81
    return-void
.end method

.method static synthetic access$002(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 20
    iput-boolean p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mValid:Z

    return p1
.end method

.method static synthetic access$100(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)Landroid/widget/ListAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method private getFillerView(Landroid/view/View;)Lcom/cocosw/bottomsheet/FillerView;
    .registers 4
    .param p1, "lastViewSeen"    # Landroid/view/View;

    .prologue
    .line 322
    new-instance v0, Lcom/cocosw/bottomsheet/FillerView;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/cocosw/bottomsheet/FillerView;-><init>(Landroid/content/Context;)V

    .line 323
    .local v0, "fillerView":Lcom/cocosw/bottomsheet/FillerView;
    invoke-virtual {v0, p1}, Lcom/cocosw/bottomsheet/FillerView;->setMeasureTarget(Landroid/view/View;)V

    .line 324
    return-object v0
.end method

.method private getHeaderSize()I
    .registers 6

    .prologue
    .line 96
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderWidth:I

    if-lez v1, :cond_7

    .line 97
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderWidth:I

    .line 138
    :goto_6
    return v1

    .line 99
    :cond_7
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getWidth()I

    move-result v2

    if-eq v1, v2, :cond_4f

    .line 100
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v1}, Landroid/widget/GridView;->getStretchMode()I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mStrechMode:I

    .line 101
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    check-cast v1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getAvailableWidth()I

    move-result v1

    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getPaddingLeft()I

    move-result v2

    iget-object v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v3}, Landroid/widget/GridView;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    .line 102
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    check-cast v1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getNumColumns()I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    .line 103
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    check-cast v1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getColumnWidth()I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    .line 104
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    check-cast v1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getHorizontalSpacing()I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    .line 107
    :cond_4f
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    iget v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    mul-int/2addr v2, v3

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    mul-int/2addr v2, v3

    sub-int v0, v1, v2

    .line 109
    .local v0, "spaceLeftOver":I
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mStrechMode:I

    packed-switch v1, :pswitch_data_c2

    .line 137
    :goto_65
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mColumnWidth:I

    iget v4, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    add-int/2addr v3, v4

    mul-int/2addr v2, v3

    add-int/2addr v1, v2

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderWidth:I

    .line 138
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderWidth:I

    goto :goto_6

    .line 111
    :pswitch_77
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    .line 112
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mColumnWidth:I

    .line 113
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    goto :goto_65

    .line 117
    :pswitch_85
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    div-int v2, v0, v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mColumnWidth:I

    .line 118
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    goto :goto_65

    .line 122
    :pswitch_93
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mColumnWidth:I

    .line 123
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_a8

    .line 124
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    add-int/lit8 v2, v2, -0x1

    div-int v2, v0, v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    goto :goto_65

    .line 127
    :cond_a8
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    goto :goto_65

    .line 132
    :pswitch_ae
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mColumnWidth:I

    .line 133
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    .line 134
    iget v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    sub-int/2addr v1, v0

    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHorizontalSpacing:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    goto :goto_65

    .line 109
    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_77
        :pswitch_93
        :pswitch_85
        :pswitch_ae
    .end packed-switch
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 269
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 3

    .prologue
    .line 230
    iget-boolean v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mValid:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    add-int/2addr v0, v1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getHeaderLayoutResId()I
    .registers 2

    .prologue
    .line 328
    iget v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderLayoutResId:I

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->sectionedPositionToPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 242
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const v0, 0x7fffffff

    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    sub-int/2addr v0, v1

    int-to-long v0, v0

    :goto_11
    return-wide v0

    :cond_12
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->sectionedPositionToPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    goto :goto_11
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 249
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getViewTypeCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->sectionedPositionToPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v0

    goto :goto_c
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 284
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v2

    if-eqz v2, :cond_9c

    .line 287
    if-nez p2, :cond_25

    .line 288
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSectionResourceId:I

    invoke-virtual {v2, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 294
    :cond_11
    :goto_11
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->type:I

    packed-switch v2, :pswitch_data_aa

    .line 312
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mLastViewSeen:Landroid/view/View;

    invoke-direct {p0, v2}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getFillerView(Landroid/view/View;)Lcom/cocosw/bottomsheet/FillerView;

    move-result-object p2

    .line 318
    :goto_24
    return-object p2

    .line 290
    :cond_25
    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderLayoutResId:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_11

    .line 291
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget v3, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSectionResourceId:I

    invoke-virtual {v2, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    goto :goto_11

    .line 296
    :pswitch_36
    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderLayoutResId:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cocosw/bottomsheet/HeaderLayout;

    .line 297
    .local v0, "header":Lcom/cocosw/bottomsheet/HeaderLayout;
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget-object v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_63

    .line 298
    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderTextViewResId:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 299
    .local v1, "view":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget-object v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    .end local v1    # "view":Landroid/widget/TextView;
    :cond_63
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getHeaderSize()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/cocosw/bottomsheet/HeaderLayout;->setHeaderWidth(I)V

    goto :goto_24

    .line 304
    .end local v0    # "header":Lcom/cocosw/bottomsheet/HeaderLayout;
    :pswitch_6b
    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderLayoutResId:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cocosw/bottomsheet/HeaderLayout;

    .line 305
    .restart local v0    # "header":Lcom/cocosw/bottomsheet/HeaderLayout;
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget-object v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_98

    .line 306
    iget v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mHeaderTextViewResId:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 307
    .restart local v1    # "view":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget-object v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 309
    .end local v1    # "view":Landroid/widget/TextView;
    :cond_98
    invoke-virtual {v0, v4}, Lcom/cocosw/bottomsheet/HeaderLayout;->setHeaderWidth(I)V

    goto :goto_24

    .line 315
    .end local v0    # "header":Lcom/cocosw/bottomsheet/HeaderLayout;
    :cond_9c
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->sectionedPositionToPosition(I)I

    move-result v3

    invoke-interface {v2, v3, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 316
    iput-object p2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mLastViewSeen:Landroid/view/View;

    goto/16 :goto_24

    .line 294
    :pswitch_data_aa
    .packed-switch 0x1
        :pswitch_36
        :pswitch_6b
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 257
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->sectionedPositionToPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v0

    goto :goto_7
.end method

.method public isSectionHeaderPosition(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public positionToSectionedPosition(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 199
    const/4 v1, 0x0

    .line 200
    .local v1, "offset":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_16

    .line 201
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    if-le v2, p1, :cond_19

    .line 206
    :cond_16
    add-int v2, p1, v1

    return v2

    .line 204
    :cond_19
    add-int/lit8 v1, v1, 0x1

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public sectionedPositionToPosition(I)I
    .registers 5
    .param p1, "sectionedPosition"    # I

    .prologue
    .line 210
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->isSectionHeaderPosition(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 211
    const/4 v2, -0x1

    .line 221
    :goto_7
    return v2

    .line 214
    :cond_8
    const/4 v1, 0x0

    .line 215
    .local v1, "offset":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1e

    .line 216
    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget v2, v2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    if-le v2, p1, :cond_21

    .line 221
    :cond_1e
    add-int v2, p1, v1

    goto :goto_7

    .line 219
    :cond_21
    add-int/lit8 v1, v1, -0x1

    .line 215
    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method

.method public setGridView(Landroid/widget/GridView;)V
    .registers 5
    .param p1, "gridView"    # Landroid/widget/GridView;

    .prologue
    .line 84
    instance-of v0, p1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    if-nez v0, :cond_c

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Does your grid view extends PinnedSectionGridView?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_c
    iput-object p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    .line 88
    invoke-virtual {p1}, Landroid/widget/GridView;->getStretchMode()I

    move-result v0

    iput v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mStrechMode:I

    .line 89
    invoke-virtual {p1}, Landroid/widget/GridView;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v1}, Landroid/widget/GridView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mWidth:I

    move-object v0, p1

    .line 90
    check-cast v0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getNumColumns()I

    move-result v0

    iput v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    move-object v0, p1

    .line 91
    check-cast v0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getColumnWidth()I

    move-result v0

    iput v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedColumnWidth:I

    .line 92
    check-cast p1, Lcom/cocosw/bottomsheet/PinnedSectionGridView;

    .end local p1    # "gridView":Landroid/widget/GridView;
    invoke-virtual {p1}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getHorizontalSpacing()I

    move-result v0

    iput v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->requestedHorizontalSpacing:I

    .line 93
    return-void
.end method

.method public setSections()V
    .registers 12

    .prologue
    .line 148
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v9}, Landroid/util/SparseArray;->clear()V

    .line 150
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getHeaderSize()I

    .line 151
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    new-instance v10, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$2;

    invoke-direct {v10, p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$2;-><init>(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)V

    invoke-static {v9, v10}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 160
    const/4 v6, 0x0

    .line 161
    .local v6, "offset":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    array-length v9, v9

    if-ge v1, v9, :cond_9d

    .line 162
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    aget-object v7, v9, v1

    .line 165
    .local v7, "section":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1e
    iget v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    add-int/lit8 v9, v9, -0x1

    if-ge v3, v9, :cond_41

    .line 166
    new-instance v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget v9, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    iget-object v10, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-direct {v8, v9, v10}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;-><init>(ILjava/lang/CharSequence;)V

    .line 167
    .local v8, "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    const/4 v9, 0x2

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->type:I

    .line 168
    iget v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    add-int/2addr v9, v6

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    .line 169
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    iget v10, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    invoke-virtual {v9, v10, v8}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 170
    add-int/lit8 v6, v6, 0x1

    .line 165
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 173
    .end local v8    # "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    :cond_41
    new-instance v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    iget v9, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    iget-object v10, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-direct {v8, v9, v10}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;-><init>(ILjava/lang/CharSequence;)V

    .line 174
    .restart local v8    # "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    const/4 v9, 0x1

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->type:I

    .line 175
    iget v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    add-int/2addr v9, v6

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    .line 176
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    iget v10, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    invoke-virtual {v9, v10, v8}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 177
    add-int/lit8 v6, v6, 0x1

    .line 179
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    array-length v9, v9

    add-int/lit8 v9, v9, -0x1

    if-ge v1, v9, :cond_99

    .line 180
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    add-int/lit8 v10, v1, 0x1

    aget-object v9, v9, v10

    iget v5, v9, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    .line 181
    .local v5, "nextPos":I
    iget v9, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    sub-int v2, v5, v9

    .line 182
    .local v2, "itemsCount":I
    iget v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    iget v10, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    rem-int v10, v2, v10

    sub-int v0, v9, v10

    .line 183
    .local v0, "dummyCount":I
    iget v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mNumColumns:I

    if-eq v9, v0, :cond_99

    .line 184
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_7b
    if-ge v4, v0, :cond_99

    .line 185
    new-instance v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .end local v8    # "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    iget v9, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    iget-object v10, v7, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->title:Ljava/lang/CharSequence;

    invoke-direct {v8, v9, v10}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;-><init>(ILjava/lang/CharSequence;)V

    .line 186
    .restart local v8    # "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    const/4 v9, 0x0

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->type:I

    .line 187
    add-int v9, v5, v6

    iput v9, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    .line 188
    iget-object v9, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    iget v10, v8, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->sectionedPosition:I

    invoke-virtual {v9, v10, v8}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 189
    add-int/lit8 v6, v6, 0x1

    .line 184
    add-int/lit8 v4, v4, 0x1

    goto :goto_7b

    .line 161
    .end local v0    # "dummyCount":I
    .end local v2    # "itemsCount":I
    .end local v4    # "k":I
    .end local v5    # "nextPos":I
    :cond_99
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_14

    .line 195
    .end local v3    # "j":I
    .end local v7    # "section":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    .end local v8    # "sectionAdd":Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    :cond_9d
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetChanged()V

    .line 196
    return-void
.end method

.method public varargs setSections([Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;)V
    .registers 2
    .param p1, "sections"    # [Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .prologue
    .line 143
    iput-object p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mInitialSections:[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .line 144
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->setSections()V

    .line 145
    return-void
.end method
