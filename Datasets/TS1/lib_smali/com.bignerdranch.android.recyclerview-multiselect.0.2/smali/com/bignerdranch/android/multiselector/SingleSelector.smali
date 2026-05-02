.class public Lcom/bignerdranch/android/multiselector/SingleSelector;
.super Lcom/bignerdranch/android/multiselector/MultiSelector;
.source "SingleSelector.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/bignerdranch/android/multiselector/MultiSelector;-><init>()V

    return-void
.end method


# virtual methods
.method public setSelected(IJZ)V
    .registers 11
    .param p1, "position"    # I
    .param p2, "id"    # J
    .param p4, "isSelected"    # Z

    .prologue
    .line 10
    if-eqz p4, :cond_27

    .line 11
    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/SingleSelector;->getSelectedPositions()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 12
    .local v0, "selectedPosition":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, p1, :cond_a

    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-super {p0, v2, v3, v4, v5}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelected(IJZ)V

    goto :goto_a

    .line 17
    .end local v0    # "selectedPosition":Ljava/lang/Integer;
    :cond_27
    invoke-super {p0, p1, p2, p3, p4}, Lcom/bignerdranch/android/multiselector/MultiSelector;->setSelected(IJZ)V

    .line 18
    return-void
.end method
