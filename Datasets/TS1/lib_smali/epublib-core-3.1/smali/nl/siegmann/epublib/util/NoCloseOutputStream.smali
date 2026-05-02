.class public Lnl/siegmann/epublib/util/NoCloseOutputStream;
.super Ljava/io/OutputStream;
.source "NoCloseOutputStream.java"


# instance fields
.field private outputStream:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 19
    iput-object p1, p0, Lnl/siegmann/epublib/util/NoCloseOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 20
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 31
    return-void
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lnl/siegmann/epublib/util/NoCloseOutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 25
    return-void
.end method
