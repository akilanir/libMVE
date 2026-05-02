.class Lorg/androidannotations/api/ViewServer$ViewServerWorker;
.super Ljava/lang/Object;
.source "ViewServer.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lorg/androidannotations/api/ViewServer$WindowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/androidannotations/api/ViewServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewServerWorker"
.end annotation


# instance fields
.field private mClient:Ljava/net/Socket;

.field private final mLock:[Ljava/lang/Object;

.field private mNeedFocusedWindowUpdate:Z

.field private mNeedWindowListUpdate:Z

.field final synthetic this$0:Lorg/androidannotations/api/ViewServer;


# direct methods
.method public constructor <init>(Lorg/androidannotations/api/ViewServer;Ljava/net/Socket;)V
    .registers 5
    .param p2, "client"    # Ljava/net/Socket;

    .prologue
    const/4 v1, 0x0

    .line 576
    iput-object p1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 574
    new-array v0, v1, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    .line 577
    iput-object p2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    .line 578
    iput-boolean v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 579
    iput-boolean v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 580
    return-void
.end method

.method private findWindow(I)Landroid/view/View;
    .registers 6
    .param p1, "hashCode"    # I

    .prologue
    .line 694
    const/4 v2, -0x1

    if-ne p1, v2, :cond_34

    .line 695
    const/4 v1, 0x0

    .line 696
    .local v1, "window":Landroid/view/View;
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 698
    :try_start_11
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;
    :try_end_16
    .catchall {:try_start_11 .. :try_end_16} :catchall_25

    move-result-object v1

    .line 700
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 716
    .end local v1    # "window":Landroid/view/View;
    :goto_24
    return-object v1

    .line 700
    .restart local v1    # "window":Landroid/view/View;
    :catchall_25
    move-exception v2

    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v2

    .line 705
    .end local v1    # "window":Landroid/view/View;
    :cond_34
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 707
    :try_start_41
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/Map;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 708
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    if-ne v3, p1, :cond_4f

    .line 709
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;
    :try_end_6b
    .catchall {:try_start_41 .. :try_end_6b} :catchall_89

    .line 713
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    move-object v1, v2

    goto :goto_24

    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    :cond_7a
    iget-object v2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v2}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 716
    const/4 v1, 0x0

    goto :goto_24

    .line 713
    :catchall_89
    move-exception v2

    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v2
.end method

