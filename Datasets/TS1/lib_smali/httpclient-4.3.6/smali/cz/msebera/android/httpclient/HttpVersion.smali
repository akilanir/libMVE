.class public final Lcz/msebera/android/httpclient/HttpVersion;
.super Lcz/msebera/android/httpclient/ProtocolVersion;
.source "HttpVersion.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final HTTP:Ljava/lang/String; = "HTTP"

.field public static final HTTP_0_9:Lcz/msebera/android/httpclient/HttpVersion;

.field public static final HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

.field public static final HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

.field private static final serialVersionUID:J = -0x514703574c384bf0L


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 57
    new-instance v0, Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v1, 0x9

    invoke-direct {v0, v3, v1}, Lcz/msebera/android/httpclient/HttpVersion;-><init>(II)V

    sput-object v0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_0_9:Lcz/msebera/android/httpclient/HttpVersion;

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/HttpVersion;

    invoke-direct {v0, v2, v3}, Lcz/msebera/android/httpclient/HttpVersion;-><init>(II)V

    sput-object v0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    .line 63
    new-instance v0, Lcz/msebera/android/httpclient/HttpVersion;

    invoke-direct {v0, v2, v2}, Lcz/msebera/android/httpclient/HttpVersion;-><init>(II)V

    sput-object v0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    .line 75
    const-string v0, "HTTP"

    invoke-direct {p0, v0, p1, p2}, Lcz/msebera/android/httpclient/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    .line 76
    return-void
.end method


# virtual methods
.method public forVersion(II)Lcz/msebera/android/httpclient/ProtocolVersion;
    .registers 5
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    const/4 v1, 0x1

    .line 90
    iget v0, p0, Lcz/msebera/android/httpclient/HttpVersion;->major:I

    if-ne p1, v0, :cond_a

    iget v0, p0, Lcz/msebera/android/httpclient/HttpVersion;->minor:I

    if-ne p2, v0, :cond_a

    .line 107
    .end local p0    # "this":Lcz/msebera/android/httpclient/HttpVersion;
    :goto_9
    return-object p0

    .line 94
    .restart local p0    # "this":Lcz/msebera/android/httpclient/HttpVersion;
    :cond_a
    if-ne p1, v1, :cond_16

    .line 95
    if-nez p2, :cond_11

    .line 96
    sget-object p0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    goto :goto_9

    .line 98
    :cond_11
    if-ne p2, v1, :cond_16

    .line 99
    sget-object p0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    goto :goto_9

    .line 102
    :cond_16
    if-nez p1, :cond_1f

    const/16 v0, 0x9

    if-ne p2, v0, :cond_1f

    .line 103
    sget-object p0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_0_9:Lcz/msebera/android/httpclient/HttpVersion;

    goto :goto_9

    .line 107
    :cond_1f
    new-instance p0, Lcz/msebera/android/httpclient/HttpVersion;

    .end local p0    # "this":Lcz/msebera/android/httpclient/HttpVersion;
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/HttpVersion;-><init>(II)V

    goto :goto_9
.end method
