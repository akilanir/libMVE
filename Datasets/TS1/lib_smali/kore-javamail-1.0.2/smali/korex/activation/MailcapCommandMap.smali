.class public Lkorex/activation/MailcapCommandMap;
.super Lkorex/activation/CommandMap;
.source "MailcapCommandMap.java"


# static fields
.field private static final PROG:I

.field private static defDB:Lcom/sun/activation/registries/MailcapFile;


# instance fields
.field private DB:[Lcom/sun/activation/registries/MailcapFile;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 132
    const/4 v0, 0x0

    sput-object v0, Lkorex/activation/MailcapCommandMap;->defDB:Lcom/sun/activation/registries/MailcapFile;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .prologue
    .line 140
    invoke-direct {p0}, Lkorex/activation/CommandMap;-><init>()V

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    const/4 v5, 0x5

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 142
    .local v0, "dbv":Ljava/util/List;
    const/4 v1, 0x0

    .line 143
    .local v1, "mf":Lcom/sun/activation/registries/MailcapFile;
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    const-string v5, "MailcapCommandMap: load HOME"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 147
    :try_start_13
    const-string v5, "user.home"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 149
    .local v4, "user_home":Ljava/lang/String;
    if-eqz v4, :cond_3d

    .line 150
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".mailcap"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 151
    .local v2, "path":Ljava/lang/String;
    invoke-direct {p0, v2}, Lkorex/activation/MailcapCommandMap;->loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;

    move-result-object v1

    .line 152
    if-eqz v1, :cond_3d

    .line 153
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3d
    .catch Ljava/lang/SecurityException; {:try_start_13 .. :try_end_3d} :catch_b8

    .line 157
    .end local v2    # "path":Ljava/lang/String;
    .end local v4    # "user_home":Ljava/lang/String;
    :cond_3d
    :goto_3d
    const-string v5, "MailcapCommandMap: load SYS"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 160
    :try_start_42
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "java.home"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "lib"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "mailcap"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 162
    .local v3, "system_mailcap":Ljava/lang/String;
    invoke-direct {p0, v3}, Lkorex/activation/MailcapCommandMap;->loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;

    move-result-object v1

    .line 163
    if-eqz v1, :cond_76

    .line 164
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_76
    .catch Ljava/lang/SecurityException; {:try_start_42 .. :try_end_76} :catch_b6

    .line 167
    .end local v3    # "system_mailcap":Ljava/lang/String;
    :cond_76
    :goto_76
    const-string v5, "MailcapCommandMap: load JAR"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 169
    const-string v5, "META-INF/mailcap"

    invoke-direct {p0, v0, v5}, Lkorex/activation/MailcapCommandMap;->loadAllResources(Ljava/util/List;Ljava/lang/String;)V

    .line 171
    const-string v5, "MailcapCommandMap: load DEF"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 172
    const-class v6, Lkorex/activation/MailcapCommandMap;

    monitor-enter v6

    .line 174
    :try_start_88
    sget-object v5, Lkorex/activation/MailcapCommandMap;->defDB:Lcom/sun/activation/registries/MailcapFile;

    if-nez v5, :cond_94

    .line 175
    const-string v5, "/META-INF/mailcap.default"

    invoke-direct {p0, v5}, Lkorex/activation/MailcapCommandMap;->loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;

    move-result-object v5

    sput-object v5, Lkorex/activation/MailcapCommandMap;->defDB:Lcom/sun/activation/registries/MailcapFile;

    .line 176
    :cond_94
    monitor-exit v6
    :try_end_95
    .catchall {:try_start_88 .. :try_end_95} :catchall_b3

    .line 178
    sget-object v5, Lkorex/activation/MailcapCommandMap;->defDB:Lcom/sun/activation/registries/MailcapFile;

    if-eqz v5, :cond_9e

    .line 179
    sget-object v5, Lkorex/activation/MailcapCommandMap;->defDB:Lcom/sun/activation/registries/MailcapFile;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    :cond_9e
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lcom/sun/activation/registries/MailcapFile;

    iput-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    .line 182
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    invoke-interface {v0, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/sun/activation/registries/MailcapFile;

    check-cast v5, [Lcom/sun/activation/registries/MailcapFile;

    iput-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    .line 183
    return-void

    .line 176
    :catchall_b3
    move-exception v5

    :try_start_b4
    monitor-exit v6
    :try_end_b5
    .catchall {:try_start_b4 .. :try_end_b5} :catchall_b3

    throw v5

    .line 165
    :catch_b6
    move-exception v5

    goto :goto_76

    .line 155
    :catch_b8
    move-exception v5

    goto :goto_3d
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x0

    .line 328
    invoke-direct {p0}, Lkorex/activation/MailcapCommandMap;-><init>()V

    .line 330
    const-string v0, "MailcapCommandMap: load PROG"

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 331
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v0, v0, v1

    if-nez v0, :cond_19

    .line 333
    :try_start_f
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v2, p1}, Lcom/sun/activation/registries/MailcapFile;-><init>(Ljava/io/InputStream;)V

    aput-object v2, v0, v1
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_19} :catch_1a

    .line 338
    :cond_19
    :goto_19
    return-void

    .line 334
    :catch_1a
    move-exception v0

    goto :goto_19
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 311
    invoke-direct {p0}, Lkorex/activation/MailcapCommandMap;-><init>()V

    .line 313
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MailcapCommandMap: load PROG from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 315
    :cond_20
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v0, v0, v2

    if-nez v0, :cond_2f

    .line 316
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    new-instance v1, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v1, p1}, Lcom/sun/activation/registries/MailcapFile;-><init>(Ljava/lang/String;)V

    aput-object v1, v0, v2

    .line 318
    :cond_2f
    return-void
