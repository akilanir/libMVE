.class public abstract Lorg/mozilla/javascript/ScriptableObject;
.super Ljava/lang/Object;
.source "ScriptableObject.java"

# interfaces
.implements Lorg/mozilla/javascript/Scriptable;
.implements Ljava/io/Serializable;
.implements Lorg/mozilla/javascript/debug/DebuggableObject;
.implements Lorg/mozilla/javascript/ConstProperties;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;,
        Lorg/mozilla/javascript/ScriptableObject$GetterSlot;,
        Lorg/mozilla/javascript/ScriptableObject$Slot;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final CONST:I = 0xd

.field public static final DONTENUM:I = 0x2

.field public static final EMPTY:I = 0x0

.field private static final GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;

.field private static final INITIAL_SLOT_SIZE:I = 0x4

.field public static final PERMANENT:I = 0x4

.field public static final READONLY:I = 0x1

.field private static final SLOT_CONVERT_ACCESSOR_TO_DATA:I = 0x5

.field private static final SLOT_MODIFY:I = 0x2

.field private static final SLOT_MODIFY_CONST:I = 0x3

.field private static final SLOT_MODIFY_GETTER_SETTER:I = 0x4

.field private static final SLOT_QUERY:I = 0x1

.field public static final UNINITIALIZED_CONST:I = 0x8

.field static final serialVersionUID:J = 0x2745afa870ac78baL


# instance fields
.field private volatile associatedValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private count:I

.field private transient externalData:Lorg/mozilla/javascript/ExternalArrayData;

.field private transient firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

.field private isExtensible:Z

.field private transient lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

.field private parentScopeObject:Lorg/mozilla/javascript/Scriptable;

.field private prototypeObject:Lorg/mozilla/javascript/Scriptable;

.field private transient slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 47
    const-class v2, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v2}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v2

    if-nez v2, :cond_a

    const/4 v1, 0x1

    :cond_a
    sput-boolean v1, Lorg/mozilla/javascript/ScriptableObject;->$assertionsDisabled:Z

    .line 142
    :try_start_c
    const-class v1, Lorg/mozilla/javascript/ScriptableObject;

    const-string v2, "getExternalArrayLength"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/mozilla/javascript/ScriptableObject;->GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;
    :try_end_19
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_19} :catch_1a

    .line 146
    return-void

    .line 143
    :catch_1a
    move-exception v0

    .line 144
    .local v0, "nsm":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 399
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ScriptableObject;->isExtensible:Z

    .line 400
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .registers 4
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 403
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ScriptableObject;->isExtensible:Z

    .line 404
    if-nez p1, :cond_e

    .line 405
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 407
    :cond_e
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject;->parentScopeObject:Lorg/mozilla/javascript/Scriptable;

    .line 408
    iput-object p2, p0, Lorg/mozilla/javascript/ScriptableObject;->prototypeObject:Lorg/mozilla/javascript/Scriptable;

    .line 409
    return-void
.end method

