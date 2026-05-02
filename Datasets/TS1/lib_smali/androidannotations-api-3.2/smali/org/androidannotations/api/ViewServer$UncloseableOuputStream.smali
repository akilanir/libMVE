.class Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;
.super Ljava/io/OutputStream;
.source "ViewServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/androidannotations/api/ViewServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UncloseableOuputStream"
.end annotation


# instance fields
.field private final mStream:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 471
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 472
    iput-object p1, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    .line 473
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
    .line 478
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 482
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 488
    return-void
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 492
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 497
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 512
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 513
    return-void
.end method

.method public write([B)V
    .registers 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 508
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 503
    return-void
.end method
