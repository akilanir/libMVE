.class final enum Lorg/springframework/web/util/UriComponents$Type$2;
.super Lorg/springframework/web/util/UriComponents$Type;
.source "UriComponents.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/web/util/UriComponents$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 618
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/springframework/web/util/UriComponents$Type;-><init>(Ljava/lang/String;ILorg/springframework/web/util/UriComponents$1;)V

    return-void
.end method


# virtual methods
.method public isAllowed(I)Z
    .registers 3
    .param p1, "c"    # I

    .prologue
    .line 621
    invoke-virtual {p0, p1}, Lorg/springframework/web/util/UriComponents$Type$2;->isUnreserved(I)Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0, p1}, Lorg/springframework/web/util/UriComponents$Type$2;->isSubDelimiter(I)Z

    move-result v0

    if-nez v0, :cond_14

    const/16 v0, 0x3a

    if-eq v0, p1, :cond_14

    const/16 v0, 0x40

    if-ne v0, p1, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
