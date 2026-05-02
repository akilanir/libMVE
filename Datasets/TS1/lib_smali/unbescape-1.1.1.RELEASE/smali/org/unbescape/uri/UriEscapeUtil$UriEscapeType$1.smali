.class final enum Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$1;
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
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;-><init>(Ljava/lang/String;ILorg/unbescape/uri/UriEscapeUtil$1;)V

    return-void
.end method


# virtual methods
.method public isAllowed(I)Z
    .registers 3
    .param p1, "c"    # I

    .prologue
    .line 73
    # invokes: Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isPchar(I)Z
    invoke-static {p1}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->access$100(I)Z

    move-result v0

    if-nez v0, :cond_a

    const/16 v0, 0x2f

    if-ne v0, p1, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