.method static synthetic access$100(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 2
    .param p0, "x0"    # Lorg/mozilla/javascript/ScriptableObject$Slot;

    .prologue
    .line 47
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    return-object v0
.end method

.method private static addKnownAbsentSlot([Lorg/mozilla/javascript/ScriptableObject$Slot;Lorg/mozilla/javascript/ScriptableObject$Slot;I)V
    .registers 6
    .param p0, "slots"    # [Lorg/mozilla/javascript/ScriptableObject$Slot;
    .param p1, "slot"    # Lorg/mozilla/javascript/ScriptableObject$Slot;
    .param p2, "insertPos"    # I

    .prologue
    .line 3029
    aget-object v2, p0, p2

    if-nez v2, :cond_7

    .line 3030
    aput-object p1, p0, p2

    .line 3040
    :goto_6
    return-void

    .line 3032
    :cond_7
    aget-object v1, p0, p2

    .line 3033
    .local v1, "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget-object v0, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3034
    .local v0, "next":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_b
    if-eqz v0, :cond_11

    .line 3035
    move-object v1, v0

    .line 3036
    iget-object v0, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_b

    .line 3038
    :cond_11
    iput-object p1, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_6
.end method

.method static buildClassCtor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Lorg/mozilla/javascript/BaseFunction;
    .registers 47
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z
    .param p3, "mapInheritance"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/mozilla/javascript/Scriptable;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<TT;>;ZZ)",
            "Lorg/mozilla/javascript/BaseFunction;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 1295
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v30

    .line 1296
    .local v30, "methods":[Ljava/lang/reflect/Method;
    const/16 v25, 0x0

    .local v25, "i":I
    :goto_6
    move-object/from16 v0, v30

    array-length v4, v0

    move/from16 v0, v25

    if-ge v0, v4, :cond_89

    .line 1297
    aget-object v7, v30, v25

    .line 1298
    .local v7, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "init"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 1296
    :cond_1b
    add-int/lit8 v25, v25, 0x1

    goto :goto_6

    .line 1300
    :cond_1e
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v32

    .line 1301
    .local v32, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v32

    array-length v4, v0

    const/4 v6, 0x3

    if-ne v4, v6, :cond_65

    const/4 v4, 0x0

    aget-object v4, v32, v4

    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v4, v6, :cond_65

    const/4 v4, 0x1

    aget-object v4, v32, v4

    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v4, v6, :cond_65

    const/4 v4, 0x2

    aget-object v4, v32, v4

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v4, v6, :cond_65

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-eqz v4, :cond_65

    .line 1307
    const/4 v4, 0x3

    new-array v11, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v6

    aput-object v6, v11, v4

    const/4 v4, 0x1

    aput-object p0, v11, v4

    const/4 v6, 0x2

    if-eqz p2, :cond_62

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_59
    aput-object v4, v11, v6

    .line 1309
    .local v11, "args":[Ljava/lang/Object;
    const/4 v4, 0x0

    invoke-virtual {v7, v4, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1310
    const/16 v18, 0x0

    .line 1521
    .end local v7    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "args":[Ljava/lang/Object;
    .end local v32    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_61
    return-object v18

    .line 1307
    .restart local v7    # "method":Ljava/lang/reflect/Method;
    .restart local v32    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_62
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_59

    .line 1312
    :cond_65
    move-object/from16 v0, v32

    array-length v4, v0

    const/4 v6, 0x1

    if-ne v4, v6, :cond_1b

    const/4 v4, 0x0

    aget-object v4, v32, v4

    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v4, v6, :cond_1b

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 1316
    const/4 v4, 0x1

    new-array v11, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v11, v4

    .line 1317
    .restart local v11    # "args":[Ljava/lang/Object;
    const/4 v4, 0x0

    invoke-virtual {v7, v4, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1318
    const/16 v18, 0x0

    goto :goto_61

    .line 1326
    .end local v7    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "args":[Ljava/lang/Object;
    .end local v32    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_89
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v17

    .line 1327
    .local v17, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    const/16 v36, 0x0

    .line 1328
    .local v36, "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/16 v25, 0x0

    :goto_91
    move-object/from16 v0, v17

    array-length v4, v0

    move/from16 v0, v25

    if-ge v0, v4, :cond_a3

    .line 1329
    aget-object v4, v17, v25

    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_b0

    .line 1330
    aget-object v36, v17, v25

    .line 1334
    :cond_a3
    if-nez v36, :cond_b3

    .line 1335
    const-string v4, "msg.zero.arg.ctor"

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1328
    :cond_b0
    add-int/lit8 v25, v25, 0x1

    goto :goto_91

    .line 1339
    :cond_b3
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, v36

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lorg/mozilla/javascript/Scriptable;

    .line 1340
    .local v35, "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-interface/range {v35 .. v35}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v13

    .line 1343
    .local v13, "className":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v4, v13}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    .line 1344
    .local v18, "existing":Ljava/lang/Object;
    move-object/from16 v0, v18

    instance-of v4, v0, Lorg/mozilla/javascript/BaseFunction;

    if-eqz v4, :cond_e9

    move-object/from16 v4, v18

    .line 1345
    check-cast v4, Lorg/mozilla/javascript/BaseFunction;

    invoke-virtual {v4}, Lorg/mozilla/javascript/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v19

    .line 1346
    .local v19, "existingProto":Ljava/lang/Object;
    if-eqz v19, :cond_e9

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e9

    .line 1347
    check-cast v18, Lorg/mozilla/javascript/BaseFunction;

    goto/16 :goto_61

    .line 1353
    .end local v19    # "existingProto":Ljava/lang/Object;
    :cond_e9
    const/16 v41, 0x0

    .line 1354
    .local v41, "superProto":Lorg/mozilla/javascript/Scriptable;
    if-eqz p3, :cond_11d

    .line 1355
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v40

    .line 1356
    .local v40, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_11d

    invoke-virtual/range {v40 .. v40}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v4

    if-nez v4, :cond_11d

    .line 1359
    invoke-static/range {v40 .. v40}, Lorg/mozilla/javascript/ScriptableObject;->extendsScriptable(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v42

    .line 1361
    .local v42, "superScriptable":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/mozilla/javascript/Scriptable;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    move-result-object v5

    .line 1363
    .local v5, "name":Ljava/lang/String;
    if-eqz v5, :cond_11d

    .line 1364
    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptableObject;->getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v41

    .line 1368
    .end local v5    # "name":Ljava/lang/String;
    .end local v40    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    .end local v42    # "superScriptable":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/mozilla/javascript/Scriptable;>;"
    :cond_11d
    if-nez v41, :cond_123

    .line 1369
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptableObject;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v41

    .line 1371
    :cond_123
    move-object/from16 v0, v35

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 1376
    const-string v23, "jsFunction_"

    .line 1377
    .local v23, "functionPrefix":Ljava/lang/String;
    const-string v38, "jsStaticFunction_"

    .line 1378
    .local v38, "staticFunctionPrefix":Ljava/lang/String;
    const-string v24, "jsGet_"

    .line 1379
    .local v24, "getterPrefix":Ljava/lang/String;
    const-string v37, "jsSet_"

    .line 1380
    .local v37, "setterPrefix":Ljava/lang/String;
    const-string v16, "jsConstructor"

    .line 1382
    .local v16, "ctorName":Ljava/lang/String;
    const-class v4, Lorg/mozilla/javascript/annotations/JSConstructor;

    move-object/from16 v0, v30

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptableObject;->findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;

    move-result-object v15

    .line 1383
    .local v15, "ctorMember":Ljava/lang/reflect/Member;
    if-nez v15, :cond_146

    .line 1384
    const-class v4, Lorg/mozilla/javascript/annotations/JSConstructor;

    move-object/from16 v0, v17

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptableObject;->findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;

    move-result-object v15

    .line 1386
    :cond_146
    if-nez v15, :cond_150

    .line 1387
    const-string v4, "jsConstructor"

    move-object/from16 v0, v30

    invoke-static {v0, v4}, Lorg/mozilla/javascript/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v15

    .line 1389
    :cond_150
    if-nez v15, :cond_18a

    .line 1390
    move-object/from16 v0, v17

    array-length v4, v0

    const/4 v6, 0x1

    if-ne v4, v6, :cond_168

    .line 1391
    const/4 v4, 0x0

    aget-object v15, v17, v4

    .line 1398
    :cond_15b
    :goto_15b
    if-nez v15, :cond_18a

    .line 1399
    const-string v4, "msg.ctor.multiple.parms"

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1392
    :cond_168
    move-object/from16 v0, v17

    array-length v4, v0

    const/4 v6, 0x2

    if-ne v4, v6, :cond_15b

    .line 1393
    const/4 v4, 0x0

    aget-object v4, v17, v4

    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_17c

    .line 1394
    const/4 v4, 0x1

    aget-object v15, v17, v4

    goto :goto_15b

    .line 1395
    :cond_17c
    const/4 v4, 0x1

    aget-object v4, v17, v4

    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_15b

    .line 1396
    const/4 v4, 0x0

    aget-object v15, v17, v4

    goto :goto_15b

    .line 1404
    :cond_18a
    new-instance v14, Lorg/mozilla/javascript/FunctionObject;

    move-object/from16 v0, p0

    invoke-direct {v14, v13, v15, v0}, Lorg/mozilla/javascript/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lorg/mozilla/javascript/Scriptable;)V

    .line 1405
    .local v14, "ctor":Lorg/mozilla/javascript/FunctionObject;
    invoke-virtual {v14}, Lorg/mozilla/javascript/FunctionObject;->isVarArgsMethod()Z

    move-result v4

    if-eqz v4, :cond_1a2

    .line 1406
    const-string v4, "msg.varargs.ctor"

    invoke-interface {v15}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1409
    :cond_1a2
    move-object/from16 v0, p0

    move-object/from16 v1, v35

    invoke-virtual {v14, v0, v1}, Lorg/mozilla/javascript/FunctionObject;->initAsConstructor(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 1411
    const/16 v22, 0x0

    .line 1412
    .local v22, "finishInit":Ljava/lang/reflect/Method;
    new-instance v39, Ljava/util/HashSet;

    invoke-direct/range {v39 .. v39}, Ljava/util/HashSet;-><init>()V

    .line 1413
    .local v39, "staticNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v27, Ljava/util/HashSet;

    invoke-direct/range {v27 .. v27}, Ljava/util/HashSet;-><init>()V

    .line 1414
    .local v27, "instanceNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v12, v30

    .local v12, "arr$":[Ljava/lang/reflect/Method;
    array-length v0, v12

    move/from16 v29, v0

    .local v29, "len$":I
    const/16 v26, 0x0

    .local v26, "i$":I
    :goto_1bc
    move/from16 v0, v26

    move/from16 v1, v29

    if-ge v0, v1, :cond_321

    aget-object v7, v12, v26

    .line 1415
    .restart local v7    # "method":Ljava/lang/reflect/Method;
    if-ne v7, v15, :cond_1c9

    .line 1414
    :cond_1c6
    :goto_1c6
    add-int/lit8 v26, v26, 0x1

    goto :goto_1bc

    .line 1418
    :cond_1c9
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1419
    .restart local v5    # "name":Ljava/lang/String;
    const-string v4, "finishInit"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_201

    .line 1420
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v32

    .line 1421
    .restart local v32    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v32

    array-length v4, v0

    const/4 v6, 0x3

    if-ne v4, v6, :cond_201

    const/4 v4, 0x0

    aget-object v4, v32, v4

    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v4, v6, :cond_201

    const/4 v4, 0x1

    aget-object v4, v32, v4

    const-class v6, Lorg/mozilla/javascript/FunctionObject;

    if-ne v4, v6, :cond_201

    const/4 v4, 0x2

    aget-object v4, v32, v4

    sget-object v6, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v4, v6, :cond_201

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-eqz v4, :cond_201

    .line 1427
    move-object/from16 v22, v7

    .line 1428
    goto :goto_1c6

    .line 1432
    .end local v32    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_201
    const/16 v4, 0x24

    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v6, -0x1

    if-ne v4, v6, :cond_1c6

    .line 1434
    const-string v4, "jsConstructor"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1c6

    .line 1437
    const/4 v10, 0x0

    .line 1438
    .local v10, "annotation":Ljava/lang/annotation/Annotation;
    const/16 v33, 0x0

    .line 1439
    .local v33, "prefix":Ljava/lang/String;
    const-class v4, Lorg/mozilla/javascript/annotations/JSFunction;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_258

    .line 1440
    const-class v4, Lorg/mozilla/javascript/annotations/JSFunction;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    .line 1449
    :cond_223
    :goto_223
    if-nez v10, :cond_22f

    .line 1450
    const-string v4, "jsFunction_"

    invoke-virtual {v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_280

    .line 1451
    const-string v33, "jsFunction_"

    .line 1463
    :cond_22f
    :goto_22f
    instance-of v4, v10, Lorg/mozilla/javascript/annotations/JSStaticFunction;

    if-nez v4, :cond_239

    const-string v4, "jsStaticFunction_"

    move-object/from16 v0, v33

    if-ne v0, v4, :cond_29a

    :cond_239
    const/16 v28, 0x1

    .line 1465
    .local v28, "isStatic":Z
    :goto_23b
    if-eqz v28, :cond_29d

    move-object/from16 v31, v39

    .line 1466
    .local v31, "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :goto_23f
    move-object/from16 v0, v33

    invoke-static {v5, v0, v10}, Lorg/mozilla/javascript/ScriptableObject;->getPropertyName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/annotation/Annotation;)Ljava/lang/String;

    move-result-object v34

    .line 1467
    .local v34, "propName":Ljava/lang/String;
    move-object/from16 v0, v31

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a0

    .line 1468
    const-string v4, "duplicate.defineClass.name"

    move-object/from16 v0, v34

    invoke-static {v4, v5, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1441
    .end local v28    # "isStatic":Z
    .end local v31    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v34    # "propName":Ljava/lang/String;
    :cond_258
    const-class v4, Lorg/mozilla/javascript/annotations/JSStaticFunction;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_267

    .line 1442
    const-class v4, Lorg/mozilla/javascript/annotations/JSStaticFunction;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    goto :goto_223

    .line 1443
    :cond_267
    const-class v4, Lorg/mozilla/javascript/annotations/JSGetter;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_276

    .line 1444
    const-class v4, Lorg/mozilla/javascript/annotations/JSGetter;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    goto :goto_223

    .line 1445
    :cond_276
    const-class v4, Lorg/mozilla/javascript/annotations/JSSetter;

    invoke-virtual {v7, v4}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_223

    goto/16 :goto_1c6

    .line 1452
    :cond_280
    const-string v4, "jsStaticFunction_"

    invoke-virtual {v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_28b

    .line 1453
    const-string v33, "jsStaticFunction_"

    goto :goto_22f

    .line 1454
    :cond_28b
    const-string v4, "jsGet_"

    invoke-virtual {v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_296

    .line 1455
    const-string v33, "jsGet_"

    goto :goto_22f

    .line 1456
    :cond_296
    if-nez v10, :cond_22f

    goto/16 :goto_1c6

    .line 1463
    :cond_29a
    const/16 v28, 0x0

    goto :goto_23b

    .restart local v28    # "isStatic":Z
    :cond_29d
    move-object/from16 v31, v27

    .line 1465
    goto :goto_23f

    .line 1471
    .restart local v31    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v34    # "propName":Ljava/lang/String;
    :cond_2a0
    move-object/from16 v0, v31

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1472
    move-object/from16 v5, v34

    .line 1474
    instance-of v4, v10, Lorg/mozilla/javascript/annotations/JSGetter;

    if-nez v4, :cond_2b3

    const-string v4, "jsGet_"

    move-object/from16 v0, v33

    if-ne v0, v4, :cond_2e1

    .line 1475
    :cond_2b3
    move-object/from16 v0, v35

    instance-of v4, v0, Lorg/mozilla/javascript/ScriptableObject;

    if-nez v4, :cond_2c8

    .line 1476
    const-string v4, "msg.extend.scriptable"

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1480
    :cond_2c8
    const-string v4, "jsSet_"

    move-object/from16 v0, v30

    invoke-static {v0, v5, v4}, Lorg/mozilla/javascript/ScriptableObject;->findSetterMethod([Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 1481
    .local v8, "setter":Ljava/lang/reflect/Method;
    if-eqz v8, :cond_2df

    const/4 v4, 0x0

    :goto_2d3
    or-int/lit8 v9, v4, 0x6

    .local v9, "attr":I
    move-object/from16 v4, v35

    .line 1485
    check-cast v4, Lorg/mozilla/javascript/ScriptableObject;

    const/4 v6, 0x0

    invoke-virtual/range {v4 .. v9}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    goto/16 :goto_1c6

    .line 1481
    .end local v9    # "attr":I
    :cond_2df
    const/4 v4, 0x1

    goto :goto_2d3

    .line 1491
    .end local v8    # "setter":Ljava/lang/reflect/Method;
    :cond_2e1
    if-eqz v28, :cond_2f4

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_2f4

    .line 1492
    const-string v4, "jsStaticFunction must be used with static method."

    invoke-static {v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1496
    :cond_2f4
    new-instance v20, Lorg/mozilla/javascript/FunctionObject;

    move-object/from16 v0, v20

    move-object/from16 v1, v35

    invoke-direct {v0, v5, v7, v1}, Lorg/mozilla/javascript/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lorg/mozilla/javascript/Scriptable;)V

    .line 1497
    .local v20, "f":Lorg/mozilla/javascript/FunctionObject;
    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/FunctionObject;->isVarArgsConstructor()Z

    move-result v4

    if-eqz v4, :cond_30e

    .line 1498
    const-string v4, "msg.varargs.fun"

    invoke-interface {v15}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1501
    :cond_30e
    if-eqz v28, :cond_31e

    move-object v4, v14

    :goto_311
    const/4 v6, 0x2

    move-object/from16 v0, v20

    invoke-static {v4, v5, v0, v6}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1502
    if-eqz p2, :cond_1c6

    .line 1503
    invoke-virtual/range {v20 .. v20}, Lorg/mozilla/javascript/FunctionObject;->sealObject()V

    goto/16 :goto_1c6

    :cond_31e
    move-object/from16 v4, v35

    .line 1501
    goto :goto_311

    .line 1508
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "method":Ljava/lang/reflect/Method;
    .end local v10    # "annotation":Ljava/lang/annotation/Annotation;
    .end local v20    # "f":Lorg/mozilla/javascript/FunctionObject;
    .end local v28    # "isStatic":Z
    .end local v31    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v33    # "prefix":Ljava/lang/String;
    .end local v34    # "propName":Ljava/lang/String;
    :cond_321
    if-eqz v22, :cond_339

    .line 1509
    const/4 v4, 0x3

    new-array v0, v4, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/4 v4, 0x0

    aput-object p0, v21, v4

    const/4 v4, 0x1

    aput-object v14, v21, v4

    const/4 v4, 0x2

    aput-object v35, v21, v4

    .line 1510
    .local v21, "finishArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1514
    .end local v21    # "finishArgs":[Ljava/lang/Object;
    :cond_339
    if-eqz p2, :cond_349

    .line 1515
    invoke-virtual {v14}, Lorg/mozilla/javascript/FunctionObject;->sealObject()V

    .line 1516
    move-object/from16 v0, v35

    instance-of v4, v0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v4, :cond_349

    .line 1517
    check-cast v35, Lorg/mozilla/javascript/ScriptableObject;

    .end local v35    # "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/ScriptableObject;->sealObject()V

    :cond_349
    move-object/from16 v18, v14

    .line 1521
    goto/16 :goto_61
.end method

.method protected static buildDataDescriptor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject;
    .registers 8
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "attributes"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 217
    new-instance v0, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 218
    .local v0, "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->Object:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, p0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 219
    const-string v1, "value"

    invoke-virtual {v0, v1, p1, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 220
    const-string v4, "writable"

    and-int/lit8 v1, p2, 0x1

    if-nez v1, :cond_3b

    move v1, v2

    :goto_18
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v4, v1, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 221
    const-string v4, "enumerable"

    and-int/lit8 v1, p2, 0x2

    if-nez v1, :cond_3d

    move v1, v2

    :goto_26
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v4, v1, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 222
    const-string v1, "configurable"

    and-int/lit8 v4, p2, 0x4

    if-nez v4, :cond_3f

    :goto_33
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 223
    return-object v0

    :cond_3b
    move v1, v3

    .line 220
    goto :goto_18

    :cond_3d
    move v1, v3

    .line 221
    goto :goto_26

    :cond_3f
    move v2, v3

    .line 222
    goto :goto_33
.end method

.method public static callMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 2593
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2594
    .local v1, "funObj":Ljava/lang/Object;
    instance-of v3, v1, Lorg/mozilla/javascript/Function;

    if-nez v3, :cond_d

    .line 2595
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    :cond_d
    move-object v0, v1

    .line 2597
    check-cast v0, Lorg/mozilla/javascript/Function;

    .line 2605
    .local v0, "fun":Lorg/mozilla/javascript/Function;
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 2606
    .local v2, "scope":Lorg/mozilla/javascript/Scriptable;
    if-eqz p0, :cond_1b

    .line 2607
    invoke-interface {v0, p0, v2, p1, p3}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 2609
    :goto_1a
    return-object v3

    :cond_1b
    const/4 v3, 0x0

    invoke-static {v3, v0, v2, p1, p3}, Lorg/mozilla/javascript/Context;->call(Lorg/mozilla/javascript/ContextFactory;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1a
.end method

.method public static callMethod(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 2579
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->callMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private checkNotSealed(Ljava/lang/String;I)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 2245
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->isSealed()Z

    move-result v1

    if-nez v1, :cond_7

    .line 2246
    return-void

    .line 2248
    :cond_7
    if-eqz p1, :cond_11

    move-object v0, p1

    .line 2249
    .local v0, "str":Ljava/lang/String;
    :goto_a
    const-string v1, "msg.modify.sealed"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v1

    throw v1

    .line 2248
    .end local v0    # "str":Ljava/lang/String;
    :cond_11
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method static checkValidAttributes(I)V
    .registers 4
    .param p0, "attributes"    # I

    .prologue
    .line 392
    const/16 v0, 0xf

    .line 393
    .local v0, "mask":I
    and-int/lit8 v1, p0, -0x10

    if-eqz v1, :cond_10

    .line 394
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 396
    :cond_10
    return-void
.end method

.method private static copyTable([Lorg/mozilla/javascript/ScriptableObject$Slot;[Lorg/mozilla/javascript/ScriptableObject$Slot;I)V
    .registers 9
    .param p0, "oldSlots"    # [Lorg/mozilla/javascript/ScriptableObject$Slot;
    .param p1, "newSlots"    # [Lorg/mozilla/javascript/ScriptableObject$Slot;
    .param p2, "count"    # I

    .prologue
    .line 3001
    if-nez p2, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 3003
    :cond_7
    array-length v4, p1

    .line 3004
    .local v4, "tableSize":I
    array-length v0, p0

    .line 3006
    .local v0, "i":I
    :cond_9
    add-int/lit8 v0, v0, -0x1

    .line 3007
    aget-object v3, p0, v0

    .line 3008
    .local v3, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_d
    if-eqz v3, :cond_9

    .line 3009
    iget v5, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v2

    .line 3012
    .local v2, "insertPos":I
    iget-object v5, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-nez v5, :cond_24

    move-object v1, v3

    .line 3013
    .local v1, "insSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_1a
    invoke-static {p1, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->addKnownAbsentSlot([Lorg/mozilla/javascript/ScriptableObject$Slot;Lorg/mozilla/javascript/ScriptableObject$Slot;I)V

    .line 3014
    iget-object v3, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3015
    add-int/lit8 p2, p2, -0x1

    if-nez p2, :cond_d

    .line 3016
    return-void

    .line 3012
    .end local v1    # "insSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_24
    new-instance v1, Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;

    invoke-direct {v1, v3}, Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;-><init>(Lorg/mozilla/javascript/ScriptableObject$Slot;)V

    goto :goto_1a
.end method

.method private declared-synchronized createSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "indexOrHash"    # I
    .param p3, "accessType"    # I

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x4

    .line 2845
    monitor-enter p0

    :try_start_3
    iget-object v5, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2847
    .local v5, "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-nez v7, :cond_3d

    .line 2849
    const/4 v7, 0x4

    new-array v5, v7, [Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2850
    iput-object v5, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2851
    array-length v7, v5

    invoke-static {v7, p2}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v1

    .line 2921
    .local v1, "insertPos":I
    :cond_13
    :goto_13
    if-ne p3, v9, :cond_cf

    new-instance v2, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    const/4 v7, 0x0

    invoke-direct {v2, p1, p2, v7}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;-><init>(Ljava/lang/String;II)V

    .line 2924
    .local v2, "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_1b
    if-ne p3, v10, :cond_22

    .line 2925
    const/16 v7, 0xd

    invoke-virtual {v2, v7}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setAttributes(I)V

    .line 2926
    :cond_22
    iget v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    .line 2928
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-eqz v7, :cond_30

    .line 2929
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v2, v7, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2930
    :cond_30
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-nez v7, :cond_36

    .line 2931
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2932
    :cond_36
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2934
    invoke-static {v5, v2, v1}, Lorg/mozilla/javascript/ScriptableObject;->addKnownAbsentSlot([Lorg/mozilla/javascript/ScriptableObject$Slot;Lorg/mozilla/javascript/ScriptableObject$Slot;I)V
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_8e

    .line 2935
    .end local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_3b
    monitor-exit p0

    return-object v2

    .line 2853
    .end local v1    # "insertPos":I
    :cond_3d
    :try_start_3d
    array-length v6, v5

    .line 2854
    .local v6, "tableSize":I
    invoke-static {v6, p2}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v1

    .line 2855
    .restart local v1    # "insertPos":I
    aget-object v3, v5, v1

    .line 2856
    .local v3, "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    move-object v4, v3

    .line 2857
    .local v4, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_45
    if-eqz v4, :cond_59

    .line 2858
    iget v7, v4, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    if-ne v7, p2, :cond_91

    iget-object v7, v4, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    if-eq v7, p1, :cond_59

    if-eqz p1, :cond_91

    iget-object v7, v4, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_91

    .line 2868
    :cond_59
    if-eqz v4, :cond_af

    .line 2875
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 2878
    .local v0, "inner":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-ne p3, v9, :cond_95

    instance-of v7, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-nez v7, :cond_95

    .line 2880
    new-instance v2, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v7

    invoke-direct {v2, p1, p2, v7}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;-><init>(Ljava/lang/String;II)V

    .line 2890
    .restart local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_6e
    iget-object v7, v0, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    iput-object v7, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2891
    iget-object v7, v4, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v7, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2893
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-eqz v7, :cond_7e

    .line 2894
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v2, v7, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2896
    :cond_7e
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-nez v7, :cond_84

    .line 2897
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2899
    :cond_84
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2901
    if-ne v3, v4, :cond_ac

    .line 2902
    aput-object v2, v5, v1

    .line 2907
    :goto_8a
    invoke-virtual {v4}, Lorg/mozilla/javascript/ScriptableObject$Slot;->markDeleted()V
    :try_end_8d
    .catchall {:try_start_3d .. :try_end_8d} :catchall_8e

    goto :goto_3b

    .line 2845
    .end local v0    # "inner":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v1    # "insertPos":I
    .end local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v3    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v4    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v6    # "tableSize":I
    :catchall_8e
    move-exception v7

    monitor-exit p0

    throw v7

    .line 2864
    .restart local v1    # "insertPos":I
    .restart local v3    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v4    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v6    # "tableSize":I
    :cond_91
    move-object v3, v4

    .line 2865
    :try_start_92
    iget-object v4, v4, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_45

    .line 2881
    .restart local v0    # "inner":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_95
    const/4 v7, 0x5

    if-ne p3, v7, :cond_a6

    instance-of v7, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-eqz v7, :cond_a6

    .line 2883
    new-instance v2, Lorg/mozilla/javascript/ScriptableObject$Slot;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v7

    invoke-direct {v2, p1, p2, v7}, Lorg/mozilla/javascript/ScriptableObject$Slot;-><init>(Ljava/lang/String;II)V

    .restart local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    goto :goto_6e

    .line 2884
    .end local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_a6
    if-ne p3, v10, :cond_aa

    .line 2885
    const/4 v2, 0x0

    goto :goto_3b

    :cond_aa
    move-object v2, v0

    .line 2887
    goto :goto_3b

    .line 2904
    .restart local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_ac
    iput-object v2, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_8a

    .line 2911
    .end local v0    # "inner":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v2    # "newSlot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_af
    iget v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    add-int/lit8 v7, v7, 0x1

    mul-int/lit8 v7, v7, 0x4

    array-length v8, v5

    mul-int/lit8 v8, v8, 0x3

    if-le v7, v8, :cond_13

    .line 2913
    array-length v7, v5

    mul-int/lit8 v7, v7, 0x2

    new-array v5, v7, [Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2914
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    iget v8, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    invoke-static {v7, v5, v8}, Lorg/mozilla/javascript/ScriptableObject;->copyTable([Lorg/mozilla/javascript/ScriptableObject$Slot;[Lorg/mozilla/javascript/ScriptableObject$Slot;I)V

    .line 2915
    iput-object v5, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2916
    array-length v7, v5

    invoke-static {v7, p2}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v1

    goto/16 :goto_13

    .line 2921
    .end local v3    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v4    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v6    # "tableSize":I
    :cond_cf
    new-instance v2, Lorg/mozilla/javascript/ScriptableObject$Slot;

    const/4 v7, 0x0

    invoke-direct {v2, p1, p2, v7}, Lorg/mozilla/javascript/ScriptableObject$Slot;-><init>(Ljava/lang/String;II)V
    :try_end_d5
    .catchall {:try_start_92 .. :try_end_d5} :catchall_8e

    goto/16 :goto_1b
.end method

.method public static defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;
    .registers 7
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z
    .param p3, "mapInheritance"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/mozilla/javascript/Scriptable;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<TT;>;ZZ)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 1279
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->buildClassCtor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v0

    .line 1281
    .local v0, "ctor":Lorg/mozilla/javascript/BaseFunction;
    if-nez v0, :cond_8

    .line 1282
    const/4 v1, 0x0

    .line 1285
    :goto_7
    return-object v1

    .line 1283
    :cond_8
    invoke-virtual {v0}, Lorg/mozilla/javascript/BaseFunction;->getClassPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 1284
    .local v1, "name":Ljava/lang/String;
    const/4 v2, 0x2

    invoke-static {p0, v1, v0, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_7
.end method

.method public static defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/mozilla/javascript/Scriptable;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    .line 1212
    invoke-static {p0, p1, v0, v0}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    .line 1213
    return-void
.end method

.method public static defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/mozilla/javascript/Scriptable;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<TT;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 1243
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    .line 1244
    return-void
.end method

.method public static defineConstProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)V
    .registers 5
    .param p0, "destination"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1644
    instance-of v1, p0, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v1, :cond_b

    move-object v0, p0

    .line 1645
    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    .line 1646
    .local v0, "cp":Lorg/mozilla/javascript/ConstProperties;
    invoke-interface {v0, p1, p0}, Lorg/mozilla/javascript/ConstProperties;->defineConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V

    .line 1649
    .end local v0    # "cp":Lorg/mozilla/javascript/ConstProperties;
    :goto_a
    return-void

    .line 1648
    :cond_b
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    const/16 v2, 0xd

    invoke-static {p0, p1, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_a
.end method

.method public static defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 6
    .param p0, "destination"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "attributes"    # I

    .prologue
    .line 1627
    instance-of v1, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-nez v1, :cond_8

    .line 1628
    invoke-interface {p0, p1, p0, p2}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 1633
    :goto_7
    return-void

    :cond_8
    move-object v0, p0

    .line 1631
    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    .line 1632
    .local v0, "so":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_7
.end method

.method public static deleteProperty(Lorg/mozilla/javascript/Scriptable;I)Z
    .registers 5
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 2515
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2516
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_8

    .line 2519
    :cond_7
    :goto_7
    return v1

    .line 2518
    :cond_8
    invoke-interface {v0, p1}, Lorg/mozilla/javascript/Scriptable;->delete(I)V

    .line 2519
    invoke-interface {v0, p1, p0}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v1, 0x0

    goto :goto_7
.end method

.method public static deleteProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z
    .registers 5
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 2495
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2496
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_8

    .line 2499
    :cond_7
    :goto_7
    return v1

    .line 2498
    :cond_8
    invoke-interface {v0, p1}, Lorg/mozilla/javascript/Scriptable;->delete(Ljava/lang/String;)V

    .line 2499
    invoke-interface {v0, p1, p0}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v1, 0x0

    goto :goto_7
.end method

.method protected static ensureScriptable(Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "arg"    # Ljava/lang/Object;

    .prologue
    .line 2077
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_f

    .line 2078
    const-string v0, "msg.arg.not.object"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2079
    :cond_f
    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "arg":Ljava/lang/Object;
    return-object p0
.end method

.method protected static ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 3
    .param p0, "arg"    # Ljava/lang/Object;

    .prologue
    .line 2083
    instance-of v0, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-nez v0, :cond_f

    .line 2084
    const-string v0, "msg.arg.not.object"

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2085
    :cond_f
    check-cast p0, Lorg/mozilla/javascript/ScriptableObject;

    .end local p0    # "arg":Ljava/lang/Object;
    return-object p0
.end method

.method private static extendsScriptable(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/mozilla/javascript/Scriptable;",
            ">(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1594
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1596
    .end local p0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_8
    return-object p0

    .restart local p0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    const/4 p0, 0x0

    goto :goto_8
.end method

.method private static findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;
    .registers 7
    .param p0, "members"    # [Ljava/lang/reflect/AccessibleObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/AccessibleObject;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/lang/reflect/Member;"
        }
    .end annotation

    .prologue
    .line 1526
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/reflect/AccessibleObject;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_13

    aget-object v3, v0, v1

    .line 1527
    .local v3, "member":Ljava/lang/reflect/AccessibleObject;
    invoke-virtual {v3, p1}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1528
    check-cast v3, Ljava/lang/reflect/Member;

    .line 1531
    .end local v3    # "member":Ljava/lang/reflect/AccessibleObject;
    :goto_f
    return-object v3

    .line 1526
    .restart local v3    # "member":Ljava/lang/reflect/AccessibleObject;
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1531
    .end local v3    # "member":Ljava/lang/reflect/AccessibleObject;
    :cond_13
    const/4 v3, 0x0

    goto :goto_f
.end method

.method private findAttributeSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "accessType"    # I

    .prologue
    .line 2777
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 2778
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v0, :cond_15

    .line 2779
    if-eqz p1, :cond_10

    move-object v1, p1

    .line 2780
    .local v1, "str":Ljava/lang/String;
    :goto_9
    const-string v2, "msg.prop.not.found"

    invoke-static {v2, v1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 2779
    .end local v1    # "str":Ljava/lang/String;
    :cond_10
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 2782
    :cond_15
    return-object v0
.end method

.method private static findSetterMethod([Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 12
    .param p0, "methods"    # [Ljava/lang/reflect/Method;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1537
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "set"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1540
    .local v5, "newStyleName":Ljava/lang/String;
    move-object v1, p0

    .local v1, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_28
    if-ge v2, v3, :cond_5a

    aget-object v4, v1, v2

    .line 1541
    .local v4, "method":Ljava/lang/reflect/Method;
    const-class v7, Lorg/mozilla/javascript/annotations/JSSetter;

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/annotations/JSSetter;

    .line 1542
    .local v0, "annotation":Lorg/mozilla/javascript/annotations/JSSetter;
    if-eqz v0, :cond_57

    .line 1543
    invoke-interface {v0}, Lorg/mozilla/javascript/annotations/JSSetter;->value()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_56

    const-string v7, ""

    invoke-interface {v0}, Lorg/mozilla/javascript/annotations/JSSetter;->value()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_57

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_57

    .line 1555
    .end local v0    # "annotation":Lorg/mozilla/javascript/annotations/JSSetter;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_56
    :goto_56
    return-object v4

    .line 1540
    .restart local v0    # "annotation":Lorg/mozilla/javascript/annotations/JSSetter;
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    :cond_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    .line 1549
    .end local v0    # "annotation":Lorg/mozilla/javascript/annotations/JSSetter;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_5a
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1550
    .local v6, "oldStyleName":Ljava/lang/String;
    move-object v1, p0

    array-length v3, v1

    const/4 v2, 0x0

    :goto_6e
    if-ge v2, v3, :cond_7f

    aget-object v4, v1, v2

    .line 1551
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_56

    .line 1550
    add-int/lit8 v2, v2, 0x1

    goto :goto_6e

    .line 1555
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_7f
    const/4 v4, 0x0

    goto :goto_56
.end method

.method public static getArrayPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2136
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->Array:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method private static getBase(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I

    .prologue
    .line 2626
    :cond_0
    invoke-interface {p0, p1, p0}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2630
    :goto_6
    return-object p0

    .line 2628
    :cond_7
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2629
    if-nez p0, :cond_0

    goto :goto_6
.end method

.method private static getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2616
    :cond_0
    invoke-interface {p0, p1, p0}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2620
    :goto_6
    return-object p0

    .line 2618
    :cond_7
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2619
    if-nez p0, :cond_0

    goto :goto_6
.end method

.method public static getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;
    .registers 7
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2158
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2159
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2161
    .local v0, "ctor":Ljava/lang/Object;
    instance-of v4, v0, Lorg/mozilla/javascript/BaseFunction;

    if-eqz v4, :cond_1a

    .line 2162
    check-cast v0, Lorg/mozilla/javascript/BaseFunction;

    .end local v0    # "ctor":Ljava/lang/Object;
    invoke-virtual {v0}, Lorg/mozilla/javascript/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v2

    .line 2169
    .local v2, "proto":Ljava/lang/Object;
    :goto_13
    instance-of v4, v2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_2a

    .line 2170
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 2172
    .end local v2    # "proto":Ljava/lang/Object;
    :goto_19
    return-object v2

    .line 2163
    .restart local v0    # "ctor":Ljava/lang/Object;
    :cond_1a
    instance-of v4, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_28

    move-object v1, v0

    .line 2164
    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .line 2165
    .local v1, "ctorObj":Lorg/mozilla/javascript/Scriptable;
    const-string v4, "prototype"

    invoke-interface {v1, v4, v1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 2166
    .restart local v2    # "proto":Ljava/lang/Object;
    goto :goto_13

    .end local v1    # "ctorObj":Lorg/mozilla/javascript/Scriptable;
    .end local v2    # "proto":Ljava/lang/Object;
    :cond_28
    move-object v2, v3

    .line 2167
    goto :goto_19

    .end local v0    # "ctor":Ljava/lang/Object;
    .restart local v2    # "proto":Ljava/lang/Object;
    :cond_2a
    move-object v2, v3

    .line 2172
    goto :goto_19
.end method

.method public static getDefaultValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 15
    .param p0, "object"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 984
    const/4 v2, 0x0

    .line 985
    .local v2, "cx":Lorg/mozilla/javascript/Context;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    const/4 v10, 0x2

    if-ge v5, v10, :cond_bf

    .line 987
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v10, :cond_21

    .line 988
    if-nez v5, :cond_1f

    move v7, v11

    .line 995
    .local v7, "tryToString":Z
    :goto_e
    if-eqz v7, :cond_27

    .line 996
    const-string v6, "toString"

    .line 997
    .local v6, "methodName":Ljava/lang/String;
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1033
    .local v1, "args":[Ljava/lang/Object;
    :goto_14
    invoke-static {p0, v6}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 1034
    .local v9, "v":Ljava/lang/Object;
    instance-of v10, v9, Lorg/mozilla/javascript/Function;

    if-nez v10, :cond_8c

    .line 985
    :cond_1c
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .end local v1    # "args":[Ljava/lang/Object;
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "tryToString":Z
    .end local v9    # "v":Ljava/lang/Object;
    :cond_1f
    move v7, v12

    .line 988
    goto :goto_e

    .line 990
    :cond_21
    if-ne v5, v11, :cond_25

    move v7, v11

    .restart local v7    # "tryToString":Z
    :goto_24
    goto :goto_e

    .end local v7    # "tryToString":Z
    :cond_25
    move v7, v12

    goto :goto_24

    .line 999
    .restart local v7    # "tryToString":Z
    :cond_27
    const-string v6, "valueOf"

    .line 1000
    .restart local v6    # "methodName":Ljava/lang/String;
    new-array v1, v11, [Ljava/lang/Object;

    .line 1002
    .restart local v1    # "args":[Ljava/lang/Object;
    if-nez p1, :cond_32

    .line 1003
    const-string v4, "undefined"

    .line 1031
    .local v4, "hint":Ljava/lang/String;
    :goto_2f
    aput-object v4, v1, v12

    goto :goto_14

    .line 1004
    .end local v4    # "hint":Ljava/lang/String;
    :cond_32
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v10, :cond_39

    .line 1005
    const-string v4, "string"

    .restart local v4    # "hint":Ljava/lang/String;
    goto :goto_2f

    .line 1006
    .end local v4    # "hint":Ljava/lang/String;
    :cond_39
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne p1, v10, :cond_40

    .line 1007
    const-string v4, "object"

    .restart local v4    # "hint":Ljava/lang/String;
    goto :goto_2f

    .line 1008
    .end local v4    # "hint":Ljava/lang/String;
    :cond_40
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne p1, v10, :cond_47

    .line 1009
    const-string v4, "function"

    .restart local v4    # "hint":Ljava/lang/String;
    goto :goto_2f

    .line 1010
    .end local v4    # "hint":Ljava/lang/String;
    :cond_47
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_4f

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v10, :cond_52

    .line 1013
    :cond_4f
    const-string v4, "boolean"

    .restart local v4    # "hint":Ljava/lang/String;
    goto :goto_2f

    .line 1014
    .end local v4    # "hint":Ljava/lang/String;
    :cond_52
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_7e

    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v10, :cond_81

    .line 1026
    :cond_7e
    const-string v4, "number"

    .restart local v4    # "hint":Ljava/lang/String;
    goto :goto_2f

    .line 1028
    .end local v4    # "hint":Ljava/lang/String;
    :cond_81
    const-string v10, "msg.invalid.type"

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v10

    throw v10

    .restart local v9    # "v":Ljava/lang/Object;
    :cond_8c
    move-object v3, v9

    .line 1036
    check-cast v3, Lorg/mozilla/javascript/Function;

    .line 1037
    .local v3, "fun":Lorg/mozilla/javascript/Function;
    if-nez v2, :cond_95

    .line 1038
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    .line 1039
    :cond_95
    invoke-interface {v3}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v10

    invoke-interface {v3, v2, v10, p0, v1}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 1040
    if-eqz v9, :cond_1c

    .line 1041
    instance-of v10, v9, Lorg/mozilla/javascript/Scriptable;

    if-nez v10, :cond_a4

    .line 1054
    .end local v9    # "v":Ljava/lang/Object;
    :cond_a3
    :goto_a3
    return-object v9

    .line 1044
    .restart local v9    # "v":Ljava/lang/Object;
    :cond_a4
    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_a3

    sget-object v10, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-eq p1, v10, :cond_a3

    .line 1049
    if-eqz v7, :cond_1c

    instance-of v10, v9, Lorg/mozilla/javascript/Wrapper;

    if-eqz v10, :cond_1c

    move-object v10, v9

    .line 1052
    check-cast v10, Lorg/mozilla/javascript/Wrapper;

    invoke-interface {v10}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v8

    .line 1053
    .local v8, "u":Ljava/lang/Object;
    instance-of v10, v8, Ljava/lang/String;

    if-eqz v10, :cond_1c

    move-object v9, v8

    .line 1054
    goto :goto_a3

    .line 1059
    .end local v1    # "args":[Ljava/lang/Object;
    .end local v3    # "fun":Lorg/mozilla/javascript/Function;
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "tryToString":Z
    .end local v8    # "u":Ljava/lang/Object;
    .end local v9    # "v":Ljava/lang/Object;
    :cond_bf
    if-nez p1, :cond_ca

    const-string v0, "undefined"

    .line 1060
    .local v0, "arg":Ljava/lang/String;
    :goto_c3
    const-string v10, "msg.default.value"

    invoke-static {v10, v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v10

    throw v10

    .line 1059
    .end local v0    # "arg":Ljava/lang/String;
    :cond_ca
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_c3
.end method

.method public static getFunctionPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2131
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->Function:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2122
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->Object:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I

    .prologue
    .line 2321
    move-object v1, p0

    .line 2324
    .local v1, "start":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-interface {p0, p1, v1}, Lorg/mozilla/javascript/Scriptable;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 2325
    .local v0, "result":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_a

    .line 2329
    :goto_9
    return-object v0

    .line 2327
    :cond_a
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2328
    if-nez p0, :cond_1

    goto :goto_9
.end method

.method public static getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2266
    move-object v1, p0

    .line 2269
    .local v1, "start":Lorg/mozilla/javascript/Scriptable;
    :cond_1
    invoke-interface {p0, p1, v1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 2270
    .local v0, "result":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_a

    .line 2274
    :goto_9
    return-object v0

    .line 2272
    :cond_a
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2273
    if-nez p0, :cond_1

    goto :goto_9
.end method

.method public static getPropertyIds(Lorg/mozilla/javascript/Scriptable;)[Ljava/lang/Object;
    .registers 7
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2533
    if-nez p0, :cond_5

    .line 2534
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 2565
    :cond_4
    :goto_4
    return-object v3

    .line 2536
    :cond_5
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 2537
    .local v3, "result":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 2539
    .local v2, "map":Lorg/mozilla/javascript/ObjToIntMap;
    :cond_a
    :goto_a
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2540
    if-nez p0, :cond_17

    .line 2562
    if-eqz v2, :cond_4

    .line 2563
    invoke-virtual {v2}, Lorg/mozilla/javascript/ObjToIntMap;->getKeys()[Ljava/lang/Object;

    move-result-object v3

    goto :goto_4

    .line 2543
    :cond_17
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v1

    .line 2544
    .local v1, "ids":[Ljava/lang/Object;
    array-length v4, v1

    if-eqz v4, :cond_a

    .line 2547
    if-nez v2, :cond_3a

    .line 2548
    array-length v4, v3

    if-nez v4, :cond_25

    .line 2549
    move-object v3, v1

    .line 2550
    goto :goto_a

    .line 2552
    :cond_25
    new-instance v2, Lorg/mozilla/javascript/ObjToIntMap;

    .end local v2    # "map":Lorg/mozilla/javascript/ObjToIntMap;
    array-length v4, v3

    array-length v5, v1

    add-int/2addr v4, v5

    invoke-direct {v2, v4}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    .line 2553
    .restart local v2    # "map":Lorg/mozilla/javascript/ObjToIntMap;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    array-length v4, v3

    if-eq v0, v4, :cond_39

    .line 2554
    aget-object v4, v3, v0

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2553
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 2556
    :cond_39
    const/4 v3, 0x0

    .line 2558
    .end local v0    # "i":I
    :cond_3a
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3b
    array-length v4, v1

    if-eq v0, v4, :cond_a

    .line 2559
    aget-object v4, v1, v0

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2558
    add-int/lit8 v0, v0, 0x1

    goto :goto_3b
.end method

.method private static getPropertyName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/annotation/Annotation;)Ljava/lang/String;
    .registers 8
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "annotation"    # Ljava/lang/annotation/Annotation;

    .prologue
    const/4 v4, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1561
    if-eqz p1, :cond_e

    .line 1562
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1588
    .end local p2    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_d
    :goto_d
    return-object v0

    .line 1564
    .restart local p2    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_e
    const/4 v0, 0x0

    .line 1565
    .local v0, "propName":Ljava/lang/String;
    instance-of v1, p2, Lorg/mozilla/javascript/annotations/JSGetter;

    if-eqz v1, :cond_79

    .line 1566
    check-cast p2, Lorg/mozilla/javascript/annotations/JSGetter;

    .end local p2    # "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {p2}, Lorg/mozilla/javascript/annotations/JSGetter;->value()Ljava/lang/String;

    move-result-object v0

    .line 1567
    if-eqz v0, :cond_21

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_47

    .line 1568
    :cond_21
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v4, :cond_47

    const-string v1, "get"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 1569
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1570
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 1571
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v3, :cond_51

    .line 1572
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 1585
    :cond_47
    :goto_47
    if-eqz v0, :cond_4f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    .line 1586
    :cond_4f
    move-object v0, p0

    goto :goto_d

    .line 1573
    :cond_51
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_47

    .line 1574
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_47

    .line 1580
    .restart local p2    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_79
    instance-of v1, p2, Lorg/mozilla/javascript/annotations/JSFunction;

    if-eqz v1, :cond_84

    .line 1581
    check-cast p2, Lorg/mozilla/javascript/annotations/JSFunction;

    .end local p2    # "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {p2}, Lorg/mozilla/javascript/annotations/JSFunction;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_47

    .line 1582
    .restart local p2    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_84
    instance-of v1, p2, Lorg/mozilla/javascript/annotations/JSStaticFunction;

    if-eqz v1, :cond_47

    .line 1583
    check-cast p2, Lorg/mozilla/javascript/annotations/JSStaticFunction;

    .end local p2    # "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {p2}, Lorg/mozilla/javascript/annotations/JSStaticFunction;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_47
.end method

.method private getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "accessType"    # I

    .prologue
    .line 2799
    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2800
    .local v3, "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v3, :cond_9

    const/4 v5, 0x1

    if-ne p3, v5, :cond_9

    .line 2801
    const/4 v1, 0x0

    .line 2841
    :goto_8
    :pswitch_8
    return-object v1

    .line 2804
    :cond_9
    if-eqz p1, :cond_32

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 2805
    .local v0, "indexOrHash":I
    :goto_f
    if-eqz v3, :cond_2d

    .line 2807
    array-length v5, v3

    invoke-static {v5, v0}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v2

    .line 2808
    .local v2, "slotIndex":I
    aget-object v1, v3, v2

    .line 2809
    .local v1, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_18
    if-eqz v1, :cond_2a

    .line 2811
    iget-object v4, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    .line 2812
    .local v4, "sname":Ljava/lang/String;
    iget v5, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    if-ne v0, v5, :cond_34

    if-eq v4, p1, :cond_2a

    if-eqz p1, :cond_34

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 2818
    .end local v4    # "sname":Ljava/lang/String;
    :cond_2a
    packed-switch p3, :pswitch_data_4c

    .line 2841
    .end local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v2    # "slotIndex":I
    :cond_2d
    invoke-direct {p0, p1, v0, p3}, Lorg/mozilla/javascript/ScriptableObject;->createSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    goto :goto_8

    .end local v0    # "indexOrHash":I
    :cond_32
    move v0, p2

    .line 2804
    goto :goto_f

    .line 2810
    .restart local v0    # "indexOrHash":I
    .restart local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v2    # "slotIndex":I
    .restart local v4    # "sname":Ljava/lang/String;
    :cond_34
    iget-object v1, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_18

    .line 2823
    .end local v4    # "sname":Ljava/lang/String;
    :pswitch_37
    if-eqz v1, :cond_2d

    goto :goto_8

    .line 2827
    :pswitch_3a
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 2828
    instance-of v5, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-eqz v5, :cond_2d

    goto :goto_8

    .line 2832
    :pswitch_43
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 2833
    instance-of v5, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-nez v5, :cond_2d

    goto :goto_8

    .line 2818
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_8
        :pswitch_37
        :pswitch_37
        :pswitch_3a
        :pswitch_43
    .end packed-switch
.end method

.method private static getSlotIndex(II)I
    .registers 3
    .param p0, "tableSize"    # I
    .param p1, "indexOrHash"    # I

    .prologue
    .line 2995
    add-int/lit8 v0, p0, -0x1

    and-int/2addr v0, p1

    return v0
.end method

.method public static getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .registers 2
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 2187
    :goto_0
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2188
    .local v0, "parent":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_7

    .line 2189
    return-object p0

    .line 2191
    :cond_7
    move-object p0, v0

    .line 2192
    goto :goto_0
.end method

.method public static getTopScopeValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 2659
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2661
    :cond_4
    instance-of v2, p0, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v2, :cond_12

    move-object v0, p0

    .line 2662
    check-cast v0, Lorg/mozilla/javascript/ScriptableObject;

    .line 2663
    .local v0, "so":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2664
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_12

    .line 2670
    .end local v0    # "so":Lorg/mozilla/javascript/ScriptableObject;
    .end local v1    # "value":Ljava/lang/Object;
    :goto_11
    return-object v1

    .line 2668
    :cond_12
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p0

    .line 2669
    if-nez p0, :cond_4

    .line 2670
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public static getTypedProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "s"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 2297
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 2298
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_9

    .line 2299
    const/4 v0, 0x0

    .line 2301
    .end local v0    # "val":Ljava/lang/Object;
    :cond_9
    invoke-static {v0, p2}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getTypedProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "s"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 2349
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2350
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_9

    .line 2351
    const/4 v0, 0x0

    .line 2353
    .end local v0    # "val":Ljava/lang/Object;
    :cond_9
    invoke-static {v0, p2}, Lorg/mozilla/javascript/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static hasProperty(Lorg/mozilla/javascript/Scriptable;I)Z
    .registers 3
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I

    .prologue
    .line 2409
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z
    .registers 3
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2369
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected static isFalse(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 1993
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected static isTrue(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 1989
    sget-object v0, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq p0, v0, :cond_c

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private putConstImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Z
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "value"    # Ljava/lang/Object;
    .param p5, "constFlag"    # I

    .prologue
    const/4 v2, 0x1

    .line 2745
    sget-boolean v3, Lorg/mozilla/javascript/ScriptableObject;->$assertionsDisabled:Z

    if-nez v3, :cond_d

    if-nez p5, :cond_d

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 2747
    :cond_d
    if-eq p0, p3, :cond_17

    .line 2748
    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 2749
    .local v1, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v1, :cond_23

    .line 2750
    const/4 v2, 0x0

    .line 2772
    :cond_16
    :goto_16
    return v2

    .line 2752
    .end local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_17
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v3

    if-nez v3, :cond_28

    .line 2753
    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 2754
    .restart local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-eqz v1, :cond_16

    .line 2772
    :cond_23
    invoke-virtual {v1, p4, p0, p3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v2

    goto :goto_16

    .line 2758
    .end local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_28
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 2760
    const/4 v3, 0x3

    invoke-direct {p0, p1, p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 2761
    .restart local v1    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    .line 2762
    .local v0, "attr":I
    and-int/lit8 v3, v0, 0x1

    if-nez v3, :cond_43

    .line 2763
    const-string v2, "msg.var.redecl"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 2764
    :cond_43
    and-int/lit8 v3, v0, 0x8

    if-eqz v3, :cond_16

    .line 2765
    iput-object p4, v1, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2767
    const/16 v3, 0x8

    if-eq p5, v3, :cond_16

    .line 2768
    and-int/lit8 v3, v0, -0x9

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setAttributes(I)V

    goto :goto_16
.end method

.method public static putConstProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2452
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2453
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_7

    .line 2454
    move-object v0, p0

    .line 2455
    :cond_7
    instance-of v1, v0, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v1, :cond_10

    .line 2456
    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    .end local v0    # "base":Lorg/mozilla/javascript/Scriptable;
    invoke-interface {v0, p1, p0, p2}, Lorg/mozilla/javascript/ConstProperties;->putConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2457
    :cond_10
    return-void
.end method

.method private putImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Z
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 2713
    if-eq p0, p3, :cond_b

    .line 2714
    invoke-direct {p0, p1, p2, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 2715
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v0, :cond_15

    .line 2716
    const/4 v1, 0x0

    .line 2727
    :cond_a
    :goto_a
    return v1

    .line 2718
    .end local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_b
    iget-boolean v2, p0, Lorg/mozilla/javascript/ScriptableObject;->isExtensible:Z

    if-nez v2, :cond_1a

    .line 2719
    invoke-direct {p0, p1, p2, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 2720
    .restart local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-eqz v0, :cond_a

    .line 2727
    :cond_15
    :goto_15
    invoke-virtual {v0, p4, p0, p3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v1

    goto :goto_a

    .line 2724
    .end local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_1a
    iget v1, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-gez v1, :cond_21

    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 2725
    :cond_21
    const/4 v1, 0x2

    invoke-direct {p0, p1, p2, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .restart local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    goto :goto_15
.end method

.method public static putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V
    .registers 4
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2476
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2477
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_7

    .line 2478
    move-object v0, p0

    .line 2479
    :cond_7
    invoke-interface {v0, p1, p0, p2}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2480
    return-void
.end method

.method public static putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2429
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2430
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_7

    .line 2431
    move-object v0, p0

    .line 2432
    :cond_7
    invoke-interface {v0, p1, p0, p2}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2433
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 10
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 3131
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 3133
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v5

    .line 3134
    .local v5, "tableSize":I
    if-eqz v5, :cond_56

    .line 3137
    add-int/lit8 v6, v5, -0x1

    and-int/2addr v6, v5

    if-eqz v6, :cond_21

    .line 3138
    const/high16 v6, 0x40000000    # 2.0f

    if-le v5, v6, :cond_1a

    .line 3139
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "Property table overflow"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 3140
    :cond_1a
    const/4 v1, 0x4

    .line 3141
    .local v1, "newSize":I
    :goto_1b
    if-ge v1, v5, :cond_20

    .line 3142
    shl-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 3143
    :cond_20
    move v5, v1

    .line 3145
    .end local v1    # "newSize":I
    :cond_21
    new-array v6, v5, [Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3146
    iget v2, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    .line 3147
    .local v2, "objectsCount":I
    if-gez v2, :cond_2b

    .line 3149
    xor-int/lit8 v2, v2, -0x1

    .line 3151
    :cond_2b
    const/4 v3, 0x0

    .line 3152
    .local v3, "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2d
    if-eq v0, v2, :cond_56

    .line 3153
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3154
    if-nez v0, :cond_51

    .line 3155
    iget-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3159
    :goto_3d
    iget-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iget v6, v6, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v4

    .line 3160
    .local v4, "slotIndex":I
    iget-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    invoke-static {v6, v7, v4}, Lorg/mozilla/javascript/ScriptableObject;->addKnownAbsentSlot([Lorg/mozilla/javascript/ScriptableObject$Slot;Lorg/mozilla/javascript/ScriptableObject$Slot;I)V

    .line 3161
    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3152
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 3157
    .end local v4    # "slotIndex":I
    :cond_51
    iget-object v6, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v6, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_3d

    .line 3164
    .end local v0    # "i":I
    .end local v2    # "objectsCount":I
    .end local v3    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_56
    return-void
.end method

.method public static redefineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Z)V
    .registers 6
    .param p0, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isConst"    # Z

    .prologue
    .line 2384
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getBase(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 2385
    .local v0, "base":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_7

    .line 2395
    :cond_6
    return-void

    .line 2387
    :cond_7
    instance-of v2, v0, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v2, :cond_1b

    move-object v1, v0

    .line 2388
    check-cast v1, Lorg/mozilla/javascript/ConstProperties;

    .line 2390
    .local v1, "cp":Lorg/mozilla/javascript/ConstProperties;
    invoke-interface {v1, p1}, Lorg/mozilla/javascript/ConstProperties;->isConst(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 2391
    const-string v2, "msg.const.redecl"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 2393
    .end local v1    # "cp":Lorg/mozilla/javascript/ConstProperties;
    :cond_1b
    if-eqz p2, :cond_6

    .line 2394
    const-string v2, "msg.var.redecl"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2
.end method

.method private declared-synchronized removeSlot(Ljava/lang/String;I)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 2939
    monitor-enter p0

    if-eqz p1, :cond_57

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 2941
    .local v1, "indexOrHash":I
    :goto_7
    iget-object v5, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2942
    .local v5, "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-eqz v7, :cond_55

    .line 2943
    array-length v6, v5

    .line 2944
    .local v6, "tableSize":I
    invoke-static {v6, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlotIndex(II)I

    move-result v4

    .line 2945
    .local v4, "slotIndex":I
    aget-object v2, v5, v4

    .line 2946
    .local v2, "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    move-object v3, v2

    .line 2947
    .local v3, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_15
    if-eqz v3, :cond_29

    .line 2948
    iget v7, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    if-ne v7, v1, :cond_59

    iget-object v7, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    if-eq v7, p1, :cond_29

    if-eqz p1, :cond_59

    iget-object v7, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_59

    .line 2957
    :cond_29
    if-eqz v3, :cond_55

    invoke-virtual {v3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v7

    and-int/lit8 v7, v7, 0x4

    if-nez v7, :cond_55

    .line 2958
    iget v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    .line 2960
    if-ne v2, v3, :cond_5d

    .line 2961
    iget-object v7, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    aput-object v7, v5, v4

    .line 2971
    :goto_3f
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 2972
    .local v0, "deleted":Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-ne v0, v7, :cond_65

    .line 2973
    const/4 v2, 0x0

    .line 2974
    iget-object v7, v0, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2982
    :goto_4c
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-ne v0, v7, :cond_52

    .line 2983
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->lastAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2987
    :cond_52
    invoke-virtual {v3}, Lorg/mozilla/javascript/ScriptableObject$Slot;->markDeleted()V
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_62

    .line 2990
    .end local v0    # "deleted":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v2    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v3    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v4    # "slotIndex":I
    .end local v6    # "tableSize":I
    :cond_55
    monitor-exit p0

    return-void

    .end local v1    # "indexOrHash":I
    .end local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_57
    move v1, p2

    .line 2939
    goto :goto_7

    .line 2954
    .restart local v1    # "indexOrHash":I
    .restart local v2    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v3    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v4    # "slotIndex":I
    .restart local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v6    # "tableSize":I
    :cond_59
    move-object v2, v3

    .line 2955
    :try_start_5a
    iget-object v3, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_15

    .line 2963
    :cond_5d
    iget-object v7, v3, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v7, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->next:Lorg/mozilla/javascript/ScriptableObject$Slot;
    :try_end_61
    .catchall {:try_start_5a .. :try_end_61} :catchall_62

    goto :goto_3f

    .line 2939
    .end local v1    # "indexOrHash":I
    .end local v2    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v3    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v4    # "slotIndex":I
    .end local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v6    # "tableSize":I
    :catchall_62
    move-exception v7

    monitor-exit p0

    throw v7

    .line 2976
    .restart local v0    # "deleted":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v1    # "indexOrHash":I
    .restart local v2    # "prev":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v3    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v4    # "slotIndex":I
    .restart local v5    # "slotsLocalRef":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    .restart local v6    # "tableSize":I
    :cond_65
    :try_start_65
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2977
    :goto_67
    iget-object v7, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    if-eq v7, v0, :cond_6e

    .line 2978
    iget-object v2, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_67

    .line 2980
    :cond_6e
    iget-object v7, v0, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    iput-object v7, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;
    :try_end_72
    .catchall {:try_start_65 .. :try_end_72} :catchall_62

    goto :goto_4c
.end method

.method private setGetterOrSetter(Ljava/lang/String;ILorg/mozilla/javascript/Callable;ZZ)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "getterOrSetter"    # Lorg/mozilla/javascript/Callable;
    .param p4, "isSetter"    # Z
    .param p5, "force"    # Z

    .prologue
    .line 770
    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    .line 771
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 773
    :cond_a
    if-nez p5, :cond_f

    .line 774
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 778
    :cond_f
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 779
    const/4 v3, 0x4

    invoke-direct {p0, p1, p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .line 787
    .local v1, "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    :goto_1c
    if-nez p5, :cond_3f

    .line 788
    invoke-virtual {v1}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getAttributes()I

    move-result v0

    .line 789
    .local v0, "attributes":I
    and-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_3f

    .line 790
    const-string v3, "msg.modify.readonly"

    invoke-static {v3, p1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 781
    .end local v0    # "attributes":I
    .end local v1    # "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    :cond_2d
    const/4 v3, 0x1

    invoke-direct {p0, p1, p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v2

    .line 782
    .local v2, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    instance-of v3, v2, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-nez v3, :cond_3b

    .line 799
    .end local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_3a
    return-void

    .restart local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_3b
    move-object v1, v2

    .line 784
    check-cast v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .restart local v1    # "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    goto :goto_1c

    .line 793
    .end local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_3f
    if-eqz p4, :cond_48

    .line 794
    iput-object p3, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 798
    :goto_43
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    iput-object v3, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    goto :goto_3a

    .line 796
    :cond_48
    iput-object p3, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    goto :goto_43
.end method

.method private static unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 2
    .param p0, "slot"    # Lorg/mozilla/javascript/ScriptableObject$Slot;

    .prologue
    .line 2786
    instance-of v0, p0, Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;

    if-eqz v0, :cond_8

    check-cast p0, Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;

    .end local p0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget-object p0, p0, Lorg/mozilla/javascript/ScriptableObject$RelinkedSlot;->slot:Lorg/mozilla/javascript/ScriptableObject$Slot;

    :cond_8
    return-object p0
.end method

.method private declared-synchronized writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 6
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3098
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 3099
    iget v1, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    .line 3100
    .local v1, "objectsCount":I
    if-gez v1, :cond_a

    .line 3102
    xor-int/lit8 v1, v1, -0x1

    .line 3104
    :cond_a
    if-nez v1, :cond_12

    .line 3105
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeInt(I)V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_39

    .line 3126
    :cond_10
    monitor-exit p0

    return-void

    .line 3107
    :cond_12
    :try_start_12
    iget-object v3, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    array-length v3, v3

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 3108
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3109
    .local v2, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_1a
    if-eqz v2, :cond_23

    iget-boolean v3, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->wasDeleted:Z

    if-eqz v3, :cond_23

    .line 3112
    iget-object v2, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_1a

    .line 3114
    :cond_23
    iput-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3115
    :goto_25
    if-eqz v2, :cond_10

    .line 3116
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 3117
    iget-object v0, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3118
    .local v0, "next":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_2c
    if-eqz v0, :cond_35

    iget-boolean v3, v0, Lorg/mozilla/javascript/ScriptableObject$Slot;->wasDeleted:Z

    if-eqz v3, :cond_35

    .line 3120
    iget-object v0, v0, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_2c

    .line 3122
    :cond_35
    iput-object v0, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;
    :try_end_37
    .catchall {:try_start_12 .. :try_end_37} :catchall_39

    .line 3123
    move-object v2, v0

    .line 3124
    goto :goto_25

    .line 3098
    .end local v0    # "next":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v1    # "objectsCount":I
    .end local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :catchall_39
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method addLazilyInitializedValue(Ljava/lang/String;ILorg/mozilla/javascript/LazilyLoadedCtor;I)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "init"    # Lorg/mozilla/javascript/LazilyLoadedCtor;
    .param p4, "attributes"    # I

    .prologue
    const/4 v2, 0x0

    .line 848
    if-eqz p1, :cond_b

    if-eqz p2, :cond_b

    .line 849
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 850
    :cond_b
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 851
    const/4 v1, 0x4

    invoke-direct {p0, p1, p2, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .line 853
    .local v0, "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    invoke-virtual {v0, p4}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 854
    iput-object v2, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 855
    iput-object v2, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 856
    iput-object p3, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 857
    return-void
.end method

.method protected applyDescriptorToAttributeBitset(ILorg/mozilla/javascript/ScriptableObject;)I
    .registers 7
    .param p1, "attributes"    # I
    .param p2, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 2028
    const-string v3, "enumerable"

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2029
    .local v1, "enumerable":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v3, :cond_12

    .line 2030
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    and-int/lit8 p1, p1, -0x3

    .line 2034
    :cond_12
    :goto_12
    const-string v3, "writable"

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 2035
    .local v2, "writable":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_24

    .line 2036
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3a

    and-int/lit8 p1, p1, -0x2

    .line 2040
    :cond_24
    :goto_24
    const-string v3, "configurable"

    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2041
    .local v0, "configurable":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_36

    .line 2042
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    and-int/lit8 p1, p1, -0x5

    .line 2046
    :cond_36
    :goto_36
    return p1

    .line 2030
    .end local v0    # "configurable":Ljava/lang/Object;
    .end local v2    # "writable":Ljava/lang/Object;
    :cond_37
    or-int/lit8 p1, p1, 0x2

    goto :goto_12

    .line 2036
    .restart local v2    # "writable":Ljava/lang/Object;
    :cond_3a
    or-int/lit8 p1, p1, 0x1

    goto :goto_24

    .line 2042
    .restart local v0    # "configurable":Ljava/lang/Object;
    :cond_3d
    or-int/lit8 p1, p1, 0x4

    goto :goto_36
.end method

.method public final declared-synchronized associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2689
    monitor-enter p0

    if-nez p2, :cond_c

    :try_start_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_9

    :catchall_9
    move-exception v1

    monitor-exit p0

    throw v1

    .line 2690
    :cond_c
    :try_start_c
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2691
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_17

    .line 2692
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2693
    .restart local v0    # "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    iput-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2695
    :cond_17
    invoke-static {v0, p1, p2}, Lorg/mozilla/javascript/Kit;->initHash(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catchall {:try_start_c .. :try_end_1a} :catchall_9

    move-result-object v1

    monitor-exit p0

    return-object v1
.end method

.method public avoidObjectDetection()Z
    .registers 2

    .prologue
    .line 1093
    const/4 v0, 0x0

    return v0
.end method

.method protected checkPropertyChange(Ljava/lang/String;Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "current"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 1944
    if-nez p2, :cond_f

    .line 1945
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v2

    if-nez v2, :cond_57

    const-string v2, "msg.not.extensible"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1947
    :cond_f
    const-string v2, "configurable"

    invoke-virtual {p2, v2, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->isFalse(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 1948
    const-string v2, "configurable"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 1949
    const-string v2, "msg.change.configurable.false.to.true"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1951
    :cond_2e
    const-string v2, "enumerable"

    invoke-virtual {p2, v2, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "enumerable"

    invoke-static {p3, v3}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_4b

    .line 1952
    const-string v2, "msg.change.enumerable.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1954
    :cond_4b
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v1

    .line 1955
    .local v1, "isData":Z
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v0

    .line 1956
    .local v0, "isAccessor":Z
    if-nez v1, :cond_58

    if-nez v0, :cond_58

    .line 1986
    .end local v0    # "isAccessor":Z
    .end local v1    # "isData":Z
    :cond_57
    return-void

    .line 1958
    .restart local v0    # "isAccessor":Z
    .restart local v1    # "isData":Z
    :cond_58
    if-eqz v1, :cond_98

    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_98

    .line 1959
    const-string v2, "writable"

    invoke-virtual {p2, v2, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->isFalse(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 1960
    const-string v2, "writable"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 1961
    const-string v2, "msg.change.writable.false.to.true.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1964
    :cond_7f
    const-string v2, "value"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "value"

    invoke-virtual {p2, v3, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_57

    .line 1965
    const-string v2, "msg.change.value.with.writable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1968
    :cond_98
    if-eqz v0, :cond_d2

    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_d2

    .line 1969
    const-string v2, "set"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "set"

    invoke-virtual {p2, v3, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b9

    .line 1970
    const-string v2, "msg.change.setter.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1973
    :cond_b9
    const-string v2, "get"

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "get"

    invoke-virtual {p2, v3, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_57

    .line 1974
    const-string v2, "msg.change.getter.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1977
    :cond_d2
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_df

    .line 1978
    const-string v2, "msg.change.property.data.to.accessor.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1981
    :cond_df
    const-string v2, "msg.change.property.accessor.to.data.with.configurable.false"

    invoke-static {v2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2
.end method

.method protected checkPropertyDefinition(Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 5
    .param p1, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 1927
    const-string v2, "get"

    invoke-static {p1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1928
    .local v0, "getter":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_17

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v0, v2, :cond_17

    instance-of v2, v0, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_17

    .line 1930
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1932
    :cond_17
    const-string v2, "set"

    invoke-static {p1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1933
    .local v1, "setter":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_2e

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v1, v2, :cond_2e

    instance-of v2, v1, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_2e

    .line 1935
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1937
    :cond_2e
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 1938
    const-string v2, "msg.both.data.and.accessor.desc"

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    .line 1940
    :cond_41
    return-void
.end method

.method public defineConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 608
    const/4 v2, 0x0

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    const/16 v5, 0x8

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptableObject;->putConstImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 614
    :cond_e
    :goto_e
    return-void

    .line 611
    :cond_f
    if-ne p2, p0, :cond_16

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 612
    :cond_16
    instance-of v0, p2, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v0, :cond_e

    move-object v0, p2

    .line 613
    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    invoke-interface {v0, p1, p2}, Lorg/mozilla/javascript/ConstProperties;->defineConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_e
.end method

.method public defineFunctionProperties([Ljava/lang/String;Ljava/lang/Class;I)V
    .registers 11
    .param p1, "names"    # [Ljava/lang/String;
    .param p3, "attributes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 2104
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lorg/mozilla/javascript/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 2105
    .local v3, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v5, p1

    if-ge v1, v5, :cond_26

    .line 2106
    aget-object v4, p1, v1

    .line 2107
    .local v4, "name":Ljava/lang/String;
    invoke-static {v3, v4}, Lorg/mozilla/javascript/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 2108
    .local v2, "m":Ljava/lang/reflect/Method;
    if-nez v2, :cond_1b

    .line 2109
    const-string v5, "msg.method.not.found"

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v4, v6}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 2112
    :cond_1b
    new-instance v0, Lorg/mozilla/javascript/FunctionObject;

    invoke-direct {v0, v4, v2, p0}, Lorg/mozilla/javascript/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lorg/mozilla/javascript/Scriptable;)V

    .line 2113
    .local v0, "f":Lorg/mozilla/javascript/FunctionObject;
    invoke-virtual {p0, v4, v0, p3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 2105
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 2115
    .end local v0    # "f":Lorg/mozilla/javascript/FunctionObject;
    .end local v2    # "m":Ljava/lang/reflect/Method;
    .end local v4    # "name":Ljava/lang/String;
    :cond_26
    return-void
.end method

.method public defineOwnProperties(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 11
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "props"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 1833
    invoke-virtual {p2}, Lorg/mozilla/javascript/ScriptableObject;->getIds()[Ljava/lang/Object;

    move-result-object v4

    .line 1834
    .local v4, "ids":[Ljava/lang/Object;
    array-length v6, v4

    new-array v2, v6, [Lorg/mozilla/javascript/ScriptableObject;

    .line 1835
    .local v2, "descs":[Lorg/mozilla/javascript/ScriptableObject;
    const/4 v3, 0x0

    .local v3, "i":I
    array-length v5, v4

    .local v5, "len":I
    :goto_9
    if-ge v3, v5, :cond_1d

    .line 1836
    aget-object v6, v4, v3

    invoke-static {p2, v6, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    .line 1837
    .local v1, "descObj":Ljava/lang/Object;
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    .line 1838
    .local v0, "desc":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->checkPropertyDefinition(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 1839
    aput-object v0, v2, v3

    .line 1835
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 1841
    .end local v0    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    .end local v1    # "descObj":Ljava/lang/Object;
    :cond_1d
    const/4 v3, 0x0

    array-length v5, v4

    :goto_1f
    if-ge v3, v5, :cond_2b

    .line 1842
    aget-object v6, v4, v3

    aget-object v7, v2, v3

    invoke-virtual {p0, p1, v6, v7}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;)V

    .line 1841
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1844
    :cond_2b
    return-void
.end method

.method public defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 1854
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ScriptableObject;->checkPropertyDefinition(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 1855
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 1856
    return-void
.end method

.method protected defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V
    .registers 16
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p4, "checkValid"    # Z

    .prologue
    .line 1871
    const/4 v10, 0x1

    invoke-virtual {p0, p1, p2, v10}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v8

    .line 1872
    .local v8, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v8, :cond_58

    const/4 v5, 0x1

    .line 1874
    .local v5, "isNew":Z
    :goto_8
    if-eqz p4, :cond_14

    .line 1875
    if-nez v8, :cond_5a

    const/4 v1, 0x0

    .line 1877
    .local v1, "current":Lorg/mozilla/javascript/ScriptableObject;
    :goto_d
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1878
    .local v6, "name":Ljava/lang/String;
    invoke-virtual {p0, v6, v1, p3}, Lorg/mozilla/javascript/ScriptableObject;->checkPropertyChange(Ljava/lang/String;Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/ScriptableObject;)V

    .line 1881
    .end local v1    # "current":Lorg/mozilla/javascript/ScriptableObject;
    .end local v6    # "name":Ljava/lang/String;
    :cond_14
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v4

    .line 1884
    .local v4, "isAccessor":Z
    if-nez v8, :cond_61

    .line 1885
    if-eqz v4, :cond_5f

    const/4 v10, 0x4

    :goto_1d
    invoke-virtual {p0, p1, p2, v10}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v8

    .line 1886
    const/4 v10, 0x7

    invoke-virtual {p0, v10, p3}, Lorg/mozilla/javascript/ScriptableObject;->applyDescriptorToAttributeBitset(ILorg/mozilla/javascript/ScriptableObject;)I

    move-result v0

    .line 1891
    .local v0, "attributes":I
    :goto_26
    invoke-static {v8}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v8

    .line 1893
    if-eqz v4, :cond_6a

    .line 1894
    instance-of v10, v8, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-nez v10, :cond_35

    .line 1895
    const/4 v10, 0x4

    invoke-virtual {p0, p1, p2, v10}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v8

    :cond_35
    move-object v3, v8

    .line 1898
    check-cast v3, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .line 1900
    .local v3, "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    const-string v10, "get"

    invoke-static {p3, v10}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1901
    .local v2, "getter":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v10, :cond_44

    .line 1902
    iput-object v2, v3, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 1904
    :cond_44
    const-string v10, "set"

    invoke-static {p3, v10}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 1905
    .local v7, "setter":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_50

    .line 1906
    iput-object v7, v3, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 1909
    :cond_50
    sget-object v10, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    iput-object v10, v3, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 1910
    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 1924
    .end local v2    # "getter":Ljava/lang/Object;
    .end local v3    # "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    .end local v7    # "setter":Ljava/lang/Object;
    :goto_57
    return-void

    .line 1872
    .end local v0    # "attributes":I
    .end local v4    # "isAccessor":Z
    .end local v5    # "isNew":Z
    :cond_58
    const/4 v5, 0x0

    goto :goto_8

    .line 1875
    .restart local v5    # "isNew":Z
    :cond_5a
    invoke-virtual {v8, p1, p0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getPropertyDescriptor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v1

    goto :goto_d

    .line 1885
    .restart local v4    # "isAccessor":Z
    :cond_5f
    const/4 v10, 0x2

    goto :goto_1d

    .line 1888
    :cond_61
    invoke-virtual {v8}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v10

    invoke-virtual {p0, v10, p3}, Lorg/mozilla/javascript/ScriptableObject;->applyDescriptorToAttributeBitset(ILorg/mozilla/javascript/ScriptableObject;)I

    move-result v0

    .restart local v0    # "attributes":I
    goto :goto_26

    .line 1912
    :cond_6a
    instance-of v10, v8, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-eqz v10, :cond_79

    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v10

    if-eqz v10, :cond_79

    .line 1913
    const/4 v10, 0x5

    invoke-virtual {p0, p1, p2, v10}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v8

    .line 1916
    :cond_79
    const-string v10, "value"

    invoke-static {p3, v10}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 1917
    .local v9, "value":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_89

    .line 1918
    iput-object v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 1922
    :cond_85
    :goto_85
    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setAttributes(I)V

    goto :goto_57

    .line 1919
    :cond_89
    if-eqz v5, :cond_85

    .line 1920
    sget-object v10, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    iput-object v10, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    goto :goto_85
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Class;I)V
    .registers 16
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p3, "attributes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    const/4 v1, 0x3

    const/4 v4, 0x0

    .line 1672
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 1673
    .local v8, "length":I
    if-nez v8, :cond_f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 1674
    :cond_f
    add-int/lit8 v0, v8, 0x3

    new-array v6, v0, [C

    .line 1675
    .local v6, "buf":[C
    invoke-virtual {p1, v4, v8, v6, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1676
    aget-char v0, v6, v1

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    aput-char v0, v6, v1

    .line 1677
    const/16 v0, 0x67

    aput-char v0, v6, v4

    .line 1678
    const/4 v0, 0x1

    const/16 v1, 0x65

    aput-char v1, v6, v0

    .line 1679
    const/4 v0, 0x2

    const/16 v1, 0x74

    aput-char v1, v6, v0

    .line 1680
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v6}, Ljava/lang/String;-><init>([C)V

    .line 1681
    .local v7, "getterName":Ljava/lang/String;
    const/16 v0, 0x73

    aput-char v0, v6, v4

    .line 1682
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v6}, Ljava/lang/String;-><init>([C)V

    .line 1684
    .local v11, "setterName":Ljava/lang/String;
    invoke-static {p2}, Lorg/mozilla/javascript/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v9

    .line 1685
    .local v9, "methods":[Ljava/lang/reflect/Method;
    invoke-static {v9, v7}, Lorg/mozilla/javascript/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1686
    .local v3, "getter":Ljava/lang/reflect/Method;
    invoke-static {v9, v11}, Lorg/mozilla/javascript/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 1687
    .local v10, "setter":Ljava/lang/reflect/Method;
    if-nez v10, :cond_4a

    .line 1688
    or-int/lit8 p3, p3, 0x1

    .line 1689
    :cond_4a
    if-nez v10, :cond_54

    move-object v4, v2

    :goto_4d
    move-object v0, p0

    move-object v1, p1

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 1691
    return-void

    :cond_54
    move-object v4, v10

    .line 1689
    goto :goto_4d
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 5
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "attributes"    # I

    .prologue
    .line 1612
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 1613
    invoke-virtual {p0, p1, p0, p2}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 1614
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 1615
    return-void
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V
    .registers 15
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "delegateTo"    # Ljava/lang/Object;
    .param p3, "getter"    # Ljava/lang/reflect/Method;
    .param p4, "setter"    # Ljava/lang/reflect/Method;
    .param p5, "attributes"    # I

    .prologue
    .line 1737
    const/4 v3, 0x0

    .line 1738
    .local v3, "getterBox":Lorg/mozilla/javascript/MemberBox;
    if-eqz p3, :cond_50

    .line 1739
    new-instance v3, Lorg/mozilla/javascript/MemberBox;

    .end local v3    # "getterBox":Lorg/mozilla/javascript/MemberBox;
    invoke-direct {v3, p3}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    .line 1742
    .restart local v3    # "getterBox":Lorg/mozilla/javascript/MemberBox;
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-nez v7, :cond_30

    .line 1743
    if-eqz p2, :cond_2e

    const/4 v1, 0x1

    .line 1744
    .local v1, "delegatedForm":Z
    :goto_15
    iput-object p2, v3, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 1752
    :goto_17
    const/4 v2, 0x0

    .line 1753
    .local v2, "errorId":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 1754
    .local v5, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v5

    if-nez v7, :cond_36

    .line 1755
    if-eqz v1, :cond_23

    .line 1756
    const-string v2, "msg.obj.getter.parms"

    .line 1771
    :cond_23
    :goto_23
    if-eqz v2, :cond_50

    .line 1772
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v7

    throw v7

    .line 1743
    .end local v1    # "delegatedForm":Z
    .end local v2    # "errorId":Ljava/lang/String;
    .end local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_2e
    const/4 v1, 0x0

    goto :goto_15

    .line 1746
    :cond_30
    const/4 v1, 0x1

    .line 1749
    .restart local v1    # "delegatedForm":Z
    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    iput-object v7, v3, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    goto :goto_17

    .line 1758
    .restart local v2    # "errorId":Ljava/lang/String;
    .restart local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_36
    array-length v7, v5

    const/4 v8, 0x1

    if-ne v7, v8, :cond_4d

    .line 1759
    const/4 v7, 0x0

    aget-object v0, v5, v7

    .line 1761
    .local v0, "argType":Ljava/lang/Class;
    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq v0, v7, :cond_48

    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    if-eq v0, v7, :cond_48

    .line 1764
    const-string v2, "msg.bad.getter.parms"

    goto :goto_23

    .line 1765
    :cond_48
    if-nez v1, :cond_23

    .line 1766
    const-string v2, "msg.bad.getter.parms"

    goto :goto_23

    .line 1769
    .end local v0    # "argType":Ljava/lang/Class;
    :cond_4d
    const-string v2, "msg.bad.getter.parms"

    goto :goto_23

    .line 1776
    .end local v1    # "delegatedForm":Z
    .end local v2    # "errorId":Ljava/lang/String;
    .end local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_50
    const/4 v6, 0x0

    .line 1777
    .local v6, "setterBox":Lorg/mozilla/javascript/MemberBox;
    if-eqz p4, :cond_b4

    .line 1778
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v7

    sget-object v8, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v7, v8, :cond_66

    .line 1779
    const-string v7, "msg.setter.return"

    invoke-virtual {p4}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v7

    throw v7

    .line 1782
    :cond_66
    new-instance v6, Lorg/mozilla/javascript/MemberBox;

    .end local v6    # "setterBox":Lorg/mozilla/javascript/MemberBox;
    invoke-direct {v6, p4}, Lorg/mozilla/javascript/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    .line 1785
    .restart local v6    # "setterBox":Lorg/mozilla/javascript/MemberBox;
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-nez v7, :cond_94

    .line 1786
    if-eqz p2, :cond_92

    const/4 v1, 0x1

    .line 1787
    .restart local v1    # "delegatedForm":Z
    :goto_78
    iput-object p2, v6, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 1795
    :goto_7a
    const/4 v2, 0x0

    .line 1796
    .restart local v2    # "errorId":Ljava/lang/String;
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 1797
    .restart local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v5

    const/4 v8, 0x1

    if-ne v7, v8, :cond_9a

    .line 1798
    if-eqz v1, :cond_87

    .line 1799
    const-string v2, "msg.setter2.expected"

    .line 1814
    :cond_87
    :goto_87
    if-eqz v2, :cond_b4

    .line 1815
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v7

    throw v7

    .line 1786
    .end local v1    # "delegatedForm":Z
    .end local v2    # "errorId":Ljava/lang/String;
    .end local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_92
    const/4 v1, 0x0

    goto :goto_78

    .line 1789
    :cond_94
    const/4 v1, 0x1

    .line 1792
    .restart local v1    # "delegatedForm":Z
    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    iput-object v7, v6, Lorg/mozilla/javascript/MemberBox;->delegateTo:Ljava/lang/Object;

    goto :goto_7a

    .line 1801
    .restart local v2    # "errorId":Ljava/lang/String;
    .restart local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_9a
    array-length v7, v5

    const/4 v8, 0x2

    if-ne v7, v8, :cond_b1

    .line 1802
    const/4 v7, 0x0

    aget-object v0, v5, v7

    .line 1804
    .restart local v0    # "argType":Ljava/lang/Class;
    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq v0, v7, :cond_ac

    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    if-eq v0, v7, :cond_ac

    .line 1807
    const-string v2, "msg.setter2.parms"

    goto :goto_87

    .line 1808
    :cond_ac
    if-nez v1, :cond_87

    .line 1809
    const-string v2, "msg.setter1.parms"

    goto :goto_87

    .line 1812
    .end local v0    # "argType":Ljava/lang/Class;
    :cond_b1
    const-string v2, "msg.setter.parms"

    goto :goto_87

    .line 1819
    .end local v1    # "delegatedForm":Z
    .end local v2    # "errorId":Ljava/lang/String;
    .end local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_b4
    const/4 v7, 0x0

    const/4 v8, 0x4

    invoke-direct {p0, p1, v7, v8}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .line 1821
    .local v4, "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    invoke-virtual {v4, p5}, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 1822
    iput-object v3, v4, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 1823
    iput-object v6, v4, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 1824
    return-void
.end method

.method public delete(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    const/4 v0, 0x0

    .line 575
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 576
    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/ScriptableObject;->removeSlot(Ljava/lang/String;I)V

    .line 577
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 561
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 562
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->removeSlot(Ljava/lang/String;I)V

    .line 563
    return-void
.end method

.method protected equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1111
    if-ne p0, p1, :cond_5

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_4
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 484
    iget-object v1, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    if-eqz v1, :cond_16

    .line 485
    iget-object v1, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v1}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayLength()I

    move-result v1

    if-ge p1, v1, :cond_13

    .line 486
    iget-object v1, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v1, p1}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayElement(I)Ljava/lang/Object;

    move-result-object v1

    .line 495
    :goto_12
    return-object v1

    .line 488
    :cond_13
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_12

    .line 491
    :cond_16
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v1, p1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 492
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v0, :cond_21

    .line 493
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_12

    .line 495
    :cond_21
    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getValue(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_12
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 3195
    const/4 v0, 0x0

    .line 3196
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_15

    .line 3197
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1, p0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 3201
    .end local v0    # "value":Ljava/lang/Object;
    :cond_b
    :goto_b
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_13

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_24

    .line 3202
    :cond_13
    const/4 v0, 0x0

    .line 3206
    :cond_14
    :goto_14
    return-object v0

    .line 3198
    .restart local v0    # "value":Ljava/lang/Object;
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_15
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_b

    .line 3199
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, v1, p0}, Lorg/mozilla/javascript/ScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_b

    .line 3203
    .end local v0    # "value":Ljava/lang/Object;
    :cond_24
    instance-of v1, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_14

    .line 3204
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    goto :goto_14
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 468
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 469
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v0, :cond_b

    .line 470
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    .line 472
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getValue(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_a
.end method

.method public getAllIds()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 960
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 2640
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2641
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_6

    .line 2642
    const/4 v1, 0x0

    .line 2643
    :goto_5
    return-object v1

    :cond_6
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_5
.end method

.method public getAttributes(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 710
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lorg/mozilla/javascript/ScriptableObject;->findAttributeSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    return v0
.end method

.method public final getAttributes(ILorg/mozilla/javascript/Scriptable;)I
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 650
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getAttributes(I)I

    move-result v0

    return v0
.end method

.method public getAttributes(Ljava/lang/String;)I
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 692
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->findAttributeSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    return v0
.end method

.method public final getAttributes(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)I
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 640
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public abstract getClassName()Ljava/lang/String;
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 979
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getDefaultValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getExternalArrayData()Lorg/mozilla/javascript/ExternalArrayData;
    .registers 2

    .prologue
    .line 890
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    return-object v0
.end method

.method public getExternalArrayLength()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 898
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_a
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v0}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayLength()I

    move-result v0

    goto :goto_5
.end method

.method public getGetterOrSetter(Ljava/lang/String;IZ)Ljava/lang/Object;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "isSetter"    # Z

    .prologue
    .line 816
    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    .line 817
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 818
    :cond_a
    const/4 v3, 0x1

    invoke-direct {p0, p1, p2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v2

    .line 819
    .local v2, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v2, :cond_17

    .line 820
    const/4 v1, 0x0

    .line 826
    :cond_16
    :goto_16
    return-object v1

    .line 821
    :cond_17
    instance-of v3, v2, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-eqz v3, :cond_2a

    move-object v0, v2

    .line 822
    check-cast v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .line 823
    .local v0, "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    if-eqz p3, :cond_27

    iget-object v1, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 824
    .local v1, "result":Ljava/lang/Object;
    :goto_22
    if-nez v1, :cond_16

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_16

    .line 823
    .end local v1    # "result":Ljava/lang/Object;
    :cond_27
    iget-object v1, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    goto :goto_22

    .line 826
    .end local v0    # "gslot":Lorg/mozilla/javascript/ScriptableObject$GetterSlot;
    :cond_2a
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_16
.end method

.method public getIds()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 945
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getIds(Z)[Ljava/lang/Object;
    .registers 13
    .param p1, "getAll"    # Z

    .prologue
    const/4 v10, 0x0

    .line 3043
    iget-object v7, p0, Lorg/mozilla/javascript/ScriptableObject;->slots:[Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3045
    .local v7, "s":[Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    if-nez v9, :cond_10

    move v3, v10

    .line 3047
    .local v3, "externalLen":I
    :goto_8
    if-nez v3, :cond_17

    .line 3048
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 3055
    .local v0, "a":[Ljava/lang/Object;
    :cond_c
    if-nez v7, :cond_25

    move-object v6, v0

    .line 3092
    :goto_f
    return-object v6

    .line 3045
    .end local v0    # "a":[Ljava/lang/Object;
    .end local v3    # "externalLen":I
    :cond_10
    iget-object v9, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v9}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayLength()I

    move-result v3

    goto :goto_8

    .line 3050
    .restart local v3    # "externalLen":I
    :cond_17
    new-array v0, v3, [Ljava/lang/Object;

    .line 3051
    .restart local v0    # "a":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1a
    if-ge v4, v3, :cond_c

    .line 3052
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v0, v4

    .line 3051
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    .line 3059
    .end local v4    # "i":I
    :cond_25
    move v1, v3

    .line 3060
    .local v1, "c":I
    iget-object v8, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3061
    .local v8, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_28
    if-eqz v8, :cond_31

    iget-boolean v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->wasDeleted:Z

    if-eqz v9, :cond_31

    .line 3066
    iget-object v8, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_28

    :cond_31
    move v2, v1

    .line 3068
    .end local v1    # "c":I
    .local v2, "c":I
    if-eqz v8, :cond_66

    .line 3069
    if-nez p1, :cond_3e

    invoke-virtual {v8}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v9

    and-int/lit8 v9, v9, 0x2

    if-nez v9, :cond_72

    .line 3070
    :cond_3e
    if-ne v2, v3, :cond_4a

    .line 3071
    move-object v5, v0

    .line 3072
    .local v5, "oldA":[Ljava/lang/Object;
    array-length v9, v7

    add-int/2addr v9, v3

    new-array v0, v9, [Ljava/lang/Object;

    .line 3073
    if-eqz v5, :cond_4a

    .line 3074
    invoke-static {v5, v10, v0, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3077
    .end local v5    # "oldA":[Ljava/lang/Object;
    :cond_4a
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "c":I
    .restart local v1    # "c":I
    iget-object v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    if-eqz v9, :cond_5f

    iget-object v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->name:Ljava/lang/String;

    :goto_52
    aput-object v9, v0, v2

    .line 3081
    :goto_54
    iget-object v8, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 3082
    :goto_56
    if-eqz v8, :cond_31

    iget-boolean v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->wasDeleted:Z

    if-eqz v9, :cond_31

    .line 3084
    iget-object v8, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    goto :goto_56

    .line 3077
    :cond_5f
    iget v9, v8, Lorg/mozilla/javascript/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    goto :goto_52

    .line 3087
    .end local v1    # "c":I
    .restart local v2    # "c":I
    :cond_66
    array-length v9, v0

    add-int/2addr v9, v3

    if-ne v2, v9, :cond_6c

    move-object v6, v0

    .line 3088
    goto :goto_f

    .line 3090
    :cond_6c
    new-array v6, v2, [Ljava/lang/Object;

    .line 3091
    .local v6, "result":[Ljava/lang/Object;
    invoke-static {v0, v10, v6, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_f

    .end local v6    # "result":[Ljava/lang/Object;
    :cond_72
    move v1, v2

    .end local v2    # "c":I
    .restart local v1    # "c":I
    goto :goto_54
.end method

.method protected getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 3167
    const/4 v2, 0x1

    invoke-virtual {p0, p1, p2, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 3168
    .local v1, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v1, :cond_9

    const/4 v2, 0x0

    .line 3170
    .end local p0    # "this":Lorg/mozilla/javascript/ScriptableObject;
    :goto_8
    return-object v2

    .line 3169
    .restart local p0    # "this":Lorg/mozilla/javascript/ScriptableObject;
    :cond_9
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 3170
    .local v0, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_14

    .end local p0    # "this":Lorg/mozilla/javascript/ScriptableObject;
    :goto_f
    invoke-virtual {v1, p1, p0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getPropertyDescriptor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    goto :goto_8

    .restart local p0    # "this":Lorg/mozilla/javascript/ScriptableObject;
    :cond_14
    move-object p0, v0

    goto :goto_f
.end method

.method public getParentScope()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 922
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->parentScopeObject:Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method public getPrototype()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 906
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->prototypeObject:Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method protected getSlot(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject$Slot;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "accessType"    # I

    .prologue
    .line 3174
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3175
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_10

    .line 3176
    const/4 v1, 0x0

    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v2

    invoke-direct {p0, v1, v2, p3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    .line 3178
    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p3}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    goto :goto_f
.end method

.method public getTypeOf()Ljava/lang/String;
    .registers 2

    .prologue
    .line 417
    invoke-virtual {p0}, Lorg/mozilla/javascript/ScriptableObject;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "undefined"

    :goto_8
    return-object v0

    :cond_9
    const-string v0, "object"

    goto :goto_8
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .registers 6
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 450
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    if-eqz v2, :cond_11

    .line 451
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v2}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayLength()I

    move-result v2

    if-ge p1, v2, :cond_f

    .line 453
    :cond_e
    :goto_e
    return v0

    :cond_f
    move v0, v1

    .line 451
    goto :goto_e

    .line 453
    :cond_11
    const/4 v2, 0x0

    invoke-direct {p0, v2, p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v2

    if-nez v2, :cond_e

    move v0, v1

    goto :goto_e
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 438
    invoke-direct {p0, p1, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v2

    if-eqz v2, :cond_9

    :goto_8
    return v0

    :cond_9
    move v0, v1

    goto :goto_8
.end method

.method public hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 3
    .param p1, "instance"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 1078
    invoke-static {p1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->jsDelegatesTo(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z
    .registers 3
    .param p1, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 2064
    const-string v0, "get"

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "set"

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isConst(Ljava/lang/String;)Z
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 624
    invoke-direct {p0, p1, v2, v1}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 625
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    if-nez v0, :cond_9

    .line 628
    :goto_8
    return v2

    :cond_9
    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptableObject$Slot;->getAttributes()I

    move-result v3

    and-int/lit8 v3, v3, 0x5

    const/4 v4, 0x5

    if-ne v3, v4, :cond_14

    :goto_12
    move v2, v1

    goto :goto_8

    :cond_14
    move v1, v2

    goto :goto_12
.end method

.method protected isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z
    .registers 3
    .param p1, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 2055
    const-string v0, "value"

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "writable"

    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->hasProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 3190
    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-eqz v0, :cond_9

    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    :cond_9
    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isExtensible()Z
    .registers 2

    .prologue
    .line 2196
    iget-boolean v0, p0, Lorg/mozilla/javascript/ScriptableObject;->isExtensible:Z

    return v0
.end method

.method protected isGenericDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z
    .registers 3
    .param p1, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 2073
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected isGetterOrSetter(Ljava/lang/String;IZ)Z
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "setter"    # Z

    .prologue
    const/4 v2, 0x1

    .line 837
    invoke-direct {p0, p1, p2, v2}, Lorg/mozilla/javascript/ScriptableObject;->getSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptableObject;->unwrapSlot(Lorg/mozilla/javascript/ScriptableObject$Slot;)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    .line 838
    .local v0, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    instance-of v1, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    if-eqz v1, :cond_22

    .line 839
    if-eqz p3, :cond_18

    move-object v1, v0

    check-cast v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    iget-object v1, v1, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-eqz v1, :cond_18

    move v1, v2

    .line 842
    .end local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_17
    return v1

    .line 840
    .restart local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_18
    if-nez p3, :cond_22

    check-cast v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;

    .end local v0    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    iget-object v1, v0, Lorg/mozilla/javascript/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v1, :cond_22

    move v1, v2

    goto :goto_17

    .line 842
    :cond_22
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public final isSealed()Z
    .registers 2

    .prologue
    .line 2240
    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-gez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public preventExtensions()V
    .registers 2

    .prologue
    .line 2200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/javascript/ScriptableObject;->isExtensible:Z

    .line 2201
    return-void
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 11
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 531
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    if-eqz v0, :cond_2b

    .line 532
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v0}, Lorg/mozilla/javascript/ExternalArrayData;->getArrayLength()I

    move-result v0

    if-ge p1, v0, :cond_14

    .line 533
    iget-object v0, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    invoke-interface {v0, p1, p3}, Lorg/mozilla/javascript/ExternalArrayData;->setArrayElement(ILjava/lang/Object;)V

    .line 549
    :cond_13
    :goto_13
    return-void

    .line 535
    :cond_14
    new-instance v0, Lorg/mozilla/javascript/JavaScriptException;

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    sget-object v2, Lorg/mozilla/javascript/TopLevel$NativeErrors;->RangeError:Lorg/mozilla/javascript/TopLevel$NativeErrors;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "External array index out of bounds "

    aput-object v4, v3, v5

    invoke-static {v1, p0, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->newNativeError(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$NativeErrors;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-direct {v0, v1, v6, v5}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0

    .line 544
    :cond_2b
    invoke-direct {p0, v6, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->putImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 547
    if-ne p2, p0, :cond_38

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 548
    :cond_38
    invoke-interface {p2, p1, p2, p3}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_13
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 515
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->putImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 520
    :goto_7
    return-void

    .line 518
    :cond_8
    if-ne p2, p0, :cond_f

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 519
    :cond_f
    invoke-interface {p2, p1, p2, p3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_7
.end method

.method public putConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 596
    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptableObject;->putConstImpl(Ljava/lang/String;ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 604
    :goto_c
    return-void

    .line 599
    :cond_d
    if-ne p2, p0, :cond_14

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 600
    :cond_14
    instance-of v0, p2, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v0, :cond_1f

    move-object v0, p2

    .line 601
    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    invoke-interface {v0, p1, p2, p3}, Lorg/mozilla/javascript/ConstProperties;->putConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_c

    .line 603
    :cond_1f
    invoke-interface {p2, p1, p2, p3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_c
.end method

.method protected sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 11
    .param p1, "newValue"    # Ljava/lang/Object;
    .param p2, "currentValue"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    .line 2004
    sget-object v4, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v4, :cond_7

    move v4, v5

    .line 2022
    :goto_6
    return v4

    .line 2007
    :cond_7
    sget-object v4, Lorg/mozilla/javascript/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v4, :cond_d

    .line 2008
    sget-object p2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 2012
    :cond_d
    instance-of v4, p2, Ljava/lang/Number;

    if-eqz v4, :cond_45

    instance-of v4, p1, Ljava/lang/Number;

    if-eqz v4, :cond_45

    move-object v4, p2

    .line 2013
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .local v0, "d1":D
    move-object v4, p1

    .line 2014
    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 2015
    .local v2, "d2":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_31

    move v4, v5

    .line 2016
    goto :goto_6

    .line 2018
    :cond_31
    const-wide/16 v4, 0x0

    cmpl-double v4, v0, v4

    if-nez v4, :cond_45

    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_45

    .line 2019
    const/4 v4, 0x0

    goto :goto_6

    .line 2022
    .end local v0    # "d1":D
    .end local v2    # "d2":D
    :cond_45
    invoke-static {p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    goto :goto_6
.end method

.method public declared-synchronized sealObject()V
    .registers 7

    .prologue
    .line 2213
    monitor-enter p0

    :try_start_1
    iget v4, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-ltz v4, :cond_30

    .line 2215
    iget-object v2, p0, Lorg/mozilla/javascript/ScriptableObject;->firstAdded:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2216
    .local v2, "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :goto_7
    if-eqz v2, :cond_2a

    .line 2217
    iget-object v3, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2218
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Lorg/mozilla/javascript/LazilyLoadedCtor;

    if-eqz v4, :cond_1c

    .line 2219
    move-object v0, v3

    check-cast v0, Lorg/mozilla/javascript/LazilyLoadedCtor;

    move-object v1, v0
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_27

    .line 2221
    .local v1, "initializer":Lorg/mozilla/javascript/LazilyLoadedCtor;
    :try_start_13
    invoke-virtual {v1}, Lorg/mozilla/javascript/LazilyLoadedCtor;->init()V
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_1f

    .line 2223
    :try_start_16
    invoke-virtual {v1}, Lorg/mozilla/javascript/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2226
    .end local v1    # "initializer":Lorg/mozilla/javascript/LazilyLoadedCtor;
    :cond_1c
    iget-object v2, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->orderedNext:Lorg/mozilla/javascript/ScriptableObject$Slot;

    .line 2227
    goto :goto_7

    .line 2223
    .restart local v1    # "initializer":Lorg/mozilla/javascript/LazilyLoadedCtor;
    :catchall_1f
    move-exception v4

    invoke-virtual {v1}, Lorg/mozilla/javascript/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v5

    iput-object v5, v2, Lorg/mozilla/javascript/ScriptableObject$Slot;->value:Ljava/lang/Object;

    throw v4
    :try_end_27
    .catchall {:try_start_16 .. :try_end_27} :catchall_27

    .line 2213
    .end local v1    # "initializer":Lorg/mozilla/javascript/LazilyLoadedCtor;
    .end local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    .end local v3    # "value":Ljava/lang/Object;
    :catchall_27
    move-exception v4

    monitor-exit p0

    throw v4

    .line 2228
    .restart local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_2a
    :try_start_2a
    iget v4, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    xor-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I
    :try_end_30
    .catchall {:try_start_2a .. :try_end_30} :catchall_27

    .line 2230
    .end local v2    # "slot":Lorg/mozilla/javascript/ScriptableObject$Slot;
    :cond_30
    monitor-exit p0

    return-void
.end method

.method public setAttributes(II)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "attributes"    # I

    .prologue
    const/4 v1, 0x0

    .line 754
    invoke-direct {p0, v1, p1}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 755
    const/4 v0, 0x2

    invoke-direct {p0, v1, p1, v0}, Lorg/mozilla/javascript/ScriptableObject;->findAttributeSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setAttributes(I)V

    .line 756
    return-void
.end method

.method public setAttributes(ILorg/mozilla/javascript/Scriptable;I)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "attributes"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 672
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/ScriptableObject;->setAttributes(II)V

    .line 673
    return-void
.end method

.method public setAttributes(Ljava/lang/String;I)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attributes"    # I

    .prologue
    const/4 v1, 0x0

    .line 736
    invoke-direct {p0, p1, v1}, Lorg/mozilla/javascript/ScriptableObject;->checkNotSealed(Ljava/lang/String;I)V

    .line 737
    const/4 v0, 0x2

    invoke-direct {p0, p1, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->findAttributeSlot(Ljava/lang/String;II)Lorg/mozilla/javascript/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/ScriptableObject$Slot;->setAttributes(I)V

    .line 738
    return-void
.end method

.method public final setAttributes(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;I)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "attributes"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 661
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 662
    return-void
.end method

.method public setExternalArrayData(Lorg/mozilla/javascript/ExternalArrayData;)V
    .registers 8
    .param p1, "array"    # Lorg/mozilla/javascript/ExternalArrayData;

    .prologue
    const/4 v2, 0x0

    .line 871
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject;->externalData:Lorg/mozilla/javascript/ExternalArrayData;

    .line 873
    if-nez p1, :cond_b

    .line 874
    const-string v0, "length"

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->delete(Ljava/lang/String;)V

    .line 880
    :goto_a
    return-void

    .line 877
    :cond_b
    const-string v1, "length"

    sget-object v3, Lorg/mozilla/javascript/ScriptableObject;->GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;

    const/4 v5, 0x3

    move-object v0, p0

    move-object v4, v2

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    goto :goto_a
.end method

.method public setGetterOrSetter(Ljava/lang/String;ILorg/mozilla/javascript/Callable;Z)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "getterOrSetter"    # Lorg/mozilla/javascript/Callable;
    .param p4, "isSetter"    # Z

    .prologue
    .line 764
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILorg/mozilla/javascript/Callable;ZZ)V

    .line 765
    return-void
.end method

.method public setParentScope(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "m"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 930
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject;->parentScopeObject:Lorg/mozilla/javascript/Scriptable;

    .line 931
    return-void
.end method

.method public setPrototype(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "m"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 914
    iput-object p1, p0, Lorg/mozilla/javascript/ScriptableObject;->prototypeObject:Lorg/mozilla/javascript/Scriptable;

    .line 915
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 3186
    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    if-gez v0, :cond_9

    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    xor-int/lit8 v0, v0, -0x1

    :goto_8
    return v0

    :cond_9
    iget v0, p0, Lorg/mozilla/javascript/ScriptableObject;->count:I

    goto :goto_8
.end method
