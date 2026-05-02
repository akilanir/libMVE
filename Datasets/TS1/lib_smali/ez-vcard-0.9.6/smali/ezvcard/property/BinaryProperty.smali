.class public abstract Lezvcard/property/BinaryProperty;
.super Lezvcard/property/VCardProperty;
.source "BinaryProperty.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/parameter/MediaTypeParameter;",
        ">",
        "Lezvcard/property/VCardProperty;",
        "Lezvcard/property/HasAltId;"
    }
.end annotation


# instance fields
.field protected contentType:Lezvcard/parameter/MediaTypeParameter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected data:[B

.field protected url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lezvcard/parameter/MediaTypeParameter;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/io/InputStream;Lezvcard/parameter/MediaTypeParameter;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lezvcard/parameter/MediaTypeParameter;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lezvcard/util/IOUtils;->toByteArray(Ljava/io/InputStream;Z)[B

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/property/BinaryProperty;-><init>([BLezvcard/parameter/MediaTypeParameter;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 75
    invoke-virtual {p0, p1, p2}, Lezvcard/property/BinaryProperty;->setUrl(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)V

    .line 76
    return-void
.end method

.method public constructor <init>([BLezvcard/parameter/MediaTypeParameter;)V
    .registers 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BTT;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 84
    invoke-virtual {p0, p1, p2}, Lezvcard/property/BinaryProperty;->setData([BLezvcard/parameter/MediaTypeParameter;)V

    .line 85
    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 7
    .param p2, "version"    # Lezvcard/VCardVersion;
    .param p3, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->url:Ljava/lang/String;

    if-nez v0, :cond_15

    iget-object v0, p0, Lezvcard/property/BinaryProperty;->data:[B

    if-nez v0, :cond_15

    .line 225
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    :cond_15
    return-void
.end method

.method public addPid(II)V
    .registers 3
    .param p1, "localId"    # I
    .param p2, "clientPidMapRef"    # I

    .prologue
    .line 194
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-super {p0, p1, p2}, Lezvcard/property/VCardProperty;->addPid(II)V

    .line 195
    return-void
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 214
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Lezvcard/parameter/MediaTypeParameter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->contentType:Lezvcard/parameter/MediaTypeParameter;

    return-object v0
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 112
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->data:[B

    return-object v0
.end method

.method public getPids()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPids()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPref()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 204
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getPref()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 171
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->url:Ljava/lang/String;

    return-object v0
.end method

.method public removePids()V
    .registers 1

    .prologue
    .line 199
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-super {p0}, Lezvcard/property/VCardProperty;->removePids()V

    .line 200
    return-void
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 219
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method public setContentType(Lezvcard/parameter/MediaTypeParameter;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p1, "contentType":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    iput-object p1, p0, Lezvcard/property/BinaryProperty;->contentType:Lezvcard/parameter/MediaTypeParameter;

    .line 159
    return-void
.end method

.method public setData([BLezvcard/parameter/MediaTypeParameter;)V
    .registers 4
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BTT;)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/BinaryProperty;->url:Ljava/lang/String;

    .line 122
    iput-object p1, p0, Lezvcard/property/BinaryProperty;->data:[B

    .line 123
    invoke-virtual {p0, p2}, Lezvcard/property/BinaryProperty;->setContentType(Lezvcard/parameter/MediaTypeParameter;)V

    .line 124
    return-void
.end method

.method public setPref(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pref"    # Ljava/lang/Integer;

    .prologue
    .line 209
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setPref(Ljava/lang/Integer;)V

    .line 210
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 184
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    iget-object v0, p0, Lezvcard/property/BinaryProperty;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setType(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public setUrl(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lezvcard/property/BinaryProperty;, "Lezvcard/property/BinaryProperty<TT;>;"
    .local p2, "type":Lezvcard/parameter/MediaTypeParameter;, "TT;"
    iput-object p1, p0, Lezvcard/property/BinaryProperty;->url:Ljava/lang/String;

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/BinaryProperty;->data:[B

    .line 142
    invoke-virtual {p0, p2}, Lezvcard/property/BinaryProperty;->setContentType(Lezvcard/parameter/MediaTypeParameter;)V

    .line 143
    return-void
.end method
