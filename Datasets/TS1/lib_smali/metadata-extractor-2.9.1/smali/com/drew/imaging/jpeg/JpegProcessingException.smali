.class public Lcom/drew/imaging/jpeg/JpegProcessingException;
.super Lcom/drew/imaging/ImageProcessingException;
.source "JpegProcessingException.java"


# static fields
.field private static final serialVersionUID:J = -0x6d387ecef26bb7aeL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p2, "cause"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method
