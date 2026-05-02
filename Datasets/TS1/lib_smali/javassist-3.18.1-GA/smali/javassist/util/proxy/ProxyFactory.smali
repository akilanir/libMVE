.class public Ljavassist/util/proxy/ProxyFactory;
.super Ljava/lang/Object;
.source "ProxyFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;,
        Ljavassist/util/proxy/ProxyFactory$UniqueName;,
        Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;,
        Ljavassist/util/proxy/ProxyFactory$ProxyDetails;
    }
.end annotation


# static fields
.field private static final DEFAULT_INTERCEPTOR:Ljava/lang/String; = "default_interceptor"

.field private static final FILTER_SIGNATURE_FIELD:Ljava/lang/String; = "_filter_signature"

.field private static final FILTER_SIGNATURE_TYPE:Ljava/lang/String; = "[B"

.field private static final HANDLER:Ljava/lang/String; = "handler"

.field private static final HANDLER_GETTER:Ljava/lang/String; = "getHandler"

.field private static final HANDLER_GETTER_KEY:Ljava/lang/String; = "getHandler:()"

.field private static final HANDLER_GETTER_TYPE:Ljava/lang/String;

.field private static final HANDLER_SETTER:Ljava/lang/String; = "setHandler"

.field private static final HANDLER_SETTER_TYPE:Ljava/lang/String;

.field private static final HANDLER_TYPE:Ljava/lang/String;

.field private static final HOLDER:Ljava/lang/String; = "_methods_"

.field private static final HOLDER_TYPE:Ljava/lang/String; = "[Ljava/lang/reflect/Method;"

.field private static final NULL_INTERCEPTOR_HOLDER:Ljava/lang/String; = "javassist.util.proxy.RuntimeSupport"

.field private static final OBJECT_TYPE:Ljava/lang/Class;

.field private static final SERIAL_VERSION_UID_FIELD:Ljava/lang/String; = "serialVersionUID"

.field private static final SERIAL_VERSION_UID_TYPE:Ljava/lang/String; = "J"

.field private static final SERIAL_VERSION_UID_VALUE:J = -0x1L

.field public static classLoaderProvider:Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;

.field private static hexDigits:[C

.field public static nameGenerator:Ljavassist/util/proxy/ProxyFactory$UniqueName;

.field private static proxyCache:Ljava/util/WeakHashMap;

.field private static sorter:Ljava/util/Comparator;

.field public static volatile useCache:Z

.field public static volatile useWriteReplace:Z


# instance fields
.field private basename:Ljava/lang/String;

.field private classname:Ljava/lang/String;

.field private factoryUseCache:Z

.field private factoryWriteReplace:Z

.field private handler:Ljavassist/util/proxy/MethodHandler;

.field private hasGetHandler:Z

.field private interfaces:[Ljava/lang/Class;

.field private methodFilter:Ljavassist/util/proxy/MethodFilter;

.field private signature:[B

.field private signatureMethods:Ljava/util/List;

.field private superClass:Ljava/lang/Class;

.field private superName:Ljava/lang/String;

.field private thisClass:Ljava/lang/Class;

.field public writeDirectory:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    .line 189
    const-class v0, Ljava/lang/Object;

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->OBJECT_TYPE:Ljava/lang/Class;

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x4c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Ljavassist/util/proxy/MethodHandler;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")V"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->HANDLER_SETTER_TYPE:Ljava/lang/String;

    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->HANDLER_GETTER_TYPE:Ljava/lang/String;

    .line 221
    sput-boolean v4, Ljavassist/util/proxy/ProxyFactory;->useCache:Z

    .line 242
    sput-boolean v4, Ljavassist/util/proxy/ProxyFactory;->useWriteReplace:Z

    .line 291
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->proxyCache:Ljava/util/WeakHashMap;

    .line 441
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_8c

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->hexDigits:[C

    .line 605
    new-instance v0, Ljavassist/util/proxy/ProxyFactory$1;

    invoke-direct {v0}, Ljavassist/util/proxy/ProxyFactory$1;-><init>()V

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->classLoaderProvider:Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;

    .line 722
    new-instance v0, Ljavassist/util/proxy/ProxyFactory$2;

    invoke-direct {v0}, Ljavassist/util/proxy/ProxyFactory$2;-><init>()V

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->nameGenerator:Ljavassist/util/proxy/ProxyFactory$UniqueName;

    .line 814
    new-instance v0, Ljavassist/util/proxy/ProxyFactory$3;

    invoke-direct {v0}, Ljavassist/util/proxy/ProxyFactory$3;-><init>()V

    sput-object v0, Ljavassist/util/proxy/ProxyFactory;->sorter:Ljava/util/Comparator;

    return-void

    .line 441
    :array_8c
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 339
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    .line 340
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    .line 341
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->methodFilter:Ljavassist/util/proxy/MethodFilter;

    .line 342
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->handler:Ljavassist/util/proxy/MethodHandler;

    .line 343
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 344
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    .line 345
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->hasGetHandler:Z

    .line 346
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 347
    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->writeDirectory:Ljava/lang/String;

    .line 348
    sget-boolean v0, Ljavassist/util/proxy/ProxyFactory;->useCache:Z

    iput-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    .line 349
    sget-boolean v0, Ljavassist/util/proxy/ProxyFactory;->useWriteReplace:Z

    iput-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    .line 350
    return-void
.end method

.method private static addClassInitializer(Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;ILjava/util/ArrayList;)V
    .registers 18
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "size"    # I
    .param p4, "forwarders"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 908
    new-instance v8, Ljavassist/bytecode/FieldInfo;

    const-string v1, "_methods_"

    const-string v2, "[Ljava/lang/reflect/Method;"

    invoke-direct {v8, p1, v1, v2}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 909
    .local v8, "finfo":Ljavassist/bytecode/FieldInfo;
    const/16 v1, 0xa

    invoke-virtual {v8, v1}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 910
    invoke-virtual {p0, v8}, Ljavassist/bytecode/ClassFile;->addField(Ljavassist/bytecode/FieldInfo;)V

    .line 911
    new-instance v10, Ljavassist/bytecode/MethodInfo;

    const-string v1, "<clinit>"

    const-string v2, "()V"

    invoke-direct {v10, p1, v1, v2}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 912
    .local v10, "minfo":Ljavassist/bytecode/MethodInfo;
    const/16 v1, 0x8

    invoke-virtual {v10, v1}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 913
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/ClassNotFoundException;

    aput-object v3, v1, v2

    invoke-static {v10, p1, v1}, Ljavassist/util/proxy/ProxyFactory;->setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;[Ljava/lang/Class;)V

    .line 915
    new-instance v0, Ljavassist/bytecode/Bytecode;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {v0, p1, v1, v2}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 916
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    mul-int/lit8 v1, p3, 0x2

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 917
    const-string v1, "java.lang.reflect.Method"

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljava/lang/String;)V

    .line 918
    const/4 v11, 0x0

    .line 919
    .local v11, "varArray":I
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 923
    invoke-virtual {v0, p2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 924
    const-string v1, "java.lang.Class"

    const-string v2, "forName"

    const-string v3, "(Ljava/lang/String;)Ljava/lang/Class;"

    invoke-virtual {v0, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 926
    const/4 v12, 0x1

    .line 927
    .local v12, "varClass":I
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 929
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 930
    .local v9, "it":Ljava/util/Iterator;
    :goto_55
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 931
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;

    .line 932
    .local v7, "args":Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;
    iget-object v1, v7, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->methodName:Ljava/lang/String;

    iget-object v2, v7, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->delegatorName:Ljava/lang/String;

    iget v3, v7, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->origIndex:I

    iget-object v4, v7, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;->descriptor:Ljava/lang/String;

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Ljavassist/util/proxy/ProxyFactory;->callFind2Methods(Ljavassist/bytecode/Bytecode;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;II)V

    goto :goto_55

    .line 936
    .end local v7    # "args":Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;
    :cond_6f
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 937
    const-string v1, "_methods_"

    const-string v2, "[Ljava/lang/reflect/Method;"

    invoke-virtual {v0, p2, v1, v2}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 939
    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    .line 940
    const-string v1, "serialVersionUID"

    const-string v2, "J"

    invoke-virtual {v0, p2, v1, v2}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    const/16 v1, 0xb1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 942
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 943
    invoke-virtual {p0, v10}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 944
    return-void
.end method

.method private static addGetter(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;)V
    .registers 8
    .param p0, "classname"    # Ljava/lang/String;
    .param p1, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 986
    new-instance v1, Ljavassist/bytecode/MethodInfo;

    const-string v2, "getHandler"

    sget-object v3, Ljavassist/util/proxy/ProxyFactory;->HANDLER_GETTER_TYPE:Ljava/lang/String;

    invoke-direct {v1, p2, v2, v3}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 988
    .local v1, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v1, v4}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 989
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, p2, v4, v4}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 990
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 991
    const-string v2, "handler"

    sget-object v3, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v0, p0, v2, v3}, Ljavassist/bytecode/Bytecode;->addGetfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 992
    const/16 v2, 0xb0

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 993
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 994
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 995
    return-void
.end method

.method private static addLoad(Ljavassist/bytecode/Bytecode;ILjava/lang/Class;)I
    .registers 5
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "n"    # I
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x2

    .line 1337
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 1338
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p2, v1, :cond_f

    .line 1339
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addLload(I)V

    .line 1354
    :goto_e
    return v0

    .line 1342
    :cond_f
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p2, v1, :cond_18

    .line 1343
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addFload(I)V

    .line 1354
    :goto_16
    const/4 v0, 0x1

    goto :goto_e

    .line 1344
    :cond_18
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p2, v1, :cond_20

    .line 1345
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addDload(I)V

    goto :goto_e

    .line 1349
    :cond_20
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    goto :goto_16

    .line 1352
    :cond_24
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_16
.end method

.method private static addLoadParameters(Ljavassist/bytecode/Bytecode;[Ljava/lang/Class;I)I
    .registers 8
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "params"    # [Ljava/lang/Class;
    .param p2, "offset"    # I

    .prologue
    .line 1328
    const/4 v2, 0x0

    .line 1329
    .local v2, "stacksize":I
    array-length v1, p1

    .line 1330
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, v1, :cond_11

    .line 1331
    add-int v3, v2, p2

    aget-object v4, p1, v0

    invoke-static {p0, v3, v4}, Ljavassist/util/proxy/ProxyFactory;->addLoad(Ljavassist/bytecode/Bytecode;ILjava/lang/Class;)I

    move-result v3

    add-int/2addr v2, v3

    .line 1330
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 1333
    :cond_11
    return v2
.end method

.method private static addReturn(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;)I
    .registers 4
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x2

    .line 1358
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 1359
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_11

    .line 1360
    const/16 v1, 0xad

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1379
    :goto_10
    return v0

    .line 1363
    :cond_11
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_1c

    .line 1364
    const/16 v0, 0xae

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1379
    :goto_1a
    const/4 v0, 0x1

    goto :goto_10

    .line 1365
    :cond_1c
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_26

    .line 1366
    const/16 v1, 0xaf

    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_10

    .line 1369
    :cond_26
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_31

    .line 1370
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1371
    const/4 v0, 0x0

    goto :goto_10

    .line 1374
    :cond_31
    const/16 v0, 0xac

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_1a

    .line 1377
    :cond_37
    const/16 v0, 0xb0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_1a
.end method

.method private static addSetter(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;)V
    .registers 9
    .param p0, "classname"    # Ljava/lang/String;
    .param p1, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 971
    new-instance v1, Ljavassist/bytecode/MethodInfo;

    const-string v2, "setHandler"

    sget-object v3, Ljavassist/util/proxy/ProxyFactory;->HANDLER_SETTER_TYPE:Ljava/lang/String;

    invoke-direct {v1, p2, v2, v3}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 973
    .local v1, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v1, v4}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 974
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, p2, v5, v5}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 975
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 976
    invoke-virtual {v0, v4}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 977
    const-string v2, "handler"

    sget-object v3, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v0, p0, v2, v3}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 978
    const/16 v2, 0xb1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 979
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 980
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 981
    return-void
