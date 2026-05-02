.class Lcom/cocosw/bottomsheet/PinnedSectionGridView;
.super Landroid/widget/GridView;
.source "PinnedSectionGridView.java"


# instance fields
.field private mAvailableWidth:I

.field private mColumnWidth:I

.field private mHorizontalSpacing:I

.field private mNumColumns:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method


# virtual methods
.method public getAvailableWidth()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mAvailableWidth:I

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mAvailableWidth:I

    :goto_6
    return v0

    :cond_7
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->getWidth()I

    move-result v0

    goto :goto_6
.end method

.method public getColumnWidth()I
    .registers 2

    .prologue
    .line 71
    iget v0, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mColumnWidth:I

    return v0
.end method

.method public getHorizontalSpacing()I
    .registers 2

    .prologue
    .line 61
    iget v0, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mHorizontalSpacing:I

    return v0
.end method

.method public getNumColumns()I
    .registers 2

    .prologue
    .line 51
    iget v0, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mNumColumns:I

    return v0
.end method

.method public setColumnWidth(I)V
    .registers 2
    .param p1, "columnWidth"    # I

    .prologue
    .line 76
    iput p1, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mColumnWidth:I

    .line 77
    invoke-super {p0, p1}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 78
    return-void
.end method

.method public setHorizontalSpacing(I)V
    .registers 2
    .param p1, "horizontalSpacing"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mHorizontalSpacing:I

    .line 67
    invoke-super {p0, p1}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    .line 68
    return-void
.end method

.method public setNumColumns(I)V
    .registers 2
    .param p1, "numColumns"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/cocosw/bottomsheet/PinnedSectionGridView;->mNumColumns:I

    .line 57
    invoke-super {p0, p1}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 58
    return-void
.end method
