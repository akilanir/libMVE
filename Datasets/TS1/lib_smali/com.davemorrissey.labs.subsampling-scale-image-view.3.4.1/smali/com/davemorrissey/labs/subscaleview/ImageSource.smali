.class public final Lcom/davemorrissey/labs/subscaleview/ImageSource;
.super Ljava/lang/Object;
.source "ImageSource.java"


# static fields
.field static final ASSET_SCHEME:Ljava/lang/String; = "file:///android_asset/"

.field static final FILE_SCHEME:Ljava/lang/String; = "file:///"


# instance fields
.field private final bitmap:Landroid/graphics/Bitmap;

.field private cached:Z

.field private final resource:Ljava/lang/Integer;

.field private sHeight:I

.field private sRegion:Landroid/graphics/Rect;

.field private sWidth:I

.field private tile:Z

.field private final uri:Landroid/net/Uri;


# direct methods
.method private constructor <init>(I)V
    .registers 3
    .param p1, "resource"    # I

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    .line 63
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 66
    return-void
.end method

.method private constructor <init>(Landroid/graphics/Bitmap;Z)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "cached"    # Z

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    .line 34
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 35
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 37
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sWidth:I

    .line 38
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sHeight:I

    .line 39
    iput-boolean p2, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->cached:Z

    .line 40
    return-void
.end method

.method private constructor <init>(Landroid/net/Uri;)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "uriString":Ljava/lang/String;
    const-string v2, "file:///"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 46
    new-instance v0, Ljava/io/File;

    const-string v2, "file:///"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .local v0, "uriFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_31

    .line 49
    :try_start_27
    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_30
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_27 .. :try_end_30} :catch_3b

    move-result-object p1

    .line 55
    .end local v0    # "uriFile":Ljava/io/File;
    :cond_31
    :goto_31
    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    .line 56
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 57
    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    .line 58
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 59
    return-void

    .line 50
    .restart local v0    # "uriFile":Ljava/io/File;
    :catch_3b
    move-exception v2

    goto :goto_31
.end method

.method public static asset(Ljava/lang/String;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 3
    .param p0, "assetName"    # Ljava/lang/String;

    .prologue
    .line 81
    if-nez p0, :cond_a

    .line 82
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Asset name must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "file:///android_asset/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri(Ljava/lang/String;)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v0

    return-object v0
.end method

.method public static bitmap(Landroid/graphics/Bitmap;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 121
    if-nez p0, :cond_a

    .line 122
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Bitmap must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/graphics/Bitmap;Z)V

    return-object v0
.end method

.method public static cachedBitmap(Landroid/graphics/Bitmap;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 134
    if-nez p0, :cond_a

    .line 135
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Bitmap must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/graphics/Bitmap;Z)V

    return-object v0
.end method

.method public static resource(I)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 2
    .param p0, "resId"    # I

    .prologue
    .line 73
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-direct {v0, p0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(I)V

    return-object v0
.end method

.method private setInvariants()V
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sRegion:Landroid/graphics/Rect;

    if-eqz v0, :cond_17

    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 197
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sWidth:I

    .line 198
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sHeight:I

    .line 200
    :cond_17
    return-void
.end method

.method public static uri(Landroid/net/Uri;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 110
    if-nez p0, :cond_a

    .line 111
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Uri must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-direct {v0, p0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/net/Uri;)V

    return-object v0
.end method

.method public static uri(Ljava/lang/String;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    .line 93
    if-nez p0, :cond_a

    .line 94
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Uri must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_a
    const-string v0, "://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 97
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 98
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 100
    :cond_1f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "file:///"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 102
    :cond_32
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/net/Uri;)V

    return-object v0
.end method


# virtual methods
.method public dimensions(II)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 4
    .param p1, "sWidth"    # I
    .param p2, "sHeight"    # I

    .prologue
    .line 186
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_8

    .line 187
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sWidth:I

    .line 188
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sHeight:I

    .line 190
    :cond_8
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->setInvariants()V

    .line 191
    return-object p0
.end method

.method protected final getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method protected final getResource()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    return-object v0
.end method

.method protected final getSHeight()I
    .registers 2

    .prologue
    .line 223
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sHeight:I

    return v0
.end method

.method protected final getSRegion()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sRegion:Landroid/graphics/Rect;

    return-object v0
.end method

.method protected final getSWidth()I
    .registers 2

    .prologue
    .line 219
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sWidth:I

    return v0
.end method

.method protected final getTile()Z
    .registers 2

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    return v0
.end method

.method protected final getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method protected final isCached()Z
    .registers 2

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->cached:Z

    return v0
.end method

.method public region(Landroid/graphics/Rect;)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 2
    .param p1, "sRegion"    # Landroid/graphics/Rect;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sRegion:Landroid/graphics/Rect;

    .line 175
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->setInvariants()V

    .line 176
    return-object p0
.end method

.method public tiling(Z)Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 2
    .param p1, "tile"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 165
    return-object p0
.end method

.method public tilingDisabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 2

    .prologue
    .line 155
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tiling(Z)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v0

    return-object v0
.end method

.method public tilingEnabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .registers 2

    .prologue
    .line 146
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tiling(Z)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v0

    return-object v0
.end method
