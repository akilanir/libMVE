.class public Lcom/bignerdranch/android/multiselector/MultiSelector;
.super Ljava/lang/Object;
.source "MultiSelector.java"


# static fields
.field private static final SELECTIONS_STATE:Ljava/lang/String; = "state"

.field private static final SELECTION_POSITIONS:Ljava/lang/String; = "position"


# instance fields
.field private mIsSelectable:Z

.field private mSelections:Landroid/util/SparseBooleanArray;

.field private mTracker:Lcom/bignerdranch/android/multiselector/WeakHolderTracker;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    .line 39
    new-instance v0, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;

    invoke-direct {v0}, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;-><init>()V

    iput-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mTracker:Lcom/bignerdranch/android/multiselector/WeakHolderTracker;

    .line 43
    return-void
.end method

.method private refreshHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;)V
    .registers 5
    .param p1, "holder"    # Lcom/bignerdranch/android/multiselector/SelectableHolder;

    .prologue
    .line 195
    if-nez p1, :cond_3

    .line 202
    :goto_2
    return-void

    .line 198
    :cond_3
    iget-boolean v1, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mIsSelectable:Z

    invoke-interface {p1, v1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->setSelectable(Z)V

    .line 200
    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-interface {p1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getAdapterPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    .line 201
    .local v0, "isActivated":Z
    invoke-interface {p1, v0}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->setActivated(Z)V

    goto :goto_2
.end method

.method private restoreSelections(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 231
    .local p1, "selected":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 239
    :goto_2
    return-void

    .line 233
    :cond_3
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->clear()V

    .line 234
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_22

    .line 235
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 236
    .local v1, "position":I
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 234
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 238
    .end local v1    # "position":I
    :cond_22
    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshAllHolders()V

    goto :goto_2
.end method


# virtual methods
.method public bindHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;IJ)V
    .registers 6
    .param p1, "holder"    # Lcom/bignerdranch/android/multiselector/SelectableHolder;
    .param p2, "position"    # I
    .param p3, "id"    # J

    .prologue
    .line 141
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mTracker:Lcom/bignerdranch/android/multiselector/WeakHolderTracker;

    invoke-virtual {v0, p1, p2}, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->bindHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;I)V

    .line 142
    invoke-direct {p0, p1}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;)V

    .line 143
    return-void
.end method

.method public clearSelections()V
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 109
    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshAllHolders()V

    .line 110
    return-void
.end method

.method public getSelectedPositions()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v1, "positions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_26

    .line 121
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 122
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 126
    :cond_26
    return-object v1
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mIsSelectable:Z

    return v0
.end method

.method public isSelected(IJ)Z
    .registers 5
    .param p1, "position"    # I
    .param p2, "id"    # J

    .prologue
    .line 100
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    return v0
.end method

.method public refreshAllHolders()V
    .registers 4

    .prologue
    .line 189
    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mTracker:Lcom/bignerdranch/android/multiselector/WeakHolderTracker;

    invoke-virtual {v1}, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->getTrackedHolders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bignerdranch/android/multiselector/SelectableHolder;

    .line 190
    .local v0, "holder":Lcom/bignerdranch/android/multiselector/SelectableHolder;
    invoke-direct {p0, v0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;)V

    goto :goto_a

    .line 192
    .end local v0    # "holder":Lcom/bignerdranch/android/multiselector/SelectableHolder;
    :cond_1a
    return-void
.end method

.method public restoreSelectionStates(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    .line 224
    const-string v1, "position"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 225
    .local v0, "selectedPositions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct {p0, v0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->restoreSelections(Ljava/util/List;)V

    .line 226
    const-string v1, "state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mIsSelectable:Z

    .line 228
    return-void
.end method

.method public saveSelectionStates()Landroid/os/Bundle;
    .registers 4

    .prologue
    .line 211
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 212
    .local v0, "information":Landroid/os/Bundle;
    const-string v2, "position"

    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->getSelectedPositions()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 213
    const-string v1, "state"

    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->isSelectable()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 214
    return-object v0
.end method

.method public setSelectable(Z)V
    .registers 2
    .param p1, "isSelectable"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mIsSelectable:Z

    .line 63
    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshAllHolders()V

    .line 64
    return-void
.end method

.method public setSelected(IJZ)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "id"    # J
    .param p4, "isSelected"    # Z

    .prologue
    .line 88
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mSelections:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1, p4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 89
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mTracker:Lcom/bignerdranch/android/multiselector/WeakHolderTracker;

    invoke-virtual {v0, p1}, Lcom/bignerdranch/android/multiselector/WeakHolderTracker;->getHolder(I)Lcom/bignerdranch/android/multiselector/SelectableHolder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bignerdranch/android/multiselector/MultiSelector;->refreshHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;)V

    .line 90
    return-void
.end method

.method public setSelected(Lcom/bignerdranch/android/multiselector/SelectableHolder;Z)V
    .registers 6
    .param p1, "holder"    # Lcom/bignerdranch/android/multiselector/SelectableHolder;
    .param p2, "isSelected"    # Z

    .prologue
    .line 73
    invoke-interface {p1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getItemId()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2, p2}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelected(IJZ)V

    .line 74
    return-void
.end method

.method public tapSelection(IJ)Z
    .registers 8
    .param p1, "position"    # I
    .param p2, "itemId"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 178
    iget-boolean v3, p0, Lcom/bignerdranch/android/multiselector/MultiSelector;->mIsSelectable:Z

    if-eqz v3, :cond_11

    .line 179
    invoke-virtual {p0, p1, p2, p3}, Lcom/bignerdranch/android/multiselector/MultiSelector;->isSelected(IJ)Z

    move-result v0

    .line 180
    .local v0, "isSelected":Z
    if-nez v0, :cond_d

    move v1, v2

    :cond_d
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelected(IJZ)V

    .line 183
    .end local v0    # "isSelected":Z
    :goto_10
    return v2

    :cond_11
    move v2, v1

    goto :goto_10
.end method

.method public tapSelection(Lcom/bignerdranch/android/multiselector/SelectableHolder;)Z
    .registers 5
    .param p1, "holder"    # Lcom/bignerdranch/android/multiselector/SelectableHolder;

    .prologue
    .line 152
    invoke-interface {p1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1}, Lcom/bignerdranch/android/multiselector/SelectableHolder;->getItemId()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/bignerdranch/android/multiselector/MultiSelector;->tapSelection(IJ)Z

    move-result v0

    return v0
.end method
