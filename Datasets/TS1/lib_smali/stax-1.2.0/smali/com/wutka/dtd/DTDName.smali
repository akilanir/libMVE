.class public Lcom/wutka/dtd/DTDName;
.super Lcom/wutka/dtd/DTDItem;
.source "DTDName.java"


# instance fields
.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/wutka/dtd/DTDItem;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "aValue"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/wutka/dtd/DTDItem;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 33
    if-ne p1, p0, :cond_5

    .line 47
    :cond_4
    :goto_4
    return v1

    .line 34
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDName;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    .line 35
    :cond_b
    invoke-super {p0, p1}, Lcom/wutka/dtd/DTDItem;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 37
    check-cast v0, Lcom/wutka/dtd/DTDName;

    .line 39
    .local v0, "other":Lcom/wutka/dtd/DTDName;
    iget-object v3, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 41
    iget-object v3, v0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 45
    :cond_20
    iget-object v3, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "aValue"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    iget-object v0, p0, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/wutka/dtd/DTDName;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    invoke-virtual {v0, p1}, Lcom/wutka/dtd/DTDCardinal;->write(Ljava/io/PrintWriter;)V

    .line 29
    return-void
.end method
