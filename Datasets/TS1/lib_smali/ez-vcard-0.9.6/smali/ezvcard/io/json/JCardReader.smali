.class public Lezvcard/io/json/JCardReader;
.super Lezvcard/io/StreamReader;
.source "JCardReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/json/JCardReader$1;,
        Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;
    }
.end annotation


# instance fields
.field private final reader:Lezvcard/io/json/JCardRawReader;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Reader(Ljava/io/File;)Ljava/io/Reader;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardReader;-><init>(Ljava/io/Reader;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 93
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Reader(Ljava/io/InputStream;)Ljava/io/Reader;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardReader;-><init>(Ljava/io/Reader;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 109
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 110
    new-instance v0, Lezvcard/io/json/JCardRawReader;

    invoke-direct {v0, p1}, Lezvcard/io/json/JCardRawReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 85
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lezvcard/io/json/JCardReader;-><init>(Ljava/io/Reader;)V

    .line 86
    return-void
.end method

.method static synthetic access$300(Lezvcard/io/json/JCardReader;)Lezvcard/io/json/JCardRawReader;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    return-object v0
.end method

.method static synthetic access$400(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$500(Lezvcard/io/json/JCardReader;)Lezvcard/io/scribe/ScribeIndex;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->index:Lezvcard/io/scribe/ScribeIndex;

    return-object v0
.end method

.method static synthetic access$600(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$700(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$800(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$900(Lezvcard/io/json/JCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/json/JCardReader;

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method


# virtual methods
.method protected _readNext()Lezvcard/VCard;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 115
    iget-object v3, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    invoke-virtual {v3}, Lezvcard/io/json/JCardRawReader;->eof()Z

    move-result v3

    if-eqz v3, :cond_b

    move-object v1, v2

    .line 127
    :cond_a
    :goto_a
    return-object v1

    .line 119
    :cond_b
    iget-object v3, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    invoke-virtual {v3}, Lezvcard/io/ParseWarnings;->clear()V

    .line 121
    new-instance v0, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;

    invoke-direct {v0, p0, v2}, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;-><init>(Lezvcard/io/json/JCardReader;Lezvcard/io/json/JCardReader$1;)V

    .line 122
    .local v0, "listener":Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;
    iget-object v3, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    invoke-virtual {v3, v0}, Lezvcard/io/json/JCardRawReader;->readNext(Lezvcard/io/json/JCardRawReader$JCardDataStreamListener;)V

    .line 123
    # getter for: Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->vcard:Lezvcard/VCard;
    invoke-static {v0}, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->access$100(Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;)Lezvcard/VCard;

    move-result-object v1

    .line 124
    .local v1, "vcard":Lezvcard/VCard;
    if-eqz v1, :cond_a

    # getter for: Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->versionFound:Z
    invoke-static {v0}, Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;->access$200(Lezvcard/io/json/JCardReader$JCardDataStreamListenerImpl;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 125
    iget-object v3, p0, Lezvcard/io/json/JCardReader;->warnings:Lezvcard/io/ParseWarnings;

    iget-object v4, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    invoke-virtual {v4}, Lezvcard/io/json/JCardRawReader;->getLineNum()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0x1d

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v2, v5, v6}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_a
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Lezvcard/io/json/JCardReader;->reader:Lezvcard/io/json/JCardRawReader;

    invoke-virtual {v0}, Lezvcard/io/json/JCardRawReader;->close()V

    .line 132
    return-void
.end method
