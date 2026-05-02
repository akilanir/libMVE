.class Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "TaglibFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TldUriReader"
.end annotation


# instance fields
.field private buf:Ljava/lang/StringBuffer;

.field private uri:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 446
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 447
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 5
    .param p1, "chars"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 464
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->buf:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_9

    .line 465
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 467
    :cond_9
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;

    .prologue
    .line 470
    const-string v0, "uri"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 471
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->uri:Ljava/lang/String;

    .line 472
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->buf:Ljava/lang/StringBuffer;

    .line 474
    :cond_17
    return-void
.end method

.method getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 450
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 458
    const-string v0, "uri"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 459
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->buf:Ljava/lang/StringBuffer;

    .line 461
    :cond_f
    return-void
.end method
