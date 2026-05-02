.class public Lorg/apache/http/message/BasicHeaderIterator;
.super Ljava/lang/Object;
.source "BasicHeaderIterator.java"

# interfaces
.implements Lorg/apache/http/HeaderIterator;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final allHeaders:[Lorg/apache/http/Header;

.field protected currentIndex:I

.field protected headerName:Ljava/lang/String;


# direct methods
.method public constructor <init>([Lorg/apache/http/Header;Ljava/lang/String;)V
    .registers 5
    .param p1, "headers"    # [Lorg/apache/http/Header;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    if-nez p1, :cond_d

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Header array must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_d
    iput-object p1, p0, Lorg/apache/http/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/http/Header;

    .line 82
    iput-object p2, p0, Lorg/apache/http/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    .line 83
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicHeaderIterator;->findNext(I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicHeaderIterator;->currentIndex:I

    .line 84
    return-void
.end method


# virtual methods
.method protected filterHeader(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/http/Header;

    aget-object v1, v1, p1

    invoke-interface {v1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method protected findNext(I)I
    .registers 6
    .param p1, "from"    # I

    .prologue
    const/4 v2, -0x1

    .line 97
    if-ge p1, v2, :cond_4

    .line 106
    :cond_3
    :goto_3
    return v2

    .line 100
    :cond_4
    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/http/Header;

    array-length v3, v3

    add-int/lit8 v1, v3, -0x1

    .line 101
    .local v1, "to":I
    const/4 v0, 0x0

    .line 102
    .local v0, "found":Z
    :goto_a
    if-nez v0, :cond_15

    if-ge p1, v1, :cond_15

    .line 103
    add-int/lit8 p1, p1, 0x1

    .line 104
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicHeaderIterator;->filterHeader(I)Z

    move-result v0

    goto :goto_a

    .line 106
    :cond_15
    if-eqz v0, :cond_3

    move v2, p1

    goto :goto_3
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 126
    iget v0, p0, Lorg/apache/http/message/BasicHeaderIterator;->currentIndex:I

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
    .line 161
    invoke-virtual {p0}, Lorg/apache/http/message/BasicHeaderIterator;->nextHeader()Lorg/apache/http/Header;

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
    .line 140
    iget v0, p0, Lorg/apache/http/message/BasicHeaderIterator;->currentIndex:I

    .line 141
    .local v0, "current":I
    if-gez v0, :cond_c

    .line 142
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Iteration already finished."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_c
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicHeaderIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lorg/apache/http/message/BasicHeaderIterator;->currentIndex:I

    .line 147
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/http/Header;

    aget-object v1, v1, v0

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
    .line 173
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing headers is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
