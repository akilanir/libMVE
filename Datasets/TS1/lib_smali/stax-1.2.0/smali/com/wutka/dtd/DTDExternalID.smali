.class public abstract Lcom/wutka/dtd/DTDExternalID;
.super Ljava/lang/Object;
.source "DTDExternalID.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public system:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 24
    if-ne p1, p0, :cond_5

    .line 38
    :cond_4
    :goto_4
    return v1

    .line 25
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDExternalID;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 27
    check-cast v0, Lcom/wutka/dtd/DTDExternalID;

    .line 29
    .local v0, "other":Lcom/wutka/dtd/DTDExternalID;
    iget-object v3, p0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    if-nez v3, :cond_18

    .line 31
    iget-object v3, v0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 35
    :cond_18
    iget-object v3, p0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getSystem()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    return-object v0
.end method

.method public setSystem(Ljava/lang/String;)V
    .registers 2
    .param p1, "aSystem"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public abstract write(Ljava/io/PrintWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
