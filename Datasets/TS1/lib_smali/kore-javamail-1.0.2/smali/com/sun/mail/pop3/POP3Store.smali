.class public Lcom/sun/mail/pop3/POP3Store;
.super Lkorex/mail/Store;
.source "POP3Store.java"


# instance fields
.field volatile cacheWriteTo:Z

.field private capabilities:Ljava/util/Map;

.field private defaultPort:I

.field volatile disableTop:Z

.field volatile fileCacheDir:Ljava/io/File;

.field volatile forgetTopHeaders:Z

.field private host:Ljava/lang/String;

.field private isSSL:Z

.field volatile keepMessageContent:Z

.field private logger:Lcom/sun/mail/util/MailLogger;

.field volatile messageConstructor:Ljava/lang/reflect/Constructor;

.field private name:Ljava/lang/String;

.field private passwd:Ljava/lang/String;

.field private port:Lcom/sun/mail/pop3/Protocol;

.field private portNum:I

.field private portOwner:Lcom/sun/mail/pop3/POP3Folder;

.field private requireStartTLS:Z

.field volatile rsetBeforeQuit:Z

.field volatile supportsUidl:Z

.field volatile useFileCache:Z

.field private useStartTLS:Z

.field private user:Ljava/lang/String;

.field private usingSSL:Z


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 101
    const-string v0, "pop3"

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/pop3/POP3Store;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V
    .registers 15
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "isSSL"    # Z

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Lkorex/mail/Store;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V

    .line 73
    const-string v7, "pop3"

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->name:Ljava/lang/String;

    .line 74
    const/16 v7, 0x6e

    iput v7, p0, Lcom/sun/mail/pop3/POP3Store;->defaultPort:I

    .line 75
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->isSSL:Z

    .line 77
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 78
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    .line 79
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->host:Ljava/lang/String;

    .line 80
    const/4 v7, -0x1

    iput v7, p0, Lcom/sun/mail/pop3/POP3Store;->portNum:I

    .line 81
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->user:Ljava/lang/String;

    .line 82
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->passwd:Ljava/lang/String;

    .line 83
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->useStartTLS:Z

    .line 84
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->requireStartTLS:Z

    .line 85
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->usingSSL:Z

    .line 90
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->messageConstructor:Ljava/lang/reflect/Constructor;

    .line 91
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->rsetBeforeQuit:Z

    .line 92
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->disableTop:Z

    .line 93
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->forgetTopHeaders:Z

    .line 94
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->supportsUidl:Z

    .line 95
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->cacheWriteTo:Z

    .line 96
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->useFileCache:Z

    .line 97
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->fileCacheDir:Ljava/io/File;

    .line 98
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->keepMessageContent:Z

    .line 107
    if-eqz p2, :cond_4a

    .line 108
    invoke-virtual {p2}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object p3

    .line 109
    :cond_4a
    iput-object p3, p0, Lcom/sun/mail/pop3/POP3Store;->name:Ljava/lang/String;

    .line 110
    new-instance v7, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "DEBUG POP3"

    invoke-direct {v7, v8, v9, p1}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    .line 113
    if-nez p4, :cond_79

    .line 114
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mail."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".ssl.enable"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {p1, v7, v8}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result p4

    .line 116
    :cond_79
    if-eqz p4, :cond_15f

    .line 117
    const/16 v7, 0x3e3

    iput v7, p0, Lcom/sun/mail/pop3/POP3Store;->defaultPort:I

    .line 120
    :goto_7f
    iput-boolean p4, p0, Lcom/sun/mail/pop3/POP3Store;->isSSL:Z

    .line 122
    const-string v7, "rsetbeforequit"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->rsetBeforeQuit:Z

    .line 123
    const-string v7, "disabletop"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->disableTop:Z

    .line 124
    const-string v7, "forgettopheaders"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->forgetTopHeaders:Z

    .line 125
    const-string v7, "cachewriteto"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->cacheWriteTo:Z

    .line 126
    const-string v7, "filecache.enable"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->useFileCache:Z

    .line 127
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mail."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".filecache.dir"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "dir":Ljava/lang/String;
    if-eqz v2, :cond_f4

    iget-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v7, v8}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v7

    if-eqz v7, :cond_f4

    .line 129
    iget-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mail."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".filecache.dir: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 130
    :cond_f4
    if-eqz v2, :cond_fd

    .line 131
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->fileCacheDir:Ljava/io/File;

    .line 132
    :cond_fd
    const-string v7, "keepmessagecontent"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->keepMessageContent:Z

    .line 135
    const-string v7, "starttls.enable"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->useStartTLS:Z

    .line 138
    const-string v7, "starttls.required"

    invoke-direct {p0, v7}, Lcom/sun/mail/pop3/POP3Store;->getBoolProp(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/sun/mail/pop3/POP3Store;->requireStartTLS:Z

    .line 140
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mail."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".message.class"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 141
    .local v6, "s":Ljava/lang/String;
    if-eqz v6, :cond_15e

    .line 142
    iget-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v9, "message class: {0}"

    invoke-virtual {v7, v8, v9, v6}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    :try_start_13d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;
    :try_end_144
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_144} :catch_16b

    move-result-object v1

    .line 147
    .local v1, "cl":Ljava/lang/ClassLoader;
    const/4 v5, 0x0

    .line 152
    .local v5, "messageClass":Ljava/lang/Class;
    const/4 v7, 0x0

    :try_start_147
    invoke-static {v6, v7, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_14a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_147 .. :try_end_14a} :catch_165
    .catch Ljava/lang/Exception; {:try_start_147 .. :try_end_14a} :catch_16b

    move-result-object v5

    .line 160
    :goto_14b
    const/4 v7, 0x2

    :try_start_14c
    new-array v0, v7, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Lkorex/mail/Folder;

    aput-object v8, v0, v7

    const/4 v7, 0x1

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v0, v7

    .line 161
    .local v0, "c":[Ljava/lang/Class;
    invoke-virtual {v5, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->messageConstructor:Ljava/lang/reflect/Constructor;
    :try_end_15e
    .catch Ljava/lang/Exception; {:try_start_14c .. :try_end_15e} :catch_16b

    .line 166
    .end local v0    # "c":[Ljava/lang/Class;
    .end local v1    # "cl":Ljava/lang/ClassLoader;
    .end local v5    # "messageClass":Ljava/lang/Class;
    :cond_15e
    :goto_15e
    return-void

    .line 119
    .end local v2    # "dir":Ljava/lang/String;
    .end local v6    # "s":Ljava/lang/String;
    :cond_15f
    const/16 v7, 0x6e

    iput v7, p0, Lcom/sun/mail/pop3/POP3Store;->defaultPort:I

    goto/16 :goto_7f

    .line 153
    .restart local v1    # "cl":Ljava/lang/ClassLoader;
    .restart local v2    # "dir":Ljava/lang/String;
    .restart local v5    # "messageClass":Ljava/lang/Class;
    .restart local v6    # "s":Ljava/lang/String;
    :catch_165
    move-exception v4

    .line 157
    .local v4, "ex1":Ljava/lang/ClassNotFoundException;
    :try_start_166
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_169
    .catch Ljava/lang/Exception; {:try_start_166 .. :try_end_169} :catch_16b

    move-result-object v5

    goto :goto_14b

    .line 162
    .end local v1    # "cl":Ljava/lang/ClassLoader;
    .end local v4    # "ex1":Ljava/lang/ClassNotFoundException;
    .end local v5    # "messageClass":Ljava/lang/Class;
    :catch_16b
    move-exception v3

    .line 163
    .local v3, "ex":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v9, "failed to load message class"

    invoke-virtual {v7, v8, v9, v3}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_15e
.end method

.method private checkConnected()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 419
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z

    move-result v0

    if-nez v0, :cond_e

    .line 420
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_e
    return-void
.end method

.method private final declared-synchronized getBoolProp(Ljava/lang/String;)Z
    .registers 6
    .param p1, "prop"    # Ljava/lang/String;

    .prologue
    .line 173
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Store;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 174
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->session:Lkorex/mail/Session;

    const/4 v2, 0x0

    invoke-static {v1, p1, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v0

    .line 175
    .local v0, "val":Z
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 176
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V
    :try_end_4d
    .catchall {:try_start_1 .. :try_end_4d} :catchall_4f

    .line 177
    :cond_4d
    monitor-exit p0

    return v0

    .line 173
    .end local v0    # "val":Z
    :catchall_4f
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public capabilities()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 392
    monitor-enter p0

    .line 393
    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    .line 394
    .local v0, "c":Ljava/util/Map;
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_b

    .line 395
    if-eqz v0, :cond_e

    .line 396
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 398
    :goto_a
    return-object v1

    .line 394
    .end local v0    # "c":Ljava/util/Map;
    :catchall_b
    move-exception v1

    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw v1

    .line 398
    .restart local v0    # "c":Ljava/util/Map;
    :cond_e
    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_a
.end method

.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 346
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    if-eqz v0, :cond_a

    .line 347
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_12
    .catchall {:try_start_1 .. :try_end_a} :catchall_1d

    .line 350
    :cond_a
    const/4 v0, 0x0

    :try_start_b
    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 353
    invoke-super {p0}, Lkorex/mail/Store;->close()V
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_1a

    .line 355
    :goto_10
    monitor-exit p0

    return-void

    .line 348
    :catch_12
    move-exception v0

    .line 350
    const/4 v0, 0x0

    :try_start_14
    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 353
    invoke-super {p0}, Lkorex/mail/Store;->close()V
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_1a

    goto :goto_10

    .line 346
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0

    .line 350
    :catchall_1d
    move-exception v0

    const/4 v1, 0x0

    :try_start_1f
    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 353
    invoke-super {p0}, Lkorex/mail/Store;->close()V

    throw v0
    :try_end_25
    .catchall {:try_start_1f .. :try_end_25} :catchall_1a
.end method

.method declared-synchronized closePort(Lcom/sun/mail/pop3/POP3Folder;)V
    .registers 3
    .param p1, "owner"    # Lcom/sun/mail/pop3/POP3Folder;

    .prologue
    .line 338
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    if-ne v0, p1, :cond_b

    .line 339
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 340
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 342
    :cond_b
    monitor-exit p0

    return-void

    .line 338
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 412
    invoke-super {p0}, Lkorex/mail/Store;->finalize()V

    .line 414
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    if-eqz v0, :cond_a

    .line 415
    invoke-virtual {p0}, Lcom/sun/mail/pop3/POP3Store;->close()V

    .line 416
    :cond_a
    return-void
.end method

.method public getDefaultFolder()Lkorex/mail/Folder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 358
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Store;->checkConnected()V

    .line 359
    new-instance v0, Lcom/sun/mail/pop3/DefaultFolder;

    invoke-direct {v0, p0}, Lcom/sun/mail/pop3/DefaultFolder;-><init>(Lcom/sun/mail/pop3/POP3Store;)V

    return-object v0
.end method

.method public getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 366
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Store;->checkConnected()V

    .line 367
    new-instance v0, Lcom/sun/mail/pop3/POP3Folder;

    invoke-direct {v0, p0, p1}, Lcom/sun/mail/pop3/POP3Folder;-><init>(Lcom/sun/mail/pop3/POP3Store;Ljava/lang/String;)V

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
    .line 371
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Store;->checkConnected()V

    .line 372
    new-instance v0, Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {p1}, Lkorex/mail/URLName;->getFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/sun/mail/pop3/POP3Folder;-><init>(Lcom/sun/mail/pop3/POP3Store;Ljava/lang/String;)V

    return-object v0
.end method

.method declared-synchronized getPort(Lcom/sun/mail/pop3/POP3Folder;)Lcom/sun/mail/pop3/Protocol;
    .registers 11
    .param p1, "owner"    # Lcom/sun/mail/pop3/POP3Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 259
    monitor-enter p0

    :try_start_2
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    if-nez v1, :cond_10

    .line 260
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    .line 261
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;
    :try_end_e
    .catchall {:try_start_2 .. :try_end_e} :catchall_a2

    .line 334
    :cond_e
    :goto_e
    monitor-exit p0

    return-object v0

    .line 265
    :cond_10
    :try_start_10
    new-instance v0, Lcom/sun/mail/pop3/Protocol;

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->host:Ljava/lang/String;

    iget v2, p0, Lcom/sun/mail/pop3/POP3Store;->portNum:I

    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Store;->session:Lkorex/mail/Session;

    .line 266
    invoke-virtual {v4}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/pop3/POP3Store;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p0, Lcom/sun/mail/pop3/POP3Store;->isSSL:Z

    invoke-direct/range {v0 .. v6}, Lcom/sun/mail/pop3/Protocol;-><init>(Ljava/lang/String;ILcom/sun/mail/util/MailLogger;Ljava/util/Properties;Ljava/lang/String;Z)V

    .line 268
    .local v0, "p":Lcom/sun/mail/pop3/Protocol;
    iget-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->useStartTLS:Z

    if-nez v1, :cond_40

    iget-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->requireStartTLS:Z

    if-eqz v1, :cond_55

    .line 269
    :cond_40
    const-string v1, "STLS"

    invoke-virtual {v0, v1}, Lcom/sun/mail/pop3/Protocol;->hasCapability(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_cd

    .line 270
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->stls()Z

    move-result v1

    if-eqz v1, :cond_a5

    .line 272
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->capa()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/pop3/Protocol;->setCapabilities(Ljava/io/InputStream;)V

    .line 293
    :cond_55
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->getCapabilities()Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    .line 294
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->isSSL()Z

    move-result v1

    iput-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->usingSSL:Z

    .line 302
    iget-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->disableTop:Z

    if-nez v1, :cond_7d

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    if-eqz v1, :cond_7d

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    const-string v2, "TOP"

    .line 303
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7d

    .line 304
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->disableTop:Z

    .line 305
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "server doesn\'t support TOP, disabling it"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 308
    :cond_7d
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    if-eqz v1, :cond_8b

    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->capabilities:Ljava/util/Map;

    const-string v2, "UIDL"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f5

    :cond_8b
    move v1, v8

    :goto_8c
    iput-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->supportsUidl:Z

    .line 310
    const/4 v7, 0x0

    .line 311
    .local v7, "msg":Ljava/lang/String;
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->user:Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Store;->passwd:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/sun/mail/pop3/Protocol;->login(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_96
    .catchall {:try_start_10 .. :try_end_96} :catchall_a2

    move-result-object v7

    if-eqz v7, :cond_105

    .line 313
    :try_start_99
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9c} :catch_f7
    .catchall {:try_start_99 .. :try_end_9c} :catchall_fe

    .line 316
    :try_start_9c
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_a2
    .catchall {:try_start_9c .. :try_end_a2} :catchall_a2

    .line 259
    .end local v0    # "p":Lcom/sun/mail/pop3/Protocol;
    .end local v7    # "msg":Ljava/lang/String;
    :catchall_a2
    move-exception v1

    monitor-exit p0

    throw v1

    .line 273
    .restart local v0    # "p":Lcom/sun/mail/pop3/Protocol;
    :cond_a5
    :try_start_a5
    iget-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->requireStartTLS:Z

    if-eqz v1, :cond_55

    .line 274
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "STLS required but failed"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_b0
    .catchall {:try_start_a5 .. :try_end_b0} :catchall_a2

    .line 276
    :try_start_b0
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b3} :catch_bb
    .catchall {:try_start_b0 .. :try_end_b3} :catchall_c4

    .line 279
    :try_start_b3
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but failed"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :catch_bb
    move-exception v1

    .line 279
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but failed"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_c4
    move-exception v1

    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but failed"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 282
    :cond_cd
    iget-boolean v1, p0, Lcom/sun/mail/pop3/POP3Store;->requireStartTLS:Z

    if-eqz v1, :cond_55

    .line 283
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "STLS required but not supported"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_d8
    .catchall {:try_start_b3 .. :try_end_d8} :catchall_a2

    .line 285
    :try_start_d8
    invoke-virtual {v0}, Lcom/sun/mail/pop3/Protocol;->quit()Z
    :try_end_db
    .catch Ljava/io/IOException; {:try_start_d8 .. :try_end_db} :catch_e3
    .catchall {:try_start_d8 .. :try_end_db} :catchall_ec

    .line 288
    :try_start_db
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but not supported"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 286
    :catch_e3
    move-exception v1

    .line 288
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but not supported"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_ec
    move-exception v1

    new-instance v1, Ljava/io/EOFException;

    const-string v2, "STLS required but not supported"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 308
    :cond_f5
    const/4 v1, 0x0

    goto :goto_8c

    .line 314
    .restart local v7    # "msg":Ljava/lang/String;
    :catch_f7
    move-exception v1

    .line 316
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_fe
    move-exception v1

    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 328
    :cond_105
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    if-nez v1, :cond_10f

    if-eqz p1, :cond_10f

    .line 329
    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 330
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    .line 332
    :cond_10f
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;

    if-nez v1, :cond_e

    .line 333
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Store;->portOwner:Lcom/sun/mail/pop3/POP3Folder;
    :try_end_115
    .catchall {:try_start_db .. :try_end_115} :catchall_a2

    goto/16 :goto_e
.end method

.method declared-synchronized getSession()Lkorex/mail/Session;
    .registers 2

    .prologue
    .line 184
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Store;->session:Lkorex/mail/Session;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isConnected()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 233
    monitor-enter p0

    :try_start_2
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_30

    move-result v2

    if-nez v2, :cond_a

    .line 250
    :goto_8
    monitor-exit p0

    return v1

    .line 238
    :cond_a
    :try_start_a
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    if-nez v2, :cond_17

    .line 239
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/sun/mail/pop3/POP3Store;->getPort(Lcom/sun/mail/pop3/POP3Folder;)Lcom/sun/mail/pop3/Protocol;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    .line 242
    :cond_15
    const/4 v1, 0x1

    goto :goto_8

    .line 240
    :cond_17
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v2}, Lcom/sun/mail/pop3/Protocol;->noop()Z

    move-result v2

    if-nez v2, :cond_15

    .line 241
    new-instance v2, Ljava/io/IOException;

    const-string v3, "NOOP failed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_27} :catch_27
    .catchall {:try_start_a .. :try_end_27} :catchall_30

    .line 243
    :catch_27
    move-exception v0

    .line 246
    .local v0, "ioex":Ljava/io/IOException;
    :try_start_28
    invoke-super {p0}, Lkorex/mail/Store;->close()V
    :try_end_2b
    .catch Lkorex/mail/MessagingException; {:try_start_28 .. :try_end_2b} :catch_2c
    .catchall {:try_start_28 .. :try_end_2b} :catchall_2e

    goto :goto_8

    .line 247
    :catch_2c
    move-exception v2

    goto :goto_8

    .line 250
    :catchall_2e
    move-exception v2

    goto :goto_8

    .line 233
    .end local v0    # "ioex":Ljava/io/IOException;
    :catchall_30
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized isSSL()Z
    .registers 2

    .prologue
    .line 408
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/pop3/POP3Store;->usingSSL:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "portNum"    # I
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 191
    monitor-enter p0

    if-eqz p1, :cond_8

    if-eqz p4, :cond_8

    if-nez p3, :cond_b

    .line 192
    :cond_8
    const/4 v3, 0x0

    .line 217
    :goto_9
    monitor-exit p0

    return v3

    .line 196
    :cond_b
    if-ne p2, v6, :cond_2f

    .line 197
    :try_start_d
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Store;->session:Lkorex/mail/Session;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/pop3/POP3Store;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".port"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, -0x1

    invoke-static {v3, v4, v5}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result p2

    .line 200
    :cond_2f
    if-ne p2, v6, :cond_33

    .line 201
    iget p2, p0, Lcom/sun/mail/pop3/POP3Store;->defaultPort:I

    .line 203
    :cond_33
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Store;->host:Ljava/lang/String;

    .line 204
    iput p2, p0, Lcom/sun/mail/pop3/POP3Store;->portNum:I

    .line 205
    iput-object p3, p0, Lcom/sun/mail/pop3/POP3Store;->user:Ljava/lang/String;

    .line 206
    iput-object p4, p0, Lcom/sun/mail/pop3/POP3Store;->passwd:Ljava/lang/String;
    :try_end_3b
    .catchall {:try_start_d .. :try_end_3b} :catchall_4f

    .line 208
    const/4 v3, 0x0

    :try_start_3c
    invoke-virtual {p0, v3}, Lcom/sun/mail/pop3/POP3Store;->getPort(Lcom/sun/mail/pop3/POP3Folder;)Lcom/sun/mail/pop3/Protocol;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Store;->port:Lcom/sun/mail/pop3/Protocol;
    :try_end_42
    .catch Ljava/io/EOFException; {:try_start_3c .. :try_end_42} :catch_44
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_3c .. :try_end_42} :catch_52
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_42} :catch_59
    .catchall {:try_start_3c .. :try_end_42} :catchall_4f

    .line 217
    const/4 v3, 0x1

    goto :goto_9

    .line 209
    :catch_44
    move-exception v0

    .line 210
    .local v0, "eex":Ljava/io/EOFException;
    :try_start_45
    new-instance v3, Lkorex/mail/AuthenticationFailedException;

    invoke-virtual {v0}, Ljava/io/EOFException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4f
    .catchall {:try_start_45 .. :try_end_4f} :catchall_4f

    .line 191
    .end local v0    # "eex":Ljava/io/EOFException;
    :catchall_4f
    move-exception v3

    monitor-exit p0

    throw v3

    .line 211
    :catch_52
    move-exception v2

    .line 212
    .local v2, "scex":Lcom/sun/mail/util/SocketConnectException;
    :try_start_53
    new-instance v3, Lcom/sun/mail/util/MailConnectException;

    invoke-direct {v3, v2}, Lcom/sun/mail/util/MailConnectException;-><init>(Lcom/sun/mail/util/SocketConnectException;)V

    throw v3

    .line 213
    .end local v2    # "scex":Lcom/sun/mail/util/SocketConnectException;
    :catch_59
    move-exception v1

    .line 214
    .local v1, "ioex":Ljava/io/IOException;
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Connect failed"

    invoke-direct {v3, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_62
    .catchall {:try_start_53 .. :try_end_62} :catchall_4f
.end method
