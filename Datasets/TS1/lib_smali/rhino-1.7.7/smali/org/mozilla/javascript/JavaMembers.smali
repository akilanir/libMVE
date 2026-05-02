.class Lorg/mozilla/javascript/JavaMembers;
.super Ljava/lang/Object;
.source "JavaMembers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    }
.end annotation


# instance fields
.field private cl:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field ctors:Lorg/mozilla/javascript/NativeJavaMethod;

.field private fieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field

.field private members:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private staticFieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field

.field private staticMembers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V
    .registers 4
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/JavaMembers;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V

    .line 27
    return-void
.end method

.method constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V
    .registers 9
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "includeProtected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    :try_start_3
    invoke-static {}, Lorg/mozilla/javascript/ContextFactory;->getGlobal()Lorg/mozilla/javascript/ContextFactory;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/ContextFactory;->enterContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 33
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getClassShutter()Lorg/mozilla/javascript/ClassShutter;

    move-result-object v2

    .line 34
    .local v2, "shutter":Lorg/mozilla/javascript/ClassShutter;
    if-eqz v2, :cond_2b

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/mozilla/javascript/ClassShutter;->visibleToScripts(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2b

    .line 35
    const-string v3, "msg.access.prohibited"

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_26

    .line 45
    .end local v0    # "cx":Lorg/mozilla/javascript/Context;
    .end local v2    # "shutter":Lorg/mozilla/javascript/ClassShutter;
    :catchall_26
    move-exception v3

    invoke-static {}, Lorg/mozilla/javascript/Context;->exit()V

    throw v3

    .line 38
    .restart local v0    # "cx":Lorg/mozilla/javascript/Context;
    .restart local v2    # "shutter":Lorg/mozilla/javascript/ClassShutter;
    :cond_2b
    :try_start_2b
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    .line 39
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 40
    iput-object p2, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    .line 41
    const/16 v3, 0xd

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v1

    .line 43
    .local v1, "includePrivate":Z
    invoke-direct {p0, p1, p3, v1}, Lorg/mozilla/javascript/JavaMembers;->reflect(Lorg/mozilla/javascript/Scriptable;ZZ)V
    :try_end_44
    .catchall {:try_start_2b .. :try_end_44} :catchall_26

    .line 45
    invoke-static {}, Lorg/mozilla/javascript/Context;->exit()V

    .line 47
    return-void
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V
    .registers 20
    .param p2, "includeProtected"    # Z
    .param p3, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Lorg/mozilla/javascript/JavaMembers$MethodSignature;",
            "Ljava/lang/reflect/Method;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 310
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/JavaMembers$MethodSignature;Ljava/lang/reflect/Method;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getModifiers()I

    move-result v14

    invoke-static {v14}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v14

    if-nez v14, :cond_c

    if-eqz p3, :cond_bd

    .line 312
    :cond_c
    if-nez p2, :cond_10

    if-eqz p3, :cond_76

    .line 313
    :cond_10
    :goto_10
    if-eqz p0, :cond_e3

    .line 315
    :try_start_12
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v10

    .line 316
    .local v10, "methods":[Ljava/lang/reflect/Method;
    move-object v3, v10

    .local v3, "arr$":[Ljava/lang/reflect/Method;
    array-length v8, v3

    .local v8, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_19
    if-ge v5, v8, :cond_50

    aget-object v9, v3, v5

    .line 317
    .local v9, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v11

    .line 319
    .local v11, "mods":I
    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v14

    if-nez v14, :cond_2f

    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v14

    if-nez v14, :cond_2f

    if-eqz p3, :cond_4d

    .line 322
    :cond_2f
    new-instance v12, Lorg/mozilla/javascript/JavaMembers$MethodSignature;

    invoke-direct {v12, v9}, Lorg/mozilla/javascript/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 323
    .local v12, "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_4d

    .line 324
    if-eqz p3, :cond_48

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v14

    if-nez v14, :cond_48

    .line 325
    const/4 v14, 0x1

    invoke-virtual {v9, v14}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 326
    :cond_48
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    .end local v12    # "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    :cond_4d
    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    .line 330
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "mods":I
    :cond_50
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_53
    .catch Ljava/lang/SecurityException; {:try_start_12 .. :try_end_53} :catch_55

    move-result-object p0

    goto :goto_10

    .line 331
    .end local v3    # "arr$":[Ljava/lang/reflect/Method;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    .end local v10    # "methods":[Ljava/lang/reflect/Method;
    :catch_55
    move-exception v4

    .line 335
    .local v4, "e":Ljava/lang/SecurityException;
    :try_start_56
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v10

    .line 336
    .restart local v10    # "methods":[Ljava/lang/reflect/Method;
    move-object v3, v10

    .restart local v3    # "arr$":[Ljava/lang/reflect/Method;
    array-length v8, v3

    .restart local v8    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    :goto_5d
    if-ge v5, v8, :cond_e3

    aget-object v9, v3, v5

    .line 337
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    new-instance v12, Lorg/mozilla/javascript/JavaMembers$MethodSignature;

    invoke-direct {v12, v9}, Lorg/mozilla/javascript/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 338
    .restart local v12    # "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_73

    .line 339
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    :cond_73
    add-int/lit8 v5, v5, 0x1

    goto :goto_5d

    .line 346
    .end local v3    # "arr$":[Ljava/lang/reflect/Method;
    .end local v4    # "e":Ljava/lang/SecurityException;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v10    # "methods":[Ljava/lang/reflect/Method;
    .end local v12    # "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    :cond_76
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v10

    .line 347
    .restart local v10    # "methods":[Ljava/lang/reflect/Method;
    move-object v3, v10

    .restart local v3    # "arr$":[Ljava/lang/reflect/Method;
    array-length v8, v3

    .restart local v8    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    :goto_7d
    if-ge v5, v8, :cond_e3

    aget-object v9, v3, v5

    .line 348
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    new-instance v12, Lorg/mozilla/javascript/JavaMembers$MethodSignature;

    invoke-direct {v12, v9}, Lorg/mozilla/javascript/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 350
    .restart local v12    # "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_93

    .line 351
    move-object/from16 v0, p1

    invoke-interface {v0, v12, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_93
    .catch Ljava/lang/SecurityException; {:try_start_56 .. :try_end_93} :catch_96

    .line 347
    :cond_93
    add-int/lit8 v5, v5, 0x1

    goto :goto_7d

    .line 355
    .end local v3    # "arr$":[Ljava/lang/reflect/Method;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v10    # "methods":[Ljava/lang/reflect/Method;
    .end local v12    # "sig":Lorg/mozilla/javascript/JavaMembers$MethodSignature;
    :catch_96
    move-exception v4

    .line 356
    .restart local v4    # "e":Ljava/lang/SecurityException;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Could not discover accessible methods of class "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " due to lack of privileges, "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "attemping superclasses/interfaces."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 365
    .end local v4    # "e":Ljava/lang/SecurityException;
    :cond_bd
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v6

    .line 366
    .local v6, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v3, v6

    .local v3, "arr$":[Ljava/lang/Class;
    array-length v8, v3

    .restart local v8    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    :goto_c4
    if-ge v5, v8, :cond_d4

    aget-object v7, v3, v5

    .line 367
    .local v7, "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v7, v0, v1, v2}, Lorg/mozilla/javascript/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 366
    add-int/lit8 v5, v5, 0x1

    goto :goto_c4

    .line 370
    .end local v7    # "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_d4
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v13

    .line 371
    .local v13, "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v13, :cond_e3

    .line 372
    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v13, v0, v1, v2}, Lorg/mozilla/javascript/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 375
    .end local v3    # "arr$":[Ljava/lang/Class;
    .end local v5    # "i$":I
    .end local v6    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v8    # "len$":I
    .end local v13    # "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_e3
    return-void
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;ZZ)[Ljava/lang/reflect/Method;
    .registers 6
    .param p1, "includeProtected"    # Z
    .param p2, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;ZZ)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 301
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 302
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/JavaMembers$MethodSignature;Ljava/lang/reflect/Method;>;"
    invoke-static {p0, v0, p1, p2}, Lorg/mozilla/javascript/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 303
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/reflect/Method;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Method;

    return-object v1
.end method

.method private static extractGetMethod([Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;
    .registers 8
    .param p0, "methods"    # [Lorg/mozilla/javascript/MemberBox;
    .param p1, "isStatic"    # Z

    .prologue
    .line 708
    move-object v0, p0

    .local v0, "arr$":[Lorg/mozilla/javascript/MemberBox;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_24

    aget-object v3, v0, v1

    .line 711
    .local v3, "method":Lorg/mozilla/javascript/MemberBox;
    iget-object v5, v3, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    array-length v5, v5

    if-nez v5, :cond_21

    if-eqz p1, :cond_14

    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v5

    if-eqz v5, :cond_21

    .line 712
    :cond_14
    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    .line 713
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v4, v5, :cond_24

    .line 719
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    .end local v4    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_20
    return-object v3

    .line 708
    .restart local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 719
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :cond_24
    const/4 v3, 0x0

    goto :goto_20
.end method

.method private static extractSetMethod(Ljava/lang/Class;[Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;
    .registers 13
    .param p1, "methods"    # [Lorg/mozilla/javascript/MemberBox;
    .param p2, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/mozilla/javascript/MemberBox;",
            "Z)",
            "Lorg/mozilla/javascript/MemberBox;"
        }
    .end annotation

    .prologue
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 733
    const/4 v5, 0x1

    .local v5, "pass":I
    :goto_4
    if-gt v5, v9, :cond_34

    .line 734
    move-object v0, p1

    .local v0, "arr$":[Lorg/mozilla/javascript/MemberBox;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_31

    aget-object v3, v0, v1

    .line 735
    .local v3, "method":Lorg/mozilla/javascript/MemberBox;
    if-eqz p2, :cond_15

    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 736
    :cond_15
    iget-object v4, v3, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 737
    .local v4, "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v6, v4

    if-ne v6, v8, :cond_2e

    .line 738
    if-ne v5, v8, :cond_21

    .line 739
    aget-object v6, v4, v7

    if-ne v6, p0, :cond_2e

    .line 752
    .end local v0    # "arr$":[Lorg/mozilla/javascript/MemberBox;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    .end local v4    # "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_20
    :goto_20
    return-object v3

    .line 743
    .restart local v0    # "arr$":[Lorg/mozilla/javascript/MemberBox;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    .restart local v4    # "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_21
    if-eq v5, v9, :cond_26

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 744
    :cond_26
    aget-object v6, v4, v7

    invoke-virtual {v6, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_20

    .line 734
    .end local v4    # "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 733
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 752
    .end local v0    # "arr$":[Lorg/mozilla/javascript/MemberBox;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :cond_34
    const/4 v3, 0x0

    goto :goto_20
.end method

.method private static extractSetMethod([Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;
    .registers 8
    .param p0, "methods"    # [Lorg/mozilla/javascript/MemberBox;
    .param p1, "isStatic"    # Z

    .prologue
    .line 759
    move-object v0, p0

    .local v0, "arr$":[Lorg/mozilla/javascript/MemberBox;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_25

    aget-object v3, v0, v1

    .line 760
    .local v3, "method":Lorg/mozilla/javascript/MemberBox;
    if-eqz p1, :cond_f

    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->isStatic()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 761
    :cond_f
    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_22

    .line 762
    iget-object v4, v3, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_22

    .line 768
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :goto_21
    return-object v3

    .line 759
    .restart local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 768
    .end local v3    # "method":Lorg/mozilla/javascript/MemberBox;
    :cond_25
    const/4 v3, 0x0

    goto :goto_21
.end method

.method private findExplicitFunction(Ljava/lang/String;Z)Lorg/mozilla/javascript/MemberBox;
    .registers 19
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStatic"    # Z

    .prologue
    .line 216
    const/16 v14, 0x28

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 217
    .local v11, "sigStart":I
    if-gez v11, :cond_c

    const/4 v6, 0x0

    .line 252
    :cond_b
    :goto_b
    return-object v6

    .line 219
    :cond_c
    if-eqz p2, :cond_4a

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 220
    .local v2, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_12
    const/4 v7, 0x0

    .line 221
    .local v7, "methodsOrCtors":[Lorg/mozilla/javascript/MemberBox;
    if-eqz p2, :cond_4f

    if-nez v11, :cond_4f

    const/4 v4, 0x1

    .line 223
    .local v4, "isCtor":Z
    :goto_18
    if-eqz v4, :cond_51

    .line 225
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/JavaMembers;->ctors:Lorg/mozilla/javascript/NativeJavaMethod;

    iget-object v7, v14, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    .line 240
    :cond_20
    :goto_20
    if-eqz v7, :cond_72

    .line 241
    move-object v1, v7

    .local v1, "arr$":[Lorg/mozilla/javascript/MemberBox;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_25
    if-ge v3, v5, :cond_72

    aget-object v6, v1, v3

    .line 242
    .local v6, "methodsOrCtor":Lorg/mozilla/javascript/MemberBox;
    iget-object v13, v6, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 243
    .local v13, "type":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {v13}, Lorg/mozilla/javascript/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v10

    .line 244
    .local v10, "sig":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v14

    add-int/2addr v14, v11

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v15

    if-ne v14, v15, :cond_47

    const/4 v14, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v10, v14, v15}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v14

    if-nez v14, :cond_b

    .line 241
    :cond_47
    add-int/lit8 v3, v3, 0x1

    goto :goto_25

    .line 219
    .end local v1    # "arr$":[Lorg/mozilla/javascript/MemberBox;
    .end local v2    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "i$":I
    .end local v4    # "isCtor":Z
    .end local v5    # "len$":I
    .end local v6    # "methodsOrCtor":Lorg/mozilla/javascript/MemberBox;
    .end local v7    # "methodsOrCtors":[Lorg/mozilla/javascript/MemberBox;
    .end local v10    # "sig":Ljava/lang/String;
    .end local v13    # "type":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_4a
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_12

    .line 221
    .restart local v2    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v7    # "methodsOrCtors":[Lorg/mozilla/javascript/MemberBox;
    :cond_4f
    const/4 v4, 0x0

    goto :goto_18

    .line 228
    .restart local v4    # "isCtor":Z
    :cond_51
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 229
    .local v12, "trueName":Ljava/lang/String;
    invoke-interface {v2, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 230
    .local v9, "obj":Ljava/lang/Object;
    if-nez p2, :cond_68

    if-nez v9, :cond_68

    .line 232
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    invoke-interface {v14, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 234
    :cond_68
    instance-of v14, v9, Lorg/mozilla/javascript/NativeJavaMethod;

    if-eqz v14, :cond_20

    move-object v8, v9

    .line 235
    check-cast v8, Lorg/mozilla/javascript/NativeJavaMethod;

    .line 236
    .local v8, "njm":Lorg/mozilla/javascript/NativeJavaMethod;
    iget-object v7, v8, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    goto :goto_20

    .line 252
    .end local v8    # "njm":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v9    # "obj":Ljava/lang/Object;
    .end local v12    # "trueName":Ljava/lang/String;
    :cond_72
    const/4 v6, 0x0

    goto :goto_b
.end method

.method private findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/MemberBox;
    .registers 9
    .param p1, "isStatic"    # Z
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lorg/mozilla/javascript/MemberBox;"
        }
    .end annotation

    .prologue
    .line 691
    .local p2, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p3, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 692
    .local v0, "getterName":Ljava/lang/String;
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 694
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 695
    .local v1, "member":Ljava/lang/Object;
    instance-of v3, v1, Lorg/mozilla/javascript/NativeJavaMethod;

    if-eqz v3, :cond_1c

    move-object v2, v1

    .line 696
    check-cast v2, Lorg/mozilla/javascript/NativeJavaMethod;

    .line 697
    .local v2, "njmGet":Lorg/mozilla/javascript/NativeJavaMethod;
    iget-object v3, v2, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    invoke-static {v3, p1}, Lorg/mozilla/javascript/JavaMembers;->extractGetMethod([Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;

    move-result-object v3

    .line 700
    .end local v1    # "member":Ljava/lang/Object;
    .end local v2    # "njmGet":Lorg/mozilla/javascript/NativeJavaMethod;
    :goto_1b
    return-object v3

    :cond_1c
    const/4 v3, 0x0

    goto :goto_1b
.end method

.method private getAccessibleConstructors(Z)[Ljava/lang/reflect/Constructor;
    .registers 6
    .param p1, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)[",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 640
    if-eqz p1, :cond_36

    iget-object v2, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-eq v2, v3, :cond_36

    .line 642
    :try_start_8
    iget-object v2, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 643
    .local v0, "cons":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    const/4 v2, 0x1

    invoke-static {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V
    :try_end_12
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_12} :catch_13

    .line 653
    .end local v0    # "cons":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    :goto_12
    return-object v0

    .line 646
    :catch_13
    move-exception v1

    .line 648
    .local v1, "e":Ljava/lang/SecurityException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not access constructor  of class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " due to lack of privileges."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 653
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_36
    iget-object v2, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    goto :goto_12
.end method

.method private getAccessibleFields(ZZ)[Ljava/lang/reflect/Field;
    .registers 12
    .param p1, "includeProtected"    # Z
    .param p2, "includePrivate"    # Z

    .prologue
    .line 658
    if-nez p2, :cond_4

    if-eqz p1, :cond_4d

    .line 660
    :cond_4
    :try_start_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 661
    .local v4, "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    iget-object v1, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    .line 663
    .local v1, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_b
    if-eqz v1, :cond_3f

    .line 666
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 667
    .local v2, "declared":[Ljava/lang/reflect/Field;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_14
    if-ge v5, v6, :cond_3a

    aget-object v3, v0, v5

    .line 668
    .local v3, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    .line 669
    .local v7, "mod":I
    if-nez p2, :cond_2a

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v8

    if-nez v8, :cond_2a

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v8

    if-eqz v8, :cond_37

    .line 670
    :cond_2a
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v8

    if-nez v8, :cond_34

    .line 671
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 672
    :cond_34
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    :cond_37
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 677
    .end local v3    # "field":Ljava/lang/reflect/Field;
    .end local v7    # "mod":I
    :cond_3a
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 678
    goto :goto_b

    .line 680
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "declared":[Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_3f
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/reflect/Field;

    invoke-interface {v4, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/reflect/Field;
    :try_end_4b
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4b} :catch_4c

    .line 685
    .end local v1    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :goto_4b
    return-object v8

    .line 681
    :catch_4c
    move-exception v8

    .line 685
    :cond_4d
    iget-object v8, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v8

    goto :goto_4b
.end method

.method private getExplicitFunction(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 13
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "isStatic"    # Z

    .prologue
    .line 258
    if-eqz p4, :cond_22

    iget-object v1, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 259
    .local v1, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_4
    const/4 v2, 0x0

    .line 260
    .local v2, "member":Ljava/lang/Object;
    invoke-direct {p0, p2, p4}, Lorg/mozilla/javascript/JavaMembers;->findExplicitFunction(Ljava/lang/String;Z)Lorg/mozilla/javascript/MemberBox;

    move-result-object v3

    .line 262
    .local v3, "methodOrCtor":Lorg/mozilla/javascript/MemberBox;
    if-eqz v3, :cond_21

    .line 263
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getFunctionPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 266
    .local v4, "prototype":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->isCtor()Z

    move-result v6

    if-eqz v6, :cond_25

    .line 267
    new-instance v0, Lorg/mozilla/javascript/NativeJavaConstructor;

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/NativeJavaConstructor;-><init>(Lorg/mozilla/javascript/MemberBox;)V

    .line 269
    .local v0, "fun":Lorg/mozilla/javascript/NativeJavaConstructor;
    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/NativeJavaConstructor;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 270
    move-object v2, v0

    .line 271
    .local v2, "member":Lorg/mozilla/javascript/NativeJavaConstructor;
    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .end local v0    # "fun":Lorg/mozilla/javascript/NativeJavaConstructor;
    .end local v2    # "member":Lorg/mozilla/javascript/NativeJavaConstructor;
    .end local v4    # "prototype":Lorg/mozilla/javascript/Scriptable;
    :cond_21
    :goto_21
    return-object v2

    .line 258
    .end local v1    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "methodOrCtor":Lorg/mozilla/javascript/MemberBox;
    :cond_22
    iget-object v1, p0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_4

    .line 273
    .restart local v1    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v2, "member":Ljava/lang/Object;
    .restart local v3    # "methodOrCtor":Lorg/mozilla/javascript/MemberBox;
    .restart local v4    # "prototype":Lorg/mozilla/javascript/Scriptable;
    :cond_25
    invoke-virtual {v3}, Lorg/mozilla/javascript/MemberBox;->getName()Ljava/lang/String;

    move-result-object v5

    .line 274
    .local v5, "trueName":Ljava/lang/String;
    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 276
    instance-of v6, v2, Lorg/mozilla/javascript/NativeJavaMethod;

    if-eqz v6, :cond_21

    move-object v6, v2

    check-cast v6, Lorg/mozilla/javascript/NativeJavaMethod;

    iget-object v6, v6, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    array-length v6, v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_21

    .line 278
    new-instance v0, Lorg/mozilla/javascript/NativeJavaMethod;

    invoke-direct {v0, v3, p2}, Lorg/mozilla/javascript/NativeJavaMethod;-><init>(Lorg/mozilla/javascript/MemberBox;Ljava/lang/String;)V

    .line 280
    .local v0, "fun":Lorg/mozilla/javascript/NativeJavaMethod;
    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/NativeJavaMethod;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 281
    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    move-object v2, v0

    .local v2, "member":Lorg/mozilla/javascript/NativeJavaMethod;
    goto :goto_21
.end method

.method static javaSignature(Ljava/lang/Class;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-nez v5, :cond_b

    .line 174
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 193
    :goto_a
    return-object v5

    .line 176
    :cond_b
    const/4 v0, 0x0

    .line 178
    .local v0, "arrayDimension":I
    :cond_c
    add-int/lit8 v0, v0, 0x1

    .line 179
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p0

    .line 180
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-nez v5, :cond_c

    .line 181
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "name":Ljava/lang/String;
    const-string v4, "[]"

    .line 183
    .local v4, "suffix":Ljava/lang/String;
    const/4 v5, 0x1

    if-ne v0, v5, :cond_26

    .line 184
    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_a

    .line 186
    :cond_26
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    mul-int/2addr v6, v0

    add-int v1, v5, v6

    .line 187
    .local v1, "length":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 188
    .local v3, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    :goto_39
    if-eqz v0, :cond_41

    .line 190
    add-int/lit8 v0, v0, -0x1

    .line 191
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39

    .line 193
    :cond_41
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_a
.end method

.method static liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v0, p0

    .line 201
    .local v0, "N":I
    if-nez v0, :cond_6

    const-string v3, "()"

    .line 211
    :goto_5
    return-object v3

    .line 202
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/16 v3, 0x28

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    if-eq v1, v0, :cond_26

    .line 205
    if-eqz v1, :cond_1a

    .line 206
    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    :cond_1a
    aget-object v3, p0, v1

    invoke-static {v3}, Lorg/mozilla/javascript/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 210
    :cond_26
    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_5
.end method

.method static lookupClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lorg/mozilla/javascript/JavaMembers;
    .registers 12
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "includeProtected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;Z)",
            "Lorg/mozilla/javascript/JavaMembers;"
        }
    .end annotation

    .prologue
    .line 792
    .local p1, "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/mozilla/javascript/ClassCache;->get(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ClassCache;

    move-result-object v0

    .line 793
    .local v0, "cache":Lorg/mozilla/javascript/ClassCache;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ClassCache;->getClassCacheMap()Ljava/util/Map;

    move-result-object v2

    .line 795
    .local v2, "ct":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lorg/mozilla/javascript/JavaMembers;>;"
    move-object v1, p1

    .line 797
    .local v1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_9
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/JavaMembers;

    .line 798
    .local v4, "members":Lorg/mozilla/javascript/JavaMembers;
    if-eqz v4, :cond_18

    .line 799
    if-eq v1, p1, :cond_16

    .line 802
    invoke-interface {v2, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    move-object v5, v4

    .line 841
    .end local v4    # "members":Lorg/mozilla/javascript/JavaMembers;
    .local v5, "members":Ljava/lang/Object;
    :goto_17
    return-object v5

    .line 807
    .end local v5    # "members":Ljava/lang/Object;
    .restart local v4    # "members":Lorg/mozilla/javascript/JavaMembers;
    :cond_18
    :try_start_18
    new-instance v4, Lorg/mozilla/javascript/JavaMembers;

    .end local v4    # "members":Lorg/mozilla/javascript/JavaMembers;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ClassCache;->getAssociatedScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v7

    invoke-direct {v4, v7, v1, p3}, Lorg/mozilla/javascript/JavaMembers;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V
    :try_end_21
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_21} :catch_31

    .line 833
    .restart local v4    # "members":Lorg/mozilla/javascript/JavaMembers;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ClassCache;->isCachingEnabled()Z

    move-result v7

    if-eqz v7, :cond_2f

    .line 834
    invoke-interface {v2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    if-eq v1, p1, :cond_2f

    .line 838
    invoke-interface {v2, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2f
    move-object v5, v4

    .line 841
    .restart local v5    # "members":Ljava/lang/Object;
    goto :goto_17

    .line 810
    .end local v4    # "members":Lorg/mozilla/javascript/JavaMembers;
    .end local v5    # "members":Ljava/lang/Object;
    :catch_31
    move-exception v3

    .line 815
    .local v3, "e":Ljava/lang/SecurityException;
    if-eqz p2, :cond_3d

    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 816
    move-object v1, p2

    .line 817
    const/4 p2, 0x0

    goto :goto_9

    .line 819
    :cond_3d
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 820
    .local v6, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v6, :cond_4b

    .line 821
    invoke-virtual {v1}, Ljava/lang/Class;->isInterface()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 823
    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 828
    :cond_4b
    move-object v1, v6

    goto :goto_9

    .line 825
    :cond_4d
    throw v3
.end method

.method private reflect(Lorg/mozilla/javascript/Scriptable;ZZ)V
    .registers 54
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "includeProtected"    # Z
    .param p3, "includePrivate"    # Z

    .prologue
    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;ZZ)[Ljava/lang/reflect/Method;

    move-result-object v33

    .line 421
    .local v33, "methods":[Ljava/lang/reflect/Method;
    move-object/from16 v6, v33

    .local v6, "arr$":[Ljava/lang/reflect/Method;
    array-length v0, v6

    move/from16 v26, v0

    .local v26, "len$":I
    const/16 v23, 0x0

    .local v23, "i$":I
    :goto_17
    move/from16 v0, v23

    move/from16 v1, v26

    if-ge v0, v1, :cond_85

    aget-object v31, v6, v23

    .line 422
    .local v31, "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v34

    .line 423
    .local v34, "mods":I
    invoke-static/range {v34 .. v34}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v24

    .line 424
    .local v24, "isStatic":Z
    if-eqz v24, :cond_49

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    move-object/from16 v21, v0

    .line 425
    .local v21, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_2f
    invoke-virtual/range {v31 .. v31}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v35

    .line 426
    .local v35, "name":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v47

    .line 427
    .local v47, "value":Ljava/lang/Object;
    if-nez v47, :cond_50

    .line 428
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    :goto_46
    add-int/lit8 v23, v23, 0x1

    goto :goto_17

    .line 424
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v35    # "name":Ljava/lang/String;
    .end local v47    # "value":Ljava/lang/Object;
    :cond_49
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    move-object/from16 v21, v0

    goto :goto_2f

    .line 431
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v35    # "name":Ljava/lang/String;
    .restart local v47    # "value":Ljava/lang/Object;
    :cond_50
    move-object/from16 v0, v47

    instance-of v0, v0, Lorg/mozilla/javascript/ObjArray;

    move/from16 v48, v0

    if-eqz v48, :cond_64

    move-object/from16 v39, v47

    .line 432
    check-cast v39, Lorg/mozilla/javascript/ObjArray;

    .line 441
    .local v39, "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    :goto_5c
    move-object/from16 v0, v39

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    goto :goto_46

    .line 434
    .end local v39    # "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    :cond_64
    move-object/from16 v0, v47

    instance-of v0, v0, Ljava/lang/reflect/Method;

    move/from16 v48, v0

    if-nez v48, :cond_6f

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 437
    :cond_6f
    new-instance v39, Lorg/mozilla/javascript/ObjArray;

    invoke-direct/range {v39 .. v39}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    .line 438
    .restart local v39    # "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    move-object/from16 v0, v39

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 439
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    move-object/from16 v2, v39

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5c

    .line 447
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v24    # "isStatic":Z
    .end local v31    # "method":Ljava/lang/reflect/Method;
    .end local v34    # "mods":I
    .end local v35    # "name":Ljava/lang/String;
    .end local v39    # "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    .end local v47    # "value":Ljava/lang/Object;
    :cond_85
    const/16 v43, 0x0

    .end local v23    # "i$":I
    .local v43, "tableCursor":I
    :goto_87
    const/16 v48, 0x2

    move/from16 v0, v43

    move/from16 v1, v48

    if-eq v0, v1, :cond_133

    .line 448
    if-nez v43, :cond_f2

    const/16 v24, 0x1

    .line 449
    .restart local v24    # "isStatic":Z
    :goto_93
    if-eqz v24, :cond_f5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    move-object/from16 v21, v0

    .line 450
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_9b
    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v48

    invoke-interface/range {v48 .. v48}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, "i$":Ljava/util/Iterator;
    :goto_a3
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v48

    if-eqz v48, :cond_12f

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Map$Entry;

    .line 452
    .local v14, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v47

    .line 453
    .restart local v47    # "value":Ljava/lang/Object;
    move-object/from16 v0, v47

    instance-of v0, v0, Ljava/lang/reflect/Method;

    move/from16 v48, v0

    if-eqz v48, :cond_fc

    .line 454
    const/16 v48, 0x1

    move/from16 v0, v48

    new-array v0, v0, [Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v32, v0

    .line 455
    .local v32, "methodBoxes":[Lorg/mozilla/javascript/MemberBox;
    const/16 v48, 0x0

    new-instance v49, Lorg/mozilla/javascript/MemberBox;

    check-cast v47, Ljava/lang/reflect/Method;

    .end local v47    # "value":Ljava/lang/Object;
    move-object/from16 v0, v49

    move-object/from16 v1, v47

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    aput-object v49, v32, v48

    .line 466
    :cond_d2
    new-instance v19, Lorg/mozilla/javascript/NativeJavaMethod;

    move-object/from16 v0, v19

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeJavaMethod;-><init>([Lorg/mozilla/javascript/MemberBox;)V

    .line 467
    .local v19, "fun":Lorg/mozilla/javascript/NativeJavaMethod;
    if-eqz p1, :cond_e4

    .line 468
    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 470
    :cond_e4
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v48

    move-object/from16 v0, v21

    move-object/from16 v1, v48

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a3

    .line 448
    .end local v14    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v19    # "fun":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v23    # "i$":Ljava/util/Iterator;
    .end local v24    # "isStatic":Z
    .end local v32    # "methodBoxes":[Lorg/mozilla/javascript/MemberBox;
    :cond_f2
    const/16 v24, 0x0

    goto :goto_93

    .line 449
    .restart local v24    # "isStatic":Z
    :cond_f5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    move-object/from16 v21, v0

    goto :goto_9b

    .restart local v14    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v23    # "i$":Ljava/util/Iterator;
    .restart local v47    # "value":Ljava/lang/Object;
    :cond_fc
    move-object/from16 v39, v47

    .line 457
    check-cast v39, Lorg/mozilla/javascript/ObjArray;

    .line 458
    .restart local v39    # "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    invoke-virtual/range {v39 .. v39}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v5

    .line 459
    .local v5, "N":I
    const/16 v48, 0x2

    move/from16 v0, v48

    if-ge v5, v0, :cond_10d

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 460
    :cond_10d
    new-array v0, v5, [Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v32, v0

    .line 461
    .restart local v32    # "methodBoxes":[Lorg/mozilla/javascript/MemberBox;
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_113
    move/from16 v0, v22

    if-eq v0, v5, :cond_d2

    .line 462
    move-object/from16 v0, v39

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/reflect/Method;

    .line 463
    .restart local v31    # "method":Ljava/lang/reflect/Method;
    new-instance v48, Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v0, v48

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    aput-object v48, v32, v22

    .line 461
    add-int/lit8 v22, v22, 0x1

    goto :goto_113

    .line 447
    .end local v5    # "N":I
    .end local v14    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v22    # "i":I
    .end local v31    # "method":Ljava/lang/reflect/Method;
    .end local v32    # "methodBoxes":[Lorg/mozilla/javascript/MemberBox;
    .end local v39    # "overloadedMethods":Lorg/mozilla/javascript/ObjArray;
    .end local v47    # "value":Ljava/lang/Object;
    :cond_12f
    add-int/lit8 v43, v43, 0x1

    goto/16 :goto_87

    .line 475
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v23    # "i$":Ljava/util/Iterator;
    .end local v24    # "isStatic":Z
    :cond_133
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/JavaMembers;->getAccessibleFields(ZZ)[Ljava/lang/reflect/Field;

    move-result-object v17

    .line 476
    .local v17, "fields":[Ljava/lang/reflect/Field;
    move-object/from16 v6, v17

    .local v6, "arr$":[Ljava/lang/reflect/Field;
    array-length v0, v6

    move/from16 v26, v0

    const/16 v23, 0x0

    .local v23, "i$":I
    :goto_144
    move/from16 v0, v23

    move/from16 v1, v26

    if-ge v0, v1, :cond_233

    aget-object v16, v6, v23

    .line 477
    .local v16, "field":Ljava/lang/reflect/Field;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v35

    .line 478
    .restart local v35    # "name":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v34

    .line 480
    .restart local v34    # "mods":I
    :try_start_154
    invoke-static/range {v34 .. v34}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v24

    .line 481
    .restart local v24    # "isStatic":Z
    if-eqz v24, :cond_176

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    move-object/from16 v21, v0

    .line 482
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_160
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .line 483
    .local v27, "member":Ljava/lang/Object;
    if-nez v27, :cond_17d

    .line 484
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v24    # "isStatic":Z
    .end local v27    # "member":Ljava/lang/Object;
    :cond_173
    :goto_173
    add-int/lit8 v23, v23, 0x1

    goto :goto_144

    .line 481
    .restart local v24    # "isStatic":Z
    :cond_176
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    move-object/from16 v21, v0

    goto :goto_160

    .line 485
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v27    # "member":Ljava/lang/Object;
    :cond_17d
    move-object/from16 v0, v27

    instance-of v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;

    move/from16 v48, v0

    if-eqz v48, :cond_207

    .line 486
    move-object/from16 v0, v27

    check-cast v0, Lorg/mozilla/javascript/NativeJavaMethod;

    move-object/from16 v31, v0

    .line 487
    .local v31, "method":Lorg/mozilla/javascript/NativeJavaMethod;
    new-instance v15, Lorg/mozilla/javascript/FieldAndMethods;

    move-object/from16 v0, v31

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v48, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v48

    move-object/from16 v2, v16

    invoke-direct {v15, v0, v1, v2}, Lorg/mozilla/javascript/FieldAndMethods;-><init>(Lorg/mozilla/javascript/Scriptable;[Lorg/mozilla/javascript/MemberBox;Ljava/lang/reflect/Field;)V

    .line 489
    .local v15, "fam":Lorg/mozilla/javascript/FieldAndMethods;
    if-eqz v24, :cond_1f9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    move-object/from16 v18, v0

    .line 491
    .local v18, "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    :goto_1a4
    if-nez v18, :cond_1b3

    .line 492
    new-instance v18, Ljava/util/HashMap;

    .end local v18    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 493
    .restart local v18    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    if-eqz v24, :cond_200

    .line 494
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    .line 499
    :cond_1b3
    :goto_1b3
    move-object/from16 v0, v18

    move-object/from16 v1, v35

    invoke-interface {v0, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    invoke-interface {v0, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c1
    .catch Ljava/lang/SecurityException; {:try_start_154 .. :try_end_1c1} :catch_1c2

    goto :goto_173

    .line 518
    .end local v15    # "fam":Lorg/mozilla/javascript/FieldAndMethods;
    .end local v18    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v24    # "isStatic":Z
    .end local v27    # "member":Ljava/lang/Object;
    .end local v31    # "method":Lorg/mozilla/javascript/NativeJavaMethod;
    :catch_1c2
    move-exception v13

    .line 520
    .local v13, "e":Ljava/lang/SecurityException;
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, "Could not access field "

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, " of class "

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, " due to lack of privileges."

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    invoke-static/range {v48 .. v48}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    goto/16 :goto_173

    .line 489
    .end local v13    # "e":Ljava/lang/SecurityException;
    .restart local v15    # "fam":Lorg/mozilla/javascript/FieldAndMethods;
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v24    # "isStatic":Z
    .restart local v27    # "member":Ljava/lang/Object;
    .restart local v31    # "method":Lorg/mozilla/javascript/NativeJavaMethod;
    :cond_1f9
    :try_start_1f9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    move-object/from16 v18, v0

    goto :goto_1a4

    .line 496
    .restart local v18    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    :cond_200
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    goto :goto_1b3

    .line 501
    .end local v15    # "fam":Lorg/mozilla/javascript/FieldAndMethods;
    .end local v18    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    .end local v31    # "method":Lorg/mozilla/javascript/NativeJavaMethod;
    :cond_207
    move-object/from16 v0, v27

    instance-of v0, v0, Ljava/lang/reflect/Field;

    move/from16 v48, v0

    if-eqz v48, :cond_22e

    .line 502
    move-object/from16 v0, v27

    check-cast v0, Ljava/lang/reflect/Field;

    move-object/from16 v38, v0

    .line 509
    .local v38, "oldField":Ljava/lang/reflect/Field;
    invoke-virtual/range {v38 .. v38}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v48

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v48

    if-eqz v48, :cond_173

    .line 512
    move-object/from16 v0, v21

    move-object/from16 v1, v35

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_173

    .line 516
    .end local v38    # "oldField":Ljava/lang/reflect/Field;
    :cond_22e
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;
    :try_end_231
    .catch Ljava/lang/SecurityException; {:try_start_1f9 .. :try_end_231} :catch_1c2

    goto/16 :goto_173

    .line 528
    .end local v16    # "field":Ljava/lang/reflect/Field;
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v24    # "isStatic":Z
    .end local v27    # "member":Ljava/lang/Object;
    .end local v34    # "mods":I
    .end local v35    # "name":Ljava/lang/String;
    :cond_233
    const/16 v43, 0x0

    .end local v23    # "i$":I
    :goto_235
    const/16 v48, 0x2

    move/from16 v0, v43

    move/from16 v1, v48

    if-eq v0, v1, :cond_3eb

    .line 529
    if-nez v43, :cond_371

    const/16 v24, 0x1

    .line 530
    .restart local v24    # "isStatic":Z
    :goto_241
    if-eqz v24, :cond_375

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    move-object/from16 v21, v0

    .line 532
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_249
    new-instance v44, Ljava/util/HashMap;

    invoke-direct/range {v44 .. v44}, Ljava/util/HashMap;-><init>()V

    .line 535
    .local v44, "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/BeanProperty;>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v48

    invoke-interface/range {v48 .. v48}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, "i$":Ljava/util/Iterator;
    :cond_256
    :goto_256
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v48

    if-eqz v48, :cond_3c1

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/lang/String;

    .line 537
    .restart local v35    # "name":Ljava/lang/String;
    const-string v48, "get"

    move-object/from16 v0, v35

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v28

    .line 538
    .local v28, "memberIsGetMethod":Z
    const-string v48, "set"

    move-object/from16 v0, v35

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v30

    .line 539
    .local v30, "memberIsSetMethod":Z
    const-string v48, "is"

    move-object/from16 v0, v35

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v29

    .line 540
    .local v29, "memberIsIsMethod":Z
    if-nez v28, :cond_286

    if-nez v29, :cond_286

    if-eqz v30, :cond_256

    .line 543
    :cond_286
    if-eqz v29, :cond_37d

    const/16 v48, 0x2

    :goto_28a
    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v36

    .line 545
    .local v36, "nameComponent":Ljava/lang/String;
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v48

    if-eqz v48, :cond_256

    .line 549
    move-object/from16 v7, v36

    .line 550
    .local v7, "beanPropertyName":Ljava/lang/String;
    const/16 v48, 0x0

    move-object/from16 v0, v36

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 551
    .local v9, "ch0":C
    invoke-static {v9}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v48

    if-eqz v48, :cond_2ba

    .line 552
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v48

    const/16 v49, 0x1

    move/from16 v0, v48

    move/from16 v1, v49

    if-ne v0, v1, :cond_381

    .line 553
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 565
    :cond_2ba
    :goto_2ba
    move-object/from16 v0, v44

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v48

    if-nez v48, :cond_256

    .line 567
    move-object/from16 v0, v21

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v46

    .line 568
    .local v46, "v":Ljava/lang/Object;
    if-eqz v46, :cond_2e0

    .line 570
    if-eqz p3, :cond_256

    move-object/from16 v0, v46

    instance-of v0, v0, Ljava/lang/reflect/Member;

    move/from16 v48, v0

    if-eqz v48, :cond_256

    check-cast v46, Ljava/lang/reflect/Member;

    .end local v46    # "v":Ljava/lang/Object;
    invoke-interface/range {v46 .. v46}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v48

    invoke-static/range {v48 .. v48}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v48

    if-eqz v48, :cond_256

    .line 580
    :cond_2e0
    const/16 v20, 0x0

    .line 581
    .local v20, "getter":Lorg/mozilla/javascript/MemberBox;
    const-string v48, "get"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v21

    move-object/from16 v3, v48

    move-object/from16 v4, v36

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/JavaMembers;->findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/MemberBox;

    move-result-object v20

    .line 583
    if-nez v20, :cond_304

    .line 584
    const-string v48, "is"

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v21

    move-object/from16 v3, v48

    move-object/from16 v4, v36

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/JavaMembers;->findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/MemberBox;

    move-result-object v20

    .line 588
    :cond_304
    const/16 v40, 0x0

    .line 589
    .local v40, "setter":Lorg/mozilla/javascript/MemberBox;
    const/16 v42, 0x0

    .line 590
    .local v42, "setters":Lorg/mozilla/javascript/NativeJavaMethod;
    const-string v48, "set"

    move-object/from16 v0, v48

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    .line 592
    .local v41, "setterName":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v48

    if-eqz v48, :cond_35f

    .line 594
    move-object/from16 v0, v21

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .line 595
    .restart local v27    # "member":Ljava/lang/Object;
    move-object/from16 v0, v27

    instance-of v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;

    move/from16 v48, v0

    if-eqz v48, :cond_35f

    move-object/from16 v37, v27

    .line 596
    check-cast v37, Lorg/mozilla/javascript/NativeJavaMethod;

    .line 597
    .local v37, "njmSet":Lorg/mozilla/javascript/NativeJavaMethod;
    if-eqz v20, :cond_3b2

    .line 600
    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v45

    .line 601
    .local v45, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v48, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v48

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/JavaMembers;->extractSetMethod(Ljava/lang/Class;[Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;

    move-result-object v40

    .line 608
    .end local v45    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_34a
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    array-length v0, v0

    move/from16 v48, v0

    const/16 v49, 0x1

    move/from16 v0, v48

    move/from16 v1, v49

    if-le v0, v1, :cond_35f

    .line 609
    move-object/from16 v42, v37

    .line 614
    .end local v27    # "member":Ljava/lang/Object;
    .end local v37    # "njmSet":Lorg/mozilla/javascript/NativeJavaMethod;
    :cond_35f
    new-instance v8, Lorg/mozilla/javascript/BeanProperty;

    move-object/from16 v0, v20

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-direct {v8, v0, v1, v2}, Lorg/mozilla/javascript/BeanProperty;-><init>(Lorg/mozilla/javascript/MemberBox;Lorg/mozilla/javascript/MemberBox;Lorg/mozilla/javascript/NativeJavaMethod;)V

    .line 616
    .local v8, "bp":Lorg/mozilla/javascript/BeanProperty;
    move-object/from16 v0, v44

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_256

    .line 529
    .end local v7    # "beanPropertyName":Ljava/lang/String;
    .end local v8    # "bp":Lorg/mozilla/javascript/BeanProperty;
    .end local v9    # "ch0":C
    .end local v20    # "getter":Lorg/mozilla/javascript/MemberBox;
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v23    # "i$":Ljava/util/Iterator;
    .end local v24    # "isStatic":Z
    .end local v28    # "memberIsGetMethod":Z
    .end local v29    # "memberIsIsMethod":Z
    .end local v30    # "memberIsSetMethod":Z
    .end local v35    # "name":Ljava/lang/String;
    .end local v36    # "nameComponent":Ljava/lang/String;
    .end local v40    # "setter":Lorg/mozilla/javascript/MemberBox;
    .end local v41    # "setterName":Ljava/lang/String;
    .end local v42    # "setters":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v44    # "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/BeanProperty;>;"
    :cond_371
    const/16 v24, 0x0

    goto/16 :goto_241

    .line 530
    .restart local v24    # "isStatic":Z
    :cond_375
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    move-object/from16 v21, v0

    goto/16 :goto_249

    .line 543
    .restart local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v23    # "i$":Ljava/util/Iterator;
    .restart local v28    # "memberIsGetMethod":Z
    .restart local v29    # "memberIsIsMethod":Z
    .restart local v30    # "memberIsSetMethod":Z
    .restart local v35    # "name":Ljava/lang/String;
    .restart local v44    # "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/BeanProperty;>;"
    :cond_37d
    const/16 v48, 0x3

    goto/16 :goto_28a

    .line 555
    .restart local v7    # "beanPropertyName":Ljava/lang/String;
    .restart local v9    # "ch0":C
    .restart local v36    # "nameComponent":Ljava/lang/String;
    :cond_381
    const/16 v48, 0x1

    move-object/from16 v0, v36

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v10

    .line 556
    .local v10, "ch1":C
    invoke-static {v10}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v48

    if-nez v48, :cond_2ba

    .line 557
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v9}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v48

    const/16 v49, 0x1

    move-object/from16 v0, v36

    move/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_2ba

    .line 605
    .end local v10    # "ch1":C
    .restart local v20    # "getter":Lorg/mozilla/javascript/MemberBox;
    .restart local v27    # "member":Ljava/lang/Object;
    .restart local v37    # "njmSet":Lorg/mozilla/javascript/NativeJavaMethod;
    .restart local v40    # "setter":Lorg/mozilla/javascript/MemberBox;
    .restart local v41    # "setterName":Ljava/lang/String;
    .restart local v42    # "setters":Lorg/mozilla/javascript/NativeJavaMethod;
    :cond_3b2
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/mozilla/javascript/NativeJavaMethod;->methods:[Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    move/from16 v1, v24

    invoke-static {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->extractSetMethod([Lorg/mozilla/javascript/MemberBox;Z)Lorg/mozilla/javascript/MemberBox;

    move-result-object v40

    goto :goto_34a

    .line 621
    .end local v7    # "beanPropertyName":Ljava/lang/String;
    .end local v9    # "ch0":C
    .end local v20    # "getter":Lorg/mozilla/javascript/MemberBox;
    .end local v27    # "member":Ljava/lang/Object;
    .end local v28    # "memberIsGetMethod":Z
    .end local v29    # "memberIsIsMethod":Z
    .end local v30    # "memberIsSetMethod":Z
    .end local v35    # "name":Ljava/lang/String;
    .end local v36    # "nameComponent":Ljava/lang/String;
    .end local v37    # "njmSet":Lorg/mozilla/javascript/NativeJavaMethod;
    .end local v40    # "setter":Lorg/mozilla/javascript/MemberBox;
    .end local v41    # "setterName":Ljava/lang/String;
    .end local v42    # "setters":Lorg/mozilla/javascript/NativeJavaMethod;
    :cond_3c1
    invoke-interface/range {v44 .. v44}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v48

    invoke-interface/range {v48 .. v48}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_3c9
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v48

    if-eqz v48, :cond_3e7

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 622
    .local v25, "key":Ljava/lang/String;
    move-object/from16 v0, v44

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v47

    .line 623
    .restart local v47    # "value":Ljava/lang/Object;
    move-object/from16 v0, v21

    move-object/from16 v1, v25

    move-object/from16 v2, v47

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3c9

    .line 528
    .end local v25    # "key":Ljava/lang/String;
    .end local v47    # "value":Ljava/lang/Object;
    :cond_3e7
    add-int/lit8 v43, v43, 0x1

    goto/16 :goto_235

    .line 628
    .end local v21    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v23    # "i$":Ljava/util/Iterator;
    .end local v24    # "isStatic":Z
    .end local v44    # "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/BeanProperty;>;"
    :cond_3eb
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->getAccessibleConstructors(Z)[Ljava/lang/reflect/Constructor;

    move-result-object v11

    .line 629
    .local v11, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v0, v11

    move/from16 v48, v0

    move/from16 v0, v48

    new-array v12, v0, [Lorg/mozilla/javascript/MemberBox;

    .line 630
    .local v12, "ctorMembers":[Lorg/mozilla/javascript/MemberBox;
    const/16 v22, 0x0

    .restart local v22    # "i":I
    :goto_3fc
    array-length v0, v11

    move/from16 v48, v0

    move/from16 v0, v22

    move/from16 v1, v48

    if-eq v0, v1, :cond_411

    .line 631
    new-instance v48, Lorg/mozilla/javascript/MemberBox;

    aget-object v49, v11, v22

    invoke-direct/range {v48 .. v49}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Constructor;)V

    aput-object v48, v12, v22

    .line 630
    add-int/lit8 v22, v22, 0x1

    goto :goto_3fc

    .line 633
    :cond_411
    new-instance v48, Lorg/mozilla/javascript/NativeJavaMethod;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v49

    move-object/from16 v0, v48

    move-object/from16 v1, v49

    invoke-direct {v0, v12, v1}, Lorg/mozilla/javascript/NativeJavaMethod;-><init>([Lorg/mozilla/javascript/MemberBox;Ljava/lang/String;)V

    move-object/from16 v0, v48

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/JavaMembers;->ctors:Lorg/mozilla/javascript/NativeJavaMethod;

    .line 634
    return-void
.end method


# virtual methods
.method get(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 16
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "isStatic"    # Z

    .prologue
    .line 62
    if-eqz p4, :cond_1d

    iget-object v5, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 63
    .local v5, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_4
    invoke-interface {v5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 64
    .local v6, "member":Ljava/lang/Object;
    if-nez p4, :cond_12

    if-nez v6, :cond_12

    .line 66
    iget-object v9, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    invoke-interface {v9, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 68
    :cond_12
    if-nez v6, :cond_20

    .line 69
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/JavaMembers;->getExplicitFunction(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v6

    .line 71
    if-nez v6, :cond_20

    .line 72
    sget-object v9, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    .line 97
    .end local p3    # "javaObject":Ljava/lang/Object;
    :goto_1c
    return-object v9

    .line 62
    .end local v5    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "member":Ljava/lang/Object;
    .restart local p3    # "javaObject":Ljava/lang/Object;
    :cond_1d
    iget-object v5, p0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_4

    .line 74
    .restart local v5    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v6    # "member":Ljava/lang/Object;
    :cond_20
    instance-of v9, v6, Lorg/mozilla/javascript/Scriptable;

    if-eqz v9, :cond_26

    move-object v9, v6

    .line 75
    goto :goto_1c

    .line 77
    :cond_26
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    .line 81
    .local v2, "cx":Lorg/mozilla/javascript/Context;
    :try_start_2a
    instance-of v9, v6, Lorg/mozilla/javascript/BeanProperty;

    if-eqz v9, :cond_58

    .line 82
    move-object v0, v6

    check-cast v0, Lorg/mozilla/javascript/BeanProperty;

    move-object v1, v0

    .line 83
    .local v1, "bp":Lorg/mozilla/javascript/BeanProperty;
    iget-object v9, v1, Lorg/mozilla/javascript/BeanProperty;->getter:Lorg/mozilla/javascript/MemberBox;

    if-nez v9, :cond_39

    .line 84
    sget-object v9, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_1c

    .line 85
    :cond_39
    iget-object v9, v1, Lorg/mozilla/javascript/BeanProperty;->getter:Lorg/mozilla/javascript/MemberBox;

    sget-object v10, Lorg/mozilla/javascript/Context;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {v9, p3, v10}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 86
    .local v7, "rval":Ljava/lang/Object;
    iget-object v9, v1, Lorg/mozilla/javascript/BeanProperty;->getter:Lorg/mozilla/javascript/MemberBox;

    invoke-virtual {v9}, Lorg/mozilla/javascript/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_4a} :catch_68

    move-result-object v8

    .line 96
    .end local v1    # "bp":Lorg/mozilla/javascript/BeanProperty;
    .end local p3    # "javaObject":Ljava/lang/Object;
    .local v8, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4b
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 97
    invoke-virtual {v2}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v9

    invoke-virtual {v9, v2, p1, v7, v8}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_1c

    .line 88
    .end local v7    # "rval":Ljava/lang/Object;
    .end local v8    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local p3    # "javaObject":Ljava/lang/Object;
    :cond_58
    :try_start_58
    move-object v0, v6

    check-cast v0, Ljava/lang/reflect/Field;

    move-object v4, v0

    .line 89
    .local v4, "field":Ljava/lang/reflect/Field;
    if-eqz p4, :cond_5f

    const/4 p3, 0x0

    .end local p3    # "javaObject":Ljava/lang/Object;
    :cond_5f
    invoke-virtual {v4, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 90
    .restart local v7    # "rval":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_66} :catch_68

    move-result-object v8

    .restart local v8    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_4b

    .line 92
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v7    # "rval":Ljava/lang/Object;
    .end local v8    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_68
    move-exception v3

    .line 93
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v3}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v9

    throw v9
.end method

.method getFieldAndMethodsObjects(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;
    .registers 12
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .param p3, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Z)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/FieldAndMethods;",
            ">;"
        }
    .end annotation

    .prologue
    .line 774
    if-eqz p3, :cond_8

    iget-object v2, p0, Lorg/mozilla/javascript/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    .line 775
    .local v2, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    :goto_4
    if-nez v2, :cond_b

    .line 776
    const/4 v5, 0x0

    .line 785
    :cond_7
    return-object v5

    .line 774
    .end local v2    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    :cond_8
    iget-object v2, p0, Lorg/mozilla/javascript/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    goto :goto_4

    .line 777
    .restart local v2    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    :cond_b
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v4

    .line 778
    .local v4, "len":I
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 779
    .local v5, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/mozilla/javascript/FieldAndMethods;>;"
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/FieldAndMethods;

    .line 780
    .local v0, "fam":Lorg/mozilla/javascript/FieldAndMethods;
    new-instance v1, Lorg/mozilla/javascript/FieldAndMethods;

    iget-object v6, v0, Lorg/mozilla/javascript/FieldAndMethods;->methods:[Lorg/mozilla/javascript/MemberBox;

    iget-object v7, v0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-direct {v1, p1, v6, v7}, Lorg/mozilla/javascript/FieldAndMethods;-><init>(Lorg/mozilla/javascript/Scriptable;[Lorg/mozilla/javascript/MemberBox;Ljava/lang/reflect/Field;)V

    .line 782
    .local v1, "famNew":Lorg/mozilla/javascript/FieldAndMethods;
    iput-object p2, v1, Lorg/mozilla/javascript/FieldAndMethods;->javaObject:Ljava/lang/Object;

    .line 783
    iget-object v6, v0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c
.end method

.method getIds(Z)[Ljava/lang/Object;
    .registers 5
    .param p1, "isStatic"    # Z

    .prologue
    .line 167
    if-eqz p1, :cond_13

    iget-object v0, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 168
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_4
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 167
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_13
    iget-object v0, p0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_4
.end method

.method has(Ljava/lang/String;Z)Z
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStatic"    # Z

    .prologue
    const/4 v2, 0x1

    .line 51
    if-eqz p2, :cond_c

    iget-object v0, p0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 52
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_5
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 53
    .local v1, "obj":Ljava/lang/Object;
    if-eqz v1, :cond_f

    .line 56
    :cond_b
    :goto_b
    return v2

    .line 51
    .end local v0    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_c
    iget-object v0, p0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_5

    .line 56
    .restart local v0    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v1    # "obj":Ljava/lang/Object;
    :cond_f
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/JavaMembers;->findExplicitFunction(Ljava/lang/String;Z)Lorg/mozilla/javascript/MemberBox;

    move-result-object v3

    if-nez v3, :cond_b

    const/4 v2, 0x0

    goto :goto_b
.end method

.method put(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 23
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;
    .param p5, "isStatic"    # Z

    .prologue
    .line 103
    if-eqz p5, :cond_25

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 104
    .local v9, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_6
    move-object/from16 v0, p2

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 105
    .local v11, "member":Ljava/lang/Object;
    if-nez p5, :cond_1a

    if-nez v11, :cond_1a

    .line 107
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/mozilla/javascript/JavaMembers;->staticMembers:Ljava/util/Map;

    move-object/from16 v0, p2

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 109
    :cond_1a
    if-nez v11, :cond_2a

    .line 110
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v14

    throw v14

    .line 103
    .end local v9    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v11    # "member":Ljava/lang/Object;
    :cond_25
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/mozilla/javascript/JavaMembers;->members:Ljava/util/Map;

    goto :goto_6

    .line 111
    .restart local v9    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v11    # "member":Ljava/lang/Object;
    :cond_2a
    instance-of v14, v11, Lorg/mozilla/javascript/FieldAndMethods;

    if-eqz v14, :cond_38

    .line 112
    move-object/from16 v0, p2

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/mozilla/javascript/FieldAndMethods;

    .line 113
    .local v7, "fam":Lorg/mozilla/javascript/FieldAndMethods;
    iget-object v11, v7, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    .line 117
    .end local v7    # "fam":Lorg/mozilla/javascript/FieldAndMethods;
    .end local v11    # "member":Ljava/lang/Object;
    :cond_38
    instance-of v14, v11, Lorg/mozilla/javascript/BeanProperty;

    if-eqz v14, :cond_8b

    move-object v5, v11

    .line 118
    check-cast v5, Lorg/mozilla/javascript/BeanProperty;

    .line 119
    .local v5, "bp":Lorg/mozilla/javascript/BeanProperty;
    iget-object v14, v5, Lorg/mozilla/javascript/BeanProperty;->setter:Lorg/mozilla/javascript/MemberBox;

    if-nez v14, :cond_4c

    .line 120
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v14

    throw v14

    .line 125
    :cond_4c
    iget-object v14, v5, Lorg/mozilla/javascript/BeanProperty;->setters:Lorg/mozilla/javascript/NativeJavaMethod;

    if-eqz v14, :cond_52

    if-nez p4, :cond_73

    .line 126
    :cond_52
    iget-object v14, v5, Lorg/mozilla/javascript/BeanProperty;->setter:Lorg/mozilla/javascript/MemberBox;

    iget-object v14, v14, Lorg/mozilla/javascript/MemberBox;->argTypes:[Ljava/lang/Class;

    const/4 v15, 0x0

    aget-object v12, v14, v15

    .line 127
    .local v12, "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v14, 0x1

    new-array v4, v14, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v12}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v4, v14

    .line 129
    .local v4, "args":[Ljava/lang/Object;
    :try_start_65
    iget-object v14, v5, Lorg/mozilla/javascript/BeanProperty;->setter:Lorg/mozilla/javascript/MemberBox;

    move-object/from16 v0, p3

    invoke-virtual {v14, v0, v4}, Lorg/mozilla/javascript/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_6c} :catch_6d

    .line 163
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v5    # "bp":Lorg/mozilla/javascript/BeanProperty;
    .end local v12    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_6c
    :goto_6c
    return-void

    .line 130
    .restart local v4    # "args":[Ljava/lang/Object;
    .restart local v5    # "bp":Lorg/mozilla/javascript/BeanProperty;
    .restart local v12    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_6d
    move-exception v6

    .line 131
    .local v6, "ex":Ljava/lang/Exception;
    invoke-static {v6}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v14

    throw v14

    .line 134
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v6    # "ex":Ljava/lang/Exception;
    .end local v12    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_73
    const/4 v14, 0x1

    new-array v4, v14, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p4, v4, v14

    .line 135
    .restart local v4    # "args":[Ljava/lang/Object;
    iget-object v14, v5, Lorg/mozilla/javascript/BeanProperty;->setters:Lorg/mozilla/javascript/NativeJavaMethod;

    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v15

    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v14, v15, v0, v1, v4}, Lorg/mozilla/javascript/NativeJavaMethod;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6c

    .line 141
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v5    # "bp":Lorg/mozilla/javascript/BeanProperty;
    :cond_8b
    instance-of v14, v11, Ljava/lang/reflect/Field;

    if-nez v14, :cond_9d

    .line 142
    if-nez v11, :cond_9a

    const-string v13, "msg.java.internal.private"

    .line 144
    .local v13, "str":Ljava/lang/String;
    :goto_93
    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v14

    throw v14

    .line 142
    .end local v13    # "str":Ljava/lang/String;
    :cond_9a
    const-string v13, "msg.java.method.assign"

    goto :goto_93

    :cond_9d
    move-object v8, v11

    .line 146
    check-cast v8, Ljava/lang/reflect/Field;

    .line 147
    .local v8, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-static {v0, v14}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    .line 149
    .local v10, "javaValue":Ljava/lang/Object;
    :try_start_aa
    move-object/from16 v0, p3

    invoke-virtual {v8, v0, v10}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_af
    .catch Ljava/lang/IllegalAccessException; {:try_start_aa .. :try_end_af} :catch_b0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_aa .. :try_end_af} :catch_be

    goto :goto_6c

    .line 150
    :catch_b0
    move-exception v2

    .line 151
    .local v2, "accessEx":Ljava/lang/IllegalAccessException;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v14

    and-int/lit8 v14, v14, 0x10

    if-nez v14, :cond_6c

    .line 155
    invoke-static {v2}, Lorg/mozilla/javascript/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v14

    throw v14

    .line 156
    .end local v2    # "accessEx":Ljava/lang/IllegalAccessException;
    :catch_be
    move-exception v3

    .line 157
    .local v3, "argEx":Ljava/lang/IllegalArgumentException;
    const-string v14, "msg.java.internal.field.type"

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v14, v15, v8, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v14

    throw v14
.end method

.method reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .registers 4
    .param p1, "memberName"    # Ljava/lang/String;

    .prologue
    .line 846
    const-string v0, "msg.java.member.not.found"

    iget-object v1, p0, Lorg/mozilla/javascript/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    return-object v0
.end method
