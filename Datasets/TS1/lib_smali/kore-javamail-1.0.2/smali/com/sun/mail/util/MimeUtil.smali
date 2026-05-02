.class public Lcom/sun/mail/util/MimeUtil;
.super Ljava/lang/Object;
.source "MimeUtil.java"


# static fields
.field private static final cleanContentType:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    .line 59
    const/4 v3, 0x0

    .line 61
    .local v3, "meth":Ljava/lang/reflect/Method;
    :try_start_1
    const-string v4, "mail.mime.contenttypehandler"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, "cth":Ljava/lang/String;
    if-eqz v2, :cond_2e

    .line 63
    invoke-static {}, Lcom/sun/mail/util/MimeUtil;->getContextClassLoader()Ljava/lang/ClassLoader;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_c} :catch_31
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_c} :catch_35
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_c} :catch_39
    .catchall {:try_start_1 .. :try_end_c} :catchall_3d

    move-result-object v0

    .line 64
    .local v0, "cl":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 65
    .local v1, "clsHandler":Ljava/lang/Class;
    if-eqz v0, :cond_15

    .line 67
    const/4 v4, 0x0

    :try_start_11
    invoke-static {v2, v4, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_14
    .catch Ljava/lang/ClassNotFoundException; {:try_start_11 .. :try_end_14} :catch_41
    .catch Ljava/lang/NoSuchMethodException; {:try_start_11 .. :try_end_14} :catch_35
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_14} :catch_39
    .catchall {:try_start_11 .. :try_end_14} :catchall_3d

    move-result-object v1

    .line 70
    :cond_15
    :goto_15
    if-nez v1, :cond_1b

    .line 71
    :try_start_17
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 72
    :cond_1b
    const-string v4, "cleanContentType"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Lkorex/mail/internet/MimePart;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_2d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_17 .. :try_end_2d} :catch_31
    .catch Ljava/lang/NoSuchMethodException; {:try_start_17 .. :try_end_2d} :catch_35
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_2d} :catch_39
    .catchall {:try_start_17 .. :try_end_2d} :catchall_3d

    move-result-object v3

    .line 82
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v1    # "clsHandler":Ljava/lang/Class;
    :cond_2e
    sput-object v3, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    .line 84
    .end local v2    # "cth":Ljava/lang/String;
    :goto_30
    return-void

    .line 75
    :catch_31
    move-exception v4

    .line 82
    sput-object v3, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    goto :goto_30

    .line 77
    :catch_35
    move-exception v4

    .line 82
    sput-object v3, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    goto :goto_30

    .line 79
    :catch_39
    move-exception v4

    .line 82
    sput-object v3, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    goto :goto_30

    :catchall_3d
    move-exception v4

    sput-object v3, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    throw v4

    .line 68
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v1    # "clsHandler":Ljava/lang/Class;
    .restart local v2    # "cth":Ljava/lang/String;
    :catch_41
    move-exception v4

    goto :goto_15
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    return-void
.end method

.method public static cleanContentType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "mp"    # Lkorex/mail/internet/MimePart;
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 95
    sget-object v1, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_17

    .line 97
    :try_start_4
    sget-object v1, Lcom/sun/mail/util/MimeUtil;->cleanContentType:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_16} :catch_18

    move-object p1, v1

    .line 103
    .end local p1    # "contentType":Ljava/lang/String;
    :cond_17
    :goto_17
    return-object p1

    .line 99
    .restart local p1    # "contentType":Ljava/lang/String;
    :catch_18
    move-exception v0

    .line 100
    .local v0, "ex":Ljava/lang/Exception;
    goto :goto_17
.end method

.method private static getContextClassLoader()Ljava/lang/ClassLoader;
    .registers 1

    .prologue
    .line 112
    new-instance v0, Lcom/sun/mail/util/MimeUtil$1;

    invoke-direct {v0}, Lcom/sun/mail/util/MimeUtil$1;-><init>()V

    .line 113
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    return-object v0
.end method
