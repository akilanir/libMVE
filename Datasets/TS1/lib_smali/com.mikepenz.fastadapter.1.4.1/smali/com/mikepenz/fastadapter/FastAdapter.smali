.class public Lcom/mikepenz/fastadapter/FastAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FastAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;,
        Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field protected static final BUNDLE_EXPANDED:Ljava/lang/String; = "bundle_expanded"

.field protected static final BUNDLE_SELECTIONS:Ljava/lang/String; = "bundle_selections"


# instance fields
.field private final mAdapterSizes:Ljava/util/NavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/NavigableMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/mikepenz/fastadapter/IAdapter",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field private final mAdapters:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/mikepenz/fastadapter/IAdapter",
            "<TItem;>;>;"
        }
    .end annotation
.end field

.field private mAllowDeselection:Z

.field private mExpanded:Landroid/util/SparseIntArray;

.field private mGlobalSize:I

.field private mMultiSelect:Z

.field private mOnBindViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;

.field private mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mOnCreateViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;

.field private mOnLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mOnPreLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mOnTouchListener:Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mOnlyOneExpandedItem:Z

.field private mSelectOnLongClick:Z

.field private mSelectWithItemUpdate:Z

.field private mSelectable:Z

.field private mSelections:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTypeInstances:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/Integer;",
            "TItem;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 34
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    .line 36
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mTypeInstances:Landroid/support/v4/util/ArrayMap;

    .line 38
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    .line 40
    iput v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    .line 45
    iput-boolean v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectWithItemUpdate:Z

    .line 47
    iput-boolean v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mMultiSelect:Z

    .line 49
    iput-boolean v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectOnLongClick:Z

    .line 51
    iput-boolean v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAllowDeselection:Z

    .line 53
    iput-boolean v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectable:Z

    .line 55
    iput-boolean v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnlyOneExpandedItem:Z

    .line 58
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    .line 60
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    .line 70
    new-instance v0, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;

    invoke-direct {v0, p0}, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl;-><init>(Lcom/mikepenz/fastadapter/FastAdapter;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnCreateViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;

    .line 71
    new-instance v0, Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;

    invoke-direct {v0, p0}, Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl;-><init>(Lcom/mikepenz/fastadapter/FastAdapter;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnBindViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;

    .line 77
    invoke-virtual {p0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->setHasStableIds(Z)V

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/fastadapter/FastAdapter;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnlyOneExpandedItem:Z

    return v0
.end method

.method static synthetic access$200(Lcom/mikepenz/fastadapter/FastAdapter;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectOnLongClick:Z

    return v0
.end method

.method static synthetic access$300(Lcom/mikepenz/fastadapter/FastAdapter;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectable:Z

    return v0
.end method

.method static synthetic access$400(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V
    .registers 4
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Lcom/mikepenz/fastadapter/IItem;
    .param p3, "x3"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/mikepenz/fastadapter/FastAdapter;->handleSelection(Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V

    return-void
.end method

.method static synthetic access$500(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnTouchListener:Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;

    return-object v0
.end method

.method private cacheSizes()V
    .registers 7

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v5, 0x0

    .line 669
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-interface {v2}, Ljava/util/NavigableMap;->clear()V

    .line 670
    const/4 v1, 0x0

    .line 673
    .local v1, "size":I
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v2}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v2

    if-lez v2, :cond_1e

    .line 674
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v4, v5}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    :cond_1e
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v2}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_28
    :goto_28
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IAdapter;

    .line 678
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItemCount()I

    move-result v3

    if-lez v3, :cond_28

    .line 679
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItemCount()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_28

    .line 683
    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    :cond_49
    iput v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    .line 684
    return-void
.end method

.method private deselect(ILjava/util/Iterator;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 852
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p2, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    .line 853
    .local v0, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v0, :cond_a

    .line 854
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/mikepenz/fastadapter/IItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 856
    :cond_a
    if-nez p2, :cond_25

    .line 857
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 858
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    .line 863
    :cond_21
    :goto_21
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemChanged(I)V

    .line 864
    return-void

    .line 861
    :cond_25
    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    goto :goto_21
.end method

.method private handleSelection(Landroid/view/View;Lcom/mikepenz/fastadapter/IItem;I)V
    .registers 11
    .param p1, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "TItem;I)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 730
    invoke-interface {p2}, Lcom/mikepenz/fastadapter/IItem;->isSelectable()Z

    move-result v3

    if-nez v3, :cond_9

    .line 775
    :cond_8
    :goto_8
    return-void

    .line 735
    :cond_9
    invoke-interface {p2}, Lcom/mikepenz/fastadapter/IItem;->isSelected()Z

    move-result v3

    if-eqz v3, :cond_13

    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAllowDeselection:Z

    if-eqz v3, :cond_8

    .line 739
    :cond_13
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    .line 740
    .local v2, "selected":Z
    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectWithItemUpdate:Z

    if-nez v3, :cond_23

    if-nez p1, :cond_34

    .line 741
    :cond_23
    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mMultiSelect:Z

    if-nez v3, :cond_2a

    .line 742
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect()V

    .line 744
    :cond_2a
    if-eqz v2, :cond_30

    .line 745
    invoke-virtual {p0, p3}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(I)V

    goto :goto_8

    .line 747
    :cond_30
    invoke-virtual {p0, p3}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    goto :goto_8

    .line 750
    :cond_34
    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mMultiSelect:Z

    if-nez v3, :cond_58

    .line 752
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 753
    .local v0, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :cond_3e
    :goto_3e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58

    .line 755
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 756
    .local v1, "pos":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, p3, :cond_3e

    .line 757
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(ILjava/util/Iterator;)V

    goto :goto_3e

    .line 763
    .end local v0    # "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    .end local v1    # "pos":Ljava/lang/Integer;
    :cond_58
    if-nez v2, :cond_7b

    move v3, v4

    :goto_5b
    invoke-interface {p2, v3}, Lcom/mikepenz/fastadapter/IItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 764
    if-nez v2, :cond_7d

    :goto_60
    invoke-virtual {p1, v4}, Landroid/view/View;->setSelected(Z)V

    .line 767
    if-eqz v2, :cond_7f

    .line 768
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 769
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_7b
    move v3, v5

    .line 763
    goto :goto_5b

    :cond_7d
    move v4, v5

    .line 764
    goto :goto_60

    .line 772
    :cond_7f
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method private internalCollapse(IZ)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "notifyItemChanged"    # Z

    .prologue
    .line 1009
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v1

    .line 1010
    .local v1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v1, :cond_26

    instance-of v2, v1, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v2, :cond_26

    move-object v0, v1

    .line 1011
    check-cast v0, Lcom/mikepenz/fastadapter/IExpandable;

    .line 1013
    .local v0, "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->isExpanded()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_26

    .line 1014
    invoke-direct {p0, v0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->internalCollapse(Lcom/mikepenz/fastadapter/IExpandable;IZ)V

    .line 1017
    .end local v0    # "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    :cond_26
    return-void
.end method

.method private internalCollapse(Lcom/mikepenz/fastadapter/IExpandable;IZ)V
    .registers 8
    .param p1, "expandable"    # Lcom/mikepenz/fastadapter/IExpandable;
    .param p2, "position"    # I
    .param p3, "notifyItemChanged"    # Z

    .prologue
    .line 1020
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;

    move-result-object v0

    .line 1021
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    if-eqz v0, :cond_19

    instance-of v2, v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v2, :cond_19

    .line 1022
    check-cast v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    add-int/lit8 v2, p2, 0x1

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0, v2, v3}, Lcom/mikepenz/fastadapter/IItemAdapter;->removeRange(II)Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 1026
    :cond_19
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Lcom/mikepenz/fastadapter/IExpandable;->withIsExpanded(Z)Ljava/lang/Object;

    .line 1028
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    .line 1029
    .local v1, "indexOfKey":I
    if-ltz v1, :cond_2a

    .line 1030
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->removeAt(I)V

    .line 1033
    :cond_2a
    if-eqz p3, :cond_2f

    .line 1034
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemChanged(I)V

    .line 1036
    :cond_2f
    return-void
.end method


# virtual methods
.method public collapse()V
    .registers 2

    .prologue
    .line 935
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(Z)V

    .line 936
    return-void
.end method

.method public collapse(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 957
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(IZ)V

    .line 958
    return-void
.end method

.method public collapse(IZ)V
    .registers 12
    .param p1, "position"    # I
    .param p2, "notifyItemChanged"    # Z

    .prologue
    .line 967
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v2

    .line 968
    .local v2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v2, :cond_b0

    instance-of v6, v2, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v6, :cond_b0

    move-object v0, v2

    .line 969
    check-cast v0, Lcom/mikepenz/fastadapter/IExpandable;

    .line 973
    .local v0, "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->isExpanded()Z

    move-result v6

    if-eqz v6, :cond_b0

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_b0

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_b0

    .line 975
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    .line 977
    .local v4, "totalAddedItems":I
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    .line 978
    .local v3, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_32
    if-ge v1, v3, :cond_56

    .line 979
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    if-le v6, p1, :cond_53

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    add-int v7, p1, v4

    if-gt v6, v7, :cond_53

    .line 980
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    iget-object v7, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    add-int/2addr v4, v6

    .line 978
    :cond_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    .line 985
    :cond_56
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-interface {v6}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_5c
    :goto_5c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 986
    .local v5, "value":Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-le v7, p1, :cond_5c

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int v8, p1, v4

    if-gt v7, v8, :cond_5c

    .line 987
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(I)V

    goto :goto_5c

    .line 992
    .end local v5    # "value":Ljava/lang/Integer;
    :cond_7e
    add-int/lit8 v1, v3, -0x1

    :goto_80
    if-ltz v1, :cond_ad

    .line 993
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    if-le v6, p1, :cond_aa

    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    add-int v7, p1, v4

    if-gt v6, v7, :cond_aa

    .line 995
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    iget-object v7, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/util/SparseIntArray;->get(I)I

    move-result v6

    sub-int/2addr v4, v6

    .line 998
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v6, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v6

    invoke-direct {p0, v6, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->internalCollapse(IZ)V

    .line 992
    :cond_aa
    add-int/lit8 v1, v1, -0x1

    goto :goto_80

    .line 1003
    :cond_ad
    invoke-direct {p0, v0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->internalCollapse(Lcom/mikepenz/fastadapter/IExpandable;IZ)V

    .line 1006
    .end local v0    # "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    .end local v1    # "i":I
    .end local v3    # "length":I
    .end local v4    # "totalAddedItems":I
    :cond_b0
    return-void
.end method

.method public collapse(Z)V
    .registers 5
    .param p1, "notifyItemChanged"    # Z

    .prologue
    .line 944
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getExpandedItems()[I

    move-result-object v0

    .line 945
    .local v0, "expandedItems":[I
    array-length v2, v0

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_7
    if-ltz v1, :cond_11

    .line 946
    aget v2, v0, v1

    invoke-virtual {p0, v2, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(IZ)V

    .line 945
    add-int/lit8 v1, v1, -0x1

    goto :goto_7

    .line 948
    :cond_11
    return-void
.end method

.method public deleteAllSelectedItems()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 872
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 874
    .local v1, "deletedItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v4

    .line 875
    .local v4, "selections":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :goto_9
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_3c

    .line 876
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 877
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 878
    .local v3, "position":I
    invoke-virtual {p0, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;

    move-result-object v0

    .line 879
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    if-eqz v0, :cond_38

    instance-of v5, v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v5, :cond_38

    .line 880
    invoke-virtual {p0, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 881
    check-cast v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    invoke-interface {v0, v3}, Lcom/mikepenz/fastadapter/IItemAdapter;->remove(I)Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 885
    :goto_33
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v4

    .line 886
    goto :goto_9

    .line 883
    .restart local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    :cond_38
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_33

    .line 887
    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    .end local v3    # "position":I
    :cond_3c
    return-object v1
.end method

.method public deselect()V
    .registers 2

    .prologue
    .line 820
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(Ljava/lang/Iterable;)V

    .line 821
    return-void
.end method

.method public deselect(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 841
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(ILjava/util/Iterator;)V

    .line 842
    return-void
.end method

.method public deselect(Ljava/lang/Iterable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 829
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "positions":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 830
    .local v0, "entries":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 831
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(ILjava/util/Iterator;)V

    goto :goto_4

    .line 833
    :cond_18
    return-void
.end method

.method public expand(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1044
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->expand(IZ)V

    .line 1045
    return-void
.end method

.method public expand(IZ)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "notifyItemChanged"    # Z

    .prologue
    .line 1055
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v2

    .line 1056
    .local v2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v2, :cond_56

    instance-of v3, v2, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v3, :cond_56

    move-object v1, v2

    .line 1057
    check-cast v1, Lcom/mikepenz/fastadapter/IExpandable;

    .line 1060
    .local v1, "expandable":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<*TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v3

    if-gez v3, :cond_56

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_56

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_56

    .line 1061
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;

    move-result-object v0

    .line 1062
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    if-eqz v0, :cond_3a

    instance-of v3, v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v3, :cond_3a

    .line 1063
    check-cast v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    add-int/lit8 v3, p1, 0x1

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lcom/mikepenz/fastadapter/IItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 1067
    :cond_3a
    const/4 v3, 0x1

    invoke-interface {v1, v3}, Lcom/mikepenz/fastadapter/IExpandable;->withIsExpanded(Z)Ljava/lang/Object;

    .line 1070
    if-eqz p2, :cond_43

    .line 1071
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemChanged(I)V

    .line 1075
    :cond_43
    iget-object v4, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_57

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    :goto_53
    invoke-virtual {v4, p1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 1078
    .end local v1    # "expandable":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<*TItem;>;"
    :cond_56
    return-void

    .line 1075
    .restart local v1    # "expandable":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<*TItem;>;"
    :cond_57
    const/4 v3, 0x0

    goto :goto_53
.end method

.method public getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/IAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 522
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    if-ltz p1, :cond_6

    iget v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    if-lt p1, v0, :cond_8

    .line 523
    :cond_6
    const/4 v0, 0x0

    .line 526
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IAdapter;

    goto :goto_7
.end method

.method public getExpanded()Landroid/util/SparseIntArray;
    .registers 2

    .prologue
    .line 903
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method public getExpandedItems()[I
    .registers 5

    .prologue
    .line 910
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    new-array v0, v3, [I

    .line 911
    .local v0, "expandedItems":[I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    .line 912
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v2, :cond_1c

    .line 913
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    aput v3, v0, v1

    .line 912
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 915
    :cond_1c
    return-object v0
.end method

.method public getExpandedItemsCount(II)I
    .registers 8
    .param p1, "from"    # I
    .param p2, "position"    # I

    .prologue
    .line 612
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v2, 0x0

    .line 613
    .local v2, "totalAddedItems":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    .line 614
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_32

    .line 616
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    if-lt v3, p1, :cond_2a

    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    if-ge v3, p2, :cond_2a

    .line 617
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    iget-object v4, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 614
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 618
    :cond_2a
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    if-lt v3, p2, :cond_27

    .line 623
    :cond_32
    return v2
.end method

.method public getItem(I)Lcom/mikepenz/fastadapter/IItem;
    .registers 5
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 485
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    if-ltz p1, :cond_6

    iget v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    if-lt p1, v1, :cond_8

    .line 486
    :cond_6
    const/4 v1, 0x0

    .line 490
    :goto_7
    return-object v1

    .line 489
    :cond_8
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 490
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/mikepenz/fastadapter/IAdapter<TItem;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v1

    goto :goto_7
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 557
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 548
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 537
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v0

    return v0
.end method

.method public getPosition(Lcom/mikepenz/fastadapter/IItem;)I
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    const/4 v5, -0x1

    .line 454
    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-nez v6, :cond_13

    .line 455
    const-string v6, "FastAdapter"

    const-string v7, "You have to define an identifier for your item to retrieve the position via this method"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    :cond_12
    :goto_12
    return v5

    .line 459
    :cond_13
    const/4 v3, 0x0

    .line 460
    .local v3, "position":I
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v6}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v2

    .line 461
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, v2, :cond_12

    .line 462
    iget-object v6, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v6, v1}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IAdapter;

    .line 463
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getOrder()I

    move-result v6

    if-gez v6, :cond_2e

    .line 461
    :goto_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 467
    :cond_2e
    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterPosition(Lcom/mikepenz/fastadapter/IItem;)I

    move-result v4

    .line 468
    .local v4, "relativePosition":I
    if-eq v4, v5, :cond_37

    .line 469
    add-int v5, v3, v4

    goto :goto_12

    .line 471
    :cond_37
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItemCount()I

    move-result v3

    goto :goto_2b
.end method

.method public getPreItemCount(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 596
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    if-nez v0, :cond_6

    .line 597
    const/4 v0, 0x0

    .line 601
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/NavigableMap;->floorKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_5
.end method

.method public getPreItemCountByOrder(I)I
    .registers 6
    .param p1, "order"    # I

    .prologue
    .line 568
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mGlobalSize:I

    if-nez v2, :cond_6

    .line 569
    const/4 v1, 0x0

    .line 584
    :cond_5
    return v1

    .line 572
    :cond_6
    const/4 v1, 0x0

    .line 575
    .local v1, "size":I
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v2}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IAdapter;

    .line 576
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;, "Lcom/mikepenz/fastadapter/IAdapter<TItem;>;"
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getOrder()I

    move-result v3

    if-eq v3, p1, :cond_5

    .line 579
    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItemCount()I

    move-result v3

    add-int/2addr v1, v3

    .line 581
    goto :goto_11
.end method

.method public getRelativeInfo(I)Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 501
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    if-gez p1, :cond_8

    .line 502
    new-instance v1, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    invoke-direct {v1}, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;-><init>()V

    .line 511
    :cond_7
    :goto_7
    return-object v1

    .line 505
    :cond_8
    new-instance v1, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    invoke-direct {v1}, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;-><init>()V

    .line 506
    .local v1, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v2, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapterSizes:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 507
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/mikepenz/fastadapter/IAdapter<TItem;>;>;"
    if-eqz v0, :cond_7

    .line 508
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/fastadapter/IAdapter;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int v3, p1, v3

    invoke-interface {v2, v3}, Lcom/mikepenz/fastadapter/IAdapter;->getAdapterItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    .line 509
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/fastadapter/IAdapter;

    iput-object v2, v1, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    goto :goto_7
.end method

.method public getSelectedItems()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 703
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 704
    .local v0, "items":Ljava/util/Set;, "Ljava/util/Set<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 705
    .local v1, "position":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 707
    .end local v1    # "position":Ljava/lang/Integer;
    :cond_25
    return-object v0
.end method

.method public getSelections()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 696
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    return-object v0
.end method

.method public getTypeInstance(I)Lcom/mikepenz/fastadapter/IItem;
    .registers 4
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 318
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mTypeInstances:Landroid/support/v4/util/ArrayMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IItem;

    return-object v0
.end method

.method public isOnlyOneExpandedItem()Z
    .registers 2

    .prologue
    .line 238
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnlyOneExpandedItem:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 219
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectable:Z

    return v0
.end method

.method public notifyAdapterDataSetChanged()V
    .registers 3

    .prologue
    .line 1090
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-interface {v0}, Ljava/util/SortedSet;->clear()V

    .line 1091
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 1092
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->cacheSizes()V

    .line 1093
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyDataSetChanged()V

    .line 1096
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p0, v0, v1}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->handleStates(Lcom/mikepenz/fastadapter/FastAdapter;II)V

    .line 1097
    return-void
.end method

.method public notifyAdapterItemChanged(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1177
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemChanged(ILjava/lang/Object;)V

    .line 1178
    return-void
.end method

.method public notifyAdapterItemChanged(ILjava/lang/Object;)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "payload"    # Ljava/lang/Object;

    .prologue
    .line 1187
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(IILjava/lang/Object;)V

    .line 1188
    return-void
.end method

.method public notifyAdapterItemInserted(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1105
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 1106
    return-void
.end method

.method public notifyAdapterItemMoved(II)V
    .registers 5
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 1157
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(I)V

    .line 1158
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(I)V

    .line 1160
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 1161
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    .line 1162
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 1168
    :cond_30
    :goto_30
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemMoved(II)V

    .line 1169
    return-void

    .line 1163
    :cond_34
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 1164
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->remove(Ljava/lang/Object;)Z

    .line 1165
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_30
.end method

.method public notifyAdapterItemRangeChanged(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 1197
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(IILjava/lang/Object;)V

    .line 1198
    return-void
.end method

.method public notifyAdapterItemRangeChanged(IILjava/lang/Object;)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "itemCount"    # I
    .param p3, "payload"    # Ljava/lang/Object;

    .prologue
    .line 1208
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    move v0, p1

    .local v0, "i":I
    :goto_1
    add-int v1, p1, p2

    if-ge v0, v1, :cond_13

    .line 1209
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_10

    .line 1210
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(I)V

    .line 1208
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1214
    :cond_13
    if-nez p3, :cond_20

    .line 1215
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemRangeChanged(II)V

    .line 1221
    :goto_18
    add-int v1, p1, p2

    add-int/lit8 v1, v1, -0x1

    invoke-static {p0, p1, v1}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->handleStates(Lcom/mikepenz/fastadapter/FastAdapter;II)V

    .line 1222
    return-void

    .line 1217
    :cond_20
    invoke-virtual {p0, p1, p2, p3}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    goto :goto_18
.end method

.method public notifyAdapterItemRangeInserted(II)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const v1, 0x7fffffff

    .line 1116
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {v0, p1, v1, p2}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->adjustPosition(Ljava/util/Set;III)Ljava/util/SortedSet;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    .line 1117
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-static {v0, p1, v1, p2}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->adjustPosition(Landroid/util/SparseIntArray;III)Landroid/util/SparseIntArray;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    .line 1118
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->cacheSizes()V

    .line 1120
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemRangeInserted(II)V

    .line 1123
    add-int v0, p1, p2

    add-int/lit8 v0, v0, -0x1

    invoke-static {p0, p1, v0}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->handleStates(Lcom/mikepenz/fastadapter/FastAdapter;II)V

    .line 1124
    return-void
.end method

.method public notifyAdapterItemRangeRemoved(II)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const v2, 0x7fffffff

    .line 1143
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    mul-int/lit8 v1, p2, -0x1

    invoke-static {v0, p1, v2, v1}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->adjustPosition(Ljava/util/Set;III)Ljava/util/SortedSet;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    .line 1144
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    mul-int/lit8 v1, p2, -0x1

    invoke-static {v0, p1, v2, v1}, Lcom/mikepenz/fastadapter/utils/AdapterUtil;->adjustPosition(Landroid/util/SparseIntArray;III)Landroid/util/SparseIntArray;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    .line 1145
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->cacheSizes()V

    .line 1146
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemRangeRemoved(II)V

    .line 1147
    return-void
.end method

.method public notifyAdapterItemRemoved(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1132
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    .line 1133
    return-void
.end method

.method public notifyAdapterSubItemsChanged(I)V
    .registers 9
    .param p1, "position"    # I

    .prologue
    .line 1231
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v2

    .line 1232
    .local v2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v2, :cond_46

    instance-of v5, v2, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v5, :cond_46

    move-object v1, v2

    .line 1233
    check-cast v1, Lcom/mikepenz/fastadapter/IExpandable;

    .line 1238
    .local v1, "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    .line 1241
    .local v3, "itemsCount":I
    iget-object v5, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v5

    const/4 v6, -0x1

    if-le v5, v6, :cond_46

    .line 1242
    iget-object v5, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v4

    .line 1243
    .local v4, "previousCount":I
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;

    move-result-object v0

    .line 1244
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    if-eqz v0, :cond_41

    instance-of v5, v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v5, :cond_41

    move-object v5, v0

    .line 1245
    check-cast v5, Lcom/mikepenz/fastadapter/IItemAdapter;

    add-int/lit8 v6, p1, 0x1

    invoke-interface {v5, v6, v4}, Lcom/mikepenz/fastadapter/IItemAdapter;->removeRange(II)Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 1246
    check-cast v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IAdapter;
    add-int/lit8 v5, p1, 0x1

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Lcom/mikepenz/fastadapter/IItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 1248
    :cond_41
    iget-object v5, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v5, p1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 1251
    .end local v1    # "expandable":Lcom/mikepenz/fastadapter/IExpandable;
    .end local v3    # "itemsCount":I
    .end local v4    # "previousCount":I
    :cond_46
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 444
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnBindViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;

    invoke-interface {v0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 445
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 330
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnCreateViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;

    invoke-interface {v1, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;->onPreCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 333
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Lcom/mikepenz/fastadapter/FastAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter$1;-><init>(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 389
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Lcom/mikepenz/fastadapter/FastAdapter$2;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter$2;-><init>(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 419
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Lcom/mikepenz/fastadapter/FastAdapter$3;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/fastadapter/FastAdapter$3;-><init>(Lcom/mikepenz/fastadapter/FastAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 433
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnCreateViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;

    invoke-interface {v1, v0}, Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;->onPostCreateViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    return-object v1
.end method

.method public registerAdapter(Lcom/mikepenz/fastadapter/AbstractAdapter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Lcom/mikepenz/fastadapter/AbstractAdapter",
            "<TItem;>;>(TA;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "adapter":Lcom/mikepenz/fastadapter/AbstractAdapter;, "TA;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {p1}, Lcom/mikepenz/fastadapter/AbstractAdapter;->getOrder()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 295
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAdapters:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {p1}, Lcom/mikepenz/fastadapter/AbstractAdapter;->getOrder()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->cacheSizes()V

    .line 298
    :cond_20
    return-void
.end method

.method public registerTypeInstance(Lcom/mikepenz/fastadapter/IItem;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mTypeInstances:Landroid/support/v4/util/ArrayMap;

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 307
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mTypeInstances:Landroid/support/v4/util/ArrayMap;

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    :cond_1d
    return-void
.end method

.method public saveInstanceState(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 636
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->saveInstanceState(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public saveInstanceState(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 649
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    if-eqz p1, :cond_56

    .line 651
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->size()I

    move-result v3

    new-array v2, v3, [I

    .line 652
    .local v2, "selections":[I
    const/4 v0, 0x0

    .line 653
    .local v0, "index":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 654
    .local v1, "selection":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput v4, v2, v0

    .line 655
    add-int/lit8 v0, v0, 0x1

    .line 656
    goto :goto_11

    .line 657
    .end local v1    # "selection":Ljava/lang/Integer;
    :cond_26
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bundle_selections"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 660
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bundle_expanded"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->getExpandedItems()[I

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 662
    .end local v0    # "index":I
    .end local v2    # "selections":[I
    :cond_56
    return-object p1
.end method

.method public select(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 794
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->select(IZ)V

    .line 795
    return-void
.end method

.method public select(IZ)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "fireEvent"    # Z

    .prologue
    .line 804
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    .line 805
    .local v0, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    if-eqz v0, :cond_13

    .line 806
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/mikepenz/fastadapter/IItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 807
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 809
    :cond_13
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyItemChanged(I)V

    .line 811
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    if-eqz v1, :cond_26

    if-eqz p2, :cond_26

    .line 812
    iget-object v1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    const/4 v2, 0x0

    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getAdapter(I)Lcom/mikepenz/fastadapter/IAdapter;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z

    .line 814
    :cond_26
    return-void
.end method

.method public select(Ljava/lang/Iterable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 783
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "positions":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 784
    .local v0, "position":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    goto :goto_4

    .line 786
    .end local v0    # "position":Ljava/lang/Integer;
    :cond_18
    return-void
.end method

.method public toggleExpandable(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 924
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mExpanded:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v0

    if-ltz v0, :cond_c

    .line 925
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(I)V

    .line 929
    :goto_b
    return-void

    .line 927
    :cond_c
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->expand(I)V

    goto :goto_b
.end method

.method public toggleSelection(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 716
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelections:Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/SortedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 717
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect(I)V

    .line 721
    :goto_f
    return-void

    .line 719
    :cond_10
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    goto :goto_f
.end method

.method public withAllowDeselection(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "allowDeselection"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mAllowDeselection:Z

    .line 201
    return-object p0
.end method

.method public withMultiSelect(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "multiSelect"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mMultiSelect:Z

    .line 179
    return-object p0
.end method

.method public withOnBindViewHolderListener(Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "onBindViewHolderListener"    # Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;",
            ")",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnBindViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener;

    .line 154
    return-object p0
.end method

.method public withOnClickListener(Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "onClickListener":Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;, "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    .line 88
    return-object p0
.end method

.method public withOnCreateViewHolderListener(Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "onCreateViewHolderListener"    # Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;",
            ")",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnCreateViewHolderListener:Lcom/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener;

    .line 143
    return-object p0
.end method

.method public withOnLongClickListener(Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "onLongClickListener":Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;, "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;

    .line 110
    return-object p0
.end method

.method public withOnPreClickListener(Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "onPreClickListener":Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;, "Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;

    .line 99
    return-object p0
.end method

.method public withOnPreLongClickListener(Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "onPreLongClickListener":Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;, "Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnPreLongClickListener:Lcom/mikepenz/fastadapter/FastAdapter$OnLongClickListener;

    .line 121
    return-object p0
.end method

.method public withOnTouchListener(Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    .local p1, "onTouchListener":Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;, "Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnTouchListener:Lcom/mikepenz/fastadapter/FastAdapter$OnTouchListener;

    .line 132
    return-object p0
.end method

.method public withOnlyOneExpandedItem(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "mOnlyOneExpandedItem"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 230
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mOnlyOneExpandedItem:Z

    .line 231
    return-object p0
.end method

.method public withSavedInstanceState(Landroid/os/Bundle;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->withSavedInstanceState(Landroid/os/Bundle;Ljava/lang/String;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    return-object v0
.end method

.method public withSavedInstanceState(Landroid/os/Bundle;Ljava/lang/String;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/lang/String;",
            ")",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    const/4 v4, 0x0

    .line 265
    if-eqz p1, :cond_5f

    .line 267
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect()V

    .line 270
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bundle_expanded"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    .line 271
    .local v1, "expandedItems":[I
    if-eqz v1, :cond_33

    .line 272
    array-length v6, v1

    move v5, v4

    :goto_21
    if-ge v5, v6, :cond_33

    aget v7, v1, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 273
    .local v0, "expandedItem":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/mikepenz/fastadapter/FastAdapter;->expand(I)V

    .line 272
    add-int/lit8 v5, v5, 0x1

    goto :goto_21

    .line 278
    .end local v0    # "expandedItem":Ljava/lang/Integer;
    :cond_33
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bundle_selections"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v3

    .line 279
    .local v3, "selections":[I
    if-eqz v3, :cond_5f

    .line 280
    array-length v5, v3

    :goto_4d
    if-ge v4, v5, :cond_5f

    aget v6, v3, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 281
    .local v2, "selection":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    .line 280
    add-int/lit8 v4, v4, 0x1

    goto :goto_4d

    .line 285
    .end local v1    # "expandedItems":[I
    .end local v2    # "selection":Ljava/lang/Integer;
    .end local v3    # "selections":[I
    :cond_5f
    return-object p0
.end method

.method public withSelectOnLongClick(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "selectOnLongClick"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectOnLongClick:Z

    .line 190
    return-object p0
.end method

.method public withSelectWithItemUpdate(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "selectWithItemUpdate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectWithItemUpdate:Z

    .line 168
    return-object p0
.end method

.method public withSelectable(Z)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p1, "selectable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/FastAdapter;->mSelectable:Z

    .line 212
    return-object p0
.end method
