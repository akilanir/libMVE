.class public Lorg/springframework/web/client/ResourceAccessException;
.super Lorg/springframework/web/client/RestClientException;
.source "ResourceAccessException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lorg/springframework/web/client/RestClientException;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/IOException;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/io/IOException;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/springframework/web/client/RestClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    return-void
.end method
