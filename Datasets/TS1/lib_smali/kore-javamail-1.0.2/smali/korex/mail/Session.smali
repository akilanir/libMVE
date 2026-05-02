.class public final Lkorex/mail/Session;
.super Ljava/lang/Object;
.source "Session.java"


# static fields
.field private static defaultSession:Lkorex/mail/Session;


# instance fields
.field private final addressMap:Ljava/util/Properties;

.field private final authTable:Ljava/util/Hashtable;

.field private final authenticator:Lkorex/mail/Authenticator;

.field private debug:Z

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private out:Ljava/io/PrintStream;

.field private final props:Ljava/util/Properties;

.field private final providers:Ljava/util/Vector;

.field private final providersByClassName:Ljava/util/Hashtable;

.field private final providersByProtocol:Ljava/util/Hashtable;

.field private final q:Lkorex/mail/EventQueue;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 200
    const/4 v0, 0x0

    sput-object v0, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    return-void
.end method

.method private constructor <init>(Ljava/util/Properties;Lkorex/mail/Authenticator;)V
    .registers 8
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "authenticator"    # Lkorex/mail/Authenticator;

    .prologue
    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lkorex/mail/Session;->authTable:Ljava/util/Hashtable;

    .line 188
    const/4 v1, 0x0

    iput-boolean v1, p0, Lkorex/mail/Session;->debug:Z

    .line 191
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lkorex/mail/Session;->providers:Ljava/util/Vector;

    .line 192
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    .line 193
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lkorex/mail/Session;->providersByClassName:Ljava/util/Hashtable;

    .line 194
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    iput-object v1, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    .line 204
    iput-object p1, p0, Lkorex/mail/Session;->props:Ljava/util/Properties;

    .line 205
    iput-object p2, p0, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    .line 207
    const-string v1, "mail.debug"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 208
    const/4 v1, 0x1

    iput-boolean v1, p0, Lkorex/mail/Session;->debug:Z

    .line 210
    :cond_40
    invoke-direct {p0}, Lkorex/mail/Session;->initLogger()V

    .line 211
    iget-object v1, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v3, "JavaMail version {0}"

    const-string v4, "1.5.2"

    invoke-virtual {v1, v2, v3, v4}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    if-eqz p2, :cond_6a

    .line 216
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 220
    .local v0, "cl":Ljava/lang/Class;
    :goto_54
    invoke-direct {p0, v0}, Lkorex/mail/Session;->loadProviders(Ljava/lang/Class;)V

    .line 221
    invoke-direct {p0, v0}, Lkorex/mail/Session;->loadAddressMap(Ljava/lang/Class;)V

    .line 222
    new-instance v2, Lkorex/mail/EventQueue;

    const-string v1, "mail.event.executor"

    invoke-virtual {p1, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    invoke-direct {v2, v1}, Lkorex/mail/EventQueue;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lkorex/mail/Session;->q:Lkorex/mail/EventQueue;

    .line 223
    return-void

    .line 218
    .end local v0    # "cl":Ljava/lang/Class;
    :cond_6a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .restart local v0    # "cl":Ljava/lang/Class;
    goto :goto_54
.end method

.method static synthetic access$000(Lkorex/mail/Session;Ljava/io/InputStream;)V
    .registers 2
    .param p0, "x0"    # Lkorex/mail/Session;
    .param p1, "x1"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-direct {p0, p1}, Lkorex/mail/Session;->loadProvidersFromStream(Ljava/io/InputStream;)V

    return-void
.end method

.method static synthetic access$100(Lkorex/mail/Session;)Ljava/util/Properties;
    .registers 2
    .param p0, "x0"    # Lkorex/mail/Session;

    .prologue
    .line 183
    iget-object v0, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    return-object v0
.end method

.method static getContextClassLoader()Ljava/lang/ClassLoader;
    .registers 1

    .prologue
    .line 1206
    new-instance v0, Lkorex/mail/Session$3;

    invoke-direct {v0}, Lkorex/mail/Session$3;-><init>()V

    .line 1207
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public static getDefaultInstance(Ljava/util/Properties;)Lkorex/mail/Session;
    .registers 2
    .param p0, "props"    # Ljava/util/Properties;

    .prologue
    .line 361
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lkorex/mail/Session;->getDefaultInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDefaultInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;
    .registers 6
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "authenticator"    # Lkorex/mail/Authenticator;

    .prologue
    .line 317
    const-class v2, Lkorex/mail/Session;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    if-nez v1, :cond_1b

    .line 318
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 319
    .local v0, "security":Ljava/lang/SecurityManager;
    if-eqz v0, :cond_10

    .line 320
    invoke-virtual {v0}, Ljava/lang/SecurityManager;->checkSetFactory()V

    .line 321
    :cond_10
    new-instance v1, Lkorex/mail/Session;

    invoke-direct {v1, p0, p1}, Lkorex/mail/Session;-><init>(Ljava/util/Properties;Lkorex/mail/Authenticator;)V

    sput-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    .line 336
    .end local v0    # "security":Ljava/lang/SecurityManager;
    :cond_17
    sget-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_47

    monitor-exit v2

    return-object v1

    .line 324
    :cond_1b
    :try_start_1b
    sget-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    iget-object v1, v1, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    if-eq v1, p1, :cond_17

    .line 326
    sget-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    iget-object v1, v1, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    if-eqz v1, :cond_3f

    if-eqz p1, :cond_3f

    sget-object v1, Lkorex/mail/Session;->defaultSession:Lkorex/mail/Session;

    iget-object v1, v1, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    .line 328
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 329
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    if-eq v1, v3, :cond_17

    .line 333
    :cond_3f
    new-instance v1, Ljava/lang/SecurityException;

    const-string v3, "Access to default session denied"

    invoke-direct {v1, v3}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_47
    .catchall {:try_start_1b .. :try_end_47} :catchall_47

    .line 317
    :catchall_47
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getInstance(Ljava/util/Properties;)Lkorex/mail/Session;
    .registers 3
    .param p0, "props"    # Ljava/util/Properties;

    .prologue
    .line 264
    new-instance v0, Lkorex/mail/Session;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lkorex/mail/Session;-><init>(Ljava/util/Properties;Lkorex/mail/Authenticator;)V

    return-object v0
.end method

.method public static getInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;
    .registers 3
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "authenticator"    # Lkorex/mail/Authenticator;

    .prologue
    .line 247
    new-instance v0, Lkorex/mail/Session;

    invoke-direct {v0, p0, p1}, Lkorex/mail/Session;-><init>(Ljava/util/Properties;Lkorex/mail/Authenticator;)V

    return-object v0
.end method

.method private static getResourceAsStream(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1221
    :try_start_0
    new-instance v1, Lkorex/mail/Session$4;

    invoke-direct {v1, p0, p1}, Lkorex/mail/Session$4;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 1222
    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/InputStream;
    :try_end_b
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_b} :catch_c

    return-object v1

    .line 1227
    :catch_c
    move-exception v0

    .line 1228
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v1

    check-cast v1, Ljava/io/IOException;

    throw v1
.end method

.method private static getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;
    .registers 3
    .param p0, "cl"    # Ljava/lang/ClassLoader;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1233
    new-instance v0, Lkorex/mail/Session$5;

    invoke-direct {v0, p0, p1}, Lkorex/mail/Session$5;-><init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V

    .line 1234
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/net/URL;

    check-cast v0, [Ljava/net/URL;

    return-object v0
.end method

.method private getService(Lkorex/mail/Provider;Lkorex/mail/URLName;)Ljava/lang/Object;
    .registers 20
    .param p1, "provider"    # Lkorex/mail/Provider;
    .param p2, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 763
    if-nez p1, :cond_a

    .line 764
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    const-string v2, "null"

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 768
    :cond_a
    if-nez p2, :cond_1c

    .line 769
    new-instance p2, Lkorex/mail/URLName;

    .end local p2    # "url":Lkorex/mail/URLName;
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v1, p2

    invoke-direct/range {v1 .. v7}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    .restart local p2    # "url":Lkorex/mail/URLName;
    :cond_1c
    const/4 v15, 0x0

    .line 777
    .local v15, "service":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v1, v0, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    if-eqz v1, :cond_6c

    .line 778
    move-object/from16 v0, p0

    iget-object v1, v0, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    .line 783
    .local v10, "cl":Ljava/lang/ClassLoader;
    :goto_2f
    const/16 v16, 0x0

    .line 786
    .local v16, "serviceClass":Ljava/lang/Class;
    :try_start_31
    invoke-static {}, Lkorex/mail/Session;->getContextClassLoader()Ljava/lang/ClassLoader;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_75

    move-result-object v9

    .line 787
    .local v9, "ccl":Ljava/lang/ClassLoader;
    if-eqz v9, :cond_40

    .line 790
    :try_start_37
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getClassName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2, v9}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_3f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_37 .. :try_end_3f} :catch_ab
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_3f} :catch_75

    move-result-object v16

    .line 794
    :cond_40
    :goto_40
    if-nez v16, :cond_4b

    .line 796
    :try_start_42
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getClassName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2, v10}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_4a} :catch_75

    move-result-object v16

    .line 812
    .end local v9    # "ccl":Ljava/lang/ClassLoader;
    :cond_4b
    :goto_4b
    const/4 v1, 0x2

    :try_start_4c
    new-array v8, v1, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lkorex/mail/Session;

    aput-object v2, v8, v1

    const/4 v1, 0x1

    const-class v2, Lkorex/mail/URLName;

    aput-object v2, v8, v1

    .line 813
    .local v8, "c":[Ljava/lang/Class;
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v11

    .line 815
    .local v11, "cons":Ljava/lang/reflect/Constructor;
    const/4 v1, 0x2

    new-array v14, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v14, v1

    const/4 v1, 0x1

    aput-object p2, v14, v1

    .line 816
    .local v14, "o":[Ljava/lang/Object;
    invoke-virtual {v11, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_6a} :catch_95

    move-result-object v15

    .line 823
    return-object v15

    .line 780
    .end local v8    # "c":[Ljava/lang/Class;
    .end local v10    # "cl":Ljava/lang/ClassLoader;
    .end local v11    # "cons":Ljava/lang/reflect/Constructor;
    .end local v14    # "o":[Ljava/lang/Object;
    .end local v16    # "serviceClass":Ljava/lang/Class;
    :cond_6c
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    .restart local v10    # "cl":Ljava/lang/ClassLoader;
    goto :goto_2f

    .line 797
    .restart local v16    # "serviceClass":Ljava/lang/Class;
    :catch_75
    move-exception v13

    .line 802
    .local v13, "ex1":Ljava/lang/Exception;
    :try_start_76
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_7d} :catch_7f

    move-result-object v16

    goto :goto_4b

    .line 803
    :catch_7f
    move-exception v12

    .line 805
    .local v12, "ex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Exception loading provider"

    invoke-virtual {v1, v2, v3, v12}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 806
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 818
    .end local v12    # "ex":Ljava/lang/Exception;
    .end local v13    # "ex1":Ljava/lang/Exception;
    :catch_95
    move-exception v12

    .line 819
    .restart local v12    # "ex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Exception loading provider"

    invoke-virtual {v1, v2, v3, v12}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 820
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 791
    .end local v12    # "ex":Ljava/lang/Exception;
    .restart local v9    # "ccl":Ljava/lang/ClassLoader;
    :catch_ab
    move-exception v1

    goto :goto_40
.end method

.method private getStore(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Store;
    .registers 6
    .param p1, "provider"    # Lkorex/mail/Provider;
    .param p2, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 587
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lkorex/mail/Provider;->getType()Lkorex/mail/Provider$Type;

    move-result-object v1

    sget-object v2, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    if-eq v1, v2, :cond_12

    .line 588
    :cond_a
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    const-string v2, "invalid provider"

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 592
    :cond_12
    :try_start_12
    invoke-direct {p0, p1, p2}, Lkorex/mail/Session;->getService(Lkorex/mail/Provider;Lkorex/mail/URLName;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/Store;
    :try_end_18
    .catch Ljava/lang/ClassCastException; {:try_start_12 .. :try_end_18} :catch_19

    return-object v1

    .line 593
    :catch_19
    move-exception v0

    .line 594
    .local v0, "cce":Ljava/lang/ClassCastException;
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    const-string v2, "incorrect class"

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1257
    new-instance v0, Lkorex/mail/Session$6;

    invoke-direct {v0, p0}, Lkorex/mail/Session$6;-><init>(Ljava/lang/String;)V

    .line 1258
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/net/URL;

    check-cast v0, [Ljava/net/URL;

    return-object v0
.end method

.method private getTransport(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Transport;
    .registers 6
    .param p1, "provider"    # Lkorex/mail/Provider;
    .param p2, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 737
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lkorex/mail/Provider;->getType()Lkorex/mail/Provider$Type;

    move-result-object v1

    sget-object v2, Lkorex/mail/Provider$Type;->TRANSPORT:Lkorex/mail/Provider$Type;

    if-eq v1, v2, :cond_12

    .line 738
    :cond_a
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    const-string v2, "invalid provider"

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 742
    :cond_12
    :try_start_12
    invoke-direct {p0, p1, p2}, Lkorex/mail/Session;->getService(Lkorex/mail/Provider;Lkorex/mail/URLName;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/Transport;
    :try_end_18
    .catch Ljava/lang/ClassCastException; {:try_start_12 .. :try_end_18} :catch_19

    return-object v1

    .line 743
    :catch_19
    move-exception v0

    .line 744
    .local v0, "cce":Ljava/lang/ClassCastException;
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    const-string v2, "incorrect class"

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final declared-synchronized initLogger()V
    .registers 6

    .prologue
    .line 226
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "DEBUG"

    iget-boolean v3, p0, Lkorex/mail/Session;->debug:Z

    invoke-virtual {p0}, Lkorex/mail/Session;->getDebugOut()Ljava/io/PrintStream;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V

    iput-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 227
    monitor-exit p0

    return-void

    .line 226
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private loadAddressMap(Ljava/lang/Class;)V
    .registers 8
    .param p1, "cl"    # Ljava/lang/Class;

    .prologue
    .line 1040
    new-instance v0, Lkorex/mail/Session$2;

    invoke-direct {v0, p0}, Lkorex/mail/Session$2;-><init>(Lkorex/mail/Session;)V

    .line 1047
    .local v0, "loader":Lkorex/mail/StreamLoader;
    const-string v3, "/META-INF/javamail.default.address.map"

    invoke-direct {p0, v3, p1, v0}, Lkorex/mail/Session;->loadResource(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V

    .line 1050
    const-string v3, "META-INF/javamail.address.map"

    invoke-direct {p0, v3, p1, v0}, Lkorex/mail/Session;->loadAllResources(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V

    .line 1054
    :try_start_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "java.home"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "lib"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "javamail.address.map"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1057
    .local v1, "res":Ljava/lang/String;
    invoke-direct {p0, v1, v0}, Lkorex/mail/Session;->loadFile(Ljava/lang/String;Lkorex/mail/StreamLoader;)V
    :try_end_3d
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_3d} :catch_56

    .line 1062
    .end local v1    # "res":Ljava/lang/String;
    :goto_3d
    iget-object v3, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    invoke-virtual {v3}, Ljava/util/Properties;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 1063
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "failed to load address map, using defaults"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 1064
    iget-object v3, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    const-string v4, "rfc822"

    const-string v5, "smtp"

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1066
    :cond_55
    return-void

    .line 1058
    :catch_56
    move-exception v2

    .line 1059
    .local v2, "sex":Ljava/lang/SecurityException;
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v5, "can\'t get java.home"

    invoke-virtual {v3, v4, v5, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3d
.end method

.method private loadAllResources(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V
    .registers 16
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cl"    # Ljava/lang/Class;
    .param p3, "loader"    # Lkorex/mail/StreamLoader;

    .prologue
    .line 1144
    const/4 v0, 0x0

    .line 1147
    .local v0, "anyLoaded":Z
    const/4 v1, 0x0

    .line 1149
    .local v1, "cld":Ljava/lang/ClassLoader;
    :try_start_2
    invoke-static {}, Lkorex/mail/Session;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 1150
    if-nez v1, :cond_c

    .line 1151
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 1152
    :cond_c
    if-eqz v1, :cond_3f

    .line 1153
    invoke-static {v1, p1}, Lkorex/mail/Session;->getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v8

    .line 1156
    .local v8, "urls":[Ljava/net/URL;
    :goto_12
    if-eqz v8, :cond_8c

    .line 1157
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_15
    array-length v9, v8

    if-ge v4, v9, :cond_8c

    .line 1158
    aget-object v7, v8, v4

    .line 1159
    .local v7, "url":Ljava/net/URL;
    const/4 v2, 0x0

    .line 1160
    .local v2, "clis":Ljava/io/InputStream;
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "URL {0}"

    invoke-virtual {v9, v10, v11, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_24} :catch_82

    .line 1162
    :try_start_24
    invoke-static {v7}, Lkorex/mail/Session;->openStream(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v2

    .line 1163
    if-eqz v2, :cond_44

    .line 1164
    invoke-interface {p3, v2}, Lkorex/mail/StreamLoader;->load(Ljava/io/InputStream;)V

    .line 1165
    const/4 v0, 0x1

    .line 1166
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "successfully loaded resource: {0}"

    invoke-virtual {v9, v10, v11, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_37
    .catch Ljava/io/FileNotFoundException; {:try_start_24 .. :try_end_37} :catch_4e
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_37} :catch_57
    .catch Ljava/lang/SecurityException; {:try_start_24 .. :try_end_37} :catch_69
    .catchall {:try_start_24 .. :try_end_37} :catchall_7b

    .line 1182
    :goto_37
    if-eqz v2, :cond_3c

    .line 1183
    :try_start_39
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_a5
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_3c} :catch_82

    .line 1157
    :cond_3c
    :goto_3c
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 1155
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v7    # "url":Ljava/net/URL;
    .end local v8    # "urls":[Ljava/net/URL;
    :cond_3f
    :try_start_3f
    invoke-static {p1}, Lkorex/mail/Session;->getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_82

    move-result-object v8

    .restart local v8    # "urls":[Ljava/net/URL;
    goto :goto_12

    .line 1169
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v7    # "url":Ljava/net/URL;
    :cond_44
    :try_start_44
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "not loading resource: {0}"

    invoke-virtual {v9, v10, v11, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4d
    .catch Ljava/io/FileNotFoundException; {:try_start_44 .. :try_end_4d} :catch_4e
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_4d} :catch_57
    .catch Ljava/lang/SecurityException; {:try_start_44 .. :try_end_4d} :catch_69
    .catchall {:try_start_44 .. :try_end_4d} :catchall_7b

    goto :goto_37

    .line 1172
    :catch_4e
    move-exception v9

    .line 1182
    if-eqz v2, :cond_3c

    .line 1183
    :try_start_51
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_54} :catch_55
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_54} :catch_82

    goto :goto_3c

    .line 1184
    :catch_55
    move-exception v9

    goto :goto_3c

    .line 1174
    :catch_57
    move-exception v5

    .line 1175
    .local v5, "ioex":Ljava/io/IOException;
    :try_start_58
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "Exception loading resource"

    invoke-virtual {v9, v10, v11, v5}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_61
    .catchall {:try_start_58 .. :try_end_61} :catchall_7b

    .line 1182
    if-eqz v2, :cond_3c

    .line 1183
    :try_start_63
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_66} :catch_67
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_66} :catch_82

    goto :goto_3c

    .line 1184
    :catch_67
    move-exception v9

    goto :goto_3c

    .line 1177
    .end local v5    # "ioex":Ljava/io/IOException;
    :catch_69
    move-exception v6

    .line 1178
    .local v6, "sex":Ljava/lang/SecurityException;
    :try_start_6a
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "Exception loading resource"

    invoke-virtual {v9, v10, v11, v6}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_73
    .catchall {:try_start_6a .. :try_end_73} :catchall_7b

    .line 1182
    if-eqz v2, :cond_3c

    .line 1183
    :try_start_75
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_78
    .catch Ljava/io/IOException; {:try_start_75 .. :try_end_78} :catch_79
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_78} :catch_82

    goto :goto_3c

    .line 1184
    :catch_79
    move-exception v9

    goto :goto_3c

    .line 1181
    .end local v6    # "sex":Ljava/lang/SecurityException;
    :catchall_7b
    move-exception v9

    .line 1182
    if-eqz v2, :cond_81

    .line 1183
    :try_start_7e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_81} :catch_a7
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_81} :catch_82

    .line 1184
    :cond_81
    :goto_81
    :try_start_81
    throw v9
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_82} :catch_82

    .line 1188
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v7    # "url":Ljava/net/URL;
    .end local v8    # "urls":[Ljava/net/URL;
    :catch_82
    move-exception v3

    .line 1189
    .local v3, "ex":Ljava/lang/Exception;
    iget-object v9, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v11, "Exception loading resource"

    invoke-virtual {v9, v10, v11, v3}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1193
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_8c
    if-nez v0, :cond_a4

    .line 1197
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9, p2, p3}, Lkorex/mail/Session;->loadResource(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V

    .line 1199
    :cond_a4
    return-void

    .line 1184
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v7    # "url":Ljava/net/URL;
    .restart local v8    # "urls":[Ljava/net/URL;
    :catch_a5
    move-exception v9

    goto :goto_3c

    :catch_a7
    move-exception v10

    goto :goto_81
.end method

.method private loadFile(Ljava/lang/String;Lkorex/mail/StreamLoader;)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "loader"    # Lkorex/mail/StreamLoader;

    .prologue
    .line 1091
    const/4 v0, 0x0

    .line 1093
    .local v0, "clis":Ljava/io/InputStream;
    :try_start_1
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_b} :catch_21
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_b} :catch_2a
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_b} :catch_57
    .catchall {:try_start_1 .. :try_end_b} :catchall_84

    .line 1094
    .end local v0    # "clis":Ljava/io/InputStream;
    .local v1, "clis":Ljava/io/InputStream;
    :try_start_b
    invoke-interface {p2, v1}, Lkorex/mail/StreamLoader;->load(Ljava/io/InputStream;)V

    .line 1095
    iget-object v4, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v6, "successfully loaded file: {0}"

    invoke-virtual {v4, v5, v6, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_17} :catch_96
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_17} :catch_93
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_17} :catch_90
    .catchall {:try_start_b .. :try_end_17} :catchall_8d

    .line 1106
    if-eqz v1, :cond_1c

    .line 1107
    :try_start_19
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_1e

    :cond_1c
    move-object v0, v1

    .line 1110
    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    :cond_1d
    :goto_1d
    return-void

    .line 1108
    .end local v0    # "clis":Ljava/io/InputStream;
    .restart local v1    # "clis":Ljava/io/InputStream;
    :catch_1e
    move-exception v4

    move-object v0, v1

    .line 1109
    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    goto :goto_1d

    .line 1096
    :catch_21
    move-exception v4

    .line 1106
    :goto_22
    if-eqz v0, :cond_1d

    .line 1107
    :try_start_24
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_27} :catch_28

    goto :goto_1d

    .line 1108
    :catch_28
    move-exception v4

    goto :goto_1d

    .line 1098
    :catch_2a
    move-exception v2

    .line 1099
    .local v2, "e":Ljava/io/IOException;
    :goto_2b
    :try_start_2b
    iget-object v4, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 1100
    iget-object v4, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not loading file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4f
    .catchall {:try_start_2b .. :try_end_4f} :catchall_84

    .line 1106
    :cond_4f
    if-eqz v0, :cond_1d

    .line 1107
    :try_start_51
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_54} :catch_55

    goto :goto_1d

    .line 1108
    :catch_55
    move-exception v4

    goto :goto_1d

    .line 1101
    .end local v2    # "e":Ljava/io/IOException;
    :catch_57
    move-exception v3

    .line 1102
    .local v3, "sex":Ljava/lang/SecurityException;
    :goto_58
    :try_start_58
    iget-object v4, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_7c

    .line 1103
    iget-object v4, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not loading file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v3}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7c
    .catchall {:try_start_58 .. :try_end_7c} :catchall_84

    .line 1106
    :cond_7c
    if-eqz v0, :cond_1d

    .line 1107
    :try_start_7e
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_81} :catch_82

    goto :goto_1d

    .line 1108
    :catch_82
    move-exception v4

    goto :goto_1d

    .line 1105
    .end local v3    # "sex":Ljava/lang/SecurityException;
    :catchall_84
    move-exception v4

    .line 1106
    :goto_85
    if-eqz v0, :cond_8a

    .line 1107
    :try_start_87
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_8a} :catch_8b

    .line 1108
    :cond_8a
    :goto_8a
    throw v4

    :catch_8b
    move-exception v5

    goto :goto_8a

    .line 1105
    .end local v0    # "clis":Ljava/io/InputStream;
    .restart local v1    # "clis":Ljava/io/InputStream;
    :catchall_8d
    move-exception v4

    move-object v0, v1

    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    goto :goto_85

    .line 1101
    .end local v0    # "clis":Ljava/io/InputStream;
    .restart local v1    # "clis":Ljava/io/InputStream;
    :catch_90
    move-exception v3

    move-object v0, v1

    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    goto :goto_58

    .line 1098
    .end local v0    # "clis":Ljava/io/InputStream;
    .restart local v1    # "clis":Ljava/io/InputStream;
    :catch_93
    move-exception v2

    move-object v0, v1

    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    goto :goto_2b

    .line 1096
    .end local v0    # "clis":Ljava/io/InputStream;
    .restart local v1    # "clis":Ljava/io/InputStream;
    :catch_96
    move-exception v4

    move-object v0, v1

    .end local v1    # "clis":Ljava/io/InputStream;
    .restart local v0    # "clis":Ljava/io/InputStream;
    goto :goto_22
