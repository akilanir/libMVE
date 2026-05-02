.class public Lkorex/activation/DataHandler;
.super Ljava/lang/Object;
.source "DataHandler.java"

# interfaces
.implements Lkore/awt/datatransfer/Transferable;


# static fields
.field private static final emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

.field private static factory:Lkorex/activation/DataContentHandlerFactory;


# instance fields
.field private currentCommandMap:Lkorex/activation/CommandMap;

.field private dataContentHandler:Lkorex/activation/DataContentHandler;

.field private dataSource:Lkorex/activation/DataSource;

.field private factoryDCH:Lkorex/activation/DataContentHandler;

.field private objDataSource:Lkorex/activation/DataSource;

.field private object:Ljava/lang/Object;

.field private objectMimeType:Ljava/lang/String;

.field private oldFactory:Lkorex/activation/DataContentHandlerFactory;

.field private shortType:Ljava/lang/String;

.field private transferFlavors:[Lkore/awt/datatransfer/DataFlavor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 93
    const/4 v0, 0x0

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    sput-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 101
    const/4 v0, 0x0

    sput-object v0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 81
    iput-object v1, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    .line 86
    iput-object v1, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    .line 87
    iput-object v1, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;

    .line 94
    sget-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 97
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 98
    iput-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    .line 102
    iput-object v1, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 104
    iput-object v1, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;

    .line 129
    iput-object p1, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    .line 130
    iput-object p2, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    .line 131
    sget-object v0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iput-object v0, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 132
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    const/4 v1, 0x0

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 81
    iput-object v1, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    .line 86
    iput-object v1, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    .line 87
    iput-object v1, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;

    .line 94
    sget-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 97
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 98
    iput-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    .line 102
    iput-object v1, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 104
    iput-object v1, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;

    .line 142
    new-instance v0, Lkorex/activation/URLDataSource;

    invoke-direct {v0, p1}, Lkorex/activation/URLDataSource;-><init>(Ljava/net/URL;)V

    iput-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 143
    sget-object v0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iput-object v0, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 144
    return-void
.end method

.method public constructor <init>(Lkorex/activation/DataSource;)V
    .registers 4
    .param p1, "ds"    # Lkorex/activation/DataSource;

    .prologue
    const/4 v1, 0x0

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 81
    iput-object v1, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    .line 86
    iput-object v1, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    .line 87
    iput-object v1, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;

    .line 94
    sget-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 97
    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 98
    iput-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    .line 102
    iput-object v1, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 104
    iput-object v1, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;

    .line 115
    iput-object p1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 116
    sget-object v0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iput-object v0, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 117
    return-void
.end method

.method static synthetic access$000(Lkorex/activation/DataHandler;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lkorex/activation/DataHandler;

    .prologue
    .line 76
    iget-object v0, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lkorex/activation/DataHandler;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lkorex/activation/DataHandler;

    .prologue
    .line 76
    iget-object v0, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    return-object v0
.end method

.method private declared-synchronized getBaseType()Ljava/lang/String;
    .registers 5

    .prologue
    .line 635
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;

    if-nez v3, :cond_14

    .line 636
    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getContentType()Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_1c

    move-result-object v0

    .line 638
    .local v0, "ct":Ljava/lang/String;
    :try_start_9
    new-instance v2, Lkorex/activation/MimeType;

    invoke-direct {v2, v0}, Lkorex/activation/MimeType;-><init>(Ljava/lang/String;)V

    .line 639
    .local v2, "mt":Lkorex/activation/MimeType;
    invoke-virtual {v2}, Lkorex/activation/MimeType;->getBaseType()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;
    :try_end_14
    .catch Lkorex/activation/MimeTypeParseException; {:try_start_9 .. :try_end_14} :catch_18
    .catchall {:try_start_9 .. :try_end_14} :catchall_1c

    .line 644
    .end local v0    # "ct":Ljava/lang/String;
    .end local v2    # "mt":Lkorex/activation/MimeType;
    :cond_14
    :goto_14
    :try_start_14
    iget-object v3, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;
    :try_end_16
    .catchall {:try_start_14 .. :try_end_16} :catchall_1c

    monitor-exit p0

    return-object v3

    .line 640
    .restart local v0    # "ct":Ljava/lang/String;
    :catch_18
    move-exception v1

    .line 641
    .local v1, "e":Lkorex/activation/MimeTypeParseException;
    :try_start_19
    iput-object v0, p0, Lkorex/activation/DataHandler;->shortType:Ljava/lang/String;
    :try_end_1b
    .catchall {:try_start_19 .. :try_end_1b} :catchall_1c

    goto :goto_14

    .line 635
    .end local v0    # "ct":Ljava/lang/String;
    .end local v1    # "e":Lkorex/activation/MimeTypeParseException;
    :catchall_1c
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method private declared-synchronized getCommandMap()Lkorex/activation/CommandMap;
    .registers 3

    .prologue
    .line 150
    monitor-enter p0

    :try_start_1
    invoke-static {}, Lkorex/activation/CommandMap;->getDefaultCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    .line 151
    .local v0, "defaultCommandMap":Lkorex/activation/CommandMap;
    iget-object v1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;

    if-eqz v1, :cond_d

    .line 152
    iget-object v1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_12

    .line 154
    :goto_b
    monitor-exit p0

    return-object v1

    :cond_d
    :try_start_d
    invoke-static {}, Lkorex/activation/CommandMap;->getDefaultCommandMap()Lkorex/activation/CommandMap;
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_12

    move-result-object v1

    goto :goto_b

    .line 150
    .end local v0    # "defaultCommandMap":Lkorex/activation/CommandMap;
    :catchall_12
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized getDataContentHandler()Lkorex/activation/DataContentHandler;
    .registers 6

    .prologue
    .line 589
    monitor-enter p0

    :try_start_1
    sget-object v1, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iget-object v2, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    if-eq v1, v2, :cond_15

    .line 590
    sget-object v1, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iput-object v1, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    .line 591
    const/4 v1, 0x0

    iput-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    .line 592
    const/4 v1, 0x0

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 593
    sget-object v1, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v1, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 596
    :cond_15
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    if-eqz v1, :cond_1d

    .line 597
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_6a

    .line 627
    :goto_1b
    monitor-exit p0

    return-object v1

    .line 599
    :cond_1d
    :try_start_1d
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v0

    .line 601
    .local v0, "simpleMT":Ljava/lang/String;
    iget-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    if-nez v1, :cond_31

    sget-object v1, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    if-eqz v1, :cond_31

    .line 602
    sget-object v1, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    invoke-interface {v1, v0}, Lkorex/activation/DataContentHandlerFactory;->createDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;

    move-result-object v1

    iput-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    .line 604
    :cond_31
    iget-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    if-eqz v1, :cond_39

    .line 605
    iget-object v1, p0, Lkorex/activation/DataHandler;->factoryDCH:Lkorex/activation/DataContentHandler;

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 607
    :cond_39
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    if-nez v1, :cond_4d

    .line 608
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v1, :cond_5f

    .line 609
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    .line 610
    invoke-virtual {v1, v0, v2}, Lkorex/activation/CommandMap;->createDataContentHandler(Ljava/lang/String;Lkorex/activation/DataSource;)Lkorex/activation/DataContentHandler;

    move-result-object v1

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 618
    :cond_4d
    :goto_4d
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v1, :cond_6d

    .line 619
    new-instance v1, Lkorex/activation/DataSourceDataContentHandler;

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    iget-object v3, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-direct {v1, v2, v3}, Lkorex/activation/DataSourceDataContentHandler;-><init>(Lkorex/activation/DataContentHandler;Lkorex/activation/DataSource;)V

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 627
    :goto_5c
    iget-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    goto :goto_1b

    .line 612
    :cond_5f
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v1

    .line 613
    invoke-virtual {v1, v0}, Lkorex/activation/CommandMap;->createDataContentHandler(Ljava/lang/String;)Lkorex/activation/DataContentHandler;

    move-result-object v1

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;
    :try_end_69
    .catchall {:try_start_1d .. :try_end_69} :catchall_6a

    goto :goto_4d

    .line 589
    .end local v0    # "simpleMT":Ljava/lang/String;
    :catchall_6a
    move-exception v1

    monitor-exit p0

    throw v1

    .line 623
    .restart local v0    # "simpleMT":Ljava/lang/String;
    :cond_6d
    :try_start_6d
    new-instance v1, Lkorex/activation/ObjectDataContentHandler;

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    iget-object v3, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    iget-object v4, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lkorex/activation/ObjectDataContentHandler;-><init>(Lkorex/activation/DataContentHandler;Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v1, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;
    :try_end_7a
    .catchall {:try_start_6d .. :try_end_7a} :catchall_6a

    goto :goto_5c
.end method

.method public static declared-synchronized setDataContentHandlerFactory(Lkorex/activation/DataContentHandlerFactory;)V
    .registers 6
    .param p0, "newFactory"    # Lkorex/activation/DataContentHandlerFactory;

    .prologue
    .line 662
    const-class v3, Lkorex/activation/DataHandler;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    if-eqz v2, :cond_12

    .line 663
    new-instance v2, Ljava/lang/Error;

    const-string v4, "DataContentHandlerFactory already defined"

    invoke-direct {v2, v4}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_f

    .line 662
    :catchall_f
    move-exception v2

    monitor-exit v3

    throw v2

    .line 665
    :cond_12
    :try_start_12
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;
    :try_end_15
    .catchall {:try_start_12 .. :try_end_15} :catchall_f

    move-result-object v1

    .line 666
    .local v1, "security":Ljava/lang/SecurityManager;
    if-eqz v1, :cond_1b

    .line 669
    :try_start_18
    invoke-virtual {v1}, Ljava/lang/SecurityManager;->checkSetFactory()V
    :try_end_1b
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_1b} :catch_1f
    .catchall {:try_start_18 .. :try_end_1b} :catchall_f

    .line 679
    :cond_1b
    :try_start_1b
    sput-object p0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;
    :try_end_1d
    .catchall {:try_start_1b .. :try_end_1d} :catchall_f

    .line 680
    monitor-exit v3

    return-void

    .line 670
    :catch_1f
    move-exception v0

    .line 674
    .local v0, "ex":Ljava/lang/SecurityException;
    :try_start_20
    const-class v2, Lkorex/activation/DataHandler;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 675
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    if-eq v2, v4, :cond_1b

    .line 676
    throw v0
    :try_end_31
    .catchall {:try_start_20 .. :try_end_31} :catchall_f
.end method


# virtual methods
.method public getAllCommands()[Lkorex/activation/CommandInfo;
    .registers 4

    .prologue
    .line 490
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_13

    .line 491
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-virtual {v0, v1, v2}, Lkorex/activation/CommandMap;->getAllCommands(Ljava/lang/String;Lkorex/activation/DataSource;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    .line 493
    :goto_12
    return-object v0

    :cond_13
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/activation/CommandMap;->getAllCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    goto :goto_12
.end method

.method public getBean(Lkorex/activation/CommandInfo;)Ljava/lang/Object;
    .registers 5
    .param p1, "cmdinfo"    # Lkorex/activation/CommandInfo;

    .prologue
    .line 553
    const/4 v0, 0x0

    .line 557
    .local v0, "bean":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 559
    .local v1, "cld":Ljava/lang/ClassLoader;
    :try_start_2
    invoke-static {}, Lkorex/activation/SecuritySupport;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 560
    if-nez v1, :cond_10

    .line 561
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 562
    :cond_10
    invoke-virtual {p1, p0, v1}, Lkorex/activation/CommandInfo;->getCommandObject(Lkorex/activation/DataHandler;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_13} :catch_17
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_13} :catch_15

    move-result-object v0

    .line 566
    .end local v0    # "bean":Ljava/lang/Object;
    :goto_14
    return-object v0

    .line 564
    .restart local v0    # "bean":Ljava/lang/Object;
    :catch_15
    move-exception v2

    goto :goto_14

    .line 563
    :catch_17
    move-exception v2

    goto :goto_14
.end method

.method public getCommand(Ljava/lang/String;)Lkorex/activation/CommandInfo;
    .registers 5
    .param p1, "cmdName"    # Ljava/lang/String;

    .prologue
    .line 509
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_13

    .line 510
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-virtual {v0, v1, p1, v2}, Lkorex/activation/CommandMap;->getCommand(Ljava/lang/String;Ljava/lang/String;Lkorex/activation/DataSource;)Lkorex/activation/CommandInfo;

    move-result-object v0

    .line 513
    :goto_12
    return-object v0

    :cond_13
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lkorex/activation/CommandMap;->getCommand(Ljava/lang/String;Ljava/lang/String;)Lkorex/activation/CommandInfo;

    move-result-object v0

    goto :goto_12
.end method

.method public getContent()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 534
    iget-object v0, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    if-eqz v0, :cond_7

    .line 535
    iget-object v0, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    .line 537
    :goto_6
    return-object v0

    :cond_7
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getDataContentHandler()Lkorex/activation/DataContentHandler;

    move-result-object v0

    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getDataSource()Lkorex/activation/DataSource;

    move-result-object v1

    invoke-interface {v0, v1}, Lkorex/activation/DataContentHandler;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_6
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_b

    .line 205
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v0}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 207
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    goto :goto_a
.end method

.method public getDataSource()Lkorex/activation/DataSource;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-nez v0, :cond_12

    .line 174
    iget-object v0, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    if-nez v0, :cond_f

    .line 175
    new-instance v0, Lkorex/activation/DataHandlerDataSource;

    invoke-direct {v0, p0}, Lkorex/activation/DataHandlerDataSource;-><init>(Lkorex/activation/DataHandler;)V

    iput-object v0, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    .line 176
    :cond_f
    iget-object v0, p0, Lkorex/activation/DataHandler;->objDataSource:Lkorex/activation/DataSource;

    .line 178
    :goto_11
    return-object v0

    :cond_12
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    goto :goto_11
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    const/4 v2, 0x0

    .line 237
    .local v2, "ins":Ljava/io/InputStream;
    iget-object v5, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v5, :cond_c

    .line 238
    iget-object v5, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v5}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 280
    :goto_b
    return-object v2

    .line 240
    :cond_c
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getDataContentHandler()Lkorex/activation/DataContentHandler;

    move-result-object v0

    .line 242
    .local v0, "dch":Lkorex/activation/DataContentHandler;
    if-nez v0, :cond_2f

    .line 243
    new-instance v5, Lkorex/activation/UnsupportedDataTypeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "no DCH for MIME type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 244
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lkorex/activation/UnsupportedDataTypeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 246
    :cond_2f
    instance-of v5, v0, Lkorex/activation/ObjectDataContentHandler;

    if-eqz v5, :cond_59

    move-object v5, v0

    .line 247
    check-cast v5, Lkorex/activation/ObjectDataContentHandler;

    invoke-virtual {v5}, Lkorex/activation/ObjectDataContentHandler;->getDCH()Lkorex/activation/DataContentHandler;

    move-result-object v5

    if-nez v5, :cond_59

    .line 248
    new-instance v5, Lkorex/activation/UnsupportedDataTypeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "no object DCH for MIME type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 249
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lkorex/activation/UnsupportedDataTypeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 252
    :cond_59
    move-object v1, v0

    .line 260
    .local v1, "fdch":Lkorex/activation/DataContentHandler;
    new-instance v4, Ljava/io/PipedOutputStream;

    invoke-direct {v4}, Ljava/io/PipedOutputStream;-><init>()V

    .line 261
    .local v4, "pos":Ljava/io/PipedOutputStream;
    new-instance v3, Ljava/io/PipedInputStream;

    invoke-direct {v3, v4}, Ljava/io/PipedInputStream;-><init>(Ljava/io/PipedOutputStream;)V

    .line 262
    .local v3, "pin":Ljava/io/PipedInputStream;
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lkorex/activation/DataHandler$1;

    invoke-direct {v6, p0, v1, v4}, Lkorex/activation/DataHandler$1;-><init>(Lkorex/activation/DataHandler;Lkorex/activation/DataContentHandler;Ljava/io/PipedOutputStream;)V

    const-string v7, "DataHandler.getInputStream"

    invoke-direct {v5, v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 276
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 277
    move-object v2, v3

    goto :goto_b
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_b

    .line 191
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v0}, Lkorex/activation/DataSource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 193
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 334
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_b

    .line 335
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v0}, Lkorex/activation/DataSource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 337
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getPreferredCommands()[Lkorex/activation/CommandInfo;
    .registers 4

    .prologue
    .line 470
    iget-object v0, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v0, :cond_13

    .line 471
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-virtual {v0, v1, v2}, Lkorex/activation/CommandMap;->getPreferredCommands(Ljava/lang/String;Lkorex/activation/DataSource;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    .line 474
    :goto_12
    return-object v0

    :cond_13
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getCommandMap()Lkorex/activation/CommandMap;

    move-result-object v0

    invoke-direct {p0}, Lkorex/activation/DataHandler;->getBaseType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/activation/CommandMap;->getPreferredCommands(Ljava/lang/String;)[Lkorex/activation/CommandInfo;

    move-result-object v0

    goto :goto_12
.end method

.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;
    .registers 4
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getDataContentHandler()Lkorex/activation/DataContentHandler;

    move-result-object v0

    iget-object v1, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v0, p1, v1}, Lkorex/activation/DataContentHandler;->getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 3

    .prologue
    .line 365
    monitor-enter p0

    :try_start_1
    sget-object v0, Lkorex/activation/DataHandler;->factory:Lkorex/activation/DataContentHandlerFactory;

    iget-object v1, p0, Lkorex/activation/DataHandler;->oldFactory:Lkorex/activation/DataContentHandlerFactory;

    if-eq v0, v1, :cond_b

    .line 366
    sget-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 369
    :cond_b
    iget-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    sget-object v1, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    if-ne v0, v1, :cond_1b

    .line 370
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getDataContentHandler()Lkorex/activation/DataContentHandler;

    move-result-object v0

    invoke-interface {v0}, Lkorex/activation/DataContentHandler;->getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 371
    :cond_1b
    iget-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_1f

    monitor-exit p0

    return-object v0

    .line 365
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isDataFlavorSupported(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 5
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 387
    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;

    move-result-object v1

    .line 389
    .local v1, "lFlavors":[Lkore/awt/datatransfer/DataFlavor;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_15

    .line 390
    aget-object v2, v1, v0

    invoke-virtual {v2, p1}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 391
    const/4 v2, 0x1

    .line 393
    :goto_11
    return v2

    .line 389
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 393
    :cond_15
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public declared-synchronized setCommandMap(Lkorex/activation/CommandMap;)V
    .registers 3
    .param p1, "commandMap"    # Lkorex/activation/CommandMap;

    .prologue
    .line 447
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;

    if-ne p1, v0, :cond_7

    if-nez p1, :cond_10

    .line 449
    :cond_7
    sget-object v0, Lkorex/activation/DataHandler;->emptyFlavors:[Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 450
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/activation/DataHandler;->dataContentHandler:Lkorex/activation/DataContentHandler;

    .line 452
    iput-object p1, p0, Lkorex/activation/DataHandler;->currentCommandMap:Lkorex/activation/CommandMap;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 454
    :cond_10
    monitor-exit p0

    return-void

    .line 447
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    iget-object v4, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    if-eqz v4, :cond_25

    .line 301
    const/4 v3, 0x0

    .line 302
    .local v3, "is":Ljava/io/InputStream;
    const/16 v4, 0x2000

    new-array v1, v4, [B

    .line 305
    .local v1, "data":[B
    iget-object v4, p0, Lkorex/activation/DataHandler;->dataSource:Lkorex/activation/DataSource;

    invoke-interface {v4}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 308
    :goto_f
    :try_start_f
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, "bytes_read":I
    if-lez v0, :cond_20

    .line 309
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v0}, Ljava/io/OutputStream;->write([BII)V
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_1a

    goto :goto_f

    .line 312
    .end local v0    # "bytes_read":I
    :catchall_1a
    move-exception v4

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 313
    const/4 v3, 0x0

    throw v4

    .line 312
    .restart local v0    # "bytes_read":I
    :cond_20
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 313
    const/4 v3, 0x0

    .line 319
    .end local v0    # "bytes_read":I
    .end local v1    # "data":[B
    .end local v3    # "is":Ljava/io/InputStream;
    :goto_24
    return-void

    .line 316
    :cond_25
    invoke-direct {p0}, Lkorex/activation/DataHandler;->getDataContentHandler()Lkorex/activation/DataContentHandler;

    move-result-object v2

    .line 317
    .local v2, "dch":Lkorex/activation/DataContentHandler;
    iget-object v4, p0, Lkorex/activation/DataHandler;->object:Ljava/lang/Object;

    iget-object v5, p0, Lkorex/activation/DataHandler;->objectMimeType:Ljava/lang/String;

    invoke-interface {v2, v4, v5, p1}, Lkorex/activation/DataContentHandler;->writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V

    goto :goto_24
.end method
