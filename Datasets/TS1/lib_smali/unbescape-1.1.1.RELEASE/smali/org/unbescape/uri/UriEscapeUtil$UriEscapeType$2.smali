.class final enum Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$2;
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
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;-><init>(Ljava/lang/String;ILorg/unbescape/uri/UriEscapeUtil$1;)V

    return-void
.end method


# virtual methods
.method public isAllowed(I)Z
    .registers 3
    .param p1, "c"    # I

    .prologue
    .line 80
    # invokes: Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isPchar(I)Z
    invoke-static {p1}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->access$100(I)Z

    move-result v0

    return v0
.end method
