.class Lcom/bignerdranch/android/multiselector/WeakHolderTracker;
.super Ljava/lang/Object;
.source "WeakHolderTracker.java"


# instance fields
.field private mHoldersByPosition:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/bignerdranch/android/multiselector/SelectableHolder;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public bindHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;I)V
    .registers 5
    .param p1, "holder"    # Lcom/bignerdranch/android/multiselector/SelectableHolder;
    .param p2, "position"    # I

    .prologue
    .line 36
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    return-void
.end method

.method public getHolder(I)Lcom/bignerdranch/android/multiselector/SelectableHolder;
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 21
    iget-object v3, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 22
    .local v1, "holderRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/bignerdranch/android/multiselector/SelectableHolder;>;"
    if-nez v1, :cond_d

    move-object v0, v2

    .line 32
    :cond_c
    :goto_c
    return-object v0

    .line 26
    :cond_d
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bignerdranch/android/multiselector/SelectableHolder;

    .line 27
    .local v0, "holder":Lcom/bignerdranch/android/multiselector/SelectableHolder;
    if-eqz v0, :cond_1b

    invoke-interface {v0}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getAdapterPosition()I

    move-result v3

    if-eq v3, p1, :cond_c

    .line 28
    :cond_1b
    iget-object v3, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    move-object v0, v2

    .line 29
    goto :goto_c
.end method

.method public getTrackedHolders()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/bignerdranch/android/multiselector/SelectableHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v1, "holders":Ljava/util/List;, "Ljava/util/List<Lcom/bignerdranch/android/multiselector/SelectableHolder;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    iget-object v4, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v2, v4, :cond_20

    .line 43
    iget-object v4, p0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->mHoldersByPosition:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 44
    .local v3, "key":I
    invoke-virtual {p0, v3}, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->getHolder(I)Lcom/bignerdranch/android/multiselector/SelectableHolder;

    move-result-object v0

    .line 46
    .local v0, "holder":Lcom/bignerdranch/android/multiselector/SelectableHolder;
    if-eqz v0, :cond_1d

    .line 47
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 51
    .end local v0    # "holder":Lcom/bignerdranch/android/multiselector/SelectableHolder;
    .end local v3    # "key":I
    :cond_20
    return-object v1
.end method
