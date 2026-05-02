.class public Lorg/androidannotations/api/ViewServer;
.super Ljava/lang/Object;
.source "ViewServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/androidannotations/api/ViewServer$1;,
        Lorg/androidannotations/api/ViewServer$ViewServerWorker;,
        Lorg/androidannotations/api/ViewServer$NoopViewServer;,
        Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;,
        Lorg/androidannotations/api/ViewServer$WindowListener;
    }
.end annotation


# static fields
.field private static final BUILD_TYPE_USER:Ljava/lang/String; = "user"

.field private static final COMMAND_PROTOCOL_VERSION:Ljava/lang/String; = "PROTOCOL"

.field private static final COMMAND_SERVER_VERSION:Ljava/lang/String; = "SERVER"

.field private static final COMMAND_WINDOW_MANAGER_AUTOLIST:Ljava/lang/String; = "AUTOLIST"

.field private static final COMMAND_WINDOW_MANAGER_GET_FOCUS:Ljava/lang/String; = "GET_FOCUS"

.field private static final COMMAND_WINDOW_MANAGER_LIST:Ljava/lang/String; = "LIST"

.field private static final LOG_TAG:Ljava/lang/String; = "ViewServer"

.field private static final VALUE_PROTOCOL_VERSION:Ljava/lang/String; = "4"

.field private static final VALUE_SERVER_VERSION:Ljava/lang/String; = "4"

.field private static final VIEW_SERVER_DEFAULT_PORT:I = 0x134b

.field private static final VIEW_SERVER_MAX_CONNECTIONS:I = 0xa

.field private static sServer:Lorg/androidannotations/api/ViewServer;


# instance fields
.field private final mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mFocusedWindow:Landroid/view/View;

.field private final mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/androidannotations/api/ViewServer$WindowListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mPort:I

.field private mServer:Ljava/net/ServerSocket;

.field private mThread:Ljava/lang/Thread;

.field private mThreadPool:Ljava/util/concurrent/ExecutorService;

.field private final mWindows:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    .line 142
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    .line 143
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 146
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 187
    const/4 v0, -0x1

    iput v0, p0, Lorg/androidannotations/api/ViewServer;->mPort:I

    .line 188
    return-void
.end method

.method private constructor <init>(I)V
    .registers 3
    .param p1, "port"    # I

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    .line 142
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    .line 143
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 146
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 200
    iput p1, p0, Lorg/androidannotations/api/ViewServer;->mPort:I

    .line 201
    return-void
.end method