.end method

.method private static addUnwrapper(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;)V
    .registers 6
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 1414
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 1415
    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_10

    .line 1416
    const/16 v2, 0x57

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1428
    :goto_f
    return-void

    .line 1418
    :cond_10
    invoke-static {p1}, Ljavassist/util/proxy/FactoryHelper;->typeIndex(Ljava/lang/Class;)I

    move-result v0

    .line 1419
    .local v0, "index":I
    sget-object v2, Ljavassist/util/proxy/FactoryHelper;->wrapperTypes:[Ljava/lang/String;

    aget-object v1, v2, v0

    .line 1420
    .local v1, "wrapper":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljava/lang/String;)V

    .line 1421
    sget-object v2, Ljavassist/util/proxy/FactoryHelper;->unwarpMethods:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Ljavassist/util/proxy/FactoryHelper;->unwrapDesc:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p0, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    .line 1427
    .end local v0    # "index":I
    .end local v1    # "wrapper":Ljava/lang/String;
    :cond_27
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljava/lang/String;)V

    goto :goto_f
.end method

.method private allocateClassName()V
    .registers 2

    .prologue
    .line 811
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    invoke-static {v0}, Ljavassist/util/proxy/ProxyFactory;->makeProxyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    .line 812
    return-void
.end method

.method private static callFind2Methods(Ljavassist/bytecode/Bytecode;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;II)V
    .registers 10
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "superMethod"    # Ljava/lang/String;
    .param p2, "thisMethod"    # Ljava/lang/String;
    .param p3, "index"    # I
    .param p4, "desc"    # Ljava/lang/String;
    .param p5, "classVar"    # I
    .param p6, "arrayVar"    # I

    .prologue
    .line 951
    const-class v2, Ljavassist/util/proxy/RuntimeSupport;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 952
    .local v0, "findClass":Ljava/lang/String;
    const-string v1, "(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/reflect/Method;)V"

    .line 955
    .local v1, "findDesc":Ljava/lang/String;
    invoke-virtual {p0, p5}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 956
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 957
    if-nez p2, :cond_23

    .line 958
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 962
    :goto_14
    invoke-virtual {p0, p3}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 963
    invoke-virtual {p0, p4}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 964
    invoke-virtual {p0, p6}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 965
    const-string v2, "find2Methods"

    invoke-virtual {p0, v0, v2, v1}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 966
    return-void

    .line 960
    :cond_23
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    goto :goto_14
.end method

