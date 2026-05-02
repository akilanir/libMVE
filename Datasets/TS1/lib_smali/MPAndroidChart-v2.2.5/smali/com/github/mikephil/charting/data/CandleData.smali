.class public Lcom/github/mikephil/charting/data/CandleData;
.super Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;
.source "CandleData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
        "<",
        "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>()V

    .line 12
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
    .line 15
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)V
    .registers 4
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p2}, Lcom/github/mikephil/charting/data/CandleData;->toList(Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 32
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
            "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 24
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "xVals"    # [Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)V
    .registers 4
    .param p1, "xVals"    # [Ljava/lang/String;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    .prologue
    .line 35
    invoke-static {p2}, Lcom/github/mikephil/charting/data/CandleData;->toList(Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;Ljava/util/List;)V

    .line 36
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
            "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;Ljava/util/List;)V

    .line 28
    return-void
.end method

.method private static toList(Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)Ljava/util/List;
    .registers 2
    .param p0, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v0, "sets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;>;"
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    return-object v0
.end method
