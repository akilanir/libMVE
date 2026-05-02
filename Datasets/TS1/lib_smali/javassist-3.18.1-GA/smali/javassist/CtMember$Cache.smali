.class Ljavassist/CtMember$Cache;
.super Ljavassist/CtMember;
.source "CtMember.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtMember;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Cache"
.end annotation


# instance fields
.field private consTail:Ljavassist/CtMember;

.field private fieldTail:Ljavassist/CtMember;

.field private methodTail:Ljavassist/CtMember;


# direct methods
.method constructor <init>(Ljavassist/CtClassType;)V
    .registers 3
    .param p1, "decl"    # Ljavassist/CtClassType;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Ljavassist/CtMember;-><init>(Ljavassist/CtClass;)V

    .line 54
    iput-object p0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    .line 55
    iput-object p0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    .line 56
    iput-object p0, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    .line 57
    iget-object v0, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    iput-object p0, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 58
    return-void
.end method

.method static count(Ljavassist/CtMember;Ljavassist/CtMember;)I
    .registers 3
    .param p0, "head"    # Ljavassist/CtMember;
    .param p1, "tail"    # Ljavassist/CtMember;

    .prologue
    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, "n":I
    :goto_1
    if-eq p0, p1, :cond_8

    .line 99
    add-int/lit8 v0, v0, 0x1

    .line 100
    iget-object p0, p0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    goto :goto_1

    .line 103
    :cond_8
    return v0
.end method


# virtual methods
.method addConstructor(Ljavassist/CtMember;)V
    .registers 4
    .param p1, "cons"    # Ljavassist/CtMember;

    .prologue
    .line 82
    iget-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    iget-object v0, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    iput-object v0, p1, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 83
    iget-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    iput-object p1, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 84
    iget-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    iget-object v1, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    if-ne v0, v1, :cond_12

    .line 85
    iput-object p1, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    .line 87
    :cond_12
    iput-object p1, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    .line 88
    return-void
.end method

.method addField(Ljavassist/CtMember;)V
    .registers 3
    .param p1, "field"    # Ljavassist/CtMember;

    .prologue
    .line 91
    iput-object p0, p1, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 92
    iget-object v0, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    iput-object p1, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 93
    iput-object p1, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    .line 94
    return-void
.end method

.method addMethod(Ljavassist/CtMember;)V
    .registers 4
    .param p1, "method"    # Ljavassist/CtMember;

    .prologue
    .line 68
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    iget-object v0, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    iput-object v0, p1, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 69
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    iput-object p1, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 70
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    iget-object v1, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    if-ne v0, v1, :cond_1a

    .line 71
    iput-object p1, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    .line 72
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    iget-object v1, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    if-ne v0, v1, :cond_1a

    .line 73
    iput-object p1, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    .line 76
    :cond_1a
    iput-object p1, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    .line 77
    return-void
.end method

.method consHead()Ljavassist/CtMember;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    return-object v0
.end method

.method protected extendToString(Ljava/lang/StringBuffer;)V
    .registers 2
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 32
    return-void
.end method

.method fieldHead()Ljavassist/CtMember;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "clz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAnnotations()[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)[B
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAvailableAnnotations()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGenericSignature()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    const/4 v0, 0x0

    return-object v0
.end method

.method public getModifiers()I
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasAnnotation(Ljava/lang/Class;)Z
    .registers 3
    .param p1, "clz"    # Ljava/lang/Class;

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method lastCons()Ljavassist/CtMember;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    return-object v0
.end method

.method lastField()Ljavassist/CtMember;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    return-object v0
.end method

.method lastMethod()Ljavassist/CtMember;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    return-object v0
.end method

.method methodHead()Ljavassist/CtMember;
    .registers 1

    .prologue
    .line 60
    return-object p0
.end method

.method remove(Ljavassist/CtMember;)V
    .registers 5
    .param p1, "mem"    # Ljavassist/CtMember;

    .prologue
    .line 107
    move-object v0, p0

    .line 109
    .local v0, "m":Ljavassist/CtMember;
    :goto_1
    iget-object v1, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .local v1, "node":Ljavassist/CtMember;
    if-eq v1, p0, :cond_1d

    .line 110
    if-ne v1, p1, :cond_1e

    .line 111
    iget-object v2, v1, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    iput-object v2, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    .line 112
    iget-object v2, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    if-ne v1, v2, :cond_11

    .line 113
    iput-object v0, p0, Ljavassist/CtMember$Cache;->methodTail:Ljavassist/CtMember;

    .line 115
    :cond_11
    iget-object v2, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    if-ne v1, v2, :cond_17

    .line 116
    iput-object v0, p0, Ljavassist/CtMember$Cache;->consTail:Ljavassist/CtMember;

    .line 118
    :cond_17
    iget-object v2, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    if-ne v1, v2, :cond_1d

    .line 119
    iput-object v0, p0, Ljavassist/CtMember$Cache;->fieldTail:Ljavassist/CtMember;

    .line 126
    :cond_1d
    return-void

    .line 124
    :cond_1e
    iget-object v0, v0, Ljavassist/CtMember;->next:Ljavassist/CtMember;

    goto :goto_1
.end method

.method public setAttribute(Ljava/lang/String;[B)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 43
    return-void
.end method

.method public setGenericSignature(Ljava/lang/String;)V
    .registers 2
    .param p1, "sig"    # Ljava/lang/String;

    .prologue
    .line 46
    return-void
.end method

.method public setModifiers(I)V
    .registers 2
    .param p1, "mod"    # I

    .prologue
    .line 44
    return-void
.end method
