.class public Lcom/github/mikephil/charting/data/ScatterData;
.super Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;
.source "ScatterData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
        "<",
        "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>()V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V
    .registers 4
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p2}, Lcom/github/mikephil/charting/data/ScatterData;->toList(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 25
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "xVals"    # [Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;)V

    .line 21
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V
    .registers 4
    .param p1, "xVals"    # [Ljava/lang/String;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .prologue
    .line 36
    invoke-static {p2}, Lcom/github/mikephil/charting/data/ScatterData;->toList(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;Ljava/util/List;)V

    .line 37
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Ljava/util/List;)V
    .registers 3
    .param p1, "xVals"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;Ljava/util/List;)V

    .line 29
    return-void
.end method

.method private static toList(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)Ljava/util/List;
    .registers 2
    .param p0, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v0, "sets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;>;"
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    return-object v0
.end method


# virtual methods
.method public getGreatestShapeSize()F
    .registers 6

    .prologue
    .line 52
    const/4 v1, 0x0

    .line 54
    .local v1, "max":F
    iget-object v4, p0, Lcom/github/mikephil/charting/data/ScatterData;->mDataSets:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .line 55
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeSize()F

    move-result v3

    .line 57
    .local v3, "size":F
    cmpl-float v4, v3, v1

    if-lez v4, :cond_7

    .line 58
    move v1, v3

    goto :goto_7

    .line 61
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .end local v3    # "size":F
    :cond_1d
    return v1
.end method
