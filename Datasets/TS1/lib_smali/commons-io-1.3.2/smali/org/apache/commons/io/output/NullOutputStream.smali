.class public Lorg/apache/commons/io/output/NullOutputStream;
.super Ljava/io/OutputStream;
.source "NullOutputStream.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public write(I)V
    .registers 2
    .param p1, "b"    # I

    .prologue
    .line 45
    return-void
.end method

.method public write([B)V
    .registers 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    return-void
.end method

.method public write([BII)V
    .registers 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 38
    return-void
.end method
