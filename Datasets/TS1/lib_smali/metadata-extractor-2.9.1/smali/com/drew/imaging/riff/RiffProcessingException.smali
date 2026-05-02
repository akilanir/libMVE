.class public Lcom/drew/imaging/riff/RiffProcessingException;
.super Lcom/drew/imaging/ImageProcessingException;
.source "RiffProcessingException.java"


# static fields
.field private static final serialVersionUID:J = -0x1702e0a153872c58L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;)V

    .line 39
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
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/Throwable;)V

    .line 49
    return-void
.end method
