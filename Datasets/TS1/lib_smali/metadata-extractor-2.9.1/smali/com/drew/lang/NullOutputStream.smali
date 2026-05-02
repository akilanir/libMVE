.class public Lcom/drew/lang/NullOutputStream;
.super Ljava/io/OutputStream;
.source "NullOutputStream.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method public write(I)V
    .registers 2
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    return-void
.end method
