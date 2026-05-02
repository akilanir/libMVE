.class public Lcom/github/mikephil/charting/buffer/ScatterBuffer;
.super Lcom/github/mikephil/charting/buffer/AbstractBuffer;
.source "ScatterBuffer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/buffer/AbstractBuffer",
        "<",
        "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/buffer/AbstractBuffer;-><init>(I)V

    .line 11
    return-void
.end method


# virtual methods
.method protected addForm(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 14
    iget-object v0, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    iget v1, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->index:I

    aput p1, v0, v1

    .line 15
    iget-object v0, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    iget v1, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->index:I

    aput p2, v0, v1

    .line 16
    return-void
.end method

.method public feed(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V
    .registers 8
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .prologue
    .line 21
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryCount()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->phaseX:F

    mul-float v2, v3, v4

    .line 23
    .local v2, "size":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    int-to-float v3, v1

    cmpg-float v3, v3, v2

    if-gez v3, :cond_25

    .line 25
    invoke-interface {p1, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 26
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->phaseY:F

    mul-float/2addr v4, v5

    invoke-virtual {p0, v3, v4}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->addForm(FF)V

    .line 23
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 29
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_25
    invoke-virtual {p0}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->reset()V

    .line 30
    return-void
.end method

.method public bridge synthetic feed(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 7
    check-cast p1, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V

    return-void
.end method
