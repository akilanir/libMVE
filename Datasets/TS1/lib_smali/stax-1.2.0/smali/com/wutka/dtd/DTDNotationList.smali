.class public Lcom/wutka/dtd/DTDNotationList;
.super Ljava/lang/Object;
.source "DTDNotationList.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field protected items:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    .line 19
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 3
    .param p1, "item"    # Ljava/lang/String;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 25
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    .line 68
    if-ne p1, p0, :cond_4

    const/4 v1, 0x1

    .line 72
    :goto_3
    return v1

    .line 69
    :cond_4
    instance-of v1, p1, Lcom/wutka/dtd/DTDNotationList;

    if-nez v1, :cond_a

    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 71
    check-cast v0, Lcom/wutka/dtd/DTDNotationList;

    .line 72
    .local v0, "other":Lcom/wutka/dtd/DTDNotationList;
    iget-object v1, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    iget-object v2, v0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public getItem(I)Ljava/lang/String;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getItem()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDNotationList;->getItems()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItems()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 36
    iget-object v1, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 37
    .local v0, "retval":[Ljava/lang/String;
    iget-object v1, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 39
    return-object v0
.end method

.method public getItemsVec()Ljava/util/Vector;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    return-object v0
.end method

.method public remove(Ljava/lang/String;)V
    .registers 3
    .param p1, "item"    # Ljava/lang/String;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 31
    return-void
.end method

.method public setItem(Ljava/lang/String;I)V
    .registers 4
    .param p1, "item"    # Ljava/lang/String;
    .param p2, "i"    # I

    .prologue
    .line 91
    iget-object v0, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    invoke-virtual {v0, p1, p2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 92
    return-void
.end method

.method public setItem([Ljava/lang/String;)V
    .registers 5
    .param p1, "newItems"    # [Ljava/lang/String;

    .prologue
    .line 81
    new-instance v1, Ljava/util/Vector;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    .line 82
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p1

    if-ge v0, v1, :cond_16

    .line 84
    iget-object v1, p0, Lcom/wutka/dtd/DTDNotationList;->items:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 86
    :cond_16
    return-void
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 5
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const-string v2, "NOTATION ( "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 53
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDNotationList;->getItemsVec()Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 55
    .local v0, "e":Ljava/util/Enumeration;
    const/4 v1, 0x1

    .line 57
    .local v1, "isFirst":Z
    :goto_e
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 59
    if-nez v1, :cond_1b

    const-string v2, " | "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 60
    :cond_1b
    const/4 v1, 0x0

    .line 61
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    goto :goto_e

    .line 63
    :cond_24
    const-string v2, ")"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 64
    return-void
.end method