.method private checkClassAndSuperName()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 790
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    if-nez v0, :cond_9

    .line 791
    new-array v0, v1, [Ljava/lang/Class;

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    .line 793
    :cond_9
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    if-nez v0, :cond_52

    .line 794
    sget-object v0, Ljavassist/util/proxy/ProxyFactory;->OBJECT_TYPE:Ljava/lang/Class;

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    .line 795
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    .line 796
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    array-length v0, v0

    if-nez v0, :cond_49

    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    :goto_20
    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    .line 803
    :goto_22
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 804
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is final"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 796
    :cond_49
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 799
    :cond_52
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    .line 800
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    goto :goto_22

    .line 806
    :cond_5f
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    const-string v1, "java."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_80

    .line 807
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "org.javassist.tmp."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    .line 808
    :cond_80
    return-void
.end method

.method private computeSignature(Ljavassist/util/proxy/MethodFilter;)V
    .registers 9
    .param p1, "filter"    # Ljavassist/util/proxy/MethodFilter;

    .prologue
    .line 836
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->makeSortedMethodList()V

    .line 838
    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    .line 839
    .local v2, "l":I
    add-int/lit8 v6, v2, 0x7

    shr-int/lit8 v4, v6, 0x3

    .line 840
    .local v4, "maxBytes":I
    new-array v6, v4, [B

    iput-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 841
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_12
    if-ge v1, v2, :cond_4a

    .line 843
    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 844
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Method;

    .line 845
    .local v3, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    .line 846
    .local v5, "mod":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v6

    if-nez v6, :cond_47

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-nez v6, :cond_47

    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    invoke-static {v5, v6, v3}, Ljavassist/util/proxy/ProxyFactory;->isVisible(ILjava/lang/String;Ljava/lang/reflect/Member;)Z

    move-result v6

    if-eqz v6, :cond_47

    if-eqz p1, :cond_42

    invoke-interface {p1, v3}, Ljavassist/util/proxy/MethodFilter;->isHandled(Ljava/lang/reflect/Method;)Z

    move-result v6

    if-eqz v6, :cond_47

    .line 848
    :cond_42
    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    invoke-direct {p0, v6, v1}, Ljavassist/util/proxy/ProxyFactory;->setBit([BI)V

    .line 841
    :cond_47
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 851
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v5    # "mod":I
    :cond_4a
    return-void
.end method

.method private createClass1()Ljava/lang/Class;
    .registers 5

    .prologue
    .line 424
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    if-nez v2, :cond_13

    .line 425
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyFactory;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 426
    .local v0, "cl":Ljava/lang/ClassLoader;
    sget-object v3, Ljavassist/util/proxy/ProxyFactory;->proxyCache:Ljava/util/WeakHashMap;

    monitor-enter v3

    .line 427
    :try_start_b
    iget-boolean v2, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    if-eqz v2, :cond_19

    .line 428
    invoke-direct {p0, v0}, Ljavassist/util/proxy/ProxyFactory;->createClass2(Ljava/lang/ClassLoader;)V

    .line 431
    :goto_12
    monitor-exit v3
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_1d

    .line 435
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    :cond_13
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 436
    .local v1, "result":Ljava/lang/Class;
    const/4 v2, 0x0

    iput-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 438
    return-object v1

    .line 430
    .end local v1    # "result":Ljava/lang/Class;
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    :cond_19
    :try_start_19
    invoke-direct {p0, v0}, Ljavassist/util/proxy/ProxyFactory;->createClass3(Ljava/lang/ClassLoader;)V

    goto :goto_12

    .line 431
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_19 .. :try_end_1f} :catchall_1d

    throw v2
.end method

.method private createClass2(Ljava/lang/ClassLoader;)V
    .registers 10
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 471
    iget-object v4, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    iget-object v5, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    iget-boolean v7, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    invoke-virtual {p0, v4, v5, v6, v7}, Ljavassist/util/proxy/ProxyFactory;->getKey(Ljava/lang/Class;[Ljava/lang/Class;[BZ)Ljava/lang/String;

    move-result-object v2

    .line 478
    .local v2, "key":Ljava/lang/String;
    sget-object v4, Ljavassist/util/proxy/ProxyFactory;->proxyCache:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 480
    .local v0, "cacheForTheLoader":Ljava/util/HashMap;
    if-nez v0, :cond_20

    .line 481
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "cacheForTheLoader":Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 482
    .restart local v0    # "cacheForTheLoader":Ljava/util/HashMap;
    sget-object v4, Ljavassist/util/proxy/ProxyFactory;->proxyCache:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    :cond_20
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;

    .line 485
    .local v1, "details":Ljavassist/util/proxy/ProxyFactory$ProxyDetails;
    if-eqz v1, :cond_37

    .line 486
    iget-object v3, v1, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;->proxyClass:Ljava/lang/ref/WeakReference;

    .line 487
    .local v3, "reference":Ljava/lang/ref/WeakReference;
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    iput-object v4, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 488
    iget-object v4, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    if-eqz v4, :cond_37

    .line 496
    .end local v3    # "reference":Ljava/lang/ref/WeakReference;
    :goto_36
    return-void

    .line 492
    :cond_37
    invoke-direct {p0, p1}, Ljavassist/util/proxy/ProxyFactory;->createClass3(Ljava/lang/ClassLoader;)V

    .line 493
    new-instance v1, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;

    .end local v1    # "details":Ljavassist/util/proxy/ProxyFactory$ProxyDetails;
    iget-object v4, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    iget-object v5, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    iget-boolean v6, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    invoke-direct {v1, v4, v5, v6}, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;-><init>([BLjava/lang/Class;Z)V

    .line 494
    .restart local v1    # "details":Ljavassist/util/proxy/ProxyFactory$ProxyDetails;
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_36
.end method

.method private createClass3(Ljava/lang/ClassLoader;)V
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 500
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->allocateClassName()V

    .line 503
    :try_start_3
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->make()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    .line 504
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->writeDirectory:Ljava/lang/String;

    if-eqz v2, :cond_10

    .line 505
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->writeDirectory:Ljava/lang/String;

    invoke-static {v0, v2}, Ljavassist/util/proxy/FactoryHelper;->writeFile(Ljavassist/bytecode/ClassFile;Ljava/lang/String;)V

    .line 507
    :cond_10
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyFactory;->getDomain()Ljava/security/ProtectionDomain;

    move-result-object v2

    invoke-static {v0, p1, v2}, Ljavassist/util/proxy/FactoryHelper;->toClass(Ljavassist/bytecode/ClassFile;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 508
    const-string v2, "_filter_signature"

    iget-object v3, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    invoke-direct {p0, v2, v3}, Ljavassist/util/proxy/ProxyFactory;->setField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 510
    iget-boolean v2, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    if-nez v2, :cond_2c

    .line 511
    const-string v2, "default_interceptor"

    iget-object v3, p0, Ljavassist/util/proxy/ProxyFactory;->handler:Ljavassist/util/proxy/MethodHandler;

    invoke-direct {p0, v2, v3}, Ljavassist/util/proxy/ProxyFactory;->setField(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2c
    .catch Ljavassist/CannotCompileException; {:try_start_3 .. :try_end_2c} :catch_2d

    .line 518
    :cond_2c
    return-void

    .line 514
    .end local v0    # "cf":Ljavassist/bytecode/ClassFile;
    :catch_2d
    move-exception v1

    .line 515
    .local v1, "e":Ljavassist/CannotCompileException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljavassist/CannotCompileException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 539
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 540
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 541
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 542
    .local v2, "value":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    .line 543
    return-object v2

    .line 545
    .end local v1    # "f":Ljava/lang/reflect/Field;
    .end local v2    # "value":Ljava/lang/Object;
    :catch_12
    move-exception v0

    .line 546
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method static getFilterSignature(Ljava/lang/Class;)[B
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 534
    const-string v0, "_filter_signature"

    invoke-static {p0, v0}, Ljavassist/util/proxy/ProxyFactory;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public static getHandler(Ljavassist/util/proxy/Proxy;)Ljavassist/util/proxy/MethodHandler;
    .registers 6
    .param p0, "p"    # Ljavassist/util/proxy/Proxy;

    .prologue
    .line 559
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "handler"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 560
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 561
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 562
    .local v2, "value":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 563
    check-cast v2, Ljavassist/util/proxy/MethodHandler;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_18} :catch_19

    .end local v2    # "value":Ljava/lang/Object;
    return-object v2

    .line 565
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :catch_19
    move-exception v0

    .line 566
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private getMethods(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/HashMap;
    .registers 7
    .param p1, "superClass"    # Ljava/lang/Class;
    .param p2, "interfaceTypes"    # [Ljava/lang/Class;

    .prologue
    .line 1117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1118
    .local v0, "hash":Ljava/util/HashMap;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1119
    .local v2, "set":Ljava/util/HashSet;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    array-length v3, p2

    if-ge v1, v3, :cond_16

    .line 1120
    aget-object v3, p2, v1

    invoke-direct {p0, v0, v3, v2}, Ljavassist/util/proxy/ProxyFactory;->getMethods(Ljava/util/HashMap;Ljava/lang/Class;Ljava/util/Set;)V

    .line 1119
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1122
    :cond_16
    invoke-direct {p0, v0, p1, v2}, Ljavassist/util/proxy/ProxyFactory;->getMethods(Ljava/util/HashMap;Ljava/lang/Class;Ljava/util/Set;)V

    .line 1123
    return-object v0
.end method

.method private getMethods(Ljava/util/HashMap;Ljava/lang/Class;Ljava/util/Set;)V
    .registers 13
    .param p1, "hash"    # Ljava/util/HashMap;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "visitedClasses"    # Ljava/util/Set;

    .prologue
    .line 1129
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 1165
    :cond_6
    return-void

    .line 1132
    :cond_7
    invoke-virtual {p2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 1133
    .local v1, "ifs":[Ljava/lang/Class;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    array-length v7, v1

    if-ge v0, v7, :cond_17

    .line 1134
    aget-object v7, v1, v0

    invoke-direct {p0, p1, v7, p3}, Ljavassist/util/proxy/ProxyFactory;->getMethods(Ljava/util/HashMap;Ljava/lang/Class;Ljava/util/Set;)V

    .line 1133
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 1136
    :cond_17
    invoke-virtual {p2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 1137
    .local v6, "parent":Ljava/lang/Class;
    if-eqz v6, :cond_20

    .line 1138
    invoke-direct {p0, p1, v6, p3}, Ljavassist/util/proxy/ProxyFactory;->getMethods(Ljava/util/HashMap;Ljava/lang/Class;Ljava/util/Set;)V

    .line 1145
    :cond_20
    invoke-static {p2}, Ljavassist/util/proxy/SecurityActions;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1146
    .local v4, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    :goto_25
    array-length v7, v4

    if-ge v0, v7, :cond_6

    .line 1147
    aget-object v7, v4, v0

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v7

    if-nez v7, :cond_83

    .line 1148
    aget-object v3, v4, v0

    .line 1149
    .local v3, "m":Ljava/lang/reflect/Method;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x3a

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Ljavassist/util/proxy/RuntimeSupport;->makeDescriptor(Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1150
    .local v2, "key":Ljava/lang/String;
    const-string v7, "getHandler:()"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_60

    .line 1151
    const/4 v7, 0x1

    iput-boolean v7, p0, Ljavassist/util/proxy/ProxyFactory;->hasGetHandler:Z

    .line 1155
    :cond_60
    aget-object v7, v4, v0

    invoke-virtual {p1, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Method;

    .line 1158
    .local v5, "oldMethod":Ljava/lang/reflect/Method;
    if-eqz v5, :cond_83

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-eqz v7, :cond_83

    aget-object v7, v4, v0

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-nez v7, :cond_83

    .line 1162
    invoke-virtual {p1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1146
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v5    # "oldMethod":Ljava/lang/reflect/Method;
    :cond_83
    add-int/lit8 v0, v0, 0x1

    goto :goto_25
.end method

.method private static getPackageName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1107
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1108
    .local v0, "i":I
    if-gez v0, :cond_a

    .line 1109
    const/4 v1, 0x0

    .line 1111
    :goto_9
    return-object v1

    :cond_a
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method private installSignature([B)V
    .registers 6
    .param p1, "signature"    # [B

    .prologue
    .line 855
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->makeSortedMethodList()V

    .line 857
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    .line 858
    .local v0, "l":I
    add-int/lit8 v2, v0, 0x7

    shr-int/lit8 v1, v2, 0x3

    .line 859
    .local v1, "maxBytes":I
    array-length v2, p1

    if-eq v2, v1, :cond_18

    .line 860
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "invalid filter signature length for deserialized proxy class"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 863
    :cond_18
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 864
    return-void
.end method

.method private static isBridge(Ljava/lang/reflect/Method;)Z
    .registers 2
    .param p0, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1020
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->isBridge()Z

    move-result v0

    return v0
.end method

.method public static isProxyClass(Ljava/lang/Class;)Z
    .registers 2
    .param p0, "cl"    # Ljava/lang/Class;

    .prologue
    .line 301
    const-class v0, Ljavassist/util/proxy/Proxy;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method private static isVisible(ILjava/lang/String;Ljava/lang/reflect/Member;)Z
    .registers 8
    .param p0, "mod"    # I
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "meth"    # Ljava/lang/reflect/Member;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1092
    and-int/lit8 v4, p0, 0x2

    if-eqz v4, :cond_8

    move v2, v3

    .line 1102
    :cond_7
    :goto_7
    return v2

    .line 1094
    :cond_8
    and-int/lit8 v4, p0, 0x5

    if-nez v4, :cond_7

    .line 1097
    invoke-static {p1}, Ljavassist/util/proxy/ProxyFactory;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1098
    .local v0, "p":Ljava/lang/String;
    invoke-interface {p2}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljavassist/util/proxy/ProxyFactory;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1099
    .local v1, "q":Ljava/lang/String;
    if-nez v0, :cond_22

    .line 1100
    if-eqz v1, :cond_7

    move v2, v3

    goto :goto_7

    .line 1102
    :cond_22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_7
.end method

.method private static keyToDesc(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1171
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private make()Ljavassist/bytecode/ClassFile;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x9

    .line 738
    new-instance v0, Ljavassist/bytecode/ClassFile;

    const/4 v8, 0x0

    iget-object v9, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    iget-object v10, p0, Ljavassist/util/proxy/ProxyFactory;->superName:Ljava/lang/String;

    invoke-direct {v0, v8, v9, v10}, Ljavassist/bytecode/ClassFile;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    .line 739
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljavassist/bytecode/ClassFile;->setAccessFlags(I)V

    .line 740
    iget-object v9, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    iget-boolean v8, p0, Ljavassist/util/proxy/ProxyFactory;->hasGetHandler:Z

    if-eqz v8, :cond_96

    const-class v8, Ljavassist/util/proxy/Proxy;

    :goto_18
    invoke-static {v0, v9, v8}, Ljavassist/util/proxy/ProxyFactory;->setInterfaces(Ljavassist/bytecode/ClassFile;[Ljava/lang/Class;Ljava/lang/Class;)V

    .line 741
    invoke-virtual {v0}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v6

    .line 744
    .local v6, "pool":Ljavassist/bytecode/ConstPool;
    iget-boolean v8, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    if-nez v8, :cond_32

    .line 745
    new-instance v1, Ljavassist/bytecode/FieldInfo;

    const-string v8, "default_interceptor"

    sget-object v9, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-direct {v1, v6, v8, v9}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1, v11}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 747
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ClassFile;->addField(Ljavassist/bytecode/FieldInfo;)V

    .line 751
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_32
    new-instance v2, Ljavassist/bytecode/FieldInfo;

    const-string v8, "handler"

    sget-object v9, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-direct {v2, v6, v8, v9}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    .local v2, "finfo2":Ljavassist/bytecode/FieldInfo;
    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 753
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ClassFile;->addField(Ljavassist/bytecode/FieldInfo;)V

    .line 756
    new-instance v3, Ljavassist/bytecode/FieldInfo;

    const-string v8, "_filter_signature"

    const-string v9, "[B"

    invoke-direct {v3, v6, v8, v9}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    .local v3, "finfo3":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v3, v11}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 758
    invoke-virtual {v0, v3}, Ljavassist/bytecode/ClassFile;->addField(Ljavassist/bytecode/FieldInfo;)V

    .line 761
    new-instance v4, Ljavassist/bytecode/FieldInfo;

    const-string v8, "serialVersionUID"

    const-string v9, "J"

    invoke-direct {v4, v6, v8, v9}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    .local v4, "finfo4":Ljavassist/bytecode/FieldInfo;
    const/16 v8, 0x19

    invoke-virtual {v4, v8}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 763
    invoke-virtual {v0, v4}, Ljavassist/bytecode/ClassFile;->addField(Ljavassist/bytecode/FieldInfo;)V

    .line 767
    iget-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    iget-object v9, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    invoke-direct {p0, v8, v0, v6, v9}, Ljavassist/util/proxy/ProxyFactory;->makeConstructors(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 769
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 770
    .local v5, "forwarders":Ljava/util/ArrayList;
    iget-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    invoke-direct {p0, v0, v6, v8, v5}, Ljavassist/util/proxy/ProxyFactory;->overrideMethods(Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/util/ArrayList;)I

    move-result v7

    .line 771
    .local v7, "s":I
    iget-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    invoke-static {v0, v6, v8, v7, v5}, Ljavassist/util/proxy/ProxyFactory;->addClassInitializer(Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;ILjava/util/ArrayList;)V

    .line 772
    iget-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    invoke-static {v8, v0, v6}, Ljavassist/util/proxy/ProxyFactory;->addSetter(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;)V

    .line 773
    iget-boolean v8, p0, Ljavassist/util/proxy/ProxyFactory;->hasGetHandler:Z

    if-nez v8, :cond_87

    .line 774
    iget-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->classname:Ljava/lang/String;

    invoke-static {v8, v0, v6}, Ljavassist/util/proxy/ProxyFactory;->addGetter(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;)V

    .line 776
    :cond_87
    iget-boolean v8, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    if-eqz v8, :cond_92

    .line 778
    :try_start_8b
    invoke-static {v6}, Ljavassist/util/proxy/ProxyFactory;->makeWriteReplace(Ljavassist/bytecode/ConstPool;)Ljavassist/bytecode/MethodInfo;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V
    :try_end_92
    .catch Ljavassist/bytecode/DuplicateMemberException; {:try_start_8b .. :try_end_92} :catch_99

    .line 785
    :cond_92
    :goto_92
    const/4 v8, 0x0

    iput-object v8, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 786
    return-object v0

    .line 740
    .end local v2    # "finfo2":Ljavassist/bytecode/FieldInfo;
    .end local v3    # "finfo3":Ljavassist/bytecode/FieldInfo;
    .end local v4    # "finfo4":Ljavassist/bytecode/FieldInfo;
    .end local v5    # "forwarders":Ljava/util/ArrayList;
    .end local v6    # "pool":Ljavassist/bytecode/ConstPool;
    .end local v7    # "s":I
    :cond_96
    const-class v8, Ljavassist/util/proxy/ProxyObject;

    goto :goto_18

    .line 780
    .restart local v2    # "finfo2":Ljavassist/bytecode/FieldInfo;
    .restart local v3    # "finfo3":Ljavassist/bytecode/FieldInfo;
    .restart local v4    # "finfo4":Ljavassist/bytecode/FieldInfo;
    .restart local v5    # "forwarders":Ljava/util/ArrayList;
    .restart local v6    # "pool":Ljavassist/bytecode/ConstPool;
    .restart local v7    # "s":I
    :catch_99
    move-exception v8

    goto :goto_92
.end method

.method private static makeConstructor(Ljava/lang/String;Ljava/lang/reflect/Constructor;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Z)Ljavassist/bytecode/MethodInfo;
    .registers 15
    .param p0, "thisClassName"    # Ljava/lang/String;
    .param p1, "cons"    # Ljava/lang/reflect/Constructor;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "superClass"    # Ljava/lang/Class;
    .param p4, "doHandlerInit"    # Z

    .prologue
    .line 1176
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    sget-object v8, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v8}, Ljavassist/util/proxy/RuntimeSupport;->makeDescriptor([Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    .line 1178
    .local v2, "desc":Ljava/lang/String;
    new-instance v3, Ljavassist/bytecode/MethodInfo;

    const-string v7, "<init>"

    invoke-direct {v3, p2, v7, v2}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 1179
    .local v3, "minfo":Ljavassist/bytecode/MethodInfo;
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 1180
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v7

    invoke-static {v3, p2, v7}, Ljavassist/util/proxy/ProxyFactory;->setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;[Ljava/lang/Class;)V

    .line 1181
    new-instance v1, Ljavassist/bytecode/Bytecode;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct {v1, p2, v7, v8}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 1186
    .local v1, "code":Ljavassist/bytecode/Bytecode;
    if-eqz p4, :cond_48

    .line 1187
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1188
    const-string v7, "default_interceptor"

    sget-object v8, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v1, p0, v7, v8}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1189
    const-string v7, "handler"

    sget-object v8, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v1, p0, v7, v8}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1190
    const-string v7, "default_interceptor"

    sget-object v8, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v1, p0, v7, v8}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1191
    const/16 v7, 0xc7

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1192
    const/16 v7, 0xa

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1196
    :cond_48
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1197
    const-string v7, "javassist.util.proxy.RuntimeSupport"

    const-string v8, "default_interceptor"

    sget-object v9, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v1, v7, v8, v9}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1198
    const-string v7, "handler"

    sget-object v8, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v1, p0, v7, v8}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1199
    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    .line 1201
    .local v4, "pc":I
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1202
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    const/4 v8, 0x1

    invoke-static {v1, v7, v8}, Ljavassist/util/proxy/ProxyFactory;->addLoadParameters(Ljavassist/bytecode/Bytecode;[Ljava/lang/Class;I)I

    move-result v5

    .line 1203
    .local v5, "s":I
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "<init>"

    invoke-virtual {v1, v7, v8, v2}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1204
    const/16 v7, 0xb1

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1205
    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 1206
    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 1207
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v3, v0}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 1209
    new-instance v6, Ljavassist/bytecode/StackMapTable$Writer;

    const/16 v7, 0x20

    invoke-direct {v6, v7}, Ljavassist/bytecode/StackMapTable$Writer;-><init>(I)V

    .line 1210
    .local v6, "writer":Ljavassist/bytecode/StackMapTable$Writer;
    invoke-virtual {v6, v4}, Ljavassist/bytecode/StackMapTable$Writer;->sameFrame(I)V

    .line 1211
    invoke-virtual {v6, p2}, Ljavassist/bytecode/StackMapTable$Writer;->toStackMapTable(Ljavassist/bytecode/ConstPool;)Ljavassist/bytecode/StackMapTable;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljavassist/bytecode/CodeAttribute;->setAttribute(Ljavassist/bytecode/StackMapTable;)V

    .line 1212
    return-object v3
.end method

.method private makeConstructors(Ljava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 12
    .param p1, "thisClassName"    # Ljava/lang/String;
    .param p2, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p3, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p4, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1048
    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-static {v6}, Ljavassist/util/proxy/SecurityActions;->getDeclaredConstructors(Ljava/lang/Class;)[Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 1050
    .local v1, "cons":[Ljava/lang/reflect/Constructor;
    iget-boolean v6, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    if-nez v6, :cond_35

    const/4 v2, 0x1

    .line 1051
    .local v2, "doHandlerInit":Z
    :goto_b
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c
    array-length v6, v1

    if-ge v3, v6, :cond_37

    .line 1052
    aget-object v0, v1, v3

    .line 1053
    .local v0, "c":Ljava/lang/reflect/Constructor;
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v5

    .line 1054
    .local v5, "mod":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v6

    if-nez v6, :cond_32

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v6

    if-nez v6, :cond_32

    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->basename:Ljava/lang/String;

    invoke-static {v5, v6, v0}, Ljavassist/util/proxy/ProxyFactory;->isVisible(ILjava/lang/String;Ljava/lang/reflect/Member;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 1056
    iget-object v6, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-static {p1, v0, p3, v6, v2}, Ljavassist/util/proxy/ProxyFactory;->makeConstructor(Ljava/lang/String;Ljava/lang/reflect/Constructor;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Z)Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    .line 1057
    .local v4, "m":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {p2, v4}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 1051
    .end local v4    # "m":Ljavassist/bytecode/MethodInfo;
    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 1050
    .end local v0    # "c":Ljava/lang/reflect/Constructor;
    .end local v2    # "doHandlerInit":Z
    .end local v3    # "i":I
    .end local v5    # "mod":I
    :cond_35
    const/4 v2, 0x0

    goto :goto_b

    .line 1060
    .restart local v2    # "doHandlerInit":Z
    .restart local v3    # "i":I
    :cond_37
    return-void
.end method

.method private static makeDelegator(Ljava/lang/reflect/Method;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;
    .registers 10
    .param p0, "meth"    # Ljava/lang/reflect/Method;
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "declClass"    # Ljava/lang/Class;
    .param p4, "delegatorName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1217
    new-instance v1, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v1, p2, p4, p1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 1218
    .local v1, "delegator":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    and-int/lit16 v3, v3, -0x527

    or-int/lit8 v3, v3, 0x11

    invoke-virtual {v1, v3}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 1224
    invoke-static {v1, p2, p0}, Ljavassist/util/proxy/ProxyFactory;->setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;Ljava/lang/reflect/Method;)V

    .line 1225
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, p2, v4, v4}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 1226
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v0, v4}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1227
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Ljavassist/util/proxy/ProxyFactory;->addLoadParameters(Ljavassist/bytecode/Bytecode;[Ljava/lang/Class;I)I

    move-result v2

    .line 1228
    .local v2, "s":I
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4, p1}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1229
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v0, v3}, Ljavassist/util/proxy/ProxyFactory;->addReturn(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;)I

    .line 1230
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 1231
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 1232
    return-object v1
.end method

.method private static makeForwarder(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Ljava/lang/String;ILjava/util/ArrayList;)Ljavassist/bytecode/MethodInfo;
    .registers 21
    .param p0, "thisClassName"    # Ljava/lang/String;
    .param p1, "meth"    # Ljava/lang/reflect/Method;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p4, "declClass"    # Ljava/lang/Class;
    .param p5, "delegatorName"    # Ljava/lang/String;
    .param p6, "index"    # I
    .param p7, "forwarders"    # Ljava/util/ArrayList;

    .prologue
    .line 1242
    new-instance v6, Ljavassist/bytecode/MethodInfo;

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p3

    invoke-direct {v6, v0, v9, p2}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 1243
    .local v6, "forwarder":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v9

    and-int/lit16 v9, v9, -0x521

    or-int/lit8 v9, v9, 0x10

    invoke-virtual {v6, v9}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 1247
    move-object/from16 v0, p3

    invoke-static {v6, v0, p1}, Ljavassist/util/proxy/ProxyFactory;->setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;Ljava/lang/reflect/Method;)V

    .line 1248
    invoke-static {p2}, Ljavassist/bytecode/Descriptor;->paramSize(Ljava/lang/String;)I

    move-result v1

    .line 1249
    .local v1, "args":I
    new-instance v4, Ljavassist/bytecode/Bytecode;

    const/4 v9, 0x0

    add-int/lit8 v10, v1, 0x2

    move-object/from16 v0, p3

    invoke-direct {v4, v0, v9, v10}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 1262
    .local v4, "code":Ljavassist/bytecode/Bytecode;
    mul-int/lit8 v7, p6, 0x2

    .line 1263
    .local v7, "origIndex":I
    mul-int/lit8 v9, p6, 0x2

    add-int/lit8 v5, v9, 0x1

    .line 1264
    .local v5, "delIndex":I
    add-int/lit8 v2, v1, 0x1

    .line 1265
    .local v2, "arrayVar":I
    const-string v9, "_methods_"

    const-string v10, "[Ljava/lang/reflect/Method;"

    invoke-virtual {v4, p0, v9, v10}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1266
    invoke-virtual {v4, v2}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 1268
    new-instance v9, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p5

    invoke-direct {v9, v10, v0, p2, v7}, Ljavassist/util/proxy/ProxyFactory$Find2MethodsArgs;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, p7

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1270
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1271
    const-string v9, "handler"

    sget-object v10, Ljavassist/util/proxy/ProxyFactory;->HANDLER_TYPE:Ljava/lang/String;

    invoke-virtual {v4, p0, v9, v10}, Ljavassist/bytecode/Bytecode;->addGetfield(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1272
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1274
    invoke-virtual {v4, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1275
    invoke-virtual {v4, v7}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1276
    const/16 v9, 0x32

    invoke-virtual {v4, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1278
    invoke-virtual {v4, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1279
    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1280
    const/16 v9, 0x32

    invoke-virtual {v4, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1282
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    invoke-static {v4, v9}, Ljavassist/util/proxy/ProxyFactory;->makeParameterList(Ljavassist/bytecode/Bytecode;[Ljava/lang/Class;)V

    .line 1283
    const-class v9, Ljavassist/util/proxy/MethodHandler;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "invoke"

    const-string v11, "(Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;"

    const/4 v12, 0x5

    invoke-virtual {v4, v9, v10, v11, v12}, Ljavassist/bytecode/Bytecode;->addInvokeinterface(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1286
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    .line 1287
    .local v8, "retType":Ljava/lang/Class;
    invoke-static {v4, v8}, Ljavassist/util/proxy/ProxyFactory;->addUnwrapper(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;)V

    .line 1288
    invoke-static {v4, v8}, Ljavassist/util/proxy/ProxyFactory;->addReturn(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;)I

    .line 1290
    invoke-virtual {v4}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v3

    .line 1291
    .local v3, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v6, v3}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 1292
    return-object v6
.end method

.method private static makeParameterList(Ljavassist/bytecode/Bytecode;[Ljava/lang/Class;)V
    .registers 7
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "params"    # [Ljava/lang/Class;

    .prologue
    .line 1383
    const/4 v2, 0x1

    .line 1384
    .local v2, "regno":I
    array-length v1, p1

    .line 1385
    .local v1, "n":I
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1386
    const-string v4, "java/lang/Object"

    invoke-virtual {p0, v4}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljava/lang/String;)V

    .line 1387
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_2f

    .line 1388
    const/16 v4, 0x59

    invoke-virtual {p0, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1389
    invoke-virtual {p0, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1390
    aget-object v3, p1, v0

    .line 1391
    .local v3, "type":Ljava/lang/Class;
    invoke-virtual {v3}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 1392
    invoke-static {p0, v3, v2}, Ljavassist/util/proxy/ProxyFactory;->makeWrapper(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;I)I

    move-result v2

    .line 1398
    :goto_21
    const/16 v4, 0x53

    invoke-virtual {p0, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1387
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1394
    :cond_29
    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1395
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 1400
    .end local v3    # "type":Ljava/lang/Class;
    :cond_2f
    return-void
.end method

.method private static makeProxyName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "classname"    # Ljava/lang/String;

    .prologue
    .line 732
    sget-object v1, Ljavassist/util/proxy/ProxyFactory;->nameGenerator:Ljavassist/util/proxy/ProxyFactory$UniqueName;

    monitor-enter v1

    .line 733
    :try_start_3
    sget-object v0, Ljavassist/util/proxy/ProxyFactory;->nameGenerator:Ljavassist/util/proxy/ProxyFactory$UniqueName;

    invoke-interface {v0, p0}, Ljavassist/util/proxy/ProxyFactory$UniqueName;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 734
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method private makeSortedMethodList()V
    .registers 4

    .prologue
    .line 826
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->checkClassAndSuperName()V

    .line 828
    const/4 v1, 0x0

    iput-boolean v1, p0, Ljavassist/util/proxy/ProxyFactory;->hasGetHandler:Z

    .line 829
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    invoke-direct {p0, v1, v2}, Ljavassist/util/proxy/ProxyFactory;->getMethods(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/HashMap;

    move-result-object v0

    .line 830
    .local v0, "allMethods":Ljava/util/HashMap;
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    .line 831
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    sget-object v2, Ljavassist/util/proxy/ProxyFactory;->sorter:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 832
    return-void
.end method

.method private static makeUniqueName(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sortedMethods"    # Ljava/util/List;

    .prologue
    .line 1063
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-static {p0, v2}, Ljavassist/util/proxy/ProxyFactory;->makeUniqueName0(Ljava/lang/String;Ljava/util/Iterator;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1069
    .end local p0    # "name":Ljava/lang/String;
    :goto_a
    return-object p0

    .line 1066
    .restart local p0    # "name":Ljava/lang/String;
    :cond_b
    const/16 v0, 0x64

    .local v0, "i":I
    :goto_d
    const/16 v2, 0x3e7

    if-ge v0, v2, :cond_31

    .line 1067
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1068
    .local v1, "s":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-static {v1, v2}, Ljavassist/util/proxy/ProxyFactory;->makeUniqueName0(Ljava/lang/String;Ljava/util/Iterator;)Z

    move-result v2

    if-eqz v2, :cond_2e

    move-object p0, v1

    .line 1069
    goto :goto_a

    .line 1066
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 1072
    .end local v1    # "s":Ljava/lang/String;
    :cond_31
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "cannot make a unique method name"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static makeUniqueName0(Ljava/lang/String;Ljava/util/Iterator;)Z
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "it"    # Ljava/util/Iterator;

    .prologue
    .line 1076
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 1077
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1078
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1079
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1080
    const/4 v2, 0x0

    .line 1083
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v1    # "key":Ljava/lang/String;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x1

    goto :goto_19
.end method

.method private static makeWrapper(Ljavassist/bytecode/Bytecode;Ljava/lang/Class;I)I
    .registers 7
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "regno"    # I

    .prologue
    .line 1403
    invoke-static {p1}, Ljavassist/util/proxy/FactoryHelper;->typeIndex(Ljava/lang/Class;)I

    move-result v0

    .line 1404
    .local v0, "index":I
    sget-object v2, Ljavassist/util/proxy/FactoryHelper;->wrapperTypes:[Ljava/lang/String;

    aget-object v1, v2, v0

    .line 1405
    .local v1, "wrapper":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addNew(Ljava/lang/String;)V

    .line 1406
    const/16 v2, 0x59

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1407
    invoke-static {p0, p2, p1}, Ljavassist/util/proxy/ProxyFactory;->addLoad(Ljavassist/bytecode/Bytecode;ILjava/lang/Class;)I

    .line 1408
    const-string v2, "<init>"

    sget-object v3, Ljavassist/util/proxy/FactoryHelper;->wrapperDesc:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p0, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1410
    sget-object v2, Ljavassist/util/proxy/FactoryHelper;->dataSize:[I

    aget v2, v2, v0

    add-int/2addr v2, p2

    return v2
.end method

.method private static makeWriteReplace(Ljavassist/bytecode/ConstPool;)Ljavassist/bytecode/MethodInfo;
    .registers 9
    .param p0, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1431
    new-instance v3, Ljavassist/bytecode/MethodInfo;

    const-string v4, "writeReplace"

    const-string v5, "()Ljava/lang/Object;"

    invoke-direct {v3, p0, v4, v5}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 1432
    .local v3, "minfo":Ljavassist/bytecode/MethodInfo;
    new-array v2, v7, [Ljava/lang/String;

    .line 1433
    .local v2, "list":[Ljava/lang/String;
    const-string v4, "java.io.ObjectStreamException"

    aput-object v4, v2, v6

    .line 1434
    new-instance v1, Ljavassist/bytecode/ExceptionsAttribute;

    invoke-direct {v1, p0}, Ljavassist/bytecode/ExceptionsAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 1435
    .local v1, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    invoke-virtual {v1, v2}, Ljavassist/bytecode/ExceptionsAttribute;->setExceptions([Ljava/lang/String;)V

    .line 1436
    invoke-virtual {v3, v1}, Ljavassist/bytecode/MethodInfo;->setExceptionsAttribute(Ljavassist/bytecode/ExceptionsAttribute;)V

    .line 1437
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, p0, v6, v7}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 1438
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v0, v6}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1439
    const-string v4, "javassist.util.proxy.RuntimeSupport"

    const-string v5, "makeSerializedProxy"

    const-string v6, "(Ljava/lang/Object;)Ljavassist/util/proxy/SerializedProxy;"

    invoke-virtual {v0, v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1442
    const/16 v4, 0xb0

    invoke-virtual {v0, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1443
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 1444
    return-object v3
.end method

.method private override(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/String;ILjava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/util/ArrayList;)V
    .registers 21
    .param p1, "thisClassname"    # Ljava/lang/String;
    .param p2, "meth"    # Ljava/lang/reflect/Method;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "index"    # I
    .param p5, "desc"    # Ljava/lang/String;
    .param p6, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p7, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p8, "forwarders"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1027
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    .line 1028
    .local v6, "declClass":Ljava/lang/Class;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1029
    .local v7, "delegatorName":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 1030
    const/4 v7, 0x0

    :goto_2a
    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p5

    move-object/from16 v5, p7

    move/from16 v8, p4

    move-object/from16 v9, p8

    .line 1039
    invoke-static/range {v2 .. v9}, Ljavassist/util/proxy/ProxyFactory;->makeForwarder(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Ljava/lang/String;ILjava/util/ArrayList;)Ljavassist/bytecode/MethodInfo;

    move-result-object v11

    .line 1042
    .local v11, "forwarder":Ljavassist/bytecode/MethodInfo;
    move-object/from16 v0, p6

    invoke-virtual {v0, v11}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 1043
    return-void

    .line 1032
    .end local v11    # "forwarder":Ljavassist/bytecode/MethodInfo;
    :cond_3e
    move-object/from16 v0, p5

    move-object/from16 v1, p7

    invoke-static {p2, v0, v1, v6, v7}, Ljavassist/util/proxy/ProxyFactory;->makeDelegator(Ljava/lang/reflect/Method;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljava/lang/Class;Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;

    move-result-object v10

    .line 1035
    .local v10, "delegator":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v10}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v2

    and-int/lit8 v2, v2, -0x41

    invoke-virtual {v10, v2}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 1036
    move-object/from16 v0, p6

    invoke-virtual {v0, v10}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    goto :goto_2a
.end method

.method private overrideMethods(Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/util/ArrayList;)I
    .registers 17
    .param p1, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "forwarders"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1000
    const-string v0, "_d"

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    invoke-static {v0, v1}, Ljavassist/util/proxy/ProxyFactory;->makeUniqueName(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    .line 1001
    .local v3, "prefix":Ljava/lang/String;
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signatureMethods:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 1002
    .local v10, "it":Ljava/util/Iterator;
    const/4 v4, 0x0

    .line 1003
    .local v4, "index":I
    :goto_f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 1004
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 1005
    .local v9, "e":Ljava/util/Map$Entry;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 1006
    .local v11, "key":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 1007
    .local v2, "meth":Ljava/lang/reflect/Method;
    sget v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    const/16 v1, 0x31

    if-lt v0, v1, :cond_33

    invoke-static {v2}, Ljavassist/util/proxy/ProxyFactory;->isBridge(Ljava/lang/reflect/Method;)Z

    move-result v0

    if-nez v0, :cond_48

    .line 1008
    :cond_33
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    invoke-direct {p0, v0, v4}, Ljavassist/util/proxy/ProxyFactory;->testBit([BI)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 1009
    invoke-static {v11, v2}, Ljavassist/util/proxy/ProxyFactory;->keyToDesc(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p3

    move-object v6, p1

    move-object v7, p2

    move-object/from16 v8, p4

    invoke-direct/range {v0 .. v8}, Ljavassist/util/proxy/ProxyFactory;->override(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/String;ILjava/lang/String;Ljavassist/bytecode/ClassFile;Ljavassist/bytecode/ConstPool;Ljava/util/ArrayList;)V

    .line 1013
    :cond_48
    add-int/lit8 v4, v4, 0x1

    .line 1014
    goto :goto_f

    .line 1016
    .end local v2    # "meth":Ljava/lang/reflect/Method;
    .end local v9    # "e":Ljava/util/Map$Entry;
    .end local v11    # "key":Ljava/lang/String;
    :cond_4b
    return v4
.end method

.method private setBit([BI)V
    .registers 8
    .param p1, "signature"    # [B
    .param p2, "idx"    # I

    .prologue
    .line 879
    shr-int/lit8 v1, p2, 0x3

    .line 880
    .local v1, "byteIdx":I
    array-length v4, p1

    if-ge v1, v4, :cond_11

    .line 881
    and-int/lit8 v0, p2, 0x7

    .line 882
    .local v0, "bitIdx":I
    const/4 v4, 0x1

    shl-int v2, v4, v0

    .line 883
    .local v2, "mask":I
    aget-byte v3, p1, v1

    .line 884
    .local v3, "sigByte":I
    or-int v4, v3, v2

    int-to-byte v4, v4

    aput-byte v4, p1, v1

    .line 886
    .end local v0    # "bitIdx":I
    .end local v2    # "mask":I
    .end local v3    # "sigByte":I
    :cond_11
    return-void
.end method

.method private setField(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 521
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    if-eqz v2, :cond_18

    if-eqz p2, :cond_18

    .line 523
    :try_start_6
    iget-object v2, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 524
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Ljavassist/util/proxy/SecurityActions;->setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V

    .line 525
    const/4 v2, 0x0

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 526
    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljavassist/util/proxy/SecurityActions;->setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_18} :catch_19

    .line 531
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :cond_18
    return-void

    .line 528
    :catch_19
    move-exception v0

    .line 529
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static setInterfaces(Ljavassist/bytecode/ClassFile;[Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 7
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "interfaces"    # [Ljava/lang/Class;
    .param p2, "proxyClass"    # Ljava/lang/Class;

    .prologue
    .line 889
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 891
    .local v2, "setterIntf":Ljava/lang/String;
    if-eqz p1, :cond_9

    array-length v3, p1

    if-nez v3, :cond_13

    .line 892
    :cond_9
    const/4 v3, 0x1

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 901
    .local v1, "list":[Ljava/lang/String;
    :goto_f
    invoke-virtual {p0, v1}, Ljavassist/bytecode/ClassFile;->setInterfaces([Ljava/lang/String;)V

    .line 902
    return-void

    .line 894
    .end local v1    # "list":[Ljava/lang/String;
    :cond_13
    array-length v3, p1

    add-int/lit8 v3, v3, 0x1

    new-array v1, v3, [Ljava/lang/String;

    .line 895
    .restart local v1    # "list":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    array-length v3, p1

    if-ge v0, v3, :cond_27

    .line 896
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 895
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 898
    :cond_27
    array-length v3, p1

    aput-object v2, v1, v3

    goto :goto_f
.end method

.method private static setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;Ljava/lang/reflect/Method;)V
    .registers 4
    .param p0, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "orig"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1308
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 1309
    .local v0, "exceptions":[Ljava/lang/Class;
    invoke-static {p0, p1, v0}, Ljavassist/util/proxy/ProxyFactory;->setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;[Ljava/lang/Class;)V

    .line 1310
    return-void
.end method

.method private static setThrows(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;[Ljava/lang/Class;)V
    .registers 7
    .param p0, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "exceptions"    # [Ljava/lang/Class;

    .prologue
    .line 1314
    array-length v3, p2

    if-nez v3, :cond_4

    .line 1324
    :goto_3
    return-void

    .line 1317
    :cond_4
    array-length v3, p2

    new-array v2, v3, [Ljava/lang/String;

    .line 1318
    .local v2, "list":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    array-length v3, p2

    if-ge v1, v3, :cond_16

    .line 1319
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 1318
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1321
    :cond_16
    new-instance v0, Ljavassist/bytecode/ExceptionsAttribute;

    invoke-direct {v0, p1}, Ljavassist/bytecode/ExceptionsAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 1322
    .local v0, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ExceptionsAttribute;->setExceptions([Ljava/lang/String;)V

    .line 1323
    invoke-virtual {p0, v0}, Ljavassist/bytecode/MethodInfo;->setExceptionsAttribute(Ljavassist/bytecode/ExceptionsAttribute;)V

    goto :goto_3
.end method

.method private testBit([BI)Z
    .registers 10
    .param p1, "signature"    # [B
    .param p2, "idx"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 867
    shr-int/lit8 v1, p2, 0x3

    .line 868
    .local v1, "byteIdx":I
    array-length v6, p1

    if-le v1, v6, :cond_8

    .line 874
    :goto_7
    return v5

    .line 871
    :cond_8
    and-int/lit8 v0, p2, 0x7

    .line 872
    .local v0, "bitIdx":I
    shl-int v2, v4, v0

    .line 873
    .local v2, "mask":I
    aget-byte v3, p1, v1

    .line 874
    .local v3, "sigByte":I
    and-int v6, v3, v2

    if-eqz v6, :cond_14

    :goto_12
    move v5, v4

    goto :goto_7

    :cond_14
    move v4, v5

    goto :goto_12
.end method


# virtual methods
.method public create([Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "paramTypes"    # [Ljava/lang/Class;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 675
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyFactory;->createClass()Ljava/lang/Class;

    move-result-object v0

    .line 676
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 677
    .local v1, "cons":Ljava/lang/reflect/Constructor;
    invoke-virtual {v1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public create([Ljava/lang/Class;[Ljava/lang/Object;Ljavassist/util/proxy/MethodHandler;)Ljava/lang/Object;
    .registers 6
    .param p1, "paramTypes"    # [Ljava/lang/Class;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "mh"    # Ljavassist/util/proxy/MethodHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 660
    invoke-virtual {p0, p1, p2}, Ljavassist/util/proxy/ProxyFactory;->create([Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "obj":Ljava/lang/Object;
    move-object v1, v0

    .line 661
    check-cast v1, Ljavassist/util/proxy/Proxy;

    invoke-interface {v1, p3}, Ljavassist/util/proxy/Proxy;->setHandler(Ljavassist/util/proxy/MethodHandler;)V

    .line 662
    return-object v0
.end method

.method public createClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 397
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    if-nez v0, :cond_9

    .line 398
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->methodFilter:Ljavassist/util/proxy/MethodFilter;

    invoke-direct {p0, v0}, Ljavassist/util/proxy/ProxyFactory;->computeSignature(Ljavassist/util/proxy/MethodFilter;)V

    .line 400
    :cond_9
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->createClass1()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public createClass(Ljavassist/util/proxy/MethodFilter;)Ljava/lang/Class;
    .registers 3
    .param p1, "filter"    # Ljavassist/util/proxy/MethodFilter;

    .prologue
    .line 407
    invoke-direct {p0, p1}, Ljavassist/util/proxy/ProxyFactory;->computeSignature(Ljavassist/util/proxy/MethodFilter;)V

    .line 408
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->createClass1()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method createClass([B)Ljava/lang/Class;
    .registers 3
    .param p1, "signature"    # [B

    .prologue
    .line 419
    invoke-direct {p0, p1}, Ljavassist/util/proxy/ProxyFactory;->installSignature([B)V

    .line 420
    invoke-direct {p0}, Ljavassist/util/proxy/ProxyFactory;->createClass1()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method protected getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 613
    sget-object v0, Ljavassist/util/proxy/ProxyFactory;->classLoaderProvider:Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;

    invoke-interface {v0, p0}, Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;->get(Ljavassist/util/proxy/ProxyFactory;)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method protected getClassLoader0()Ljava/lang/ClassLoader;
    .registers 4

    .prologue
    .line 617
    const/4 v0, 0x0

    .line 618
    .local v0, "loader":Ljava/lang/ClassLoader;
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    if-eqz v1, :cond_34

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "java.lang.Object"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    .line 619
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 623
    :cond_19
    :goto_19
    if-nez v0, :cond_33

    .line 624
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 626
    if-nez v0, :cond_33

    .line 627
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 628
    if-nez v0, :cond_33

    .line 629
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 633
    :cond_33
    return-object v0

    .line 620
    :cond_34
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    if-eqz v1, :cond_19

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    array-length v1, v1

    if-lez v1, :cond_19

    .line 621
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_19
.end method

.method protected getDomain()Ljava/security/ProtectionDomain;
    .registers 4

    .prologue
    .line 638
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    if-eqz v1, :cond_19

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "java.lang.Object"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 639
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    .line 645
    .local v0, "clazz":Ljava/lang/Class;
    :goto_14
    invoke-virtual {v0}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v1

    return-object v1

    .line 640
    .end local v0    # "clazz":Ljava/lang/Class;
    :cond_19
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    if-eqz v1, :cond_28

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    array-length v1, v1

    if-lez v1, :cond_28

    .line 641
    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .restart local v0    # "clazz":Ljava/lang/Class;
    goto :goto_14

    .line 643
    .end local v0    # "clazz":Ljava/lang/Class;
    :cond_28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .restart local v0    # "clazz":Ljava/lang/Class;
    goto :goto_14
.end method

.method public getInterfaces()[Ljava/lang/Class;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    return-object v0
.end method

.method public getKey(Ljava/lang/Class;[Ljava/lang/Class;[BZ)Ljava/lang/String;
    .registers 11
    .param p1, "superClass"    # Ljava/lang/Class;
    .param p2, "interfaces"    # [Ljava/lang/Class;
    .param p3, "signature"    # [B
    .param p4, "useWriteReplace"    # Z

    .prologue
    .line 447
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 448
    .local v4, "sbuf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    .line 449
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 451
    :cond_e
    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    array-length v5, p2

    if-ge v2, v5, :cond_28

    .line 453
    aget-object v5, p2, v2

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 454
    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 456
    :cond_28
    const/4 v2, 0x0

    :goto_29
    array-length v5, p3

    if-ge v2, v5, :cond_45

    .line 457
    aget-byte v0, p3, v2

    .line 458
    .local v0, "b":B
    and-int/lit8 v3, v0, 0xf

    .line 459
    .local v3, "lo":I
    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v1, v5, 0xf

    .line 460
    .local v1, "hi":I
    sget-object v5, Ljavassist/util/proxy/ProxyFactory;->hexDigits:[C

    aget-char v5, v5, v3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 461
    sget-object v5, Ljavassist/util/proxy/ProxyFactory;->hexDigits:[C

    aget-char v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 456
    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    .line 463
    .end local v0    # "b":B
    .end local v1    # "hi":I
    .end local v3    # "lo":I
    :cond_45
    if-eqz p4, :cond_4c

    .line 464
    const-string v5, ":w"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 467
    :cond_4c
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getSuperclass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 366
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    return-object v0
.end method

.method public isUseCache()Z
    .registers 2

    .prologue
    .line 254
    iget-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    return v0
.end method

.method public isUseWriteReplace()Z
    .registers 2

    .prologue
    .line 278
    iget-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    return v0
.end method

.method public setFilter(Ljavassist/util/proxy/MethodFilter;)V
    .registers 3
    .param p1, "mf"    # Ljavassist/util/proxy/MethodFilter;

    .prologue
    .line 388
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory;->methodFilter:Ljavassist/util/proxy/MethodFilter;

    .line 390
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 391
    return-void
.end method

.method public setHandler(Ljavassist/util/proxy/MethodHandler;)V
    .registers 4
    .param p1, "mi"    # Ljavassist/util/proxy/MethodHandler;

    .prologue
    .line 692
    iget-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    if-eqz v0, :cond_c

    if-eqz p1, :cond_c

    .line 693
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    .line 695
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->thisClass:Ljava/lang/Class;

    .line 697
    :cond_c
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory;->handler:Ljavassist/util/proxy/MethodHandler;

    .line 700
    const-string v0, "default_interceptor"

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory;->handler:Ljavassist/util/proxy/MethodHandler;

    invoke-direct {p0, v0, v1}, Ljavassist/util/proxy/ProxyFactory;->setField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 701
    return-void
.end method

.method public setInterfaces([Ljava/lang/Class;)V
    .registers 3
    .param p1, "ifs"    # [Ljava/lang/Class;

    .prologue
    .line 372
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory;->interfaces:[Ljava/lang/Class;

    .line 374
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 375
    return-void
.end method

.method public setSuperclass(Ljava/lang/Class;)V
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 356
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory;->superClass:Ljava/lang/Class;

    .line 358
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->signature:[B

    .line 359
    return-void
.end method

.method public setUseCache(Z)V
    .registers 4
    .param p1, "useCache"    # Z

    .prologue
    .line 266
    iget-object v0, p0, Ljavassist/util/proxy/ProxyFactory;->handler:Ljavassist/util/proxy/MethodHandler;

    if-eqz v0, :cond_e

    if-eqz p1, :cond_e

    .line 267
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "caching cannot be enabled if the factory default interceptor has been set"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 269
    :cond_e
    iput-boolean p1, p0, Ljavassist/util/proxy/ProxyFactory;->factoryUseCache:Z

    .line 270
    return-void
.end method

.method public setUseWriteReplace(Z)V
    .registers 2
    .param p1, "useWriteReplace"    # Z

    .prologue
    .line 288
    iput-boolean p1, p0, Ljavassist/util/proxy/ProxyFactory;->factoryWriteReplace:Z

    .line 289
    return-void
.end method
