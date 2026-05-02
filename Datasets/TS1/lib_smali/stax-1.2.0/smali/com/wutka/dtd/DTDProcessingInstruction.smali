.class public Lcom/wutka/dtd/DTDProcessingInstruction;
.super Ljava/lang/Object;
.source "DTDProcessingInstruction.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "theText"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 39
    if-ne p1, p0, :cond_5

    .line 53
    :cond_4
    :goto_4
    return v1

    .line 40
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDProcessingInstruction;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 42
    check-cast v0, Lcom/wutka/dtd/DTDProcessingInstruction;

    .line 44
    .local v0, "other":Lcom/wutka/dtd/DTDProcessingInstruction;
    iget-object v3, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    if-nez v3, :cond_18

    .line 46
    iget-object v3, v0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 50
    :cond_18
    iget-object v3, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setText(Ljava/lang/String;)V
    .registers 2
    .param p1, "theText"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    return-object v0
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
    .line 32
    const-string v0, "<?"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/wutka/dtd/DTDProcessingInstruction;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 34
    const-string v0, "?>"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 35
    return-void
.end method
