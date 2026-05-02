.class public Ljavassist/bytecode/annotation/AnnotationImpl;
.super Ljava/lang/Object;
.source "AnnotationImpl.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# static fields
.field private static final JDK_ANNOTATION_CLASS_NAME:Ljava/lang/String; = "java.lang.annotation.Annotation"

.field private static JDK_ANNOTATION_TYPE_METHOD:Ljava/lang/reflect/Method;


# instance fields
.field private annotation:Ljavassist/bytecode/annotation/Annotation;

.field private transient annotationType:Ljava/lang/Class;

.field private transient cachedHashCode:I

.field private classLoader:Ljava/lang/ClassLoader;

.field private pool:Ljavassist/ClassPool;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 40
    sput-object v1, Ljavassist/bytecode/annotation/AnnotationImpl;->JDK_ANNOTATION_TYPE_METHOD:Ljava/lang/reflect/Method;

    .line 51
    :try_start_3
    const-string v1, "java.lang.annotation.Annotation"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 52
    .local v0, "clazz":Ljava/lang/Class;
    const-string v2, "annotationType"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Ljavassist/bytecode/annotation/AnnotationImpl;->JDK_ANNOTATION_TYPE_METHOD:Ljava/lang/reflect/Method;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_14} :catch_15

    .line 57
    :goto_14
    return-void

    .line 54
    :catch_15
    move-exception v1

    goto :goto_14
.end method

.method private constructor <init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/ClassPool;Ljava/lang/ClassLoader;)V
    .registers 5
    .param p1, "a"    # Ljavassist/bytecode/annotation/Annotation;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/high16 v0, -0x80000000

    iput v0, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->cachedHashCode:I

    .line 76
    iput-object p1, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    .line 77
    iput-object p2, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    .line 78
    iput-object p3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    .line 79
    return-void
.end method

