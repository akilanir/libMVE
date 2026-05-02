.class public abstract Lcom/wutka/dtd/DTDItem;
.super Ljava/lang/Object;
.source "DTDItem.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public cardinal:Lcom/wutka/dtd/DTDCardinal;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    sget-object v0, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    iput-object v0, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/wutka/dtd/DTDCardinal;)V
    .registers 2
    .param p1, "aCardinal"    # Lcom/wutka/dtd/DTDCardinal;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 23
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 31
    if-ne p1, p0, :cond_5

    .line 45
    :cond_4
    :goto_4
    return v1

    .line 32
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDItem;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 34
    check-cast v0, Lcom/wutka/dtd/DTDItem;

    .line 36
    .local v0, "other":Lcom/wutka/dtd/DTDItem;
    iget-object v3, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    if-nez v3, :cond_18

    .line 38
    iget-object v3, v0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 42
    :cond_18
    iget-object v3, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    iget-object v4, v0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    invoke-virtual {v3, v4}, Lcom/wutka/dtd/DTDCardinal;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getCardinal()Lcom/wutka/dtd/DTDCardinal;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    return-object v0
.end method

.method public setCardinal(Lcom/wutka/dtd/DTDCardinal;)V
    .registers 2
    .param p1, "aCardinal"    # Lcom/wutka/dtd/DTDCardinal;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 52
    return-void
.end method

.method public abstract write(Ljava/io/PrintWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
