.class public Lezvcard/io/json/JCardWriter;
.super Lezvcard/io/StreamWriter;
.source "JCardWriter.java"

# interfaces
.implements Ljava/io/Flushable;


# instance fields
.field private final targetVersion:Lezvcard/VCardVersion;

.field private final writer:Lezvcard/io/json/JCardRawWriter;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "wrapInArray"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;Z)V

    .line 113
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 82
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "wrapInArray"    # Z

    .prologue
    .line 92
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;Z)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;Z)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;Z)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "wrapInArray"    # Z

    .prologue
    .line 129
    invoke-direct {p0}, Lezvcard/io/StreamWriter;-><init>()V

    .line 75
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/io/json/JCardWriter;->targetVersion:Lezvcard/VCardVersion;

    .line 130
    new-instance v0, Lezvcard/io/json/JCardRawWriter;

    invoke-direct {v0, p1, p2}, Lezvcard/io/json/JCardRawWriter;-><init>(Ljava/io/Writer;Z)V

    iput-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    .line 131
    return-void
.end method


# virtual methods
.method protected _write(Lezvcard/VCard;Ljava/util/List;)V
    .registers 16
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    .local p2, "properties":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->writeStartVCard()V

    .line 145
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    const-string v10, "version"

    sget-object v11, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    iget-object v12, p0, Lezvcard/io/json/JCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v12}, Lezvcard/VCardVersion;->getVersion()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lezvcard/io/json/JCardValue;->single(Ljava/lang/Object;)Lezvcard/io/json/JCardValue;

    move-result-object v12

    invoke-virtual {v0, v10, v11, v12}, Lezvcard/io/json/JCardRawWriter;->writeProperty(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V

    .line 147
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lezvcard/property/VCardProperty;

    .line 148
    .local v8, "property":Lezvcard/property/VCardProperty;
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, v8}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Lezvcard/property/VCardProperty;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v9

    .line 153
    .local v9, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    :try_start_2e
    invoke-virtual {v9, v8}, Lezvcard/io/scribe/VCardPropertyScribe;->writeJson(Lezvcard/property/VCardProperty;)Lezvcard/io/json/JCardValue;
    :try_end_31
    .catch Lezvcard/io/SkipMeException; {:try_start_2e .. :try_end_31} :catch_50
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_2e .. :try_end_31} :catch_52

    move-result-object v5

    .line 162
    .local v5, "value":Lezvcard/io/json/JCardValue;
    invoke-virtual {v8}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "group":Ljava/lang/String;
    invoke-virtual {v9}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 164
    .local v2, "name":Ljava/lang/String;
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v9, v8, v0, p1}, Lezvcard/io/scribe/VCardPropertyScribe;->prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;Lezvcard/VCard;)Lezvcard/parameter/VCardParameters;

    move-result-object v3

    .line 165
    .local v3, "parameters":Lezvcard/parameter/VCardParameters;
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v9, v8, v0}, Lezvcard/io/scribe/VCardPropertyScribe;->dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v4

    .line 167
    .local v4, "dataType":Lezvcard/VCardDataType;
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual/range {v0 .. v5}, Lezvcard/io/json/JCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Lezvcard/VCardDataType;Lezvcard/io/json/JCardValue;)V

    goto :goto_1c

    .line 154
    .end local v1    # "group":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "parameters":Lezvcard/parameter/VCardParameters;
    .end local v4    # "dataType":Lezvcard/VCardDataType;
    .end local v5    # "value":Lezvcard/io/json/JCardValue;
    :catch_50
    move-exception v6

    .line 156
    .local v6, "e":Lezvcard/io/SkipMeException;
    goto :goto_1c

    .line 157
    .end local v6    # "e":Lezvcard/io/SkipMeException;
    :catch_52
    move-exception v6

    .line 159
    .local v6, "e":Lezvcard/io/EmbeddedVCardException;
    goto :goto_1c

    .line 170
    .end local v6    # "e":Lezvcard/io/EmbeddedVCardException;
    .end local v8    # "property":Lezvcard/property/VCardProperty;
    .end local v9    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    :cond_54
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->writeEndVCard()V

    .line 171
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->close()V

    .line 217
    return-void
.end method

.method public closeJsonStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->closeJsonStream()V

    .line 209
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->flush()V

    .line 201
    return-void
.end method

.method protected getTargetVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->targetVersion:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public isIndent()Z
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawWriter;->isIndent()Z

    move-result v0

    return v0
.end method

.method public setIndent(Z)V
    .registers 3
    .param p1, "indent"    # Z

    .prologue
    .line 192
    iget-object v0, p0, Lezvcard/io/json/JCardWriter;->writer:Lezvcard/io/json/JCardRawWriter;

    invoke-virtual {v0, p1}, Lezvcard/io/json/JCardRawWriter;->setIndent(Z)V

    .line 193
    return-void
.end method
