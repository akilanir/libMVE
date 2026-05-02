.class public Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;
.super Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
.source "DrawerAdapter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;-><init>()V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;-><init>()V

    .line 16
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    .line 17
    return-void
.end method
