.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmPieData;
.super Lcom/github/mikephil/charting/data/PieData;
.source "RealmPieData.java"


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V
    .registers 5
    .param p2, "xValuesField"    # Ljava/lang/String;
    .param p3, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<+",
            "Lio/realm/RealmObject;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;",
            ")V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<+Lio/realm/RealmObject;>;"
    invoke-static {p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmUtils;->toXVals(Lio/realm/RealmResults;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/github/mikephil/charting/data/PieData;-><init>(Ljava/util/List;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V

    .line 17
    return-void
.end method
