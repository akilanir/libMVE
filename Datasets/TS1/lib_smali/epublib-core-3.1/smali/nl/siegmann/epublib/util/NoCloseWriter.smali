.class public Lnl/siegmann/epublib/util/NoCloseWriter;
.super Ljava/io/Writer;
.source "NoCloseWriter.java"


# instance fields
.field private writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .registers 2
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 20
    iput-object p1, p0, Lnl/siegmann/epublib/util/NoCloseWriter;->writer:Ljava/io/Writer;

    .line 21
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
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
    .line 29
    iget-object v0, p0, Lnl/siegmann/epublib/util/NoCloseWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 30
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lnl/siegmann/epublib/util/NoCloseWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 35
    return-void
.end method
