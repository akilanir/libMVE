.class public final Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ConstPoolWriter"
.end annotation


# instance fields
.field protected num:I

.field output:Ljavassist/bytecode/ByteStream;

.field protected startPos:I


# direct methods
.method constructor <init>(Ljavassist/bytecode/ByteStream;)V
    .registers 4
    .param p1, "out"    # Ljavassist/bytecode/ByteStream;

    .prologue
    const/4 v1, 0x1

    .line 526
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 527
    iput-object p1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    .line 528
    invoke-virtual {p1}, Ljavassist/bytecode/ByteStream;->getPos()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->startPos:I

    .line 529
    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    .line 530
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 531
    return-void
.end method


# virtual methods
.method public addClassInfo(I)I
    .registers 4
    .param p1, "name"    # I

    .prologue
    .line 571
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 572
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 573
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addClassInfo(Ljava/lang/String;)I
    .registers 5
    .param p1, "jvmname"    # Ljava/lang/String;

    .prologue
    .line 558
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 559
    .local v0, "utf8":I
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 560
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 561
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v1
.end method

.method public addClassInfo([Ljava/lang/String;)[I
    .registers 6
    .param p1, "classNames"    # [Ljava/lang/String;

    .prologue
    .line 539
    array-length v1, p1

    .line 540
    .local v1, "n":I
    new-array v2, v1, [I

    .line 541
    .local v2, "result":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_11

    .line 542
    aget-object v3, p1, v0

    invoke-virtual {p0, v3}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addClassInfo(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v0

    .line 541
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 544
    :cond_11
    return-object v2
.end method

.method public addDoubleInfo(D)I
    .registers 6
    .param p1, "d"    # D

    .prologue
    .line 757
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 758
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, p1, p2}, Ljavassist/bytecode/ByteStream;->writeDouble(D)V

    .line 759
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    .line 760
    .local v0, "n":I
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    .line 761
    return v0
.end method

.method public addFieldrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 609
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 610
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 611
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 612
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addFloatInfo(F)I
    .registers 4
    .param p1, "f"    # F

    .prologue
    .line 731
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 732
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeFloat(F)V

    .line 733
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addIntegerInfo(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 719
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 720
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 721
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addInterfaceMethodrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 639
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 640
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 641
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 642
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addInvokeDynamicInfo(II)I
    .registers 5
    .param p1, "bootstrap"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 690
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 691
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 692
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 693
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addLongInfo(J)I
    .registers 6
    .param p1, "l"    # J

    .prologue
    .line 743
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 744
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, p1, p2}, Ljavassist/bytecode/ByteStream;->writeLong(J)V

    .line 745
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    .line 746
    .local v0, "n":I
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    .line 747
    return v0
.end method

.method public addMethodHandleInfo(II)I
    .registers 5
    .param p1, "kind"    # I
    .param p2, "index"    # I

    .prologue
    .line 657
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 658
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 659
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 660
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addMethodTypeInfo(I)I
    .registers 4
    .param p1, "desc"    # I

    .prologue
    .line 673
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 674
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 675
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addMethodrefInfo(II)I
    .registers 5
    .param p1, "classInfo"    # I
    .param p2, "nameAndTypeInfo"    # I

    .prologue
    .line 623
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 624
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 625
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 626
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addNameAndTypeInfo(II)I
    .registers 5
    .param p1, "name"    # I
    .param p2, "type"    # I

    .prologue
    .line 595
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 596
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 597
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 598
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method public addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 584
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, p2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addNameAndTypeInfo(II)I

    move-result v0

    return v0
.end method

.method public addStringInfo(Ljava/lang/String;)I
    .registers 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 706
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 707
    .local v0, "utf8":I
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 708
    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 709
    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v1
.end method

.method public addUtf8Info(Ljava/lang/String;)I
    .registers 4
    .param p1, "utf8"    # Ljava/lang/String;

    .prologue
    .line 771
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->write(I)V

    .line 772
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeUTF(Ljava/lang/String;)V

    .line 773
    iget v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    return v0
.end method

.method end()V
    .registers 4

    .prologue
    .line 780
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->output:Ljavassist/bytecode/ByteStream;

    iget v1, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->startPos:I

    iget v2, p0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->num:I

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/ByteStream;->writeShort(II)V

    .line 781
    return-void
.end method
