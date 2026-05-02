.class public abstract Lcom/wutka/dtd/DTDContainer;
.super Lcom/wutka/dtd/DTDItem;
.source "DTDContainer.java"


# instance fields
.field protected items:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/wutka/dtd/DTDItem;-><init>()V

    .line 19
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    .line 20
    return-void
.end method


# virtual methods
.method public add(Lcom/wutka/dtd/DTDItem;)V
    .registers 3
    .param p1, "item"    # Lcom/wutka/dtd/DTDItem;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 50
    if-ne p1, p0, :cond_5

    const/4 v1, 0x1

    .line 57
    :cond_4
    :goto_4
    return v1

    .line 51
    :cond_5
    instance-of v2, p1, Lcom/wutka/dtd/DTDContainer;

    if-eqz v2, :cond_4

    .line 53
    invoke-super {p0, p1}, Lcom/wutka/dtd/DTDItem;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 55
    check-cast v0, Lcom/wutka/dtd/DTDContainer;

    .line 57
    .local v0, "other":Lcom/wutka/dtd/DTDContainer;
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    iget-object v2, v0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4
.end method

.method public getItem(I)Lcom/wutka/dtd/DTDItem;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDItem;

    return-object v0
.end method

.method public getItem()[Lcom/wutka/dtd/DTDItem;
    .registers 3

    .prologue
    .line 73
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lcom/wutka/dtd/DTDItem;

    .line 74
    .local v0, "retval":[Lcom/wutka/dtd/DTDItem;
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 76
    return-object v0
.end method

.method public getItems()[Lcom/wutka/dtd/DTDItem;
    .registers 3

    .prologue
    .line 43
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lcom/wutka/dtd/DTDItem;

    .line 44
    .local v0, "retval":[Lcom/wutka/dtd/DTDItem;
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 45
    return-object v0
.end method

.method public getItemsVec()Ljava/util/Vector;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    return-object v0
.end method

.method public remove(Lcom/wutka/dtd/DTDItem;)V
    .registers 3
    .param p1, "item"    # Lcom/wutka/dtd/DTDItem;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 32
    return-void
.end method

.method public setItem(Lcom/wutka/dtd/DTDItem;I)V
    .registers 4
    .param p1, "anItem"    # Lcom/wutka/dtd/DTDItem;
    .param p2, "i"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1, p2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 83
    return-void
.end method

.method public setItem([Lcom/wutka/dtd/DTDItem;)V
    .registers 5
    .param p1, "newItems"    # [Lcom/wutka/dtd/DTDItem;

    .prologue
    .line 63
    new-instance v1, Ljava/util/Vector;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    .line 64
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p1

    if-ge v0, v1, :cond_16

    .line 66
    iget-object v1, p0, Lcom/wutka/dtd/DTDContainer;->items:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 68
    :cond_16
    return-void
.end method

.method public abstract write(Ljava/io/PrintWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
