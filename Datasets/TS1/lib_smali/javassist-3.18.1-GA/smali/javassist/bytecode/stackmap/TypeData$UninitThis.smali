.class public Ljavassist/bytecode/stackmap/TypeData$UninitThis;
.super Ljavassist/bytecode/stackmap/TypeData$UninitData;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UninitThis"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 770
    const/4 v0, -0x1

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/stackmap/TypeData$UninitData;-><init>(ILjava/lang/String;)V

    .line 771
    return-void
.end method


# virtual methods
.method public copy()Ljavassist/bytecode/stackmap/TypeData$UninitData;
    .registers 3

    .prologue
    .line 773
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$UninitThis;

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitThis;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/stackmap/TypeData$UninitThis;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 780
    const/4 v0, 0x0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 776
    const/4 v0, 0x6

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 783
    const-string v0, "uninit:this"

    return-object v0
.end method
