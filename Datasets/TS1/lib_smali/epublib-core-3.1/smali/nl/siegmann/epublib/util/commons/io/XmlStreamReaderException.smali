.class public Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;
.super Ljava/io/IOException;
.source "XmlStreamReaderException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final bomEncoding:Ljava/lang/String;

.field private final contentTypeEncoding:Ljava/lang/String;

.field private final contentTypeMime:Ljava/lang/String;

.field private final xmlEncoding:Ljava/lang/String;

.field private final xmlGuessEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "bomEnc"    # Ljava/lang/String;
    .param p3, "xmlGuessEnc"    # Ljava/lang/String;
    .param p4, "xmlEnc"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 63
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ctMime"    # Ljava/lang/String;
    .param p3, "ctEnc"    # Ljava/lang/String;
    .param p4, "bomEnc"    # Ljava/lang/String;
    .param p5, "xmlGuessEnc"    # Ljava/lang/String;
    .param p6, "xmlEnc"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 82
    iput-object p2, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->contentTypeMime:Ljava/lang/String;

    .line 83
    iput-object p3, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->contentTypeEncoding:Ljava/lang/String;

    .line 84
    iput-object p4, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->bomEncoding:Ljava/lang/String;

    .line 85
    iput-object p5, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->xmlGuessEncoding:Ljava/lang/String;

    .line 86
    iput-object p6, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->xmlEncoding:Ljava/lang/String;

    .line 87
    return-void
.end method


# virtual methods
.method public getBomEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->bomEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentTypeEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->contentTypeEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentTypeMime()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->contentTypeMime:Ljava/lang/String;

    return-object v0
.end method

.method public getXmlEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->xmlEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getXmlGuessEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReaderException;->xmlGuessEncoding:Ljava/lang/String;

    return-object v0
.end method
