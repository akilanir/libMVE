.class final enum Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$3;
.super Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
.source "UriEscapeUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;-><init>(Ljava/lang/String;ILorg/unbescape/uri/UriEscapeUtil$1;)V

    return-void
.end method


# virtual methods
.method public canPlusEscapeWhitespace()Z
    .registers 2

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method public isAllowed(I)Z
    .registers 4
    .param p1, "c"    # I

    .prologue
    const/4 v0, 0x0

    .line 88
    const/16 v1, 0x3d

    if-eq v1, p1, :cond_11

    const/16 v1, 0x26

    if-eq v1, p1, :cond_11

    const/16 v1, 0x2b

    if-eq v1, p1, :cond_11

    const/16 v1, 0x23

    if-ne v1, p1, :cond_12

    .line 91
    :cond_11
    :goto_11
    return v0

    :cond_12
    # invokes: Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isPchar(I)Z
    invoke-static {p1}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->access$100(I)Z

    move-result v1

    if-nez v1, :cond_20

    const/16 v1, 0x2f

    if-eq v1, p1, :cond_20

    const/16 v1, 0x3f

    if-ne v1, p1, :cond_11

    :cond_20
    const/4 v0, 0x1

    goto :goto_11
.end method