.method private getFocusedWindow(Ljava/net/Socket;)Z
    .registers 12
    .param p1, "client"    # Ljava/net/Socket;

    .prologue
    .line 756
    const/4 v7, 0x1

    .line 757
    .local v7, "result":Z
    const/4 v3, 0x0

    .line 759
    .local v3, "focusName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 761
    .local v5, "out":Ljava/io/BufferedWriter;
    :try_start_3
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 762
    .local v1, "clientStream":Ljava/io/OutputStream;
    new-instance v6, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    invoke-direct {v8, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    const/16 v9, 0x2000

    invoke-direct {v6, v8, v9}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_13} :catch_c1
    .catchall {:try_start_3 .. :try_end_13} :catchall_bf

    .line 764
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .local v6, "out":Ljava/io/BufferedWriter;
    const/4 v4, 0x0

    .line 766
    .local v4, "focusedWindow":Landroid/view/View;
    :try_start_14
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_21} :catch_95
    .catchall {:try_start_14 .. :try_end_21} :catchall_b0

    .line 768
    :try_start_21
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;
    :try_end_26
    .catchall {:try_start_21 .. :try_end_26} :catchall_86

    move-result-object v4

    .line 770
    :try_start_27
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 773
    if-eqz v4, :cond_77

    .line 774
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_43} :catch_95
    .catchall {:try_start_27 .. :try_end_43} :catchall_b0

    .line 776
    :try_start_43
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/Map;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/Map;

    move-result-object v8

    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_57
    .catchall {:try_start_43 .. :try_end_57} :catchall_a1

    .line 778
    :try_start_57
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 781
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 782
    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(I)V

    .line 783
    invoke-virtual {v6, v3}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 785
    :cond_77
    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(I)V

    .line 786
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->flush()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_7f} :catch_95
    .catchall {:try_start_57 .. :try_end_7f} :catchall_b0

    .line 790
    if-eqz v6, :cond_c3

    .line 792
    :try_start_81
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_b8

    move-object v5, v6

    .line 799
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :cond_85
    :goto_85
    return v7

    .line 770
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catchall_86
    move-exception v8

    :try_start_87
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v8
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_87 .. :try_end_95} :catch_95
    .catchall {:try_start_87 .. :try_end_95} :catchall_b0

    .line 787
    :catch_95
    move-exception v2

    move-object v5, v6

    .line 788
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .local v2, "e":Ljava/lang/Exception;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :goto_97
    const/4 v7, 0x0

    .line 790
    if-eqz v5, :cond_85

    .line 792
    :try_start_9a
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_9d} :catch_9e

    goto :goto_85

    .line 793
    :catch_9e
    move-exception v2

    .line 794
    .local v2, "e":Ljava/io/IOException;
    const/4 v7, 0x0

    .line 795
    goto :goto_85

    .line 778
    .end local v2    # "e":Ljava/io/IOException;
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catchall_a1
    move-exception v8

    :try_start_a2
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v8
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_b0} :catch_95
    .catchall {:try_start_a2 .. :try_end_b0} :catchall_b0

    .line 790
    :catchall_b0
    move-exception v8

    move-object v5, v6

    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :goto_b2
    if-eqz v5, :cond_b7

    .line 792
    :try_start_b4
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_b7
    .catch Ljava/io/IOException; {:try_start_b4 .. :try_end_b7} :catch_bc

    .line 795
    :cond_b7
    :goto_b7
    throw v8

    .line 793
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catch_b8
    move-exception v2

    .line 794
    .restart local v2    # "e":Ljava/io/IOException;
    const/4 v7, 0x0

    move-object v5, v6

    .line 795
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    goto :goto_85

    .line 793
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "focusedWindow":Landroid/view/View;
    :catch_bc
    move-exception v2

    .line 794
    .restart local v2    # "e":Ljava/io/IOException;
    const/4 v7, 0x0

    goto :goto_b7

    .line 790
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_bf
    move-exception v8

    goto :goto_b2

    .line 787
    :catch_c1
    move-exception v2

    goto :goto_97

    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :cond_c3
    move-object v5, v6

    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    goto :goto_85
.end method

.method private listWindows(Ljava/net/Socket;)Z
    .registers 10
    .param p1, "client"    # Ljava/net/Socket;

    .prologue
    .line 720
    const/4 v5, 0x1

    .line 721
    .local v5, "result":Z
    const/4 v3, 0x0

    .line 724
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_2
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v6}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 726
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 727
    .local v0, "clientStream":Ljava/io/OutputStream;
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v6, Ljava/io/OutputStreamWriter;

    invoke-direct {v6, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    const/16 v7, 0x2000

    invoke-direct {v4, v6, v7}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1f} :catch_af
    .catchall {:try_start_2 .. :try_end_1f} :catchall_95

    .line 729
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .local v4, "out":Ljava/io/BufferedWriter;
    :try_start_1f
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/Map;
    invoke-static {v6}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_72

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 730
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 731
    const/16 v6, 0x20

    invoke-virtual {v4, v6}, Ljava/io/BufferedWriter;->write(I)V

    .line 732
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/CharSequence;

    invoke-virtual {v4, v6}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 733
    const/16 v6, 0xa

    invoke-virtual {v4, v6}, Ljava/io/BufferedWriter;->write(I)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_5b} :catch_5c
    .catchall {:try_start_1f .. :try_end_5b} :catchall_ac

    goto :goto_2d

    .line 738
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    :catch_5c
    move-exception v1

    move-object v3, v4

    .line 739
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :goto_5e
    const/4 v5, 0x0

    .line 741
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v6}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 743
    if-eqz v3, :cond_71

    .line 745
    :try_start_6e
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_92

    .line 752
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_71
    :goto_71
    return v5

    .line 736
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_72
    :try_start_72
    const-string v6, "DONE.\n"

    invoke-virtual {v4, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 737
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_7a} :catch_5c
    .catchall {:try_start_72 .. :try_end_7a} :catchall_ac

    .line 741
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v6}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 743
    if-eqz v4, :cond_b1

    .line 745
    :try_start_89
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_8c} :catch_8e

    move-object v3, v4

    .line 748
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_71

    .line 746
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :catch_8e
    move-exception v1

    .line 747
    .local v1, "e":Ljava/io/IOException;
    const/4 v5, 0x0

    move-object v3, v4

    .line 748
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_71

    .line 746
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .local v1, "e":Ljava/lang/Exception;
    :catch_92
    move-exception v1

    .line 747
    .local v1, "e":Ljava/io/IOException;
    const/4 v5, 0x0

    .line 748
    goto :goto_71

    .line 741
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_95
    move-exception v6

    :goto_96
    iget-object v7, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v7}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 743
    if-eqz v3, :cond_a8

    .line 745
    :try_start_a5
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_a8} :catch_a9

    .line 748
    :cond_a8
    :goto_a8
    throw v6

    .line 746
    :catch_a9
    move-exception v1

    .line 747
    .restart local v1    # "e":Ljava/io/IOException;
    const/4 v5, 0x0

    goto :goto_a8

    .line 741
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :catchall_ac
    move-exception v6

    move-object v3, v4

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_96

    .line 738
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    :catch_af
    move-exception v1

    goto :goto_5e

    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_b1
    move-object v3, v4

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_71
.end method

