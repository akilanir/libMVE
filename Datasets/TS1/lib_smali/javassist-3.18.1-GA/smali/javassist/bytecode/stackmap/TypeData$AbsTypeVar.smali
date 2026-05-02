.class public abstract Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
.super Ljavassist/bytecode/stackmap/TypeData;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AbsTypeVar"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 142
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData;-><init>()V

    return-void
.end method


# virtual methods
.method public eq(Ljavassist/bytecode/stackmap/TypeData;)Z
    .registers 4
    .param p1, "d"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 150
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/bytecode/stackmap/TypeData;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 147
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 144
    const/4 v0, 0x7

    return v0
.end method

.method public abstract merge(Ljavassist/bytecode/stackmap/TypeData;)V
.end method
