.class public Ljavassist/bytecode/SignatureAttribute$ClassSignature;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClassSignature"
.end annotation


# instance fields
.field interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

.field params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

.field superClass:Ljavassist/bytecode/SignatureAttribute$ClassType;


# direct methods
.method public constructor <init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;)V
    .registers 3
    .param p1, "p"    # [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .prologue
    const/4 v0, 0x0

    .line 201
    invoke-direct {p0, p1, v0, v0}, Ljavassist/bytecode/SignatureAttribute$ClassSignature;-><init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;Ljavassist/bytecode/SignatureAttribute$ClassType;[Ljavassist/bytecode/SignatureAttribute$ClassType;)V

    .line 202
    return-void
.end method

.method public constructor <init>([Ljavassist/bytecode/SignatureAttribute$TypeParameter;Ljavassist/bytecode/SignatureAttribute$ClassType;[Ljavassist/bytecode/SignatureAttribute$ClassType;)V
    .registers 5
    .param p1, "params"    # [Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .param p2, "superClass"    # Ljavassist/bytecode/SignatureAttribute$ClassType;
    .param p3, "interfaces"    # [Ljavassist/bytecode/SignatureAttribute$ClassType;

    .prologue
    const/4 v0, 0x0

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    if-nez p1, :cond_8

    new-array p1, v0, [Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .end local p1    # "params":[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    :cond_8
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    .line 191
    if-nez p2, :cond_e

    sget-object p2, Ljavassist/bytecode/SignatureAttribute$ClassType;->OBJECT:Ljavassist/bytecode/SignatureAttribute$ClassType;

    .end local p2    # "superClass":Ljavassist/bytecode/SignatureAttribute$ClassType;
    :cond_e
    iput-object p2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->superClass:Ljavassist/bytecode/SignatureAttribute$ClassType;

    .line 192
    if-nez p3, :cond_14

    new-array p3, v0, [Ljavassist/bytecode/SignatureAttribute$ClassType;

    .end local p3    # "interfaces":[Ljavassist/bytecode/SignatureAttribute$ClassType;
    :cond_14
    iput-object p3, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    .line 193
    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .registers 4

    .prologue
    .line 245
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 246
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    array-length v2, v2

    if-lez v2, :cond_24

    .line 247
    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 248
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    array-length v2, v2

    if-ge v0, v2, :cond_1f

    .line 249
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->encode(Ljava/lang/StringBuffer;)V

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 251
    :cond_1f
    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 254
    .end local v0    # "i":I
    :cond_24
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->superClass:Ljavassist/bytecode/SignatureAttribute$ClassType;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$ClassType;->encode(Ljava/lang/StringBuffer;)V

    .line 255
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2a
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    array-length v2, v2

    if-ge v0, v2, :cond_39

    .line 256
    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljavassist/bytecode/SignatureAttribute$ClassType;->encode(Ljava/lang/StringBuffer;)V

    .line 255
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 258
    :cond_39
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getInterfaces()[Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    return-object v0
.end method

.method public getParameters()[Ljavassist/bytecode/SignatureAttribute$TypeParameter;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    return-object v0
.end method

.method public getSuperClass()Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->superClass:Ljavassist/bytecode/SignatureAttribute$ClassType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 229
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 231
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->params:[Ljavassist/bytecode/SignatureAttribute$TypeParameter;

    invoke-static {v0, v1}, Ljavassist/bytecode/SignatureAttribute$TypeParameter;->toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$TypeParameter;)V

    .line 232
    const-string v1, " extends "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->superClass:Ljavassist/bytecode/SignatureAttribute$ClassType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 233
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    array-length v1, v1

    if-lez v1, :cond_24

    .line 234
    const-string v1, " implements "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 235
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->interfaces:[Ljavassist/bytecode/SignatureAttribute$ClassType;

    invoke-static {v0, v1}, Ljavassist/bytecode/SignatureAttribute$Type;->toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$Type;)V

    .line 238
    :cond_24
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
