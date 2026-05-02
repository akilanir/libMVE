.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmBarData;
.super Lcom/github/mikephil/charting/data/BarData;
.source "RealmBarData.java"


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p2, "xValuesField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<+",
            "Lio/realm/RealmObject;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<+Lio/realm/RealmObject;>;"
    .local p3, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;>;"
    invoke-static {p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmUtils;->toXVals(Lio/realm/RealmResults;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/github/mikephil/charting/data/BarData;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 19
    return-void
.end method
