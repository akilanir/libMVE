.class public Lezvcard/io/xml/XCardReader;
.super Lezvcard/io/StreamReader;
.source "XCardReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/xml/XCardReader$1;,
        Lezvcard/io/xml/XCardReader$XCardStructure;,
        Lezvcard/io/xml/XCardReader$ElementType;,
        Lezvcard/io/xml/XCardReader$ContentHandlerImpl;,
        Lezvcard/io/xml/XCardReader$ReadThread;
    }
.end annotation


# instance fields
.field private final NS:Ljava/lang/String;

.field private final lock:Ljava/lang/Object;

.field private volatile readVCard:Lezvcard/VCard;

.field private final readerBlock:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final source:Ljavax/xml/transform/Source;

.field private final stream:Ljava/io/Closeable;

.field private final thread:Lezvcard/io/xml/XCardReader$ReadThread;

.field private final threadBlock:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile thrown:Ljavax/xml/transform/TransformerException;

.field private final version:Lezvcard/VCardVersion;


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
    .line 141
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardReader;-><init>(Ljava/io/InputStream;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x1

    .line 130
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 104
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    .line 105
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;

    .line 113
    new-instance v0, Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-direct {v0, p0}, Lezvcard/io/xml/XCardReader$ReadThread;-><init>(Lezvcard/io/xml/XCardReader;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;

    .line 115
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;

    .line 116
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;

    .line 131
    new-instance v0, Ljavax/xml/transform/stream/StreamSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->source:Ljavax/xml/transform/Source;

    .line 132
    iput-object p1, p0, Lezvcard/io/xml/XCardReader;->stream:Ljava/io/Closeable;

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 4
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x1

    .line 148
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 104
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    .line 105
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;

    .line 113
    new-instance v0, Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-direct {v0, p0}, Lezvcard/io/xml/XCardReader$ReadThread;-><init>(Lezvcard/io/xml/XCardReader;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;

    .line 115
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;

    .line 116
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;

    .line 149
    new-instance v0, Ljavax/xml/transform/stream/StreamSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->source:Ljavax/xml/transform/Source;

    .line 150
    iput-object p1, p0, Lezvcard/io/xml/XCardReader;->stream:Ljava/io/Closeable;

    .line 151
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    .line 123
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardReader;-><init>(Ljava/io/Reader;)V

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 4
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v1, 0x1

    .line 157
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 104
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    .line 105
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;

    .line 113
    new-instance v0, Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-direct {v0, p0}, Lezvcard/io/xml/XCardReader$ReadThread;-><init>(Lezvcard/io/xml/XCardReader;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;

    .line 115
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;

    .line 116
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;

    .line 158
    new-instance v0, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->source:Ljavax/xml/transform/Source;

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/io/xml/XCardReader;->stream:Ljava/io/Closeable;

    .line 160
    return-void
.end method

.method static synthetic access$1000(Lezvcard/io/xml/XCardReader;)Lezvcard/VCard;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;

    return-object v0
.end method

.method static synthetic access$1002(Lezvcard/io/xml/XCardReader;Lezvcard/VCard;)Lezvcard/VCard;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;
    .param p1, "x1"    # Lezvcard/VCard;

    .prologue
    .line 103
    iput-object p1, p0, Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;

    return-object p1
.end method

.method static synthetic access$1100(Lezvcard/io/xml/XCardReader;)Lezvcard/VCardVersion;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;

    return-object v0
.end method

.method static synthetic access$1200(Lezvcard/io/xml/XCardReader;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lezvcard/io/xml/XCardReader;)Lezvcard/io/scribe/ScribeIndex;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->index:Lezvcard/io/scribe/ScribeIndex;

    return-object v0
.end method

.method static synthetic access$1400(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$1500(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$1600(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$1700(Lezvcard/io/xml/XCardReader;)Lezvcard/io/scribe/ScribeIndex;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->index:Lezvcard/io/scribe/ScribeIndex;

    return-object v0
.end method

.method static synthetic access$1800(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;

    return-object v0
.end method

.method static synthetic access$1900(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$400(Lezvcard/io/xml/XCardReader;)Ljavax/xml/transform/Source;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->source:Ljavax/xml/transform/Source;

    return-object v0
.end method

.method static synthetic access$500(Lezvcard/io/xml/XCardReader;)Lezvcard/io/xml/XCardReader$ReadThread;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    return-object v0
.end method

.method static synthetic access$602(Lezvcard/io/xml/XCardReader;Ljavax/xml/transform/TransformerException;)Ljavax/xml/transform/TransformerException;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;
    .param p1, "x1"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 103
    iput-object p1, p0, Lezvcard/io/xml/XCardReader;->thrown:Ljavax/xml/transform/TransformerException;

    return-object p1
.end method

.method static synthetic access$700(Lezvcard/io/xml/XCardReader;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$800(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardReader;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method


# virtual methods
.method protected _readNext()Lezvcard/VCard;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 164
    iput-object v1, p0, Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;

    .line 165
    iput-object v1, p0, Lezvcard/io/xml/XCardReader;->thrown:Ljavax/xml/transform/TransformerException;

    .line 167
    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    # getter for: Lezvcard/io/xml/XCardReader$ReadThread;->started:Z
    invoke-static {v2}, Lezvcard/io/xml/XCardReader$ReadThread;->access$000(Lezvcard/io/xml/XCardReader$ReadThread;)Z

    move-result v2

    if-nez v2, :cond_23

    .line 168
    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-virtual {v2}, Lezvcard/io/xml/XCardReader$ReadThread;->start()V

    .line 183
    :goto_12
    :try_start_12
    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;
    :try_end_17
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_17} :catch_3e

    .line 188
    iget-object v1, p0, Lezvcard/io/xml/XCardReader;->thrown:Ljavax/xml/transform/TransformerException;

    if-eqz v1, :cond_40

    .line 189
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->thrown:Ljavax/xml/transform/TransformerException;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 170
    :cond_23
    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    # getter for: Lezvcard/io/xml/XCardReader$ReadThread;->finished:Z
    invoke-static {v2}, Lezvcard/io/xml/XCardReader$ReadThread;->access$100(Lezvcard/io/xml/XCardReader$ReadThread;)Z

    move-result v2

    if-nez v2, :cond_33

    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    # getter for: Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z
    invoke-static {v2}, Lezvcard/io/xml/XCardReader$ReadThread;->access$200(Lezvcard/io/xml/XCardReader$ReadThread;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 192
    :cond_33
    :goto_33
    return-object v1

    .line 175
    :cond_34
    :try_start_34
    iget-object v2, p0, Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;

    iget-object v3, p0, Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;

    invoke-interface {v2, v3}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_3b
    .catch Ljava/lang/InterruptedException; {:try_start_34 .. :try_end_3b} :catch_3c

    goto :goto_12

    .line 176
    :catch_3c
    move-exception v0

    .line 177
    .local v0, "e":Ljava/lang/InterruptedException;
    goto :goto_33

    .line 184
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_3e
    move-exception v0

    .line 185
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    goto :goto_33

    .line 192
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_40
    iget-object v1, p0, Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;

    goto :goto_33
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-virtual {v0}, Lezvcard/io/xml/XCardReader$ReadThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 546
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    const/4 v1, 0x1

    # setter for: Lezvcard/io/xml/XCardReader$ReadThread;->closed:Z
    invoke-static {v0, v1}, Lezvcard/io/xml/XCardReader$ReadThread;->access$202(Lezvcard/io/xml/XCardReader$ReadThread;Z)Z

    .line 547
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->thread:Lezvcard/io/xml/XCardReader$ReadThread;

    invoke-virtual {v0}, Lezvcard/io/xml/XCardReader$ReadThread;->interrupt()V

    .line 550
    :cond_13
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->stream:Ljava/io/Closeable;

    if-eqz v0, :cond_1c

    .line 551
    iget-object v0, p0, Lezvcard/io/xml/XCardReader;->stream:Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 553
    :cond_1c
    return-void
.end method
