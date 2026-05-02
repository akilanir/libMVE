.class public Lorg/apache/commons/validator/ValidatorException;
.super Ljava/lang/Exception;
.source "ValidatorException.java"


# static fields
.field private static final serialVersionUID:J = 0xe3c3ab6f5c809c4L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method
