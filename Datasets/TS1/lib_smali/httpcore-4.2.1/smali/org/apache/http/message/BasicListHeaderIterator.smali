.class public Lorg/apache/http/message/BasicListHeaderIterator;
.super Ljava/lang/Object;
.source "BasicListHeaderIterator.java"

# interfaces
.implements Lorg/apache/http/HeaderIterator;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final allHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation
.end field

.field protected currentIndex:I

.field protected headerName:Ljava/lang/String;

.field protected lastIndex:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 5
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/Header;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    const/4 v1, -0x1

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    if-nez p1, :cond_e

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Header list must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_e
    iput-object p1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    .line 89
    iput-object p2, p0, Lorg/apache/http/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    .line 90
    invoke-virtual {p0, v1}, Lorg/apache/http/message/BasicListHeaderIterator;->findNext(I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    .line 91
    iput v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->lastIndex:I

    .line 92
    return-void
.end method


# virtual methods
.method protected filterHeader(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 127
    iget-object v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    if-nez v1, :cond_6

    .line 128
    const/4 v1, 0x1

    .line 133
    :goto_5
    return v1

    .line 131
    :cond_6
    iget-object v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/Header;

    invoke-interface {v1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_5
.end method

.method protected findNext(I)I
    .registers 6
    .param p1, "from"    # I

    .prologue
    const/4 v2, -0x1

    .line 105
    if-ge p1, v2, :cond_4

    .line 114
    :cond_3
    :goto_3
    return v2

    .line 108
    :cond_4
    iget-object v3, p0, Lorg/apache/http/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 109
    .local v1, "to":I
    const/4 v0, 0x0

    .line 110
    .local v0, "found":Z
    :goto_d
    if-nez v0, :cond_18

    if-ge p1, v1, :cond_18

    .line 111
    add-int/lit8 p1, p1, 0x1

    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicListHeaderIterator;->filterHeader(I)Z

    move-result v0

    goto :goto_d

    .line 114
    :cond_18
    if-eqz v0, :cond_3

    move v2, p1

    goto :goto_3
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 139
    iget v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/apache/http/message/BasicListHeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public nextHeader()Lorg/apache/http/Header;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 153
    iget v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    .line 154
    .local v0, "current":I
    if-gez v0, :cond_c

    .line 155
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Iteration already finished."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 158
    :cond_c
    iput v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->lastIndex:I

    .line 159
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicListHeaderIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    .line 161
    iget-object v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/Header;

    return-object v1
.end method

.method public remove()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 185
    iget v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->lastIndex:I

    if-gez v0, :cond_c

    .line 186
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No header to remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 188
    :cond_c
    iget-object v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    iget v1, p0, Lorg/apache/http/message/BasicListHeaderIterator;->lastIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 189
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->lastIndex:I

    .line 190
    iget v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/http/message/BasicListHeaderIterator;->currentIndex:I

    .line 191
    return-void
.end method
