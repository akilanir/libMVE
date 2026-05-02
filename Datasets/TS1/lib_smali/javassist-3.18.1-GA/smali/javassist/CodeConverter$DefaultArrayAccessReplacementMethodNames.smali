.class public Ljavassist/CodeConverter$DefaultArrayAccessReplacementMethodNames;
.super Ljava/lang/Object;
.source "CodeConverter.java"

# interfaces
.implements Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CodeConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultArrayAccessReplacementMethodNames"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 661
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public byteOrBooleanRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 670
    const-string v0, "arrayReadByteOrBoolean"

    return-object v0
.end method

.method public byteOrBooleanWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 679
    const-string v0, "arrayWriteByteOrBoolean"

    return-object v0
.end method

.method public charRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 688
    const-string v0, "arrayReadChar"

    return-object v0
.end method

.method public charWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 697
    const-string v0, "arrayWriteChar"

    return-object v0
.end method

.method public doubleRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 706
    const-string v0, "arrayReadDouble"

    return-object v0
.end method

.method public doubleWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 715
    const-string v0, "arrayWriteDouble"

    return-object v0
.end method

.method public floatRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 724
    const-string v0, "arrayReadFloat"

    return-object v0
.end method

.method public floatWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 733
    const-string v0, "arrayWriteFloat"

    return-object v0
.end method

.method public intRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 742
    const-string v0, "arrayReadInt"

    return-object v0
.end method

.method public intWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 751
    const-string v0, "arrayWriteInt"

    return-object v0
.end method

.method public longRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 760
    const-string v0, "arrayReadLong"

    return-object v0
.end method

.method public longWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 769
    const-string v0, "arrayWriteLong"

    return-object v0
.end method

.method public objectRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 778
    const-string v0, "arrayReadObject"

    return-object v0
.end method

.method public objectWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 787
    const-string v0, "arrayWriteObject"

    return-object v0
.end method

.method public shortRead()Ljava/lang/String;
    .registers 2

    .prologue
    .line 796
    const-string v0, "arrayReadShort"

    return-object v0
.end method

.method public shortWrite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 805
    const-string v0, "arrayWriteShort"

    return-object v0
.end method
