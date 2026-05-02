.class public Lcom/wutka/dtd/DTDAttlist;
.super Ljava/lang/Object;
.source "DTDAttlist.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public attributes:Ljava/util/Vector;

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 62
    if-ne p1, p0, :cond_5

    const/4 v1, 0x1

    .line 70
    :cond_4
    :goto_4
    return v1

    .line 63
    :cond_5
    instance-of v2, p1, Lcom/wutka/dtd/DTDAttlist;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 65
    check-cast v0, Lcom/wutka/dtd/DTDAttlist;

    .line 67
    .local v0, "other":Lcom/wutka/dtd/DTDAttlist;
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    if-nez v2, :cond_14

    iget-object v2, v0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 68
    :cond_14
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    if-eqz v2, :cond_22

    iget-object v2, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    iget-object v3, v0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 70
    :cond_22
    iget-object v1, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    iget-object v2, v0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4
.end method

.method public getAttribute(I)Lcom/wutka/dtd/DTDAttribute;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDAttribute;

    return-object v0
.end method

.method public getAttribute()[Lcom/wutka/dtd/DTDAttribute;
    .registers 3

    .prologue
    .line 88
    iget-object v1, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lcom/wutka/dtd/DTDAttribute;

    .line 89
    .local v0, "attrs":[Lcom/wutka/dtd/DTDAttribute;
    iget-object v1, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 91
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setAttribute(Lcom/wutka/dtd/DTDAttribute;I)V
    .registers 4
    .param p1, "attr"    # Lcom/wutka/dtd/DTDAttribute;
    .param p2, "i"    # I

    .prologue
    .line 113
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v0, p1, p2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 114
    return-void
.end method

.method public setAttribute([Lcom/wutka/dtd/DTDAttribute;)V
    .registers 5
    .param p1, "attrs"    # [Lcom/wutka/dtd/DTDAttribute;

    .prologue
    .line 97
    new-instance v1, Ljava/util/Vector;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    .line 98
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p1

    if-ge v0, v1, :cond_16

    .line 100
    iget-object v1, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 98
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 102
    :cond_16
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    .line 83
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
    .line 39
    const-string v2, "<!ATTLIST "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 40
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttlist;->name:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 42
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 44
    .local v1, "itr":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 46
    const-string v2, "           "

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 47
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDAttribute;

    .line 48
    .local v0, "attr":Lcom/wutka/dtd/DTDAttribute;
    invoke-virtual {v0, p1}, Lcom/wutka/dtd/DTDAttribute;->write(Ljava/io/PrintWriter;)V

    .line 49
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 51
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    goto :goto_10

    .line 55
    :cond_2e
    const-string v2, ">"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_10

    .line 58
    .end local v0    # "attr":Lcom/wutka/dtd/DTDAttribute;
    :cond_34
    return-void
.end method
