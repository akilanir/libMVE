.class final Ljavassist/CtArray;
.super Ljavassist/CtClass;
.source "CtArray.java"


# instance fields
.field private interfaces:[Ljavassist/CtClass;

.field protected pool:Ljavassist/ClassPool;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Ljavassist/CtClass;-><init>(Ljava/lang/String;)V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CtArray;->interfaces:[Ljavassist/CtClass;

    .line 28
    iput-object p2, p0, Ljavassist/CtArray;->pool:Ljavassist/ClassPool;

    .line 29
    return-void
.end method


# virtual methods
.method public getClassPool()Ljavassist/ClassPool;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Ljavassist/CtArray;->pool:Ljavassist/ClassPool;

    return-object v0
.end method

.method public getComponentType()Ljavassist/CtClass;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Ljavassist/CtArray;->getName()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/CtArray;->pool:Ljavassist/ClassPool;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    return-object v1
.end method

.method public getConstructors()[Ljavassist/CtConstructor;
    .registers 3

    .prologue
    .line 107
    :try_start_0
    invoke-virtual {p0}, Ljavassist/CtArray;->getSuperclass()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getConstructors()[Ljavassist/CtConstructor;
    :try_end_7
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 110
    :goto_8
    return-object v1

    .line 109
    :catch_9
    move-exception v0

    .line 110
    .local v0, "e":Ljavassist/NotFoundException;
    invoke-super {p0}, Ljavassist/CtClass;->getConstructors()[Ljavassist/CtConstructor;

    move-result-object v1

    goto :goto_8
.end method

.method public getInterfaces()[Ljavassist/CtClass;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v2, p0, Ljavassist/CtArray;->interfaces:[Ljavassist/CtClass;

    if-nez v2, :cond_26

    .line 53
    const-class v2, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 56
    .local v1, "intfs":[Ljava/lang/Class;
    array-length v2, v1

    new-array v2, v2, [Ljavassist/CtClass;

    iput-object v2, p0, Ljavassist/CtArray;->interfaces:[Ljavassist/CtClass;

    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, v1

    if-ge v0, v2, :cond_26

    .line 58
    iget-object v2, p0, Ljavassist/CtArray;->interfaces:[Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/CtArray;->pool:Ljavassist/ClassPool;

    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    aput-object v3, v2, v0

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 61
    .end local v0    # "i":I
    .end local v1    # "intfs":[Ljava/lang/Class;
    :cond_26
    iget-object v2, p0, Ljavassist/CtArray;->interfaces:[Ljavassist/CtClass;

    return-object v2
.end method

.method public getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0}, Ljavassist/CtArray;->getSuperclass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljavassist/CtClass;->getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public getMethods()[Ljavassist/CtMethod;
    .registers 3

    .prologue
    .line 92
    :try_start_0
    invoke-virtual {p0}, Ljavassist/CtArray;->getSuperclass()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getMethods()[Ljavassist/CtMethod;
    :try_end_7
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 95
    :goto_8
    return-object v1

    .line 94
    :catch_9
    move-exception v0

    .line 95
    .local v0, "e":Ljavassist/NotFoundException;
    invoke-super {p0}, Ljavassist/CtClass;->getMethods()[Ljavassist/CtMethod;

    move-result-object v1

    goto :goto_8
.end method

.method public getModifiers()I
    .registers 3

    .prologue
    .line 42
    const/16 v0, 0x10

    .line 44
    .local v0, "mod":I
    :try_start_2
    invoke-virtual {p0}, Ljavassist/CtArray;->getComponentType()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getModifiers()I
    :try_end_9
    .catch Ljavassist/NotFoundException; {:try_start_2 .. :try_end_9} :catch_e

    move-result v1

    and-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    .line 48
    :goto_d
    return v0

    .line 47
    :catch_e
    move-exception v1

    goto :goto_d
.end method

.method public getSuperclass()Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/CtArray;->pool:Ljavassist/ClassPool;

    const-string v1, "java.lang.Object"

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x1

    return v0
.end method

.method public subtypeOf(Ljavassist/CtClass;)Z
    .registers 8
    .param p1, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 65
    invoke-super {p0, p1}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 77
    :cond_7
    :goto_7
    return v3

    .line 68
    :cond_8
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "cname":Ljava/lang/String;
    const-string v4, "java.lang.Object"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 72
    invoke-virtual {p0}, Ljavassist/CtArray;->getInterfaces()[Ljavassist/CtClass;

    move-result-object v2

    .line 73
    .local v2, "intfs":[Ljavassist/CtClass;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v4, v2

    if-ge v1, v4, :cond_27

    .line 74
    aget-object v4, v2, v1

    invoke-virtual {v4, p1}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 77
    :cond_27
    invoke-virtual {p1}, Ljavassist/CtClass;->isArray()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-virtual {p0}, Ljavassist/CtArray;->getComponentType()Ljavassist/CtClass;

    move-result-object v4

    invoke-virtual {p1}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_7

    :cond_3b
    const/4 v3, 0x0

    goto :goto_7
.end method