.method synthetic constructor <init>(Lorg/androidannotations/api/ViewServer$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/androidannotations/api/ViewServer$1;

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer;-><init>()V

    return-void
.end method

.method static synthetic access$200(Ljava/net/Socket;Ljava/lang/String;)Z
    .registers 3
    .param p0, "x0"    # Ljava/net/Socket;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-static {p0, p1}, Lorg/androidannotations/api/ViewServer;->writeValue(Ljava/net/Socket;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    return-object v0
.end method

.method static synthetic access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    return-object v0
.end method

.method static synthetic access$700(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;
    .param p1, "x1"    # Lorg/androidannotations/api/ViewServer$WindowListener;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/androidannotations/api/ViewServer;->addWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V

    return-void
.end method

.method static synthetic access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/ViewServer;
    .param p1, "x1"    # Lorg/androidannotations/api/ViewServer$WindowListener;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V

    return-void
.end method

.method private addWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/androidannotations/api/ViewServer$WindowListener;

    .prologue
    .line 453
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 454
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 456
    :cond_d
    return-void
.end method

.method private fireFocusChangedEvent()V
    .registers 4

    .prologue
    .line 447
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/androidannotations/api/ViewServer$WindowListener;

    .line 448
    .local v1, "listener":Lorg/androidannotations/api/ViewServer$WindowListener;
    invoke-interface {v1}, Lorg/androidannotations/api/ViewServer$WindowListener;->focusChanged()V

    goto :goto_6

    .line 450
    .end local v1    # "listener":Lorg/androidannotations/api/ViewServer$WindowListener;
    :cond_16
    return-void
.end method

.method private fireWindowsChangedEvent()V
    .registers 4

    .prologue
    .line 441
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/androidannotations/api/ViewServer$WindowListener;

    .line 442
    .local v1, "listener":Lorg/androidannotations/api/ViewServer$WindowListener;
    invoke-interface {v1}, Lorg/androidannotations/api/ViewServer$WindowListener;->windowsChanged()V

    goto :goto_6

    .line 444
    .end local v1    # "listener":Lorg/androidannotations/api/ViewServer$WindowListener;
    :cond_16
    return-void
.end method

.method public static get(Landroid/content/Context;)Lorg/androidannotations/api/ViewServer;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 166
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 167
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    const-string v2, "user"

    sget-object v3, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    iget v2, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_3a

    .line 168
    sget-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    if-nez v2, :cond_21

    .line 169
    new-instance v2, Lorg/androidannotations/api/ViewServer;

    const/16 v3, 0x134b

    invoke-direct {v2, v3}, Lorg/androidannotations/api/ViewServer;-><init>(I)V

    sput-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    .line 172
    :cond_21
    sget-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    invoke-virtual {v2}, Lorg/androidannotations/api/ViewServer;->isRunning()Z

    move-result v2

    if-nez v2, :cond_2e

    .line 174
    :try_start_29
    sget-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    invoke-virtual {v2}, Lorg/androidannotations/api/ViewServer;->start()Z
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2e} :catch_31

    .line 183
    :cond_2e
    :goto_2e
    sget-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    return-object v2

    .line 175
    :catch_31
    move-exception v0

    .line 176
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "ViewServer"

    const-string v3, "Error:"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e

    .line 180
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3a
    new-instance v2, Lorg/androidannotations/api/ViewServer$NoopViewServer;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/androidannotations/api/ViewServer$NoopViewServer;-><init>(Lorg/androidannotations/api/ViewServer$1;)V

    sput-object v2, Lorg/androidannotations/api/ViewServer;->sServer:Lorg/androidannotations/api/ViewServer;

    goto :goto_2e
.end method

.method private removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/androidannotations/api/ViewServer$WindowListener;

    .prologue
    .line 459
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 460
    return-void
.end method

.method private static writeValue(Ljava/net/Socket;Ljava/lang/String;)Z
    .registers 9
    .param p0, "client"    # Ljava/net/Socket;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 418
    const/4 v2, 0x0

    .line 420
    .local v2, "out":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 421
    .local v0, "clientStream":Ljava/io/OutputStream;
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    invoke-direct {v5, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    const/16 v6, 0x2000

    invoke-direct {v3, v5, v6}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_28
    .catchall {:try_start_1 .. :try_end_11} :catchall_33

    .line 422
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_11
    invoke-virtual {v3, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 423
    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 424
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1c} :catch_3f
    .catchall {:try_start_11 .. :try_end_1c} :catchall_3c

    .line 425
    const/4 v4, 0x1

    .line 429
    .local v4, "result":Z
    if-eqz v3, :cond_42

    .line 431
    :try_start_1f
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_22} :catch_24

    move-object v2, v3

    .line 437
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    :cond_23
    :goto_23
    return v4

    .line 432
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_24
    move-exception v1

    .line 433
    .local v1, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    move-object v2, v3

    .line 434
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_23

    .line 426
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "result":Z
    :catch_28
    move-exception v1

    .line 427
    .local v1, "e":Ljava/lang/Exception;
    :goto_29
    const/4 v4, 0x0

    .line 429
    .restart local v4    # "result":Z
    if-eqz v2, :cond_23

    .line 431
    :try_start_2c
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_30

    goto :goto_23

    .line 432
    :catch_30
    move-exception v1

    .line 433
    .local v1, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    .line 434
    goto :goto_23

    .line 429
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "result":Z
    :catchall_33
    move-exception v5

    :goto_34
    if-eqz v2, :cond_39

    .line 431
    :try_start_36
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_3a

    .line 434
    :cond_39
    :goto_39
    throw v5

    .line 432
    :catch_3a
    move-exception v1

    .line 433
    .restart local v1    # "e":Ljava/io/IOException;
    goto :goto_39

    .line 429
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catchall_3c
    move-exception v5

    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_34

    .line 426
    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_3f
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_29

    .end local v2    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "result":Z
    :cond_42
    move-object v2, v3

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v2    # "out":Ljava/io/BufferedWriter;
    goto :goto_23
.end method


# virtual methods
.method public addWindow(Landroid/app/Activity;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 300
    invoke-virtual {p1}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 302
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    :goto_31
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/androidannotations/api/ViewServer;->addWindow(Landroid/view/View;Ljava/lang/String;)V

    .line 307
    return-void

    .line 304
    :cond_3d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_31
.end method

.method public addWindow(Landroid/view/View;Ljava/lang/String;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 331
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 333
    :try_start_9
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_1f

    .line 335
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 337
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer;->fireWindowsChangedEvent()V

    .line 338
    return-void

    .line 335
    :catchall_1f
    move-exception v0

    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public removeWindow(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 319
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/ViewServer;->removeWindow(Landroid/view/View;)V

    .line 320
    return-void
.end method

.method public removeWindow(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 349
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 351
    :try_start_9
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_1f

    .line 353
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 355
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer;->fireWindowsChangedEvent()V

    .line 356
    return-void

    .line 353
    :catchall_1f
    move-exception v0

    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method public run()V
    .registers 7

    .prologue
    .line 392
    :try_start_0
    new-instance v2, Ljava/net/ServerSocket;

    iget v3, p0, Lorg/androidannotations/api/ViewServer;->mPort:I

    const/16 v4, 0xa

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v2, p0, Lorg/androidannotations/api/ViewServer;->mServer:Ljava/net/ServerSocket;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_39

    .line 397
    :goto_f
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mServer:Ljava/net/ServerSocket;

    if-eqz v2, :cond_4b

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iget-object v3, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    if-ne v2, v3, :cond_4b

    .line 400
    :try_start_1b
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mServer:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 401
    .local v0, "client":Ljava/net/Socket;
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    if-eqz v2, :cond_42

    .line 402
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lorg/androidannotations/api/ViewServer$ViewServerWorker;

    invoke-direct {v3, p0, v0}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;-><init>(Lorg/androidannotations/api/ViewServer;Ljava/net/Socket;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2f} :catch_30

    goto :goto_f

    .line 410
    .end local v0    # "client":Ljava/net/Socket;
    :catch_30
    move-exception v1

    .line 411
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "ViewServer"

    const-string v3, "Connection error: "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f

    .line 393
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_39
    move-exception v1

    .line 394
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v2, "ViewServer"

    const-string v3, "Starting ServerSocket error: "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f

    .line 405
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "client":Ljava/net/Socket;
    :cond_42
    :try_start_42
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_46
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_30

    goto :goto_f

    .line 406
    :catch_46
    move-exception v1

    .line 407
    .local v1, "e":Ljava/io/IOException;
    :try_start_47
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_4a} :catch_30

    goto :goto_f

    .line 414
    .end local v0    # "client":Ljava/net/Socket;
    .end local v1    # "e":Ljava/io/IOException;
    :cond_4b
    return-void
.end method

.method public setFocusedWindow(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 366
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/ViewServer;->setFocusedWindow(Landroid/view/View;)V

    .line 367
    return-void
.end method

.method public setFocusedWindow(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 377
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 379
    if-nez p1, :cond_1b

    const/4 v0, 0x0

    :goto_c
    :try_start_c
    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_20

    .line 381
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 383
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer;->fireFocusChangedEvent()V

    .line 384
    return-void

    .line 379
    :cond_1b
    :try_start_1b
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_20

    move-result-object v0

    goto :goto_c

    .line 381
    :catchall_20
    move-exception v0

    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method public start()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_6

    .line 217
    const/4 v0, 0x0

    .line 224
    :goto_5
    return v0

    .line 220
    :cond_6
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Local View Server [port="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/androidannotations/api/ViewServer;->mPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    .line 221
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 222
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 224
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public stop()Z
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 238
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    if-eqz v1, :cond_32

    .line 239
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 240
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    if-eqz v1, :cond_13

    .line 242
    :try_start_e
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_13
    .catch Ljava/lang/SecurityException; {:try_start_e .. :try_end_13} :catch_21

    .line 248
    :cond_13
    :goto_13
    iput-object v3, p0, Lorg/androidannotations/api/ViewServer;->mThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 249
    iput-object v3, p0, Lorg/androidannotations/api/ViewServer;->mThread:Ljava/lang/Thread;

    .line 252
    :try_start_17
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mServer:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V

    .line 253
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/androidannotations/api/ViewServer;->mServer:Ljava/net/ServerSocket;
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1f} :catch_2a

    .line 254
    const/4 v1, 0x1

    .line 274
    :goto_20
    return v1

    .line 243
    :catch_21
    move-exception v0

    .line 244
    .local v0, "e":Ljava/lang/SecurityException;
    const-string v1, "ViewServer"

    const-string v2, "Could not stop all view server threads"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13

    .line 255
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_2a
    move-exception v0

    .line 256
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "ViewServer"

    const-string v2, "Could not close the view server"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    .end local v0    # "e":Ljava/io/IOException;
    :cond_32
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 262
    :try_start_3b
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V
    :try_end_40
    .catchall {:try_start_3b .. :try_end_40} :catchall_60

    .line 264
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 267
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 269
    const/4 v1, 0x0

    :try_start_53
    iput-object v1, p0, Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    :try_end_55
    .catchall {:try_start_53 .. :try_end_55} :catchall_6b

    .line 271
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 274
    const/4 v1, 0x0

    goto :goto_20

    .line 264
    :catchall_60
    move-exception v1

    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v1

    .line 271
    :catchall_6b
    move-exception v1

    iget-object v2, p0, Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v1
.end method