.end method

.method private appendCmdsToList(Ljava/util/Map;Ljava/util/List;)V
    .registers 9
    .param p1, "typeHash"    # Ljava/util/Map;
    .param p2, "cmdList"    # Ljava/util/List;

    .prologue
    .line 451
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 453
    .local v4, "verb_enum":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 454
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 455
    .local v3, "verb":Ljava/lang/String;
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 456
    .local v1, "cmdList2":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 458
    .local v2, "cmd_enum":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 459
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 460
    .local v0, "cmd":Ljava/lang/String;
    new-instance v5, Lkorex/activation/CommandInfo;

    invoke-direct {v5, v3, v0}, Lkorex/activation/CommandInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 464
    .end local v0    # "cmd":Ljava/lang/String;
    .end local v1    # "cmdList2":Ljava/util/List;
    .end local v2    # "cmd_enum":Ljava/util/Iterator;
    .end local v3    # "verb":Ljava/lang/String;
    :cond_33
    return-void
.end method

.method private appendPrefCmdsToList(Ljava/util/Map;Ljava/util/List;)V
    .registers 8
    .param p1, "cmdHash"    # Ljava/util/Map;
    .param p2, "cmdList"    # Ljava/util/List;

    .prologue
    .line 385
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 387
    .local v3, "verb_enum":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 388
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 389
    .local v2, "verb":Ljava/lang/String;
    invoke-direct {p0, p2, v2}, Lkorex/activation/MailcapCommandMap;->checkForVerb(Ljava/util/List;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 390
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 391
    .local v1, "cmdList2":Ljava/util/List;
    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 392
    .local v0, "className":Ljava/lang/String;
    new-instance v4, Lkorex/activation/CommandInfo;

    invoke-direct {v4, v2, v0}, Lkorex/activation/CommandInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 395
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "cmdList2":Ljava/util/List;
    .end local v2    # "verb":Ljava/lang/String;
    :cond_30
    return-void
.end method

.method private checkForVerb(Ljava/util/List;Ljava/lang/String;)Z
    .registers 6
    .param p1, "cmdList"    # Ljava/util/List;
    .param p2, "verb"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 403
    .local v0, "ee":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 405
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkorex/activation/CommandInfo;

    invoke-virtual {v2}, Lkorex/activation/CommandInfo;->getCommandName()Ljava/lang/String;

    move-result-object v1

    .line 406
    .local v1, "enum_verb":Ljava/lang/String;
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 407
    const/4 v2, 0x1

    .line 409
    .end local v1    # "enum_verb":Ljava/lang/String;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method private getDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 583
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 584
    const-string v4, "    got content-handler"

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 585
    :cond_b
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_27

    .line 586
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "      class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 588
    :cond_27
    const/4 v1, 0x0

    .line 590
    .local v1, "cld":Ljava/lang/ClassLoader;
    :try_start_28
    invoke-static {}, Lkorex/activation/SecuritySupport;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 591
    if-nez v1, :cond_36

    .line 592
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;
    :try_end_35
    .catch Ljava/lang/IllegalAccessException; {:try_start_28 .. :try_end_35} :catch_4a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_28 .. :try_end_35} :catch_69
    .catch Ljava/lang/InstantiationException; {:try_start_28 .. :try_end_35} :catch_87

    move-result-object v1

    .line 593
    :cond_36
    const/4 v0, 0x0

    .line 595
    .local v0, "cl":Ljava/lang/Class;
    :try_start_37
    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_3a} :catch_44
    .catch Ljava/lang/IllegalAccessException; {:try_start_37 .. :try_end_3a} :catch_4a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_37 .. :try_end_3a} :catch_69
    .catch Ljava/lang/InstantiationException; {:try_start_37 .. :try_end_3a} :catch_87

    move-result-object v0

    .line 600
    :goto_3b
    if-eqz v0, :cond_67

    .line 601
    :try_start_3d
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkorex/activation/DataContentHandler;

    .line 612
    .end local v0    # "cl":Ljava/lang/Class;
    :goto_43
    return-object v4

    .line 596
    .restart local v0    # "cl":Ljava/lang/Class;
    :catch_44
    move-exception v3

    .line 598
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_48
    .catch Ljava/lang/IllegalAccessException; {:try_start_3d .. :try_end_48} :catch_4a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3d .. :try_end_48} :catch_69
    .catch Ljava/lang/InstantiationException; {:try_start_3d .. :try_end_48} :catch_87

    move-result-object v0

    goto :goto_3b

    .line 602
    .end local v0    # "cl":Ljava/lang/Class;
    .end local v3    # "ex":Ljava/lang/Exception;
    :catch_4a
    move-exception v2

    .line 603
    .local v2, "e":Ljava/lang/IllegalAccessException;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 604
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t load DCH "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 612
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :cond_67
    :goto_67
    const/4 v4, 0x0

    goto :goto_43

    .line 605
    :catch_69
    move-exception v2

    .line 606
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 607
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t load DCH "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_67

    .line 608
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_87
    move-exception v2

    .line 609
    .local v2, "e":Ljava/lang/InstantiationException;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 610
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t load DCH "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_67
.end method