.method private windowCommand(Ljava/net/Socket;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 19
    .param p1, "client"    # Ljava/net/Socket;
    .param p2, "command"    # Ljava/lang/String;
    .param p3, "parameters"    # Ljava/lang/String;

    .prologue
    .line 642
    const/4 v8, 0x1

    .line 643
    .local v8, "success":Z
    const/4 v6, 0x0

    .line 647
    .local v6, "out":Ljava/io/BufferedWriter;
    const/16 v10, 0x20

    :try_start_4
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 648
    .local v5, "index":I
    const/4 v10, -0x1

    if-ne v5, v10, :cond_11

    .line 649
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v5

    .line 651
    :cond_11
    const/4 v10, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 652
    .local v1, "code":Ljava/lang/String;
    const/16 v10, 0x10

    invoke-static {v1, v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v10

    long-to-int v4, v10

    .line 655
    .local v4, "hashCode":I
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v5, v10, :cond_3a

    .line 656
    add-int/lit8 v10, v5, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 661
    :goto_2d
    invoke-direct {p0, v4}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->findWindow(I)Landroid/view/View;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_30} :catch_a6
    .catchall {:try_start_4 .. :try_end_30} :catchall_d7

    move-result-object v9

    .line 662
    .local v9, "window":Landroid/view/View;
    if-nez v9, :cond_40

    .line 663
    const/4 v10, 0x0

    .line 681
    if-eqz v6, :cond_39

    .line 683
    :try_start_36
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_3d

    .line 690
    .end local v1    # "code":Ljava/lang/String;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :cond_39
    :goto_39
    return v10

    .line 658
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    :cond_3a
    :try_start_3a
    const-string p3, ""

    goto :goto_2d

    .line 684
    .restart local v9    # "window":Landroid/view/View;
    :catch_3d
    move-exception v3

    .line 685
    .local v3, "e":Ljava/io/IOException;
    const/4 v8, 0x0

    goto :goto_39

    .line 667
    .end local v3    # "e":Ljava/io/IOException;
    :cond_40
    const-class v10, Landroid/view/ViewDebug;

    const-string v11, "dispatchCommand"

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Landroid/view/View;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-class v14, Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-class v14, Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x3

    const-class v14, Ljava/io/OutputStream;

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 668
    .local v2, "dispatch":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 669
    const/4 v10, 0x0

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v9, v11, v12

    const/4 v12, 0x1

    aput-object p2, v11, v12

    const/4 v12, 0x2

    aput-object p3, v11, v12

    const/4 v12, 0x3

    new-instance v13, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;-><init>(Ljava/io/OutputStream;)V

    aput-object v13, v11, v12

    invoke-virtual {v2, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v10

    if-nez v10, :cond_9c

    .line 672
    new-instance v7, Ljava/io/BufferedWriter;

    new-instance v10, Ljava/io/OutputStreamWriter;

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v7, v10}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_93} :catch_a6
    .catchall {:try_start_3a .. :try_end_93} :catchall_d7

    .line 673
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .local v7, "out":Ljava/io/BufferedWriter;
    :try_start_93
    const-string v10, "DONE\n"

    invoke-virtual {v7, v10}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 674
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->flush()V
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_9b} :catch_e4
    .catchall {:try_start_93 .. :try_end_9b} :catchall_e1

    move-object v6, v7

    .line 681
    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :cond_9c
    if-eqz v6, :cond_a1

    .line 683
    :try_start_9e
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a1} :catch_a3

    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "dispatch":Ljava/lang/reflect/Method;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :cond_a1
    :goto_a1
    move v10, v8

    .line 690
    goto :goto_39

    .line 684
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v2    # "dispatch":Ljava/lang/reflect/Method;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    .restart local v9    # "window":Landroid/view/View;
    :catch_a3
    move-exception v3

    .line 685
    .restart local v3    # "e":Ljava/io/IOException;
    const/4 v8, 0x0

    .line 686
    goto :goto_a1

    .line 677
    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "dispatch":Ljava/lang/reflect/Method;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :catch_a6
    move-exception v3

    .line 678
    .local v3, "e":Ljava/lang/Exception;
    :goto_a7
    :try_start_a7
    const-string v10, "ViewServer"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Could not send command "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " with parameters "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_cd
    .catchall {:try_start_a7 .. :try_end_cd} :catchall_d7

    .line 679
    const/4 v8, 0x0

    .line 681
    if-eqz v6, :cond_a1

    .line 683
    :try_start_d0
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_d3
    .catch Ljava/io/IOException; {:try_start_d0 .. :try_end_d3} :catch_d4

    goto :goto_a1

    .line 684
    :catch_d4
    move-exception v3

    .line 685
    .local v3, "e":Ljava/io/IOException;
    const/4 v8, 0x0

    .line 686
    goto :goto_a1

    .line 681
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_d7
    move-exception v10

    :goto_d8
    if-eqz v6, :cond_dd

    .line 683
    :try_start_da
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_dd
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_dd} :catch_de

    .line 686
    :cond_dd
    :goto_dd
    throw v10

    .line 684
    :catch_de
    move-exception v3

    .line 685
    .restart local v3    # "e":Ljava/io/IOException;
    const/4 v8, 0x0

    goto :goto_dd

    .line 681
    .end local v3    # "e":Ljava/io/IOException;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v2    # "dispatch":Ljava/lang/reflect/Method;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v9    # "window":Landroid/view/View;
    :catchall_e1
    move-exception v10

    move-object v6, v7

    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    goto :goto_d8

    .line 677
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    :catch_e4
    move-exception v3

    move-object v6, v7

    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    goto :goto_a7
