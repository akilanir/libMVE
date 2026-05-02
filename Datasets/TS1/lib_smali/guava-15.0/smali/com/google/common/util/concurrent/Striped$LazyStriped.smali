.class Lcom/google/common/util/concurrent/Striped$LazyStriped;
.super Lcom/google/common/util/concurrent/Striped$PowerOfTwoStriped;
.source "Striped.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/Striped;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyStriped"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/Striped$PowerOfTwoStriped",
        "<T",
        "L;",
        ">;"
    }
.end annotation


# instance fields
.field final locks:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field final size:I

.field final supplier:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier",
            "<T",
            "L;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILcom/google/common/base/Supplier;)V
    .registers 5
    .param p1, "stripes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/common/base/Supplier",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 317
    .local p0, "this":Lcom/google/common/util/concurrent/Striped$LazyStriped;, "Lcom/google/common/util/concurrent/Striped$LazyStriped<TL;>;"
    .local p2, "supplier":Lcom/google/common/base/Supplier;, "Lcom/google/common/base/Supplier<TL;>;"
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Striped$PowerOfTwoStriped;-><init>(I)V

    .line 318
    iget v0, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->mask:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1f

    const v0, 0x7fffffff

    :goto_b
    iput v0, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->size:I

    .line 319
    iput-object p2, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->supplier:Lcom/google/common/base/Supplier;

    .line 320
    new-instance v0, Lcom/google/common/collect/MapMaker;

    invoke-direct {v0}, Lcom/google/common/collect/MapMaker;-><init>()V

    invoke-virtual {v0}, Lcom/google/common/collect/MapMaker;->weakValues()Lcom/google/common/collect/MapMaker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/MapMaker;->makeMap()Ljava/util/concurrent/ConcurrentMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->locks:Ljava/util/concurrent/ConcurrentMap;

    .line 321
    return-void

    .line 318
    :cond_1f
    iget v0, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->mask:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method


# virtual methods
.method public getAt(I)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)T",
            "L;"
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lcom/google/common/util/concurrent/Striped$LazyStriped;, "Lcom/google/common/util/concurrent/Striped$LazyStriped<TL;>;"
    iget v2, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->size:I

    const v3, 0x7fffffff

    if-eq v2, v3, :cond_e

    .line 325
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Striped$LazyStriped;->size()I

    move-result v2

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 327
    :cond_e
    iget-object v2, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->locks:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 328
    .local v1, "existing":Ljava/lang/Object;, "TL;"
    if-eqz v1, :cond_1c

    move-object v2, v1

    .line 333
    :goto_1b
    return-object v2

    .line 331
    :cond_1c
    iget-object v2, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->supplier:Lcom/google/common/base/Supplier;

    invoke-interface {v2}, Lcom/google/common/base/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    .line 332
    .local v0, "created":Ljava/lang/Object;, "TL;"
    iget-object v2, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->locks:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 333
    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1b
.end method

.method public size()I
    .registers 2

    .prologue
    .line 337
    .local p0, "this":Lcom/google/common/util/concurrent/Striped$LazyStriped;, "Lcom/google/common/util/concurrent/Striped$LazyStriped<TL;>;"
    iget v0, p0, Lcom/google/common/util/concurrent/Striped$LazyStriped;->size:I

    return v0
.end method