.method private loadAllResources(Ljava/util/List;Ljava/lang/String;)V
    .registers 15
    .param p1, "v"    # Ljava/util/List;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 225
    .local v0, "anyLoaded":Z
    const/4 v1, 0x0

    .line 227
    .local v1, "cld":Ljava/lang/ClassLoader;
    :try_start_2
    invoke-static {}, Lkorex/activation/SecuritySupport;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 228
    if-nez v1, :cond_10

    .line 229
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 230
    :cond_10
    if-eqz v1, :cond_79

    .line 231
    invoke-static {v1, p2}, Lkorex/activation/SecuritySupport;->getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v9

    .line 234
    .local v9, "urls":[Ljava/net/URL;
    :goto_16
    if-eqz v9, :cond_109

    .line 235
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_23

    .line 236
    const-string v10, "MailcapCommandMap: getResources"

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 237
    :cond_23
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_24
    array-length v10, v9

    if-ge v4, v10, :cond_109

    .line 238
    aget-object v8, v9, v4

    .line 239
    .local v8, "url":Ljava/net/URL;
    const/4 v2, 0x0

    .line 240
    .local v2, "clis":Ljava/io/InputStream;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_46

    .line 241
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: URL "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_46} :catch_ec

    .line 243
    :cond_46
    :try_start_46
    invoke-static {v8}, Lkorex/activation/SecuritySupport;->openStream(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v2

    .line 244
    if-eqz v2, :cond_7e

    .line 245
    new-instance v10, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v10, v2}, Lcom/sun/activation/registries/MailcapFile;-><init>(Ljava/io/InputStream;)V

    invoke-interface {p1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    const/4 v0, 0x1

    .line 247
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_71

    .line 248
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: successfully loaded mailcap file from URL: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_71} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_46 .. :try_end_71} :catch_c0
    .catchall {:try_start_46 .. :try_end_71} :catchall_e5

    .line 268
    :cond_71
    :goto_71
    if-eqz v2, :cond_76

    .line 269
    :try_start_73
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_76} :catch_133
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_76} :catch_ec

    .line 237
    :cond_76
    :goto_76
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 233
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v8    # "url":Ljava/net/URL;
    .end local v9    # "urls":[Ljava/net/URL;
    :cond_79
    :try_start_79
    invoke-static {p2}, Lkorex/activation/SecuritySupport;->getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_7c} :catch_ec

    move-result-object v9

    .restart local v9    # "urls":[Ljava/net/URL;
    goto :goto_16

    .line 253
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v8    # "url":Ljava/net/URL;
    :cond_7e
    :try_start_7e
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_71

    .line 254
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: not loading mailcap file from URL: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_9a} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_7e .. :try_end_9a} :catch_c0
    .catchall {:try_start_7e .. :try_end_9a} :catchall_e5

    goto :goto_71

    .line 258
    :catch_9b
    move-exception v5

    .line 259
    .local v5, "ioex":Ljava/io/IOException;
    :try_start_9c
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_b8

    .line 260
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b8
    .catchall {:try_start_9c .. :try_end_b8} :catchall_e5

    .line 268
    :cond_b8
    if-eqz v2, :cond_76

    .line 269
    :try_start_ba
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_bd
    .catch Ljava/io/IOException; {:try_start_ba .. :try_end_bd} :catch_be
    .catch Ljava/lang/Exception; {:try_start_ba .. :try_end_bd} :catch_ec

    goto :goto_76

    .line 270
    :catch_be
    move-exception v10

    goto :goto_76

    .line 262
    .end local v5    # "ioex":Ljava/io/IOException;
    :catch_c0
    move-exception v7

    .line 263
    .local v7, "sex":Ljava/lang/SecurityException;
    :try_start_c1
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_dd

    .line 264
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v7}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_dd
    .catchall {:try_start_c1 .. :try_end_dd} :catchall_e5

    .line 268
    :cond_dd
    if-eqz v2, :cond_76

    .line 269
    :try_start_df
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_e3
    .catch Ljava/lang/Exception; {:try_start_df .. :try_end_e2} :catch_ec

    goto :goto_76

    .line 270
    :catch_e3
    move-exception v10

    goto :goto_76

    .line 267
    .end local v7    # "sex":Ljava/lang/SecurityException;
    :catchall_e5
    move-exception v10

    .line 268
    if-eqz v2, :cond_eb

    .line 269
    :try_start_e8
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e8 .. :try_end_eb} :catch_136
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_eb} :catch_ec

    .line 270
    :cond_eb
    :goto_eb
    :try_start_eb
    throw v10
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_eb .. :try_end_ec} :catch_ec

    .line 274
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v8    # "url":Ljava/net/URL;
    .end local v9    # "urls":[Ljava/net/URL;
    :catch_ec
    move-exception v3

    .line 275
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_109

    .line 276
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MailcapCommandMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v3}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 280
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_109
    if-nez v0, :cond_132

    .line 281
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_116

    .line 282
    const-string v10, "MailcapCommandMap: !anyLoaded"

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 283
    :cond_116
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lkorex/activation/MailcapCommandMap;->loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;

    move-result-object v6

    .line 284
    .local v6, "mf":Lcom/sun/activation/registries/MailcapFile;
    if-eqz v6, :cond_132

    .line 285
    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    .end local v6    # "mf":Lcom/sun/activation/registries/MailcapFile;
    :cond_132
    return-void

    .line 270
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v8    # "url":Ljava/net/URL;
    .restart local v9    # "urls":[Ljava/net/URL;
    :catch_133
    move-exception v10

    goto/16 :goto_76

    :catch_136
    move-exception v11

    goto :goto_eb
