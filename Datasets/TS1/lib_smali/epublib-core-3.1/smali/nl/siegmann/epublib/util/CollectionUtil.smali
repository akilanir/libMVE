.class public Lnl/siegmann/epublib/util/CollectionUtil;
.super Ljava/lang/Object;
.source "CollectionUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static createEnumerationFromIterator(Ljava/util/Iterator;)Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator",
            "<TT;>;)",
            "Ljava/util/Enumeration",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    new-instance v0, Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;

    invoke-direct {v0, p0}, Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public static first(Ljava/util/List;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 53
    :cond_8
    const/4 v0, 0x0

    .line 55
    :goto_9
    return-object v0

    :cond_a
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_9
.end method
