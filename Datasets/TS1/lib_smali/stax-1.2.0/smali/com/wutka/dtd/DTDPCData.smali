.class public Lcom/wutka/dtd/DTDPCData;
.super Lcom/wutka/dtd/DTDItem;
.source "DTDPCData.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/wutka/dtd/DTDItem;-><init>()V

    .line 14
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-ne p1, p0, :cond_4

    const/4 v0, 0x1

    .line 29
    :goto_3
    return v0

    .line 27
    :cond_4
    instance-of v0, p1, Lcom/wutka/dtd/DTDPCData;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_3

    .line 29
    :cond_a
    invoke-super {p0, p1}, Lcom/wutka/dtd/DTDItem;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
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
    .line 20
    const-string v0, "#PCDATA"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 21
    iget-object v0, p0, Lcom/wutka/dtd/DTDPCData;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    invoke-virtual {v0, p1}, Lcom/wutka/dtd/DTDCardinal;->write(Ljava/io/PrintWriter;)V

    .line 22
    return-void
.end method
