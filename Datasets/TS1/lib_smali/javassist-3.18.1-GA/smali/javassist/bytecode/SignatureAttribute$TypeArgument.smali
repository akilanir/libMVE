.class public Ljavassist/bytecode/SignatureAttribute$TypeArgument;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TypeArgument"
.end annotation


# instance fields
.field arg:Ljavassist/bytecode/SignatureAttribute$ObjectType;

.field wildcard:C


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 504
    const/4 v0, 0x0

    const/16 v1, 0x2a

    invoke-direct {p0, v0, v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    .line 505
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;)V
    .registers 3
    .param p1, "t"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    .line 497
    const/16 v0, 0x20

    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    .line 498
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V
    .registers 3
    .param p1, "a"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .param p2, "w"    # C

    .prologue
    .line 484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 485
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->arg:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 486
    iput-char p2, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    .line 487
    return-void
.end method

.method static encode(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V
    .registers 5
    .param p0, "sb"    # Ljava/lang/StringBuffer;
    .param p1, "args"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .prologue
    .line 567
    const/16 v2, 0x3c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 568
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v2, p1

    if-ge v0, v2, :cond_26

    .line 569
    aget-object v1, p1, v0

    .line 570
    .local v1, "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    invoke-virtual {v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->isWildcard()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 571
    iget-char v2, v1, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 573
    :cond_16
    invoke-virtual {v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->getType()Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v2

    if-eqz v2, :cond_23

    .line 574
    invoke-virtual {v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->getType()Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;->encode(Ljava/lang/StringBuffer;)V

    .line 568
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 577
    .end local v1    # "ta":Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    :cond_26
    const/16 v2, 0x3e

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 578
    return-void
.end method

.method public static subclassOf(Ljavassist/bytecode/SignatureAttribute$ObjectType;)Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .registers 3
    .param p0, "t"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    .line 514
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    const/16 v1, 0x2b

    invoke-direct {v0, p0, v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    return-object v0
.end method

.method public static superOf(Ljavassist/bytecode/SignatureAttribute$ObjectType;)Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .registers 3
    .param p0, "t"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    .line 524
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    const/16 v1, 0x2d

    invoke-direct {v0, p0, v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;-><init>(Ljavassist/bytecode/SignatureAttribute$ObjectType;C)V

    return-object v0
.end method


# virtual methods
.method public getKind()C
    .registers 2

    .prologue
    .line 533
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    return v0
.end method

.method public getType()Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 2

    .prologue
    .line 548
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->arg:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    return-object v0
.end method

.method public isWildcard()Z
    .registers 3

    .prologue
    .line 539
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 554
    iget-char v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    const/16 v2, 0x2a

    if-ne v1, v2, :cond_9

    .line 555
    const-string v0, "?"

    .line 563
    :cond_8
    :goto_8
    return-object v0

    .line 557
    :cond_9
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->arg:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 558
    .local v0, "type":Ljava/lang/String;
    iget-char v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    const/16 v2, 0x20

    if-eq v1, v2, :cond_8

    .line 560
    iget-char v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->wildcard:C

    const/16 v2, 0x2b

    if-ne v1, v2, :cond_2f

    .line 561
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "? extends "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    .line 563
    :cond_2f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "? super "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method
