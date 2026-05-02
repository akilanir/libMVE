.class Ljavassist/bytecode/InterfaceMethodrefInfo;
.super Ljavassist/bytecode/MemberrefInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0xb


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "cindex"    # I
    .param p2, "ntindex"    # I
    .param p3, "thisIndex"    # I

    .prologue
    .line 1584
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/MemberrefInfo;-><init>(III)V

    .line 1585
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;I)V
    .registers 3
    .param p1, "in"    # Ljava/io/DataInputStream;
    .param p2, "thisIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1588
    invoke-direct {p0, p1, p2}, Ljavassist/bytecode/MemberrefInfo;-><init>(Ljava/io/DataInputStream;I)V

    .line 1589
    return-void
.end method


# virtual methods
.method protected copy2(Ljavassist/bytecode/ConstPool;II)I
    .registers 5
    .param p1, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p2, "cindex"    # I
    .param p3, "ntindex"    # I

    .prologue
    .line 1596
    invoke-virtual {p1, p2, p3}, Ljavassist/bytecode/ConstPool;->addInterfaceMethodrefInfo(II)I

    move-result v0

    return v0
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1591
    const/16 v0, 0xb

    return v0
.end method

.method public getTagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1593
    const-string v0, "Interface"

    return-object v0
.end method
