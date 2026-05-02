.class public Lorg/jsoup/helper/DescendableLinkedList;
.super Ljava/util/LinkedList;
.source "DescendableLinkedList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/helper/DescendableLinkedList$DescendingIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedList",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    .local p0, "this":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<TE;>;"
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 18
    return-void
.end method


# virtual methods
.method public descendingIterator()Ljava/util/Iterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<TE;>;"
    new-instance v0, Lorg/jsoup/helper/DescendableLinkedList$DescendingIterator;

    invoke-virtual {p0}, Lorg/jsoup/helper/DescendableLinkedList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lorg/jsoup/helper/DescendableLinkedList$DescendingIterator;-><init>(Lorg/jsoup/helper/DescendableLinkedList;ILorg/jsoup/helper/DescendableLinkedList$1;)V

    return-object v0
.end method

.method public peekLast()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<TE;>;"
    invoke-virtual {p0}, Lorg/jsoup/helper/DescendableLinkedList;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lorg/jsoup/helper/DescendableLinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public pollLast()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<TE;>;"
    invoke-virtual {p0}, Lorg/jsoup/helper/DescendableLinkedList;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lorg/jsoup/helper/DescendableLinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public push(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/DescendableLinkedList;->addFirst(Ljava/lang/Object;)V

    .line 26
    return-void
.end method
