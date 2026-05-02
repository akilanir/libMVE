.class public Lcom/drew/metadata/Tag;
.super Ljava/lang/Object;
.source "Tag.java"


# instance fields
.field private final _directory:Lcom/drew/metadata/Directory;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _tagType:I


# direct methods
.method public constructor <init>(ILcom/drew/metadata/Directory;)V
    .registers 3
    .param p1, "tagType"    # I
    .param p2, "directory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lcom/drew/metadata/Tag;->_tagType:I

    .line 41
    iput-object p2, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    .line 42
    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    iget v1, p0, Lcom/drew/metadata/Tag;->_tagType:I

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Directory;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDirectoryName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTagName()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    iget v1, p0, Lcom/drew/metadata/Tag;->_tagType:I

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Directory;->getTagName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTagType()I
    .registers 2

    .prologue
    .line 51
    iget v0, p0, Lcom/drew/metadata/Tag;->_tagType:I

    return v0
.end method

.method public getTagTypeHex()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 63
    const-string v0, "0x%04x"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/drew/metadata/Tag;->_tagType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasTagName()Z
    .registers 3
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    iget v1, p0, Lcom/drew/metadata/Tag;->_tagType:I

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Directory;->hasTagName(I)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/drew/metadata/Tag;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "description":Ljava/lang/String;
    if-nez v0, :cond_23

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {p0}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (unable to formulate description)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    :cond_23
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/drew/metadata/Tag;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v2}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/drew/metadata/Tag;->getTagName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
