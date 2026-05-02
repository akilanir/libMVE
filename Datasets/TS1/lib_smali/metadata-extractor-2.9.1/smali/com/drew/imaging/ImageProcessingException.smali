.class public Lcom/drew/imaging/ImageProcessingException;
.super Lcom/drew/lang/CompoundException;
.source "ImageProcessingException.java"


# static fields
.field private static final serialVersionUID:J = -0x7e815cd30798ef64L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/lang/CompoundException;-><init>(Ljava/lang/String;)V

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
    invoke-direct {p0, p1, p2}, Lcom/drew/lang/CompoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

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
    invoke-direct {p0, p1}, Lcom/drew/lang/CompoundException;-><init>(Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method
