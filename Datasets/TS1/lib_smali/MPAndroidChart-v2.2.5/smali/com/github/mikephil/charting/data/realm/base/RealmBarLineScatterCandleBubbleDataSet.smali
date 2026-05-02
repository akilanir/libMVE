.class public abstract Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;
.source "RealmBarLineScatterCandleBubbleDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        "S:",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet",
        "<TT;TS;>;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet",
        "<TS;>;"
    }
.end annotation


# instance fields
.field protected mHighLightColor:I


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;)V
    .registers 6
    .param p2, "yValuesField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet<TT;TS;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 17
    const/16 v0, 0xff

    const/16 v1, 0xbb

    const/16 v2, 0x73

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;->mHighLightColor:I

    .line 21
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "xIndexField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet<TT;TS;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    const/16 v0, 0xff

    const/16 v1, 0xbb

    const/16 v2, 0x73

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;->mHighLightColor:I

    .line 32
    return-void
.end method


# virtual methods
.method public getHighLightColor()I
    .registers 2

    .prologue
    .line 47
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet<TT;TS;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;->mHighLightColor:I

    return v0
.end method

.method public setHighLightColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 42
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet<TT;TS;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;->mHighLightColor:I

    .line 43
    return-void
.end method
