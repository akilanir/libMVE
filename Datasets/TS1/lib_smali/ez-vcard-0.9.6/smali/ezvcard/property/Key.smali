.class public Lezvcard/property/Key;
.super Lezvcard/property/BinaryProperty;
.source "Key.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/property/BinaryProperty",
        "<",
        "Lezvcard/parameter/KeyType;",
        ">;"
    }
.end annotation


# instance fields
.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 113
    invoke-direct {p0}, Lezvcard/property/BinaryProperty;-><init>()V

    .line 114
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lezvcard/parameter/KeyType;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .param p2, "type"    # Lezvcard/parameter/KeyType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/io/File;Lezvcard/parameter/MediaTypeParameter;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lezvcard/parameter/KeyType;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "type"    # Lezvcard/parameter/KeyType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/io/InputStream;Lezvcard/parameter/MediaTypeParameter;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lezvcard/parameter/KeyType;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "type"    # Lezvcard/parameter/KeyType;

    .prologue
    .line 131
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)V

    .line 132
    return-void
.end method

.method public constructor <init>([BLezvcard/parameter/KeyType;)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "type"    # Lezvcard/parameter/KeyType;

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>([BLezvcard/parameter/MediaTypeParameter;)V

    .line 123
    return-void
.end method


# virtual methods
.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 8
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
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    const/4 v3, 0x0

    .line 176
    iget-object v0, p0, Lezvcard/property/Key;->url:Ljava/lang/String;

    if-nez v0, :cond_19

    iget-object v0, p0, Lezvcard/property/Key;->data:[B

    if-nez v0, :cond_19

    iget-object v0, p0, Lezvcard/property/Key;->text:Ljava/lang/String;

    if-nez v0, :cond_19

    .line 177
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    :cond_19
    iget-object v0, p0, Lezvcard/property/Key;->url:Ljava/lang/String;

    if-eqz v0, :cond_31

    sget-object v0, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-eq p2, v0, :cond_25

    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne p2, v0, :cond_31

    .line 181
    :cond_25
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0xf

    new-array v2, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    :cond_31
    return-void
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lezvcard/property/Key;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setText(Ljava/lang/String;Lezvcard/parameter/KeyType;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "type"    # Lezvcard/parameter/KeyType;

    .prologue
    const/4 v0, 0x0

    .line 160
    iput-object p1, p0, Lezvcard/property/Key;->text:Ljava/lang/String;

    .line 161
    iput-object v0, p0, Lezvcard/property/Key;->data:[B

    .line 162
    iput-object v0, p0, Lezvcard/property/Key;->url:Ljava/lang/String;

    .line 163
    invoke-virtual {p0, p2}, Lezvcard/property/Key;->setContentType(Lezvcard/parameter/MediaTypeParameter;)V

    .line 164
    return-void
.end method
