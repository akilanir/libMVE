.class public interface abstract Ljavassist/bytecode/stackmap/TypeTag;
.super Ljava/lang/Object;
.source "TypeTag.java"


# static fields
.field public static final DOUBLE:Ljavassist/bytecode/stackmap/TypeData;

.field public static final FLOAT:Ljavassist/bytecode/stackmap/TypeData;

.field public static final INTEGER:Ljavassist/bytecode/stackmap/TypeData;

.field public static final LONG:Ljavassist/bytecode/stackmap/TypeData;

.field public static final TOP:Ljavassist/bytecode/stackmap/TypeData;

.field public static final TOP_TYPE:Ljava/lang/String; = "*top*"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 23
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    const-string v1, "*top*"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$BasicType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljavassist/bytecode/stackmap/TypeTag;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    .line 24
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    const-string v1, "int"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$BasicType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljavassist/bytecode/stackmap/TypeTag;->INTEGER:Ljavassist/bytecode/stackmap/TypeData;

    .line 25
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    const-string v1, "float"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$BasicType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljavassist/bytecode/stackmap/TypeTag;->FLOAT:Ljavassist/bytecode/stackmap/TypeData;

    .line 26
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    const-string v1, "double"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$BasicType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljavassist/bytecode/stackmap/TypeTag;->DOUBLE:Ljavassist/bytecode/stackmap/TypeData;

    .line 27
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    const-string v1, "long"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$BasicType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljavassist/bytecode/stackmap/TypeTag;->LONG:Ljavassist/bytecode/stackmap/TypeData;

    return-void
.end method
