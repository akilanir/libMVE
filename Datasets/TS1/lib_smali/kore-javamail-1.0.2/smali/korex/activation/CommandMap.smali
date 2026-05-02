.class public abstract Lkorex/activation/CommandMap;
.super Ljava/lang/Object;
.source "CommandMap.java"


# static fields
.field private static defaultCommandMap:Lkorex/activation/CommandMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const/4 v0, 0x0

    sput-object v0, Lkorex/activation/CommandMap;->defaultCommandMap:Lkorex/activation/CommandMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultCommandMap()Lkorex/activation/CommandMap;
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lkorex/activation/CommandMap;->defaultCommandMap:Lkorex/activation/CommandMap;

    if-nez v0, :cond_b

    .line 67
    new-instance v0, Lkorex/activation/MailcapCommandMap;

    invoke-direct {v0}, Lkorex/activation/MailcapCommandMap;-><init>()V

    sput-object v0, Lkorex/activation/CommandMap;->defaultCommandMap:Lkorex/activation/CommandMap;

    .line 69
    :cond_b
    sget-object v0, Lkorex/activation/CommandMap;->defaultCommandMap:Lkorex/activation/CommandMap;

    return-object v0
.end method

.method public static setDefaultCommandMap(Lkorex/activation/CommandMap;)V
    .registers 5
    .param p0, "commandMap"    # Lkorex/activation/CommandMap;

    .prologue
    .line 81
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v1

    .line 82
    .local v1, "security":Ljava/lang/SecurityManager;
    if-eqz v1, :cond_9

    .line 85
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/SecurityManager;->checkSetFactory()V
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_9} :catch_c

    .line 95
    :cond_9
    sput-object p0, Lkorex/activation/CommandMap;->defaultCommandMap:Lkorex/activation/CommandMap;

    .line 96
    return-void

    .line 86
    :catch_c
    move-exception v0

    .line 90
    .local v0, "ex":Ljava/lang/SecurityException;
    const-class v2, Lkorex/activation/CommandMap;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 91
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    if-eq v2, v3, :cond_9

    .line 92
    throw v0
.end method


# virtual methods
.method public abstract createDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;
.end method

.method public createDataContentHandler(Ljava/lang/String;Lkorex/activation/DataSource;)Lkorex/activation/DataContentHandler;
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 212
    invoke-virtual {p0, p1}, Lkorex/activation/CommandMap;->createDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;

    move-result-object v0

    return-object v0
.end method

.method public abstract getAllCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;
.end method

.method public getAllCommands(Ljava/lang/String;Lkorex/activation/DataSource;)[Lkorex/activation/CommandInfo;
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lkorex/activation/CommandMap;->getAllCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    return-object v0
.end method

.method public abstract getCommand(Ljava/lang/String;Ljava/lang/String;)Lkorex/activation/CommandInfo;
.end method

.method public getCommand(Ljava/lang/String;Ljava/lang/String;Lkorex/activation/DataSource;)Lkorex/activation/CommandInfo;
    .registers 5
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "cmdName"    # Ljava/lang/String;
    .param p3, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 180
    invoke-virtual {p0, p1, p2}, Lkorex/activation/CommandMap;->getCommand(Ljava/lang/String;Ljava/lang/String;)Lkorex/activation/CommandInfo;

    move-result-object v0

    return-object v0
.end method

.method public getMimeTypes()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 224
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getPreferredCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;
.end method

.method public getPreferredCommands(Ljava/lang/String;Lkorex/activation/DataSource;)[Lkorex/activation/CommandInfo;
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Lkorex/activation/CommandMap;->getPreferredCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    return-object v0
.end method
