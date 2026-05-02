.class public Lcom/larvalabs/svgandroid/SVGBuilder;
.super Ljava/lang/Object;
.source "SVGBuilder.java"


# instance fields
.field private closeInputStream:Z

.field private data:Ljava/io/InputStream;

.field private fillColorFilter:Landroid/graphics/ColorFilter;

.field private replaceColor:Ljava/lang/Integer;

.field private searchColor:Ljava/lang/Integer;

.field private strokeColorFilter:Landroid/graphics/ColorFilter;

.field private whiteMode:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->searchColor:Ljava/lang/Integer;

    .line 25
    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->replaceColor:Ljava/lang/Integer;

    .line 26
    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->strokeColorFilter:Landroid/graphics/ColorFilter;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->fillColorFilter:Landroid/graphics/ColorFilter;

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->whiteMode:Z

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->closeInputStream:Z

    return-void
.end method


# virtual methods
.method public build()Lcom/larvalabs/svgandroid/SVG;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/larvalabs/svgandroid/SVGParseException;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    if-nez v3, :cond_c

    .line 140
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "SVG input not specified. Call one of the readFrom...() methods first."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 144
    :cond_c
    :try_start_c
    new-instance v1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;

    invoke-direct {v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;-><init>()V

    .line 145
    .local v1, "handler":Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->searchColor:Ljava/lang/Integer;

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->replaceColor:Ljava/lang/Integer;

    invoke-virtual {v1, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->setColorSwap(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 146
    iget-boolean v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->whiteMode:Z

    invoke-virtual {v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->setWhiteMode(Z)V

    .line 147
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->strokeColorFilter:Landroid/graphics/ColorFilter;

    if-eqz v3, :cond_28

    .line 148
    iget-object v3, v1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->strokeColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 150
    :cond_28
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->fillColorFilter:Landroid/graphics/ColorFilter;

    if-eqz v3, :cond_33

    .line 151
    iget-object v3, v1, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->fillColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 154
    :cond_33
    new-instance v3, Lorg/xml/sax/InputSource;

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    invoke-direct {v3, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-static {v3, v1}, Lcom/larvalabs/svgandroid/SVGParser;->parse(Lorg/xml/sax/InputSource;Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;)Lcom/larvalabs/svgandroid/SVG;
    :try_end_3d
    .catchall {:try_start_c .. :try_end_3d} :catchall_51

    move-result-object v2

    .line 158
    .local v2, "svg":Lcom/larvalabs/svgandroid/SVG;
    iget-boolean v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->closeInputStream:Z

    if-eqz v3, :cond_47

    .line 160
    :try_start_42
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_47} :catch_48

    .line 163
    :cond_47
    :goto_47
    return-object v2

    .line 161
    :catch_48
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "SVGAndroid"

    const-string v4, "Error closing SVG input stream."

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_47

    .line 158
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "handler":Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;
    .end local v2    # "svg":Lcom/larvalabs/svgandroid/SVG;
    :catchall_51
    move-exception v3

    iget-boolean v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->closeInputStream:Z

    if-eqz v4, :cond_5b

    .line 160
    :try_start_56
    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_5b} :catch_5c

    .line 163
    :cond_5b
    :goto_5b
    throw v3

    .line 161
    :catch_5c
    move-exception v0

    .line 162
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v4, "SVGAndroid"

    const-string v5, "Error closing SVG input stream."

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b
.end method

.method public clearColorSwap()Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->replaceColor:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->searchColor:Ljava/lang/Integer;

    .line 76
    return-object p0
.end method

.method public readFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 4
    .param p1, "assetMngr"    # Landroid/content/res/AssetManager;
    .param p2, "svgPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    .line 71
    return-object p0
.end method

.method public readFromInputStream(Ljava/io/InputStream;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "svgData"    # Ljava/io/InputStream;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    .line 38
    return-object p0
.end method

.method public readFromResource(Landroid/content/res/Resources;I)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 4
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "resId"    # I

    .prologue
    .line 58
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    .line 59
    return-object p0
.end method

.method public readFromString(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 4
    .param p1, "svgData"    # Ljava/lang/String;

    .prologue
    .line 47
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->data:Ljava/io/InputStream;

    .line 48
    return-object p0
.end method

.method public setCloseInputStreamWhenDone(Z)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "closeInputStream"    # Z

    .prologue
    .line 128
    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->closeInputStream:Z

    .line 129
    return-object p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->fillColorFilter:Landroid/graphics/ColorFilter;

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->strokeColorFilter:Landroid/graphics/ColorFilter;

    .line 104
    return-object p0
.end method

.method public setColorSwap(II)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 4
    .param p1, "searchColor"    # I
    .param p2, "replaceColor"    # I

    .prologue
    .line 86
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->searchColor:Ljava/lang/Integer;

    .line 87
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->replaceColor:Ljava/lang/Integer;

    .line 88
    return-object p0
.end method

.method public setFillColorFilter(Landroid/graphics/ColorFilter;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->fillColorFilter:Landroid/graphics/ColorFilter;

    .line 120
    return-object p0
.end method

.method public setStrokeColorFilter(Landroid/graphics/ColorFilter;)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->strokeColorFilter:Landroid/graphics/ColorFilter;

    .line 112
    return-object p0
.end method

.method public setWhiteMode(Z)Lcom/larvalabs/svgandroid/SVGBuilder;
    .registers 2
    .param p1, "whiteMode"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGBuilder;->whiteMode:Z

    .line 96
    return-object p0
.end method
