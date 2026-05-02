.class public Lcz/msebera/android/httpclient/message/BasicHeaderIterator;
.super Ljava/lang/Object;
.source "BasicHeaderIterator.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HeaderIterator;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final allHeaders:[Lcz/msebera/android/httpclient/Header;

.field protected currentIndex:I

.field protected headerName:Ljava/lang/String;


# direct methods
.method public constructor <init>([Lcz/msebera/android/httpclient/Header;Ljava/lang/String;)V
    .registers 4
    .param p1, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const-string v0, "Header array"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcz/msebera/android/httpclient/Header;

    iput-object v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->allHeaders:[Lcz/msebera/android/httpclient/Header;

    .line 79
    iput-object p2, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    .line 80
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->findNext(I)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->currentIndex:I

    .line 81
    return-void
.end method


# virtual methods
.method protected filterHeader(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    iget-object v1, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->allHeaders:[Lcz/msebera/android/httpclient/Header;

    aget-object v1, v1, p1

    .line 119
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getName()Ljava/lang/String;

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
    .registers 7
    .param p1, "pos"    # I

    .prologue
    const/4 v3, -0x1

    .line 94
    move v1, p1

    .line 95
    .local v1, "from":I
    if-ge v1, v3, :cond_5

    .line 105
    :cond_4
    :goto_4
    return v3

    .line 99
    :cond_5
    iget-object v4, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->allHeaders:[Lcz/msebera/android/httpclient/Header;

    array-length v4, v4

    add-int/lit8 v2, v4, -0x1

    .line 100
    .local v2, "to":I
    const/4 v0, 0x0

    .line 101
    .local v0, "found":Z
    :goto_b
    if-nez v0, :cond_16

    if-ge v1, v2, :cond_16

    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->filterHeader(I)Z

    move-result v0

    goto :goto_b

    .line 105
    :cond_16
    if-eqz v0, :cond_4

    move v3, v1

    goto :goto_4
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 125
    iget v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->currentIndex:I

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
    .line 160
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->nextHeader()Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public nextHeader()Lcz/msebera/android/httpclient/Header;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 139
    iget v0, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->currentIndex:I

    .line 140
    .local v0, "current":I
    if-gez v0, :cond_c

    .line 141
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Iteration already finished."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 144
    :cond_c
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->currentIndex:I

    .line 146
    iget-object v1, p0, Lcz/msebera/android/httpclient/message/BasicHeaderIterator;->allHeaders:[Lcz/msebera/android/httpclient/Header;

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
    .line 172
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing headers is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
