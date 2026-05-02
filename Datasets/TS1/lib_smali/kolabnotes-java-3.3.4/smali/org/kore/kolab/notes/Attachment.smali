.class public Lorg/kore/kolab/notes/Attachment;
.super Ljava/lang/Object;
.source "Attachment.java"


# instance fields
.field private data:[B

.field private final fileName:Ljava/lang/String;

.field private final id:Ljava/lang/String;

.field private final mimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1, p1, p2}, Lorg/kore/kolab/notes/Attachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    .line 32
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/kore/kolab/notes/Attachment;->data:[B

    .line 33
    iput-object p2, p0, Lorg/kore/kolab/notes/Attachment;->fileName:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lorg/kore/kolab/notes/Attachment;->mimeType:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    if-ne p0, p1, :cond_5

    .line 83
    :cond_4
    :goto_4
    return v1

    .line 73
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 74
    goto :goto_4

    .line 76
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 77
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 79
    check-cast v0, Lorg/kore/kolab/notes/Attachment;

    .line 80
    .local v0, "other":Lorg/kore/kolab/notes/Attachment;
    iget-object v3, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    if-nez v3, :cond_22

    iget-object v3, v0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    if-eqz v3, :cond_4

    :goto_20
    move v1, v2

    .line 81
    goto :goto_4

    .line 80
    :cond_22
    iget-object v3, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    iget-object v4, v0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_20
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lorg/kore/kolab/notes/Attachment;->data:[B

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/kore/kolab/notes/Attachment;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lorg/kore/kolab/notes/Attachment;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 63
    const/4 v0, 0x7

    .line 64
    .local v0, "hash":I
    iget-object v1, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    add-int/lit16 v0, v1, 0x11f

    .line 65
    return v0

    .line 64
    :cond_e
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public setData([B)V
    .registers 2
    .param p1, "bytes"    # [B

    .prologue
    .line 50
    iput-object p1, p0, Lorg/kore/kolab/notes/Attachment;->data:[B

    .line 51
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Attachment{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Attachment;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mimeType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Attachment;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", fileName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Attachment;->fileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
