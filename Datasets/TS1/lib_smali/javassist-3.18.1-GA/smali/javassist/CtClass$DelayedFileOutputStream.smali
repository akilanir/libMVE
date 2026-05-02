.class Ljavassist/CtClass$DelayedFileOutputStream;
.super Ljava/io/OutputStream;
.source "CtClass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DelayedFileOutputStream"
.end annotation


# instance fields
.field private file:Ljava/io/FileOutputStream;

.field private filename:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1486
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 1487
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    .line 1488
    iput-object p1, p0, Ljavassist/CtClass$DelayedFileOutputStream;->filename:Ljava/lang/String;

    .line 1489
    return-void
.end method

.method private init()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1492
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    if-nez v0, :cond_d

    .line 1493
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Ljavassist/CtClass$DelayedFileOutputStream;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    .line 1494
    :cond_d
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1518
    invoke-direct {p0}, Ljavassist/CtClass$DelayedFileOutputStream;->init()V

    .line 1519
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1520
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
    .line 1513
    invoke-direct {p0}, Ljavassist/CtClass$DelayedFileOutputStream;->init()V

    .line 1514
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 1515
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
    .line 1497
    invoke-direct {p0}, Ljavassist/CtClass$DelayedFileOutputStream;->init()V

    .line 1498
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write(I)V

    .line 1499
    return-void
.end method

.method public write([B)V
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1502
    invoke-direct {p0}, Ljavassist/CtClass$DelayedFileOutputStream;->init()V

    .line 1503
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 1504
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1507
    invoke-direct {p0}, Ljavassist/CtClass$DelayedFileOutputStream;->init()V

    .line 1508
    iget-object v0, p0, Ljavassist/CtClass$DelayedFileOutputStream;->file:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 1510
    return-void
.end method