.method private static arrayHashCode(Ljava/lang/Object;)I
    .registers 6
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 291
    if-nez p0, :cond_4

    .line 292
    const/4 v3, 0x0

    .line 303
    .end local p0    # "object":Ljava/lang/Object;
    :cond_3
    return v3

    .line 294
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_4
    const/4 v3, 0x1

    .line 296
    .local v3, "result":I
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "object":Ljava/lang/Object;
    move-object v0, p0

    check-cast v0, [Ljava/lang/Object;

    .line 297
    .local v0, "array":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    array-length v4, v0

    if-ge v2, v4, :cond_3

    .line 298
    const/4 v1, 0x0

    .line 299
    .local v1, "elementHashCode":I
    aget-object v4, v0, v2

    if-eqz v4, :cond_19

    .line 300
    aget-object v4, v0, v2

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 301
    :cond_19
    mul-int/lit8 v4, v3, 0x1f

    add-int v3, v4, v1

    .line 297
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method private checkEquals(Ljava/lang/Object;)Z
    .registers 16
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 235
    if-nez p1, :cond_6

    move v10, v11

    .line 279
    :goto_5
    return v10

    .line 239
    :cond_6
    instance-of v12, p1, Ljava/lang/reflect/Proxy;

    if-eqz v12, :cond_1e

    .line 240
    invoke-static {p1}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v2

    .line 241
    .local v2, "ih":Ljava/lang/reflect/InvocationHandler;
    instance-of v12, v2, Ljavassist/bytecode/annotation/AnnotationImpl;

    if-eqz v12, :cond_1e

    move-object v6, v2

    .line 242
    check-cast v6, Ljavassist/bytecode/annotation/AnnotationImpl;

    .line 243
    .local v6, "other":Ljavassist/bytecode/annotation/AnnotationImpl;
    iget-object v10, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    iget-object v11, v6, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v10, v11}, Ljavassist/bytecode/annotation/Annotation;->equals(Ljava/lang/Object;)Z

    move-result v10

    goto :goto_5

    .line 247
    .end local v2    # "ih":Ljava/lang/reflect/InvocationHandler;
    .end local v6    # "other":Ljavassist/bytecode/annotation/AnnotationImpl;
    :cond_1e
    sget-object v12, Ljavassist/bytecode/annotation/AnnotationImpl;->JDK_ANNOTATION_TYPE_METHOD:Ljava/lang/reflect/Method;

    check-cast v10, [Ljava/lang/Object;

    invoke-virtual {v12, p1, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    .line 248
    .local v7, "otherAnnotationType":Ljava/lang/Class;
    invoke-direct {p0}, Ljavassist/bytecode/annotation/AnnotationImpl;->getAnnotationType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_34

    move v10, v11

    .line 249
    goto :goto_5

    .line 251
    :cond_34
    iget-object v10, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotationType:Ljava/lang/Class;

    invoke-virtual {v10}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 252
    .local v3, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3b
    array-length v10, v3

    if-ge v1, v10, :cond_a9

    .line 253
    aget-object v10, v3, v1

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 256
    .local v5, "name":Ljava/lang/String;
    iget-object v10, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v10, v5}, Ljavassist/bytecode/annotation/Annotation;->getMemberValue(Ljava/lang/String;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v4

    .line 257
    .local v4, "mv":Ljavassist/bytecode/annotation/MemberValue;
    const/4 v9, 0x0

    .line 258
    .local v9, "value":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 260
    .local v8, "otherValue":Ljava/lang/Object;
    if-eqz v4, :cond_58

    .line 261
    :try_start_4e
    iget-object v10, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    iget-object v12, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    aget-object v13, v3, v1

    invoke-virtual {v4, v10, v12, v13}, Ljavassist/bytecode/annotation/MemberValue;->getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v9

    .line 262
    .end local v9    # "value":Ljava/lang/Object;
    :cond_58
    if-nez v9, :cond_60

    .line 263
    aget-object v10, v3, v1

    invoke-direct {p0, v5, v10}, Ljavassist/bytecode/annotation/AnnotationImpl;->getDefault(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v9

    .line 264
    :cond_60
    aget-object v12, v3, v1

    const/4 v10, 0x0

    check-cast v10, [Ljava/lang/Object;

    invoke-virtual {v12, p1, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_68
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_68} :catch_6f
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_68} :catch_71

    move-result-object v8

    .line 273
    if-nez v9, :cond_9b

    if-eqz v8, :cond_9b

    move v10, v11

    .line 274
    goto :goto_5

    .line 266
    :catch_6f
    move-exception v0

    .line 267
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 269
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_71
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/Exception;
    new-instance v10, Ljava/lang/RuntimeException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error retrieving value "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " for annotation "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v12}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 275
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_9b
    if-eqz v9, :cond_a6

    invoke-virtual {v9, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a6

    move v10, v11

    .line 276
    goto/16 :goto_5

    .line 252
    :cond_a6
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 279
    .end local v4    # "mv":Ljavassist/bytecode/annotation/MemberValue;
    .end local v5    # "name":Ljava/lang/String;
    .end local v8    # "otherValue":Ljava/lang/Object;
    :cond_a9
    const/4 v10, 0x1

    goto/16 :goto_5
.end method

.method private getAnnotationType()Ljava/lang/Class;
    .registers 6

    .prologue
    .line 97
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotationType:Ljava/lang/Class;

    if-nez v3, :cond_12

    .line 98
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v3}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "typeName":Ljava/lang/String;
    :try_start_a
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v3, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotationType:Ljava/lang/Class;
    :try_end_12
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_12} :catch_15

    .line 108
    .end local v2    # "typeName":Ljava/lang/String;
    :cond_12
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotationType:Ljava/lang/Class;

    return-object v3

    .line 102
    .restart local v2    # "typeName":Ljava/lang/String;
    :catch_15
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading annotation class: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    .line 104
    .local v1, "error":Ljava/lang/NoClassDefFoundError;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/NoClassDefFoundError;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 105
    throw v1
.end method

.method private getDefault(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v7, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v7}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .line 156
    .local v3, "classname":Ljava/lang/String;
    iget-object v7, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    if-eqz v7, :cond_4b

    .line 158
    :try_start_a
    iget-object v7, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    invoke-virtual {v7, v3}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 159
    .local v1, "cc":Ljavassist/CtClass;
    invoke-virtual {v1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    .line 160
    .local v2, "cf":Ljavassist/bytecode/ClassFile;
    invoke-virtual {v2, p1}, Ljavassist/bytecode/ClassFile;->getMethod(Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;

    move-result-object v5

    .line 161
    .local v5, "minfo":Ljavassist/bytecode/MethodInfo;
    if-eqz v5, :cond_4b

    .line 162
    const-string v7, "AnnotationDefault"

    invoke-virtual {v5, v7}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationDefaultAttribute;

    .line 165
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationDefaultAttribute;
    if-eqz v0, :cond_4b

    .line 166
    invoke-virtual {v0}, Ljavassist/bytecode/AnnotationDefaultAttribute;->getDefaultValue()Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v6

    .line 167
    .local v6, "mv":Ljavassist/bytecode/annotation/MemberValue;
    iget-object v7, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    iget-object v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    invoke-virtual {v6, v7, v8, p2}, Ljavassist/bytecode/annotation/MemberValue;->getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    :try_end_2f
    .catch Ljavassist/NotFoundException; {:try_start_a .. :try_end_2f} :catch_31

    move-result-object v7

    return-object v7

    .line 171
    .end local v0    # "ainfo":Ljavassist/bytecode/AnnotationDefaultAttribute;
    .end local v1    # "cc":Ljavassist/CtClass;
    .end local v2    # "cf":Ljavassist/bytecode/ClassFile;
    .end local v5    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v6    # "mv":Ljavassist/bytecode/annotation/MemberValue;
    :catch_31
    move-exception v4

    .line 172
    .local v4, "e":Ljavassist/NotFoundException;
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cannot find a class file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 177
    .end local v4    # "e":Ljavassist/NotFoundException;
    :cond_4b
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "no default value: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "()"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public static make(Ljava/lang/ClassLoader;Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/annotation/Annotation;)Ljava/lang/Object;
    .registers 7
    .param p0, "cl"    # Ljava/lang/ClassLoader;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "anon"    # Ljavassist/bytecode/annotation/Annotation;

    .prologue
    .line 71
    new-instance v0, Ljavassist/bytecode/annotation/AnnotationImpl;

    invoke-direct {v0, p3, p2, p0}, Ljavassist/bytecode/annotation/AnnotationImpl;-><init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/ClassPool;Ljava/lang/ClassLoader;)V

    .line 72
    .local v0, "handler":Ljavassist/bytecode/annotation/AnnotationImpl;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p0, v1, v0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getAnnotation()Ljavassist/bytecode/annotation/Annotation;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    return-object v0
.end method

.method public getTypeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 12

    .prologue
    .line 185
    iget v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->cachedHashCode:I

    const/high16 v9, -0x80000000

    if-ne v8, v9, :cond_84

    .line 186
    const/4 v1, 0x0

    .line 189
    .local v1, "hashCode":I
    invoke-direct {p0}, Ljavassist/bytecode/annotation/AnnotationImpl;->getAnnotationType()Ljava/lang/Class;

    .line 191
    iget-object v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotationType:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 192
    .local v3, "methods":[Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    array-length v8, v3

    if-ge v2, v8, :cond_82

    .line 193
    aget-object v8, v3, v2

    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 194
    .local v5, "name":Ljava/lang/String;
    const/4 v7, 0x0

    .line 197
    .local v7, "valueHashCode":I
    iget-object v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v8, v5}, Ljavassist/bytecode/annotation/Annotation;->getMemberValue(Ljava/lang/String;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v4

    .line 198
    .local v4, "mv":Ljavassist/bytecode/annotation/MemberValue;
    const/4 v6, 0x0

    .line 200
    .local v6, "value":Ljava/lang/Object;
    if-eqz v4, :cond_2e

    .line 201
    :try_start_24
    iget-object v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    iget-object v9, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    aget-object v10, v3, v2

    invoke-virtual {v4, v8, v9, v10}, Ljavassist/bytecode/annotation/MemberValue;->getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v6

    .line 202
    .end local v6    # "value":Ljava/lang/Object;
    :cond_2e
    if-nez v6, :cond_36

    .line 203
    aget-object v8, v3, v2

    invoke-direct {p0, v5, v8}, Ljavassist/bytecode/annotation/AnnotationImpl;->getDefault(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    :try_end_35
    .catch Ljava/lang/RuntimeException; {:try_start_24 .. :try_end_35} :catch_51
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_35} :catch_53

    move-result-object v6

    .line 213
    :cond_36
    if-eqz v6, :cond_46

    .line 214
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_7d

    .line 215
    invoke-static {v6}, Ljavassist/bytecode/annotation/AnnotationImpl;->arrayHashCode(Ljava/lang/Object;)I

    move-result v7

    .line 219
    :cond_46
    :goto_46
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v8

    mul-int/lit8 v8, v8, 0x7f

    xor-int/2addr v8, v7

    add-int/2addr v1, v8

    .line 192
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 205
    :catch_51
    move-exception v0

    .line 206
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 208
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_53
    move-exception v0

    .line 209
    .local v0, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error retrieving value "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " for annotation "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v10}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 217
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_7d
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v7

    goto :goto_46

    .line 222
    .end local v4    # "mv":Ljavassist/bytecode/annotation/MemberValue;
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "valueHashCode":I
    :cond_82
    iput v1, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->cachedHashCode:I

    .line 224
    .end local v1    # "hashCode":I
    .end local v2    # "i":I
    .end local v3    # "methods":[Ljava/lang/reflect/Method;
    :cond_84
    iget v8, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->cachedHashCode:I

    return v8
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "name":Ljava/lang/String;
    const-class v3, Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_42

    .line 132
    const-string v3, "equals"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 133
    const/4 v3, 0x0

    aget-object v2, p3, v3

    .line 134
    .local v2, "obj":Ljava/lang/Object;
    new-instance v3, Ljava/lang/Boolean;

    invoke-direct {p0, v2}, Ljavassist/bytecode/annotation/AnnotationImpl;->checkEquals(Ljava/lang/Object;)Z

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Boolean;-><init>(Z)V

    .line 149
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_20
    return-object v3

    .line 136
    :cond_21
    const-string v3, "toString"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 137
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v3}, Ljavassist/bytecode/annotation/Annotation;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 138
    :cond_30
    const-string v3, "hashCode"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 139
    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/AnnotationImpl;->hashCode()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_20

    .line 141
    :cond_42
    const-string v3, "annotationType"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_56

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    array-length v3, v3

    if-nez v3, :cond_56

    .line 143
    invoke-direct {p0}, Ljavassist/bytecode/annotation/AnnotationImpl;->getAnnotationType()Ljava/lang/Class;

    move-result-object v3

    goto :goto_20

    .line 145
    :cond_56
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->annotation:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v3, v1}, Ljavassist/bytecode/annotation/Annotation;->getMemberValue(Ljava/lang/String;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v0

    .line 146
    .local v0, "mv":Ljavassist/bytecode/annotation/MemberValue;
    if-nez v0, :cond_63

    .line 147
    invoke-direct {p0, v1, p2}, Ljavassist/bytecode/annotation/AnnotationImpl;->getDefault(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_20

    .line 149
    :cond_63
    iget-object v3, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->classLoader:Ljava/lang/ClassLoader;

    iget-object v4, p0, Ljavassist/bytecode/annotation/AnnotationImpl;->pool:Ljavassist/ClassPool;

    invoke-virtual {v0, v3, v4, p2}, Ljavassist/bytecode/annotation/MemberValue;->getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_20
.end method
