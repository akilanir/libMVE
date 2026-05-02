.class public Ljavassist/bytecode/SignatureAttribute$MethodSignature;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MethodSignature"
.end annotation


# instance fields
.field exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

.field params:[Ljavassist/bytecode/SignatureAttribute$Type;

.field retType:Ljavassist/bytecode/SignatureAttribute$Type;

.field typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;


# direct methods
.method public constructor <init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;[Ljavassist/bytecode/SignatureAttribute$Type;Ljavassist/bytecode/SignatureAttribute$Type;[Ljavassist/bytecode/SignatureAttribute$ObjectType;)V
    .registers 7
    .param p1, "tp"    # [Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .param p2, "params"    # [Ljavassist/bytecode/SignatureAttribute$Type;
    .param p3, "ret"    # Ljavassist/bytecode/SignatureAttribute$Type;
    .param p4, "ex"    # [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .prologue
    const/4 v1, 0x0

    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    if-nez p1, :cond_8

    new-array p1, v1, [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .end local p1    # "tp":[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    :cond_8
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .line 282
    if-nez p2, :cond_e

    new-array p2, v1, [Ljavassist/bytecode/SignatureAttribute$Type;

    .end local p2    # "params":[Ljavassist/bytecode/SignatureAttribute$Type;
    :cond_e
    iput-object p2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->params:[Ljavassist/bytecode/SignatureAttribute$Type;

    .line 283
    if-nez p3, :cond_19

    new-instance p3, Ljavassist/bytecode/SignatureAttribute$BaseType;

    .end local p3    # "ret":Ljavassist/bytecode/SignatureAttribute$Type;
    const-string v0, "void"

    invoke-direct {p3, v0}, Ljavassist/bytecode/SignatureAttribute$BaseType;-><init>(Ljava/lang/String;)V

    :cond_19
    iput-object p3, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->retType:Ljavassist/bytecode/SignatureAttribute$Type;

    .line 284
    if-nez p4, :cond_1f

    new-array p4, v1, [Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .end local p4    # "ex":[Ljavassist/bytecode/SignatureAttribute$ObjectType;
    :cond_1f
    iput-object p4, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    .line 285
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .registers 4

    .prologue
    .line 337
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 338
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    array-length v2, v2

    if-lez v2, :cond_24

    .line 339
    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 340
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    array-length v2, v2

    if-ge v0, v2, :cond_1f

    .line 341
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->encode(Ljava/lang/StringBuffer;)V

    .line 340
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 343
    :cond_1f
    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 346
    .end local v0    # "i":I
    :cond_24
    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 347
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2a
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->params:[Ljavassist/bytecode/SignatureAttribute$Type;

    array-length v2, v2

    if-ge v0, v2, :cond_39

    .line 348
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->params:[Ljavassist/bytecode/SignatureAttribute$Type;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$Type;->encode(Ljava/lang/StringBuffer;)V

    .line 347
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 350
    :cond_39
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 351
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->retType:Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$Type;->encode(Ljava/lang/StringBuffer;)V

    .line 352
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    array-length v2, v2

    if-lez v2, :cond_5d

    .line 353
    const/4 v0, 0x0

    :goto_49
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    array-length v2, v2

    if-ge v0, v2, :cond_5d

    .line 354
    const/16 v2, 0x5e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 355
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$ObjectType;->encode(Ljava/lang/StringBuffer;)V

    .line 353
    add-int/lit8 v0, v0, 0x1

    goto :goto_49

    .line 358
    :cond_5d
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getExceptionTypes()[Ljavassist/bytecode/SignatureAttribute$ObjectType;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    return-object v0
.end method

.method public getParameterTypes()[Ljavassist/bytecode/SignatureAttribute$Type;
    .registers 2

    .prologue
    .line 299
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->params:[Ljavassist/bytecode/SignatureAttribute$Type;

    return-object v0
.end method

.method public getReturnType()Ljavassist/bytecode/SignatureAttribute$Type;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->retType:Ljavassist/bytecode/SignatureAttribute$Type;

    return-object v0
.end method

.method public getTypeParameters()[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 318
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 320
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->typeParams:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    invoke-static {v0, v1}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$TypeParameter;)V

    .line 321
    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->params:[Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-static {v0, v1}, Ljavassist/bytecode/SignatureAttribute$Type;->toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$Type;)V

    .line 323
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 324
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->retType:Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 325
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    array-length v1, v1

    if-lez v1, :cond_2d

    .line 326
    const-string v1, " throws "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 327
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->exceptions:[Ljavassist/bytecode/SignatureAttribute$ObjectType;

    invoke-static {v0, v1}, Ljavassist/bytecode/SignatureAttribute$Type;->toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$Type;)V

    .line 330
    :cond_2d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