.end method

.method private windowManagerAutolistLoop()Z
    .registers 8

    .prologue
    .line 819
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->addWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$700(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    .line 820
    const/4 v3, 0x0

    .line 822
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_6
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_16} :catch_8e
    .catchall {:try_start_6 .. :try_end_16} :catchall_8c

    .line 823
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .local v4, "out":Ljava/io/BufferedWriter;
    :cond_16
    :goto_16
    :try_start_16
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-nez v5, :cond_7a

    .line 824
    const/4 v2, 0x0

    .line 825
    .local v2, "needWindowListUpdate":Z
    const/4 v1, 0x0

    .line 826
    .local v1, "needFocusedWindowUpdate":Z
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v6
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_21} :catch_32
    .catchall {:try_start_16 .. :try_end_21} :catchall_6d

    .line 827
    :goto_21
    :try_start_21
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    if-nez v5, :cond_47

    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    if-nez v5, :cond_47

    .line 828
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    goto :goto_21

    .line 838
    :catchall_2f
    move-exception v5

    monitor-exit v6
    :try_end_31
    .catchall {:try_start_21 .. :try_end_31} :catchall_2f

    :try_start_31
    throw v5
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_32} :catch_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_6d

    .line 848
    .end local v1    # "needFocusedWindowUpdate":Z
    .end local v2    # "needWindowListUpdate":Z
    :catch_32
    move-exception v0

    move-object v3, v4

    .line 849
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :goto_34
    :try_start_34
    const-string v5, "ViewServer"

    const-string v6, "Connection error: "

    invoke-static {v5, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_8c

    .line 851
    if-eqz v3, :cond_40

    .line 853
    :try_start_3d
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_88

    .line 858
    :cond_40
    :goto_40
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    .line 860
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_45
    const/4 v5, 0x1

    return v5

    .line 830
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "needFocusedWindowUpdate":Z
    .restart local v2    # "needWindowListUpdate":Z
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_47
    :try_start_47
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    if-eqz v5, :cond_4f

    .line 831
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 832
    const/4 v2, 0x1

    .line 834
    :cond_4f
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    if-eqz v5, :cond_57

    .line 835
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 836
    const/4 v1, 0x1

    .line 838
    :cond_57
    monitor-exit v6
    :try_end_58
    .catchall {:try_start_47 .. :try_end_58} :catchall_2f

    .line 839
    if-eqz v2, :cond_62

    .line 840
    :try_start_5a
    const-string v5, "LIST UPDATE\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 841
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V

    .line 843
    :cond_62
    if-eqz v1, :cond_16

    .line 844
    const-string v5, "FOCUS UPDATE\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 845
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_6c} :catch_32
    .catchall {:try_start_5a .. :try_end_6c} :catchall_6d

    goto :goto_16

    .line 851
    .end local v1    # "needFocusedWindowUpdate":Z
    .end local v2    # "needWindowListUpdate":Z
    :catchall_6d
    move-exception v5

    move-object v3, v4

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :goto_6f
    if-eqz v3, :cond_74

    .line 853
    :try_start_71
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_74} :catch_8a

    .line 858
    :cond_74
    :goto_74
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v6, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    throw v5

    .line 851
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_7a
    if-eqz v4, :cond_7f

    .line 853
    :try_start_7c
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_7f} :catch_86

    .line 858
    :cond_7f
    :goto_7f
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    move-object v3, v4

    .line 859
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_45

    .line 854
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :catch_86
    move-exception v5

    goto :goto_7f

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_88
    move-exception v5

    goto :goto_40

    .end local v0    # "e":Ljava/lang/Exception;
    :catch_8a
    move-exception v6

    goto :goto_74

    .line 851
    :catchall_8c
    move-exception v5

    goto :goto_6f

    .line 848
    :catch_8e
    move-exception v0

    goto :goto_34
