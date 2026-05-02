.class public Ljavassist/bytecode/SignatureAttribute$TypeParameter;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TypeParameter"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

.field superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 402
    invoke-direct {p0, p1, v0, v0}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;-><init>(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$ObjectType;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V

    .line 403
    return-void
.end method

.method constructor <init>(Ljava/lang/String;IILjavassist/bytecode/SignatureAttribute$ObjectType;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V
    .registers 7
    .param p1, "sig"    # Ljava/lang/String;
    .param p2, "nb"    # I
    .param p3, "ne"    # I
    .param p4, "sc"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .param p5, "si"    # [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    .line 372
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 373
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->name:Ljava/lang/String;

    .line 374
    iput-object p4, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 375
    iput-object p5, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 376
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavassist/bytecode/SignatureAttribute$ObjectType;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "superClass"    # Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .param p3, "superInterfaces"    # [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    .line 386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 387
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->name:Ljava/lang/String;

    .line 388
    iput-object p2, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 389
    if-nez p3, :cond_f

    .line 390
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    iput-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 393
    :goto_e
    return-void

    .line 392
    :cond_f
    iput-object p3, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    goto :goto_e
.end method

.method static toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$TypeParameter;)V
    .registers 4
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "tp"    # [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .prologue
    .line 448
    const/16 v1, 0x3c

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 449
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v1, p1

    if-ge v0, v1, :cond_18

    .line 450
    if-lez v0, :cond_10

    .line 451
    const-string v1, ", "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 453
    :cond_10
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 449
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 456
    :cond_18
    const/16 v1, 0x3e

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 457
    return-void
.end method


# virtual methods
.method encode(Ljava/lang/StringBuffer;)V
    .registers 5
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v2, 0x3a

    .line 460
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 461
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    if-nez v1, :cond_23

    .line 462
    const-string v1, ":Ljava/lang/Object;"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 468
    :goto_10
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    array-length v1, v1

    if-ge v0, v1, :cond_2c

    .line 469
    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 470
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljavassist/bytecode/SignatureAttribute$ObjectType;->encode(Ljava/lang/StringBuffer;)V

    .line 468
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 464
    .end local v0    # "i":I
    :cond_23
    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 465
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/SignatureAttribute$ObjectType;->encode(Ljava/lang/StringBuffer;)V

    goto :goto_10

    .line 472
    .restart local v0    # "i":I
    :cond_2c
    return-void
.end method

.method public getClassBound()Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 2

    .prologue
    .line 415
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    return-object v0
.end method

.method public getInterfaceBound()[Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 2

    .prologue
    .line 422
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->name:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 428
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 429
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    iget-object v3, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    if-eqz v3, :cond_1c

    .line 430
    const-string v3, " extends "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 432
    :cond_1c
    iget-object v3, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    array-length v1, v3

    .line 433
    .local v1, "len":I
    if-lez v1, :cond_43

    .line 434
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    if-ge v0, v1, :cond_43

    .line 435
    if-gtz v0, :cond_2a

    iget-object v3, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superClass:Ljavassist/bytecode/SignatureAttribute$ObjectType;

    if-eqz v3, :cond_3d

    .line 436
    :cond_2a
    const-string v3, " & "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 440
    :goto_2f
    iget-object v3, p0, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->superInterfaces:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 434
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 438
    :cond_3d
    const-string v3, " extends "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f

    .line 444
    .end local v0    # "i":I
    :cond_43
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
