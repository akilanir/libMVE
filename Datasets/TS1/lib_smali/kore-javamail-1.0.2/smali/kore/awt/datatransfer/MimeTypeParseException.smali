.class public Lkore/awt/datatransfer/MimeTypeParseException;
.super Ljava/lang/Exception;
.source "MimeTypeParseException.java"


# static fields
.field private static final serialVersionUID:J = -0x4dc6db2b26e1d035L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method
