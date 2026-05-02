.class Ljavassist/util/proxy/SecurityActions;
.super Ljava/lang/Object;
.source "SecurityActions.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getDeclaredConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "types"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v1

    if-nez v1, :cond_b

    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 84
    :goto_a
    return-object v1

    :cond_b
    :try_start_b
    new-instance v1, Ljavassist/util/proxy/SecurityActions$4;

    invoke-direct {v1, p0, p1}, Ljavassist/util/proxy/SecurityActions$4;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;
    :try_end_16
    .catch Ljava/security/PrivilegedActionException; {:try_start_b .. :try_end_16} :catch_17

    goto :goto_a

    .line 91
    :catch_17
    move-exception v0

    .line 92
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/NoSuchMethodException;

    if-eqz v1, :cond_27

    .line 93
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/NoSuchMethodException;

    throw v1

    .line 95
    :cond_27
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static getDeclaredConstructors(Ljava/lang/Class;)[Ljava/lang/reflect/Constructor;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 42
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    if-nez v0, :cond_b

    .line 43
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 45
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljavassist/util/proxy/SecurityActions$2;

    invoke-direct {v0, p0}, Ljavassist/util/proxy/SecurityActions$2;-><init>(Ljava/lang/Class;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/reflect/Constructor;

    check-cast v0, [Ljava/lang/reflect/Constructor;

    goto :goto_a
.end method

.method static getDeclaredMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "types"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v1

    if-nez v1, :cond_b

    .line 57
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 60
    :goto_a
    return-object v1

    :cond_b
    :try_start_b
    new-instance v1, Ljavassist/util/proxy/SecurityActions$3;

    invoke-direct {v1, p0, p1, p2}, Ljavassist/util/proxy/SecurityActions$3;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;
    :try_end_16
    .catch Ljava/security/PrivilegedActionException; {:try_start_b .. :try_end_16} :catch_17

    goto :goto_a

    .line 67
    :catch_17
    move-exception v0

    .line 68
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/NoSuchMethodException;

    if-eqz v1, :cond_27

    .line 69
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/NoSuchMethodException;

    throw v1

    .line 71
    :cond_27
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 29
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    if-nez v0, :cond_b

    .line 30
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 32
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljavassist/util/proxy/SecurityActions$1;

    invoke-direct {v0, p0}, Ljavassist/util/proxy/SecurityActions$1;-><init>(Ljava/lang/Class;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/reflect/Method;

    check-cast v0, [Ljava/lang/reflect/Method;

    goto :goto_a
.end method

.method static set(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .param p0, "fld"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v1

    if-nez v1, :cond_a

    .line 118
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    :goto_9
    return-void

    .line 121
    :cond_a
    :try_start_a
    new-instance v1, Ljavassist/util/proxy/SecurityActions$6;

    invoke-direct {v1, p0, p1, p2}, Ljavassist/util/proxy/SecurityActions$6;-><init>(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/security/PrivilegedActionException; {:try_start_a .. :try_end_12} :catch_13

    goto :goto_9

    .line 128
    :catch_13
    move-exception v0

    .line 129
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/NoSuchMethodException;

    if-eqz v1, :cond_23

    .line 130
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/IllegalAccessException;

    throw v1

    .line 132
    :cond_23
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V
    .registers 3
    .param p0, "ao"    # Ljava/lang/reflect/AccessibleObject;
    .param p1, "accessible"    # Z

    .prologue
    .line 102
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    if-nez v0, :cond_a

    .line 103
    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 112
    :goto_9
    return-void

    .line 105
    :cond_a
    new-instance v0, Ljavassist/util/proxy/SecurityActions$5;

    invoke-direct {v0, p0, p1}, Ljavassist/util/proxy/SecurityActions$5;-><init>(Ljava/lang/reflect/AccessibleObject;Z)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    goto :goto_9
.end method
