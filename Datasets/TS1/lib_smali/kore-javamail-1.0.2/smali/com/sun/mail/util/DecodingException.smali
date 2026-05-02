.class public Lcom/sun/mail/util/DecodingException;
.super Ljava/io/IOException;
.source "DecodingException.java"


# static fields
.field private static final serialVersionUID:J = -0x5ff23609f8a769beL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 62
    return-void
.end method
