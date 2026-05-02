.class public Lnl/siegmann/epublib/service/MediatypeService;
.super Ljava/lang/Object;
.source "MediatypeService.java"


# static fields
.field public static final CSS:Lnl/siegmann/epublib/domain/MediaType;

.field public static final EPUB:Lnl/siegmann/epublib/domain/MediaType;

.field public static final GIF:Lnl/siegmann/epublib/domain/MediaType;

.field public static final JAVASCRIPT:Lnl/siegmann/epublib/domain/MediaType;

.field public static final JPG:Lnl/siegmann/epublib/domain/MediaType;

.field public static final MP3:Lnl/siegmann/epublib/domain/MediaType;

.field public static final MP4:Lnl/siegmann/epublib/domain/MediaType;

.field public static final NCX:Lnl/siegmann/epublib/domain/MediaType;

.field public static final OPENTYPE:Lnl/siegmann/epublib/domain/MediaType;

.field public static final PLS:Lnl/siegmann/epublib/domain/MediaType;

.field public static final PNG:Lnl/siegmann/epublib/domain/MediaType;

.field public static final SMIL:Lnl/siegmann/epublib/domain/MediaType;

.field public static final SVG:Lnl/siegmann/epublib/domain/MediaType;

.field public static final TTF:Lnl/siegmann/epublib/domain/MediaType;

.field public static final WOFF:Lnl/siegmann/epublib/domain/MediaType;

.field public static final XHTML:Lnl/siegmann/epublib/domain/MediaType;

.field public static final XPGT:Lnl/siegmann/epublib/domain/MediaType;

.field public static mediaTypesByName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ">;"
        }
    .end annotation
.end field

