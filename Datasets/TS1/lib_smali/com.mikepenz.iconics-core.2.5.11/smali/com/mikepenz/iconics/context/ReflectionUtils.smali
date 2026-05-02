.class Lcom/mikepenz/iconics/context/ReflectionUtils;
.super Ljava/lang/Object;
.source "ReflectionUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const-class v0, Lcom/mikepenz/iconics/context/ReflectionUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mikepenz/iconics/context/ReflectionUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 19
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 20
    .local v0, "f":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_8
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_8} :catch_9

    .line 24
    .end local v0    # "f":Ljava/lang/reflect/Field;
    :goto_8
    return-object v0

    .line 22
    :catch_9
    move-exception v1

    .line 24
    const/4 v0, 0x0

    goto :goto_8
.end method

.method static getMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 7
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 44
    .local v1, "methods":[Ljava/lang/reflect/Method;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v3, :cond_1c

    aget-object v0, v1, v2

    .line 45
    .local v0, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 46
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 50
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_18
    return-object v0

    .line 44
    .restart local v0    # "method":Ljava/lang/reflect/Method;
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 50
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_1c
    const/4 v0, 0x0

    goto :goto_18
.end method

.method static getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 29
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    .line 32
    :goto_4
    return-object v0

    .line 30
    :catch_5
    move-exception v0

    .line 32
    const/4 v0, 0x0

    goto :goto_4
.end method

.method static varargs invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V
    .registers 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 55
    if-nez p1, :cond_3

    .line 62
    :goto_2
    return-void

    .line 56
    :cond_3
    :try_start_3
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_6} :catch_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_6} :catch_10

    goto :goto_2

    .line 57
    :catch_7
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v1, Lcom/mikepenz/iconics/context/ReflectionUtils;->TAG:Ljava/lang/String;

    const-string v2, "Can\'t invoke method using reflection"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 59
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_10
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v1, Lcom/mikepenz/iconics/context/ReflectionUtils;->TAG:Ljava/lang/String;

    const-string v2, "Can\'t invoke method using reflection (InvocationTargetException)"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method static setValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 37
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_4

    .line 40
    :goto_3
    return-void

    .line 38
    :catch_4
    move-exception v0

    goto :goto_3
.end method
