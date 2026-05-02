.class Ljavassist/bytecode/StackMapTable$OffsetShifter;
.super Ljavassist/bytecode/StackMapTable$Walker;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OffsetShifter"
.end annotation


# instance fields
.field gap:I

.field where:I


# direct methods
.method public constructor <init>(Ljavassist/bytecode/StackMapTable;II)V
    .registers 4
    .param p1, "smt"    # Ljavassist/bytecode/StackMapTable;
    .param p2, "where"    # I
    .param p3, "gap"    # I

    .prologue
    .line 815
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$Walker;-><init>(Ljavassist/bytecode/StackMapTable;)V

    .line 816
    iput p2, p0, Ljavassist/bytecode/StackMapTable$OffsetShifter;->where:I

    .line 817
    iput p3, p0, Ljavassist/bytecode/StackMapTable$OffsetShifter;->gap:I

    .line 818
    return-void
.end method


# virtual methods
.method public objectOrUninitialized(III)V
    .registers 6
    .param p1, "tag"    # I
    .param p2, "data"    # I
    .param p3, "pos"    # I

    .prologue
    .line 821
    const/16 v0, 0x8

    if-ne p1, v0, :cond_10

    .line 822
    iget v0, p0, Ljavassist/bytecode/StackMapTable$OffsetShifter;->where:I

    if-gt v0, p2, :cond_10

    .line 823
    iget v0, p0, Ljavassist/bytecode/StackMapTable$OffsetShifter;->gap:I

    add-int/2addr v0, p2

    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$OffsetShifter;->info:[B

    invoke-static {v0, v1, p3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 824
    :cond_10
    return-void
.end method
