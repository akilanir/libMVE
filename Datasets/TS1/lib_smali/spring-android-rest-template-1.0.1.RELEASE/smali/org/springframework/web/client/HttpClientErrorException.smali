.class public Lorg/springframework/web/client/HttpClientErrorException;
.super Lorg/springframework/web/client/HttpStatusCodeException;
.source "HttpClientErrorException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Lorg/springframework/http/HttpStatus;)V
    .registers 2
    .param p1, "statusCode"    # Lorg/springframework/http/HttpStatus;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/springframework/web/client/HttpStatusCodeException;-><init>(Lorg/springframework/http/HttpStatus;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/springframework/http/HttpStatus;Ljava/lang/String;)V
    .registers 3
    .param p1, "statusCode"    # Lorg/springframework/http/HttpStatus;
    .param p2, "statusText"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lorg/springframework/web/client/HttpStatusCodeException;-><init>(Lorg/springframework/http/HttpStatus;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/springframework/http/HttpStatus;Ljava/lang/String;[BLjava/nio/charset/Charset;)V
    .registers 5
    .param p1, "statusCode"    # Lorg/springframework/http/HttpStatus;
    .param p2, "statusText"    # Ljava/lang/String;
    .param p3, "responseBody"    # [B
    .param p4, "responseCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/springframework/web/client/HttpStatusCodeException;-><init>(Lorg/springframework/http/HttpStatus;Ljava/lang/String;[BLjava/nio/charset/Charset;)V

    .line 66
    return-void
.end method
