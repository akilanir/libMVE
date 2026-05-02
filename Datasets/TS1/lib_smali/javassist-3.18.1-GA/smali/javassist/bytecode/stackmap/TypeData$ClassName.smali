.class public Ljavassist/bytecode/stackmap/TypeData$ClassName;
.super Ljavassist/bytecode/stackmap/TypeData;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClassName"
.end annotation


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 676
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData;-><init>()V

    .line 677
    iput-object p1, p0, Ljavassist/bytecode/stackmap/TypeData$ClassName;->name:Ljava/lang/String;

    .line 678
    return-void
.end method


# virtual methods
.method public eq(Ljavassist/bytecode/stackmap/TypeData;)Z
    .registers 4
    .param p1, "d"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 694
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ClassName;->name:Ljava/lang/String;

    invoke-virtual {p1}, Ljavassist/bytecode/stackmap/TypeData;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 681
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ClassName;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 691
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$ClassName;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 688
    const/4 v0, 0x7

    return v0
.end method

.method public is2WordType()Z
    .registers 2

    .prologue
    .line 686
    const/4 v0, 0x0

    return v0
.end method

.method public isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;
    .registers 2

    .prologue
    .line 684
    const/4 v0, 0x0

    return-object v0
.end method

.method public setType(Ljava/lang/String;Ljavassist/ClassPool;)V
    .registers 3
    .param p1, "typeName"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 696
    return-void
.end method
