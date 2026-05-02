.class public Lcz/msebera/android/httpclient/conn/ssl/AllowAllHostnameVerifier;
.super Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;
.source "AllowAllHostnameVerifier.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;-><init>()V

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    const-string v0, "ALLOW_ALL"

    return-object v0
.end method

.method public final verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "cns"    # [Ljava/lang/String;
    .param p3, "subjectAlts"    # [Ljava/lang/String;

    .prologue
    .line 47
    return-void
.end method
