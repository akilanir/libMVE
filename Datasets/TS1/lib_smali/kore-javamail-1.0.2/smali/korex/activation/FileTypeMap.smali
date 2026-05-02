.class public abstract Lkorex/activation/FileTypeMap;
.super Ljava/lang/Object;
.source "FileTypeMap.java"


# static fields
.field private static defaultMap:Lkorex/activation/FileTypeMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    const/4 v0, 0x0

    sput-object v0, Lkorex/activation/FileTypeMap;->defaultMap:Lkorex/activation/FileTypeMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static getDefaultFileTypeMap()Lkorex/activation/FileTypeMap;
    .registers 1

    .prologue
    .line 117
    sget-object v0, Lkorex/activation/FileTypeMap;->defaultMap:Lkorex/activation/FileTypeMap;

    if-nez v0, :cond_b

    .line 118
    new-instance v0, Lkorex/activation/MimetypesFileTypeMap;

    invoke-direct {v0}, Lkorex/activation/MimetypesFileTypeMap;-><init>()V

    sput-object v0, Lkorex/activation/FileTypeMap;->defaultMap:Lkorex/activation/FileTypeMap;

    .line 119
    :cond_b
    sget-object v0, Lkorex/activation/FileTypeMap;->defaultMap:Lkorex/activation/FileTypeMap;

    return-object v0
.end method

.method public static setDefaultFileTypeMap(Lkorex/activation/FileTypeMap;)V
    .registers 5
    .param p0, "map"    # Lkorex/activation/FileTypeMap;

    .prologue
    .line 89
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v1

    .line 90
    .local v1, "security":Ljava/lang/SecurityManager;
    if-eqz v1, :cond_9

    .line 93
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/SecurityManager;->checkSetFactory()V
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_9} :catch_c

    .line 103
    :cond_9
    sput-object p0, Lkorex/activation/FileTypeMap;->defaultMap:Lkorex/activation/FileTypeMap;

    .line 104
    return-void

    .line 94
    :catch_c
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/lang/SecurityException;
    const-class v2, Lkorex/activation/FileTypeMap;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 99
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    if-eq v2, v3, :cond_9

    .line 100
    throw v0
.end method


# virtual methods
.method public abstract getContentType(Ljava/io/File;)Ljava/lang/String;
.end method

.method public abstract getContentType(Ljava/lang/String;)Ljava/lang/String;
.end method
