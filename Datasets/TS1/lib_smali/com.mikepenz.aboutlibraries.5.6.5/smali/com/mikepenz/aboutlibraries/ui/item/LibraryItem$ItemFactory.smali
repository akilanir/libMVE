.class public Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ItemFactory;
.super Ljava/lang/Object;
.source "LibraryItem.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ItemFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
        "<",
        "Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ItemFactory;->create(Landroid/view/View;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public create(Landroid/view/View;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 287
    new-instance v0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method
