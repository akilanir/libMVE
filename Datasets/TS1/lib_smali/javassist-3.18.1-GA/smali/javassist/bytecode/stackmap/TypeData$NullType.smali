.class public Ljavassist/bytecode/stackmap/TypeData$NullType;
.super Ljavassist/bytecode/stackmap/TypeData$ClassName;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NullType"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 706
    const-string v0, "null-type"

    invoke-direct {p0, v0}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    .line 707
    return-void
.end method


# virtual methods
.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 714
    const/4 v0, 0x0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 710
    const/4 v0, 0x5

    return v0
.end method

.method public isNullType()Z
    .registers 2

    .prologue
    .line 713
    const/4 v0, 0x1

    return v0
.end method