.end method

.method private loadProviders(Ljava/lang/Class;)V
    .registers 11
    .param p1, "cl"    # Ljava/lang/Class;

    .prologue
    .line 912
    new-instance v6, Lkorex/mail/Session$1;

    invoke-direct {v6, p0}, Lkorex/mail/Session$1;-><init>(Lkorex/mail/Session;)V

    .line 920
    .local v6, "loader":Lkorex/mail/StreamLoader;
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "java.home"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "lib"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "javamail.providers"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 923
    .local v7, "res":Ljava/lang/String;
    invoke-direct {p0, v7, v6}, Lkorex/mail/Session;->loadFile(Ljava/lang/String;Lkorex/mail/StreamLoader;)V
    :try_end_33
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_33} :catch_106

    .line 929
    .end local v7    # "res":Ljava/lang/String;
    :goto_33
    const-string v0, "META-INF/javamail.providers"

    invoke-direct {p0, v0, p1, v6}, Lkorex/mail/Session;->loadAllResources(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V

    .line 932
    const-string v0, "/META-INF/javamail.default.providers"

    invoke-direct {p0, v0, p1, v6}, Lkorex/mail/Session;->loadResource(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V

    .line 934
    iget-object v0, p0, Lkorex/mail/Session;->providers:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_b8

    .line 935
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "failed to load any providers, using defaults"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 937
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    const-string v2, "imap"

    const-string v3, "com.sun.mail.imap.IMAPStore"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 940
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    const-string v2, "imaps"

    const-string v3, "com.sun.mail.imap.IMAPSSLStore"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 943
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    const-string v2, "pop3"

    const-string v3, "com.sun.mail.pop3.POP3Store"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 946
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    const-string v2, "pop3s"

    const-string v3, "com.sun.mail.pop3.POP3SSLStore"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 949
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->TRANSPORT:Lkorex/mail/Provider$Type;

    const-string v2, "smtp"

    const-string v3, "com.sun.mail.smtp.SMTPTransport"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 952
    new-instance v0, Lkorex/mail/Provider;

    sget-object v1, Lkorex/mail/Provider$Type;->TRANSPORT:Lkorex/mail/Provider$Type;

    const-string v2, "smtps"

    const-string v3, "com.sun.mail.smtp.SMTPSSLTransport"

    const-string v4, "Oracle"

    const-string v5, "1.5.2"

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    .line 957
    :cond_b8
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_105

    .line 959
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "Tables of loaded providers"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 960
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Providers Listed By Class Name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Session;->providersByClassName:Ljava/util/Hashtable;

    .line 961
    invoke-virtual {v2}, Ljava/util/Hashtable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 960
    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 962
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Providers Listed By Protocol: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    .line 963
    invoke-virtual {v2}, Ljava/util/Hashtable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 962
    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 965
    :cond_105
    return-void

    .line 924
    :catch_106
    move-exception v8

    .line 925
    .local v8, "sex":Ljava/lang/SecurityException;
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v2, "can\'t get java.home"

    invoke-virtual {v0, v1, v2, v8}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33
.end method

.method private loadProvidersFromStream(Ljava/io/InputStream;)V
    .registers 18
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 969
    if-eqz p1, :cond_c2

    .line 970
    new-instance v9, Lcom/sun/mail/util/LineInputStream;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V

    .line 974
    .local v9, "lis":Lcom/sun/mail/util/LineInputStream;
    :cond_9
    :goto_9
    invoke-virtual {v9}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, "currLine":Ljava/lang/String;
    if-eqz v7, :cond_c2

    .line 976
    const-string v13, "#"

    invoke-virtual {v7, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_9

    .line 978
    const/4 v2, 0x0

    .line 979
    .local v2, "type":Lkorex/mail/Provider$Type;
    const/4 v3, 0x0

    .local v3, "protocol":Ljava/lang/String;
    const/4 v4, 0x0

    .line 980
    .local v4, "className":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "vendor":Ljava/lang/String;
    const/4 v6, 0x0

    .line 983
    .local v6, "version":Ljava/lang/String;
    new-instance v12, Ljava/util/StringTokenizer;

    const-string v13, ";"

    invoke-direct {v12, v7, v13}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 984
    .local v12, "tuples":Ljava/util/StringTokenizer;
    :cond_23
    :goto_23
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v13

    if-eqz v13, :cond_97

    .line 985
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 988
    .local v8, "currTuple":Ljava/lang/String;
    const-string v13, "="

    invoke-virtual {v8, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    .line 989
    .local v10, "sep":I
    const-string v13, "protocol="

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_46

    .line 990
    add-int/lit8 v13, v10, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_23

    .line 991
    :cond_46
    const-string v13, "type="

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6a

    .line 992
    add-int/lit8 v13, v10, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 993
    .local v11, "strType":Ljava/lang/String;
    const-string v13, "store"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5f

    .line 994
    sget-object v2, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    goto :goto_23

    .line 995
    :cond_5f
    const-string v13, "transport"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_23

    .line 996
    sget-object v2, Lkorex/mail/Provider$Type;->TRANSPORT:Lkorex/mail/Provider$Type;

    goto :goto_23

    .line 998
    .end local v11    # "strType":Ljava/lang/String;
    :cond_6a
    const-string v13, "class="

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_79

    .line 999
    add-int/lit8 v13, v10, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_23

    .line 1000
    :cond_79
    const-string v13, "vendor="

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_88

    .line 1001
    add-int/lit8 v13, v10, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_23

    .line 1002
    :cond_88
    const-string v13, "version="

    invoke-virtual {v8, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_23

    .line 1003
    add-int/lit8 v13, v10, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_23

    .line 1008
    .end local v8    # "currTuple":Ljava/lang/String;
    .end local v10    # "sep":I
    :cond_97
    if-eqz v2, :cond_a9

    if-eqz v3, :cond_a9

    if-eqz v4, :cond_a9

    .line 1009
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_a9

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v13

    if-gtz v13, :cond_b6

    .line 1011
    :cond_a9
    move-object/from16 v0, p0

    iget-object v13, v0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "Bad provider entry: {0}"

    invoke-virtual {v13, v14, v15, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_9

    .line 1015
    :cond_b6
    new-instance v1, Lkorex/mail/Provider;

    invoke-direct/range {v1 .. v6}, Lkorex/mail/Provider;-><init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    .local v1, "provider":Lkorex/mail/Provider;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->addProvider(Lkorex/mail/Provider;)V

    goto/16 :goto_9

    .line 1022
    .end local v1    # "provider":Lkorex/mail/Provider;
    .end local v2    # "type":Lkorex/mail/Provider$Type;
    .end local v3    # "protocol":Ljava/lang/String;
    .end local v4    # "className":Ljava/lang/String;
    .end local v5    # "vendor":Ljava/lang/String;
    .end local v6    # "version":Ljava/lang/String;
    .end local v7    # "currLine":Ljava/lang/String;
    .end local v9    # "lis":Lcom/sun/mail/util/LineInputStream;
    .end local v12    # "tuples":Ljava/util/StringTokenizer;
    :cond_c2
    return-void
.end method

.method private loadResource(Ljava/lang/String;Ljava/lang/Class;Lkorex/mail/StreamLoader;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cl"    # Ljava/lang/Class;
    .param p3, "loader"    # Lkorex/mail/StreamLoader;

    .prologue
    .line 1116
    const/4 v0, 0x0

    .line 1118
    .local v0, "clis":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p2, p1}, Lkorex/mail/Session;->getResourceAsStream(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 1119
    if-eqz v0, :cond_13

    .line 1120
    invoke-interface {p3, v0}, Lkorex/mail/StreamLoader;->load(Ljava/io/InputStream;)V

    .line 1121
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v5, "successfully loaded resource: {0}"

    invoke-virtual {v3, v4, v5, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_13} :catch_19
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_13} :catch_2b
    .catchall {:try_start_1 .. :try_end_13} :catchall_3d

    .line 1134
    :cond_13
    if-eqz v0, :cond_18

    .line 1135
    :try_start_15
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_44

    .line 1138
    :cond_18
    :goto_18
    return-void

    .line 1128
    :catch_19
    move-exception v1

    .line 1129
    .local v1, "e":Ljava/io/IOException;
    :try_start_1a
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v5, "Exception loading resource"

    invoke-virtual {v3, v4, v5, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_3d

    .line 1134
    if-eqz v0, :cond_18

    .line 1135
    :try_start_25
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_29

    goto :goto_18

    .line 1136
    :catch_29
    move-exception v3

    goto :goto_18

    .line 1130
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2b
    move-exception v2

    .line 1131
    .local v2, "sex":Ljava/lang/SecurityException;
    :try_start_2c
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v5, "Exception loading resource"

    invoke-virtual {v3, v4, v5, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_35
    .catchall {:try_start_2c .. :try_end_35} :catchall_3d

    .line 1134
    if-eqz v0, :cond_18

    .line 1135
    :try_start_37
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3a} :catch_3b

    goto :goto_18

    .line 1136
    :catch_3b
    move-exception v3

    goto :goto_18

    .line 1133
    .end local v2    # "sex":Ljava/lang/SecurityException;
    :catchall_3d
    move-exception v3

    .line 1134
    if-eqz v0, :cond_43

    .line 1135
    :try_start_40
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_43} :catch_46

    .line 1136
    :cond_43
    :goto_43
    throw v3

    :catch_44
    move-exception v3

    goto :goto_18

    :catch_46
    move-exception v4

    goto :goto_43
.end method

.method private static openStream(Ljava/net/URL;)Ljava/io/InputStream;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1282
    :try_start_0
    new-instance v1, Lkorex/mail/Session$7;

    invoke-direct {v1, p0}, Lkorex/mail/Session$7;-><init>(Ljava/net/URL;)V

    .line 1283
    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/InputStream;
    :try_end_b
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_b} :catch_c

    return-object v1

    .line 1288
    :catch_c
    move-exception v0

    .line 1289
    .local v0, "e":Ljava/security/PrivilegedActionException;
    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v1

    check-cast v1, Ljava/io/IOException;

    throw v1
.end method


# virtual methods
.method public declared-synchronized addProvider(Lkorex/mail/Provider;)V
    .registers 4
    .param p1, "provider"    # Lkorex/mail/Provider;

    .prologue
    .line 1031
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Session;->providers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1032
    iget-object v0, p0, Lkorex/mail/Session;->providersByClassName:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lkorex/mail/Provider;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1033
    iget-object v0, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    .line 1034
    iget-object v0, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_26

    .line 1035
    :cond_24
    monitor-exit p0

    return-void

    .line 1031
    :catchall_26
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDebug()Z
    .registers 2

    .prologue
    .line 392
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lkorex/mail/Session;->debug:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDebugOut()Ljava/io/PrintStream;
    .registers 2

    .prologue
    .line 418
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Session;->out:Ljava/io/PrintStream;

    if-nez v0, :cond_9

    .line 419
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_c

    .line 421
    :goto_7
    monitor-exit p0

    return-object v0

    :cond_9
    :try_start_9
    iget-object v0, p0, Lkorex/mail/Session;->out:Ljava/io/PrintStream;
    :try_end_b
    .catchall {:try_start_9 .. :try_end_b} :catchall_c

    goto :goto_7

    .line 418
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getEventQueue()Lkorex/mail/EventQueue;
    .registers 2

    .prologue
    .line 1294
    iget-object v0, p0, Lkorex/mail/Session;->q:Lkorex/mail/EventQueue;

    return-object v0
.end method

.method public getFolder(Lkorex/mail/URLName;)Lkorex/mail/Folder;
    .registers 4
    .param p1, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 625
    invoke-virtual {p0, p1}, Lkorex/mail/Session;->getStore(Lkorex/mail/URLName;)Lkorex/mail/Store;

    move-result-object v0

    .line 626
    .local v0, "store":Lkorex/mail/Store;
    invoke-virtual {v0}, Lkorex/mail/Store;->connect()V

    .line 627
    invoke-virtual {v0, p1}, Lkorex/mail/Store;->getFolder(Lkorex/mail/URLName;)Lkorex/mail/Folder;

    move-result-object v1

    return-object v1
.end method

.method public getPasswordAuthentication(Lkorex/mail/URLName;)Lkorex/mail/PasswordAuthentication;
    .registers 3
    .param p1, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 853
    iget-object v0, p0, Lkorex/mail/Session;->authTable:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/PasswordAuthentication;

    return-object v0
.end method

.method public getProperties()Ljava/util/Properties;
    .registers 2

    .prologue
    .line 894
    iget-object v0, p0, Lkorex/mail/Session;->props:Ljava/util/Properties;

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 905
    iget-object v0, p0, Lkorex/mail/Session;->props:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getProvider(Ljava/lang/String;)Lkorex/mail/Provider;
    .registers 8
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 454
    monitor-enter p0

    if-eqz p1, :cond_9

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_14

    .line 455
    :cond_9
    new-instance v3, Lkorex/mail/NoSuchProviderException;

    const-string v4, "Invalid protocol: null"

    invoke-direct {v3, v4}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_11

    .line 454
    :catchall_11
    move-exception v3

    monitor-exit p0

    throw v3

    .line 458
    :cond_14
    const/4 v1, 0x0

    .line 461
    .local v1, "_provider":Lkorex/mail/Provider;
    :try_start_15
    iget-object v3, p0, Lkorex/mail/Session;->props:Ljava/util/Properties;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, "_className":Ljava/lang/String;
    if-eqz v0, :cond_6a

    .line 463
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_62

    .line 464
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".class property exists and points to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 468
    :cond_62
    iget-object v3, p0, Lkorex/mail/Session;->providersByClassName:Ljava/util/Hashtable;

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "_provider":Lkorex/mail/Provider;
    check-cast v1, Lkorex/mail/Provider;
    :try_end_6a
    .catchall {:try_start_15 .. :try_end_6a} :catchall_11

    .line 471
    .restart local v1    # "_provider":Lkorex/mail/Provider;
    :cond_6a
    if-eqz v1, :cond_6f

    move-object v2, v1

    .line 484
    .end local v1    # "_provider":Lkorex/mail/Provider;
    .local v2, "_provider":Lkorex/mail/Provider;
    :goto_6d
    monitor-exit p0

    return-object v2

    .line 475
    .end local v2    # "_provider":Lkorex/mail/Provider;
    .restart local v1    # "_provider":Lkorex/mail/Provider;
    :cond_6f
    :try_start_6f
    iget-object v3, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "_provider":Lkorex/mail/Provider;
    check-cast v1, Lkorex/mail/Provider;

    .line 478
    .restart local v1    # "_provider":Lkorex/mail/Provider;
    if-nez v1, :cond_92

    .line 479
    new-instance v3, Lkorex/mail/NoSuchProviderException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No provider for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 481
    :cond_92
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_b8

    .line 482
    iget-object v3, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getProvider() returning "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lkorex/mail/Provider;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_b8
    .catchall {:try_start_6f .. :try_end_b8} :catchall_11

    :cond_b8
    move-object v2, v1

    .line 484
    .end local v1    # "_provider":Lkorex/mail/Provider;
    .restart local v2    # "_provider":Lkorex/mail/Provider;
    goto :goto_6d
.end method

.method public declared-synchronized getProviders()[Lkorex/mail/Provider;
    .registers 3

    .prologue
    .line 432
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lkorex/mail/Session;->providers:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lkorex/mail/Provider;

    .line 433
    .local v0, "_providers":[Lkorex/mail/Provider;
    iget-object v1, p0, Lkorex/mail/Session;->providers:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 434
    monitor-exit p0

    return-object v0

    .line 432
    .end local v0    # "_providers":[Lkorex/mail/Provider;
    :catchall_10
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getStore()Lkorex/mail/Store;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 519
    const-string v0, "mail.store.protocol"

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getStore(Ljava/lang/String;)Lkorex/mail/Store;

    move-result-object v0

    return-object v0
.end method

.method public getStore(Ljava/lang/String;)Lkorex/mail/Store;
    .registers 9
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 533
    new-instance v0, Lkorex/mail/URLName;

    const/4 v3, -0x1

    move-object v1, p1

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    invoke-direct/range {v0 .. v6}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getStore(Lkorex/mail/URLName;)Lkorex/mail/Store;

    move-result-object v0

    return-object v0
.end method

.method public getStore(Lkorex/mail/Provider;)Lkorex/mail/Store;
    .registers 3
    .param p1, "provider"    # Lkorex/mail/Provider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 567
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/Session;->getStore(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Store;

    move-result-object v0

    return-object v0
.end method

.method public getStore(Lkorex/mail/URLName;)Lkorex/mail/Store;
    .registers 5
    .param p1, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 552
    invoke-virtual {p1}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v1

    .line 553
    .local v1, "protocol":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lkorex/mail/Session;->getProvider(Ljava/lang/String;)Lkorex/mail/Provider;

    move-result-object v0

    .line 554
    .local v0, "p":Lkorex/mail/Provider;
    invoke-direct {p0, v0, p1}, Lkorex/mail/Session;->getStore(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Store;

    move-result-object v2

    return-object v2
.end method

.method public getTransport()Lkorex/mail/Transport;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 640
    const-string v1, "mail.transport.protocol"

    invoke-virtual {p0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 641
    .local v0, "prot":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 642
    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getTransport(Ljava/lang/String;)Lkorex/mail/Transport;

    move-result-object v1

    .line 647
    :goto_c
    return-object v1

    .line 644
    :cond_d
    iget-object v1, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    const-string v2, "rfc822"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "prot":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 645
    .restart local v0    # "prot":Ljava/lang/String;
    if-eqz v0, :cond_1e

    .line 646
    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getTransport(Ljava/lang/String;)Lkorex/mail/Transport;

    move-result-object v1

    goto :goto_c

    .line 647
    :cond_1e
    const-string v1, "smtp"

    invoke-virtual {p0, v1}, Lkorex/mail/Session;->getTransport(Ljava/lang/String;)Lkorex/mail/Transport;

    move-result-object v1

    goto :goto_c
.end method

.method public getTransport(Ljava/lang/String;)Lkorex/mail/Transport;
    .registers 9
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 662
    new-instance v0, Lkorex/mail/URLName;

    const/4 v3, -0x1

    move-object v1, p1

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    invoke-direct/range {v0 .. v6}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getTransport(Lkorex/mail/URLName;)Lkorex/mail/Transport;

    move-result-object v0

    return-object v0
.end method

.method public getTransport(Lkorex/mail/Address;)Lkorex/mail/Transport;
    .registers 6
    .param p1, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 713
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail.transport.protocol."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 714
    invoke-virtual {p1}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 715
    .local v0, "transportProtocol":Ljava/lang/String;
    if-eqz v0, :cond_22

    .line 716
    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getTransport(Ljava/lang/String;)Lkorex/mail/Transport;

    move-result-object v1

    .line 719
    :goto_21
    return-object v1

    .line 717
    :cond_22
    iget-object v1, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    invoke-virtual {p1}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "transportProtocol":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 718
    .restart local v0    # "transportProtocol":Ljava/lang/String;
    if-eqz v0, :cond_35

    .line 719
    invoke-virtual {p0, v0}, Lkorex/mail/Session;->getTransport(Ljava/lang/String;)Lkorex/mail/Transport;

    move-result-object v1

    goto :goto_21

    .line 720
    :cond_35
    new-instance v1, Lkorex/mail/NoSuchProviderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No provider for Address type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 721
    invoke-virtual {p1}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getTransport(Lkorex/mail/Provider;)Lkorex/mail/Transport;
    .registers 3
    .param p1, "provider"    # Lkorex/mail/Provider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 696
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/Session;->getTransport(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Transport;

    move-result-object v0

    return-object v0
.end method

.method public getTransport(Lkorex/mail/URLName;)Lkorex/mail/Transport;
    .registers 5
    .param p1, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 680
    invoke-virtual {p1}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v1

    .line 681
    .local v1, "protocol":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lkorex/mail/Session;->getProvider(Ljava/lang/String;)Lkorex/mail/Provider;

    move-result-object v0

    .line 682
    .local v0, "p":Lkorex/mail/Provider;
    invoke-direct {p0, v0, p1}, Lkorex/mail/Session;->getTransport(Lkorex/mail/Provider;Lkorex/mail/URLName;)Lkorex/mail/Transport;

    move-result-object v2

    return-object v2
.end method

.method public requestPasswordAuthentication(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/PasswordAuthentication;
    .registers 12
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "protocol"    # Ljava/lang/String;
    .param p4, "prompt"    # Ljava/lang/String;
    .param p5, "defaultUserName"    # Ljava/lang/String;

    .prologue
    .line 880
    iget-object v0, p0, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    if-eqz v0, :cond_10

    .line 881
    iget-object v0, p0, Lkorex/mail/Session;->authenticator:Lkorex/mail/Authenticator;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lkorex/mail/Authenticator;->requestPasswordAuthentication(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/PasswordAuthentication;

    move-result-object v0

    .line 884
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public declared-synchronized setDebug(Z)V
    .registers 6
    .param p1, "debug"    # Z

    .prologue
    .line 380
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lkorex/mail/Session;->debug:Z

    .line 381
    invoke-direct {p0}, Lkorex/mail/Session;->initLogger()V

    .line 382
    iget-object v0, p0, Lkorex/mail/Session;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v2, "setDebug: JavaMail version {0}"

    const-string v3, "1.5.2"

    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 384
    monitor-exit p0

    return-void

    .line 380
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDebugOut(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 406
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lkorex/mail/Session;->out:Ljava/io/PrintStream;

    .line 407
    invoke-direct {p0}, Lkorex/mail/Session;->initLogger()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 408
    monitor-exit p0

    return-void

    .line 406
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setPasswordAuthentication(Lkorex/mail/URLName;Lkorex/mail/PasswordAuthentication;)V
    .registers 4
    .param p1, "url"    # Lkorex/mail/URLName;
    .param p2, "pw"    # Lkorex/mail/PasswordAuthentication;

    .prologue
    .line 839
    if-nez p2, :cond_8

    .line 840
    iget-object v0, p0, Lkorex/mail/Session;->authTable:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 843
    :goto_7
    return-void

    .line 842
    :cond_8
    iget-object v0, p0, Lkorex/mail/Session;->authTable:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7
.end method

.method public declared-synchronized setProtocolForAddress(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "addresstype"    # Ljava/lang/String;
    .param p2, "protocol"    # Ljava/lang/String;

    .prologue
    .line 1081
    monitor-enter p0

    if-nez p2, :cond_a

    .line 1082
    :try_start_3
    iget-object v0, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_10

    .line 1085
    :goto_8
    monitor-exit p0

    return-void

    .line 1084
    :cond_a
    :try_start_a
    iget-object v0, p0, Lkorex/mail/Session;->addressMap:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_10

    goto :goto_8

    .line 1081
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProvider(Lkorex/mail/Provider;)V
    .registers 5
    .param p1, "provider"    # Lkorex/mail/Provider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 499
    monitor-enter p0

    if-nez p1, :cond_e

    .line 500
    :try_start_3
    new-instance v0, Lkorex/mail/NoSuchProviderException;

    const-string v1, "Can\'t set null provider"

    invoke-direct {v0, v1}, Lkorex/mail/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 499
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 502
    :cond_e
    :try_start_e
    iget-object v0, p0, Lkorex/mail/Session;->providersByProtocol:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    iget-object v0, p0, Lkorex/mail/Session;->props:Ljava/util/Properties;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lkorex/mail/Provider;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 504
    invoke-virtual {p1}, Lkorex/mail/Provider;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 503
    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3d
    .catchall {:try_start_e .. :try_end_3d} :catchall_b

    .line 505
    monitor-exit p0

    return-void
.end method
