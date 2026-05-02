.class final Lorg/apache/commons/lang3/time/FastDateParser$3;
.super Lorg/apache/commons/lang3/time/FastDateParser$NumberStrategy;
.source "FastDateParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDateParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 912
    invoke-direct {p0, p1}, Lorg/apache/commons/lang3/time/FastDateParser$NumberStrategy;-><init>(I)V

    return-void
.end method


# virtual methods
.method modify(I)I
    .registers 3
    .param p1, "iValue"    # I

    .prologue
    .line 915
    const/16 v0, 0x18

    if-ne p1, v0, :cond_5

    const/4 p1, 0x0

    .end local p1    # "iValue":I
    :cond_5
    return p1
.end method
