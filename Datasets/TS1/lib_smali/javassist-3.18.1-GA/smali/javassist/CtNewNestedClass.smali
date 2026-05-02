.class Ljavassist/CtNewNestedClass;
.super Ljavassist/CtNewClass;
.source "CtNewNestedClass.java"


# direct methods
.method constructor <init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V
    .registers 5
    .param p1, "realName"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "isInterface"    # Z
    .param p4, "superclass"    # Ljavassist/CtClass;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/CtNewClass;-><init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V

    .line 30
    return-void
.end method

.method private static updateInnerEntry(ILjava/lang/String;Ljavassist/CtClass;Z)V
    .registers 15
    .param p0, "mod"    # I
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljavassist/CtClass;
    .param p3, "outer"    # Z

    .prologue
    .line 42
    invoke-virtual {p2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v1

    .line 43
    .local v1, "cf":Ljavassist/bytecode/ClassFile;
    const-string v8, "InnerClasses"

    invoke-virtual {v1, v8}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/InnerClassesAttribute;

    .line 45
    .local v4, "ica":Ljavassist/bytecode/InnerClassesAttribute;
    if-nez v4, :cond_f

    .line 66
    :cond_e
    :goto_e
    return-void

    .line 48
    :cond_f
    invoke-virtual {v4}, Ljavassist/bytecode/InnerClassesAttribute;->tableLength()I

    move-result v5

    .line 49
    .local v5, "n":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_14
    if-ge v3, v5, :cond_e

    .line 50
    invoke-virtual {v4, v3}, Ljavassist/bytecode/InnerClassesAttribute;->innerClass(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5a

    .line 51
    invoke-virtual {v4, v3}, Ljavassist/bytecode/InnerClassesAttribute;->accessFlags(I)I

    move-result v8

    and-int/lit8 v0, v8, 0x8

    .line 52
    .local v0, "acc":I
    or-int v8, p0, v0

    invoke-virtual {v4, v3, v8}, Ljavassist/bytecode/InnerClassesAttribute;->setAccessFlags(II)V

    .line 53
    invoke-virtual {v4, v3}, Ljavassist/bytecode/InnerClassesAttribute;->outerClass(I)Ljava/lang/String;

    move-result-object v6

    .line 54
    .local v6, "outName":Ljava/lang/String;
    if-eqz v6, :cond_e

    if-eqz p3, :cond_e

    .line 56
    :try_start_33
    invoke-virtual {p2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v7

    .line 57
    .local v7, "parent":Ljavassist/CtClass;
    const/4 v8, 0x0

    invoke-static {p0, p1, v7, v8}, Ljavassist/CtNewNestedClass;->updateInnerEntry(ILjava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_3f
    .catch Ljavassist/NotFoundException; {:try_start_33 .. :try_end_3f} :catch_40

    goto :goto_e

    .line 59
    .end local v7    # "parent":Ljavassist/CtClass;
    :catch_40
    move-exception v2

    .line 60
    .local v2, "e":Ljavassist/NotFoundException;
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "cannot find the declaring class: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 49
    .end local v0    # "acc":I
    .end local v2    # "e":Ljavassist/NotFoundException;
    .end local v6    # "outName":Ljava/lang/String;
    :cond_5a
    add-int/lit8 v3, v3, 0x1

    goto :goto_14
.end method


# virtual methods
.method public setModifiers(I)V
    .registers 4
    .param p1, "mod"    # I

    .prologue
    .line 36
    and-int/lit8 p1, p1, -0x9

    .line 37
    invoke-super {p0, p1}, Ljavassist/CtNewClass;->setModifiers(I)V

    .line 38
    invoke-virtual {p0}, Ljavassist/CtNewNestedClass;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p1, v0, p0, v1}, Ljavassist/CtNewNestedClass;->updateInnerEntry(ILjava/lang/String;Ljavassist/CtClass;Z)V

    .line 39
    return-void
.end method