.end method


# virtual methods
.method public focusChanged()V
    .registers 3

    .prologue
    .line 812
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 813
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 814
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 815
    monitor-exit v1

    .line 816
    return-void

    .line 815
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public run()V
    .registers 12

    .prologue
    .line 584
    const/4 v2, 0x0

    .line 586
    .local v2, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v9, 0x400

    invoke-direct {v3, v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_13} :catch_b7
    .catchall {:try_start_1 .. :try_end_13} :catchall_d8

    .line 588
    .end local v2    # "in":Ljava/io/BufferedReader;
    .local v3, "in":Ljava/io/BufferedReader;
    :try_start_13
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 593
    .local v6, "request":Ljava/lang/String;
    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 594
    .local v4, "index":I
    const/4 v8, -0x1

    if-ne v4, v8, :cond_5d

    .line 595
    move-object v0, v6

    .line 596
    .local v0, "command":Ljava/lang/String;
    const-string v5, ""

    .line 603
    .local v5, "parameters":Ljava/lang/String;
    :goto_23
    const-string v8, "PROTOCOL"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_69

    .line 604
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    const-string v9, "4"

    # invokes: Lorg/androidannotations/api/ViewServer;->writeValue(Ljava/net/Socket;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lorg/androidannotations/api/ViewServer;->access$200(Ljava/net/Socket;Ljava/lang/String;)Z

    move-result v7

    .line 617
    .local v7, "result":Z
    :goto_33
    if-nez v7, :cond_4d

    .line 618
    const-string v8, "ViewServer"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "An error occurred with the command: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_4d} :catch_f5
    .catchall {:try_start_13 .. :try_end_4d} :catchall_f2

    .line 623
    :cond_4d
    if-eqz v3, :cond_52

    .line 625
    :try_start_4f
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_52} :catch_ac

    .line 631
    :cond_52
    :goto_52
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v8, :cond_f8

    .line 633
    :try_start_56
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_5b} :catch_b1

    move-object v2, v3

    .line 639
    .end local v0    # "command":Ljava/lang/String;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "index":I
    .end local v5    # "parameters":Ljava/lang/String;
    .end local v6    # "request":Ljava/lang/String;
    .end local v7    # "result":Z
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :cond_5c
    :goto_5c
    return-void

    .line 598
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "index":I
    .restart local v6    # "request":Ljava/lang/String;
    :cond_5d
    const/4 v8, 0x0

    :try_start_5e
    invoke-virtual {v6, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 599
    .restart local v0    # "command":Ljava/lang/String;
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "parameters":Ljava/lang/String;
    goto :goto_23

    .line 605
    :cond_69
    const-string v8, "SERVER"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7a

    .line 606
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    const-string v9, "4"

    # invokes: Lorg/androidannotations/api/ViewServer;->writeValue(Ljava/net/Socket;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lorg/androidannotations/api/ViewServer;->access$200(Ljava/net/Socket;Ljava/lang/String;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 607
    .end local v7    # "result":Z
    :cond_7a
    const-string v8, "LIST"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 608
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->listWindows(Ljava/net/Socket;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 609
    .end local v7    # "result":Z
    :cond_89
    const-string v8, "GET_FOCUS"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_98

    .line 610
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->getFocusedWindow(Ljava/net/Socket;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 611
    .end local v7    # "result":Z
    :cond_98
    const-string v8, "AUTOLIST"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a5

    .line 612
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->windowManagerAutolistLoop()Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 614
    .end local v7    # "result":Z
    :cond_a5
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8, v0, v5}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->windowCommand(Ljava/net/Socket;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_aa} :catch_f5
    .catchall {:try_start_5e .. :try_end_aa} :catchall_f2

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 627
    :catch_ac
    move-exception v1

    .line 628
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_52

    .line 634
    .end local v1    # "e":Ljava/io/IOException;
    :catch_b1
    move-exception v1

    .line 635
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v3

    .line 636
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_5c

    .line 620
    .end local v0    # "command":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "index":I
    .end local v5    # "parameters":Ljava/lang/String;
    .end local v6    # "request":Ljava/lang/String;
    .end local v7    # "result":Z
    :catch_b7
    move-exception v1

    .line 621
    .restart local v1    # "e":Ljava/io/IOException;
    :goto_b8
    :try_start_b8
    const-string v8, "ViewServer"

    const-string v9, "Connection error: "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_bf
    .catchall {:try_start_b8 .. :try_end_bf} :catchall_d8

    .line 623
    if-eqz v2, :cond_c4

    .line 625
    :try_start_c1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_c4
    .catch Ljava/io/IOException; {:try_start_c1 .. :try_end_c4} :catch_d3

    .line 631
    :cond_c4
    :goto_c4
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v8, :cond_5c

    .line 633
    :try_start_c8
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_cd
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cd} :catch_ce

    goto :goto_5c

    .line 634
    :catch_ce
    move-exception v1

    .line 635
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5c

    .line 627
    :catch_d3
    move-exception v1

    .line 628
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c4

    .line 623
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_d8
    move-exception v8

    :goto_d9
    if-eqz v2, :cond_de

    .line 625
    :try_start_db
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_de} :catch_e8

    .line 631
    :cond_de
    :goto_de
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v9, :cond_e7

    .line 633
    :try_start_e2
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->close()V
    :try_end_e7
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_e7} :catch_ed

    .line 636
    :cond_e7
    :goto_e7
    throw v8

    .line 627
    :catch_e8
    move-exception v1

    .line 628
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_de

    .line 634
    .end local v1    # "e":Ljava/io/IOException;
    :catch_ed
    move-exception v1

    .line 635
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e7

    .line 623
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catchall_f2
    move-exception v8

    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_d9

    .line 620
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catch_f5
    move-exception v1

    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_b8

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "command":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "index":I
    .restart local v5    # "parameters":Ljava/lang/String;
    .restart local v6    # "request":Ljava/lang/String;
    .restart local v7    # "result":Z
    :cond_f8
    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_5c
.end method

.method public windowsChanged()V
    .registers 3

    .prologue
    .line 804
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 805
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 806
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 807
    monitor-exit v1

    .line 808
    return-void

    .line 807
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v0
.end method