.end method

.method private loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 293
    const/4 v0, 0x0

    .line 296
    .local v0, "mtf":Lcom/sun/activation/registries/MailcapFile;
    :try_start_1
    new-instance v1, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v1, p1}, Lcom/sun/activation/registries/MailcapFile;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_8

    .end local v0    # "mtf":Lcom/sun/activation/registries/MailcapFile;
    .local v1, "mtf":Lcom/sun/activation/registries/MailcapFile;
    move-object v0, v1

    .line 300
    .end local v1    # "mtf":Lcom/sun/activation/registries/MailcapFile;
    .restart local v0    # "mtf":Lcom/sun/activation/registries/MailcapFile;
    :goto_7
    return-object v0

    .line 297
    :catch_8
    move-exception v2

    goto :goto_7
.end method

.method private loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MailcapFile;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 189
    const/4 v0, 0x0

    .line 191
    .local v0, "clis":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, p1}, Lkorex/activation/SecuritySupport;->getResourceAsStream(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 192
    if-eqz v0, :cond_32

    .line 193
    new-instance v2, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v2, v0}, Lcom/sun/activation/registries/MailcapFile;-><init>(Ljava/io/InputStream;)V

    .line 194
    .local v2, "mf":Lcom/sun/activation/registries/MailcapFile;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MailcapCommandMap: successfully loaded mailcap file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_2c} :catch_55
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_2c} :catch_7a
    .catchall {:try_start_1 .. :try_end_2c} :catchall_9f

    .line 211
    :cond_2c
    if-eqz v0, :cond_31

    .line 212
    :try_start_2e
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_a6

    .line 215
    .end local v2    # "mf":Lcom/sun/activation/registries/MailcapFile;
    :cond_31
    :goto_31
    return-object v2

    .line 199
    :cond_32
    :try_start_32
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 200
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MailcapCommandMap: not loading mailcap file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_4e} :catch_55
    .catch Ljava/lang/SecurityException; {:try_start_32 .. :try_end_4e} :catch_7a
    .catchall {:try_start_32 .. :try_end_4e} :catchall_9f

    .line 211
    :cond_4e
    if-eqz v0, :cond_53

    .line 212
    :try_start_50
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_53} :catch_a8

    .line 215
    :cond_53
    :goto_53
    const/4 v2, 0x0

    goto :goto_31

    .line 203
    :catch_55
    move-exception v1

    .line 204
    .local v1, "e":Ljava/io/IOException;
    :try_start_56
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_72

    .line 205
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MailcapCommandMap: can\'t load "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_72
    .catchall {:try_start_56 .. :try_end_72} :catchall_9f

    .line 211
    :cond_72
    if-eqz v0, :cond_53

    .line 212
    :try_start_74
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_77} :catch_78

    goto :goto_53

    .line 213
    :catch_78
    move-exception v4

    goto :goto_53

    .line 206
    .end local v1    # "e":Ljava/io/IOException;
    :catch_7a
    move-exception v3

    .line 207
    .local v3, "sex":Ljava/lang/SecurityException;
    :try_start_7b
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_97

    .line 208
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MailcapCommandMap: can\'t load "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_97
    .catchall {:try_start_7b .. :try_end_97} :catchall_9f

    .line 211
    :cond_97
    if-eqz v0, :cond_53

    .line 212
    :try_start_99
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9c} :catch_9d

    goto :goto_53

    .line 213
    :catch_9d
    move-exception v4

    goto :goto_53

    .line 210
    .end local v3    # "sex":Ljava/lang/SecurityException;
    :catchall_9f
    move-exception v4

    .line 211
    if-eqz v0, :cond_a5

    .line 212
    :try_start_a2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a5
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_a5} :catch_aa

    .line 213
    :cond_a5
    :goto_a5
    throw v4

    .restart local v2    # "mf":Lcom/sun/activation/registries/MailcapFile;
    :catch_a6
    move-exception v4

    goto :goto_31

    .end local v2    # "mf":Lcom/sun/activation/registries/MailcapFile;
    :catch_a8
    move-exception v4

    goto :goto_53

    :catch_aa
    move-exception v5

    goto :goto_a5
