.class public Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
.super Landroid/widget/Filter;
.source "ItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ItemFilter"
.end annotation


# instance fields
.field private mOriginalItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .prologue
    .line 429
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>.ItemFilter;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 7
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 435
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>.ItemFilter;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect()V

    .line 436
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(Z)V

    .line 438
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    if-nez v3, :cond_24

    .line 439
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;
    invoke-static {v4}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    .line 442
    :cond_24
    new-instance v2, Landroid/widget/Filter$FilterResults;

    invoke-direct {v2}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 444
    .local v2, "results":Landroid/widget/Filter$FilterResults;
    if-eqz p1, :cond_31

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-nez v3, :cond_3e

    .line 446
    :cond_31
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    iput-object v3, v2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 447
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, v2, Landroid/widget/Filter$FilterResults;->count:I

    .line 465
    :goto_3d
    return-object v2

    .line 449
    :cond_3e
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 452
    .local v0, "filteredItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    move-result-object v3

    if-eqz v3, :cond_6d

    .line 453
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_51
    :goto_51
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_73

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/fastadapter/IItem;

    .line 454
    .local v1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    invoke-static {v4}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    move-result-object v4

    invoke-interface {v4, v1, p1}, Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;->filter(Lcom/mikepenz/fastadapter/IItem;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_51

    .line 455
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 459
    .end local v1    # "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    :cond_6d
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;

    move-result-object v0

    .line 462
    :cond_73
    iput-object v0, v2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 463
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    iput v3, v2, Landroid/widget/Filter$FilterResults;->count:I

    goto :goto_3d
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 5
    .param p1, "constraint"    # Ljava/lang/CharSequence;
    .param p2, "results"    # Landroid/widget/Filter$FilterResults;

    .prologue
    .line 471
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>.ItemFilter;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 473
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    iget-object v0, v0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilterListener:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;

    if-eqz v0, :cond_16

    .line 474
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    iget-object v0, v0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilterListener:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;->itemsFiltered()V

    .line 476
    :cond_16
    return-void
.end method
