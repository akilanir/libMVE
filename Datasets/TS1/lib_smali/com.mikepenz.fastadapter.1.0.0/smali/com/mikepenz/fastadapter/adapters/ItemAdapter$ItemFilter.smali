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
    .line 318
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
    .line 323
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>.ItemFilter;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    if-nez v3, :cond_11

    .line 324
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;
    invoke-static {v4}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    .line 327
    :cond_11
    new-instance v2, Landroid/widget/Filter$FilterResults;

    invoke-direct {v2}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 329
    .local v2, "results":Landroid/widget/Filter$FilterResults;
    if-eqz p1, :cond_1e

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-nez v3, :cond_2b

    .line 331
    :cond_1e
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    iput-object v3, v2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 332
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, v2, Landroid/widget/Filter$FilterResults;->count:I

    .line 350
    :goto_2a
    return-object v2

    .line 334
    :cond_2b
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .local v0, "filteredItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    move-result-object v3

    if-eqz v3, :cond_5a

    .line 338
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->mOriginalItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3e
    :goto_3e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_60

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/fastadapter/IItem;

    .line 339
    .local v1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    invoke-static {v4}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    move-result-object v4

    invoke-interface {v4, v1, p1}, Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;->filter(Lcom/mikepenz/fastadapter/IItem;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3e

    .line 340
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3e

    .line 344
    .end local v1    # "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    :cond_5a
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    # getter for: Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;
    invoke-static {v3}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;

    move-result-object v0

    .line 347
    :cond_60
    iput-object v0, v2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 348
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    iput v3, v2, Landroid/widget/Filter$FilterResults;->count:I

    goto :goto_2a
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 5
    .param p1, "constraint"    # Ljava/lang/CharSequence;
    .param p2, "results"    # Landroid/widget/Filter$FilterResults;

    .prologue
    .line 356
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>.ItemFilter;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->this$0:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)V

    .line 357
    return-void
.end method
