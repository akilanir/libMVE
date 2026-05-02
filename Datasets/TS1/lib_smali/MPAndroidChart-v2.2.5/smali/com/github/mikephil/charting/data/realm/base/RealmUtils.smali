.class public final Lcom/github/mikephil/charting/data/realm/base/RealmUtils;
.super Ljava/lang/Object;
.source "RealmUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toXVals(Lio/realm/RealmResults;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "xValuesField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<+",
            "Lio/realm/RealmObject;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<+Lio/realm/RealmObject;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .local v3, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lio/realm/RealmResults;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/realm/RealmObject;

    .line 27
    .local v2, "object":Lio/realm/RealmObject;
    new-instance v0, Lio/realm/DynamicRealmObject;

    invoke-direct {v0, v2}, Lio/realm/DynamicRealmObject;-><init>(Lio/realm/RealmObject;)V

    .line 28
    .local v0, "dynamicObject":Lio/realm/DynamicRealmObject;
    invoke-virtual {v0, p1}, Lio/realm/DynamicRealmObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 31
    .end local v0    # "dynamicObject":Lio/realm/DynamicRealmObject;
    .end local v2    # "object":Lio/realm/RealmObject;
    :cond_22
    return-object v3
.end method
