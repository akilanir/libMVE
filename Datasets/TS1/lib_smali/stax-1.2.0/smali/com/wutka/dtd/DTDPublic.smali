.class public Lcom/wutka/dtd/DTDPublic;
.super Lcom/wutka/dtd/DTDExternalID;
.source "DTDPublic.java"


# instance fields
.field public pub:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/wutka/dtd/DTDExternalID;-><init>()V

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 36
    if-ne p1, p0, :cond_5

    .line 52
    :cond_4
    :goto_4
    return v1

    .line 37
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDPublic;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    .line 39
    :cond_b
    invoke-super {p0, p1}, Lcom/wutka/dtd/DTDExternalID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 41
    check-cast v0, Lcom/wutka/dtd/DTDPublic;

    .line 43
    .local v0, "other":Lcom/wutka/dtd/DTDPublic;
    iget-object v3, p0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 45
    iget-object v3, v0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 49
    :cond_20
    iget-object v3, p0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getPub()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    return-object v0
.end method

.method public setPub(Ljava/lang/String;)V
    .registers 2
    .param p1, "aPub"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    .line 59
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
    .line 23
    const-string v0, "PUBLIC \""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 24
    iget-object v0, p0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 25
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 26
    iget-object v0, p0, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    if-eqz v0, :cond_22

    .line 28
    const-string v0, " \""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 30
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 32
    :cond_22
    return-void
.end method
