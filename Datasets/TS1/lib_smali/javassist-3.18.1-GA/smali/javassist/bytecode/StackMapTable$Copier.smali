.class Ljavassist/bytecode/StackMapTable$Copier;
.super Ljavassist/bytecode/StackMapTable$SimpleCopy;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Copier"
.end annotation


# instance fields
.field private classnames:Ljava/util/Map;

.field private destPool:Ljavassist/bytecode/ConstPool;

.field private srcPool:Ljavassist/bytecode/ConstPool;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "data"    # [B
    .param p3, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p4, "names"    # Ljava/util/Map;

    .prologue
    .line 419
    invoke-direct {p0, p2}, Ljavassist/bytecode/StackMapTable$SimpleCopy;-><init>([B)V

    .line 420
    iput-object p1, p0, Ljavassist/bytecode/StackMapTable$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    .line 421
    iput-object p3, p0, Ljavassist/bytecode/StackMapTable$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    .line 422
    iput-object p4, p0, Ljavassist/bytecode/StackMapTable$Copier;->classnames:Ljava/util/Map;

    .line 423
    return-void
.end method


# virtual methods
.method protected copyData(II)I
    .registers 6
    .param p1, "tag"    # I
    .param p2, "data"    # I

    .prologue
    .line 426
    const/4 v0, 0x7

    if-ne p1, v0, :cond_d

    .line 427
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    iget-object v2, p0, Ljavassist/bytecode/StackMapTable$Copier;->classnames:Ljava/util/Map;

    invoke-virtual {v0, p2, v1, v2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result p2

    .line 429
    .end local p2    # "data":I
    :cond_d
    return p2
.end method

.method protected copyData([I[I)[I
    .registers 9
    .param p1, "tags"    # [I
    .param p2, "data"    # [I

    .prologue
    .line 433
    array-length v2, p2

    new-array v1, v2, [I

    .line 434
    .local v1, "newData":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p2

    if-ge v0, v2, :cond_22

    .line 435
    aget v2, p1, v0

    const/4 v3, 0x7

    if-ne v2, v3, :cond_1d

    .line 436
    iget-object v2, p0, Ljavassist/bytecode/StackMapTable$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    aget v3, p2, v0

    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    iget-object v5, p0, Ljavassist/bytecode/StackMapTable$Copier;->classnames:Ljava/util/Map;

    invoke-virtual {v2, v3, v4, v5}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v2

    aput v2, v1, v0

    .line 434
    :goto_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 438
    :cond_1d
    aget v2, p2, v0

    aput v2, v1, v0

    goto :goto_1a

    .line 440
    :cond_22
    return-object v1
.end method