.field public static mediatypes:[Lnl/siegmann/epublib/domain/MediaType;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 18
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/xhtml+xml"

    const-string v3, ".xhtml"

    new-array v4, v9, [Ljava/lang/String;

    const-string v5, ".htm"

    aput-object v5, v4, v6

    const-string v5, ".html"

    aput-object v5, v4, v7

    const-string v5, ".xhtml"

    aput-object v5, v4, v8

    invoke-direct {v1, v2, v3, v4}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    .line 19
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/epub+zip"

    const-string v3, ".epub"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->EPUB:Lnl/siegmann/epublib/domain/MediaType;

    .line 20
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/x-dtbncx+xml"

    const-string v3, ".ncx"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    .line 22
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "text/javascript"

    const-string v3, ".js"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->JAVASCRIPT:Lnl/siegmann/epublib/domain/MediaType;

    .line 23
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "text/css"

    const-string v3, ".css"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->CSS:Lnl/siegmann/epublib/domain/MediaType;

    .line 26
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "image/jpeg"

    const-string v3, ".jpg"

    new-array v4, v8, [Ljava/lang/String;

    const-string v5, ".jpg"

    aput-object v5, v4, v6

    const-string v5, ".jpeg"

    aput-object v5, v4, v7

    invoke-direct {v1, v2, v3, v4}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->JPG:Lnl/siegmann/epublib/domain/MediaType;

    .line 27
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "image/png"

    const-string v3, ".png"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->PNG:Lnl/siegmann/epublib/domain/MediaType;

    .line 28
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "image/gif"

    const-string v3, ".gif"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->GIF:Lnl/siegmann/epublib/domain/MediaType;

    .line 30
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "image/svg+xml"

    const-string v3, ".svg"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->SVG:Lnl/siegmann/epublib/domain/MediaType;

    .line 33
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/x-truetype-font"

    const-string v3, ".ttf"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->TTF:Lnl/siegmann/epublib/domain/MediaType;

    .line 34
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/vnd.ms-opentype"

    const-string v3, ".otf"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->OPENTYPE:Lnl/siegmann/epublib/domain/MediaType;

    .line 35
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/font-woff"

    const-string v3, ".woff"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->WOFF:Lnl/siegmann/epublib/domain/MediaType;

    .line 38
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "audio/mpeg"

    const-string v3, ".mp3"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->MP3:Lnl/siegmann/epublib/domain/MediaType;

    .line 39
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "audio/mp4"

    const-string v3, ".mp4"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->MP4:Lnl/siegmann/epublib/domain/MediaType;

    .line 41
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/smil+xml"

    const-string v3, ".smil"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->SMIL:Lnl/siegmann/epublib/domain/MediaType;

    .line 42
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/adobe-page-template+xml"

    const-string v3, ".xpgt"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->XPGT:Lnl/siegmann/epublib/domain/MediaType;

    .line 43
    new-instance v1, Lnl/siegmann/epublib/domain/MediaType;

    const-string v2, "application/pls+xml"

    const-string v3, ".pls"

    invoke-direct {v1, v2, v3}, Lnl/siegmann/epublib/domain/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->PLS:Lnl/siegmann/epublib/domain/MediaType;

    .line 45
    const/16 v1, 0x11

    new-array v1, v1, [Lnl/siegmann/epublib/domain/MediaType;

    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v2, v1, v6

    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->EPUB:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v2, v1, v7

    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->JPG:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v2, v1, v8

    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->PNG:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v2, v1, v9

    const/4 v2, 0x4

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->GIF:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->CSS:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/4 v2, 0x6

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->SVG:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/4 v2, 0x7

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->TTF:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0x8

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0x9

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->XPGT:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xa

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->OPENTYPE:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xb

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->WOFF:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xc

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->SMIL:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xd

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->PLS:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xe

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->JAVASCRIPT:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0xf

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->MP3:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0x10

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->MP4:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    .line 49
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lnl/siegmann/epublib/service/MediatypeService;->mediaTypesByName:Ljava/util/Map;

    .line 51
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13f
    sget-object v1, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    array-length v1, v1

    if-ge v0, v1, :cond_158

    .line 52
    sget-object v1, Lnl/siegmann/epublib/service/MediatypeService;->mediaTypesByName:Ljava/util/Map;

    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/MediaType;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    aget-object v3, v3, v0

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_13f

    .line 54
    :cond_158
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;
    .registers 6
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 68
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    sget-object v4, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    array-length v4, v4

    if-ge v1, v4, :cond_28

    .line 69
    sget-object v4, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    aget-object v3, v4, v1

    .line 70
    .local v3, "mediatype":Lnl/siegmann/epublib/domain/MediaType;
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/MediaType;->getExtensions()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 71
    .local v0, "extension":Ljava/lang/String;
    invoke-static {p0, v0}, Lnl/siegmann/epublib/util/StringUtil;->endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 76
    .end local v0    # "extension":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "mediatype":Lnl/siegmann/epublib/domain/MediaType;
    :goto_24
    return-object v3

    .line 68
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "mediatype":Lnl/siegmann/epublib/domain/MediaType;
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 76
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "mediatype":Lnl/siegmann/epublib/domain/MediaType;
    :cond_28
    const/4 v3, 0x0

    goto :goto_24
.end method

.method public static getMediaTypeByName(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;
    .registers 2
    .param p0, "mediaTypeName"    # Ljava/lang/String;

    .prologue
    .line 80
    sget-object v0, Lnl/siegmann/epublib/service/MediatypeService;->mediaTypesByName:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/MediaType;

    return-object v0
.end method

.method public static isBitmapImage(Lnl/siegmann/epublib/domain/MediaType;)Z
    .registers 2
    .param p0, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;

    .prologue
    .line 57
    sget-object v0, Lnl/siegmann/epublib/service/MediatypeService;->JPG:Lnl/siegmann/epublib/domain/MediaType;

    if-eq p0, v0, :cond_c

    sget-object v0, Lnl/siegmann/epublib/service/MediatypeService;->PNG:Lnl/siegmann/epublib/domain/MediaType;

    if-eq p0, v0, :cond_c

    sget-object v0, Lnl/siegmann/epublib/service/MediatypeService;->GIF:Lnl/siegmann/epublib/domain/MediaType;

    if-ne p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