.end method


# virtual methods
.method public declared-synchronized addMailcap(Ljava/lang/String;)V
    .registers 5
    .param p1, "mail_cap"    # Ljava/lang/String;

    .prologue
    .line 524
    monitor-enter p0

    :try_start_1
    const-string v0, "MailcapCommandMap: add to PROG"

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 525
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-nez v0, :cond_17

    .line 526
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/activation/registries/MailcapFile;

    invoke-direct {v2}, Lcom/sun/activation/registries/MailcapFile;-><init>()V

    aput-object v2, v0, v1

    .line 528
    :cond_17
    iget-object v0, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/sun/activation/registries/MailcapFile;->appendToMailcap(Ljava/lang/String;)V
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 529
    monitor-exit p0

    return-void

    .line 524
    :catchall_21
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;
    .registers 9
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 539
    monitor-enter p0

    :try_start_1
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 540
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MailcapCommandMap: createDataContentHandler for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 542
    :cond_1d
    if-eqz p1, :cond_23

    .line 543
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 545
    :cond_23
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_24
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v2, v5, :cond_71

    .line 546
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v2

    if-nez v5, :cond_32

    .line 545
    :cond_2f
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 548
    :cond_32
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 549
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  search DB #"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 550
    :cond_4e
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v2

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 551
    .local v0, "cmdMap":Ljava/util/Map;
    if-eqz v0, :cond_2f

    .line 552
    const-string v5, "content-handler"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 553
    .local v4, "v":Ljava/util/List;
    if-eqz v4, :cond_2f

    .line 554
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 555
    .local v3, "name":Ljava/lang/String;
    invoke-direct {p0, v3}, Lkorex/activation/MailcapCommandMap;->getDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;
    :try_end_6c
    .catchall {:try_start_1 .. :try_end_6c} :catchall_c0

    move-result-object v1

    .line 556
    .local v1, "dch":Lkorex/activation/DataContentHandler;
    if-eqz v1, :cond_2f

    .line 579
    .end local v0    # "cmdMap":Ljava/util/Map;
    .end local v1    # "dch":Lkorex/activation/DataContentHandler;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "v":Ljava/util/List;
    :goto_6f
    monitor-exit p0

    return-object v1

    .line 563
    :cond_71
    const/4 v2, 0x0

    :goto_72
    :try_start_72
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v2, v5, :cond_be

    .line 564
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v2

    if-nez v5, :cond_80

    .line 563
    :cond_7d
    add-int/lit8 v2, v2, 0x1

    goto :goto_72

    .line 566
    :cond_80
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 567
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  search fallback DB #"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 568
    :cond_9c
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v2

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapFallbackList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 569
    .restart local v0    # "cmdMap":Ljava/util/Map;
    if-eqz v0, :cond_7d

    .line 570
    const-string v5, "content-handler"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 571
    .restart local v4    # "v":Ljava/util/List;
    if-eqz v4, :cond_7d

    .line 572
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 573
    .restart local v3    # "name":Ljava/lang/String;
    invoke-direct {p0, v3}, Lkorex/activation/MailcapCommandMap;->getDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;
    :try_end_ba
    .catchall {:try_start_72 .. :try_end_ba} :catchall_c0

    move-result-object v1

    .line 574
    .restart local v1    # "dch":Lkorex/activation/DataContentHandler;
    if-eqz v1, :cond_7d

    goto :goto_6f

    .line 579
    .end local v0    # "cmdMap":Ljava/util/Map;
    .end local v1    # "dch":Lkorex/activation/DataContentHandler;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "v":Ljava/util/List;
    :cond_be
    const/4 v1, 0x0

    goto :goto_6f

    .line 539
    .end local v2    # "i":I
    :catchall_c0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized getAllCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;
    .registers 8
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 420
    monitor-enter p0

    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 421
    .local v2, "cmdList":Ljava/util/List;
    if-eqz p1, :cond_c

    .line 422
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 424
    :cond_c
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v4, v5, :cond_2c

    .line 425
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    if-nez v5, :cond_1b

    .line 424
    :cond_18
    :goto_18
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 427
    :cond_1b
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 428
    .local v3, "cmdMap":Ljava/util/Map;
    if-eqz v3, :cond_18

    .line 429
    invoke-direct {p0, v3, v2}, Lkorex/activation/MailcapCommandMap;->appendCmdsToList(Ljava/util/Map;Ljava/util/List;)V
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_29

    goto :goto_18

    .line 420
    .end local v2    # "cmdList":Ljava/util/List;
    .end local v3    # "cmdMap":Ljava/util/Map;
    .end local v4    # "i":I
    :catchall_29
    move-exception v5

    monitor-exit p0

    throw v5

    .line 433
    .restart local v2    # "cmdList":Ljava/util/List;
    .restart local v4    # "i":I
    :cond_2c
    const/4 v4, 0x0

    :goto_2d
    :try_start_2d
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v4, v5, :cond_49

    .line 434
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    if-nez v5, :cond_3b

    .line 433
    :cond_38
    :goto_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    .line 436
    :cond_3b
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapFallbackList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 437
    .restart local v3    # "cmdMap":Ljava/util/Map;
    if-eqz v3, :cond_38

    .line 438
    invoke-direct {p0, v3, v2}, Lkorex/activation/MailcapCommandMap;->appendCmdsToList(Ljava/util/Map;Ljava/util/List;)V

    goto :goto_38

    .line 441
    .end local v3    # "cmdMap":Ljava/util/Map;
    :cond_49
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v1, v5, [Lkorex/activation/CommandInfo;

    .line 442
    .local v1, "cmdInfos":[Lkorex/activation/CommandInfo;
    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lkorex/activation/CommandInfo;

    move-object v0, v5

    check-cast v0, [Lkorex/activation/CommandInfo;

    move-object v1, v0
    :try_end_59
    .catchall {:try_start_2d .. :try_end_59} :catchall_29

    .line 444
    monitor-exit p0

    return-object v1
.end method

.method public declared-synchronized getCommand(Ljava/lang/String;Ljava/lang/String;)Lkorex/activation/CommandInfo;
    .registers 8
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "cmdName"    # Ljava/lang/String;

    .prologue
    .line 475
    monitor-enter p0

    if-eqz p1, :cond_7

    .line 476
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 478
    :cond_7
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v4, v4

    if-ge v2, v4, :cond_38

    .line 479
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v4, v4, v2

    if-nez v4, :cond_16

    .line 478
    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 481
    :cond_16
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v4, v4, v2

    invoke-virtual {v4, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 482
    .local v1, "cmdMap":Ljava/util/Map;
    if-eqz v1, :cond_13

    .line 484
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 485
    .local v3, "v":Ljava/util/List;
    if-eqz v3, :cond_13

    .line 486
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 488
    .local v0, "cmdClassName":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 489
    new-instance v4, Lkorex/activation/CommandInfo;

    invoke-direct {v4, p2, v0}, Lkorex/activation/CommandInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_68

    .line 510
    .end local v0    # "cmdClassName":Ljava/lang/String;
    .end local v1    # "cmdMap":Ljava/util/Map;
    .end local v3    # "v":Ljava/util/List;
    :goto_36
    monitor-exit p0

    return-object v4

    .line 495
    :cond_38
    const/4 v2, 0x0

    :goto_39
    :try_start_39
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v4, v4

    if-ge v2, v4, :cond_6b

    .line 496
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v4, v4, v2

    if-nez v4, :cond_47

    .line 495
    :cond_44
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 498
    :cond_47
    iget-object v4, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v4, v4, v2

    invoke-virtual {v4, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapFallbackList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 499
    .restart local v1    # "cmdMap":Ljava/util/Map;
    if-eqz v1, :cond_44

    .line 501
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 502
    .restart local v3    # "v":Ljava/util/List;
    if-eqz v3, :cond_44

    .line 503
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 505
    .restart local v0    # "cmdClassName":Ljava/lang/String;
    if-eqz v0, :cond_44

    .line 506
    new-instance v4, Lkorex/activation/CommandInfo;

    invoke-direct {v4, p2, v0}, Lkorex/activation/CommandInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_67
    .catchall {:try_start_39 .. :try_end_67} :catchall_68

    goto :goto_36

    .line 475
    .end local v0    # "cmdClassName":Ljava/lang/String;
    .end local v1    # "cmdMap":Ljava/util/Map;
    .end local v2    # "i":I
    .end local v3    # "v":Ljava/util/List;
    :catchall_68
    move-exception v4

    monitor-exit p0

    throw v4

    .line 510
    .restart local v2    # "i":I
    :cond_6b
    const/4 v4, 0x0

    goto :goto_36
.end method

.method public declared-synchronized getMimeTypes()[Ljava/lang/String;
    .registers 8

    .prologue
    .line 622
    monitor-enter p0

    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 624
    .local v3, "mtList":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    iget-object v6, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v6, v6

    if-ge v1, v6, :cond_33

    .line 625
    iget-object v6, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v6, v6, v1

    if-nez v6, :cond_15

    .line 624
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 627
    :cond_15
    iget-object v6, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v6, v6, v1

    invoke-virtual {v6}, Lcom/sun/activation/registries/MailcapFile;->getMimeTypes()[Ljava/lang/String;

    move-result-object v5

    .line 628
    .local v5, "ts":[Ljava/lang/String;
    if-eqz v5, :cond_12

    .line 629
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_20
    array-length v6, v5

    if-ge v2, v6, :cond_12

    .line 631
    aget-object v6, v5, v2

    invoke-interface {v3, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_30

    .line 632
    aget-object v6, v5, v2

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 629
    :cond_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 637
    .end local v2    # "j":I
    .end local v5    # "ts":[Ljava/lang/String;
    :cond_33
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v4, v6, [Ljava/lang/String;

    .line 638
    .local v4, "mts":[Ljava/lang/String;
    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    move-object v0, v6

    check-cast v0, [Ljava/lang/String;

    move-object v4, v0
    :try_end_43
    .catchall {:try_start_1 .. :try_end_43} :catchall_45

    .line 640
    monitor-exit p0

    return-object v4

    .line 622
    .end local v1    # "i":I
    .end local v3    # "mtList":Ljava/util/List;
    .end local v4    # "mts":[Ljava/lang/String;
    :catchall_45
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public declared-synchronized getNativeCommands(Ljava/lang/String;)[Ljava/lang/String;
    .registers 8
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 658
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 659
    .local v1, "cmdList":Ljava/util/List;
    if-eqz p1, :cond_c

    .line 660
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 662
    :cond_c
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v3, v5, :cond_39

    .line 663
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v3

    if-nez v5, :cond_1b

    .line 662
    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 665
    :cond_1b
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v3

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getNativeCommands(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 666
    .local v2, "cmds":[Ljava/lang/String;
    if-eqz v2, :cond_18

    .line 667
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_26
    array-length v5, v2

    if-ge v4, v5, :cond_18

    .line 669
    aget-object v5, v2, v4

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_36

    .line 670
    aget-object v5, v2, v4

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    :cond_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 675
    .end local v2    # "cmds":[Ljava/lang/String;
    .end local v4    # "j":I
    :cond_39
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/String;

    .line 676
    .restart local v2    # "cmds":[Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v0, v5

    check-cast v0, [Ljava/lang/String;

    move-object v2, v0
    :try_end_49
    .catchall {:try_start_1 .. :try_end_49} :catchall_4b

    .line 678
    monitor-exit p0

    return-object v2

    .line 658
    .end local v1    # "cmdList":Ljava/util/List;
    .end local v2    # "cmds":[Ljava/lang/String;
    .end local v3    # "i":I
    :catchall_4b
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized getPreferredCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;
    .registers 8
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 354
    monitor-enter p0

    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 355
    .local v2, "cmdList":Ljava/util/List;
    if-eqz p1, :cond_c

    .line 356
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 358
    :cond_c
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v4, v5, :cond_2c

    .line 359
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    if-nez v5, :cond_1b

    .line 358
    :cond_18
    :goto_18
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 361
    :cond_1b
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 362
    .local v3, "cmdMap":Ljava/util/Map;
    if-eqz v3, :cond_18

    .line 363
    invoke-direct {p0, v3, v2}, Lkorex/activation/MailcapCommandMap;->appendPrefCmdsToList(Ljava/util/Map;Ljava/util/List;)V
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_29

    goto :goto_18

    .line 354
    .end local v2    # "cmdList":Ljava/util/List;
    .end local v3    # "cmdMap":Ljava/util/Map;
    .end local v4    # "i":I
    :catchall_29
    move-exception v5

    monitor-exit p0

    throw v5

    .line 367
    .restart local v2    # "cmdList":Ljava/util/List;
    .restart local v4    # "i":I
    :cond_2c
    const/4 v4, 0x0

    :goto_2d
    :try_start_2d
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    array-length v5, v5

    if-ge v4, v5, :cond_49

    .line 368
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    if-nez v5, :cond_3b

    .line 367
    :cond_38
    :goto_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    .line 370
    :cond_3b
    iget-object v5, p0, Lkorex/activation/MailcapCommandMap;->DB:[Lcom/sun/activation/registries/MailcapFile;

    aget-object v5, v5, v4

    invoke-virtual {v5, p1}, Lcom/sun/activation/registries/MailcapFile;->getMailcapFallbackList(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 371
    .restart local v3    # "cmdMap":Ljava/util/Map;
    if-eqz v3, :cond_38

    .line 372
    invoke-direct {p0, v3, v2}, Lkorex/activation/MailcapCommandMap;->appendPrefCmdsToList(Ljava/util/Map;Ljava/util/List;)V

    goto :goto_38

    .line 375
    .end local v3    # "cmdMap":Ljava/util/Map;
    :cond_49
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v1, v5, [Lkorex/activation/CommandInfo;

    .line 376
    .local v1, "cmdInfos":[Lkorex/activation/CommandInfo;
    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lkorex/activation/CommandInfo;

    move-object v0, v5

    check-cast v0, [Lkorex/activation/CommandInfo;

    move-object v1, v0
    :try_end_59
    .catchall {:try_start_2d .. :try_end_59} :catchall_29

    .line 378
    monitor-exit p0

    return-object v1
.end method
