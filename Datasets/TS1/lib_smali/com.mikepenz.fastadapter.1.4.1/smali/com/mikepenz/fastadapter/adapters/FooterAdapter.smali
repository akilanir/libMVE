.class public Lcom/mikepenz/fastadapter/adapters/FooterAdapter;
.super Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
.source "FooterAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
        "<TItem;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FooterAdapter;, "Lcom/mikepenz/fastadapter/adapters/FooterAdapter<TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getOrder()I
    .registers 2

    .prologue
    .line 16
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FooterAdapter;, "Lcom/mikepenz/fastadapter/adapters/FooterAdapter<TItem;>;"
    const/16 v0, 0x3e8

    return v0
.end method
