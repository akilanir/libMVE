.class public Lcom/wutka/dtd/DTDMixed;
.super Lcom/wutka/dtd/DTDContainer;
.source "DTDMixed.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wutka/dtd/DTDContainer;-><init>()V

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    .line 42
    if-ne p1, p0, :cond_4

    const/4 v0, 0x1

    .line 45
    :goto_3
    return v0

    .line 43
    :cond_4
    instance-of v0, p1, Lcom/wutka/dtd/DTDMixed;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_3

    .line 45
    :cond_a
    invoke-super {p0, p1}, Lcom/wutka/dtd/DTDContainer;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 6
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    const-string v3, "("

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 25
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDMixed;->getItemsVec()Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 26
    .local v0, "e":Ljava/util/Enumeration;
    const/4 v1, 0x1

    .line 28
    .local v1, "isFirst":Z
    :goto_e
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 30
    if-nez v1, :cond_1b

    const-string v3, " | "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 31
    :cond_1b
    const/4 v1, 0x0

    .line 33
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/wutka/dtd/DTDItem;

    .line 34
    .local v2, "item":Lcom/wutka/dtd/DTDItem;
    invoke-virtual {v2, p1}, Lcom/wutka/dtd/DTDItem;->write(Ljava/io/PrintWriter;)V

    goto :goto_e

    .line 36
    .end local v2    # "item":Lcom/wutka/dtd/DTDItem;
    :cond_26
    const-string v3, ")"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 37
    iget-object v3, p0, Lcom/wutka/dtd/DTDMixed;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    invoke-virtual {v3, p1}, Lcom/wutka/dtd/DTDCardinal;->write(Ljava/io/PrintWriter;)V

    .line 38
    return-void
.end method
